;;; OWNER: local actor/client; bounded I/O wait only, no shared event loop or handler registration.
;;; SHARED: none; borrowed socket descriptors and absolute existing deadlines.
(in-package #:arcdocdb.local)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IPC-002 REQ-AFF-004
(defun make-local-waiter (capacity backend)
  "Pre: validated local backend. Post: private preallocated poll scratch; no descriptors acquired.
Injected :poll(buffer,count,ms) returns native count/errno, without retaining the buffer."
  (%native-check-backend backend)
  (arcdocdb.io::crea-attesa-io capacity
    :backend (when backend
               (lambda (buffer count milliseconds) (%native-call backend :poll buffer count milliseconds)))))

;;; REQ: REQ-IPC-002 REQ-LIM-003
(defun local-wait-milliseconds (now until)
  "Pre: trusted u64 clock/deadline. Post: ceil remaining time, capped at 100 ms, zero if expired.
A rounded OS timeout never admits expired work: caller rechecks the absolute deadline after waking."
  (if (>= now until) 0 (min 100 (ceiling (* 1000 (- until now)) internal-time-units-per-second))))

;;; REQ: REQ-IPC-002 REQ-LIM-003
(defun wait-local-server (listener connections waiter now)
  "Pre: serial actor, every nonblocking slot already attempted. Post: one bounded wait on all live FDs.
Listener/input/output interests follow owned state; closest deadline caps sleep. No other event handlers run."
  (arcdocdb.io::configura-attesa-io waiter 0 (native-listener-fd listener) :input)
  (let ((until (local-until now 1)))
    (loop for connection across connections for slot from 1 do
      (let ((state (local-connection-state connection)))
        (arcdocdb.io::configura-attesa-io waiter slot
          (unless (eq state :closed) (local-connection-socket connection))
          (if (member state '(:welcome :response)) :output :input))
        (unless (eq state :closed)
          (setf until (min until
                          (if (and (eq state :request) (not (local-connection-frame-started connection)))
                              (local-connection-idle connection) (local-connection-deadline connection)))))))
    (arcdocdb.io::attendi-io waiter (local-wait-milliseconds now until)))
  nil)

;;; REQ: REQ-IPC-002 REQ-LIM-003
(defun wait-local-client (client direction until)
  "Pre: owner waiting for transfer after EAGAIN/EINTR. Post: one wait; deadline stays unchanged.
No pin, lease or retry of an acknowledged write; loop rechecks time before next nonblocking transfer."
  (let ((now (local-now (local-client-clock client))) (waiter (local-client-waiter client)))
    (when (>= now until) (error 'protocol-error :reason :local-client-deadline))
    (arcdocdb.io::configura-attesa-io waiter 0 (local-client-socket client) direction)
    (arcdocdb.io::attendi-io waiter (local-wait-milliseconds now until)))
  nil)
