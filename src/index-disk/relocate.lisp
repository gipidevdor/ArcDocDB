;;; OWNER: same serial index actor; immutable identical version, location-only copy-on-write.
(in-package #:arcdocdb.index.disk)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-004 REQ-IDX-013 REQ-CMP-001
(declaim (ftype (function (disk-index index index octets index index u32 u32
                          (simple-array (unsigned-byte 64) (5)) u64)
                         (values index boolean &optional)) relocate-disk-subtree))
(defun relocate-disk-subtree (tree offset depth key start end high low expected location)
  "Pre: fixed private path, stable expected version. Post: same AVL shape, location-only path copy, or unchanged stale result.
No nodes staged until the matching version is found; depth remains bounded by the existing path geometry."
  (when (zerop offset) (return-from relocate-disk-subtree (values 0 nil)))
  (let* ((at (disk-path-slot depth)) (work (disk-index-paths tree)))
    (read-disk-node tree offset work at)
    (let ((comparison (compare-disk-key tree work at key start end high low))
          (left (b:leggi-u64 work (+ at +node-left+))) (right (b:leggi-u64 work (+ at +node-right+))))
      (cond
        ((zerop comparison)
         (unless (and (= (aref expected 0) (b:leggi-u64 work (+ at +node-csn+)))
                      (= (aref expected 1) (b:leggi-u64 work (+ at +node-location+)))
                      (= (aref expected 3) (b:leggi-u32 work (+ at +node-record-bytes+))))
           (return-from relocate-disk-subtree (values offset nil)))
         (when (= location (aref expected 1)) (return-from relocate-disk-subtree (values offset t)))
         (b:scrivi-u64 work (+ at +node-location+) location)
         (values (emit-disk-node tree work at left right) t))
        (t (multiple-value-bind (new changed)
               (relocate-disk-subtree tree (if (minusp comparison) left right) (1+ depth)
                                      key start end high low expected location)
             (if (or (not changed) (= new (if (minusp comparison) left right))) (values offset changed)
                 (values (emit-disk-node tree work at (if (minusp comparison) new left)
                                                         (if (plusp comparison) new right)) t))))))))

;;; REQ: REQ-IDX-004 REQ-IDX-013 REQ-AFF-004
(declaim (ftype (function (disk-index octets index index (simple-array (unsigned-byte 64) (5)) u64) boolean)
                relocate-disk-index))
(defun relocate-disk-index (tree key start end expected location)
  "Pre: serial owner, identical canonical record durable and expected descriptor private. Post: location-only relocation or NIL stale.
Normal PUT/DELETE CSN guards remain unchanged; unchanged or stale requests do not append. Incomplete effects fault the index."
  (reserve-disk-index tree) (b:check-range key start end)
  (unless (and (<= 1 (- end start) 65535) (= (- end start) (ldb (byte 16 32) (aref expected 2)))
               (plusp (aref expected 0)) (plusp (aref expected 3)) (zerop (aref expected 4))
               (plusp (ldb (byte 32 32) location))
               (not (eq key (disk-index-key tree))) (not (eq key (disk-index-frames tree))))
    (error 'invalid-argument :reason :disk-index-relocation-input))
  (let ((complete nil) (old (disk-index-root tree)))
    (setf (disk-index-busy tree) t (disk-index-batch-base tree) (disk-index-frontier tree) (disk-index-used tree) 0)
    (unwind-protect
         (multiple-value-bind (high low) (arcdocdb.hash64:xxh64 key start end (disk-index-seed-high tree) (disk-index-seed-low tree))
           (multiple-value-bind (new changed) (relocate-disk-subtree tree old 0 key start end high low expected location)
             (when (/= new old) (finish-disk-batch tree new))
             (setf complete t) changed))
      (unless complete (setf (disk-index-state tree) :faulted))
      (setf (disk-index-busy tree) nil (disk-index-used tree) 0))))
