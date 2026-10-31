;;; OWNER: writer esclusivo del candidato privato di recovery, ammissione ancora chiusa.
;;; SHARED: solo seqlock e controlli canonici della Serie; nessun nuovo lock o stato fra Serie.
(in-package #:arcdocdb.index.primary)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-IDX-001 REQ-IDX-003 REQ-AFF-008
(declaim (ftype (function (frammento-indice fixnum (or null contenuto-slot) contesto-indice) null)
                verifica-payload-ripristino))
(defun verifica-payload-ripristino (fragment key-bytes source context)
  "Pre: verified key and writer fragment. Post: free context and valid/distinct source if present.
NIL means expected absence, never removal; INVALID-ARGUMENT before touching scratch or index."
  (esigi-contesto-libero context)
  (when source
    (when (eq source (contesto-indice-words context))
      (error 'invalid-argument :reason :primary-source-alias))
    (esigi-contenuto-slot (frammento-indice-bank fragment) source)
    (unless (= key-bytes (ldb (byte 16 32) (aref source 2)))
      (error 'invalid-argument :reason :primary-source-key-length)))
  nil)

;;; REQ: REQ-REC-001 REQ-IDX-001 REQ-IDX-006 REQ-AFF-008
(declaim (ftype (function (indice-primario boolean (or null contenuto-slot) contenuto-slot)
                         (member nil :present :absent)) esito-voce-ripristinata))
(defun esito-voce-ripristinata (index found source current)
  "Pre: complete writer probe; CURRENT meaningful only if FOUND. Post: idempotent outcome or NIL for insertion.
An existing entry must have identical CSN/location/length/end/key-len; arena offset excluded.
INVALID-ARGUMENT for a different entry or presence where absence expected, without updates or removals."
  (esigi-indice-sano index)
  (if source
      (when found
        (unless (versione-corrisponde-p current source)
          (error 'invalid-argument :reason :primary-recovery-existing-key))
        :present)
      (progn
        (when found (error 'invalid-argument :reason :primary-recovery-expected-absent))
        :absent)))

;;; REQ: REQ-REC-001 REQ-IDX-001 REQ-IDX-003 REQ-IDX-005 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (indice-primario frammento-indice octets fixnum fixnum u32
                                         contenuto-slot contenuto-slot) null) inserisci-voce-ripristinata))
(defun inserisci-voce-ripristinata (index fragment key start end low source work)
  "Pre: first probe absent, exclusive writer, unchanged source. Post: verified canonical insertion.
Second probe/preflight uses normal budgets; unexpected presence or differing copy => index FAULTED.
Capacity rejections before mutation; interruptions after start delegated to canonical writer."
  (multiple-value-bind (slot found offset) (prepara-chiave-writer index fragment key start end low source work)
    (when found (guasto-indice index :primary-recovery-probe-changed))
    (applica-chiave-writer index fragment key start end low slot found offset work)
    (let ((state (tenta-lettura-slot (frammento-indice-bank fragment)
                                    (base-slot (frammento-indice-bank fragment) slot) work)))
      (unless (eq state :live) (guasto-indice index :primary-recovery-post-state)))
    (unless (versione-corrisponde-p work source) (guasto-indice index :primary-recovery-post-copy))
    (esigi-frammento-sano index fragment))
  nil)

;;; REQ: REQ-REC-001 REQ-IDX-001 REQ-IDX-003 REQ-IDX-005 REQ-IDX-006 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (indice-primario octets integer integer u32 u32
                                         (or null contenuto-slot) contesto-indice)
                         (member :inserted :present :absent)) ripristina-chiave-indice))
(defun ripristina-chiave-indice (index key start end high low source context)
  "Pre: private bootstrap candidate, exclusive writer; complete key and Serie digest.
SOURCE already committed, live and final, or NIL for final absence; no retention or admission here.
Post: INSERTED, identical PRESENT, or verified ABSENT, without overwriting/removing an existing entry.
Probes at most C slots per pass: two probes only for initial insertion, no retry or new array.
Invalid inputs/budgets before mutations; invariant failures => index FAULTED, original cause preserved.
Caller keeps key/source stable; operational updates use the normal writer protocol."
  (let* ((fragment (frammento-corrente-indice index high)) (work (contesto-indice-words context)))
    (esigi-chiave key start end)
    (verifica-payload-ripristino fragment (- end start) source context)
    (unwind-protect
         (handler-case
             (progn
               (setf (contesto-indice-busy context) t)
               (multiple-value-bind (slot found) (sonda-writer fragment key start end low work)
                 (when (and found (minusp slot)) (guasto-indice index :primary-recovery-probe-result))
                 (when (and source (minusp slot))
                   (error 'resource-exhausted :reason :primary-fragment-full))
                 (esigi-frammento-sano index fragment)
                 (let ((result (esito-voce-ripristinata index found source work)))
                   (when result (return-from ripristina-chiave-indice result)))
                 (unless source (guasto-indice index :primary-recovery-source-missing))
                 (inserisci-voce-ripristinata index fragment key start end low source work)
                 :inserted))
           (invariant-violation (condition) (invalida-indice-primario index) (error condition)))
      (setf (contesto-indice-busy context) nil))))
