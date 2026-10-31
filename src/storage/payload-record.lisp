;;;; Confine record/payload: verifica CRC, tipo, flag e lunghezza prima dei conteggi.
(in-package #:arcdocdb.storage.format)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-FOR-002 REQ-FOR-003 REQ-AFF-008
(declaim (ftype (function (octets index index u8 integer index)
                         (values index index u8 &optional)) cornice-di-controllo))
(defun cornice-di-controllo (buffer start end kind version max-bytes)
  "Pre: stable record, explicit version from the file. Post: complete CRCs, type, and exact consumption.
Returns payload range and flags; CORRUPTION-DETECTED or UNSUPPORTED-FORMAT otherwise.
Does not materialize the u64 stamp; byte budget applied before any CRC scan."
  (check-range buffer start end)
  (unless (<= max-bytes +metadata-max-bytes+)
    (error 'invalid-argument :reason :metadata-byte-budget :offset start))
  (esigi-budget (- end start) (+ +header-bytes+ max-bytes) start)
  (multiple-value-bind (next actual-kind flags ks ke vs ve)
      (verifica-cornice buffer start end :version version)
    (declare (ignore ks ke)) ; il tipo di controllo impone chiave vuota nella cornice
    (unless (and (= next end) (= actual-kind kind))
      (error 'corruption-detected :reason :control-record :offset start))
    (values vs ve flags)))

;;; REQ: REQ-FOR-002 REQ-FOR-003 REQ-AFF-008
(declaim (ftype (function (octets index index &key (:version integer)
                                (:max-chiusi u32) (:max-rimossi u32)
                                (:max-esiti u32) (:max-bytes index))
                         (values index index index u32 index u32 u32 u8 &optional))
                verifica-record-edit))
(defun verifica-record-edit (buffer start end &key (version 0)
                            (max-chiusi +default-list-budget+)
                            (max-rimossi +default-list-budget+)
                            (max-esiti +default-list-budget+)
                            (max-bytes +metadata-max-bytes+))
  "Pre: stable range, mandatory version from the file (zero is not a format).
Post: EDIT record and payload fully verified; value/closed/removed ranges, count,
total outcomes, and flags. Propagates typed errors. Does not attest to commit or manifest state."
  (multiple-value-bind (vs ve flags) (cornice-di-controllo buffer start end +edit+ version max-bytes)
    (multiple-value-bind (cs cc rs rc total)
        (valida-valore-edit buffer vs ve flags :max-chiusi max-chiusi
                           :max-rimossi max-rimossi :max-esiti max-esiti :max-bytes max-bytes)
      (values vs ve cs cc rs rc total flags))))

;;; REQ: REQ-FOR-002 REQ-FOR-003 REQ-TXM-001 REQ-AFF-008
(declaim (ftype (function (octets index index &key (:version integer)
                                (:max-partecipanti u16) (:max-bytes index))
                         (values index index index u16 &optional)) verifica-record-decision))
(defun verifica-record-decision (buffer start end &key (version 0)
                                (max-partecipanti +max-participants+)
                                (max-bytes +metadata-max-bytes+))
  "Pre: stable range and explicit version from the file. Post: valid CRCs and DECISION structure.
Returns CSN offset, participant start/end, and count. Propagates typed errors.
TXID remains in the record stamp; catalog validity and commit belong to the owner."
  (multiple-value-bind (vs ve flags) (cornice-di-controllo buffer start end +decision+ version max-bytes)
    (declare (ignore flags)) ; la cornice impone zero per DECISION
    (valida-valore-decision buffer vs ve :max-partecipanti max-partecipanti :max-bytes max-bytes)))
