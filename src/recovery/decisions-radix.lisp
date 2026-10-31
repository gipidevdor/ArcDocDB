;;;; LSD stabile sulle chiavi fisse, selezionato per cardinalità misurate.
;;; OWNER: singola ricostruzione; input e scratch sono copie private.
;;; SHARED: nessuna scrittura condivisa, nessun I/O o pubblicazione.
(in-package #:arcdocdb.recovery.decisions)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-TXM-005 REQ-AFF-008
(defconstant +decision-radix-buckets+ 256 "Number of algorithm classes for one octet.")
;;; REQ: REQ-TXM-005 REQ-AFF-008
(deftype radix-histogram () '(simple-array (unsigned-byte 64) (256)))

;;; REQ: REQ-TXM-005 REQ-AFF-008 REQ-VAL-001
(declaim (ftype (function (radix-histogram index) (values boolean &optional))
                radix-prefix-starts))
(defun radix-prefix-starts (histogram count)
  "Pre: private counts for 256 classes. Post: verified sums, prefixes if needed.
Returns NIL for zero or one occupied class: the pass is unnecessary.
INVARIANT-VIOLATION for incompatible counts; two loops bounded to 256."
  (let ((total 0) (occupied 0))
    (declare (type index total occupied))
    (dotimes (digit +decision-radix-buckets+)
      (let ((frequency (aref histogram digit)))
        (unless (<= frequency (- count total))
          (error 'invariant-violation :reason :decision-radix-count))
        (incf total frequency)
        (unless (zerop frequency) (incf occupied))))
    (unless (= total count)
      (error 'invariant-violation :reason :decision-radix-consumption))
    (when (> occupied 1)
      (let ((start 0))
        (declare (type index start))
        (dotimes (digit +decision-radix-buckets+)
          (let ((frequency (aref histogram digit)))
            (setf (aref histogram digit) start)
            (incf start frequency))))
      t)))

;;; REQ: REQ-TXM-005 REQ-AFF-008 REQ-VAL-001
(declaim (ftype (function (octets u16 index radix-histogram)
                         (values boolean &optional)) radix-id-starts))
(defun radix-id-starts (source count digit histogram)
  "Pre: private copy of COUNT ID16s; DIGIT is an ID byte. Post: verified histogram.
Returns whether distribution is needed; INVARIANT-VIOLATION for inconsistent size or byte.
SOURCE unchanged; counting bounded to COUNT, prefixes to 256 classes."
  (unless (= (length source) (* count +participant-id-bytes+))
    (error 'invariant-violation :reason :decision-participant-size))
  (unless (< digit +participant-id-bytes+)
    (error 'invariant-violation :reason :decision-radix-digit))
  (fill histogram 0)
  (dotimes (i count)
    (incf (aref histogram (aref source (+ (* i +participant-id-bytes+) digit)))))
  (radix-prefix-starts histogram count))

;;; REQ: REQ-TXM-005 REQ-TXM-001 REQ-AFF-008 REQ-VAL-001
(declaim (ftype (function (simple-vector index radix-histogram)
                         (values boolean &optional)) radix-entry-starts))
(defun radix-entry-starts (source digit histogram)
  "Pre: verified private entries; DIGIT is a u64 TXID octet. Post: verified counts.
Returns whether distribution is needed; INVARIANT-VIOLATION for an inconsistent octet.
SOURCE unchanged; counting bounded to length, prefixes to 256 classes."
  (unless (< digit 8)
    (error 'invariant-violation :reason :decision-radix-digit))
  (unless (typep (length source) 'u64)
    (error 'invariant-violation :reason :decision-radix-count))
  (fill histogram 0)
  (dotimes (i (length source))
    (incf (aref histogram
                (ldb (byte 8 (* digit 8)) (%entry-txid (the decision-entry (aref source i)))))))
  (radix-prefix-starts histogram (length source)))

;;; REQ: REQ-TXM-005 REQ-AFF-008 REQ-VAL-001
(declaim (ftype (function (radix-histogram index) null) radix-check-cursors))
(defun radix-check-cursors (histogram count)
  "Pre: cursors after stable distribution. Post: increasing endpoints within COUNT.
The last class ends exactly at COUNT; INVARIANT-VIOLATION otherwise.
No modification; loop bounded to 256 classes."
  (let ((previous 0))
    (declare (type index previous))
    (dotimes (digit +decision-radix-buckets+)
      (let ((cursor (aref histogram digit)))
        (unless (<= previous cursor count)
          (error 'invariant-violation :reason :decision-radix-position))
        (setf previous cursor)))
    (unless (= previous count)
      (error 'invariant-violation :reason :decision-radix-consumption)))
  nil)

;;; REQ: REQ-TXM-005 REQ-AFF-008 REQ-VAL-001
(declaim (ftype (function (octets octets u16 index radix-histogram) null)
                radix-scatter-ids))
(defun radix-scatter-ids (source target count digit histogram)
  "Pre: distinct private copies, prefixes for the current pass. Post: distributed IDs.
Stable in source order, no change to SOURCE; cursors consumed.
INVARIANT-VIOLATION for sizes, byte, or position; loop bounded to COUNT."
  (unless (and (= (length source) (* count +participant-id-bytes+))
               (= (length target) (length source)) (not (eq source target)))
    (error 'invariant-violation :reason :decision-radix-arrays))
  (unless (< digit +participant-id-bytes+)
    (error 'invariant-violation :reason :decision-radix-digit))
  (dotimes (i count)
    (let* ((key (aref source (+ (* i +participant-id-bytes+) digit)))
           (position (aref histogram key)))
      (unless (< position count)
        (error 'invariant-violation :reason :decision-radix-position))
      (copy-id16 target (the index position) source i)
      (incf (aref histogram key))))
  (radix-check-cursors histogram count))

;;; REQ: REQ-TXM-005 REQ-TXM-001 REQ-AFF-008 REQ-VAL-001
(declaim (ftype (function (simple-vector simple-vector index radix-histogram) null)
                radix-scatter-entries))
(defun radix-scatter-entries (source target digit histogram)
  "Pre: distinct private vectors, verified entries, and current prefixes. Post: stable run.
Equal TXIDs preserve physical order; SOURCE unchanged, cursors consumed.
INVARIANT-VIOLATION for sizes, octet, or position; loop bounded to length."
  (unless (and (= (length source) (length target)) (not (eq source target)))
    (error 'invariant-violation :reason :decision-radix-arrays))
  (unless (< digit 8)
    (error 'invariant-violation :reason :decision-radix-digit))
  (dotimes (i (length source))
    (let* ((entry (the decision-entry (aref source i)))
           (key (ldb (byte 8 (* digit 8)) (%entry-txid entry)))
           (position (aref histogram key)))
      (unless (< position (length source))
        (error 'invariant-violation :reason :decision-radix-position))
      (setf (aref target (the index position)) entry)
      (incf (aref histogram key))))
  (radix-check-cursors histogram (length source)))

;;; REQ: REQ-TXM-005 REQ-TXM-001 REQ-AFF-008 REQ-VAL-001
(declaim (ftype (function (octets u16 u64) (values octets &optional))
                radix-sort-participants))
(defun radix-sort-participants (participants count source-offset)
  "Pre: private copy of COUNT ID16s. Post: owned, sorted, distinct result.
Propagates typed duplicate errors; INVARIANT-VIOLATION for inconsistent internal size.
Stable LSD: at most 16 passes, uniform passes skipped; private input may be reordered.
Scratch sized to actual data; opening path, no zero-heap promise."
  (unless (= (length participants) (* count +participant-id-bytes+))
    (error 'invariant-violation :reason :decision-participant-size))
  (let ((source participants)
        (target (make-array (length participants) :element-type '(unsigned-byte 8)))
        (histogram (make-array +decision-radix-buckets+
                               :element-type '(unsigned-byte 64) :initial-element 0)))
    (dotimes (pass +participant-id-bytes+)
      (let ((digit (- +participant-id-bytes+ 1 pass)))
        (when (radix-id-starts source count digit histogram)
          (radix-scatter-ids source target count digit histogram)
          (rotatef source target))))
    (check-participant-order source count source-offset)
    source))

;;; REQ: REQ-TXM-005 REQ-TXM-001 REQ-AFF-008 REQ-VAL-001
(declaim (ftype (function (simple-vector) (values simple-vector &optional))
                radix-sort-entries))
(defun radix-sort-entries (entries)
  "Pre: private vector of owned entries. Post: stable nondecreasing TXID order.
INVARIANT-VIOLATION for inconsistent entries or order; no I/O or shared state.
At most eight LSD passes, uniform passes skipped; private input may be reordered.
Scratch sized to actual length; allocations allowed on the opening path."
  (dotimes (i (length entries))
    (unless (typep (aref entries i) 'decision-entry)
      (error 'invariant-violation :reason :decision-entry-shape))
    (check-entry-shape (aref entries i)))
  (let ((source entries) (target (make-array (length entries) :element-type t))
        (histogram (make-array +decision-radix-buckets+
                               :element-type '(unsigned-byte 64) :initial-element 0)))
    (dotimes (digit 8)
      (when (radix-entry-starts source digit histogram)
        (radix-scatter-entries source target digit histogram)
        (rotatef source target)))
    (loop for i from 1 below (length source)
          unless (<= (%entry-txid (the decision-entry (aref source (1- i))))
                     (%entry-txid (the decision-entry (aref source i))))
            do (error 'invariant-violation :reason :decision-entry-order))
    source))

;;; REQ: REQ-TXM-005 REQ-AFF-008 REQ-BEN-001 REQ-VAL-001
(defconstant +radix-participant-threshold+ 1024
  "Proposal measured on 2026-10-09: LSD for at least 1024 ID16s, merge below the threshold.")
;;; REQ: REQ-TXM-005 REQ-AFF-008 REQ-BEN-001 REQ-VAL-001
(defconstant +radix-entry-threshold+ 256
  "Proposal measured on 2026-10-09: LSD for at least 256 TXIDs, merge below the threshold.")

;;; REQ: REQ-TXM-005 REQ-AFF-008 REQ-VAL-001
(declaim (ftype (function (octets u16 u64) (values octets &optional))
                sort-recovery-participants))
(defun sort-recovery-participants (participants count source-offset)
  "Pre: private copy of COUNT ID16s. Post: sorted, distinct IDs; owned data.
Selection by cardinality; both sorters verify size and final order.
Propagates typed corruption for duplicates and internal invariants; no I/O.
Workspace sized to actual data; allocations allowed during recovery."
  (if (< count +radix-participant-threshold+)
      (sort-participants participants count source-offset)
      (radix-sort-participants participants count source-offset)))

;;; REQ: REQ-TXM-005 REQ-TXM-001 REQ-AFF-008 REQ-VAL-001
(declaim (ftype (function (simple-vector) (values simple-vector &optional))
                sort-recovery-entries))
(defun sort-recovery-entries (entries)
  "Pre: private owned entries. Post: stably sorted TXIDs, without external aliases.
Selection by cardinality; both sorters verify shape and final order.
Propagates INVARIANT-VIOLATION for inconsistent internal data, without partial results.
No shared state or I/O; scratch sized to actual length."
  (if (< (length entries) +radix-entry-threshold+)
      (sort-entries entries)
      (radix-sort-entries entries)))
