;;; OWNER: cold ACTIVE adoption, then one serial write admission; no cross-Serie state.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-WAL-002 REQ-WAL-005 REQ-LIM-003
(declaim (ftype (function (motore u64) null) initialize-write-group))
(defun initialize-write-group (engine id)
  "Pre: newly adopted canonical ACTIVE/controller and closed admission or BUSY maintenance.
Post: eight independent one-record batches, bounded group, and empty per-ACTIVE workspace.
Allocates only in cold adoption/rotation; batch zero is also reused by the ordinary single-write API."
  (let ((work (%make-write-group-workspace)))
    (dotimes (i +engine-write-group-capacity+)
      (setf (svref (write-group-workspace-batches work) i)
            (w:crea-lotto :segment id :version (motore-version engine) :max-records 1
              :capacity (+ (motore-max-record-bytes engine) w::+seal-total+))))
    (setf (motore-write-workspace engine) work
          (motore-batch engine) (svref (write-group-workspace-batches work) 0)
          (motore-group engine) (w:crea-gruppo (a:log-segmento-attivo-preparato (motore-active engine))
                                  :max-lots +engine-write-group-capacity+)))
  nil)

;;; REQ: REQ-IDX-013 REQ-AFF-004 REQ-WAL-006
(declaim (ftype (function (motore) null) clear-write-group-references))
(defun clear-write-group-references (engine)
  "Pre: owning request boundary, no asynchronous task or borrower. Post: no retired fragment/event retained.
Batch buffers and unresolved tokens remain owned on fault, but no caller input references are kept."
  (let ((work (motore-write-workspace engine)))
    (when work
      (fill (write-group-workspace-fragments work) nil)
      (fill (write-group-workspace-events work) nil)))
  nil)
