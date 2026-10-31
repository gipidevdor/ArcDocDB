;;; OWNER: one actor admits lookup/mutation; immutable file prefix under each published root.
(in-package #:arcdocdb.index.disk)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-013 REQ-LIM-003
(declaim (ftype (function (disk-index) null) reserve-disk-index))
(defun reserve-disk-index (tree)
  "Pre: OPEN idle owner. Post: worst-case fixed mutation append fits the configured file.
Ordinary RESOURCE-EXHAUSTED precedes effects, CSN or faulting the handle."
  (require-disk-index tree)
  (io:verifica-capienza-append (disk-index-append tree) +batch-limit+ +batch-limit+)
  nil)

;;; REQ: REQ-IDX-013 REQ-IDX-001 REQ-AFF-008
(declaim (ftype (function (disk-index index) null) finish-disk-batch))
(defun finish-disk-batch (tree new)
  "Pre: BUSY actor, complete staged subtree. Post: exact append then root/statistics publication.
No flush or data commit; caller's boundary faults every incomplete exit."
  (unless (disk-index-busy tree) (error 'invariant-violation :reason :disk-index-batch-admission))
  (multiple-value-bind (height count key-bytes) (disk-node-statistics tree new)
    (invalidate-disk-tail tree)
    (let ((used (disk-index-used tree)))
      (when (plusp used)
        (unless (= (+ (disk-index-frontier tree) used)
                   (io:append-esatto (disk-index-append tree) (disk-index-batch tree) 0 used))
          (error 'invariant-violation :reason :disk-index-batch-append)))
      (incf (disk-index-frontier tree) used))
    (setf (disk-index-root tree) new (disk-index-height tree) height
          (disk-index-count tree) count (disk-index-key-bytes tree) key-bytes (disk-index-used tree) 0))
  nil)

;;; REQ: REQ-IDX-013 REQ-IDX-001 REQ-AFF-008
(declaim (ftype (function (disk-index octets index index (simple-array (unsigned-byte 64) (5)))
                         (member :live :absent)) lookup-disk-index))
(defun lookup-disk-index (tree key start end output)
  "Pre: idle owner, stable key span and exclusive output. Post: exact LIVE or unchanged-output ABSENT.
Cache misses may block. Every incomplete admitted lookup faults this private handle; no fallback."
  (require-disk-index tree) (b:check-range key start end)
  (unless (<= 1 (- end start) 65535) (error 'invalid-argument :reason :disk-index-key-length))
  (when (or (eq key (disk-index-key tree)) (eq key (disk-index-frames tree)))
    (error 'invalid-argument :reason :disk-index-key-alias))
  (let ((complete nil))
    (setf (disk-index-busy tree) t)
    (unwind-protect
         (multiple-value-bind (high low)
             (arcdocdb.hash64:xxh64 key start end (disk-index-seed-high tree) (disk-index-seed-low tree))
           (multiple-value-prog1 (lookup-disk-tuple tree key start end high low output) (setf complete t)))
      (unless complete (setf (disk-index-state tree) :faulted))
      (setf (disk-index-busy tree) nil))))

;;; REQ: REQ-IDX-013 REQ-IDX-001 REQ-AFF-008
(declaim (ftype (function (disk-index (member 1 2) octets index index u64 u64 index) null) apply-disk-index))
(defun apply-disk-index (tree kind key start end csn location bytes)
  "Pre: owner, canonical committed ordinary record, file reservation complete. Post: appended AVL root.
No data durability point; root changes only after exact append. Incomplete effects fault, never rollback."
  (reserve-disk-index tree) (b:check-range key start end)
  (unless (and (<= 1 (- end start) 65535) (plusp csn) (plusp (ldb (byte 32 32) location)))
    (error 'invalid-argument :reason :disk-index-candidate))
  (let ((complete nil) (old (disk-index-root tree)))
    (setf (disk-index-busy tree) t (disk-index-batch-base tree) (disk-index-frontier tree) (disk-index-used tree) 0)
    (unwind-protect
         (multiple-value-bind (high low)
             (arcdocdb.hash64:xxh64 key start end (disk-index-seed-high tree) (disk-index-seed-low tree))
           (let ((new (mutate-disk-subtree tree old 0 key start end high low kind csn location bytes)))
             (finish-disk-batch tree new)
             (setf complete t)))
      (unless complete (setf (disk-index-state tree) :faulted))
      (setf (disk-index-busy tree) nil (disk-index-used tree) 0)))
  nil)

;;; REQ: REQ-IDX-013 REQ-LIM-003
(declaim (ftype (function (disk-index) index) disk-index-live-bytes))
(defun disk-index-live-bytes (tree)
  "Pre: stable index. Post: conservative compact live-file bound including long-key headers/padding.
Does not count obsolete path copies or process memory; arithmetic stays within the file domain."
  (+ 128 (* (+ +node-size+ +key-header+ 7) (disk-index-count tree)) (disk-index-key-bytes tree)))

;;; REQ: REQ-IDX-013 REQ-AFF-004
(declaim (ftype (function (disk-index) null) close-disk-index))
(defun close-disk-index (tree)
  "Pre: owner with no borrower. Post: both capabilities consumed; repeated close is a no-op.
The engine separately owns removal proof and reports cleanup failures."
  (unless (eq (disk-index-owner tree) sb-thread:*current-thread*) (error 'invalid-argument :reason :disk-index-owner))
  (when (disk-index-busy tree) (error 'invalid-argument :reason :disk-index-admission))
  (unless (eq (disk-index-state tree) :closed)
    (setf (disk-index-state tree) :closed)
    (close-disk-files (disk-index-input tree) (disk-index-append tree) nil))
  nil)
