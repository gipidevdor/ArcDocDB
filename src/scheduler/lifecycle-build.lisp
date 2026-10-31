;;; OWNER: costruzione e binding sul coordinator; porte create sul rispettivo worker.
;;; SHARED: configurazione pubblicata dal chiamante dopo handshake di avvio.
(in-package #:arcdocdb.scheduler)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (arcdocdb.execution:contesto-worker-writer
                          &key (:coordinator t) (:active t)) porta-worker-pool)
                crea-porta-worker-pool))
(defun crea-porta-worker-pool (context &key (coordinator sb-thread:*current-thread*) (active t))
  "Pre: current worker owner, verified IDLE context; no other task/epoch.
Post: preallocated port, initial state confirmed. INVALID-ARGUMENT for coordinator/bit;
propagates the read-only C1 barrier. Cross-thread publication handled by the startup handshake."
  (unless (typep coordinator 'sb-thread:thread)
    (error 'invalid-argument :reason :pool-owner))
  (unless (typep active 'boolean) (error 'invalid-argument :reason :pool-active))
  (arcdocdb.execution::%richiedi-worker context :idle)
  (let ((word (if active 1 0)))
    (%make-porta-worker-pool sb-thread:*current-thread* coordinator context word word)))

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (controllore-pool t fixnum) sb-thread:thread) %pool-startup-owner))
(defun %pool-startup-owner (controller port position)
  "Pre: current controller owner, bounded index. Post: stable port and owner returned.
INVALID-ARGUMENT for nonconforming type, coordinator, binding, or initial state."
  (unless (typep port 'porta-worker-pool) (error 'invalid-argument :reason :pool-ports))
  (unless (eq (porta-worker-pool-coordinator port) sb-thread:*current-thread*)
    (error 'invalid-argument :reason :pool-owner))
  (when (porta-worker-pool-bound port) (error 'invalid-argument :reason :pool-binding))
  (unless (and (<= (porta-worker-pool-request port) 1)
               (= (porta-worker-pool-request port) (porta-worker-pool-ack port))
               (eq (oddp (porta-worker-pool-request port))
                   (< position (controllore-pool-target controller))))
    (error 'invalid-argument :reason :pool-port-state))
  (porta-worker-pool-owner port))

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (controllore-pool t) simple-vector) %pool-validate-ports))
(defun %pool-validate-ports (controller ports)
  "Pre: controller owner verified. Post: all ports can be validated without binding.
INVALID-ARGUMENT for shape, duplicate owner, coordinator, pending, prefix, or binding.
EQ hash only at startup: bounded O(N) scan, no quadratic search."
  (unless (and (typep ports 'simple-vector)
               (= (controllore-pool-maximum controller) (length ports)))
    (error 'invalid-argument :reason :pool-ports))
  (let ((owners (make-hash-table :test #'eq :size (length ports))))
    (dotimes (i (length ports))
      (let ((owner (%pool-startup-owner controller (svref ports i) i)))
        (when (gethash owner owners)
          (error 'invalid-argument :reason :pool-ports))
        (setf (gethash owner owners) t))))
  ports)

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008 REQ-AFF-013
(declaim (ftype (function (controllore-pool t) registro-pool) crea-registro-pool))
(defun crea-registro-pool (controller ports)
  "Pre: local controller, stable startup with distinct workers; active target forms a prefix.
Post: private copy and permanent port binding, allocations only at startup.
All typed rejections precede binding; use only wrappers after connection."
  (%check-pool controller)
  (%pool-validate-ports controller ports)
  (let* ((copy (copy-seq ports))
         (registry (%make-registro-pool controller copy sb-thread:*current-thread*
                                      (controllore-pool-target controller))))
    (dotimes (i (length copy)) (setf (porta-worker-pool-bound (svref copy i)) t))
    registry))
