;;; OWNER: header and key copies are private; no cache frame is exposed to the caller.
(in-package #:arcdocdb.index.disk)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-013 REQ-AFF-002
(declaim (ftype (function (octets index) null) validate-disk-node-fields))
(defun validate-disk-node-fields (target at)
  "Pre: CRC/domain checked header. Post: bounded height, descriptor and subtree statistics.
Malformed normalized fields are corruption, never an absent key."
  (let ((length (b:leggi-u32 target (+ at +node-key-length+))))
    (unless (and (<= 1 (b:leggi-u32 target (+ at +node-height+)) +height-limit+) (<= 1 length 65535)
                 (plusp (b:leggi-u64 target (+ at +node-csn+))) (plusp (b:leggi-u32 target (+ at +node-segment+))))
      (error 'corruption-detected :reason :disk-index-node-fields))
    (unless (and (<= (+ arcdocdb.record:+header-bytes+ length 1) (b:leggi-u32 target (+ at +node-record-bytes+))
                     arcdocdb.record:+max-record-bytes+)
                 (<= 1 (b:leggi-u64 target (+ at +node-count+)) (1- (ash 1 60)))
                 (<= length (b:leggi-u64 target (+ at +node-key-bytes+)) (1- (ash 1 60)))
                 (zerop (b:leggi-u32 target (+ at +node-reserved+))))
      (error 'corruption-detected :reason :disk-index-node-fields)))
  nil)

;;; REQ: REQ-IDX-013 REQ-AFF-002
(declaim (ftype (function (octets index index) null) validate-disk-node-links))
(defun validate-disk-node-links (target at offset)
  "Pre: checked numeric fields. Post: backward aligned references and canonical inline/external form.
Every nonzero reference precedes the node, preventing cycles without a visited-set allocation."
  (let ((length (b:leggi-u32 target (+ at +node-key-length+))) (key (b:leggi-u64 target (+ at +node-key-ref+))))
    (unless (if (<= length +inline-limit+) (zerop key)
                (and (<= 128 key) (<= (+ key +key-header+ (* 8 (ceiling length 8))) offset) (zerop (mod key 8))))
      (error 'corruption-detected :reason :disk-index-key-reference)))
  (dotimes (i 2)
    (let ((child (b:leggi-u64 target (+ at +node-left+ (* i 8)))))
      (unless (or (zerop child) (and (<= 128 child) (<= (+ child +node-size+) offset) (zerop (mod child 8))))
        (error 'corruption-detected :reason :disk-index-child-reference))))
  nil)

;;; REQ: REQ-IDX-013 REQ-AFF-002
(declaim (ftype (function (disk-index index octets index) null) read-disk-node))
(defun read-disk-node (tree offset target at)
  "Pre: BUSY owner, nonzero node reference. Post: complete CRC/domain/bounds checked header.
Every child and external-key reference points backward; malformed records are corruption."
  (unless (and (>= offset 128) (zerop (mod offset 8)))
    (error 'corruption-detected :reason :disk-index-node-reference))
  (copy-disk-bytes tree offset target at +node-size+)
  (unless (and (= (b:leggi-u32 target at) +node-magic+)
               (= (b:leggi-u64 target (+ at +node-self+)) offset)
               (= (b:leggi-u64 target (+ at +node-generation+)) (disk-index-id tree))
               (= (b:leggi-u32 target (+ at +node-crc+)) (b:crc32c target at (+ at +node-crc+))))
    (error 'corruption-detected :reason :disk-index-node-crc-domain))
  (validate-disk-node-fields target at)
  (validate-disk-node-links target at offset)
  nil)

;;; REQ: REQ-IDX-013 REQ-AFF-002
(declaim (ftype (function (disk-index index index) null) read-external-disk-key))
(defun read-external-disk-key (tree ref length)
  "Pre: verified backward key reference. Post: checked complete body in key scratch.
CRC covers header and padded body; zero padding is canonical."
  (let* ((header (disk-index-scratch tree)) (padded (* 8 (ceiling length 8))) (key (disk-index-key tree)))
    (copy-disk-bytes tree ref header 0 +key-header+)
    (unless (and (= (b:leggi-u32 header +key-magic-offset+) +key-magic+) (= (b:leggi-u32 header +key-length+) length)
                 (= (b:leggi-u64 header +key-self+) ref) (= (b:leggi-u64 header +key-generation+) (disk-index-id tree))
                 (zerop (b:leggi-u32 header +key-reserved+)))
      (error 'corruption-detected :reason :disk-index-key-domain))
    (copy-disk-bytes tree (+ ref +key-header+) key 0 padded)
    (unless (= (b:leggi-u32 header +key-crc+) (b:crc32c key 0 padded (b:crc32c header 0 28)))
      (error 'corruption-detected :reason :disk-index-key-crc))
    (loop for i from length below padded do
      (unless (zerop (aref key i)) (error 'corruption-detected :reason :disk-index-key-padding))))
  nil)

;;; REQ: REQ-IDX-013 REQ-AFF-002
(declaim (ftype (function (disk-index octets index) index) read-disk-key))
(defun read-disk-key (tree node at)
  "Pre: verified node header. Post: exact key in owned scratch, including full external CRC/padding.
At most 65,536 body bytes; no caller or frame reference retained."
  (let* ((length (b:leggi-u32 node (+ at +node-key-length+))) (key (disk-index-key tree))
         (ref (b:leggi-u64 node (+ at +node-key-ref+))))
    (unless (<= 1 length 65535) (error 'corruption-detected :reason :disk-index-key-length))
    (if (zerop ref)
        (replace key node :start2 (+ at +node-inline+) :end2 (+ at +node-inline+ length))
        (read-external-disk-key tree ref length))
    length))

;;; REQ: REQ-IDX-013 REQ-IDX-001
(declaim (ftype (function (disk-index octets index octets index index u32 u32) (integer -1 1)) compare-disk-key))
(defun compare-disk-key (tree node at key start end high low)
  "Pre: verified node, valid input span. Post: tuple order (hash high/low, length, exact bytes).
Digest equality never replaces key comparison; external keys are fully verified before comparison."
  (let ((actual-high (b:leggi-u32 node (+ at +node-hash-high+))) (actual-low (b:leggi-u32 node (+ at +node-hash-low+)))
        (length (b:leggi-u32 node (+ at +node-key-length+))))
    (cond ((< high actual-high) -1) ((> high actual-high) 1)
          ((< low actual-low) -1) ((> low actual-low) 1)
          ((< (- end start) length) -1) ((> (- end start) length) 1)
          (t (read-disk-key tree node at)
             (let ((stored (disk-index-key tree)))
               (dotimes (i length)
                 (when (< (aref key (+ start i)) (aref stored i)) (return-from compare-disk-key -1))
                 (when (> (aref key (+ start i)) (aref stored i)) (return-from compare-disk-key 1)))
               0)))))

;;; REQ: REQ-IDX-013 REQ-IDX-001 REQ-AFF-002
(declaim (ftype (function (disk-index octets index index u32 u32 (simple-array (unsigned-byte 64) (5)))
                         (member :live :absent)) lookup-disk-tuple))
(defun lookup-disk-tuple (tree key start end high low output)
  "Pre: BUSY owner and private five-word output. Post: exact current descriptor or absence with output untouched.
Traversal is bounded by 128 nodes; misses never hide an exhausted/corrupt path."
  (let ((offset (disk-index-root tree)) (node (disk-index-node tree)) (ceiling (1+ +height-limit+)))
    (loop repeat +height-limit+ while (plusp offset) do
      (read-disk-node tree offset node 0)
      (let ((height (b:leggi-u32 node +node-height+)))
        (unless (< height ceiling) (error 'corruption-detected :reason :disk-index-height-order))
        (setf ceiling height))
      (let ((comparison (compare-disk-key tree node 0 key start end high low)))
        (when (zerop comparison)
          (setf (aref output 0) (b:leggi-u64 node +node-csn+) (aref output 1) (b:leggi-u64 node +node-location+)
                (aref output 2) (logior (ash (- end start) 32) (ash 1 48))
                (aref output 3) (b:leggi-u32 node +node-record-bytes+) (aref output 4) 0)
          (return-from lookup-disk-tuple :live))
        (setf offset (b:leggi-u64 node (if (minusp comparison) 16 24)))))
    (unless (zerop offset) (error 'resource-exhausted :reason :disk-index-path-budget))
    :absent))
