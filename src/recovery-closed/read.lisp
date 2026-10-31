;;; OWNER: compito I/O esclusivo; P autorevole dal CONTROL, nessuna ipotesi di EOF fisico.
;;; SHARED: capacità/manifest congelati; solo lo scratch privato viene scritto.
(in-package #:arcdocdb.recovery.closed)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-AFF-008
(declaim (ftype (function (index index index u32 index) null) verifica-budget-closed))
(defun verifica-budget-closed (chunk bytes batches batch-records batch-bytes)
  "Pre: typed reader configuration. Post: consistent chunk/header and batch limits before I/O.
INVALID-ARGUMENT for zero chunk/batch/count or insufficient budgets; no mutation.
Applies even when empty and for compaction, before reading origin from header."
  (unless (and (plusp chunk) (<= +segment-header-bytes+ bytes +segment-max-bytes+) (plusp batches) (plusp batch-records)
               (>= batch-bytes (+ +header-bytes+ +seal-bytes+)))
    (error 'invalid-argument :reason :closed-recovery-arguments))
  nil)

;;; REQ: REQ-REC-001 REQ-STO-006 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (control-recuperato file-io u64 octets index index index u32 index u32) index)
                verifica-lettura-closed))
(defun verifica-lettura-closed (control input id scratch chunk bytes batches batch-records batch-bytes outcomes)
  "Pre: authoritative CONTROL, stable capabilities, and exclusive scratch. Post: CLOSED P and preflight without I/O.
Checks aliases, ranges, all budgets, and backend before reading; does not replace P with EOF.
Typed argument/resource/capability errors; CORRUPTION-DETECTED for impossible frontier."
  (let* ((previous (arcdocdb.control::control-recuperato-input control))
         (view (arcdocdb.control::control-recuperato-view control)))
    (arcdocdb.io::esigi-aperto previous :input)
    (arcdocdb.io::esigi-aperto input :input)
    (when (eq scratch (arcdocdb.get::vista-get-serie-identity view))
      (error 'invalid-argument :reason :closed-recovery-alias))
    (verifica-budget-closed chunk bytes batches batch-records batch-bytes)
    (unless (eq (arcdocdb.io::file-backend previous) (arcdocdb.io::file-backend input))
      (error 'invalid-argument :reason :closed-recovery-backend))
    (multiple-value-bind (state prefix count) (trova-segmento (manifest-control-recuperato control) id)
      (unless (eq state :closed) (error 'invalid-argument :reason :closed-recovery-state))
      (unless (<= +segment-header-bytes+ prefix +segment-max-bytes+)
        (error 'corruption-detected :reason :closed-recovery-prefix))
      (when (> prefix bytes) (error 'resource-exhausted :reason :closed-recovery-byte-budget))
      (when (> count outcomes) (error 'resource-exhausted :reason :closed-recovery-closure-budget))
      (check-range scratch 0 prefix)
      (verifica-capienza-lettura input (max +segment-header-bytes+ (min (- prefix +segment-header-bytes+) chunk)))
      (the index prefix))))

;;; REQ: REQ-REC-001 REQ-FOR-001 REQ-FOR-002 REQ-AFF-002
(declaim (ftype (function (control-recuperato file-io u64 octets)
                         (values (member 1 2) (member 1 2) &optional)) leggi-header-closed))
(defun leggi-header-closed (control input id scratch)
  "Pre: completed preflight, I/O task. Post: header read once on the same read-only FD.
Verifies complete Serie/u64 ID, CRC, reserved fields, origin, and version before body.
Original conditions propagated, INVARIANT-VIOLATION for impossible internal return; no file write."
  (check-range scratch 0 +segment-header-bytes+)
  (let ((next (leggi-esatto input scratch 0 +segment-header-bytes+ 0)))
    (unless (= next +segment-header-bytes+)
      (error 'invariant-violation :reason :closed-recovery-header-read)))
  (multiple-value-bind (next version origin created-offset)
      (verifica-header-segmento scratch 0 +segment-header-bytes+
       (arcdocdb.get::vista-get-serie-identity (arcdocdb.control::control-recuperato-view control)) id)
    (unless (and (= next +segment-header-bytes+) (< created-offset next))
      (error 'invariant-violation :reason :closed-recovery-header))
    (values (the (member 1 2) version) (the (member 1 2) origin))))

;;; REQ: REQ-REC-001 REQ-STO-006 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (file-io index octets index) null) leggi-corpo-closed))
(defun leggi-corpo-closed (input prefix scratch chunk)
  "Pre: header already verified, authoritative P, I/O task, and exclusive scratch. Post: body read exactly through P.
No byte beyond P, header reread, or TAIL classification; loop CEILING((P-64)/chunk).
Original conditions propagated without retry, close, truncation, or partial result."
  (unless (and (plusp chunk) (>= prefix +segment-header-bytes+))
    (error 'invalid-argument :reason :closed-recovery-read-range))
  (check-range scratch 0 prefix)
  (loop repeat (ceiling (- prefix +segment-header-bytes+) chunk)
        for start from +segment-header-bytes+ by chunk for end = (min prefix (+ start chunk))
        do (let ((next (leggi-esatto input scratch start end start)))
             (unless (= next end)
               (error 'invariant-violation :reason :closed-recovery-read :offset start))))
  (arcdocdb.io::esigi-aperto input :input)
  nil)
