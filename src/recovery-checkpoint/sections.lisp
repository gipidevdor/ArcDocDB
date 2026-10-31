;;; OWNER: builder scrive soltanto sezioni private dopo la misura del workspace.
;;; SHARED: vecchie entry/esiti restano immutabili; nessuna pubblicazione o operazione I/O.
(in-package #:arcdocdb.recovery.checkpoint)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-TXM-007 REQ-FOR-003 REQ-AFF-008
(declaim (ftype (function (arcdocdb.recovery.manifest::manifest-closed u64 octets index) index)
                scrivi-chiuso-checkpoint))
(defun scrivi-chiuso-checkpoint (entry id buffer start)
  "Pre: valid owned entry, private BUFFER, and authorized budgets. Post: canonical CLOSED copy with sorted outcomes.
Range before writing, zero CSN preserved through distinct presence; no source array exported.
Typed errors propagated; failure modifies only private sections never delivered."
  (arcdocdb.recovery.manifest::check-closed-shape entry)
  (let* ((outcomes (arcdocdb.recovery.manifest::%closed-outcomes entry))
         (count (hash-table-count outcomes))
         (end (+ start +closed-fixed-bytes+ (* count +closure-outcome-bytes+))))
    (unless (typep count 'u32) (error 'invariant-violation :reason :recovery-checkpoint-outcome-count))
    (check-range buffer start end)
    (let ((ids (ordina-id-checkpoint outcomes nil)))
      (scrivi-u64 buffer start id)
      (scrivi-u64 buffer (+ start +closed-valid-bytes-offset+) (arcdocdb.recovery.manifest::%closed-valid-bytes entry))
      (scrivi-u32 buffer (+ start +closed-outcome-count-offset+) count)
      (loop for txid across ids for pos from (+ start +closed-fixed-bytes+) by +closure-outcome-bytes+
            do (multiple-value-bind (csn present) (gethash txid outcomes)
                 (unless (and present (typep csn 'u64))
                   (error 'invariant-violation :reason :recovery-checkpoint-outcome))
                 (scrivi-u64 buffer pos txid)
                 (scrivi-u64 buffer (+ pos (/ +closure-outcome-bytes+ 2)) csn))))
    end))

;;; REQ: REQ-REC-001 REQ-STO-003 REQ-TXM-007 REQ-FOR-003 REQ-AFF-018
(declaim (ftype (function (active-recuperato arcdocdb.recovery.manifest::manifest index) octets)
                codifica-chiusi-checkpoint))
(defun codifica-chiusi-checkpoint (recovered manifest size)
  "Pre: SIZE measured on frozen sources. Post: all old CLOSED plus ACTIVE closure, sorted by ID.
Reuses the ACTIVE serializer for P and derived outcomes; checks progress and exact consumption.
INVARIANT-VIOLATION for a mutated/inconsistent source; no partial result or external buffer modified."
  (let* ((id (arcdocdb.recovery.active::id-active-recuperato recovered))
         (table (arcdocdb.recovery.manifest::%manifest-closed manifest))
         (ids (ordina-id-checkpoint table id))
         (buffer (make-array size :element-type '(unsigned-byte 8) :initial-element 0)) (pos 0))
    (loop for current across ids
          do (let ((next (if (= current id) (scrivi-chiusura-active recovered buffer pos)
                             (scrivi-chiuso-checkpoint
                              (the arcdocdb.recovery.manifest::manifest-closed (gethash current table))
                              current buffer pos))))
               (unless (< pos next (1+ size))
                 (error 'invariant-violation :reason :recovery-checkpoint-closed-progress))
               (setf pos next)))
    (unless (= pos size) (error 'invariant-violation :reason :recovery-checkpoint-closed-size))
    buffer))

;;; REQ: REQ-REC-001 REQ-FOR-003 REQ-AFF-018
(declaim (ftype (function (arcdocdb.recovery.manifest::manifest index) octets) codifica-rimossi-checkpoint))
(defun codifica-rimossi-checkpoint (manifest size)
  "Pre: SIZE measured, frozen manifest. Post: all and only REMOVED IDs in u64 order, including zero.
Checks size and range before private writes; no physical deletion or reconciliation.
INVARIANT-VIOLATION for mismatched counts, other typed errors propagated."
  (let* ((table (arcdocdb.recovery.manifest::%manifest-removed manifest))
         (ids (ordina-id-checkpoint table nil))
         (buffer (make-array size :element-type '(unsigned-byte 8) :initial-element 0)))
    (unless (= size (* (length ids) +removed-id-bytes+))
      (error 'invariant-violation :reason :recovery-checkpoint-removed-size))
    (check-range buffer 0 size)
    (loop for id across ids for pos from 0 by +removed-id-bytes+ do (scrivi-u64 buffer pos id))
    buffer))
