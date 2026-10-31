;;; OWNER: reader conserva generazione originale e resta nella propria epoca per tutta la ricerca.
;;; SHARED: carichi word/u8 su SBCL x86-64/ARM64; guardia di generazione doppia, nessun retry.
(in-package #:arcdocdb.mvcc)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-MVC-005
(declaim (inline snapshot-del-registro-p))
(declaim (ftype (function (contesto-snapshot registro-snapshot) boolean) snapshot-del-registro-p))
(defun snapshot-del-registro-p (context registry)
  "Pre: objects constructed by their respective controllers. Post: registry identity, without mutex.
Does not verify state, generation, or expiration and does not authorize snapshot reading."
  (eq (contesto-snapshot-registry context) registry))

;;; REQ: REQ-MVC-007 REQ-AFF-004 REQ-CON-004
(declaim (ftype (function (registro-snapshot keyword) nil) guasto-lettura-snapshot))
(defun guasto-lettura-snapshot (registry reason)
  "Pre: internal inconsistency observed with stable identity. Post: terminal FAULTED state.
No mutex or waiting even on failure; typed condition propagated to the worker boundary."
  (invalida-registro-snapshot registry)
  (error 'invariant-violation :reason reason))

;;; REQ: REQ-MVC-004 REQ-MVC-005 REQ-MVC-007 REQ-CMP-007
(declaim (inline verifica-snapshot))
(declaim (ftype (function (contesto-snapshot u64 u64) u64) verifica-snapshot))
(defun verifica-snapshot (context expected-generation now)
  "Pre: original generation, fresh NOW and common monotonic base; epoch already acquired.
Post: CSN only if active and unexpired; call BEFORE and AFTER lookup, even on a miss.
Changed identity/end/expiration: SNAPSHOT-TOO-OLD. Waiting: INVALID-ARGUMENT or initial timeout."
  (let* ((registry (contesto-snapshot-registry context)) (word (contesto-snapshot-word context))
         (context-generation (sb-thread:barrier (:read) (aref word 0)))
         (slot (contesto-snapshot-slot context)))
    (declare (type u64 context-generation))
    (esigi-snapshot-sano registry)
    (unless (and (plusp expected-generation) (= context-generation expected-generation))
      (error 'snapshot-too-old :reason :snapshot-stale-identity))
    (unless (< slot (length (registro-snapshot-generations registry)))
      (guasto-lettura-snapshot registry :snapshot-slot-range))
    (unless (= expected-generation
               (sb-thread:barrier (:read) (aref (registro-snapshot-generations registry) slot)))
      (error 'snapshot-too-old :reason :snapshot-stale-identity))
    (let ((csn (aref (registro-snapshot-csns-array registry) slot))
          (context-csn (aref word 1)) (state (aref (registro-snapshot-states registry) slot))
          (deadline (aref (registro-snapshot-deadlines registry) slot))
          (wait-deadline (aref (registro-snapshot-wait-deadlines registry) slot)))
      (declare (type u64 csn context-csn deadline wait-deadline))
      (sb-thread:barrier (:read))
      (unless (and (= expected-generation (aref (registro-snapshot-generations registry) slot))
                   (= expected-generation (aref word 0)))
        (error 'snapshot-too-old :reason :snapshot-stale-identity))
      (esigi-snapshot-sano registry)
      (unless (= csn context-csn)
        (guasto-lettura-snapshot registry :snapshot-csn-identity))
      (cond ((= state +snapshot-active+)
             (when (>= now deadline) (error 'snapshot-too-old :reason :snapshot-age-expired))
             csn)
            ((= state +snapshot-waiting+)
             (when (>= now wait-deadline)
               (error 'resource-exhausted :reason :snapshot-wait-timeout))
             (error 'invalid-argument :reason :snapshot-not-ready))
            ((<= +snapshot-closed+ state +snapshot-age-expired+)
             (error 'snapshot-too-old :reason :snapshot-ended))
            (t (guasto-lettura-snapshot registry :snapshot-slot-state))))))

;;; REQ: REQ-MVC-004 REQ-MVC-005 REQ-AFF-008
(declaim (inline verifica-snapshot-in-buffer))
(declaim (ftype (function (contesto-snapshot u64 u64 csn-words integer) null)
                verifica-snapshot-in-buffer))
(defun verifica-snapshot-in-buffer (context expected-generation now result result-index)
  "Pre: worker-private RESULT word array, valid index; same contract as VERIFICA-SNAPSHOT.
Post: CSN written only after all guards; no boxed u64 integer returned.
INVALID-ARGUMENT for range before writing; expiration/identity leaves buffer intact."
  (unless (<= 0 result-index (1- (length result)))
    (error 'invalid-argument :reason :snapshot-result-range))
  (setf (aref result result-index) (verifica-snapshot context expected-generation now))
  nil)

;;; REQ: REQ-MVC-007 REQ-MVC-003
(declaim (inline soglia-snapshot deve-trattenere-p))
(declaim (ftype (function (registro-snapshot) u64) soglia-snapshot)
         (ftype (function (registro-snapshot u64) boolean) deve-trattenere-p))
(defun soglia-snapshot (registry)
  "Pre: healthy registry. Post: conservative acquire threshold; MAX-U64 if nobody lowers it.
A logical limit; alone it does not authorize reclaiming a segment referenced by EBR."
  (esigi-snapshot-sano registry)
  (let ((threshold (sb-thread:barrier (:read) (aref (registro-snapshot-words registry) 1))))
    (declare (type u64 threshold))
    (esigi-snapshot-sano registry)
    threshold))

;;; REQ: REQ-MVC-007 REQ-MVC-003
(defun deve-trattenere-p (registry new-csn)
  "Pre: NEW-CSN acquired from the CSN registry, before publishing the new version.
Post: T if the replaced version must be retained BEFORE updating the index; no mutex.
INVALID-ARGUMENT for zero. To prune, compare validity end <= threshold and honor EBR."
  (when (zerop new-csn) (error 'invalid-argument :reason :snapshot-commit-zero))
  (< (soglia-snapshot registry) new-csn))

;;; REQ: REQ-MVC-007 REQ-AFF-008
(declaim (ftype (function (registro-snapshot) (values (integer 0 65536) u64 u64 &optional))
                leggi-registro-snapshot))
(defun leggi-registro-snapshot (registry)
  "Pre: healthy registry. Post: coherent pins, threshold, and generation; SNAPSHOT-BUSY without waiting.
Observability only; neither registers snapshots nor determines an old context's state."
  (esigi-ingresso-snapshot registry)
  (let ((acquired nil))
    (multiple-value-prog1
        (sb-thread:with-mutex ((registro-snapshot-mutex registry) :wait-p nil)
          (setf acquired t)
          (verifica-contatori-snapshot registry)
          (values (registro-snapshot-count registry) (aref (registro-snapshot-words registry) 1)
                  (aref (registro-snapshot-words registry) 0)))
      (unless acquired (error 'resource-exhausted :reason :snapshot-busy)))))
