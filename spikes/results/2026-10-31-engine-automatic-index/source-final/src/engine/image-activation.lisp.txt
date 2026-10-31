;;; OWNER: attore I/O M1, nessun GET concorrente; una sola capacita' paginata posseduta dal motore.
;;; SHARED: nessuno; pubblicazione privata in memoria, senza catalogo o commit dati.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-010 REQ-LIM-003
(declaim (ftype (function (motore opzione-indice-paginato) index) payload-attivazione-immagine))
(defun payload-attivazione-immagine (engine option)
  "Pre: owner READY, configurazioni canoniche. Post: riserva conservativa dei payload vecchi e nuovi.
Comprende vecchio reader/cache/delta, nuova verifica e array piccoli; esclude oggetti/header/GC/RSS."
  (let ((old (motore-paged-option engine)))
    (+ 65536 arcdocdb.record:+max-key-bytes+ 80
       (* (opzione-indice-paginato-size option) (+ 5 (opzione-indice-paginato-frames option)))
       (if (motore-delta engine)
           (payload-delta-allocato (motore-delta engine)) 0)
       (if old (* (opzione-indice-paginato-size old) (+ 2 (opzione-indice-paginato-frames old))) 0))))

;;; REQ: REQ-IDX-010 REQ-AFF-008
(declaim (ftype (function (motore arcdocdb.index.page:fonte-indice index) null) verifica-fonte-attivazione))
(defun verifica-fonte-attivazione (engine source revision)
  "Pre: owner BUSY dopo verifica del candidato, prima della pubblicazione.
Post: stessa fonte e revisione; INVARIANT-VIOLATION per mutazione o fase errata, nessuno swap."
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
  "Pre: candidato verificato della fonte corrente e file locale vivo; owner BUSY senza borrower.
Post: ownership e root trasferite, poi un solo close del precedente. Nessun commit durevole.
Errore dopo lo swap non ripristina un file gia' chiuso; il confine chiamante rende FAULTED."
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
  "Pre: richiesta BUSY, quota payload verificata. Post: root completa e file posseduti dal motore.
Prima dello swap ogni uscita chiude soltanto il candidato e conserva la vecchia root.
Dopo lo swap il cleanup finale dell'handle possiede il nuovo file, anche su nonlocal exit."
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
  "Pre: owner READY seriale, candidato esistente immutabile; quota payload separata da runtime/GC.
Post: GET paginato con delta opzionale bounded senza riavvio; una sola capacita' attiva, nessun CSN o file modificato.
Preflight invalido/esaurito preserva READY. Ogni errore/nonlocal exit ammesso rende FAULTED,
conservando la causa; prima della pubblicazione la vecchia root resta intatta, senza fallback."
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
