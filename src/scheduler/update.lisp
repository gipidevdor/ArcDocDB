;;; OWNER: aggiornamento non rientrante sul solo thread scheduler, nessun callback.
;;; SHARED: scheduler/metriche fuori dal percorso delle richieste (INV-P6).
(in-package #:arcdocdb.scheduler)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-AFF-008 REQ-AFF-013
(declaim (ftype (function (controllore-pool t t t t t) pool-tick) %pool-sample))
(defun %pool-sample (controller tick queue cpu p99 actual)
  "Pre: owner verified. Post: entire sample valid before any write.
INVALID-ARGUMENT for domain, actual outside min..max, regressing clock, or interval too short."
  (%pool-range tick 0 1099511627775 :pool-tick)
  (%pool-range queue 0 1048576 :pool-queue)
  (%pool-range cpu 0 1000 :pool-cpu)
  (%pool-range p99 0 10000 :pool-p99)
  (%pool-range actual (controllore-pool-minimum controller)
               (controllore-pool-maximum controller) :pool-actual)
  (when (controllore-pool-initialized controller)
    (unless (>= (- tick (controllore-pool-last controller)) (controllore-pool-period controller))
      (error 'invalid-argument :reason :pool-sample-period)))
  tick)

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008 REQ-AFF-013
(declaim (ftype (function (controllore-pool t t t t t)
                         (values pool-workers (member :hold :pending :grow :shrink) &optional))
                aggiorna-controllore-pool))
(defun aggiorna-controllore-pool (controller tick queue cpu p99 actual)
  "Pre: exclusive owner; injected time, queue, CPU/P99 in thousandths, and actual workers.
Post: bounded target and action; :PENDING retains target if actual differs, without waiting.
Gap >2 periods resets EWMA/dwell time. Propagates typed preflight errors without mutation.
Does not create/retire threads, revoke pending target, or treat ready EMPTY as quiescence."
  (%check-pool controller)
  (%pool-sample controller tick queue cpu p99 actual)
  (let ((reset (or (not (controllore-pool-initialized controller))
                   (> (- tick (controllore-pool-last controller))
                      (* 2 (controllore-pool-period controller))))))
    (setf (controllore-pool-queue controller) (%pool-ewma (controllore-pool-queue controller) queue reset)
          (controllore-pool-cpu controller) (%pool-ewma (controllore-pool-cpu controller) cpu reset)
          (controllore-pool-p99 controller) (%pool-ewma (controllore-pool-p99 controller) p99 reset)
          (controllore-pool-initialized controller) t
          (controllore-pool-last controller) tick)
    (when reset
      (setf (controllore-pool-candidate controller) :hold (controllore-pool-since controller) tick))
    (let ((action (if (/= actual (controllore-pool-target controller))
                      (progn
                        (setf (controllore-pool-candidate controller) :hold
                              (controllore-pool-since controller) tick)
                        :pending)
                      (%pool-apply controller tick (%pool-direction controller)))))
      (%check-pool controller)
      (values (controllore-pool-target controller) action))))
