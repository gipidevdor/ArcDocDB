;;; OWNER: attore I/O M1, nessun GET concorrente; una sola capacita' paginata posseduta dal motore.
;;; SHARED: nessuno; pubblicazione privata in memoria, senza catalogo o commit dati.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-010 REQ-LIM-003
(declaim (ftype (function (motore opzione-indice-paginato) index) payload-attivazione-immagine))
(defun payload-attivazione-immagine (engine option)
  "Pre: READY owner, canonical configurations. Post: conservative reservation of old and new payloads.
Includes old reader/cache/delta, new verification, and small arrays; excludes objects/headers/GC/RSS."
  (let ((old (motore-paged-option engine)))
    (+ 65536 arcdocdb.record:+max-key-bytes+ 80
       (* (opzione-indice-paginato-size option) (+ 5 (opzione-indice-paginato-frames option)))
       (if (motore-delta engine)
           (payload-delta-allocato (motore-delta engine)) 0)
       (if old (* (opzione-indice-paginato-size old) (+ 2 (opzione-indice-paginato-frames old))) 0))))

;;; REQ: REQ-IDX-010 REQ-AFF-008
(declaim (ftype (function (motore arcdocdb.index.page:fonte-indice index) null) verifica-fonte-attivazione))
(defun verifica-fonte-attivazione (engine source revision)
  "Pre: BUSY owner after candidate verification, before publication.
Post: same source and revision; INVARIANT-VIOLATION for mutation or wrong phase, no swap."
  (p::esigi-indice-sano (motore-index engine))
  (unless (and (motore-busy engine) (= revision (p::indice-primario-revision (motore-index engine)))
               (arcdocdb.index.page::stessa-fonte-indice-p source (fonte-canonica-indice-motore engine)))
    (error 'invariant-violation :reason :engine-image-activation-source-changed))
  nil)

;;; REQ: REQ-IDX-010 REQ-IDX-012 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (motore arcdocdb.index.page:vista-indice-paginato io:file-io opzione-indice-paginato
                         &optional (or null delta-indice-motore)) null)
                installa-vista-paginata-motore))
(defun installa-vista-paginata-motore (engine view file option &optional delta)
  "Pre: verified candidate for current source and live local file; BUSY owner without borrower.
Post: ownership and root transferred, then one close of the previous file. No durable commit.
An error after swap does not restore an already closed file; caller boundary makes the engine FAULTED."
  (esigi-owner-motore engine)
  (let ((proof (arcdocdb.index.page::vista-indice-paginato-current view)) (old (motore-paged-file engine)))
    (unless (and (motore-busy engine) proof (not (eq old file))
                 (eq file (arcdocdb.index.page::immagine-indice-verificata-file proof)))
      (error 'invariant-violation :reason :engine-image-activation-binding))
    (setf (motore-delta engine) delta (motore-paged-file engine) file (motore-paged-option engine) option (motore-paged engine) view)
    (unless delta (setf (motore-auto-renewal engine) nil (motore-auto-renewals-used engine) 0))
    (when old (io:chiudi old)))
  nil)

;;; REQ: REQ-IDX-010 REQ-AFF-004 REQ-LIM-003
(declaim (ftype (function (motore opzione-indice-paginato &optional (or null delta-indice-motore)) null) prepara-attivazione-immagine))
(defun prepara-attivazione-immagine (engine option &optional delta)
  "Pre: BUSY request, verified payload quota. Post: complete root and files owned by engine.
Before swap, every exit closes only the candidate and preserves the old root.
After swap, final handle cleanup owns the new file, even on nonlocal exit."
  (let ((input nil) (source (fonte-canonica-indice-motore engine))
        (revision (p::indice-primario-revision (motore-index engine))))
    (unwind-protect
         (progn
           (osserva-motore engine :before-image-activation)
           (multiple-value-bind (file eof)
               (io:apri-lettura-nella-directory (motore-directory engine) (opzione-indice-paginato-name option)
                 :max-transfer (opzione-indice-paginato-size option) :max-file-bytes (opzione-indice-paginato-bytes option))
             (setf input file)
             (let ((view (carica-vista-paginata-motore engine file eof option source)))
               (osserva-motore engine :image-activation-verified)
               (osserva-motore engine :before-image-publication)
               (verifica-fonte-attivazione engine source revision)
               (installa-vista-paginata-motore engine view file option delta)))
           (osserva-motore engine :image-published))
      (when (and input (not (eq input (motore-paged-file engine))))
        (tenta-cleanup-motore engine (lambda () (io:chiudi input))))))
  nil)

;;; REQ: REQ-IDX-010 REQ-AFF-001 REQ-AFF-004 REQ-CON-002 REQ-LIM-003
(declaim (ftype (function (motore opzione-indice-paginato &key (:max-activation-payload t) (:delta-keys t) (:delta-key-bytes t)) null)
                attiva-indice-paginato-motore))
(defun attiva-indice-paginato-motore (engine option &key (max-activation-payload 16777216)
                                                       (delta-keys 0) (delta-key-bytes 0))
  "Pre: serial READY owner, existing immutable candidate; payload quota separate from runtime/GC.
Post: paged GET with optional bounded delta without restart; one active capability, no CSN or file modified.
Invalid/exhausted preflight preserves READY. Every admitted error/nonlocal exit makes the engine FAULTED,
preserving the cause; before publication the old root remains intact, without fallback."
  (esigi-motore-pronto engine)
  (when (motore-automatic-index engine) (error 'invalid-argument :reason :engine-legacy-profile-required))
  (unless (typep max-activation-payload '(integer 0 536870912))
    (error 'invalid-argument :reason :engine-image-activation-configuration))
  (when (> (+ (payload-attivazione-immagine engine option)
              (payload-delta-indice delta-keys delta-key-bytes)) max-activation-payload)
    (error 'resource-exhausted :reason :engine-image-activation-memory))
  (let ((complete nil) (cause nil))
    (unwind-protect
         (handler-case
             (progn
               (setf (motore-busy engine) t)
               (prepara-attivazione-immagine engine option (crea-delta-configurato-motore engine delta-keys delta-key-bytes))
               (unless (and (motore-busy engine) (eq (motore-state engine) :ready)
                            (eq (s:stato-controllore-serie (motore-controller engine)) :healthy))
                 (error 'invariant-violation :reason :engine-image-activation-state))
               (setf complete t)
               nil)
           (error (condition)
             (setf cause condition)
             (tenta-cleanup-motore engine (lambda () (guasta-motore engine condition)))
             (error condition)))
      (unwind-protect
           (unless (or complete cause)
             (tenta-cleanup-motore engine (lambda () (guasta-motore engine
                (make-condition 'invariant-violation :reason :engine-image-activation-unwind)))))
        (setf (motore-busy engine) nil)))))
