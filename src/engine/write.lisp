;;; OWNER: thread proprietario del motore; writer e attore I/O seriale coincidono in M1.
;;; SHARED: nessun reader concorrente; MOTORE-BUSY chiude il rientro anche nei callback.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-FOR-003 REQ-LIM-001 REQ-LIM-003 REQ-AFF-008 REQ-IDX-010
(declaim (ftype (function (motore (member 1 2) b:octets b:octets) b:index)
                verifica-input-scrittura-motore))
(defun verifica-input-scrittura-motore (engine kind key value)
  "Pre: owner, READY engine, stable input octets. Post: sizes and aliases validated
before modifying the batch or taking a CSN. INVALID-ARGUMENT for input shape,
RESOURCE-EXHAUSTED for format/budget; batch and group remain unchanged."
  (unless (<= 1 (length key) arcdocdb.record:+max-key-bytes+)
    (error 'arcdocdb.conditions:invalid-argument :reason :engine-key-length))
  (unless (if (= kind arcdocdb.record:+put+)
              (<= 1 (length value) arcdocdb.record:+max-document-bytes+)
              (zerop (length value)))
    (error 'arcdocdb.conditions:invalid-argument :reason :engine-value-length))
  (let* ((batch (motore-batch engine))
         (size (arcdocdb.record::encoding-size
                (w::lotto-buffer batch) 0 kind 0 key value (w::lotto-version batch)
                arcdocdb.record:+max-document-bytes+)))
    (when (> size (motore-max-record-bytes engine))
      (error 'arcdocdb.conditions:resource-exhausted :reason :engine-record-budget))
    size))

;;; REQ: REQ-WAL-002 REQ-WAL-005 REQ-WAL-006 REQ-MVC-008 REQ-IDX-001 REQ-AFF-001
(declaim (ftype (function (motore (member 1 2) b:octets b:octets) b:u64)
                commetti-record-motore))
(defun commetti-record-motore (engine kind key value)
  "Pre: owner, validated input, MOTORE-BUSY true; one batch containing one record and one group containing one batch.
Post: durable SEAL, root published and CSN resolved, index updated, capabilities reused.
Root before index: serial exclusion and the engine gate are mandatory.
Every error/incomplete exit requires FAULTED at the calling boundary, without rollback."
  (let* ((controller (motore-controller engine)) (lease (motore-lease engine))
         (batch (motore-batch engine)) (group (motore-group engine))
         (append (motore-append engine))
         (log (a:log-segmento-attivo-preparato (motore-active engine)))
         (previous (s:leggi-radice-serie controller))
         (start (io:posizione-scritta append)))
    (unless (and (eq (w:stato-lotto batch) :open) (zerop (w:lunghezza-lotto batch))
                 (eq (w:stato-csn-lotto batch) :libero)
                 (eq (w:stato-gruppo group) :building))
      (error 'arcdocdb.conditions:invariant-violation :reason :engine-write-residue))
    (w:aggiungi-record batch kind key value)
    ;; Catturare la sola cornice prima che SEAL aumenti LUNGHEZZA-LOTTO.
    (let* ((record-bytes (w:lunghezza-lotto batch))
           (total (+ record-bytes w::+seal-total+)))
      (io:verifica-capienza-append append total total)
      (r:verifica-capienza-get-attiva (motore-source engine) lease batch previous)
      (multiple-value-bind (sealed-bytes high low)
          (w:sigilla-lotto-con-csn batch (motore-registry engine) log start
                                 (io:posizione-durevole append))
        (declare (type b:u32 high low))
        (unless (= sealed-bytes total)
          (error 'arcdocdb.conditions:invariant-violation :reason :engine-sealed-size))
        (let ((csn (logior (ash high 32) low)) (segment (w::log-io-file-id log)))
          (declare (type b:u64 csn segment))
          (multiple-value-bind (event generation)
              (gd:registra-lotto-fonti-get-attivo
               (motore-source engine) lease batch previous (motore-sources engine) :strong)
            (s:inizia-io-commit-serie controller lease event generation)
            (w:aggiungi-lotto group batch)
            (w:chiudi-gruppo group)
            (osserva-motore engine :before-append)
            (w:scrivi-gruppo group)
            (osserva-motore engine :after-append)
            (w:sincronizza-gruppo group)
            (osserva-motore engine :after-flush)
            (multiple-value-bind (status published-high published-low)
                (s:pubblica-commit-serie controller lease event generation)
              (unless (eq status :risolto)
                (error 'arcdocdb.conditions:resource-exhausted :reason :engine-commit-pending))
              (unless (and (= high published-high) (= low published-low))
                (error 'arcdocdb.conditions:invariant-violation :reason :engine-commit-csn)))
            (pubblica-location-motore engine kind key csn segment start record-bytes)
            (s:completa-io-commit-serie controller lease event generation)
            (w:riusa-gruppo group)
            ;; RIUSA-COMMIT-SERIE riapre anche il lotto; nessun secondo RIUSA-LOTTO.
            (s:riusa-commit-serie controller lease event generation)
            (osserva-motore engine :after-commit)
            csn))))))

;;; REQ: REQ-WAL-005 REQ-WAL-006 REQ-CON-002 REQ-AFF-001 REQ-AFF-004 REQ-IDX-012
(declaim (ftype (function (motore (member 1 2) b:octets b:octets) b:u64)
                scrivi-record-motore))
(defun scrivi-record-motore (engine kind key value)
  "Pre: caller is the owner; no other API active on the engine. Post: confirmed u64 CSN.
Input rejected during preflight without consuming a CSN or dirtying the batch. After entry
with MOTORE-BUSY, every error sets FAULTED and propagates the same condition; incomplete THROW/RETURN
also set FAULTED. Rotation, optional renewal, and commit share BUSY; no reentry from callbacks."
  (esigi-motore-pronto engine)
  (let ((record-bytes (verifica-input-scrittura-motore engine kind key value)))
    (verifica-capienza-indice-motore engine kind key)
    (let ((rotation (preflight-rotazione-motore engine record-bytes))
          (renewal (preflight-rinnovo-scrittura engine key)) (complete nil) (cause nil))
      (unwind-protect
           (handler-case
               (progn
                 (setf (motore-busy engine) t)
                 (when rotation (ruota-segmento-motore engine))
                 (if (motore-automatic-index engine)
                     (prepare-automatic-index engine kind key 0 (length key))
                     (prepara-indice-scrittura-ammessa engine key renewal))
                 (let ((csn (commetti-record-motore engine kind key value)))
                   (declare (type b:u64 csn))
                   (unless (and (motore-busy engine) (eq (motore-state engine) :ready)
                                (eq (s:stato-controllore-serie (motore-controller engine)) :healthy))
                     (error 'arcdocdb.conditions:invariant-violation :reason :engine-write-state))
                   (when (motore-automatic-index engine)
                     (return-automatic-resident engine) (require-automatic-admission engine))
                   (setf complete t)
                   csn))
             (error (condition)
               (setf cause condition)
               (handler-case (guasta-motore engine condition)
                 (error (cleanup) (push cleanup (motore-cleanup-failures engine))))
               (error condition)))
        (unwind-protect
             (unless (or complete cause)
               (handler-case
                   (guasta-motore engine
                                  (make-condition 'arcdocdb.conditions:invariant-violation
                                                  :reason :engine-write-unwind))
                 (error (cleanup) (push cleanup (motore-cleanup-failures engine)))))
          (setf (motore-busy engine) nil))))))

;;; REQ: REQ-IDX-001 REQ-WAL-005 REQ-WAL-006 REQ-AFF-004 REQ-LIM-001
(declaim (ftype (function (motore b:octets b:octets) b:u64) scrivi-documento))
(defun scrivi-documento (engine key value)
  "Pre: owner thread, READY engine, KEY/VALUE octets stable until return; nonreentrant API.
Post: ordinary PUT durable and readable, full u64 CSN returned after publication
and reuse. Invalid input before CSN; any commit error makes the engine FAULTED
and propagates the original cause. No partial confirmation or automatic repetition."
  (scrivi-record-motore engine arcdocdb.record:+put+ key value))

;;; REQ: REQ-IDX-001 REQ-WAL-005 REQ-WAL-006 REQ-AFF-004 REQ-LIM-001
(declaim (ftype (function (motore b:octets) b:u64) cancella-documento))
(defun cancella-documento (engine key)
  "Pre: owner thread, READY engine, stable KEY octets; nonreentrant API.
Post: ordinary durable tombstone, key absent from the index, full u64 CSN.
A key already absent still produces a commit. Same preflight and FAULTED boundary
as SCRIVI-DOCUMENTO; the empty value is the one preallocated in the engine."
  (scrivi-record-motore engine arcdocdb.record:+tombstone+ key (motore-empty engine)))
