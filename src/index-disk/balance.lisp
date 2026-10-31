;;; OWNER: private path prototypes, at most 128 levels, three headers per level.
(in-package #:arcdocdb.index.disk)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-013 REQ-AFF-008
(declaim (ftype (function (index) index) disk-path-slot))
(defun disk-path-slot (depth)
  "Pre: bounded traversal depth. Post: exclusive prototype/rotation row offset; exhaustion explicit."
  (unless (< depth +height-limit+) (error 'resource-exhausted :reason :disk-index-path-budget))
  (* depth +path-stride+))

;;; REQ: REQ-IDX-013 REQ-AFF-008
(declaim (ftype (function (disk-index octets index index index) index) rotate-disk-left-heavy))
(defun rotate-disk-left-heavy (tree work at left right)
  "Pre: left is two levels taller, each child already AVL. Post: persistent single/double right rotation.
Every emitted child is balanced and precedes its parent; prototypes remain private."
  (read-disk-node tree left work (+ at (* 1 +node-size+)))
  (let ((ll (b:leggi-u64 work (+ at (* 1 +node-size+) +node-left+))) (lr (b:leggi-u64 work (+ at (* 1 +node-size+) +node-right+))))
    (if (>= (disk-node-statistics tree ll) (disk-node-statistics tree lr))
        (emit-disk-node tree work (+ at (* 1 +node-size+)) ll (emit-disk-node tree work at lr right))
        (progn
          (read-disk-node tree lr work (+ at (* 2 +node-size+)))
          (let ((ml (b:leggi-u64 work (+ at (* 2 +node-size+) +node-left+))) (mr (b:leggi-u64 work (+ at (* 2 +node-size+) +node-right+))))
            (emit-disk-node tree work (+ at (* 2 +node-size+))
              (emit-disk-node tree work (+ at (* 1 +node-size+)) ll ml) (emit-disk-node tree work at mr right)))))))

;;; REQ: REQ-IDX-013 REQ-AFF-008
(declaim (ftype (function (disk-index octets index index index) index) rotate-disk-right-heavy))
(defun rotate-disk-right-heavy (tree work at left right)
  "Pre: right is two levels taller, each child already AVL. Post: persistent single/double left rotation.
No root is exposed until the caller delivers the whole fixed batch."
  (read-disk-node tree right work (+ at (* 1 +node-size+)))
  (let ((rl (b:leggi-u64 work (+ at (* 1 +node-size+) +node-left+))) (rr (b:leggi-u64 work (+ at (* 1 +node-size+) +node-right+))))
    (if (>= (disk-node-statistics tree rr) (disk-node-statistics tree rl))
        (emit-disk-node tree work (+ at (* 1 +node-size+)) (emit-disk-node tree work at left rl) rr)
        (progn
          (read-disk-node tree rl work (+ at (* 2 +node-size+)))
          (let ((ml (b:leggi-u64 work (+ at (* 2 +node-size+) +node-left+))) (mr (b:leggi-u64 work (+ at (* 2 +node-size+) +node-right+))))
            (emit-disk-node tree work (+ at (* 2 +node-size+))
              (emit-disk-node tree work at left ml) (emit-disk-node tree work (+ at (* 1 +node-size+)) mr rr)))))))

;;; REQ: REQ-IDX-013 REQ-AFF-008
(declaim (ftype (function (disk-index octets index index index) index) rebalance-disk-node))
(defun rebalance-disk-node (tree work at left right)
  "Pre: one changed AVL child. Post: complete balanced subtree; impossible height gap rejected.
At most three new nodes; no mutation of any old node or key."
  (let ((lh (disk-node-statistics tree left)) (rh (disk-node-statistics tree right)))
    (unless (<= (abs (- lh rh)) 2) (error 'invariant-violation :reason :disk-index-balance-range))
    (cond ((> lh (1+ rh)) (rotate-disk-left-heavy tree work at left right))
          ((> rh (1+ lh)) (rotate-disk-right-heavy tree work at left right))
          (t (emit-disk-node tree work at left right)))))
