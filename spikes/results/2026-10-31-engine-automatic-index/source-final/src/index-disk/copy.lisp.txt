;;; OWNER: two private capabilities; postorder copy emits one new node per live key.
(in-package #:arcdocdb.index.disk)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-013 REQ-AFF-002 REQ-LIM-003
(declaim (ftype (function (disk-index disk-index index index) index) copy-disk-subtree))
(defun copy-disk-subtree (source target offset depth)
  "Pre: both owners BUSY, verified source, empty destination under construction. Post: exact postorder copy.
One node/key batch at a time, O(height) paths, no obsolete node or global key array copied."
  (when (zerop offset) (return-from copy-disk-subtree 0))
  (let* ((at (disk-path-slot depth)) (work (disk-index-paths source)))
    (read-disk-node source offset work at)
    (let* ((left (copy-disk-subtree source target (b:leggi-u64 work (+ at +node-left+)) (1+ depth)))
           (right (copy-disk-subtree source target (b:leggi-u64 work (+ at +node-right+)) (1+ depth)))
           (length (read-disk-key source work at)) (prototype (disk-index-paths target)))
      (io:verifica-capienza-append (disk-index-append target) +batch-limit+ +batch-limit+)
      (setf (disk-index-batch-base target) (disk-index-frontier target) (disk-index-used target) 0)
      (initialize-disk-leaf target prototype at (disk-index-key source) 0 length
        (b:leggi-u32 work (+ at +node-hash-high+)) (b:leggi-u32 work (+ at +node-hash-low+))
        (b:leggi-u64 work (+ at +node-csn+)) (b:leggi-u64 work (+ at +node-location+)) (b:leggi-u32 work (+ at +node-record-bytes+)))
      (let ((new (emit-disk-node target prototype at left right)))
        (finish-disk-batch target new) new))))

;;; REQ: REQ-IDX-013 REQ-AFF-002 REQ-AFF-004
(declaim (ftype (function (disk-index disk-index) null) copy-disk-index))
(defun copy-disk-index (source target)
  "Pre: distinct idle capabilities with equal hash domain, destination empty, peak reserved.
Post: fully verified compact copy with equal count/key bytes; caller still owns publication and cleanup.
No data commit. Every failed admitted copy faults the destination; source bytes remain immutable."
  (require-disk-index source) (require-disk-index target)
  (unless (and (not (eq source target)) (= (disk-index-seed-high source) (disk-index-seed-high target))
               (= (disk-index-seed-low source) (disk-index-seed-low target)))
    (error 'invalid-argument :reason :disk-index-copy-domain))
  (unless (and (zerop (disk-index-root target)) (= 128 (disk-index-frontier target)))
    (error 'invalid-argument :reason :disk-index-copy-nonempty))
  (verify-disk-index source)
  (let ((complete nil))
    (setf (disk-index-busy source) t (disk-index-busy target) t)
    (unwind-protect
         (progn
           (copy-disk-subtree source target (disk-index-root source) 0)
           (unless (and (= (disk-index-count source) (disk-index-count target))
                        (= (disk-index-key-bytes source) (disk-index-key-bytes target)))
             (error 'invariant-violation :reason :disk-index-copy-statistics))
           (setf complete t))
      (unless complete (setf (disk-index-state target) :faulted))
      (setf (disk-index-busy source) nil (disk-index-busy target) nil (disk-index-used target) 0)))
  (verify-disk-index target)
  (verify-disk-copy source target)
  (io:durable-flush (disk-index-append target))
  nil)

;;; REQ: REQ-IDX-013 REQ-AFF-002
(declaim (ftype (function (disk-index disk-index) null) verify-disk-copy))
(defun verify-disk-copy (source target)
  "Pre: distinct idle roots. Post: every normalized key/descriptor compared against the source.
Structural counts alone never certify value preservation. The visitor borrows only source scratch."
  (unless (not (eq source target)) (error 'invalid-argument :reason :disk-index-copy-domain))
  (unless (visit-disk-index source
            (lambda (key start end words)
              (let ((output (disk-index-words target)))
                (unless (and (eq :live (lookup-disk-index target key start end output)) (equalp words output))
                  (error 'invariant-violation :reason :disk-index-copy-mismatch))) nil))
    (error 'invariant-violation :reason :disk-index-copy-cancelled))
  nil)
