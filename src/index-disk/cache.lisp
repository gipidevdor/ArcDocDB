;;; OWNER: private FIFO, single actor; records are checked after copying from opaque frames.
;;; SHARED: none; partial tail frames are invalidated before every append.
(in-package #:arcdocdb.index.disk)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-013 REQ-AFF-002 REQ-LIM-003
(declaim (ftype (function (disk-index index) index) cached-page))
(defun cached-page (tree page)
  "Pre: BUSY owner and page starts within the written prefix. Post: private frame offset.
Loading may block; no borrowed frame is retained across another cache access."
  (unless (disk-index-busy tree) (error 'invariant-violation :reason :disk-index-cache-admission))
  (unless (< (* page (disk-index-size tree)) (disk-index-frontier tree))
    (error 'corruption-detected :reason :disk-index-page-range))
  (let* ((tags (disk-index-tags tree)) (slot (position (1+ page) tags))
         (size (disk-index-size tree)) (frames (disk-index-frames tree)))
    (if slot
        (when (< (disk-index-cache-hits tree) most-positive-fixnum) (incf (disk-index-cache-hits tree)))
        (when (< (disk-index-cache-misses tree) most-positive-fixnum) (incf (disk-index-cache-misses tree))))
    (unless slot
      (when (and (plusp (aref tags (disk-index-cursor tree))) (< (disk-index-cache-evictions tree) most-positive-fixnum))
        (incf (disk-index-cache-evictions tree)))
      (setf slot (disk-index-cursor tree) (aref tags slot) 0)
      (let* ((start (* slot size)) (offset (* page size))
             (count (min size (- (disk-index-frontier tree) offset))))
        (fill frames 0 :start start :end (+ start size))
        (unless (= (+ start count) (io:leggi-esatto (disk-index-input tree) frames start (+ start count) offset))
          (error 'invariant-violation :reason :disk-index-cache-read))
        (setf (aref tags slot) (1+ page) (disk-index-cursor tree) (mod (1+ slot) (length tags)))))
    (* slot size)))

;;; REQ: REQ-IDX-013 REQ-AFF-002 REQ-LIM-003
(declaim (ftype (function (disk-index index octets index index) null) copy-disk-bytes))
(defun copy-disk-bytes (tree offset target start count)
  "Pre: exclusive target, BUSY owner. Post: exact private copy from written or staged bytes.
Bounds are checked before effects; finite page loop, no frame reference escapes."
  (b:check-range target start (+ start count))
  (unless (and (disk-index-busy tree) (<= 128 offset)
               (<= (+ offset count) (max (disk-index-frontier tree)
                                        (+ (disk-index-batch-base tree) (disk-index-used tree)))))
    (error 'corruption-detected :reason :disk-index-byte-range))
  (when (and (< offset (disk-index-frontier tree)) (> (+ offset count) (disk-index-frontier tree)))
    (error 'corruption-detected :reason :disk-index-cross-frontier))
  (if (>= offset (disk-index-frontier tree))
      (replace target (disk-index-batch tree) :start1 start :end1 (+ start count)
               :start2 (- offset (disk-index-batch-base tree)))
      (let ((size (disk-index-size tree)) (remaining count) (position offset) (output start))
        (loop repeat (1+ (ceiling count size)) while (plusp remaining) do
          (multiple-value-bind (page within) (floor position size)
            (let* ((frame (cached-page tree page)) (take (min remaining (- size within))))
              (replace target (disk-index-frames tree) :start1 output :end1 (+ output take)
                       :start2 (+ frame within))
              (incf position take) (incf output take) (decf remaining take))))
        (unless (zerop remaining) (error 'invariant-violation :reason :disk-index-copy-bound))))
  nil)

;;; REQ: REQ-IDX-013 REQ-AFF-008
(declaim (ftype (function (disk-index) null) invalidate-disk-tail))
(defun invalidate-disk-tail (tree)
  "Pre: BUSY owner, old prefix still authoritative. Post: every potentially extended frame invalidated.
Only cache metadata changes; loop is bounded by configured frames."
  (unless (disk-index-busy tree) (error 'invariant-violation :reason :disk-index-cache-admission))
  (let ((first (floor (disk-index-frontier tree) (disk-index-size tree))) (tags (disk-index-tags tree)))
    (dotimes (i (length tags))
      (when (> (aref tags i) first) (setf (aref tags i) 0))))
  nil)
