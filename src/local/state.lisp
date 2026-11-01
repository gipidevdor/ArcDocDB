;;; OWNER: unico attore del servizio; client e connessioni non trasferibili fra thread.
;;; SHARED: nessun pool o contatore globale, buffer finiti per handle.
(in-package #:arcdocdb.local)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IPC-002 REQ-AFF-004
(define-condition request-rejected (arcdocdb.conditions:arcdocdb-error)
  ((status :initarg :status :reader rejection-status :type (integer 1 5)))
  (:documentation "Reports a nonzero status from a decoded local response.
REJECTION-STATUS preserves the wire status (1 through 5). This is a protocol
result; it does not, by itself, establish the effects of a mutating request."))
(define-condition outcome-unknown (arcdocdb.conditions:arcdocdb-error)
  ((cause :initarg :cause :reader unknown-cause :type condition))
  (:documentation "A mutating exchange failed after entering its send/receive phase;
its commit outcome is not confirmed. UNKNOWN-CAUSE retains the underlying failure,
including any client cleanup failure. No rollback or automatic retry is implied."))
(define-condition local-cleanup-error (arcdocdb.conditions:arcdocdb-error)
  ((primary :initarg :primary :reader local-primary :type (or null condition))
   (failures :initarg :failures :reader local-failures :type list))
  (:documentation "Preserves a primary failure, if any, and recorded failures from
releasing local-service or client resources. LOCAL-PRIMARY exposes the primary
condition or NIL; LOCAL-FAILURES retains the cleanup conditions in the order
supplied by the owning boundary."))

;;; REQ: REQ-IPC-002 REQ-LIM-003
(defun local-buffer ()
  "Pre: cold initialization. Post: exclusive buffer for M1 prefix and body."
  (make-array 65540 :element-type '(unsigned-byte 8) :initial-element 0))

;;; REQ: REQ-IPC-002 REQ-AFF-008
(defun local-now (clock)
  "Pre: caller's trusted monotonic clock. Post: verified u64 tick."
  (let ((now (funcall clock)))
    (unless (typep now '(unsigned-byte 64))
      (error 'arcdocdb.conditions:invalid-argument :reason :local-clock))
    now))

;;; REQ: REQ-IPC-002 REQ-LIM-003
(defun local-until (now seconds)
  "Pre: verified NOW tick and fixed duration. Post: absolute deadline without wrap."
  (let ((until (+ now (* seconds internal-time-units-per-second))))
    (unless (typep until '(unsigned-byte 64))
      (error 'arcdocdb.conditions:resource-exhausted :reason :local-deadline-overflow))
    until))

;;; REQ: REQ-IPC-002 REQ-AFF-008
(defstruct (local-connection (:constructor make-local-connection) (:copier nil))
  "Buffers preallocated before the listener, socket and offsets for the actor only."
  socket
  (io-backend nil :read-only t)
  (input (local-buffer) :read-only t)
  (output (local-buffer) :read-only t)
  (value (make-array 60000 :element-type '(unsigned-byte 8) :initial-element 0) :read-only t)
  (space (arcdocdb.cbor:crea-spazio-cbor) :read-only t)
  (group-workspace (make-local-group-workspace) :type local-group-workspace :read-only t)
  (group-limit 8 :type (integer 1 8) :read-only t)
  (write-groups nil :type boolean)
  (read-groups nil :type boolean)
  (versions nil :type boolean)
  (conditional-groups nil :type boolean)
  (state :closed :type (member :closed :hello :welcome :request :pending :response))
  (pending nil :type (or null envelope))
  (received 0 :type b:index)
  (needed 4 :type b:index)
  (written 0 :type b:index)
  (size 0 :type b:index)
  (limit 4096 :type (integer 4096 65536))
  (last-id 0 :type b:u64)
  (deadline 0 :type b:u64)
  (idle 0 :type b:u64)
  (frame-started nil :type boolean))

;;; REQ: REQ-IPC-002 REQ-WAL-002 REQ-LIM-003
(defstruct (local-write-queue (:constructor make-local-write-queue) (:copier nil))
  "One same-turn collector, allocated before listen; at most eight decoded request/response owners."
  (connections (make-array 8 :initial-element nil) :type simple-vector :read-only t)
  (operations (make-array 8 :initial-element nil) :type simple-vector :read-only t)
  (csns (make-array 8 :element-type '(unsigned-byte 64) :initial-element 0)
        :type (simple-array (unsigned-byte 64) (*)) :read-only t)
  (expected (make-array 8 :element-type '(unsigned-byte 64) :initial-element 0)
            :type (simple-array (unsigned-byte 64) (*)) :read-only t)
  (conditions (make-array 8 :element-type '(unsigned-byte 8) :initial-element 0) :type b:octets :read-only t)
  (applied (make-array 8 :element-type '(unsigned-byte 8) :initial-element 0) :type b:octets :read-only t)
  (count 0 :type (integer 0 8))
  (limit 8 :type (integer 1 8) :read-only t))

;;; REQ: REQ-IPC-002 REQ-WAL-002
(declaim (ftype (function (e:motore simple-vector function local-write-queue) null) dispatch-local-ready))
;;; REQ: REQ-IPC-002 REQ-WAL-006
(declaim (ftype (function (e:motore local-write-queue function) null) flush-local-write-queue))

;;; REQ: REQ-IPC-002 REQ-AFF-008
(defstruct (local-client (:constructor make-local-client) (:copier nil))
  "Serial handle; one request in flight and no retry after loss of the response."
  socket
  (waiter (arcdocdb.io::crea-attesa-io 1) :type arcdocdb.io::attesa-io :read-only t)
  (io-backend nil :read-only t)
  (owner sb-thread:*current-thread* :read-only t)
  (clock #'get-internal-real-time :type function :read-only t)
  (input (local-buffer) :read-only t)
  (output (local-buffer) :read-only t)
  (space (arcdocdb.cbor:crea-spazio-cbor) :read-only t)
  (write-groups nil :type boolean :read-only t)
  (read-groups nil :type boolean :read-only t)
  (versions nil :type boolean :read-only t)
  (conditional-groups nil :type boolean :read-only t)
  (group-applied (make-array 8 :element-type '(unsigned-byte 8) :initial-element 0) :type b:octets :read-only t)
  (read-spans (make-array +local-read-group-limit+ :element-type '(unsigned-byte 64) :initial-element 0)
              :type local-read-spans :read-only t)
  (group-csns (make-array 8 :element-type '(unsigned-byte 64) :initial-element 0)
              :type local-group-csns :read-only t)
  (cleanup-failures nil :type list)
  (limit 65536 :type (integer 4096 65536))
  (next-id 1 :type (integer 1 18446744073709551616))
  (state :connecting :type (member :connecting :ready :busy :closed)))
