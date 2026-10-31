;;; OWNER: one serial M1 request; every admitted incomplete exit closes admission.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-WAL-006 REQ-IDX-005 REQ-IDX-012 REQ-IDX-013 REQ-LIM-003
(declaim (ftype (function (motore simple-vector index index)
                         (values boolean (or null opzione-indice-paginato) &optional)) group-preflight))
(defun group-preflight (engine operations count bytes)
  "Pre: READY owner and valid borrowed group. Post: clean writer/token budget and cumulative legacy reservation.
Known domain/capacity refusals remain READY; every other preflight failure faults admission with its primary cause.
Automatic maintenance reserves its whole group before CSN after admission, under the ordinary write boundary."
  (handler-case
      (progn
        (group-check-writer engine count)
        (unless (motore-automatic-index engine)
          (group-check-primary engine operations count) (group-plan-legacy engine operations count))
        (when (and (motore-automatic-index engine) (automatic-index-controller-disk (motore-automatic-index engine)))
          (let* ((auto (motore-automatic-index engine)) (policy (automatic-index-controller-policy auto)))
            (when (> (+ 128 (* count (d:disk-index-batch-limit))) (politica-indice-automatico-max-bytes policy))
              (error 'resource-exhausted :reason :engine-group-index-budget))))
        (let ((rotation (preflight-rotazione-motore engine bytes count)))
          (group-check-writer engine count)
          (unless (motore-automatic-index engine) (group-check-primary engine operations count))
          (values rotation (unless (motore-automatic-index engine) (group-plan-legacy engine operations count)))))
    ((or invalid-argument resource-exhausted) (condition) (error condition))
    (error (condition) (tenta-cleanup-motore engine (lambda () (guasta-motore engine condition))) (error condition))))

;;; REQ: REQ-WAL-002 REQ-WAL-006 REQ-IDX-013 REQ-CON-002 REQ-AFF-004
(declaim (ftype (function (motore simple-vector index boolean (or null opzione-indice-paginato)) null) group-run-admitted))
(defun group-run-admitted (engine operations count rotation renewal)
  "Pre: READY owner, validated cumulative preflight. Post: strong group complete; output still untouched.
Rotation/maintenance and commit share one BUSY scope. Every error or nonlocal exit faults without retry."
  (let ((complete nil) (cause nil))
    (setf (motore-busy engine) t)
    (unwind-protect
         (handler-case
             (progn
               (when rotation (ruota-segmento-motore engine))
               (group-check-writer engine count)
               (if (motore-automatic-index engine) (group-prepare-automatic engine operations count)
                   (progn (group-check-primary engine operations count) (group-prepare-legacy engine operations count renewal)))
               (group-commit-strong engine operations count)
               (unless (and (motore-busy engine) (eq :ready (motore-state engine))
                            (eq :healthy (s:stato-controllore-serie (motore-controller engine))))
                 (error 'invariant-violation :reason :engine-group-write-state))
               (when (motore-automatic-index engine)
                 (return-automatic-resident engine) (require-automatic-admission engine))
               (setf complete t))
           (error (condition) (setf cause condition)
             (tenta-cleanup-motore engine (lambda () (guasta-motore engine condition))) (error condition)))
      (unless (or complete cause)
        (tenta-cleanup-motore engine
          (lambda () (guasta-motore engine (make-condition 'invariant-violation :reason :engine-group-write-unwind)))))
      (setf (motore-busy engine) nil)))
  nil)

;;; REQ: REQ-WAL-002 REQ-WAL-005 REQ-WAL-006 REQ-MVC-008 REQ-AFF-004
(declaim (ftype (function (motore t t &key (:count t)) index) scrivi-gruppo-documenti))
(defun scrivi-gruppo-documenti (engine operations output &key (count (if (typep operations 'simple-vector) (length operations) 0)))
  "Pre: READY owner, 1..8 immutable operation descriptors in a stable simple vector, exclusive u64 output.
Borrowed keys/values stay stable until return; COUNT selects a prefix. Nonreentrant, one synchronous actor.
Post: COUNT distinct increasing CSNs in OUTPUT after one strong flush and complete FIFO publication/reuse.
Independent SEALs preserve ordinary recovery; a group is not an all-or-nothing transaction.
Known input/preflight rejection leaves output/CSNs unchanged. Admitted errors/nonlocal exits fault without ACK;
recovery may retain a sealed prefix. Caller resolves unknown outcomes; no automatic repetition."
  (esigi-motore-pronto engine)
  (unwind-protect
       (let ((bytes (group-validate-inputs engine operations output count)))
         (multiple-value-bind (rotation renewal) (group-preflight engine operations count bytes)
           (group-run-admitted engine operations count rotation renewal)
           (let ((csns (write-group-workspace-csns (motore-write-workspace engine))))
             (dotimes (i count) (setf (aref output i) (aref csns i))))
           count))
    (clear-write-group-references engine)))
