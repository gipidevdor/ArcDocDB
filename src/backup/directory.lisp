;;; OWNER: private destination under a trusted stable parent; explicit path budgets, no ancestor creation.
;;; SHARED: no mutation of source, no deletion/retry, directory rename only after complete verification.
(in-package #:arcdocdb.backup)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-014 REQ-AFF-008
(declaim (ftype (function ((or string pathname)) pathname) directory-path))
(defun directory-path (path)
  "Pre: caller path and absolute default pathname context. Post: absolute directory syntax, no OS resolution.
INVALID-ARGUMENT for wild/up/back paths or NUL; ancestor identity/stability remains a caller precondition."
  (let ((value (merge-pathnames (uiop:ensure-directory-pathname path) *default-pathname-defaults*)))
    (unless (and (uiop:absolute-pathname-p value) (not (wild-pathname-p value))
                 (notany (lambda (part) (member part '(:up :back))) (pathname-directory value))
                 (not (find #\Null (namestring value))))
      (error 'invalid-argument :reason :backup-path))
    (make-pathname :directory (remove "." (pathname-directory value) :test #'equal)
                   :name nil :type nil :version nil :defaults value)))

;;; REQ: REQ-AFF-014 REQ-AFF-008
(declaim (ftype (function (pathname pathname) null) disjoint-paths))
(defun disjoint-paths (source target)
  "Pre: admitted absolute syntax. Post: neither tree lexically contains the other; no filesystem effects.
INVALID-ARGUMENT on overlap; physical direct aliases checked separately before mkdir."
  (when (or (uiop:subpathp target source) (uiop:subpathp source target))
    (error 'invalid-argument :reason :backup-path-overlap))
  nil)

;;; REQ: REQ-AFF-014 REQ-AFF-001 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (job io:file-io pathname)
                         (values io:file-io io:file-io string &optional)) create-stage))
(defun create-stage (job source destination)
  "Pre: verified locked source, disjoint path configuration. Post: new owned/locked stage and parent/leaf.
Target and stage names must both be absent; same physical source parent rejected before mkdir.
No existing object overwritten or deleted. Namespace stays exclusive through publication."
  (let* ((leaf (car (last (pathname-directory destination))))
         (parent-path (uiop:pathname-parent-directory-pathname destination)))
    (unless (and (stringp leaf) (<= 1 (length leaf) 251))
      (error 'invalid-argument :reason :backup-target-name))
    (io::esigi-nome-foglia leaf)
    (observe job :open-target-parent leaf)
    (let* ((parent (own-file job (io:apri-directory parent-path :backend (job-backend job))))
           (temporary (concatenate 'string leaf ".tmp")) (names (io:elenca-directory parent)))
      (io:verifica-directory-distinte source parent)
      (when (find leaf names :test #'string=) (error 'invalid-argument :reason :backup-target-exists))
      (when (find temporary names :test #'string=) (error 'invalid-argument :reason :backup-stage-exists))
      (observe job :before-stage temporary)
      (let ((stage (own-file job (io:crea-directory-temporanea parent temporary))))
        (io:esigi-esclusiva-directory stage)
        (observe job :stage-created temporary)
        (values parent stage leaf)))))

;;; REQ: REQ-AFF-014 REQ-AFF-001 REQ-AFF-004
(declaim (ftype (function (job io:file-io io:file-io string) null) publish-stage))
(defun publish-stage (job parent stage leaf)
  "Pre: complete content verified, private stage owned/locked. Post: exclusively published and durably named.
Atomic visibility point is directory rename; success only after parent fsync. No overwrite, rollback or retry.
Before ambiguous rename exits PUBLISHED is :UNKNOWN; after a successful return T, durable only after fsync."
  (io:durable-flush stage)
  (observe job :before-publication leaf)
  (setf (job-published job) :unknown)
  (io:pubblica-directory-temporanea parent stage (concatenate 'string leaf ".tmp") leaf)
  (setf (job-published job) t)
  (observe job :directory-published leaf)
  (io:durable-flush parent)
  (setf (job-durable job) t)
  (observe job :directory-durable leaf)
  nil)
