;;; OWNER: risultato consegnato al controller; getter scalari non rileggono le fonti o il catalogo.
;;; SHARED: nessuna mutazione, attesa, cache o nuova identità di Archivio.
(in-package #:arcdocdb.recovery.archive.csn)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-AFF-008
(declaim (ftype (function (insieme-serie-recovery) index) numero-serie-recovery))
(defun numero-serie-recovery (set)
  "Pre: constructed complete set. Post: owned copy's cardinality, no vector exported.
TYPE-ERROR for invalid types; no additional catalog certification."
  (length (insieme-serie-recovery-views set)))

;;; REQ: REQ-REC-001 REQ-MVC-006
(declaim (ftype (function (piano-csn-archivio) (values boolean u64 &optional)) massimo-csn-archivio))
(defun massimo-csn-archivio (plan)
  "Pre: completed plan. Post: presence and maximum observed CSN; NIL/0 distinct from T/0.
TYPE-ERROR for invalid types; does not certify future health, visibility, or absence of pending obligations."
  (values (piano-csn-archivio-present plan) (piano-csn-archivio-maximum plan)))

;;; REQ: REQ-REC-001 REQ-AFF-008
(declaim (ftype (function (piano-csn-archivio) (values index index &optional)) statistiche-piano-csn-archivio))
(defun statistiche-piano-csn-archivio (plan)
  "Pre: complete plan. Post: Serie count and segment count, including their ACTIVE and all CLOSED.
TYPE-ERROR for invalid types; not a physical-file, record, or transaction count."
  (values (piano-csn-archivio-series plan) (piano-csn-archivio-segments plan)))

;;; REQ: REQ-REC-001 REQ-MVC-006
(declaim (ftype (function (piano-csn-archivio) (values u32 u32 &optional)) parole-base-csn-archivio))
(defun parole-base-csn-archivio (plan)
  "Pre: complete plan. Post: last CSN high/low, zero/zero if no source; no increment.
Base M for the future registry, not M+1; maximum u64 remains representable without wrap.
TYPE-ERROR for invalid types; does not create or authorize another allocator in the same Archivio."
  (let ((maximum (piano-csn-archivio-maximum plan)))
    (values (ldb (byte 32 32) maximum) (ldb (byte 32 0) maximum))))
