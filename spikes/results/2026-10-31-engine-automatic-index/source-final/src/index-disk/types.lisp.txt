;;; OWNER: fixed buffers belong to one index capability and one actor.
;;; SHARED: no buffer/frame escapes lookup or mutation.
(in-package #:arcdocdb.index.disk)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-013
(defconstant +header-magic+ #x3130584941435241)
(defconstant +node-magic+ #x4e584941)
(defconstant +key-magic+ #x4b584941)
(defconstant +node-size+ 128)
(defconstant +key-header+ 32)
(defconstant +height-limit+ 128)
(defconstant +batch-limit+ 262144)
(defconstant +path-stride+ 512)
(defconstant +inline-limit+ 24)

;;; REQ: REQ-IDX-013
(defconstant +file-header-size+ 128)
;;; REQ: REQ-IDX-013
(defconstant +node-magic-offset+ 0)
;;; REQ: REQ-IDX-013
(defconstant +node-height+ 4)
;;; REQ: REQ-IDX-013
(defconstant +node-self+ 8)
;;; REQ: REQ-IDX-013
(defconstant +node-left+ 16)
;;; REQ: REQ-IDX-013
(defconstant +node-right+ 24)
;;; REQ: REQ-IDX-013
(defconstant +node-csn+ 32)
;;; REQ: REQ-IDX-013
(defconstant +node-location+ 40)
;;; REQ: REQ-IDX-013
(defconstant +node-segment+ 44)
;;; REQ: REQ-IDX-013
(defconstant +node-hash-high+ 48)
;;; REQ: REQ-IDX-013
(defconstant +node-hash-low+ 52)
;;; REQ: REQ-IDX-013
(defconstant +node-key-ref+ 56)
;;; REQ: REQ-IDX-013
(defconstant +node-key-length+ 64)
;;; REQ: REQ-IDX-013
(defconstant +node-record-bytes+ 68)
;;; REQ: REQ-IDX-013
(defconstant +node-count+ 72)
;;; REQ: REQ-IDX-013
(defconstant +node-key-bytes+ 80)
;;; REQ: REQ-IDX-013
(defconstant +node-generation+ 88)
;;; REQ: REQ-IDX-013
(defconstant +node-inline+ 96)
;;; REQ: REQ-IDX-013
(defconstant +node-reserved+ 120)
;;; REQ: REQ-IDX-013
(defconstant +node-crc+ 124)
;;; REQ: REQ-IDX-013
(defconstant +key-magic-offset+ 0)
;;; REQ: REQ-IDX-013
(defconstant +key-length+ 4)
;;; REQ: REQ-IDX-013
(defconstant +key-self+ 8)
;;; REQ: REQ-IDX-013
(defconstant +key-generation+ 16)
;;; REQ: REQ-IDX-013
(defconstant +key-reserved+ 24)
;;; REQ: REQ-IDX-013
(defconstant +key-crc+ 28)
;;; REQ: REQ-IDX-013
(defconstant +header-magic-offset+ 0)
;;; REQ: REQ-IDX-013
(defconstant +header-generation+ 8)
;;; REQ: REQ-IDX-013
(defconstant +header-archive+ 16)
;;; REQ: REQ-IDX-013
(defconstant +header-series+ 32)
;;; REQ: REQ-IDX-013
(defconstant +header-hash-high+ 48)
;;; REQ: REQ-IDX-013
(defconstant +header-hash-low+ 52)
;;; REQ: REQ-IDX-013
(defconstant +header-page-size+ 56)
;;; REQ: REQ-IDX-013
(defconstant +header-crc+ 124)

;;; REQ: REQ-IDX-013 REQ-LIM-003
(defstruct (disk-index (:constructor %make-disk-index) (:copier nil))
  "Pre: validated owned input/append pair and reserved fixed buffers. Post: private empty root.
The volatile root is never a recovery authority; partial operations make this handle FAULTED."
  (owner sb-thread:*current-thread* :type sb-thread:thread :read-only t)
  (input nil :type io:file-io :read-only t) (append nil :type io:file-io :read-only t)
  (directory nil :type io:file-io :read-only t) (name "" :type simple-base-string :read-only t)
  (id 1 :type (integer 1 #.(1- (ash 1 60))) :read-only t)
  (seed-high 0 :type u32 :read-only t) (seed-low 0 :type u32 :read-only t)
  (size 4096 :type (member 4096 16384 65536) :read-only t)
  (frames #() :type octets :read-only t)
  (tags #() :type (simple-array (unsigned-byte 64) (*)) :read-only t)
  (cursor 0 :type index)
  (node #() :type octets :read-only t) (key #() :type octets :read-only t)
  (previous #() :type octets :read-only t)
  (order (make-array 5 :element-type '(unsigned-byte 64) :initial-element 0)
         :type (simple-array (unsigned-byte 64) (5)) :read-only t)
  (words (make-array 5 :element-type '(unsigned-byte 64) :initial-element 0)
         :type (simple-array (unsigned-byte 64) (5)) :read-only t)
  (paths #() :type octets :read-only t) (scratch #() :type octets :read-only t)
  (batch #() :type octets :read-only t) (batch-base 128 :type index) (used 0 :type index)
  (root 0 :type index) (count 0 :type index) (key-bytes 0 :type index) (height 0 :type (integer 0 128))
  (cache-hits 0 :type index) (cache-misses 0 :type index) (cache-evictions 0 :type index)
  (frontier 128 :type index) (busy nil :type boolean)
  (state :open :type (member :open :faulted :closed)))

;;; REQ: REQ-IDX-013 REQ-LIM-003
(declaim (ftype (function (t t) index) disk-index-charge))
(defun disk-index-charge (size frames)
  "Pre: untrusted geometry. Post: charged fixed arrays plus conservative 64-KiB object allowance.
INVALID-ARGUMENT before allocation; this is an owned-index reservation, not process RSS."
  (unless (and (member size '(4096 16384 65536)) (typep frames '(integer 1 4096)))
    (error 'invalid-argument :reason :disk-index-cache-geometry))
  (+ (* size frames) (* 8 frames) +batch-limit+ (* +path-stride+ +height-limit+) 131072 384 80 65536))

;;; REQ: REQ-IDX-013 REQ-LIM-003
(declaim (ftype (function () index) disk-index-batch-limit))
(defun disk-index-batch-limit () "Pre: none. Post: maximum reserved append bytes for one mutation." +batch-limit+)

;;; REQ: REQ-IDX-013 REQ-AFF-008
(declaim (ftype (function (disk-index) null) require-disk-index))
(defun require-disk-index (tree)
  "Pre: capability. Post: exact owner, OPEN and idle; invalid calls have no effects."
  (unless (eq (disk-index-owner tree) sb-thread:*current-thread*)
    (error 'invalid-argument :reason :disk-index-owner))
  (unless (and (eq (disk-index-state tree) :open) (not (disk-index-busy tree)))
    (error 'invalid-argument :reason :disk-index-admission))
  (io::esigi-aperto (disk-index-input tree) :input)
  (io::esigi-aperto (disk-index-append tree) :append)
  nil)

;;; REQ: REQ-IDX-013 REQ-AFF-004
(define-condition disk-cleanup-error (arcdocdb.conditions:arcdocdb-error)
  ((primary :initarg :primary :reader disk-cleanup-primary :type (or null condition))
   (errors :initarg :errors :reader disk-cleanup-errors :type list))
  (:documentation "All attempted close failures, preserving the construction's primary condition."))

;;; REQ: REQ-IDX-013 REQ-AFF-004
(declaim (ftype (function ((or null io:file-io) (or null io:file-io) (or null condition)) null) close-disk-files))
(defun close-disk-files (input append primary)
  "Pre: owned capabilities, no borrower. Post: both closes attempted once; primary and every cleanup error preserved.
The caller removes only positively identified derived leaves separately."
  (let ((errors nil))
    (when input (handler-case (io:chiudi input) (error (condition) (push condition errors))))
    (when append (handler-case (io:chiudi append) (error (condition) (push condition errors))))
    (when errors (error 'disk-cleanup-error :reason :disk-index-close :primary primary :errors (nreverse errors))))
  nil)
