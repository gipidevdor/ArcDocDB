;;; OWNER: operation boundary owns a LIFO capability stack, child before parent on close.
;;; SHARED: no retry, deletion, source mutation or native fallback on a missing injected callback.
(in-package #:arcdocdb.backup)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-014 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (job io:file-io) io:file-io) own-file))
(defun own-file (job file)
  "Pre: newly acquired capability, no asynchronous cancellation. Post: registered before any further I/O.
No syscall or durable point; boundary will close once after quiescence."
  (push file (job-files job)) file)

;;; REQ: REQ-AFF-014 REQ-AFF-004
(declaim (ftype (function (job io:file-io) null) release-file))
(defun release-file (job file)
  "Pre: registered exclusive capability. Post: consumed before one close; other resources remain registered.
Close error propagates as primary on this normal path; outer failure cleanup never retries this FD."
  (unless (member file (job-files job) :test #'eq)
    (error 'invariant-violation :reason :backup-resource-owner))
  (setf (job-files job) (delete file (job-files job) :test #'eq :count 1))
  (io:chiudi file))

;;; REQ: REQ-AFF-014 REQ-AFF-004
(declaim (ftype (function (job) list) close-job))
(defun close-job (job)
  "Pre: no in-flight use. Post: all registered resources receive one close attempt, parent last.
Collects all conditions at the resource boundary, never masks the primary or removes partial output."
  (let ((failures nil))
    (dolist (file (job-files job))
      (handler-case (io:chiudi file) (error (cause) (push cause failures))))
    (setf (job-files job) nil)
    (nreverse failures)))

;;; REQ: REQ-AFF-014 REQ-AFF-004 REQ-AFF-001
(declaim (ftype (function (job function) t) run-job))
(defun run-job (job function)
  "Pre: admitted job, no acquired resources. Post: consumer result only after successful cleanup.
The offline boundary preserves primary/cleanup, stage/file and publication/durability state.
Foreign exits still attempt all cleanup; no automatic retry/rollback after an uncertain effect."
  (let ((result nil) (primary nil) (cleanup nil) (complete nil))
    (unwind-protect
         (handler-case (setf result (funcall function) complete t)
           (error (cause) (setf primary cause)))
      (setf cleanup (close-job job)))
    (when (or primary cleanup)
      (error 'backup-error :reason :backup-failed :primary primary :cleanup cleanup
             :stage (job-stage job) :file (job-file job) :published (job-published job) :durable (job-durable job)))
    (unless complete (error 'invariant-violation :reason :backup-missing-result))
    result))

;;; REQ: REQ-AFF-014 REQ-AFF-004 REQ-AFF-013
(declaim (ftype (function (job keyword &optional (or null string)) null) observe))
(defun observe (job phase &optional name)
  "Pre: trusted non-reentrant observer or NIL, stable private name. Post: diagnostic phase recorded.
Callback receives phase/name only, must return NIL; errors/foreign exits propagate to the boundary."
  (setf (job-stage job) phase (job-file job) name)
  (when (job-observer job)
    (unless (null (funcall (job-observer job) phase (when name (copy-seq name))))
      (error 'invariant-violation :reason :backup-observer-result)))
  nil)

;;; REQ: REQ-AFF-014 REQ-AFF-008 REQ-AFF-004
(declaim (ftype (function (job io:file-io string b:index) io:file-io) input-file))
(defun input-file (job directory name expected)
  "Pre: locked stable source, admitted size. Post: owned readonly regular file of exactly expected EOF.
FD registered before size rejection; metadata/symlink errors reject without any write or partial approval."
  (multiple-value-bind (file size)
      (io:apri-lettura-nella-directory directory name :max-transfer (length (job-left job))
        :max-file-bytes (max (job-bytes job) (+ +manifest-header+ (* +manifest-entry+ (+ 2 (job-segments job))))))
    (own-file job file)
    (unless (= size expected) (error 'corruption-detected :reason :backup-file-size))
    file))

;;; REQ: REQ-AFF-014 REQ-AFF-008
(declaim (ftype (function (job (or string pathname io:file-io) function) t) with-source))
(defun with-source (job path consumer)
  "Pre: admitted job, stopped stable M1 directory. Post: result after locked canonical verification/consumer/cleanup.
Source capabilities remain read-only; original verifier conditions retained by the outer backup boundary."
  (observe job :verify-canonical)
  (v:call-with-verified-storage-m1 path (job-archive job) (job-series job) consumer
    :max-file-bytes (job-bytes job) :max-segments (job-segments job)
    :max-records (job-records job) :backend (job-backend job)))
