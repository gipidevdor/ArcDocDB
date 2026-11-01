;;; OWNER: one serial engine; cold fixed scratch independent of ACTIVE adoption/rotation.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))
;;; REQ: REQ-TXS-002 REQ-WAL-002 REQ-LIM-003 REQ-AFF-008
(defstruct (conditional-group-workspace (:constructor %make-conditional-group-workspace) (:copier nil))
  "Pre: cold engine construction. Post: eight private projection slots, 208 payload bytes excluding headers.
No new CSN allocator or durable state; request references and scalar results cleared on every exit."
  (operations (make-array 8 :initial-element nil) :type simple-vector :read-only t)
  (positions (make-array 8 :element-type '(unsigned-byte 8) :initial-element 0) :type octets :read-only t)
  (applied (make-array 8 :element-type '(unsigned-byte 8) :initial-element 0) :type octets :read-only t)
  (tokens (make-array 8 :element-type '(unsigned-byte 64) :initial-element 0)
          :type (simple-array (unsigned-byte 64) (*)) :read-only t)
  (csns (make-array 8 :element-type '(unsigned-byte 64) :initial-element 0)
        :type (simple-array (unsigned-byte 64) (*)) :read-only t))
