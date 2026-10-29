;;; OWNER: confine readonly del controller, file/EOF osservati e mantenuti stabili fino al ritiro.
;;; SHARED: nessuno; senza modifica, close, rinomina o cancellazione dei file esistenti.
(in-package #:arcdocdb.index.page)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-010 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (arcdocdb.io:file-io t t t t t) null) preflight-recovery-immagine))
(defun preflight-recovery-immagine (file eof size validator frames visits)
  "Pre: EOF esatto osservato dal controller, namespace stabile, sola lettura. Post: limiti prima di I/O/allocazioni.
INVALID-ARGUMENT per domini, RESOURCE-EXHAUSTED per budget iniziale; nessun risultato parziale."
  (unless (and (member size '(4096 16384 65536)) (typep eof 'index) (functionp validator)
               (typep frames '(integer 1 64)) (typep visits '(integer 1 #.+page-id-max+)))
    (error 'invalid-argument :reason :index-image-recovery-configuration))
  (unless (and (>= eof (* 3 size)) (zerop (mod eof size)) (<= eof (* 65538 size)))
    (error 'corruption-detected :reason :index-image-size))
  (when (< visits 2) (error 'arcdocdb.conditions:resource-exhausted :reason :index-image-visit-budget))
  (arcdocdb.io:verifica-capienza-lettura file size) nil)

;;; REQ: REQ-IDX-010 REQ-LIM-003
(declaim (ftype (function (arcdocdb.io:file-io sigillo-immagine function index index) ispezione-immagine)
                prepara-ispezione-immagine))
(defun prepara-ispezione-immagine (file seal validator frames visits)
  "Pre: footer/fonte/prefisso verificati. Post: memoria O(frame*size + size + 65535), nessuna bitmap dataset.
Il controller include anche metadati e transitori/GC nella propria riserva; non si misura RSS."
  (let* ((size (sigillo-immagine-size seal)) (root (sigillo-immagine-root seal))
         (cache (crea-cache-pagine-file size frames file))
         (reader (crea-lettore-indice-pagine cache root :max-pages (sigillo-immagine-pages seal)
                                                    :max-key-bytes 16777216)))
    (%make-ispezione-immagine :file file :seal seal :reader reader
      :cursor (crea-identita-pagina (identita-pagina-serie root) (identita-pagina-image root)
                                   (identita-pagina-page root) (identita-pagina-generation root))
      :scan (make-array size :element-type '(unsigned-byte 8) :initial-element 0)
      :fragment (make-array size :element-type '(unsigned-byte 8) :initial-element 0)
      :key (make-array +max-key-bytes+ :element-type '(unsigned-byte 8) :initial-element 0)
      :expected (make-array 5 :element-type '(unsigned-byte 64) :initial-element 0)
      :actual (make-array 5 :element-type '(unsigned-byte 64) :initial-element 0)
      :validator validator :remaining (- visits 2))))

;;; REQ: REQ-IDX-010 REQ-REC-001 REQ-LIM-003 REQ-AFF-002
(declaim (ftype (function (arcdocdb.io:file-io t t fonte-indice u32 u32 t
                         &key (:frames t) (:max-visits t)) immagine-indice-verificata) recupera-immagine-pagine))
(defun recupera-immagine-pagine (file eof size source seed-high seed-low validator &key (frames 2) (max-visits 16777216))
  "Pre: file readonly immutabile prestato, EOF esatto dal gate I/O, fonte canonica e validatore non rientrante.
Post: prova adottabile soltanto dopo tutti i controlli; nessun append, fallback o mutazione della fonte.
Validator(key,start,end,words) attesta appartenenza esatta alla fonte e non modifica/trattiene gli scratch.
Errori del derivato propagati al controller, che decide esplicitamente ricostruzione o errore."
  (preflight-recovery-immagine file eof size validator frames max-visits)
  (let ((buffer (make-array size :element-type '(unsigned-byte 8) :initial-element 0)))
    (unless (= (arcdocdb.io:leggi-esatto file buffer 0 size (- eof size)) size)
      (error 'invariant-violation :reason :index-image-footer-read))
    (let ((seal (leggi-sigillo-immagine buffer eof source seed-high seed-low)))
      (unless (= (arcdocdb.io:leggi-esatto file buffer 0 size 0) size)
        (error 'invariant-violation :reason :index-image-prefix-read))
      (unless (pagina-zero-p buffer 0 size) (error 'corruption-detected :reason :index-image-prefix))
      (let ((work (prepara-ispezione-immagine file seal validator frames max-visits)))
        (verifica-pagine-immagine work)
        (arcdocdb.io:verifica-capienza-lettura file size)
        (%make-immagine-indice-verificata file seal (ispezione-immagine-reader work))))))
