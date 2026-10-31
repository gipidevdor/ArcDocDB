;;; OWNER: il worker confronta e copia solo tuple private della stessa chiave.
;;; SHARED: selettori distinti lavorano in parallelo; nessun aggiornamento dell'indice pubblico.
(in-package #:arcdocdb.recovery.selection)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-IDX-001 REQ-IDX-006 REQ-AFF-008
(declaim (ftype (function (selettore-versione-recuperata)
                         (member :selected :kept :duplicate :ambiguous)) confronta-versioni-recuperate))
(defun confronta-versioni-recuperate (selector)
  "Pre: verified tuples for one key. Post: maximum CSN; on a tie, greater offset within the same segment.
Equal CSN across different segments or differing metadata at the same location => AMBIGUOUS.
No segment-id ordering, lineage assumption, or body equality inferred from CRCs."
  (verifica-tupla-selezione selector (selection-current selector))
  (verifica-tupla-selezione selector (selection-candidate selector))
  (let ((current (selection-current selector)) (candidate (selection-candidate selector)))
    (cond ((> (aref candidate 0) (aref current 0)) :selected)
          ((< (aref candidate 0) (aref current 0)) :kept)
          ((/= (aref candidate 1) (aref current 1)) :ambiguous)
          ((> (aref candidate 2) (aref current 2)) :selected)
          ((< (aref candidate 2) (aref current 2)) :kept)
          ((loop for i from 3 below +selection-words+ always (= (aref current i) (aref candidate i))) :duplicate)
          (t :ambiguous))))

;;; REQ: REQ-REC-001 REQ-IDX-006 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (selettore-versione-recuperata) null) adotta-candidato-recuperato))
(defun adotta-candidato-recuperato (selector)
  "Pre: verified winning candidate. Post: tuple copied; previous ambiguity retained unless CSN is greater.
Copy interruption => terminal FAULTED; no partial tuple delivered."
  (esigi-selettore-pronto selector)
  (verifica-tupla-selezione selector (selection-candidate selector))
  (let* ((current (selection-current selector)) (candidate (selection-candidate selector))
         (ambiguous (and (eq (selection-state selector) :ambiguous) (= (aref current 0) (aref candidate 0))))
         (complete nil))
    (unwind-protect
         (progn
           (replace current candidate)
           (setf (selection-state selector) (if ambiguous :ambiguous :selected))
           (unless (equalp current candidate)
             (error 'invariant-violation :reason :recovery-selection-copy))
           (setf complete t))
      (unless complete (setf (selection-state selector) :faulted))))
  nil)

;;; REQ: REQ-REC-001 REQ-IDX-001 REQ-IDX-006 REQ-FOR-003 REQ-TXM-007 REQ-AFF-008
(declaim (ftype (function (selettore-versione-recuperata octets index index u64 index
                          &key (:version integer) (:prepared-csn (or null u64)))
                         (member :selected :kept :duplicate :ambiguous)) considera-record-recuperato))
(defun considera-record-recuperato (selector buffer start end segment offset &key (version 2) (prepared-csn nil))
  "Pre: exclusive worker; only committed records for the key, canonical prefixes, immutable files.
OFFSET is absolute in file, distinct from START in buffer; prepared requires CSN from authoritative resolution.
Post: provisional order-independent PUT/TOMBSTONE winner, or AMBIGUOUS without a deliverable result.
Ambiguity resolved only by strictly greater CSN or explicit abandonment of the key.
Invalid CRC/shape/range does not modify winner; no I/O, allocated CSN, or published index."
  (prepara-candidato-recuperato selector buffer start end segment offset version prepared-csn)
  (let ((result (if (eq (selection-state selector) :ready) :selected
                    (confronta-versioni-recuperate selector))))
    (case result
      (:selected (adotta-candidato-recuperato selector))
      (:ambiguous (setf (selection-state selector) :ambiguous))
      ((:kept :duplicate) nil)
      (otherwise
       (setf (selection-state selector) :faulted)
       (error 'invariant-violation :reason :recovery-selection-result)))
    (if (eq (selection-state selector) :ambiguous) :ambiguous result)))
