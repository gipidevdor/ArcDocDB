;;; OWNER: controller creates paired capabilities under its exclusive directory lock.
(in-package #:arcdocdb.index.disk)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-013 REQ-AFF-002
(declaim (ftype (function (octets octets octets index u32 u32 index) null) initialize-disk-header))
(defun initialize-disk-header (header archive series id high low size)
  "Pre: 128-byte private header and validated identities. Post: ARCAIX01 domain and CRC, no durable effect.
Wrong geometry/UUIDs reject before mutation."
  (unless (and (= (length header) 128) (= (length archive) 16) (= (length series) 16))
    (error 'invalid-argument :reason :disk-index-header-identity))
  (unless (and (<= 1 id (1- (ash 1 60))) (member size '(4096 16384 65536)))
    (error 'invalid-argument :reason :disk-index-header-domain))
  (fill header 0)
  (b:scrivi-u64 header +header-magic-offset+ +header-magic+) (b:scrivi-u64 header +header-generation+ id)
  (replace header archive :start1 16) (replace header series :start1 32)
  (b:scrivi-u32 header +header-hash-high+ high) (b:scrivi-u32 header +header-hash-low+ low) (b:scrivi-u32 header +header-page-size+ size)
  (b:scrivi-u32 header +header-crc+ (b:crc32c header 0 124))
  nil)

;;; REQ: REQ-IDX-013 REQ-AFF-004
(declaim (ftype (function (io:file-io io:file-io io:file-io string index u32 u32 index index)
                         disk-index) allocate-disk-index))
(defun allocate-disk-index (directory input append name id high low size frames)
  "Pre: paired open files after header, geometry already charged. Post: fixed buffers and empty private root.
Allocation is construction/maintenance only; no capability transfer until return."
  (io:verifica-associazione-file (io:associa-file input append) input append)
  (unless (= 128 (io:posizione-scritta append)) (error 'invariant-violation :reason :disk-index-empty-prefix))
  (%make-disk-index :input input :append append :directory directory :name (map 'simple-base-string #'identity name)
    :id id :seed-high high :seed-low low :size size
    :frames (make-array (* size frames) :element-type '(unsigned-byte 8) :initial-element 0)
    :tags (make-array frames :element-type '(unsigned-byte 64) :initial-element 0)
    :node (make-array 128 :element-type '(unsigned-byte 8) :initial-element 0)
    :scratch (make-array 128 :element-type '(unsigned-byte 8) :initial-element 0)
    :key (make-array 65536 :element-type '(unsigned-byte 8) :initial-element 0)
    :previous (make-array 65536 :element-type '(unsigned-byte 8) :initial-element 0)
    :paths (make-array (* +path-stride+ +height-limit+) :element-type '(unsigned-byte 8) :initial-element 0)
    :batch (make-array +batch-limit+ :element-type '(unsigned-byte 8) :initial-element 0)))

;;; REQ: REQ-IDX-013 REQ-LIM-003 REQ-AFF-004
(declaim (ftype (function (io:file-io string index octets octets u32 u32
                         &key (:page-size t) (:frames t) (:memory-budget t) (:max-bytes t)) disk-index)
                create-disk-index))
(defun create-disk-index (directory name id archive series high low
                         &key (page-size 4096) (frames 16) (memory-budget 16777216) (max-bytes (ash 1 40)))
  "Pre: exclusive directory, fresh reserved temporary name. Post: paired private ARCAIX01 index.
Header creation is preparation, never a data commit. All partial capabilities are closed on failure."
  (unless (and (typep max-bytes '(integer 262272 #.(1- (ash 1 60))))
               (typep memory-budget '(integer 0 #.(1- (ash 1 60)))))
    (error 'invalid-argument :reason :disk-index-file-budget))
  (when (> (disk-index-charge page-size frames) memory-budget)
    (error 'resource-exhausted :reason :disk-index-memory-budget))
  (let ((append nil) (input nil) (complete nil) (primary nil) (header (make-array 128 :element-type '(unsigned-byte 8))))
    (initialize-disk-header header archive series id high low page-size)
    (unwind-protect
         (handler-case (progn
           (setf append (io:crea-temporaneo-nella-directory directory name
                          :max-transfer (max +batch-limit+ page-size) :max-file-bytes max-bytes))
           (unless (= 128 (io:append-esatto append header 0 128))
             (error 'invariant-violation :reason :disk-index-header-write))
           (multiple-value-bind (file eof)
               (io:apri-lettura-nella-directory directory name :max-transfer (max +batch-limit+ page-size)
                                                :max-file-bytes max-bytes)
             (setf input file)
             (unless (= 128 eof) (error 'invariant-violation :reason :disk-index-header-eof)))
           (let ((tree (allocate-disk-index directory input append name id high low page-size frames)))
             (unless (= 128 (io:leggi-esatto input (disk-index-scratch tree) 0 128 0))
               (error 'invariant-violation :reason :disk-index-header-readback))
             (unless (equalp header (disk-index-scratch tree))
               (error 'corruption-detected :reason :disk-index-header-readback))
             (setf complete t) tree))
           (error (condition) (setf primary condition) (error condition)))
      (unless complete (close-disk-files input append primary)))))
