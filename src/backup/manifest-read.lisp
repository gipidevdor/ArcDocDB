;;; OWNER: bounded untrusted input decoded into detached private values, never executed.
;;; SHARED: canonical segment-name parser only; no filename from the input drives I/O before full validation.
(in-package #:arcdocdb.backup)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-014 REQ-AFF-002
(declaim (ftype (function (b:octets b:index b:index) boolean) zero-span-p))
(defun zero-span-p (buffer start end)
  "Pre: verified span. Post: true exactly for all-zero reserved bytes; no mutation or I/O."
  (b:check-range buffer start end)
  (loop for i from start below end always (zerop (aref buffer i))))

;;; REQ: REQ-AFF-014 REQ-AFF-002
(declaim (ftype (function (simple-string) boolean) canonical-name-p))
(defun canonical-name-p (name)
  "Pre: bounded candidate name. Post: true only for the two logs or exact canonical M1 segment spellings.
No path resolution, intern, I/O or externally chosen directory traversal."
  (if (member name '("control.log" "multiserie.log") :test #'string=) t
      (multiple-value-bind (id form) (mf::parse-inventory-segment-name name)
        (and form (<= 1 id #xffffffff) (string= name (mf::nome-fonte-recovery id form))))))

;;; REQ: REQ-AFF-014 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (job b:octets b:index) entry) decode-entry))
(defun decode-entry (job buffer offset)
  "Pre: complete fixed row, envelope already checked. Post: detached validated row, no file opened.
CORRUPTION-DETECTED for kind/name/reserved/prefix damage; RESOURCE-EXHAUSTED for file budget."
  (let* ((count (aref buffer offset)) (size (b:leggi-u64 buffer (+ offset 8)))
         (prefix (b:leggi-u64 buffer (+ offset 24))))
    (unless (and (<= 1 count 24) (zero-span-p buffer (1+ offset) (+ offset 8))
                 (zero-span-p buffer (+ offset 20) (+ offset 24))
                 (zero-span-p buffer (+ offset 32 count) (+ offset 64)) (<= 64 prefix size))
      (error 'corruption-detected :reason :backup-manifest-entry :offset offset))
    (when (> size (job-bytes job)) (error 'resource-exhausted :reason :backup-file-budget :offset offset))
    (let ((name (map 'simple-base-string #'code-char (subseq buffer (+ offset 32) (+ offset 32 count)))))
      (unless (canonical-name-p name) (error 'corruption-detected :reason :backup-manifest-name :offset offset))
      (make-entry name size prefix (b:leggi-u32 buffer (+ offset 16))))))

;;; REQ: REQ-AFF-014 REQ-AFF-002
(declaim (ftype (function (b:octets) null) verify-manifest-header))
(defun verify-manifest-header (buffer)
  "Pre: typed bounded input. Post: complete fixed header, magic/version/size and header CRC verified.
CORRUPTION-DETECTED before any body count or UUID is consumed; no allocation or I/O."
  (unless (>= (length buffer) +manifest-header+)
    (error 'corruption-detected :reason :backup-manifest-truncated))
  (unless (and (= +manifest-magic+ (b:leggi-u64 buffer 0)) (= 1 (b:leggi-u32 buffer 8))
               (= +manifest-header+ (b:leggi-u32 buffer 12))
               (= (b:leggi-u32 buffer 84) (b:crc32c buffer 0 84)))
    (error 'corruption-detected :reason :backup-manifest-header))
  nil)

;;; REQ: REQ-AFF-014 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (job b:octets) b:index) verify-envelope))
(defun verify-envelope (job buffer)
  "Pre: bounded complete manifest input. Post: admitted file count, complete lengths/body CRC/flags.
Corrupt/truncated/trailing bytes rejected before row parsing or allocation from input lengths."
  (verify-manifest-header buffer)
  (let ((count (b:leggi-u32 buffer 64)))
    (unless (<= 3 count (+ 2 (job-segments job)))
      (error 'resource-exhausted :reason :backup-manifest-count))
    (unless (and (= (* count +manifest-entry+) (b:leggi-u64 buffer 72) (- (length buffer) +manifest-header+))
                 (= (b:leggi-u32 buffer 80) (b:crc32c buffer +manifest-header+ (length buffer)))
                 (member (aref buffer 68) '(1 2)) (member (aref buffer 69) '(0 1))
                 (zero-span-p buffer 70 72) (zero-span-p buffer 88 96))
      (error 'corruption-detected :reason :backup-manifest-body))
    count))

;;; REQ: REQ-AFF-014 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (job b:octets b:index) simple-vector) decode-entries))
(defun decode-entries (job buffer count)
  "Pre: checked envelope/count, complete row spans. Post: bounded ordered/unique canonical inventory and total.
All rows verified before return; no missing log, duplicate segment ID or partial plan accepted."
  (let ((entries (make-array count :initial-element nil)) (previous "") (last-id 0) (total 0))
    (dotimes (i count)
      (let* ((row (decode-entry job buffer (+ +manifest-header+ (* i +manifest-entry+)))) (name (entry-name row)))
        (unless (string< previous name) (error 'corruption-detected :reason :backup-manifest-order))
        (multiple-value-bind (id segment-p) (mf::parse-inventory-segment-name name)
          (when segment-p
            (unless (> id last-id) (error 'corruption-detected :reason :backup-manifest-duplicate-segment))
            (setf last-id id)))
        (incf total (entry-size row)) (setf previous name (svref entries i) row)))
    (unless (every (lambda (name) (find name entries :key #'entry-name :test #'string=))
                   '("control.log" "multiserie.log"))
      (error 'corruption-detected :reason :backup-manifest-logs))
    (when (> total (job-total job)) (error 'resource-exhausted :reason :backup-total-budget))
    entries))

;;; REQ: REQ-AFF-014 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (job b:octets) manifest) decode-manifest))
(defun decode-manifest (job buffer)
  "Pre: bounded input and caller UUIDs. Post: complete canonical ordered manifest, all rows/budgets checked.
No partial result, arbitrary names, duplicate segment identities or missing log entries accepted."
  (let* ((count (verify-envelope job buffer)) (entries (decode-entries job buffer count)))
    (unless (and (equalp (job-archive job) (subseq buffer 16 32))
                 (equalp (job-series job) (subseq buffer 32 48)))
      (error 'corruption-detected :reason :backup-manifest-identity))
    (when (> (b:leggi-u64 buffer 48) (* (job-segments job) (job-records job)))
      (error 'resource-exhausted :reason :backup-record-budget))
    (when (and (zerop (aref buffer 69)) (plusp (b:leggi-u64 buffer 56)))
      (error 'corruption-detected :reason :backup-manifest-csn))
    (make-manifest (subseq buffer 16 32) (subseq buffer 32 48) (aref buffer 68)
                   (b:leggi-u64 buffer 48) (b:leggi-u64 buffer 56) (= 1 (aref buffer 69)) entries)))
