;;; OWNER: compito I/O esclusivo, buffer del piano stabile e scratch privato.
;;; SHARED: nessuna scansione del manifest, allocazione di liste o scrittura tra Serie.
(in-package #:arcdocdb.control)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-001 REQ-AFF-008 REQ-REC-001
(declaim (ftype (function (checkpoint-control file-io index) null) scrivi-checkpoint-control))
(defun scrivi-checkpoint-control (plan append chunk-bytes)
  "Pre: preflight complete, append at zero, positive chunk, and exclusive capability in the I/O pool.
Post: entire file written in chunks, not yet durable; every return checked.
I/O faults propagated without retry; INVARIANT-VIOLATION for a mismatched frontier.
Loop bounded by CEILING(size/chunk), without suspension or atomicity point."
  (unless (plusp chunk-bytes) (error 'invalid-argument :reason :control-checkpoint-chunk))
  (let ((bytes (checkpoint-control-bytes plan)) (size (lunghezza-checkpoint-control plan)))
    (loop repeat (ceiling size chunk-bytes) for start from 0 by chunk-bytes
          for end = (min size (+ start chunk-bytes))
          do (unless (= (append-esatto append bytes start end) end)
               (error 'invariant-violation :reason :control-checkpoint-write :offset start))))
  nil)

;;; REQ: REQ-AFF-002 REQ-AFF-008 REQ-REC-001
(declaim (ftype (function (checkpoint-control file-io octets index) null) rileggi-checkpoint-control))
(defun rileggi-checkpoint-control (plan input scratch chunk-bytes)
  "Pre: file written and synchronized, preflight complete, and exclusive scratch in the I/O pool.
Post: each chunk reread equal to the plan; no manifest reconstruction/allocation.
I/O/corruption faults propagated without partial result; returns checked.
Loop bounded by CEILING(size/chunk); scratch reused only after complete comparison."
  (unless (plusp chunk-bytes) (error 'invalid-argument :reason :control-checkpoint-chunk))
  (let ((size (lunghezza-checkpoint-control plan)))
    (loop repeat (ceiling size chunk-bytes) for start from 0 by chunk-bytes
          for count = (min chunk-bytes (- size start))
          do (unless (= (leggi-esatto input scratch 0 count start) count)
               (error 'invariant-violation :reason :control-checkpoint-read :offset start))
             (verifica-rilettura-control plan scratch start count)))
  nil)
