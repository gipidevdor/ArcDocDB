;;; OWNER: writer sotto lease; campi catturati una volta nello slot trasferito.
;;; SHARED: nessuno stato tra Serie; non pubblica frontiere o viste ai reader.
(in-package #:arcdocdb.fulltext.put)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-SEC-004 REQ-SEC-010 REQ-WAL-005
(declaim (ftype (function (f:riserva-full-text w:lotto u32 u32) null) installa-riferimento-put))
(defun installa-riferimento-put (slot batch high low)
  "Pre: complete preflight, owned effect and SEALED buffer not delivered to I/O.
Post: fields fixed and SEALED state published last to the writer only.
No resolution or reader publication; interruption handled by the capture boundary."
  (unless (and (eq :absent (f::riserva-full-text-physical-state slot))
               (eq :sealed (w::lotto-state batch)) (null (w::lotto-owner batch)))
    (error 'invariant-violation :reason :fulltext-reference-install))
  (setf (f::riserva-full-text-physical-state slot) :capturing
        (f::riserva-full-text-physical-offset slot) (+ (w::lotto-start batch) (f::riserva-full-text-record-start slot))
        (f::riserva-full-text-physical-version slot) (w::lotto-version batch)
        (f::riserva-full-text-put-high slot) high (f::riserva-full-text-put-low slot) low
        (f::riserva-full-text-physical-state slot) :sealed)
  (unless (and (eq :sealed (f::riserva-full-text-physical-state slot))
               (= (f::riserva-full-text-physical-offset slot) (+ (w::lotto-start batch) (f::riserva-full-text-record-start slot))))
    (error 'invariant-violation :reason :fulltext-reference-install))
  nil)

;;; REQ: REQ-SEC-004 REQ-SEC-006 REQ-SEC-010 REQ-WAL-005 REQ-CON-002
(declaim (ftype (function (t t t t t t) keyword) cattura-riferimento-put-full-text))
(defun cattura-riferimento-put-full-text (pool lease slot generation registry log)
  "Pre: transferred slot, SEALED batch with pending WAL token, before delivery to I/O.
Post: preallocated physical reference stable even after batch reuse.
No I/O, allocation, H/ACK, or commit: SEAL is only prepared in memory.
Rejections before effects; incomplete capture => pool/batch FAULTED, no rollback."
  (multiple-value-bind (batch incarnation number start end row) (leggi-legame-put-full-text pool lease slot generation)
    (declare (ignore incarnation number start end row)) ; il getter ne verifica integrita e lifetime.
    (multiple-value-bind (high low) (preflight-riferimento-put pool slot batch registry log)
      (let ((complete nil))
        (unwind-protect
             (progn
               (setf (f::riserve-full-text-effect pool) t)
               (installa-riferimento-put slot batch high low)
               (unless (and (eq :sealed (f::riserva-full-text-physical-state slot))
                            (= (f::riserva-full-text-physical-version slot) (w::lotto-version batch)))
                 (errore-riferimento-put pool batch :fulltext-reference-capture))
               (setf complete t) :sealed)
          (unless complete (setf (w::lotto-state batch) :faulted))
          (f::termina-effetto-riserve pool complete))))))

;;; REQ: REQ-SEC-004 REQ-SEC-006 REQ-WAL-005 REQ-CON-002
(declaim (ftype (function (t t t t) (values u32 u32 index index (integer 1 2) (member :csn :txid) u32 u32 &optional))
                leggi-riferimento-put-full-text))
(defun leggi-riferimento-put-full-text (pool lease slot generation)
  "Pre: transferred lease/token and fully captured reference. Post: row, segment,
offset, size, format, :CSN/:TXID, high,low; no read from the reusable WAL buffer.
Stamp :TXID is NOT an effective CSN. The reference does not prove durability, commit, or visibility.
INVALID-ARGUMENT if absent; invariants => pool FAULTED, without reclamation."
  (f::verifica-writer-riserve pool lease) (f::verifica-token-riserva pool slot generation)
  (unless (and (eq :transferred (f::riserva-full-text-state slot)) (eq :sealed (f::riserva-full-text-physical-state slot)))
    (error 'invalid-argument :reason :fulltext-reference-absent))
  (let ((flags (f::riserva-full-text-put-flags slot)))
    (unless (and (< (f::riserva-full-text-record-start slot) (f::riserva-full-text-record-end slot))
                 (or (zerop flags) (= flags r:+prepared+))
                 (or (plusp (f::riserva-full-text-put-high slot)) (plusp (f::riserva-full-text-put-low slot))))
      (f::errore-interno-riserve pool :fulltext-reference-state))
    (values (f::riserva-full-text-row slot) (f::riserve-full-text-segment pool)
            (f::riserva-full-text-physical-offset slot) (- (f::riserva-full-text-record-end slot) (f::riserva-full-text-record-start slot))
            (f::riserva-full-text-physical-version slot) (if (zerop flags) :csn :txid)
            (f::riserva-full-text-put-high slot) (f::riserva-full-text-put-low slot))))
