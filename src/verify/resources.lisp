;;; OWNER: offline boundary consumes each capability before attempting close.
;;; SHARED: the same nonblocking directory lock as M1, held through final cleanup.
(in-package #:arcdocdb.verify)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-010 REQ-AFF-004
(declaim (ftype (function (inspection string) (values io:file-io b:index &optional)) inspection-input))
(defun inspection-input (inspection name)
  "Pre: locked stable directory, no asynchronous cancellation. Post: owned read-only FD and measured EOF.
Registers the FD before decoding; errors retain stage/file and no existing file is reopened for writing."
  (setf (inspection-file inspection) name)
  (multiple-value-bind (file size)
      (io:apri-lettura-nella-directory (inspection-directory inspection) name
        :max-transfer (inspection-bytes inspection) :max-file-bytes (inspection-bytes inspection))
    (push file (inspection-files inspection))
    (values file size)))

;;; REQ: REQ-AFF-010 REQ-AFF-004
(declaim (ftype (function (inspection) list) close-inspection))
(defun close-inspection (inspection)
  "Pre: all reads finished, exclusive resources. Post: every source/FD receives one close attempt, parent last.
Collects every cleanup condition at this resource boundary; caller signals them before returning a result.
No retry, unlink, truncation, flush, rename or repair, even after failure."
  (let ((failures nil))
    (when (inspection-sources inspection)
      (let ((sources (inspection-sources inspection)))
        (setf (inspection-sources inspection) nil)
        (handler-case (mf:chiudi-fonti-recovery sources) (error (cause) (push cause failures)))))
    (dolist (file (inspection-files inspection))
      (handler-case (io:chiudi file) (error (cause) (push cause failures))))
    (setf (inspection-files inspection) nil (inspection-directory inspection) nil)
    (nreverse failures)))

;;; REQ: REQ-AFF-010 REQ-AFF-011 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (inspection (or string pathname io:file-io) (or null io:backend)) null)
                lock-inspection-directory))
(defun lock-inspection-directory (inspection directory backend)
  "Pre: admitted inspection, source stable, optional caller-owned directory. Post: exclusive source acquired.
Owned directory registered before lock; borrowed capability neither registered for close nor replaced.
Backend mismatch rejected before I/O; original open/lock conditions propagate to the outer boundary."
  (let ((borrowed (typep directory 'io:file-io)))
    (when (and borrowed backend (not (eq backend (io::file-backend directory))))
      (error 'invalid-argument :reason :verify-directory-backend))
    (setf (inspection-stage inspection) :lock
          (inspection-directory inspection) (if borrowed directory (io:apri-directory directory :backend backend)))
    (unless borrowed (push (inspection-directory inspection) (inspection-files inspection)))
    (io:esigi-esclusiva-directory (inspection-directory inspection)))
  nil)

;;; REQ: REQ-AFF-010 REQ-AFF-011 REQ-AFF-014 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function ((or string pathname io:file-io) b:octets b:octets function
                          &key (:max-file-bytes t) (:max-segments t) (:max-records t)
                               (:backend (or null io:backend))) t) call-with-verified-storage-m1))
(defun call-with-verified-storage-m1 (directory archive series consumer &key (max-file-bytes 16777216)
                                     (max-segments 64) (max-records 65536) backend)
  "Pre: stopped M1 store, explicit UUIDs, trusted stable namespace and one caller without asynchronous cancellation.
Post: schema-1 canonical-only report after successful cleanup; CLEAN is scoped, never full Archivio qualification.
The directory lock excludes cooperating engines. Configuration rejected before I/O; other errors are wrapped
with original cause, stage/file, inventory and cleanup failures. Foreign exits still attempt cleanup.
Calls trusted CONSUMER(report, borrowed-directory) only after verification, while exclusion is held.
Consumer must not mutate/close source capabilities or namespace; result returned after cleanup.
An already open directory is borrowed, locked idempotently on the same FD, and never closed here.
No own data/namespace write or durable atomicity point; never starts recovery or admits traffic."
  (let* ((inspection (prepare-inspection archive series max-file-bytes max-segments max-records))
         (result nil) (primary nil) (cleanup nil) (complete nil))
    (unwind-protect
         (handler-case
             (progn
               (lock-inspection-directory inspection directory backend)
               (let ((report (inspect-canonical-storage inspection archive)))
                 (setf (inspection-stage inspection) :consumer
                       result (funcall consumer report (inspection-directory inspection)) complete t)))
           (error (cause) (setf primary cause)))
      (setf cleanup (close-inspection inspection)))
    (when (or primary cleanup)
      (error 'verification-error :reason :verify-failed :primary primary :cleanup cleanup
             :stage (inspection-stage inspection) :file (inspection-file inspection)
             :actions (inspection-actions inspection)))
    (unless complete (error 'invariant-violation :reason :verify-missing-result))
    result))

;;; REQ: REQ-AFF-010 REQ-AFF-014 REQ-AFF-004
(declaim (ftype (function ((or string pathname) b:octets b:octets
                          &key (:max-file-bytes t) (:max-segments t) (:max-records t)
                               (:backend (or null io:backend))) list) verifica-storage-m1))
(defun verifica-storage-m1 (directory archive series &key (max-file-bytes 16777216)
                            (max-segments 64) (max-records 65536) backend)
  "Pre: stopped stable M1 store, UUIDs and bounded configuration. Post: canonical-only report after cleanup.
Same locked verification boundary, no consumer effects, recovery or index construction. Typed errors preserved."
  (call-with-verified-storage-m1 directory archive series
    (lambda (report borrowed) (declare (ignore borrowed)) report)
    :max-file-bytes max-file-bytes :max-segments max-segments :max-records max-records :backend backend))
