;;; OWNER: confine di completamento dell'attore I/O; file esatto del costruttore, non un nome.
;;; SHARED: nessuno; nessun record di commit, catalogo o decisione autonoma.
(in-package #:arcdocdb.index.page)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-010 REQ-AFF-008
(declaim (ftype (function (costruttore-pagine riferimento-costruito arcdocdb.io:file-io fonte-indice) sigillo-immagine)
                prepara-sigillo-immagine))
(defun prepara-sigillo-immagine (builder root file source)
  "Pre: costruttore libero. Post: file esatto, root ultima, prefisso di una pagina e conteggio coerenti.
Tutti i rifiuti avvengono prima degli effetti; il legame alla fonte e' fidato dal controller."
  (esigi-costruttore-libero builder)
  (verifica-riferimento-costruito builder root :any)
  (let* ((size (costruttore-pagine-size builder)) (identity (riferimento-costruito-identity root))
         (pages (costruttore-pagine-written builder)))
    (unless (and (eq file (costruttore-pagine-file builder))
                 (= (identita-pagina-page (costruttore-pagine-domain builder)) size)
                 (= (costruttore-pagine-offset builder) (* (+ pages 1) size))
                 (= (arcdocdb.io:posizione-scritta file) (costruttore-pagine-offset builder))
                 (= (identita-pagina-page identity) (* pages size))
                 (= (fonte-indice-count source) (riferimento-costruito-count root))
                 (equalp (fonte-indice-series source) (identita-pagina-serie identity)))
      (error 'invalid-argument :reason :index-image-seal-input))
    (arcdocdb.io:verifica-capienza-append file size size)
    (%make-sigillo-immagine source identity size pages (costruttore-pagine-seed-high builder)
                           (costruttore-pagine-seed-low builder))))

;;; REQ: REQ-IDX-010 REQ-AFF-001 REQ-AFF-008
(declaim (ftype (function (costruttore-pagine riferimento-costruito arcdocdb.io:file-io fonte-indice
                         &key (:observer (or null function))) sigillo-immagine) sigilla-immagine-pagine))
(defun sigilla-immagine-pagine (builder root file source &key observer)
  "Pre: root completa e fonte canonica stabile. Post: footer append e flush esatto, costruttore SEALED.
E' completamento del derivato, non commit dei dati. Errore dopo ammissione => FAULTED, mai riuso.
Observer iniettabile per le frontiere: :before-footer/:after-footer/:after-flush; ritorna NIL."
  (let* ((seal (prepara-sigillo-immagine builder root file source)) (size (sigillo-immagine-size seal))
         (end (+ (costruttore-pagine-offset builder) size)) (complete nil)
         (buffer (costruttore-pagine-buffer builder)))
    (scrivi-sigillo-immagine buffer seal)
    (setf (costruttore-pagine-busy builder) t)
    (unwind-protect
         (progn
           (dolist (phase '(:before-footer :after-footer :after-flush))
             (case phase
               (:before-footer nil)
               (:after-footer
                (unless (= (arcdocdb.io:append-esatto file buffer 0 size) end)
                  (error 'invariant-violation :reason :index-image-footer-append)))
               (:after-flush
                (unless (= (arcdocdb.io:durable-flush file) end)
                  (error 'invariant-violation :reason :index-image-flush)))
               (otherwise (error 'invariant-violation :reason :index-image-seal-phase)))
             (when observer
               (unless (null (funcall observer phase)) (error 'invalid-argument :reason :index-image-observer-result))))
           (setf (costruttore-pagine-state builder) :sealed complete t)
           seal)
      (unless complete (setf (costruttore-pagine-state builder) :faulted))
      (setf (costruttore-pagine-busy builder) nil))))
