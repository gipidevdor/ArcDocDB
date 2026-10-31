;;;; Merge bottom-up limitato dalla lunghezza; solo vettori privati di costruzione.
(in-package #:arcdocdb.recovery.decisions)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-TXM-005 REQ-FOR-003 REQ-AFF-008
(declaim (ftype (function (octets index octets index) (values (member -1 0 1) &optional))
                compare-id16))
(defun compare-id16 (left left-start right right-start)
  "Pre: two ID16 values in their respective stable buffers. Post: exact lexicographic order.
INVALID-ARGUMENT for an unavailable range; no copy or modification."
  (check-range left left-start (+ left-start +participant-id-bytes+))
  (check-range right right-start (+ right-start +participant-id-bytes+))
  (dotimes (i +participant-id-bytes+ 0)
    (let ((a (aref left (+ left-start i))) (b (aref right (+ right-start i))))
      (when (/= a b) (return-from compare-id16 (if (< a b) -1 1))))))

;;; REQ: REQ-TXM-005 REQ-AFF-008
(declaim (ftype (function (octets index octets index) null) copy-id16))
(defun copy-id16 (target target-index source source-index)
  "Pre: distinct private vectors; indices expressed in ID16 units. Post: one ID copied exactly.
INVALID-ARGUMENT for an invalid range, before modification; no I/O."
  (let ((to (* target-index +participant-id-bytes+)) (from (* source-index +participant-id-bytes+)))
    (check-range target to (+ to +participant-id-bytes+))
    (check-range source from (+ from +participant-id-bytes+))
    (replace target source :start1 to :end1 (+ to +participant-id-bytes+)
                          :start2 from :end2 (+ from +participant-id-bytes+)))
  nil)

;;; REQ: REQ-TXM-005 REQ-AFF-008 REQ-VAL-001
(declaim (ftype (function (octets octets index index index) null) merge-id-runs))
(defun merge-id-runs (source target left middle right)
  "Pre: distinct private vectors of the same size; two sorted ID16 runs.
Post: complete merged run in TARGET; source unchanged, loops bounded by RIGHT-LEFT.
Signals INVARIANT-VIOLATION for an inconsistent internal range or consumption."
  (unless (and (/= (length source) 0) (= (length source) (length target))
               (not (eq source target)) (zerop (mod (length source) +participant-id-bytes+)))
    (error 'invariant-violation :reason :decision-sort-arrays))
  (unless (<= 0 left middle right (floor (length source) +participant-id-bytes+))
    (error 'invariant-violation :reason :decision-sort-range))
  (let ((a left) (b middle))
    (dotimes (step (- right left))
      (let ((take-left (or (= b right)
                           (and (< a middle)
                                (<= (compare-id16 source (* a +participant-id-bytes+)
                                                  source (* b +participant-id-bytes+)) 0)))))
        (copy-id16 target (+ left step) source (if take-left a b))
        (if take-left (incf a) (incf b))))
    (unless (and (= a middle) (= b right))
      (error 'invariant-violation :reason :decision-sort-consumption)))
  nil)

;;; REQ: REQ-TXM-005 REQ-TXM-001 REQ-AFF-008 REQ-VAL-001
(declaim (ftype (function (octets u16 u64) null) check-participant-order))
(defun check-participant-order (participants count source-offset)
  "Pre: private vector containing COUNT ID16 values. Post: increasing order, no duplicates.
CORRUPTION-DETECTED for a repeated participant, absolute record offset;
INVARIANT-VIOLATION for an incorrect internal size or ordering."
  (unless (= (length participants) (* count +participant-id-bytes+))
    (error 'invariant-violation :reason :decision-participant-size))
  (loop for i from 1 below count
        do (case (compare-id16 participants (* (1- i) +participant-id-bytes+)
                               participants (* i +participant-id-bytes+))
             (-1 nil)
             (0 (error 'corruption-detected :reason :decision-duplicate-participant
                       :offset source-offset))
             (otherwise (error 'invariant-violation :reason :decision-participant-order))))
  nil)

;;; REQ: REQ-TXM-005 REQ-AFF-008 REQ-VAL-001
(declaim (ftype (function (octets u16 u64) (values octets &optional)) sort-participants))
(defun sort-participants (participants count source-offset)
  "Pre: private copy of COUNT ID16 values. Post: sorted owned copy, all IDs distinct.
Propagates typed duplicate errors; INVARIANT-VIOLATION for inconsistent internal size.
Merge bounded by integer-length(COUNT-1) passes; allocations only during opening."
  (unless (= (length participants) (* count +participant-id-bytes+))
    (error 'invariant-violation :reason :decision-participant-size))
  (let ((source participants)
        (target (make-array (length participants) :element-type '(unsigned-byte 8))))
    (loop repeat (integer-length (max 0 (1- count)))
          for width = 1 then (* width 2)
          do (loop repeat (ceiling count (* width 2))
                   for left = 0 then (+ left (* width 2))
                   do (merge-id-runs source target left (min count (+ left width))
                                     (min count (+ left (* width 2)))))
             (rotatef source target))
    (check-participant-order source count source-offset)
    source))

;;; REQ: REQ-TXM-005 REQ-TXM-001 REQ-AFF-008 REQ-VAL-001
(declaim (ftype (function (simple-vector simple-vector index index index) null) merge-entry-runs))
(defun merge-entry-runs (source target left middle right)
  "Pre: distinct private vectors, same size, two runs sorted by TXID.
Post: complete stable merge; equal TXID values retain the physical record order.
INVARIANT-VIOLATION for range or consumption; loop bounded by RIGHT-LEFT."
  (unless (and (= (length source) (length target)) (not (eq source target)))
    (error 'invariant-violation :reason :decision-sort-arrays))
  (unless (<= 0 left middle right (length source))
    (error 'invariant-violation :reason :decision-sort-range))
  (let ((a left) (b middle))
    (dotimes (step (- right left))
      (let ((take-left
              (or (= b right)
                  (and (< a middle)
                       (<= (%entry-txid (the decision-entry (aref source a)))
                           (%entry-txid (the decision-entry (aref source b))))))))
        (setf (aref target (+ left step)) (aref source (if take-left a b)))
        (if take-left (incf a) (incf b))))
    (unless (and (= a middle) (= b right))
      (error 'invariant-violation :reason :decision-sort-consumption)))
  nil)

;;; REQ: REQ-TXM-005 REQ-TXM-001 REQ-AFF-008 REQ-VAL-001
(declaim (ftype (function (simple-vector) (values simple-vector &optional)) sort-entries))
(defun sort-entries (entries)
  "Pre: private vector of owned entries. Post: stable nondecreasing TXID order.
INVARIANT-VIOLATION for a malformed entry or incorrect internal ordering; no I/O.
Merge bounded by integer-length(N-1) passes, each bounded by N entries."
  (let* ((count (length entries)) (source entries)
         (target (make-array count :element-type t)))
    (dotimes (i count) (check-entry-shape (the decision-entry (aref entries i))))
    (loop repeat (integer-length (max 0 (1- count)))
          for width = 1 then (* width 2)
          do (loop repeat (ceiling count (* width 2))
                   for left = 0 then (+ left (* width 2))
                   do (merge-entry-runs source target left (min count (+ left width))
                                        (min count (+ left (* width 2)))))
             (rotatef source target))
    (loop for i from 1 below count
          unless (<= (%entry-txid (the decision-entry (aref source (1- i))))
                     (%entry-txid (the decision-entry (aref source i))))
            do (error 'invariant-violation :reason :decision-entry-order))
    source))
