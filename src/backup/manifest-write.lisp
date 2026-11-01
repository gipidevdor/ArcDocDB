;;; OWNER: private bounded manifest and encoding buffer, no I/O or external reader.
;;; SHARED: CRC32C kernel only; backup format is separate from canonical storage formats.
(in-package #:arcdocdb.backup)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-014 REQ-AFF-008
(declaim (ftype (function (list) simple-vector) report-entries))
(defun report-entries (report)
  "Pre: canonical verified report. Post: private sorted copy-plan rows for exactly the required files.
No derived/orphan/obsolete file included; source paths are never accepted from external manifest text."
  (let ((rows (list (make-entry (map 'simple-base-string #'identity "control.log")
                              (first (getf report :control)) (second (getf report :control)))
                    (make-entry (map 'simple-base-string #'identity "multiserie.log")
                              (first (getf report :decisions)) (second (getf report :decisions))))))
    (dolist (row (getf report :segments))
      (push (make-entry (mf::nome-fonte-recovery (getf row :id) (getf row :form))
                        (getf row :file-bytes) (getf row :valid-prefix)) rows))
    (coerce (sort rows #'string< :key #'entry-name) 'simple-vector)))

;;; REQ: REQ-AFF-014 REQ-AFF-008
(declaim (ftype (function (job list) manifest) report-manifest))
(defun report-manifest (job report)
  "Pre: canonical report and admitted job. Post: bounded manifest plan, initially zero file CRCs.
RESOURCE-EXHAUSTED before target creation for total-byte or file budget; original source remains untouched."
  (let* ((entries (report-entries report)) (total (loop for row across entries sum (entry-size row))))
    (unless (<= (length entries) (+ 2 (job-segments job)))
      (error 'resource-exhausted :reason :backup-file-budget))
    (when (> total (job-total job)) (error 'resource-exhausted :reason :backup-total-budget))
    (make-manifest (copy-seq (job-archive job)) (copy-seq (job-series job))
                   (getf report :version) (getf report :records) (getf report :max-csn)
                   (getf report :max-csn-present) entries)))

;;; REQ: REQ-AFF-014 REQ-AFF-002
(declaim (ftype (function (b:octets b:index entry) null) encode-entry))
(defun encode-entry (buffer offset row)
  "Pre: zeroed complete 64-byte row span, validated private entry. Post: fixed LE fields/name written.
INVALID-ARGUMENT for invalid spans through binary writers; caller owns all bytes."
  (let ((name (entry-name row)))
    (unless (<= 1 (length name) 24) (error 'invariant-violation :reason :backup-entry-name))
    (setf (aref buffer offset) (length name))
    (b:scrivi-u64 buffer (+ offset 8) (entry-size row))
    (b:scrivi-u32 buffer (+ offset 16) (entry-crc row))
    (b:scrivi-u64 buffer (+ offset 24) (entry-prefix row))
    (dotimes (i (length name)) (setf (aref buffer (+ offset 32 i)) (char-code (char name i)))))
  nil)

;;; REQ: REQ-AFF-014 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (manifest) b:octets) encode-manifest))
(defun encode-manifest (manifest)
  "Pre: admitted private manifest, all copied-file CRCs known. Post: complete independently checksummed bytes.
Allocation bounded by configured file count; no external reader, I/O, durable decision or publication."
  (let* ((entries (manifest-entries manifest)) (size (+ +manifest-header+ (* +manifest-entry+ (length entries))))
         (buffer (make-array size :element-type '(unsigned-byte 8) :initial-element 0)))
    (b:scrivi-u64 buffer 0 +manifest-magic+) (b:scrivi-u32 buffer 8 1)
    (b:scrivi-u32 buffer 12 +manifest-header+)
    (replace buffer (manifest-archive manifest) :start1 16 :end1 32)
    (replace buffer (manifest-series manifest) :start1 32 :end1 48)
    (b:scrivi-u64 buffer 48 (manifest-records manifest)) (b:scrivi-u64 buffer 56 (manifest-maximum manifest))
    (b:scrivi-u32 buffer 64 (length entries))
    (setf (aref buffer 68) (manifest-version manifest) (aref buffer 69) (if (manifest-present manifest) 1 0))
    (b:scrivi-u64 buffer 72 (- size +manifest-header+))
    (dotimes (i (length entries))
      (encode-entry buffer (+ +manifest-header+ (* i +manifest-entry+)) (the entry (svref entries i))))
    (b:scrivi-u32 buffer 80 (b:crc32c buffer +manifest-header+ size))
    (b:scrivi-u32 buffer 84 (b:crc32c buffer 0 84))
    buffer))
