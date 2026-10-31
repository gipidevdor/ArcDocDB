;;; OWNER: one admitted mutation, immutable old root and preallocated path rows.
(in-package #:arcdocdb.index.disk)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-013 REQ-AFF-008
(declaim (ftype (function (disk-index index index) (values index index &optional)) remove-disk-minimum))
(defun remove-disk-minimum (tree offset depth)
  "Pre: nonempty AVL subtree. Post: new subtree and old minimum node offset.
Depth is checked before each private path row; all new references point backward."
  (let* ((at (disk-path-slot depth)) (work (disk-index-paths tree)))
    (read-disk-node tree offset work at)
    (let ((left (b:leggi-u64 work (+ at +node-left+))) (right (b:leggi-u64 work (+ at +node-right+))))
      (if (zerop left) (values right offset)
          (multiple-value-bind (new minimum) (remove-disk-minimum tree left (1+ depth))
            (values (rebalance-disk-node tree work at new right) minimum))))))

;;; REQ: REQ-IDX-013 REQ-IDX-001 REQ-AFF-008
(declaim (ftype (function (disk-index index index octets index index u32 u32 (member 1 2) u64 u64 index)
                         index) mutate-disk-subtree))
(defun mutate-disk-subtree (tree offset depth key start end high low kind csn location bytes)
  "Pre: stable input, private batch and AVL subtree. Post: persistent PUT/DELETE subtree.
Absent DELETE preserves the old pointer; replacement reuses the owned key. Bound: 128 levels."
  (let* ((at (disk-path-slot depth)) (work (disk-index-paths tree)))
    (when (zerop offset)
      (return-from mutate-disk-subtree
        (if (= kind 2) 0
            (progn (initialize-disk-leaf tree work at key start end high low csn location bytes)
                   (emit-disk-node tree work at 0 0)))))
    (read-disk-node tree offset work at)
    (let ((comparison (compare-disk-key tree work at key start end high low))
          (left (b:leggi-u64 work (+ at +node-left+))) (right (b:leggi-u64 work (+ at +node-right+))))
      (when (and (zerop comparison) (<= csn (b:leggi-u64 work (+ at +node-csn+))))
        (error 'invariant-violation :reason :disk-index-csn-order))
      (cond
        ((minusp comparison)
         (let ((new (mutate-disk-subtree tree left (1+ depth) key start end high low kind csn location bytes)))
           (if (= new left) offset (rebalance-disk-node tree work at new right))))
        ((plusp comparison)
         (let ((new (mutate-disk-subtree tree right (1+ depth) key start end high low kind csn location bytes)))
           (if (= new right) offset (rebalance-disk-node tree work at left new))))
        (t (replace-disk-node tree work at left right depth kind csn location bytes))))))

;;; REQ: REQ-IDX-013 REQ-IDX-001
(declaim (ftype (function (disk-index octets index index index index (member 1 2) u64 u64 index) index)
                replace-disk-node))
(defun replace-disk-node (tree work at left right depth kind csn location bytes)
  "Pre: exact matched node, increasing CSN. Post: persistent replacement or deletion, AVL preserved.
Two-child deletion removes one successor and rebalances within bounded private paths."
  (unless (> csn (b:leggi-u64 work (+ at +node-csn+))) (error 'invariant-violation :reason :disk-index-csn-order))
  (cond ((= kind 1)
         (b:scrivi-u64 work (+ at +node-csn+) csn) (b:scrivi-u64 work (+ at +node-location+) location)
         (b:scrivi-u32 work (+ at +node-record-bytes+) bytes) (emit-disk-node tree work at left right))
        ((zerop left) right)
        ((zerop right) left)
        (t (multiple-value-bind (new minimum) (remove-disk-minimum tree right (1+ depth))
             (read-disk-node tree minimum work at)
             (rebalance-disk-node tree work at left new)))))
