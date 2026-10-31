;;; OWNER: public controls are serial and never expose mutable roots or file capabilities.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-013 REQ-IDX-008
(declaim (ftype (function (motore) list) statistiche-indice-motore))
(defun statistiche-indice-motore (engine)
  "Pre: READY owner, no request in flight. Post: copied scalar metrics and explicit grant/reservation.
Charged bytes describe reachable index buffers plus metadata allowances, not GC garbage, runtime or RSS."
  (esigi-motore-pronto engine)
  (let ((auto (motore-automatic-index engine)))
    (unless auto (error 'invalid-argument :reason :engine-auto-profile-required))
    (list :mode (if (automatic-index-controller-disk auto) :paged :resident) :budget (automatic-index-controller-budget auto)
          :reserved-fixed (automatic-index-controller-fixed auto) :resident-charge (automatic-index-controller-resident-charge auto)
          :live-entries (automatic-index-controller-count auto) :key-bytes (automatic-index-controller-key-bytes auto)
          :transitions (automatic-index-controller-transitions auto)
          :cache-hits (if (automatic-index-controller-disk auto) (d::disk-index-cache-hits (automatic-index-controller-disk auto)) 0)
          :cache-misses (if (automatic-index-controller-disk auto) (d::disk-index-cache-misses (automatic-index-controller-disk auto)) 0)
          :cache-evictions (if (automatic-index-controller-disk auto) (d::disk-index-cache-evictions (automatic-index-controller-disk auto)) 0)
          :disk-bytes (if (automatic-index-controller-disk auto) (d:disk-index-frontier (automatic-index-controller-disk auto)) 0))))

;;; REQ: REQ-IDX-013 REQ-IDX-008
(declaim (ftype (function (motore t) null) configura-budget-indice-motore))
(defun configura-budget-indice-motore (engine budget)
  "Pre: READY serial owner and finite new grant. Post: automatic backend reconsidered, no data CSN consumed.
Too-small fixed quota rejects before effects. Shrink migrates under the old reservation before accepting new grant.
Any admitted maintenance failure faults the engine; canonical WAL is unchanged."
  (esigi-motore-pronto engine)
  (let ((auto (motore-automatic-index engine)) (complete nil))
    (unless (and auto (typep budget '(integer 1 #.most-positive-fixnum)))
      (error 'invalid-argument :reason :engine-auto-budget))
    (when (< budget (automatic-index-controller-fixed auto)) (error 'resource-exhausted :reason :engine-auto-fixed-budget))
    (setf (motore-busy engine) t)
    (unwind-protect
         (progn
           (when (and (motore-index engine)
                      (> (+ (automatic-index-controller-fixed auto) (automatic-index-controller-resident-charge auto)) budget))
             (page-automatic-index engine))
           (setf (automatic-index-controller-budget auto) budget)
           (return-automatic-resident engine t)
           (require-automatic-admission engine)
           (setf complete t))
      (unless complete (guasta-motore engine (make-condition 'invariant-violation :reason :engine-auto-quota-incomplete)))
      (setf (motore-busy engine) nil)))
  nil)

;;; REQ: REQ-IDX-013 REQ-REC-001
(declaim (ftype (function (motore) list) automatic-startup-stamp))
(defun automatic-startup-stamp (engine)
  "Pre: owner before admission, all replay and migration complete. Post: exact scalar/root identity witness.
Used across the final trusted observer; matching counts alone cannot authorize an altered root."
  (let* ((auto (motore-automatic-index engine)) (primary (motore-index engine))
         (tree (automatic-index-controller-disk auto)))
    (unless (if tree (null primary) primary) (error 'invariant-violation :reason :engine-auto-backend-shape))
    (list primary (when primary (p::indice-primario-revision primary)) tree
          (when tree (d:disk-index-root tree)) (when tree (d:disk-index-frontier tree))
          (automatic-index-controller-count auto) (automatic-index-controller-key-bytes auto))))
