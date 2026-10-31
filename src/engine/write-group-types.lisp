;;; OWNER: one serial M1 actor; borrowed request bytes remain stable until the call returns.
;;; SHARED: existing Serie FIFO and Archivio CSN registry only, one token per operation.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-WAL-002 REQ-LIM-003
(defconstant +engine-write-group-capacity+ 8)

;;; REQ: REQ-WAL-005 REQ-LIM-001 REQ-AFF-008
(defstruct (operazione-scrittura (:constructor %make-operazione-scrittura (kind key value)) (:copier nil))
  "Pre: validated operation descriptor, caller-owned stable key/value bytes. Post: immutable borrowed inputs.
No data copy, CSN, reservation or durable effect; the caller retains ownership until group completion."
  (kind 1 :type (member 1 2) :read-only t)
  (key #() :type octets :read-only t)
  (value nil :type (or null octets) :read-only t))

;;; REQ: REQ-WAL-005 REQ-LIM-001 REQ-AFF-008
(declaim (ftype (function (t octets &optional (or null octets)) operazione-scrittura)
                crea-operazione-scrittura))
(defun crea-operazione-scrittura (kind key &optional value)
  "Pre: PUT with octet value or DELETE without value; borrowed bytes stable until the group returns.
Post: immutable descriptor; engine validates format/budgets before admission. INVALID-ARGUMENT for shape.
This factory allocates a descriptor; it does not encode, commit or retain a capability."
  (unless (and (member kind '(:put :delete)) (if (eq kind :put) (typep value 'octets) (null value)))
    (error 'invalid-argument :reason :engine-group-operation-shape))
  (%make-operazione-scrittura (if (eq kind :put) 1 2) key value))

;;; REQ: REQ-WAL-002 REQ-WAL-006 REQ-IDX-013 REQ-AFF-008
(defstruct (write-group-workspace (:constructor %make-write-group-workspace) (:copier nil))
  "Pre: cold ACTIVE adoption. Post: eight private batches and bounded planning/event arrays.
No caller buffers retained; fragment/event references are cleared after every group exit."
  (batches (make-array 8 :initial-element nil) :type simple-vector :read-only t)
  (events (make-array 8 :initial-element nil) :type simple-vector :read-only t)
  (fragments (make-array 8 :initial-element nil) :type simple-vector :read-only t)
  (present (make-array 8 :element-type '(unsigned-byte 8) :initial-element 0) :type octets :read-only t)
  (slots (make-array 8 :element-type 'fixnum :initial-element -1) :type (simple-array fixnum (*)) :read-only t)
  (generations (make-array 8 :element-type '(unsigned-byte 64) :initial-element 0)
               :type (simple-array (unsigned-byte 64) (*)) :read-only t)
  (csns (make-array 8 :element-type '(unsigned-byte 64) :initial-element 0)
        :type (simple-array (unsigned-byte 64) (*)) :read-only t)
  (offsets (make-array 8 :element-type '(unsigned-byte 64) :initial-element 0)
           :type (simple-array (unsigned-byte 64) (*)) :read-only t)
  (sizes (make-array 8 :element-type '(unsigned-byte 32) :initial-element 0)
         :type (simple-array (unsigned-byte 32) (*)) :read-only t))
