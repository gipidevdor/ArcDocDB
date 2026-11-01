;;; OWNER: one source writer; every newly initialized tail entry is written exactly once.
;;; SHARED: publication uses the existing Serie CAS; prepared tail entries remain outside all published bounds.
(in-package #:arcdocdb.get.resolver)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-WAL-005 REQ-WAL-006 REQ-AFF-001 REQ-AFF-004
(declaim (ftype (function (sorgente-get-attiva t lotto (or null radice-get-attiva) u32 t
                          (member :async :group :strong)) (values commit-serie index radice-get-attiva &optional))
                registra-delta-arena-attiva))
(defun registra-delta-arena-attiva (source lease batch previous puts content level)
  "Pre: healthy sole owner, supported verified sealed batch and captured CSN token; before dispatch.
Post: one immutable root captures the new write-once metadata prefix and is adopted into the normal FIFO.
SEAL remains the durable point; no publication or acknowledgment here. Full preflight precedes tail writes.
Every incomplete tail-preparation/adoption exit faults the controller; no retry, reuse or rollback of that tail."
  (verifica-delta-attivo source previous (inizio-lotto batch) puts)
  (let ((controller (sorgente-get-attiva-controller source)))
    (multiple-value-bind (slot high low) (leggi-csn-lotto batch)
      (declare (ignore slot)) ; Token identity already checked; only CSN order is needed in this preflight.
      (arcdocdb.series::%check-new-slot controller
        (svref (arcdocdb.series::controllore-serie-slots controller) (arcdocdb.series::controllore-serie-tail controller)) high low))
    (let* ((arena (the arena-get-attiva (sorgente-get-attiva-arena source)))
           (rank (if previous (radice-get-attiva-count previous) 0))
           (old-puts (if previous (radice-get-attiva-puts previous) 0)) (total (+ old-puts puts))
           (end (+ (inizio-lotto batch) (lunghezza-lotto batch)))
           (root (%make-radice-get-attiva source nil (1+ rank) total 0 end content)) (complete nil))
      (unwind-protect
           (progn
             (copia-put-attivi source batch (arena-get-attiva-rows arena) (* old-puts +row-words+) (* total +row-words+))
             (setf (aref (arena-get-attiva-ends arena) rank) end
                   (aref (arena-get-attiva-limits arena) (1+ rank)) total
                   (arena-get-attiva-count arena) (1+ rank))
             (multiple-value-bind (event generation) (registra-commit-serie controller lease batch previous root level)
               (setf complete t)
               (values event generation root)))
        (unless complete (arcdocdb.series::%mark-fault controller :archive))))))
