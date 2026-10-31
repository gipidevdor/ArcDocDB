;;; OWNER: controller attiva/ritira contesti; timer visita al più un budget di slot per compito.
;;; SHARED: ordine mutex snapshot->CSN; nessun parcheggio, I/O o callback dentro la sezione.
(in-package #:arcdocdb.mvcc)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-MVC-004 REQ-MVC-005 REQ-MVC-007 REQ-CON-004
(declaim (ftype (function (contesto-snapshot u64 u64) boolean) attiva-snapshot))
(defun attiva-snapshot (context expected-generation now)
  "Pre: event with original generation and fresh NOW. Post: T only when H>=CSN and not expired.
NIL if still waiting; RESOURCE-EXHAUSTED for busy/timeout, SNAPSHOT-TOO-OLD after the end."
  (let ((registry (contesto-snapshot-registry context)) (acquired nil))
    (esigi-ingresso-snapshot registry)
    (multiple-value-prog1
        (sb-thread:with-mutex ((registro-snapshot-mutex registry) :wait-p nil)
          (setf acquired t)
          (verifica-contatori-snapshot registry)
          (let* ((slot (esigi-identita-snapshot context expected-generation))
                 (states (registro-snapshot-states registry)) (state (aref states slot)))
            (cond
              ((= state +snapshot-waiting+)
               (when (>= now (aref (registro-snapshot-wait-deadlines registry) slot))
                 (ritira-slot-snapshot registry slot +snapshot-wait-expired+)
                 (error 'resource-exhausted :reason :snapshot-wait-timeout))
               (when (orizzonte-snapshot-raggiunto-p registry
                                                  (aref (registro-snapshot-csns-array registry) slot))
                 (esigi-snapshot-sano registry)
                 (sb-thread:barrier (:write))
                 (setf (aref states slot) +snapshot-active+)
                 (esigi-snapshot-sano registry)
                 (return-from attiva-snapshot t))
               nil)
              ((= state +snapshot-active+)
               (when (>= now (aref (registro-snapshot-deadlines registry) slot))
                 (ritira-slot-snapshot registry slot +snapshot-age-expired+)
                 (error 'snapshot-too-old :reason :snapshot-age-expired))
               t)
              ((= state +snapshot-wait-expired+)
               (error 'resource-exhausted :reason :snapshot-wait-timeout))
              ((or (= state +snapshot-closed+) (= state +snapshot-age-expired+))
               (error 'snapshot-too-old :reason :snapshot-ended))
              (t (guasto-snapshot registry :snapshot-slot-state)))))
      (unless acquired (error 'resource-exhausted :reason :snapshot-busy)))))

;;; REQ: REQ-MVC-003 REQ-MVC-004 REQ-MVC-007 REQ-CMP-007 REQ-CON-004
(declaim (ftype (function (contesto-snapshot u64) null) termina-snapshot))
(defun termina-snapshot (context expected-generation)
  "Pre: original event; stop new reads, readers already admitted protected by EBR.
Post: pin removed; idempotent for the same identity already ended/expired.
SNAPSHOT-TOO-OLD on reuse; SNAPSHOT-BUSY retains the pin and termination obligation."
  (let ((registry (contesto-snapshot-registry context)) (acquired nil))
    (esigi-ingresso-snapshot registry)
    (multiple-value-prog1
        (sb-thread:with-mutex ((registro-snapshot-mutex registry) :wait-p nil)
          (setf acquired t)
          (verifica-contatori-snapshot registry)
          (let* ((slot (esigi-identita-snapshot context expected-generation))
                 (state (aref (registro-snapshot-states registry) slot)))
            (cond ((snapshot-pinned-p state) (ritira-slot-snapshot registry slot +snapshot-closed+))
                  ((<= +snapshot-closed+ state +snapshot-age-expired+) nil)
                  (t (guasto-snapshot registry :snapshot-slot-state)))))
      (unless acquired (error 'resource-exhausted :reason :snapshot-busy))))
  nil)

;;; REQ: REQ-MVC-004 REQ-MVC-003 REQ-AFF-008
(declaim (ftype (function (registro-snapshot csn-slot u64) boolean) scadi-slot-snapshot))
(defun scadi-slot-snapshot (registry slot now)
  "Pre: mutex owned and mutation protected by the caller. Post: expiration of exactly one slot.
Updates the count, not the threshold; T if a pin was removed. No physical reader freed."
  (let ((state (aref (registro-snapshot-states registry) slot)))
    (unless (<= state +snapshot-age-expired+)
      (guasto-snapshot registry :snapshot-slot-state))
    (let ((terminal-state
            (cond ((and (= state +snapshot-waiting+)
                        (>= now (aref (registro-snapshot-wait-deadlines registry) slot)))
                   +snapshot-wait-expired+)
                  ((and (= state +snapshot-active+)
                        (>= now (aref (registro-snapshot-deadlines registry) slot)))
                   +snapshot-age-expired+))))
      (when terminal-state
        (setf (aref (registro-snapshot-states registry) slot) terminal-state)
        (decf (registro-snapshot-count registry)))
      (not (null terminal-state)))))

;;; REQ: REQ-MVC-004 REQ-MVC-003 REQ-AFF-008 REQ-CON-004
(declaim (ftype (function (registro-snapshot u64 integer)
                         (values (integer 1 65536) (integer 0 65536) &optional)) scadi-snapshot))
(defun scadi-snapshot (registry now max-slots)
  "Pre: fresh NOW, budget 1..K. Post: visits, expired pins; circular cursor for fairness.
One K scan only to recompute the threshold; SNAPSHOT-BUSY without waiting, fail-stop on interruption."
  (esigi-ingresso-snapshot registry)
  (let ((acquired nil))
    (multiple-value-prog1
        (sb-thread:with-mutex ((registro-snapshot-mutex registry) :wait-p nil)
          (setf acquired t)
          (verifica-contatori-snapshot registry)
          (let ((capacity (length (registro-snapshot-states registry)))
                (cursor (registro-snapshot-sweep-cursor registry)) (expired 0) (complete nil))
            (unless (<= 1 max-slots capacity)
              (error 'invalid-argument :reason :snapshot-sweep-budget))
            (unwind-protect
                 (progn
                   (dotimes (step max-slots)
                     (when (scadi-slot-snapshot registry cursor now) (incf expired))
                     (setf cursor (if (= (1+ cursor) capacity) 0 (1+ cursor))))
                   (when (plusp expired)
                     (sb-thread:barrier (:memory))
                     (ricalcola-soglia-snapshot registry))
                   (setf (registro-snapshot-sweep-cursor registry) cursor complete t)
                   (values max-slots expired))
              (unless complete (invalida-registro-snapshot registry)))))
      (unless acquired (error 'resource-exhausted :reason :snapshot-busy)))))
