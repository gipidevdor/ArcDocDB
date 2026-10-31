;;; OWNER: caller-private, bounded inspection; capabilities never enter the result.
;;; SHARED: only canonical readers are reused; no data or namespace writes.
(in-package #:arcdocdb.verify)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-010 REQ-AFF-004
(define-condition verification-error (arcdocdb.conditions:arcdocdb-error)
  ((primary :initarg :primary :reader verification-primary :type (or null condition))
   (cleanup :initarg :cleanup :reader verification-cleanup :type list)
   (stage :initarg :stage :reader verification-stage :type keyword)
   (file :initarg :file :reader verification-file :type (or null string))
   (actions :initarg :actions :reader verification-actions :type list))
  (:documentation "Offline boundary failure: original condition, stage/file, inventory and all cleanup errors."))

;;; REQ: REQ-AFF-010 REQ-AFF-008
(defstruct (inspection (:constructor make-inspection (view scratch bytes segments records limits)) (:copier nil))
  "Pre: validated cold configuration. Post: private inspection without an open file.
Only this caller changes resources/counters; no callback, runtime or result retains them."
  (view nil :type g:vista-get-serie :read-only t)
  (scratch #() :type b:octets :read-only t)
  (bytes 4096 :type (integer 4096 268435456) :read-only t)
  (segments 1 :type (integer 1 65536) :read-only t)
  (records 1 :type (integer 1 65536) :read-only t)
  (limits nil :type rs:limiti-recovery-serie :read-only t)
  (directory nil :type (or null io:file-io))
  (files nil :type list) (sources nil :type (or null mf::recovery-sources))
  (stage :configuration :type keyword) (file nil :type (or null string))
  (actions nil :type list) (data-count 0 :type b:index) (last-csn 0 :type b:u64)
  (version 2 :type (member 1 2)))

;;; REQ: REQ-AFF-010 REQ-AFF-008
(declaim (ftype (function (b:octets b:index b:index t t) nil) no-inspection-lookup))
(defun no-inspection-lookup (key start end probe output)
  "Pre: inspection view only. Post: never supplies index data; any lookup is a programming error.
INVARIANT-VIOLATION, no I/O, mutation or fallback to an operational engine."
  (declare (ignore key start end probe output))
  (error 'invariant-violation :reason :verify-unexpected-lookup))

;;; REQ: REQ-AFF-010 REQ-AFF-008
(declaim (ftype (function (b:octets b:octets t t t) inspection) prepare-inspection))
(defun prepare-inspection (archive series bytes segments records)
  "Pre: typed UUID buffers and untrusted budgets. Post: bounded private scratch and inspection-only view.
INVALID-ARGUMENT before allocation/I/O; durations are unused, no CSN is ever assigned."
  (unless (and (= 16 (length archive) (length series))
               (typep bytes '(integer 4096 268435456))
               (typep segments '(integer 1 65536)) (typep records '(integer 1 65536)))
    (error 'invalid-argument :reason :verify-configuration))
  (let* ((registry (arcdocdb.csn:crea-registro-csn :capacity 1))
         (scope (g:crea-ambito-get (arcdocdb.epochs:crea-registro-epoche 1 1)
                  (arcdocdb.mvcc:crea-registro-snapshot registry 1 1 1)))
         (view (g:crea-vista-get-serie scope nil nil series :lookup #'no-inspection-lookup))
         (limits (rs:crea-limiti-recovery-serie :max-segmenti segments :budget-riferimenti (* 8 segments)
                   :max-byte-totali (* bytes segments) :max-bytes bytes :max-records records
                   :max-batches records :max-batch-records records :max-batch-bytes bytes
                   :max-prepared 0 :max-outcomes 0 :max-esiti-chiusura 0)))
    (make-inspection view (make-array bytes :element-type '(unsigned-byte 8) :initial-element 0)
                     bytes segments records limits)))
