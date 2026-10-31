;;; OWNER: solo writer della Serie, gettone mantenuto per l'intera costruzione.
;;; SHARED: legge il sorgente; nessuno stato di altri indici o risorsa esterna.
(in-package #:arcdocdb.index.primary)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-005 REQ-IDX-007 REQ-AFF-008
(deftype digests-frammento () '(simple-array (unsigned-byte 32) (*)))

;;; REQ: REQ-IDX-005 REQ-AFF-004
(declaim (ftype (function (frammento-indice octets fixnum fixnum u32 contenuto-slot)
                         (values fixnum boolean &optional)) sonda-ricostruzione))
(defun sonda-ricostruzione (fragment key start end low work)
  "Pre: exclusive writer and verified source span. Post: checked lookup in the index domain.
A bank fault in any probe candidate also makes the index terminal, without changing the cause."
  (let ((index (frammento-indice-owner fragment)))
    (esigi-frammento-sano index fragment)
    (multiple-value-bind (slot found)
        (handler-case (sonda-writer fragment key start end low work)
          (invariant-violation (condition) (invalida-indice-primario index) (error condition)))
      (esigi-frammento-sano index fragment)
      (values slot found))))

;;; REQ: REQ-IDX-003 REQ-IDX-005 REQ-AFF-004
(declaim (ftype (function (frammento-indice fixnum contenuto-slot) boolean) campiona-ricostruzione))
(defun campiona-ricostruzione (fragment slot words)
  "Pre: exclusive writer, slot within C, private buffer. Post: T live, NIL free/deleted.
Control and payload must agree: transients impossible in the writer are terminal faults."
  (let* ((index (frammento-indice-owner fragment))
         (control (aref (frammento-indice-controls fragment) slot))
         (bank (frammento-indice-bank fragment)))
    (unless (controllo-valido-p control) (guasto-indice index :primary-control-corrupt))
    (case (handler-case (tenta-lettura-slot bank (base-slot bank slot) words)
            (invariant-violation (condition)
              (invalida-indice-primario index)
              (error condition)))
      (:live
       (unless (< control 128) (guasto-indice index :primary-rebuild-live-control))
       (when (> (+ (ldb (byte 32 0) (aref words 2)) (ldb (byte 16 32) (aref words 2)))
                (frammento-indice-used fragment))
         (guasto-indice index :primary-rebuild-key-range))
       t)
      (:empty
       (when (< control 128) (guasto-indice index :primary-rebuild-empty-control))
       nil)
      (otherwise (guasto-indice index :primary-rebuild-writer-state)))))

;;; REQ: REQ-IDX-001 REQ-IDX-005 REQ-AFF-008
(declaim (ftype (function (frammento-indice fixnum u32 u32 contenuto-slot contenuto-slot) null)
                verifica-digest-ricostruzione))
(defun verifica-digest-ricostruzione (source slot high low words work)
  "Pre: sampled live payload, trusted key digest at the original slot.
Post: prefix, fingerprint, and original lookup agree; INVALID-ARGUMENT otherwise.
Does not calculate the hash: high bits not distinguished by the source remain a caller contract."
  (let* ((index (frammento-indice-owner source)) (arena (frammento-indice-arena source))
         (offset (ldb (byte 32 0) (aref words 2))) (size (ldb (byte 16 32) (aref words 2))))
    (esigi-frammento-writer index source high)
    (unless (= (aref (frammento-indice-controls source) slot) (logand low 127))
      (error 'invalid-argument :reason :primary-rebuild-digest))
    (multiple-value-bind (found-slot found) (sonda-ricostruzione source arena offset (+ offset size) low work)
      (unless (and found (= found-slot slot))
        (error 'invalid-argument :reason :primary-rebuild-digest))))
  nil)

;;; REQ: REQ-IDX-005 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (frammento-indice digests-frammento digests-frammento boolean
                                          contenuto-slot contenuto-slot)
                         (values fixnum fixnum &optional)) misura-ricostruzione))
(defun misura-ricostruzione (source highs lows split words work)
  "Pre: writer, private digest arrays of C elements. Post: live bytes of both candidates.
Visits C slots; verifies live count and discoverability before allocating candidates.
Every digest check probes at most C slots; collisions do not have constant cost."
  (let ((first 0) (second 0) (live 0)
        (depth (+ (frammento-indice-depth source) (if split 1 0))))
    (dotimes (slot (banco-slot-capacity (frammento-indice-bank source)))
      (when (campiona-ricostruzione source slot words)
        (verifica-digest-ricostruzione source slot (aref highs slot) (aref lows slot) words work)
        (incf live)
        (let ((size (ldb (byte 16 32) (aref words 2))))
          (if (and split (oddp (prefix-hash (aref highs slot) depth)))
              (incf second size) (incf first size)))))
    (unless (= live (frammento-indice-live source))
      (guasto-indice (frammento-indice-owner source) :primary-rebuild-live-count))
    (values (max 1 first) (max 1 second))))
