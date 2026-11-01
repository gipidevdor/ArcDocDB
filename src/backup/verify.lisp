;;; OWNER: immutable compared summaries and locked canonical sources, no operational engine.
;;; SHARED: comparison concerns canonical current M1 bytes, not optional derivatives or application interpretation.
(in-package #:arcdocdb.backup)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-014 REQ-AFF-002
(declaim (ftype (function (entry entry) boolean) same-entry-p))
(defun same-entry-p (a b)
  "Pre: independently derived entries. Post: same canonical name/EOF/prefix; CRC is checked separately against bytes."
  (and (string= (entry-name a) (entry-name b)) (= (entry-size a) (entry-size b))
       (= (entry-prefix a) (entry-prefix b))))

;;; REQ: REQ-AFF-014 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (list manifest) boolean) same-summary-p))
(defun same-summary-p (report manifest)
  "Pre: independently canonical-verified report and decoded complete manifest. Post: exact summary/required-file match.
No CRC-only equality inference, I/O or partial set approved; optional files are outside this profile."
  (let ((actual (report-entries report)) (expected (manifest-entries manifest)))
    (and (= (getf report :version) (manifest-version manifest))
         (= (getf report :records) (manifest-records manifest))
         (= (getf report :max-csn) (manifest-maximum manifest))
         (eq (getf report :max-csn-present) (manifest-present manifest))
         (= (length actual) (length expected))
         (loop for a across actual for b across expected always (same-entry-p a b)))))

;;; REQ: REQ-AFF-014 REQ-AFF-002 REQ-AFF-004
(declaim (ftype (function (job (or pathname io:file-io) function) t) with-backup))
(defun with-backup (job source consumer)
  "Pre: admitted path/capability, stable stopped backup. Post: consumer only after manifest/inventory/CRC/canonical gates.
Source lock held throughout; original conditions propagate without partial success or repair."
  (with-source job source
    (lambda (report directory)
      (observe job :read-manifest (manifest-name))
      (let ((manifest (read-manifest job directory)))
        (verify-entry-files job directory manifest)
        (unless (same-summary-p report manifest)
          (error 'corruption-detected :reason :backup-canonical-mismatch))
        (observe job :backup-verified)
        (funcall consumer manifest report directory)))))

;;; REQ: REQ-AFF-014 REQ-AFF-002 REQ-AFF-004
(declaim (ftype (function (job io:file-io io:file-io manifest) list) different-files))
(defun different-files (job source backup manifest)
  "Pre: both locked/verified and equal required-file summaries. Post: exact byte-different leaf list in order.
All comparisons bounded, readonly and independent of the manifest's CRC collision behavior."
  (let ((different nil))
    (loop for row across (manifest-entries manifest) do
      (let* ((name (entry-name row)) (left (input-file job source name (entry-size row)))
             (right (input-file job backup name (entry-size row))))
        (unless (equal-file-bytes-p job left right (entry-size row)) (push name different))
        (release-file job right) (release-file job left)))
    (nreverse different)))

;;; REQ: REQ-AFF-014 REQ-AFF-008
(declaim (ftype (function (keyword manifest list &optional list) list) operation-report))
(defun operation-report (mode manifest canonical &optional omitted)
  "Pre: all required verification/publication gates completed. Post: detached scalar/list report, no capabilities.
Canonical suffix attention remains explicit; no complete Archivio, authentication or power-loss attestation."
  (list :schema-version 1 :kind :m1-offline-backup :profile :m1-canonical :operation mode :status :ok
        :version (manifest-version manifest) :records (manifest-records manifest)
        :max-csn-present (manifest-present manifest) :max-csn (manifest-maximum manifest)
        :file-count (length (manifest-entries manifest))
        :bytes (loop for row across (manifest-entries manifest) sum (entry-size row))
        :noncanonical-bytes (getf canonical :noncanonical-bytes) :omitted-files omitted
        :pending-source-actions (copy-tree (getf canonical :inventory-actions))
        :canonical-status (if (or (plusp (getf canonical :noncanonical-bytes))
                                  (getf canonical :inventory-actions)) :attention :clean)
        :checksum :crc32c :limits (list :offline-single-serie :canonical-only :no-authentication
                                      :no-online-snapshot :no-durability-attestation :not-full-archivio)))
