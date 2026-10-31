;;; OWNER: il solo scheduler possiede EWMA, target e permanenza; nessun attuatore.
;;; SHARED: scheduler/metriche fuori dal percorso delle richieste (INV-P6).
(in-package #:arcdocdb.scheduler)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-AFF-008
(declaim (ftype (function (pool-signal (integer 0 1048576) boolean) pool-signal) %pool-ewma))
(defun %pool-ewma (previous sample reset)
  "Pre: bounded signals. Post: scale256, alpha1/8, floor; reset uses only the sample.
No growing rational, loop, I/O, or condition with verified inputs."
  (if reset (* sample 256) (floor (+ (* 7 previous) (* sample 256)) 8)))

;;; REQ: REQ-THR-001 REQ-AFF-008
(declaim (ftype (function (controllore-pool) pool-direction) %pool-direction))
(defun %pool-direction (controller)
  "Pre: updated EWMAs. Post: pure direction with explicit thresholds and P99 deadband.
SHRINK takes precedence; no error, target unchanged."
  (cond
    ((or (>= (controllore-pool-p99 controller) 307200)
         (and (< (controllore-pool-queue controller) 256)
              (<= (controllore-pool-cpu controller) 76800))) :shrink)
    ((and (>= (controllore-pool-queue controller)
              (* 256 (controllore-pool-queue-high controller)))
          (< (controllore-pool-cpu controller) 179200)
          (<= (controllore-pool-p99 controller) 256000)) :grow)
    (t :hold)))

;;; REQ: REQ-THR-001 REQ-AFF-008 REQ-AFF-013
(declaim (ftype (function (controllore-pool pool-tick symbol) pool-direction)
                %pool-apply))
(defun %pool-apply (controller tick direction)
  "Pre: owner and time verified. Post: change only after continuous dwell.
Growth +1, reduction floor(3*target/4), clamp; no change at limits.
INVARIANT-VIOLATION for unexpected private direction; no waiting or thread retirement."
  (let* ((target (controllore-pool-target controller))
         (next (case direction
                 (:grow (min (controllore-pool-maximum controller) (1+ target)))
                 (:shrink (max (controllore-pool-minimum controller) (floor (* 3 target) 4)))
                 (:hold target)
                 (otherwise (error 'invariant-violation :reason :pool-state)))))
    (cond
      ((= target next)
       (setf (controllore-pool-candidate controller) :hold
             (controllore-pool-since controller) tick)
       :hold)
      ((not (eq direction (controllore-pool-candidate controller)))
       (setf (controllore-pool-candidate controller) direction
             (controllore-pool-since controller) tick)
       :hold)
      ((< (- tick (controllore-pool-since controller)) (controllore-pool-dwell controller))
       :hold)
      (t
       (setf (controllore-pool-target controller) next
             (controllore-pool-candidate controller) :hold
             (controllore-pool-since controller) tick)
       direction))))
