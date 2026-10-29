;;; OWNER: preparazione locale del lotto; nessun byte raggiunge il sink durante i preflight.
;;; SHARED: nessuno; array del piano preallocati e chiavi copiate dal singolo costruttore.
(in-package #:arcdocdb.index.page)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-IDX-009 REQ-LIM-003
(declaim (ftype (function (costruttore-pagine octets (simple-array (unsigned-byte 64) (5))
                         &key (:start index) (:end index)) entry-costruzione)
                crea-entry-costruzione))
(defun crea-entry-costruzione (builder key words &key (start 0) (end (length key)))
  "Pre: costruttore libero, candidato ordinario fidato. Post: chiave posseduta e digest dal seme della Serie.
START/END selezionano uno span copiato una sola volta, anche da un’arena piu' grande.
Rifiuta history, metadati incoerenti e record fuori formato; nessun I/O o prova di commit."
  (esigi-costruttore-libero builder)
  (arcdocdb.binary:check-range key start end)
  (unless (and (<= 1 (- end start) +max-key-bytes+) (zerop (aref words 4))
               (= (ldb (byte 32 32) (aref words 2)) (logior (- end start) (ash 1 16)))
               (zerop (ldb (byte 32 32) (aref words 3))))
    (error 'invalid-argument :reason :index-build-candidate))
  (let ((body (costruttore-pagine-body builder)))
    (fill body 0 :end +entry-bytes+)
    (scrivi-u64 body +entry-csn+ (aref words 0))
    (scrivi-u64 body +entry-location+ (aref words 1))
    (scrivi-u32 body +entry-length+ (aref words 3))
    (scrivi-u16 body +entry-key-length+ (- end start))
    (verifica-record-entry-pagina body 0 'invalid-argument))
  (multiple-value-bind (high low)
      (arcdocdb.hash64:xxh64 key start end (costruttore-pagine-seed-high builder) (costruttore-pagine-seed-low builder))
    (%make-entry-costruzione builder (subseq key start end) high low (aref words 0) (aref words 1) (aref words 3))))

;;; REQ: REQ-IDX-009 REQ-AFF-008
(declaim (ftype (function (costruttore-pagine (or null riferimento-costruito) (member :bucket :directory :any)) null)
                verifica-riferimento-costruito))
(defun verifica-riferimento-costruito (builder reference kind)
  "Pre: riferimento opzionale. Post: stesso dominio/owner, pagina gia' consegnata e tipo coerente.
INVALID-ARGUMENT prima degli effetti; una prova non autorizza riuso o pubblicazione durevole."
  (when reference
    (unless (and (eq (riferimento-costruito-owner reference) builder)
                 (< (identita-pagina-page (riferimento-costruito-identity reference)) (costruttore-pagine-offset builder))
                 (or (eq kind :any) (eq kind (riferimento-costruito-kind reference))))
      (error 'invalid-argument :reason :index-build-reference))) nil)

;;; REQ: REQ-IDX-001 REQ-IDX-009 REQ-LIM-003
(declaim (ftype (function (costruttore-pagine entry-costruzione) null) inserisci-entry-piano))
(defun inserisci-entry-piano (builder entry)
  "Pre: entry dello stesso costruttore, piano con capacita' sufficiente. Post: sonda flat canonica.
Chiave duplicata respinta prima di I/O; ciclo <= C e confronto soltanto dopo digest uguali."
  (unless (eq (entry-costruzione-owner entry) builder)
    (error 'invalid-argument :reason :index-build-entry-owner))
  (let* ((plan (costruttore-pagine-plan builder)) (capacity (length plan))
         (base (logand (ash (entry-costruzione-low entry) -7) (- capacity +page-group+))))
    (dotimes (i capacity)
      (let* ((slot (mod (+ base i) capacity)) (present (aref plan slot)))
        (unless present (setf (aref plan slot) entry) (return-from inserisci-entry-piano nil))
        (when (and (= (entry-costruzione-high entry) (entry-costruzione-high present))
                   (= (entry-costruzione-low entry) (entry-costruzione-low present))
                   (equalp (entry-costruzione-key entry) (entry-costruzione-key present)))
          (error 'invalid-argument :reason :index-build-duplicate-key))))
    (error 'invariant-violation :reason :index-build-plan-full)))

;;; REQ: REQ-IDX-009 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (costruttore-pagine index) null) verifica-budget-costruzione))
(defun verifica-budget-costruzione (builder pages)
  "Pre: lotto completamente pianificato, nessun effetto. Post: quota, identita' e sink pronti per tutto il lotto.
RESOURCE-EXHAUSTED per numero pagine/frontiera; callback preflight deve restituire NIL."
  (let ((bytes (* pages (costruttore-pagine-size builder))))
    (unless (and (plusp pages) (<= pages (- (costruttore-pagine-max-pages builder) (costruttore-pagine-written builder)))
                 (<= bytes (- +page-id-max+ (costruttore-pagine-offset builder))))
      (error 'arcdocdb.conditions:resource-exhausted :reason :index-build-page-budget))
    (unless (null (funcall (costruttore-pagine-preflight builder) bytes (costruttore-pagine-size builder)))
      (error 'invalid-argument :reason :index-build-preflight-result))) nil)

;;; REQ: REQ-IDX-009 REQ-LIM-003
(declaim (ftype (function (costruttore-pagine simple-vector (or null riferimento-costruito)) index) pianifica-bucket))
(defun pianifica-bucket (builder entries next)
  "Pre: BUSY con scratch esclusivi. Post: slot, inline/esterne e numero pagine esatti prima di append.
Input <=7/8 C, tipi/owner/duplicati verificati; memoria O(C), nessuna raccolta del dataset."
  (verifica-riferimento-costruito builder next :bucket)
  (let* ((plan (costruttore-pagine-plan builder)) (size (costruttore-pagine-size builder))
         (capacity (length plan)) (available (- size +page-header+ (* capacity (1+ +entry-bytes+)))) (pages 1))
    (when (> (length entries) (floor (* capacity 7) 8))
      (error 'arcdocdb.conditions:resource-exhausted :reason :index-build-bucket-capacity))
    (fill plan nil) (fill (costruttore-pagine-external builder) 0) (fill (costruttore-pagine-heads builder) 0)
    (loop for entry across entries do
      (unless (typep entry 'entry-costruzione) (error 'invalid-argument :reason :index-build-entry-type))
      (inserisci-entry-piano builder entry))
    (dotimes (slot capacity)
      (let ((entry (aref plan slot)))
        (when entry
          (let ((length (length (entry-costruzione-key entry))))
            (if (<= length available) (decf available length)
                (progn (setf (aref (costruttore-pagine-external builder) slot) 1)
                       (incf pages (ceiling length (- size +page-header+)))))))))
    (verifica-budget-costruzione builder pages)
    pages))
