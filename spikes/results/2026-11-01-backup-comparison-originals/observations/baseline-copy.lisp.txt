;;; OWNER: sequential fixed-size buffers, borrowed locked source and private destination stage.
;;; SHARED: CRC backend only; source files always readonly, no full document index or store materialization.
(in-package #:arcdocdb.backup)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-014 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (job io:file-io b:index &optional (or null io:file-io)) b:u32) stream-file))
(defun stream-file (job source size &optional destination)
  "Pre: exact bounded EOF and exclusive buffers. Post: CRC of all bytes, optionally appended unchanged.
Loop bounded by size/chunk; short read/append rejects, no suffix discarded or durable claim before flush."
  (let* ((buffer (job-left job)) (chunk (length buffer)) (crc 0))
    (loop for offset from 0 below size by chunk for count = (min chunk (- size offset)) do
      (unless (= count (io:leggi-esatto source buffer 0 count offset))
        (error 'corruption-detected :reason :backup-short-read :offset offset))
      (setf crc (b:crc32c buffer 0 count crc))
      (when destination
        (unless (= (+ offset count) (io:append-esatto destination buffer 0 count))
          (error 'invariant-violation :reason :backup-append-frontier))))
    crc))

;;; REQ: REQ-AFF-014 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (job io:file-io io:file-io b:index) boolean) equal-file-bytes-p))
(defun equal-file-bytes-p (job left right size)
  "Pre: readonly files of equal admitted size, same stable verification window. Post: exact byte equality.
Bounded sequential reads; no hash-collision inference, data/index reconstruction or mutation."
  (let ((a (job-left job)) (b (job-right job)))
    (loop for offset from 0 below size by (length a) for count = (min (length a) (- size offset))
          always (progn
                   (unless (and (= count (io:leggi-esatto left a 0 count offset))
                                (= count (io:leggi-esatto right b 0 count offset)))
                     (error 'corruption-detected :reason :backup-short-read :offset offset))
                   (loop for i below count always (= (aref a i) (aref b i)))))))

;;; REQ: REQ-AFF-014 REQ-AFF-001 REQ-AFF-002 REQ-AFF-004
(declaim (ftype (function (job io:file-io io:file-io entry &optional boolean) null) copy-entry))
(defun copy-entry (job source target row &optional verify-crc-p)
  "Pre: verified locked source, exclusive unpublished target. Post: exact flushed/verified canonical file published.
Each new file uses .tmp and exclusive rename; target directory fsync remains a later publication prerequisite.
VERIFY-CRC-P compares the observed copy CRC with the immutable stored expectation, never replacing it.
Source never reopened writable. Errors leave resources registered and partial files intact, without retries."
  (let* ((name (entry-name row)) (temporary (concatenate 'string name ".tmp"))
         (input (input-file job source name (entry-size row)))
         (output (own-file job (io:crea-temporaneo-nella-directory target temporary
                                :max-transfer (length (job-left job)) :max-file-bytes (entry-size row)))))
    (observe job :copy-file name)
    (let ((crc (stream-file job input (entry-size row) output)))
      (if verify-crc-p
          (unless (= crc (entry-crc row)) (error 'corruption-detected :reason :backup-file-crc))
          (setf (entry-crc row) crc)))
    (unless (= (entry-size row) (io:durable-flush output))
      (error 'invariant-violation :reason :backup-file-flush))
    (observe job :file-flushed name)
    (release-file job output)
    (let ((verified (input-file job target temporary (entry-size row))))
      (unless (equal-file-bytes-p job input verified (entry-size row))
        (error 'corruption-detected :reason :backup-copy-mismatch))
      (io:pubblica-temporaneo target verified temporary name)
      (observe job :file-published name)
      (release-file job verified))
    (release-file job input))
  nil)

;;; REQ: REQ-AFF-014 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (job io:file-io manifest) null) verify-entry-files))
(defun verify-entry-files (job directory manifest)
  "Pre: locked canonical source and decoded manifest. Post: exact inventory and CRC for every complete file.
No unlisted object, missing file, shortened or appended file silently accepted; resources bounded/released."
  (let* ((rows (manifest-entries manifest)) (names (io:elenca-directory directory :max-names (+ 3 (job-segments job))))
         (expected (cons (manifest-name) (loop for row across rows collect (entry-name row)))))
    (unless (equal (sort (coerce names 'list) #'string<) (sort expected #'string<))
      (error 'corruption-detected :reason :backup-inventory))
    (loop for row across rows do
      (observe job :verify-file (entry-name row))
      (let ((input (input-file job directory (entry-name row) (entry-size row))))
        (unless (= (entry-crc row) (stream-file job input (entry-size row)))
          (error 'corruption-detected :reason :backup-file-crc))
        (release-file job input))))
  nil)

;;; REQ: REQ-AFF-014 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (job io:file-io) manifest) read-manifest))
(defun read-manifest (job directory)
  "Pre: locked backup source. Post: complete manifest decoded under independent bounded file/name/byte limits.
No external Lisp reader or allocation from unvalidated input lengths; file always registered before reads."
  (let ((limit (+ +manifest-header+ (* +manifest-entry+ (+ 2 (job-segments job))))))
    (multiple-value-bind (input size)
        (io:apri-lettura-nella-directory directory (manifest-name) :max-transfer limit :max-file-bytes limit)
      (own-file job input)
      (let ((buffer (make-array size :element-type '(unsigned-byte 8) :initial-element 0)))
        (unless (= size (io:leggi-esatto input buffer 0 size 0))
          (error 'corruption-detected :reason :backup-manifest-read))
        (let ((manifest (decode-manifest job buffer))) (release-file job input) manifest)))))

;;; REQ: REQ-AFF-014 REQ-AFF-001 REQ-AFF-002
(declaim (ftype (function (job io:file-io manifest) null) write-manifest))
(defun write-manifest (job directory manifest)
  "Pre: every canonical file copied and flushed. Post: complete manifest written, flushed, reread and published.
Publication is inside the private stage; outer directory rename/fsync is the final backup commit."
  (let* ((name (manifest-name)) (temporary (concatenate 'string name ".tmp")) (buffer (encode-manifest manifest))
         (size (length buffer))
         (output (own-file job (io:crea-temporaneo-nella-directory directory temporary
                                :max-transfer size :max-file-bytes size))))
    (unless (= size (io:append-esatto output buffer 0 size) (io:durable-flush output))
      (error 'invariant-violation :reason :backup-manifest-flush))
    (release-file job output)
    (let ((input (input-file job directory temporary size)))
      (let ((readback (make-array size :element-type '(unsigned-byte 8) :initial-element 0)))
        ;; INPUT-FILE transfer budget is chunk-sized; compare sequentially through the common stream.
        (loop for offset from 0 below size by (length (job-left job))
              for count = (min (length (job-left job)) (- size offset)) do
          (unless (= count (io:leggi-esatto input (job-left job) 0 count offset))
            (error 'corruption-detected :reason :backup-manifest-read))
          (replace readback (job-left job) :start1 offset :end1 (+ offset count) :end2 count))
        (unless (equalp buffer readback) (error 'corruption-detected :reason :backup-manifest-copy))
        (decode-manifest job readback))
      (io:pubblica-temporaneo directory input temporary name)
      (release-file job input)))
  nil)
