;;; OWNER: buffer candidato stabile nel worker; tuple private, nessun riferimento al corpo trattenuto.
;;; SHARED: il coordinatore attesta prefisso committed e CSN prepared prima dell'ingresso.
(in-package #:arcdocdb.recovery.selection)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-FOR-003 REQ-AFF-002 REQ-AFF-004
(declaim (ftype (function (selettore-versione-recuperata octets index index integer)
                         (values index u8 u8 u64 index index index index &optional))
                verifica-record-selezione))
(defun verifica-record-selezione (selector buffer start end version)
  "Pre: stable caller span. Post: original codec returns after complete CRC and shape verification.
Codec INVARIANT-VIOLATION faults selector and preserves cause; external rejections propagated."
  (handler-case (verifica-record buffer start end :version version)
    (invariant-violation (condition)
      (setf (selection-state selector) :faulted)
      (error condition))))

;;; REQ: REQ-REC-001 REQ-TXM-007 REQ-AFF-008
(declaim (ftype (function (u8 u64 (or null u64)) u64) csn-candidato-recuperato))
(defun csn-candidato-recuperato (flags stamp prepared-csn)
  "Pre: verified flags/header, record already admitted as committed by canonical recovery.
Post: ordinary stamp or explicit prepared CSN, including zero; TXID never interpreted as CSN.
INVALID-ARGUMENT for missing prepared proof or proof supplied for ordinary record; no 2PC decision here."
  (if (logtest flags +prepared+)
      (progn
        (unless prepared-csn (error 'invalid-argument :reason :recovery-selection-prepared-csn-required))
        prepared-csn)
      (progn
        (when prepared-csn (error 'invalid-argument :reason :recovery-selection-ordinary-csn))
        stamp)))

;;; REQ: REQ-REC-001 REQ-IDX-001 REQ-FOR-003 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (selettore-versione-recuperata octets index index u64 index integer (or null u64)) null)
                prepara-candidato-recuperato))
(defun prepara-candidato-recuperato (selector buffer start end segment offset version prepared-csn)
  "Pre: initialized key; stable buffer from authoritative segment/prefix, absolute physical offset.
Post: complete CRCs, key/type/offset and CSN verified before writing candidate scratch.
PUT/TOMBSTONE only; propagates codec conditions, rejections without modifying winner or state.
Does not prove SEAL, manifest membership, FD identity, or commit: caller reader obligations."
  (esigi-selettore-pronto selector)
  (multiple-value-bind (next kind flags stamp ks ke vs ve)
      (verifica-record-selezione selector buffer start end version)
    (declare (ignore vs ve)) ; range gia verificati integralmente dal codec; non indicano errore.
    (unless (or (= kind +put+) (= kind +tombstone+))
      (error 'invalid-argument :reason :recovery-selection-record-kind))
    (unless (chiave-selezione-uguale-p selector buffer ks ke)
      (error 'invalid-argument :reason :recovery-selection-record-key))
    (unless (<= arcdocdb.storage.format:+segment-header-bytes+ offset (- most-positive-fixnum (- next start)))
      (error 'invalid-argument :reason :recovery-selection-record-offset))
    (let ((csn (csn-candidato-recuperato flags stamp prepared-csn)) (words (selection-candidate selector)))
      (setf (aref words 0) csn (aref words 1) segment (aref words 2) offset
            (aref words 3) (- next start) (aref words 4) (logior kind (ash flags 8) (ash version 16))
            (aref words 5) (leggi-u32 buffer start)
            (aref words 6) (leggi-u32 buffer (+ start +body-crc-offset+)))))
  nil)
