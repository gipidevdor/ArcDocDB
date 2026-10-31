;;; OWNER: compito I/O esclusivo dell'Archivio; EOF, FD e scratch congelati per l'intera chiamata.
;;; SHARED: sola lettura della capacità, nessuna mutazione condivisa tra Serie.
(in-package #:arcdocdb.recovery.archive)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-TXM-005 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (archivio-recovery file-io index octets index index index u32 index index index u16)
                         null) verifica-lettura-decisioni))
(defun verifica-lettura-decisioni (archive input size scratch chunk bytes batches batch-records
                                 batch-bytes decisions participants per-decision)
  "Pre: authoritative physical EOF, exclusive scratch. Post: preflight without syscalls or writes.
Open read-only capability, alias/range/budgets verified before the first read.
CORRUPTION-DETECTED for a truncated header; typed conditions for arguments/capacity/budgets."
  (arcdocdb.io::esigi-aperto input :input)
  (when (eq scratch (archivio-recovery-identity archive))
    (error 'invalid-argument :reason :archive-recovery-alias))
  (unless (and (plusp chunk) (>= bytes +log-header-bytes+))
    (error 'invalid-argument :reason :archive-recovery-arguments))
  (when (< size +log-header-bytes+)
    (error 'corruption-detected :reason :archive-recovery-header-truncated :offset 0))
  (when (> size bytes) (error 'resource-exhausted :reason :archive-recovery-byte-budget))
  (check-range scratch 0 size)
  (verifica-capienza-lettura input (max +log-header-bytes+ (min (- size +log-header-bytes+) chunk)))
  (arcdocdb.recovery.decisions::check-decision-budgets decisions participants per-decision)
  (unless (= size (arcdocdb.recovery.scan::check-scan-arguments
                   scratch +log-header-bytes+ size 0 2 :multiserie 0 size
                   bytes batches batch-records batch-bytes bytes))
    (error 'invariant-violation :reason :archive-recovery-preflight))
  nil)

;;; REQ: REQ-REC-001 REQ-TXM-005 REQ-FOR-001 REQ-FOR-002 REQ-AFF-002
(declaim (ftype (function (archivio-recovery file-io octets) (values (member 1 2) &optional))
                leggi-header-decisioni))
(defun leggi-header-decisioni (archive input scratch)
  "Pre: preflight complete in the I/O pool, stable capability and scratch. Post: header read once.
Multiseries magic, CRC, complete UUID, version, and reserved fields verified before the body.
Original errors propagate; no result or file modification."
  (check-range scratch 0 +log-header-bytes+)
  (let ((next (leggi-esatto input scratch 0 +log-header-bytes+ 0)))
    (unless (= next +log-header-bytes+)
      (error 'invariant-violation :reason :archive-recovery-header-read)))
  (multiple-value-bind (next version)
      (verifica-header-log scratch 0 +log-header-bytes+ :multiserie (archivio-recovery-identity archive))
    (unless (= next +log-header-bytes+)
      (error 'invariant-violation :reason :archive-recovery-header))
    (the (member 1 2) version)))

;;; REQ: REQ-REC-001 REQ-TXM-005 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (file-io index octets index) null) leggi-corpo-decisioni))
(defun leggi-corpo-decisioni (input size scratch chunk)
  "Pre: verified header and stable EOF, private scratch, I/O task. Post: body through EOF on the same FD.
Loop bounded to CEILING((size-64)/chunk), no header reread.
I/O errors propagate without retry, close, or truncation; no partial result."
  (unless (and (plusp chunk) (>= size +log-header-bytes+))
    (error 'invalid-argument :reason :archive-recovery-read-range))
  (check-range scratch 0 size)
  (loop repeat (ceiling (- size +log-header-bytes+) chunk)
        for start from +log-header-bytes+ by chunk for end = (min size (+ start chunk))
        do (let ((next (leggi-esatto input scratch start end start)))
             (unless (= next end)
               (error 'invariant-violation :reason :archive-recovery-read :offset start))))
  (arcdocdb.io::esigi-aperto input :input)
  nil)
