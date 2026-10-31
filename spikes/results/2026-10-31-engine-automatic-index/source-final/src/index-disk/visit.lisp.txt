;;; OWNER: bounded private traversal; callback borrows key/words only during one call.
(in-package #:arcdocdb.index.disk)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-013 REQ-AFF-002
(declaim (ftype (function (disk-index octets index function) boolean) visit-disk-node))
(defun visit-disk-node (tree work at visitor)
  "Pre: checked node in its private path row. Post: hash/order checked, callback invoked once.
NIL continues; explicit :STOP cancels without authorizing a partial traversal as verification."
  (let* ((length (read-disk-key tree work at)) (order (disk-index-order tree))
         (high (b:leggi-u32 work (+ at +node-hash-high+))) (low (b:leggi-u32 work (+ at +node-hash-low+)))
         (words (disk-index-words tree)))
    (multiple-value-bind (actual-high actual-low)
        (arcdocdb.hash64:xxh64 (disk-index-key tree) 0 length (disk-index-seed-high tree) (disk-index-seed-low tree))
      (unless (and (= high actual-high) (= low actual-low))
        (error 'corruption-detected :reason :disk-index-key-hash)))
    (when (plusp (aref order 0))
      (unless (minusp (compare-disk-key tree work at (disk-index-previous tree) 0 (aref order 3)
                                       (aref order 1) (aref order 2)))
        (error 'corruption-detected :reason :disk-index-order)))
    (replace (disk-index-previous tree) (disk-index-key tree) :end1 length :end2 length)
    (incf (aref order 0)) (incf (aref order 4) length)
    (setf (aref order 1) high (aref order 2) low (aref order 3) length
          (aref words 0) (b:leggi-u64 work (+ at +node-csn+)) (aref words 1) (b:leggi-u64 work (+ at +node-location+))
          (aref words 2) (logior (ash length 32) (ash 1 48))
          (aref words 3) (b:leggi-u32 work (+ at +node-record-bytes+)) (aref words 4) 0)
    (let ((result (funcall visitor (disk-index-key tree) 0 length words)))
      (unless (member result '(nil :stop)) (error 'invalid-argument :reason :disk-index-visitor-result))
      (null result))))

;;; REQ: REQ-IDX-013 REQ-AFF-002
(declaim (ftype (function (octets index index index index index index index) null) verify-disk-statistics))
(defun verify-disk-statistics (work at lh lc lb rh rc rb)
  "Pre: both children fully traversed. Post: exact AVL height/count/key-byte invariants.
Counts are independent traversal sums, never accepted solely from the node header."
  (unless (and (<= (abs (- lh rh)) 1) (= (b:leggi-u32 work (+ at +node-height+)) (1+ (max lh rh))))
    (error 'corruption-detected :reason :disk-index-balance))
  (unless (and (= (b:leggi-u64 work (+ at +node-count+)) (+ 1 lc rc))
               (= (b:leggi-u64 work (+ at +node-key-bytes+)) (+ (b:leggi-u32 work (+ at +node-key-length+)) lb rb)))
    (error 'corruption-detected :reason :disk-index-subtree-statistics))
  nil)

;;; REQ: REQ-IDX-013 REQ-LIM-003 REQ-AFF-002
(declaim (ftype (function (disk-index index index function) (values index index index boolean &optional)) walk-disk-subtree))
(defun walk-disk-subtree (tree offset depth visitor)
  "Pre: frozen root and private paths. Post: verified subtree statistics or explicit cancellation.
At most 128 recursion levels, no cardinality-sized collection. Backward references preclude cycles."
  (when (zerop offset) (return-from walk-disk-subtree (values 0 0 0 t)))
  (let* ((at (disk-path-slot depth)) (work (disk-index-paths tree)))
    (read-disk-node tree offset work at)
    (multiple-value-bind (lh lc lb done)
        (walk-disk-subtree tree (b:leggi-u64 work (+ at +node-left+)) (1+ depth) visitor)
      (unless done (return-from walk-disk-subtree (values 0 0 0 nil)))
      (unless (visit-disk-node tree work at visitor) (return-from walk-disk-subtree (values 0 0 0 nil)))
      (multiple-value-bind (rh rc rb complete)
          (walk-disk-subtree tree (b:leggi-u64 work (+ at +node-right+)) (1+ depth) visitor)
        (unless complete (return-from walk-disk-subtree (values 0 0 0 nil)))
        (verify-disk-statistics work at lh lc lb rh rc rb)
        (values (1+ (max lh rh)) (+ 1 lc rc) (+ (b:leggi-u32 work (+ at +node-key-length+)) lb rb) t)))))

;;; REQ: REQ-IDX-013 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (disk-index function) boolean) visit-disk-index))
(defun visit-disk-index (tree visitor)
  "Pre: idle owner and non-reentrant borrowed-data callback. Post: T complete and verified, NIL explicitly cancelled.
Every unexpected incomplete exit faults the handle; no partial traversal is mistaken for a full proof."
  (require-disk-index tree)
  (let ((finished nil) (root (disk-index-root tree)) (frontier (disk-index-frontier tree)))
    (setf (disk-index-busy tree) t) (fill (disk-index-order tree) 0)
    (unwind-protect
         (multiple-value-bind (height count bytes complete) (walk-disk-subtree tree root 0 visitor)
           (unless (and (= root (disk-index-root tree)) (= frontier (disk-index-frontier tree)))
             (error 'invariant-violation :reason :disk-index-visitor-mutation))
           (when complete
             (unless (and (= height (disk-index-height tree)) (= count (disk-index-count tree))
                          (= bytes (disk-index-key-bytes tree)))
               (error 'corruption-detected :reason :disk-index-root-statistics)))
           (setf finished t) complete)
      (unless finished (setf (disk-index-state tree) :faulted))
      (setf (disk-index-busy tree) nil))))

;;; REQ: REQ-IDX-013 REQ-AFF-002
(declaim (ftype (function (octets index index (simple-array (unsigned-byte 64) (5))) null) disk-verification-visitor))
(defun disk-verification-visitor (key start end words)
  "Pre: verified borrowed tuple. Post: continue the structural verifier without retaining input."
  (declare (ignore key start end words)) ; Inputs, never ignored error results.
  nil)

;;; REQ: REQ-IDX-013 REQ-AFF-002
(declaim (ftype (function (disk-index) null) verify-disk-index))
(defun verify-disk-index (tree)
  "Pre: idle owner. Post: every reachable node/key, ordering, balance and exact count verified.
An unexpected cancellation cannot produce a proof."
  (unless (visit-disk-index tree #'disk-verification-visitor)
    (error 'invariant-violation :reason :disk-index-verification-cancelled))
  nil)
