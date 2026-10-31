;;; OWNER: chiamata di costruzione; buffer esclusivo letto dal FD CLOSED.
;;; SHARED: nessuna pubblicazione, modifica di log o classificazione della coda fisica.
(in-package #:arcdocdb.get.resolver)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-FOR-003 REQ-AFF-008 REQ-AFF-002
(declaim (ftype (function (octets u32 u32 (member 1 2) u32 u32 u32 u32) null) verifica-prefisso-writer))
(defun verifica-prefisso-writer (buffer end id version max-batches max-records batch-records batch-bytes)
  "Pre: CLOSED and authoritative END, bytes stable through END. Post: all batches intact,
exact frontier; no assumption about EOF or the tail beyond END.
Propagates verifier errors; RESOURCE-EXHAUSTED for budget, never partial replay."
  (unless (<= +segment-header-bytes+ end (length buffer))
    (error 'invariant-violation :reason :resolver-prefix-range))
  (let ((pos +segment-header-bytes+) (records 0))
    (declare (type u32 pos records))
    (loop repeat max-batches
          do (when (= pos end) (return-from verifica-prefisso-writer nil))
             (multiple-value-bind (next stamp durable count)
                 (verifica-lotto buffer pos end id :version version :log-kind :segment
                                 :max-records batch-records :max-bytes batch-bytes)
               (unless (and (< pos next) (<= next end) (typep stamp 'u64) (<= durable pos))
                 (error 'invariant-violation :reason :resolver-batch-result :offset pos))
               (when (> count (- max-records records))
                 (error 'resource-exhausted :reason :resolver-record-budget :offset pos))
               (incf records count) (setf pos next)))
    (unless (= pos end)
      (error 'resource-exhausted :reason :resolver-batch-budget :offset pos)))
  nil)

;;; REQ: REQ-FOR-003 REQ-AFF-008
(declaim (ftype (function (octets u32 u32 (member 1 2)) (values u32 u8 u8 &optional))
                prossima-cornice-resolver))
(defun prossima-cornice-resolver (buffer pos end version)
  "Pre: prefix ALREADY verified in full, private buffer never modified during construction.
Post: header rechecked and progress within END; skips the body without repeating its CRC.
Propagates typed errors; not an independent record verification or a public parser."
  (check-range buffer pos end)
  (multiple-value-bind (next kind flags key-length value-length)
      (checked-header buffer pos end version +max-document-bytes+)
    (declare (ignore key-length value-length))
    (unless (< pos next (1+ end))
      (error 'invariant-violation :reason :resolver-frame-progress :offset pos))
    (values (the u32 next) kind flags)))

;;; REQ: REQ-FOR-003 REQ-FOR-004 REQ-AFF-008
(declaim (ftype (function (octets u32 (member 1 2) u32)
                         (values u32 u32 &optional)) conta-voci-resolver))
(defun conta-voci-resolver (buffer end version max-records)
  "Pre: entire prefix verified. Post: PUT and OUTCOME counted, SEAL excluded from record budget.
Each header is rechecked; progress within END and an admitted type are mandatory.
RESOURCE-EXHAUSTED on the global budget; corruption or invariants propagated."
  (let ((pos +segment-header-bytes+) (records 0) (puts 0) (proofs 0))
    (declare (type u32 pos records puts proofs))
    (loop repeat (1+ (floor (- end +segment-header-bytes+) +header-bytes+))
          do (when (= pos end) (return-from conta-voci-resolver (values puts proofs)))
             (multiple-value-bind (next kind flags) (prossima-cornice-resolver buffer pos end version)
               (declare (ignore flags))
               (unless (= kind +seal+)
                 (when (= records max-records)
                   (error 'resource-exhausted :reason :resolver-record-budget :offset pos))
                 (incf records))
               (case kind
                 (#.+put+ (incf puts)) (#.+outcome+ (incf proofs))
                 ((#.+tombstone+ #.+seal+) nil)
                 (otherwise (error 'corruption-detected :reason :resolver-frame-kind :offset pos)))
               (setf pos next)))
    (error 'invariant-violation :reason :resolver-scan-bound)))

;;; REQ: REQ-FOR-004 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (octets u32 u32 (member 1 2) resolver-words index) null)
                copia-prova-resolver))
(defun copia-prova-resolver (buffer pos next version proofs used)
  "Pre: OUTCOME offset from verified traversal, complete private row.
Post: CRC/header/body and shape rechecked before copying TXID/CSN/offset.
INVARIANT-VIOLATION for result/range; integrity errors propagated without publishing partial proof."
  (unless (<= (+ used +proof-words+) (length proofs))
    (error 'invariant-violation :reason :resolver-proof-count))
  (multiple-value-bind (actual kind flags ks ke vs ve) (verifica-cornice buffer pos next :version version)
    (unless (and (= actual next) (= kind +outcome+) (zerop flags) (= ks ke vs (+ pos +header-bytes+))
                 (= ve next))
      (error 'invariant-violation :reason :resolver-proof-frame :offset pos))
    (setf (aref proofs (+ used +proof-txid-low+)) (leggi-u32 buffer (+ pos +stamp-offset+))
          (aref proofs (+ used +proof-txid-high+)) (leggi-u32 buffer (+ pos +stamp-offset+ 4))
          (aref proofs (+ used +proof-csn-low+)) (leggi-u32 buffer vs)
          (aref proofs (+ used +proof-csn-high+)) (leggi-u32 buffer (+ vs 4))
          (aref proofs (+ used +proof-offset+)) pos))
  nil)

;;; REQ: REQ-FOR-004 REQ-AFF-008
(declaim (ftype (function (octets u32 (member 1 2) resolver-words) null) copia-prove-resolver))
(defun copia-prove-resolver (buffer end version proofs)
  "Pre: stable prefix, private array sized from the count. Post: five u32 values per OUTCOME.
Only verified offset and TXID/CSN, no reference to the buffer; loop bounded by bytes.
INVARIANT-VIOLATION for mismatched sizes/progress/count; codec errors propagated."
  (unless (zerop (mod (length proofs) +proof-words+))
    (error 'invariant-violation :reason :resolver-proof-shape))
  (let ((pos +segment-header-bytes+) (used 0))
    (declare (type u32 pos) (type index used))
    (loop repeat (1+ (floor (- end +segment-header-bytes+) +header-bytes+))
          do (when (= pos end)
               (unless (= used (length proofs)) (error 'invariant-violation :reason :resolver-proof-count))
               (return-from copia-prove-resolver nil))
             (multiple-value-bind (next kind flags) (prossima-cornice-resolver buffer pos end version)
               (declare (ignore flags))
               (when (= kind +outcome+)
                 (copia-prova-resolver buffer pos next version proofs used)
                 (incf used +proof-words+))
               (setf pos next)))
    (error 'invariant-violation :reason :resolver-scan-bound)))
