;;; OWNER: diagnostica del registro al coordinatore, ack solo al proprio worker.
;;; SHARED: letture acquire di parole CAS fixnum indipendenti per worker.
(in-package #:arcdocdb.scheduler)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (porta-worker-pool) (values pool-command pool-command &optional))
                %pool-port-words))
(defun %pool-port-words (port)
  "Pre: exclusive coordinator or owning worker. Post: consistent words read with acquire semantics.
INVARIANT-VIOLATION :POOL-PORT-STATE for a duplicate, regressive, or skipped command."
  (let ((request (porta-worker-pool-request port)) (ack (porta-worker-pool-ack port)))
    (sb-thread:barrier (:read))
    (unless (or (= request ack)
                (and (= (ash request -1) (1+ (ash ack -1)))
                     (not (eq (oddp request) (oddp ack)))))
      (error 'invariant-violation :reason :pool-port-state))
    (values request ack)))

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (registro-pool) null) %check-registro-pool))
(defun %check-registro-pool (registry)
  "Pre: nonreentrant access. Post: owner and consistent target/controller.
INVALID-ARGUMENT for owner; INVARIANT-VIOLATION for target or private capacity."
  (unless (eq (registro-pool-owner registry) sb-thread:*current-thread*)
    (error 'invalid-argument :reason :pool-owner))
  (%check-pool (registro-pool-controller registry))
  (unless (and (= (registro-pool-target registry)
                  (controllore-pool-target (registro-pool-controller registry)))
               (= (controllore-pool-maximum (registro-pool-controller registry))
                  (length (registro-pool-ports registry))))
    (error 'invariant-violation :reason :pool-state))
  nil)

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008 REQ-AFF-013
(declaim (ftype (function (registro-pool) (values pool-workers pool-workers boolean &optional))
                leggi-registro-pool))
(defun leggi-registro-pool (registry)
  "Pre: exclusive owner; private ports not modified externally.
Post: actual from ACK, target, pending from REQUEST/=ACK. Bounded progressive snapshot;
without pending, all acknowledgments match target. Propagates typed verifiers."
  (%check-registro-pool registry)
  (let ((actual 0) (pending nil) (ports (registro-pool-ports registry)))
    (declare (type (integer 0 131072) actual))
    (dotimes (i (length ports))
      (multiple-value-bind (request ack) (%pool-port-words (svref ports i))
        (unless (eq (oddp request) (< i (registro-pool-target registry)))
          (error 'invariant-violation :reason :pool-port-state))
        (when (oddp ack) (incf actual))
        (unless (= request ack) (setf pending t))))
    (unless (<= (controllore-pool-minimum (registro-pool-controller registry)) actual
                (controllore-pool-maximum (registro-pool-controller registry)))
      (error 'invariant-violation :reason :pool-state))
    (values actual (registro-pool-target registry) pending)))
