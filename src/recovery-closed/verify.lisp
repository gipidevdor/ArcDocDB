;;; OWNER: un prefisso privato stabile, già letto dalla capacità readonly del CLOSED.
;;; SHARED: nessuna classificazione della coda, I/O o replay di dati nei registri della Serie.
(in-package #:arcdocdb.recovery.closed)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-FOR-003 REQ-STO-006 REQ-AFF-008
(declaim (ftype (function (octets index u64 (member 1 2) index index u32 index)
                         (values index index &optional)) verifica-lotti-closed))
(defun verifica-lotti-closed (buffer prefix id version max-batches max-records batch-records batch-bytes)
  "Pre: header and P verified, exclusive buffer. Post: all batches intact through P, exact counts.
No EOF scanner: a broken batch before P is an error, never TAIL. Complete u64 ID without truncation.
Original conditions propagate; loop bounded to MAX-BATCHES and record count before workspace."
  (check-range buffer +segment-header-bytes+ prefix)
  (unless (plusp max-batches) (error 'invalid-argument :reason :closed-recovery-batches))
  (let ((pos +segment-header-bytes+) (batches 0) (records 0))
    (loop repeat max-batches
          do (when (= pos prefix) (return-from verifica-lotti-closed (values batches records)))
             (multiple-value-bind (next stamp durable count)
                 (verifica-lotto buffer pos prefix id :version version :log-kind :segment
                                 :max-records batch-records :max-bytes batch-bytes)
               (unless (and (< pos next) (<= next prefix) (typep stamp 'u64) (<= durable pos))
                 (error 'invariant-violation :reason :closed-recovery-batch :offset pos))
               (when (> count (- max-records records))
                 (error 'resource-exhausted :reason :closed-recovery-record-budget :offset pos))
               (incf records count) (incf batches) (setf pos next)))
    (unless (= pos prefix) (error 'resource-exhausted :reason :closed-recovery-batch-budget :offset pos))
    (values batches records)))

;;; REQ: REQ-REC-001 REQ-FOR-003 REQ-CMP-009 REQ-AFF-008
(declaim (ftype (function (control-recuperato octets index u64 (member 1 2) index index) index)
                verifica-compattato-closed))
(defun verifica-compattato-closed (control buffer prefix id version bytes records)
  "Pre: compaction header from the same FD, stable prefix. Post: ordinary PUT/TOMBSTONE frames only, through P.
Reuses the complete codec, without OUTCOME/prepared or tail interpretation; returns record count.
Original errors propagate; INVARIANT-VIOLATION for mismatching end/version/counts."
  (check-range buffer 0 prefix)
  (multiple-value-bind (next actual-version count puts tombstones)
      (verifica-segmento-compattato buffer prefix
       (arcdocdb.get::vista-get-serie-identity (arcdocdb.control::control-recuperato-view control)) id
       :max-bytes bytes :max-records records)
    (unless (and (= next prefix) (= actual-version version) (= count (+ puts tombstones)) (<= count records))
      (error 'invariant-violation :reason :closed-recovery-compaction))
    count))
