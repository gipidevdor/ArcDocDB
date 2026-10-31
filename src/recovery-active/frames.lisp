;;; OWNER: un attraversamento del prefisso interamente verificato, buffer stabile e workspace privato.
;;; SHARED: nessuna pubblicazione; lo scanner a EOF precede ogni interpretazione semantica.
(in-package #:arcdocdb.recovery.active)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-FOR-003 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (octets index index (member 1 2))
                         (values index u8 u8 index &optional)) cornice-active-verificata))
(defun cornice-active-verificata (buffer pos end version)
  "Pre: prefix already verified in full, stable exclusive buffer. Post: header and progress rechecked.
Skips the body already covered by CRC in the first pass; returns value start, not proof of commit.
Header/range errors propagate; INVARIANT-VIOLATION for inconsistent consumption, no modification."
  (check-range buffer pos end)
  (multiple-value-bind (next kind flags key-bytes value-bytes)
      (arcdocdb.record::checked-header buffer pos end version +max-document-bytes+)
    (let ((value-start (+ pos +header-bytes+ key-bytes)))
      (unless (and (< pos next) (<= next end) (= (- next value-start) value-bytes))
        (error 'invariant-violation :reason :active-recovery-frame :offset pos))
      (values next kind flags value-start))))

;;; REQ: REQ-TXM-007 REQ-AFF-008 REQ-REC-001
(declaim (ftype (function (workspace-active u64 index index u32) null) registra-prepared-active))
(defun registra-prepared-active (workspace txid batch pos limit)
  "Pre: prepared PUT/TOMBSTONE in a valid prefix. Post: exactly one batch per TXID and distinct-TXID budget.
CORRUPTION-DETECTED if it spans batches or follows an existing OUTCOME; RESOURCE-EXHAUSTED before insertion.
Zero TXID and full u64 allowed; no meaning inferred from magnitude."
  (multiple-value-bind (csn outcome-present) (gethash txid (workspace-active-outcomes workspace))
    (when outcome-present
      (unless (typep csn 'u64) (error 'invariant-violation :reason :active-recovery-outcome-value))
      (error 'corruption-detected :reason :active-recovery-outcome-before-prepare :offset pos)))
  (multiple-value-bind (previous present) (gethash txid (workspace-active-prepared workspace))
    (when (and present (/= previous batch))
      (error 'corruption-detected :reason :active-recovery-prepared-batches :offset pos))
    (unless present
      (when (>= (hash-table-count (workspace-active-prepared workspace)) limit)
        (error 'resource-exhausted :reason :active-recovery-prepared-budget :offset pos))
      (setf (gethash txid (workspace-active-prepared workspace)) batch)))
  nil)

;;; REQ: REQ-TXM-007 REQ-AFF-008 REQ-REC-001
(declaim (ftype (function (workspace-active u64 u64 index u32) null) registra-outcome-active))
(defun registra-outcome-active (workspace txid csn pos limit)
  "Pre: OUTCOME with body already intact and shape verified. Post: unique outcome or identical duplicate.
Budget counts physical occurrences before insertion; conflict signals CORRUPTION-DETECTED.
An OUTCOME without prepared data in the segment does not by itself produce a closing outcome."
  (when (>= (workspace-active-outcome-records workspace) limit)
    (error 'resource-exhausted :reason :active-recovery-outcome-budget :offset pos))
  (multiple-value-bind (previous present) (gethash txid (workspace-active-outcomes workspace))
    (when (and present (/= previous csn))
      (error 'corruption-detected :reason :active-recovery-outcome-conflict :offset pos))
    (setf (gethash txid (workspace-active-outcomes workspace)) csn))
  (incf (workspace-active-outcome-records workspace))
  (registra-csn-active workspace csn)
  nil)

;;; REQ: REQ-REC-001 REQ-TXM-007 REQ-FOR-003 REQ-AFF-008
(declaim (ftype (function (octets index (member 1 2) index index u32 u32) workspace-active)
                attraversa-active))
(defun attraversa-active (buffer prefix version batches records max-prepared max-outcomes)
  "Pre: entire sealed prefix and authoritative counts. Post: complete private semantic workspace.
Rereads only headers, not document CRCs; exact loop of BATCHES+RECORDS frames.
Typed errors for prepared data/outcomes; INVARIANT-VIOLATION if consumption or counts diverge."
  (check-range buffer +segment-header-bytes+ prefix)
  (unless (<= (+ batches records) (floor (- prefix +segment-header-bytes+) +header-bytes+))
    (error 'invariant-violation :reason :active-recovery-frame-count))
  (let ((workspace (%make-workspace-active)) (pos +segment-header-bytes+) (batch 0) (count 0))
    (loop repeat (+ batches records)
          do (multiple-value-bind (next kind flags value-start)
                 (cornice-active-verificata buffer pos prefix version)
               (case kind
                 ((#.+put+ #.+tombstone+)
                  (let ((stamp (leggi-u64 buffer (+ pos arcdocdb.record::+stamp-offset+))))
                    (if (logtest flags +prepared+)
                        (registra-prepared-active workspace stamp batch pos max-prepared)
                        (registra-csn-active workspace stamp)))
                  (incf count))
                 (#.+outcome+
                  (registra-outcome-active workspace (leggi-u64 buffer (+ pos arcdocdb.record::+stamp-offset+))
                                          (leggi-u64 buffer value-start) pos max-outcomes)
                  (incf count))
                 (#.+seal+
                  (registra-csn-active workspace (leggi-u64 buffer (+ pos arcdocdb.record::+stamp-offset+)))
                  (incf batch))
                 (otherwise (error 'invariant-violation :reason :active-recovery-kind :offset pos)))
               (setf pos next)))
    (unless (and (= pos prefix) (= batch batches) (= count records))
      (error 'invariant-violation :reason :active-recovery-consumption :offset pos))
    workspace))
