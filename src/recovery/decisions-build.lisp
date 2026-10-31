;;;; Ricostruzione tutto-o-niente del prefisso sigillato di multiserie.log.
;;; OWNER: una chiamata; workspace e risultato possiedono tutte le copie.
;;; SHARED: nessuna pubblicazione, applicazione o scrittura condivisa tra Serie.
(in-package #:arcdocdb.recovery.decisions)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-TXM-005 REQ-AFF-008
(declaim (ftype (function (integer integer integer) null) check-decision-budgets))
(defun check-decision-budgets (max-decisions max-participants max-per-decision)
  "Pre: caller's integer budgets. Post: index counts and u16 DECISION ceiling;
zero allowed. INVALID-ARGUMENT before the scanner for invalid configuration."
  (unless (and (typep max-decisions 'index) (typep max-participants 'index))
    (error 'invalid-argument :reason :decision-arguments))
  (unless (typep max-per-decision 'u16)
    (error 'invalid-argument :reason :decision-arguments))
  nil)

;;; REQ: REQ-TXM-005 REQ-FOR-003 REQ-AFF-008 REQ-VAL-001
(declaim (ftype (function (octets index index integer u16)
                         (values index (or null index) index index u16 &optional)) decision-frame))
(defun decision-frame (buffer pos end version max-per-decision)
  "Pre: record in the stable sealed prefix. Post: verified frame; for DECISION,
returns end, CSN offset, ID16 span, and count; for SEAL, CSN offset NIL.
Propagates payload corruption and budget errors without reclassifying them as tail."
  (check-range buffer pos end)
  (unless (< pos end)
    (error 'invariant-violation :reason :decision-frame-range :offset pos))
  (multiple-value-bind (next kind flags ks ke vs ve)
      (verifica-cornice buffer pos end :version version)
    (unless (and (< pos next) (<= next end) (= ks ke) (zerop flags))
      (error 'invariant-violation :reason :decision-control-frame :offset pos))
    (cond
      ((= kind +seal+) (values next nil 0 0 0))
      ((= kind +decision+)
       (multiple-value-bind (csn parts-start parts-end count)
           (valida-valore-decision buffer vs ve :max-partecipanti max-per-decision)
         (unless (and (<= vs csn parts-start parts-end ve)
                      (= (- parts-end parts-start) (* count +participant-id-bytes+)))
           (error 'invariant-violation :reason :decision-payload-range :offset pos))
         (values next csn parts-start parts-end count)))
      (t (error 'invariant-violation :reason :decision-record-type :offset pos)))))

;;; REQ: REQ-TXM-005 REQ-FOR-003 REQ-AFF-008 REQ-AFF-009
(declaim (ftype (function (octets index index integer index index index u16 u64)
                         (values index &optional)) preflight-decisions))
(defun preflight-decisions (buffer start end version frames decisions max-participants
                            max-per-decision file-offset)
  "Pre: scanner-verified prefix, authoritative frame and DECISION counters.
Post: all payloads valid and total participants within budget, including duplicate records.
RESOURCE-EXHAUSTED with absolute offset; codec errors retain relative offsets.
No entry or participant copy allocated during this pass."
  (check-range buffer start end)
  (unless (<= frames (floor (- end start) +header-bytes+))
    (error 'invariant-violation :reason :decision-frame-count :offset start))
  (let ((pos start) (count 0) (total 0))
    (dotimes (i frames)
      (multiple-value-bind (next csn parts-start parts-end participants)
          (decision-frame buffer pos end version max-per-decision)
        (when csn
          (unless (= (- parts-end parts-start) (* participants +participant-id-bytes+))
            (error 'invariant-violation :reason :decision-participant-size :offset pos))
          (when (> participants (- max-participants total))
            (error 'resource-exhausted :reason :decision-participant-budget
                   :offset (+ file-offset pos)))
          (incf total participants)
          (incf count))
        (setf pos next)))
    (unless (and (= pos end) (= count decisions))
      (error 'invariant-violation :reason :decision-prefix-consumption :offset pos))
    total))

;;; REQ: REQ-TXM-005 REQ-TXM-001 REQ-FOR-003 REQ-AFF-008 REQ-VAL-001
(declaim (ftype (function (octets index index integer index index index u16 u64)
                         (values simple-vector &optional)) decode-decisions))
(defun decode-decisions (buffer start end version frames count total max-per-decision file-offset)
  "Pre: payloads and cumulative budgets already verified, buffer stable until return.
Post: COUNT owned entries; participants copied, sorted, and distinct; no input aliasing.
Propagates typed errors; inconsistent consumption signals INVARIANT-VIOLATION."
  (check-range buffer start end)
  (unless (<= count frames (floor (- end start) +header-bytes+))
    (error 'invariant-violation :reason :decision-frame-count :offset start))
  (let ((entries (make-array count :element-type t)) (pos start) (i 0) (participants-read 0))
    (dotimes (frame frames)
      (multiple-value-bind (next csn parts-start parts-end participants)
          (decision-frame buffer pos end version max-per-decision)
        (when csn
          (unless (< i count)
            (error 'invariant-violation :reason :decision-entry-count :offset pos))
          (let ((copy (make-array (- parts-end parts-start) :element-type '(unsigned-byte 8)))
                (offset (+ file-offset pos)))
            (replace copy buffer :start2 parts-start :end2 parts-end)
            (setf (aref entries i)
                  (%make-decision-entry (leggi-u64 buffer (+ pos +stamp-offset+))
                                        (leggi-u64 buffer csn) participants
                                        (sort-recovery-participants copy participants offset) offset)))
          (incf i)
          (incf participants-read participants))
        (setf pos next)))
    (unless (and (= pos end) (= i count) (= participants-read total))
      (error 'invariant-violation :reason :decision-prefix-consumption :offset pos))
    entries))

;;; REQ: REQ-TXM-005 REQ-TXM-001 REQ-FOR-003 REQ-VAL-001
(declaim (ftype (function (decision-entry decision-entry) boolean) same-decision-p))
(defun same-decision-p (left right)
  "Pre: private entries with canonical participants. Post: CSN and ID16 set match.
INVARIANT-VIOLATION for a malformed internal entry; complete, bounded comparison."
  (check-entry-shape left)
  (check-entry-shape right)
  (and (= (%entry-csn left) (%entry-csn right)) (= (%entry-count left) (%entry-count right))
       (let ((a (%entry-participants left)) (b (%entry-participants right)))
         (loop for i below (length a) always (= (aref a i) (aref b i))))))

;;; REQ: REQ-TXM-005 REQ-TXM-001 REQ-AFF-008 REQ-VAL-001
(declaim (ftype (function (simple-vector) (values index &optional)) unique-decision-count))
(defun unique-decision-count (entries)
  "Pre: entries stably sorted by TXID. Post: counts unique TXIDs, identical duplicates allowed.
CORRUPTION-DETECTED at the first conflicting absolute offset; INVARIANT-VIOLATION for order.
Every comparison involves only owned copies; no partial table returned."
  (let ((previous nil) (unique 0) (conflict nil))
    (dotimes (i (length entries))
      (let ((entry (the decision-entry (aref entries i))))
        (check-entry-shape entry)
        (when (and previous (< (%entry-txid entry) (%entry-txid previous)))
          (error 'invariant-violation :reason :decision-entry-order))
        (if (and previous (= (%entry-txid entry) (%entry-txid previous)))
            (unless (same-decision-p previous entry)
              (setf conflict (if conflict (min conflict (%entry-source-offset entry))
                                (%entry-source-offset entry))))
            (progn (incf unique) (setf previous entry)))))
    (when conflict
      (error 'corruption-detected :reason :decision-conflict :offset conflict))
    (unless (<= unique (length entries))
      (error 'invariant-violation :reason :decision-entry-count))
    unique))

;;; REQ: REQ-TXM-005 REQ-TXM-001 REQ-AFF-008 REQ-VAL-001
(declaim (ftype (function (simple-vector) (values decision-table &optional)) collapse-decisions))
(defun collapse-decisions (entries)
  "Pre: sorted, owned entries. Post: complete private table, one entry per TXID.
Propagates typed conflicts before constructing the result; no vector exported."
  (let* ((count (unique-decision-count entries))
         (result (make-array count :element-type t)) (previous nil) (next 0))
    (dotimes (i (length entries))
      (let ((entry (the decision-entry (aref entries i))))
        (unless (and previous (= (%entry-txid entry) (%entry-txid previous)))
          (unless (< next count)
            (error 'invariant-violation :reason :decision-entry-count))
          (setf (aref result next) entry previous entry)
          (incf next))))
    (unless (= next count)
      (error 'invariant-violation :reason :decision-entry-count))
    (%make-decision-table result)))

;;; REQ: REQ-TXM-005 REQ-TXM-001 REQ-TXM-002 REQ-TXM-003 REQ-FOR-003
;;; REQ: REQ-AFF-008 REQ-AFF-009 REQ-AFF-017 REQ-VAL-001
(declaim (ftype (function (octets integer integer
                                &key (:version integer) (:file-offset u64) (:file-size t)
                                (:max-bytes integer) (:max-batches integer)
                                (:max-batch-records integer) (:max-batch-bytes integer)
                                (:max-search-bytes integer) (:max-decisions integer)
                                (:max-participants integer) (:max-participants-per-decision integer))
                         (values decision-table index (member :complete :tail) &optional))
                ricostruisci-decisioni))
(defun ricostruisci-decisioni (buffer start end
                              &key (version 0) (file-offset 0) file-size
                                   (max-bytes 67108864) (max-batches 65536)
                                   (max-batch-records 65536) (max-batch-bytes 67108864)
                                   (max-search-bytes 67108864) (max-decisions 65536)
                                   (max-participants 65536) (max-participants-per-decision 65535))
  "Pre: log through stable physical EOF attested by FILE-SIZE, explicit version;
START after a verified header or authoritative checkpoint. Finite budgets, zero allowed for empty data.
Post: complete owned table, prefix in the buffer, COMPLETE/TAIL; no I/O, replay,
publication, or buffer mutation. Equal duplicates are idempotent; no partial table.
Propagates typed errors; payloads in the sealed prefix do not become a new tail.
Opening path with allocations allowed; TXID/CSN are opaque u64s, including zero or maximum."
  (check-decision-budgets max-decisions max-participants max-participants-per-decision)
  (multiple-value-bind (prefix status batches count)
      (scansiona-log buffer start end 0 :version version :log-kind :multiserie
                    :file-offset file-offset :file-size file-size :max-bytes max-bytes
                    :max-batches max-batches :max-batch-records max-batch-records
                    :max-batch-bytes max-batch-bytes :max-search-bytes max-search-bytes)
    (when (> count max-decisions)
      (error 'resource-exhausted :reason :decision-count-budget :offset (+ file-offset start)))
    (let* ((frames (+ batches count))
           (total (preflight-decisions buffer start prefix version frames count max-participants
                                       max-participants-per-decision file-offset))
           (entries (decode-decisions buffer start prefix version frames count total
                                      max-participants-per-decision file-offset)))
      (values (collapse-decisions (sort-recovery-entries entries)) prefix status))))
