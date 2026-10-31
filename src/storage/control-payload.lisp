;;;; Verifica strutturale completa dei payload EDIT/DECISION: non applica lo stato.
;;; OWNER: buffer stabile del chiamante, mantenuto referenziato finché gli span sono usati.
;;; SHARED: nessuno stato mutabile, lock o scrittura tra Serie.
(in-package #:arcdocdb.storage.format)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-FOR-003 REQ-AFF-008
(declaim (ftype (function (octets index index index) null) esigi-payload))
(defun esigi-payload (buffer start end max-bytes)
  "Pre: BUFFER octets; caller's interval and budget. Post: range within ceiling and budget.
INVALID-ARGUMENT for configuration; RESOURCE-EXHAUSTED before reading fields."
  (check-range buffer start end)
  (unless (<= max-bytes +metadata-max-bytes+)
    (error 'invalid-argument :reason :metadata-byte-budget :offset start))
  (esigi-budget (- end start) max-bytes start)
  nil)

;;; REQ: REQ-FOR-003 REQ-AFF-008 REQ-LIM-001
(declaim (ftype (function (octets index) null) verifica-lunghezza-chiusa))
(defun verifica-lunghezza-chiusa (buffer entry)
  "Pre: fixed 20-byte entry present. Post: valid-bytes between header and segment limit.
CORRUPTION-DETECTED for out-of-range length; u32 comparison without boxing."
  (let ((offset (+ entry +closed-valid-bytes-offset+)))
    (unless (and (zerop (leggi-u32 buffer (+ offset 4)))
                 (<= +segment-header-bytes+ (leggi-u32 buffer offset) +segment-max-bytes+))
      (error 'corruption-detected :reason :closed-valid-bytes :offset offset)))
  nil)

;;; REQ: REQ-FOR-003 REQ-AFF-008
(declaim (ftype (function (octets index index u32 u32 u32)
                         (values index u32 &optional)) scandisci-chiusi))
(defun scandisci-chiusi (buffer start end count max-chiusi max-esiti)
  "Pre: verified range; explicit budgets. Post: all entries/outcomes fully present.
Returns end and total outcomes; typed corruption or exhaustion, without copies.
Loop has COUNT iterations, checked against budget and minimum available bytes."
  (esigi-budget count max-chiusi start)
  (spazio-ripetuto start end count +closed-fixed-bytes+)
  (let ((pos start) (total 0))
    (dotimes (i count)
      (let* ((fixed-end (spazio-ripetuto pos end 1 +closed-fixed-bytes+))
             (outcomes (leggi-u32 buffer (+ pos +closed-outcome-count-offset+))))
        (verifica-lunghezza-chiusa buffer pos)
        (esigi-budget outcomes (- max-esiti total) pos)
        (setf pos (spazio-ripetuto fixed-end end outcomes +closure-outcome-bytes+))
        (incf total outcomes)))
    (unless (<= start pos end)
      (error 'invariant-violation :reason :closed-range :offset start))
    (values pos total)))

;;; REQ: REQ-FOR-003 REQ-AFF-008
(declaim (ftype (function (octets index index u8
                                &key (:max-chiusi u32) (:max-rimossi u32)
                                (:max-esiti u32) (:max-bytes index))
                         (values index u32 index u32 u32 &optional)) valida-valore-edit))
(defun valida-valore-edit (buffer start end flags
                         &key (max-chiusi +default-list-budget+)
                              (max-rimossi +default-list-budget+)
                              (max-esiti +default-list-budget+)
                              (max-bytes +metadata-max-bytes+))
  "Pre: stable payload; frame/CRC verified by caller, FLAGS from frame.
Post: complete closed/outcome/removed sections and exact consumption; closed span, count, removed span,
count, total outcomes. Does not verify ID uniqueness or manifest applicability.
Signals corruption or budget exhaustion; non-complete next-id must be zero."
  (esigi-payload buffer start end max-bytes)
  (unless (or (zerop flags) (= flags +edit-complete+))
    (error 'corruption-detected :reason :edit-flags :offset start))
  (when (< (- end start) +edit-min-bytes+)
    (error 'corruption-detected :reason :edit-truncated :offset start))
  (when (and (zerop flags) (not (u64-equal-p buffer (+ start +edit-next-id-offset+) 0)))
    (error 'corruption-detected :reason :edit-next-id :offset start))
  (let ((closed-start (+ start +edit-closed-start+))
        (count (leggi-u32 buffer (+ start +edit-closed-count-offset+))))
    (multiple-value-bind (removed-count-start outcomes)
        (scandisci-chiusi buffer closed-start (- end +count-bytes+) count max-chiusi max-esiti)
      (spazio-ripetuto removed-count-start end 1 +count-bytes+)
      (let* ((removed-count (leggi-u32 buffer removed-count-start))
             (removed-start (+ removed-count-start +count-bytes+)))
        (esigi-budget removed-count max-rimossi removed-count-start)
        (unless (= end (spazio-ripetuto removed-start end removed-count +removed-id-bytes+))
          (error 'corruption-detected :reason :edit-trailing-data :offset removed-start))
        (values closed-start count removed-start removed-count outcomes)))))

;;; REQ: REQ-FOR-003 REQ-TXM-001 REQ-AFF-008
(declaim (ftype (function (octets index index &key (:max-partecipanti u16)
                                (:max-bytes index))
                         (values index index index u16 &optional)) valida-valore-decision))
(defun valida-valore-decision (buffer start end
                             &key (max-partecipanti +max-participants+)
                                  (max-bytes +metadata-max-bytes+))
  "Pre: stable payload; frame/CRC already verified. Post: CSN and ID16 list fully present.
Returns CSN offset, list start/end, and count >=2. Does not verify catalog or uniqueness.
CORRUPTION-DETECTED for count/truncation/tail; RESOURCE-EXHAUSTED for budget."
  (esigi-payload buffer start end max-bytes)
  (when (< (- end start) +decision-parts-offset+)
    (error 'corruption-detected :reason :decision-truncated :offset start))
  (let ((count (leggi-u16 buffer (+ start +decision-count-offset+)))
        (parts-start (+ start +decision-parts-offset+)))
    (when (< count +min-participants+)
      (error 'corruption-detected :reason :decision-participants :offset start))
    (esigi-budget count max-partecipanti start)
    (unless (= end (spazio-ripetuto parts-start end count +participant-id-bytes+))
      (error 'corruption-detected :reason :decision-trailing-data :offset parts-start))
    (values (+ start +decision-csn-offset+) parts-start end count)))
