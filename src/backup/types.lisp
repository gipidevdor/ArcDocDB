;;; OWNER: cold private configuration, bounded buffers and one operation's resource stack.
;;; SHARED: none; manifest values are detached from file capabilities and input buffers.
(in-package #:arcdocdb.backup)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-014 REQ-AFF-002
(defconstant +manifest-header+ 96)
(defconstant +manifest-entry+ 64)
(defconstant +manifest-magic+ #x3130504b42435241)

;;; REQ: REQ-AFF-014 REQ-AFF-008
(declaim (ftype (function () simple-base-string) manifest-name))
(defun manifest-name ()
  "Pre: none. Post: private fixed backup-manifest leaf, no I/O or externally interpreted name."
  (map 'simple-base-string #'identity "backup.manifest"))

;;; REQ: REQ-AFF-014 REQ-AFF-004
(define-condition backup-error (arcdocdb.conditions:arcdocdb-error)
  ((primary :initarg :primary :reader backup-primary :type (or null condition))
   (cleanup :initarg :cleanup :reader backup-cleanup :type list)
   (stage :initarg :stage :reader backup-stage :type keyword)
   (file :initarg :file :reader backup-file :type (or null string))
   (published :initarg :published :reader backup-published :type (member nil t :unknown))
   (durable :initarg :durable :reader backup-durable :type boolean))
  (:documentation "Offline failure preserving cause/cleanup and publication uncertainty; never implies safe retry."))

;;; REQ: REQ-AFF-014 REQ-AFF-008
(defstruct (entry (:constructor make-entry (name size prefix &optional (crc 0))) (:copier nil))
  "Pre: bounded canonical leaf and lengths. Post: private copy-plan row; CRC set before manifest publication."
  (name "" :type simple-base-string :read-only t)
  (size 0 :type b:index :read-only t) (prefix 0 :type b:index :read-only t)
  (crc 0 :type b:u32))

;;; REQ: REQ-AFF-014 REQ-AFF-008
(defstruct (manifest (:constructor make-manifest (archive series version records maximum present entries)) (:copier nil))
  "Pre: verified header/rows or canonical source report. Post: detached bounded manifest, no FD or borrowed bytes."
  (archive #() :type b:octets :read-only t) (series #() :type b:octets :read-only t)
  (version 2 :type (member 1 2) :read-only t) (records 0 :type b:index :read-only t)
  (maximum 0 :type b:u64 :read-only t) (present nil :type boolean :read-only t)
  (entries #() :type simple-vector :read-only t))

;;; REQ: REQ-AFF-014 REQ-AFF-008 REQ-AFF-004
(defstruct (job (:constructor make-job (archive series bytes segments records total left right observer backend)) (:copier nil))
  "Pre: fully admitted cold budgets/identities. Post: private operation, no acquired resources.
Mutated only by this synchronous caller; no asynchronous cancellation during capability acquisition."
  (archive #() :type b:octets :read-only t) (series #() :type b:octets :read-only t)
  (bytes 4096 :type b:index :read-only t) (segments 1 :type b:index :read-only t)
  (records 1 :type b:index :read-only t) (total 1 :type b:index :read-only t)
  (left #() :type b:octets :read-only t) (right #() :type b:octets :read-only t)
  (observer nil :type (or null function) :read-only t) (backend nil :type (or null io:backend) :read-only t)
  (files nil :type list) (stage :configuration :type keyword) (file nil :type (or null string))
  (published nil :type (member nil t :unknown)) (durable nil :type boolean))

;;; REQ: REQ-AFF-014 REQ-AFF-008
(declaim (ftype (function (b:octets b:octets t t t t t (or null function) (or null io:backend)) job) prepare-job))
(defun prepare-job (archive series bytes segments records total buffer observer backend)
  "Pre: typed UUID buffers and untrusted budgets. Post: owned IDs and two fixed transfer buffers.
INVALID-ARGUMENT before allocation or I/O; no whole database/index allocation or clock read."
  (unless (and (= 16 (length archive) (length series))
               (typep bytes '(integer 4096 268435456)) (typep segments '(integer 1 65536))
               (typep records '(integer 1 65536)) (typep total '(integer 1 #.most-positive-fixnum))
               (typep buffer '(integer 4096 8388608)))
    (error 'invalid-argument :reason :backup-configuration))
  (make-job (copy-seq archive) (copy-seq series) bytes segments records total
           (make-array buffer :element-type '(unsigned-byte 8) :initial-element 0)
           (make-array buffer :element-type '(unsigned-byte 8) :initial-element 0) observer backend))
