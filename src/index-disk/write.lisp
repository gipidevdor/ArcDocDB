;;; OWNER: bounded staged append; no bytes are reused or overwritten in the derived file.
(in-package #:arcdocdb.index.disk)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-013 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (disk-index index) index) allocate-disk-batch))
(defun allocate-disk-batch (tree bytes)
  "Pre: BUSY owner and aligned positive append. Post: reserved zeroed span in fixed batch, logical offset returned.
RESOURCE-EXHAUSTED before effects if the fixed per-mutation bound is exceeded."
  (unless (and (disk-index-busy tree) (plusp bytes) (zerop (mod bytes 8)))
    (error 'invariant-violation :reason :disk-index-batch-admission))
  (let ((at (disk-index-used tree)))
    (when (> (+ at bytes) +batch-limit+) (error 'resource-exhausted :reason :disk-index-batch-budget))
    (fill (disk-index-batch tree) 0 :start at :end (+ at bytes))
    (incf (disk-index-used tree) bytes)
    (+ (disk-index-batch-base tree) at)))

;;; REQ: REQ-IDX-013 REQ-AFF-002
(declaim (ftype (function (disk-index octets index index) index) append-disk-key))
(defun append-disk-key (tree key start end)
  "Pre: BUSY owner and valid stable key span. Post: checksummed external key staged before its node.
At most 65,568 bytes; no caller key retained after the fixed batch is delivered."
  (b:check-range key start end)
  (unless (<= 1 (- end start) 65535) (error 'invalid-argument :reason :disk-index-key-length))
  (let* ((length (- end start)) (padded (* 8 (ceiling length 8)))
         (offset (allocate-disk-batch tree (+ +key-header+ padded)))
         (at (- offset (disk-index-batch-base tree))) (batch (disk-index-batch tree)))
    (b:scrivi-u32 batch at +key-magic+) (b:scrivi-u32 batch (+ at +key-length+) length)
    (b:scrivi-u64 batch (+ at +key-self+) offset) (b:scrivi-u64 batch (+ at +key-generation+) (disk-index-id tree))
    (replace batch key :start1 (+ at +key-header+) :start2 start :end2 end)
    (b:scrivi-u32 batch (+ at +key-crc+)
      (b:crc32c batch (+ at +key-header+) (+ at +key-header+ padded) (b:crc32c batch at (+ at +key-crc+))))
    offset))

;;; REQ: REQ-IDX-013 REQ-AFF-008
(declaim (ftype (function (disk-index index) (values index index index &optional)) disk-node-statistics))
(defun disk-node-statistics (tree offset)
  "Pre: BUSY owner, optional node. Post: verified height/count/key-byte scalars, zeros for an empty child.
The shared scratch is not borrowed by the caller; errors never authorize a root."
  (unless (disk-index-busy tree) (error 'invariant-violation :reason :disk-index-node-admission))
  (if (zerop offset) (values 0 0 0)
      (let ((scratch (disk-index-node tree)))
        (read-disk-node tree offset scratch 0)
        (values (b:leggi-u32 scratch +node-height+) (b:leggi-u64 scratch +node-count+) (b:leggi-u64 scratch +node-key-bytes+)))))

;;; REQ: REQ-IDX-013 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (disk-index octets index index index) index) emit-disk-node))
(defun emit-disk-node (tree prototype at left right)
  "Pre: immutable key/descriptor prototype, already staged children. Post: balanced checksummed node after children.
Subtree statistics are recomputed with checked bounds; no root publication or data commit."
  (multiple-value-bind (lh lc lb) (disk-node-statistics tree left)
    (multiple-value-bind (rh rc rb) (disk-node-statistics tree right)
      (unless (<= (abs (- lh rh)) 1) (error 'invariant-violation :reason :disk-index-unbalanced-emit))
      (let* ((height (1+ (max lh rh))) (count (+ 1 lc rc))
             (bytes (+ (b:leggi-u32 prototype (+ at +node-key-length+)) lb rb))
             (offset (allocate-disk-batch tree +node-size+))
             (target (- offset (disk-index-batch-base tree))) (batch (disk-index-batch tree)))
        (unless (and (<= height +height-limit+) (< count (ash 1 60)) (< bytes (ash 1 60)))
          (error 'resource-exhausted :reason :disk-index-statistics-range))
        (replace batch prototype :start1 target :end1 (+ target +node-size+) :start2 at)
        (b:scrivi-u32 batch target +node-magic+) (b:scrivi-u32 batch (+ target +node-height+) height)
        (b:scrivi-u64 batch (+ target +node-self+) offset) (b:scrivi-u64 batch (+ target +node-left+) left)
        (b:scrivi-u64 batch (+ target +node-right+) right) (b:scrivi-u64 batch (+ target +node-count+) count)
        (b:scrivi-u64 batch (+ target +node-key-bytes+) bytes) (b:scrivi-u64 batch (+ target +node-generation+) (disk-index-id tree))
        (b:scrivi-u32 batch (+ target +node-crc+) (b:crc32c batch target (+ target +node-crc+)))
        offset))))

;;; REQ: REQ-IDX-013 REQ-IDX-001 REQ-AFF-008
(declaim (ftype (function (disk-index octets index octets index index u32 u32 u64 u64 index) null)
                initialize-disk-leaf))
(defun initialize-disk-leaf (tree prototype at key start end high low csn location bytes)
  "Pre: free path slot and valid PUT descriptor. Post: owned key reference or inline copy, no caller retention.
External key precedes the new leaf; invalid domains reject before staging."
  (unless (and (plusp csn) (plusp (ldb (byte 32 32) location)))
    (error 'invalid-argument :reason :disk-index-candidate))
  (unless (<= (+ arcdocdb.record:+header-bytes+ (- end start) 1) bytes arcdocdb.record:+max-record-bytes+)
    (error 'invalid-argument :reason :disk-index-candidate-size))
  (fill prototype 0 :start at :end (+ at +node-size+))
  (b:scrivi-u64 prototype (+ at +node-csn+) csn) (b:scrivi-u64 prototype (+ at +node-location+) location)
  (b:scrivi-u32 prototype (+ at +node-hash-high+) high) (b:scrivi-u32 prototype (+ at +node-hash-low+) low)
  (b:scrivi-u32 prototype (+ at +node-key-length+) (- end start)) (b:scrivi-u32 prototype (+ at +node-record-bytes+) bytes)
  (if (<= (- end start) +inline-limit+)
      (replace prototype key :start1 (+ at +node-inline+) :start2 start :end2 end)
      (b:scrivi-u64 prototype (+ at +node-key-ref+) (append-disk-key tree key start end)))
  nil)
