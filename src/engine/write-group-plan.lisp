;;; OWNER: serial M1 admission; every cumulative reservation precedes the first data CSN.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-WAL-005 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (motore t t t) index) group-validate-inputs))
(defun group-validate-inputs (engine operations output count)
  "Pre: READY owner and caller-stable inputs. Post: total ordinary frame bytes, complete group shape/size checked.
Invalid domains/aliases or capacity reject before workspace, namespace, CSN or output changes."
  (unless (and (typep operations 'simple-vector) (typep output '(simple-array (unsigned-byte 64) (*)))
               (typep count '(integer 1 8)) (<= count (length operations)) (<= count (length output)))
    (error 'invalid-argument :reason :engine-group-input))
  (let ((bytes 0))
    (dotimes (i count)
      (let ((op (svref operations i)))
        (unless (typep op 'operazione-scrittura) (error 'invalid-argument :reason :engine-group-operation))
        (incf bytes (verifica-input-scrittura-motore engine (operazione-scrittura-kind op)
                      (operazione-scrittura-key op) (or (operazione-scrittura-value op) (motore-empty engine))))))
    (when (or (> count (motore-max-records engine))
              (> (+ bytes (* count w::+seal-total+) f:+segment-header-bytes+) (motore-max-file-bytes engine))
              (> (+ bytes (* count w::+seal-total+)) w::+max-lotto-bytes+))
      (error 'resource-exhausted :reason :engine-group-segment-budget))
    bytes))

;;; REQ: REQ-WAL-005 REQ-WAL-006 REQ-MVC-008 REQ-AFF-008
(declaim (ftype (function (motore index) null) group-check-writer))
(defun group-check-writer (engine count)
  "Pre: sole READY owner, no other allocator until sealing. Post: clean buffers/FIFO and cumulative token headroom.
No CSN is acquired; resource exhaustion before admission, invariant failures close it at the outer boundary."
  (let ((controller (motore-controller engine)) (work (motore-write-workspace engine)))
    (unless (and (zerop (s::controllore-serie-count controller)) (zerop (s::controllore-serie-active-io controller))
                 (eq (w:stato-gruppo (motore-group engine)) :building))
      (error 'invariant-violation :reason :engine-group-writer-residue))
    (when (> count (- most-positive-fixnum (s::controllore-serie-event-generation controller)))
      (error 'resource-exhausted :reason :serie-event-generation))
    (dotimes (i count)
      (let ((batch (the w:lotto (svref (write-group-workspace-batches work) i))))
        (unless (and (eq :open (w:stato-lotto batch)) (zerop (w:lunghezza-lotto batch))
                     (eq :libero (w:stato-csn-lotto batch)) (null (w::lotto-owner batch)))
          (error 'invariant-violation :reason :engine-group-batch-residue))
        (when (= (w::lotto-incarnation batch) most-positive-fixnum)
          (error 'resource-exhausted :reason :lotto-incarnation)))))
  (arcdocdb.csn:verifica-capienza-csn (motore-registry engine) count)
  (multiple-value-bind (high low hh hl) (arcdocdb.csn:leggi-frontiere-csn (motore-registry engine))
    (unless (and (= high hh) (= low hl))
      (error 'invariant-violation :reason :engine-group-pending-csn)))
  nil)

;;; REQ: REQ-IDX-013 REQ-LIM-003 REQ-WAL-006
(declaim (ftype (function (motore index) null) group-reserve-disk))
(defun group-reserve-disk (engine count)
  "Pre: BUSY paged owner, before data CSNs. Post: COUNT worst-case mutation appends fit, after bounded compaction.
No per-key resident reconstruction; existing fixed disk mutation workspace is reused sequentially."
  (let* ((auto (motore-automatic-index engine)) (tree (automatic-index-controller-disk auto))
         (needed (* count (d:disk-index-batch-limit)))
         (maximum (politica-indice-automatico-max-bytes (automatic-index-controller-policy auto))))
    (when (or (> (+ (d:disk-index-frontier tree) needed) maximum)
              (> (d:disk-index-frontier tree) (max 4194304 (* 4 (d:disk-index-live-bytes tree)))))
      (compact-automatic-disk engine))
    (io:verifica-capienza-append (d::disk-index-append (automatic-index-controller-disk auto)) needed (d:disk-index-batch-limit)))
  nil)

;;; REQ: REQ-IDX-013 REQ-IDX-005 REQ-WAL-006
(declaim (ftype (function (motore simple-vector index) null) group-prepare-automatic))
(defun group-prepare-automatic (engine operations count)
  "Pre: BUSY owner, validated cumulative group. Post: one stable backend with capacity for the entire group.
At most 256 growth steps. Any growth/split invalidates the projection; every pass rebuilds it from current keys.
Budget exhaustion selects paged storage before taking data CSNs; no incomplete index change is hidden."
  (let ((auto (motore-automatic-index engine)))
    (loop repeat 256 do
      (when (automatic-index-controller-disk auto)
        (clear-write-group-references engine) (group-reserve-disk engine count)
        (require-automatic-admission engine) (return-from group-prepare-automatic nil))
      (group-project-primary engine operations count)
      (let ((restart nil))
        (dotimes (i count)
          (handler-case (group-check-primary-row engine operations count i)
            (resource-exhausted (condition)
              (let* ((reason (arcdocdb.conditions:error-reason condition)) (primary (motore-index engine))
                     (fragment (the p:frammento-indice (svref (write-group-workspace-fragments (motore-write-workspace engine)) i))))
                (unless (member reason '(:primary-fragment-load :primary-key-arena-full :primary-slot-rebuild-required)) (error condition))
                (multiple-value-bind (peak bytes changes) (group-fragment-demand (motore-write-workspace engine) operations count fragment)
                  (declare (ignore peak changes)) ; only arena extension needs the cumulative key-byte sum.
                  (handler-case
                      (progn (grow-automatic-resident auto primary fragment reason bytes)
                             (setf (automatic-index-controller-resident-charge auto) (automatic-resident-charge primary)))
                    (resource-exhausted () (page-automatic-index engine))))
                (setf restart t))
              (return))))
        (unless restart
          (group-check-primary engine operations count)
          (require-automatic-admission engine) (return-from group-prepare-automatic nil))))
    (error 'resource-exhausted :reason :engine-group-index-preparation)))
