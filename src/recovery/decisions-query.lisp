;;;; Interrogazioni scalari: nessun vettore della tabella viene esposto.
(in-package #:arcdocdb.recovery.decisions)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-TXM-005 REQ-AFF-008
(declaim (ftype (function (decision-table) (values index &optional)) numero-decisioni))
(defun numero-decisioni (table)
  "Pre: TABLE fully reconstructed. Post: number of unique TXIDs, no modification.
Contract type violations signal TYPE-ERROR with safety 3."
  (length (%table-entries table)))

;;; REQ: REQ-REC-001 REQ-MVC-005 REQ-MVC-006 REQ-TXM-005 REQ-AFF-008
(declaim (ftype (function (decision-table) (values boolean u64 &optional)) massimo-csn-decisioni))
(defun massimo-csn-decisioni (table)
  "Pre: complete table owned by canonical replay. Post: presence and maximum CSN of all DECISIONs.
NIL/0 when empty; TXID, control-log SEAL stamp, and tail do not contribute.
Loop bounded by verified cardinality; entry shape and consumption rechecked without new containers.
TYPE-ERROR for invalid types, INVARIANT-VIOLATION for inconsistent internal shape or result."
  (let* ((entries (%table-entries table)) (count (length entries)) (used 0) (maximum 0))
    (declare (type u64 maximum))
    (loop for entry across entries
          do (check-entry-shape (the decision-entry entry))
             (setf maximum (max maximum (%entry-csn entry)))
             (incf used))
    (unless (and (= used count) (or (plusp count) (zerop maximum)))
      (error 'invariant-violation :reason :decision-csn-result))
    (values (plusp count) maximum)))

;;; REQ: REQ-TXM-005 REQ-TXM-001 REQ-AFF-008 REQ-VAL-001
(declaim (ftype (function (decision-table u64) (values boolean index &optional)) find-decision-index))
(defun find-decision-index (table txid)
  "Pre: sorted private table with unique TXIDs. Post: presence and index, zero if absent.
Search bounded to integer-length(N) steps; INVARIANT-VIOLATION if the bound is insufficient.
No modification, I/O, or allocation dependent on unverified data."
  (let* ((entries (%table-entries table)) (count (length entries)) (left 0) (right count))
    (loop repeat (integer-length count)
          while (< left right)
          do (let ((middle (+ left (floor (- right left) 2))))
               (unless (<= 0 left middle (1- right) (1- count))
                 (error 'invariant-violation :reason :decision-search-range))
               (let* ((entry (the decision-entry (aref entries middle)))
                      (actual (%entry-txid entry)))
                 (cond ((= txid actual) (return-from find-decision-index (values t middle)))
                       ((< txid actual) (setf right middle))
                       (t (setf left (1+ middle)))))))
    (when (< left right)
      (error 'invariant-violation :reason :decision-search-bound))
    (values nil 0)))

;;; REQ: REQ-TXM-005 REQ-TXM-001 REQ-AFF-008
(declaim (ftype (function (decision-table u64) (values boolean u64 u16 &optional)) trova-decisione))
(defun trova-decisione (table txid)
  "Pre: complete TABLE, opaque u64 TXID. Post: presence, CSN, and count, both zero if absent.
Propagates typed invariant errors; no internal reference exposed."
  (multiple-value-bind (found position) (find-decision-index table txid)
    (if found
        (let ((entry (the decision-entry (aref (%table-entries table) position))))
          (check-entry-shape entry)
          (values t (%entry-csn entry) (%entry-count entry)))
        (values nil 0 0))))

;;; REQ: REQ-TXM-005 REQ-AFF-008 REQ-VAL-001
(declaim (ftype (function (decision-entry octets index) boolean) participant-present-p))
(defun participant-present-p (entry serie-id start)
  "Pre: canonical private entry, caller's ID16 available and stable.
Post: exact presence; search bounded to integer-length(COUNT) steps.
INVALID-ARGUMENT for range, INVARIANT-VIOLATION for incorrect internal shape or bound."
  (check-entry-shape entry)
  (check-range serie-id start (+ start +participant-id-bytes+))
  (let ((participants (%entry-participants entry)) (left 0) (right (%entry-count entry)))
    (loop repeat (integer-length (%entry-count entry))
          while (< left right)
          do (let ((middle (+ left (floor (- right left) 2))))
               (case (compare-id16 participants (* middle +participant-id-bytes+) serie-id start)
                 (0 (return-from participant-present-p t))
                 (-1 (setf left (1+ middle)))
                 (1 (setf right middle))
                 (otherwise (error 'invariant-violation :reason :decision-participant-order)))))
    (when (< left right)
      (error 'invariant-violation :reason :decision-search-bound)))
  nil)

;;; REQ: REQ-TXM-005 REQ-TXM-001 REQ-AFF-008 REQ-VAL-001
(declaim (ftype (function (decision-table u64 octets integer integer) boolean)
                partecipante-decisione-p))
(defun partecipante-decisione-p (table txid serie-id start end)
  "Pre: complete TABLE and stable Serie ID buffer. Post: presence for exact TXID and ID16.
Checks range and length even if TXID absent; no modification or internal reference.
INVALID-ARGUMENT for range or span other than 16 bytes, with offset relative to ID buffer."
  (check-range serie-id start end)
  (unless (= (- end start) +participant-id-bytes+)
    (error 'invalid-argument :reason :serie-id-length :offset start))
  (multiple-value-bind (found position) (find-decision-index table txid)
    (and found (participant-present-p (the decision-entry (aref (%table-entries table) position))
                                      serie-id start))))
