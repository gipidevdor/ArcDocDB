;;; OWNER: il controller alloca un banco per frammento; il writer mantiene il suo stato.
;;; SHARED: parole sotto seqlock; salute terminale; stato frozen pubblicato dal writer.
(in-package #:arcdocdb.index.slots)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-IDX-003 REQ-LIM-001
(defconstant +slot-csn+ 0)
(defconstant +slot-location+ 1)
(defconstant +slot-key+ 2)
(defconstant +slot-sequence+ 3)
(defconstant +slot-length+ 4)
(defconstant +slot-end+ 5)
(defconstant +slot-sequence-limit+ (ash 1 62))
(defconstant +slot-attempts+ 8)
(deftype slot-words () '(simple-array (unsigned-byte 64) (*)))
(deftype contenuto-slot () '(simple-array (unsigned-byte 64) (5)))
(deftype slot-index () '(integer 0 65535))

;;; REQ: REQ-IDX-001 REQ-IDX-003 REQ-IDX-005 REQ-LIM-001 REQ-AFF-008
(defstruct (banco-slot (:constructor %make-banco-slot (capacity retained words)) (:copier nil))
  "Pre: contiguous fixed-capacity array, initially empty, sole Serie writer.
Post: five words per primary slot, six per retained slot; no per-entry object.
FAULTED health and FROZEN state are terminal; no external resource owned."
  (capacity 1 :type (integer 1 65536) :read-only t)
  (retained nil :type boolean :read-only t)
  (words (make-array 0 :element-type '(unsigned-byte 64)) :type slot-words :read-only t)
  (state :writable :type (member :writable :frozen))
  (health :open :type (member :open :faulted)))

;;; REQ: REQ-IDX-001 REQ-IDX-005 REQ-LIM-001 REQ-AFF-008
(declaim (ftype (function (&key (:capacity integer) (:retained-p boolean)
                               (:budget-bytes integer)) banco-slot) crea-banco-slot))
(defun crea-banco-slot (&key (capacity 8192) (retained-p nil) (budget-bytes (* 3 1024 1024)))
  "Pre: controller outside lookup, capacity 1..65536 and positive budget.
Post: zeroed preallocated bank; payload-only budget verified before allocation.
INVALID-ARGUMENT for configuration; RESOURCE-EXHAUSTED for payload beyond budget."
  (unless (and (<= 1 capacity 65536) (plusp budget-bytes))
    (error 'invalid-argument :reason :index-slot-configuration))
  (let ((count (* capacity (if retained-p 6 5))))
    (when (> (* count 8) budget-bytes)
      (error 'resource-exhausted :reason :index-slot-memory-budget))
    (%make-banco-slot capacity retained-p
                     (make-array count :element-type '(unsigned-byte 64) :initial-element 0))))
