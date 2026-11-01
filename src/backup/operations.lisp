;;; OWNER: one complete copy/check/restore/compare invocation and its exclusive staging namespace.
;;; SHARED: source sessions only; writer, WAL protocol, catalog and request paths are unchanged.
(in-package #:arcdocdb.backup)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-014 REQ-AFF-001 REQ-AFF-004
(declaim (ftype (function (job pathname pathname) list) backup-operation))
(defun backup-operation (job source destination)
  "Pre: admitted disjoint paths, stopped source. Post: complete checked/flushed backup published exclusively.
Source held readonly/locked through publication and resource cleanup; failures preserve staging/uncertainty."
  (with-source job source
    (lambda (report directory)
      (let ((manifest (report-manifest job report)))
        (multiple-value-bind (parent stage leaf) (create-stage job directory destination)
          (loop for row across (manifest-entries manifest) do (copy-entry job directory stage row))
          (write-manifest job stage manifest)
          (with-backup job stage (lambda (verified canonical borrowed)
                                  (declare (ignore verified canonical borrowed)) nil))
          (publish-stage job parent stage leaf)
          (operation-report :backup manifest report (copy-list (getf report :unverified-files))))))))

;;; REQ: REQ-AFF-014 REQ-AFF-001 REQ-AFF-004
(declaim (ftype (function (job pathname pathname) list) restore-operation))
(defun restore-operation (job source destination)
  "Pre: admitted disjoint paths. Post: normal M1 canonical directory verified before exclusive publication.
Invalid backup rejected before stage creation; exact canonical bytes/tails preserved and no source effect."
  (with-backup job source
    (lambda (manifest report directory)
      (multiple-value-bind (parent stage leaf) (create-stage job directory destination)
        (loop for row across (manifest-entries manifest) do (copy-entry job directory stage row t))
        (with-source job stage
          (lambda (canonical borrowed)
            (declare (ignore borrowed))
            (unless (same-summary-p canonical manifest)
              (error 'corruption-detected :reason :backup-restored-summary)) nil))
        (observe job :restore-verified)
        (publish-stage job parent stage leaf)
        (operation-report :restore manifest report)))))

;;; REQ: REQ-AFF-014 REQ-AFF-002 REQ-AFF-004
(declaim (ftype (function (job pathname pathname) list) compare-operation))
(defun compare-operation (job source backup)
  "Pre: admitted disjoint stopped sources. Post: independently verified comparison, differences are not corruption.
Exact equality requires identical canonical summaries and every file byte; derivatives excluded explicitly."
  (with-source job source
    (lambda (report directory)
      (with-backup job backup
        (lambda (manifest canonical backup-directory)
          (declare (ignore canonical))
          (let* ((same (same-summary-p report manifest))
                 (different (if same (different-files job directory backup-directory manifest) (list :canonical-summary))))
            (list :schema-version 1 :kind :m1-backup-comparison
                  :status (if different :different :identical) :differences different
                  :records (getf report :records) :max-csn (getf report :max-csn))))))))
