;;; OWNER: due FD locali al massimo; ogni close tentata, nessuna risorsa aggiunta all'handle M1.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-010 REQ-AFF-004
(declaim (ftype (function (motore (or null io:file-io) (or null io:file-io) boolean) null) chiudi-file-costruzione))
(defun chiudi-file-costruzione (engine append input complete)
  "Pre: local FDs only, no active borrower. Post: both attempted; primary condition/nonlocal exit preserved.
If work was complete, a cleanup fault prevents success with ERRORE-CLEANUP-MOTORE."
  (let ((previous (motore-cleanup-failures engine)))
    (dolist (file (list input append))
      (when file (tenta-cleanup-motore engine (lambda () (io:chiudi file)))))
    (when (and complete (not (eq previous (motore-cleanup-failures engine))))
      (error 'errore-cleanup-motore :reason :engine-image-build-cleanup :primary nil
             :errors (reverse (copy-list (motore-cleanup-failures engine))))))
  nil)

;;; REQ: REQ-IDX-010 REQ-AFF-008
(declaim (ftype (function (motore piano-immagine-motore) null) verifica-fonte-costruzione))
(defun verifica-fonte-costruzione (engine plan)
  "Pre: BUSY owner, before footer and after readonly verification. Post: health, revision, and source intact.
INVARIANT-VIOLATION for mutation/reentry outside protocol; no derivative adopted or data ACK."
  (p::esigi-indice-sano (motore-index engine))
  (unless (and (motore-busy engine)
               (= (piano-immagine-motore-revision plan) (p::indice-primario-revision (motore-index engine)))
               (arcdocdb.index.page::stessa-fonte-indice-p (piano-immagine-motore-source plan)
                                                         (fonte-canonica-indice-motore engine)))
    (error 'invariant-violation :reason :engine-image-build-source-changed))
  nil)

;;; REQ: REQ-IDX-009 REQ-IDX-010 REQ-AFF-001 REQ-AFF-004
(declaim (ftype (function (motore opzione-indice-paginato piano-immagine-motore index) null) esegui-costruzione-immagine))
(defun esegui-costruzione-immagine (engine option plan max-pages)
  "Pre: admitted owner and complete plan; free leaf name. Post: sealed image, parent fsync, and readonly verification.
Derived preparation, no new data commit/rename/catalog. File never overwritten; incomplete file retained.
Local FDs closed even on errors/nonlocal exits; caller closes admission on failure."
  (let ((append nil) (input nil) (complete nil) (size (opzione-indice-paginato-size option)))
    (unwind-protect
         (progn
           (setf append (io:crea-temporaneo-nella-directory (motore-directory engine)
                          (opzione-indice-paginato-name option) :max-transfer size
                          :max-file-bytes (opzione-indice-paginato-bytes option)))
           (osserva-motore engine :image-build-created)
           (unless (= size (io:append-esatto append (make-array size :element-type '(unsigned-byte 8) :initial-element 0) 0 size))
             (error 'invariant-violation :reason :engine-image-build-prefix))
           (let* ((index (motore-index engine))
                  (builder (arcdocdb.index.page:crea-costruttore-pagine-file append
                             (arcdocdb.index.page:crea-identita-pagina (motore-series-id engine) (id-immagine-costruzione option) size 1)
                             size (p::indice-primario-seed-high index) (p::indice-primario-seed-low index)
                             :max-pages max-pages))
                  (root (emetti-albero-costruzione plan builder 0 (length (piano-immagine-motore-order plan)) 64 0)))
             (osserva-motore engine :image-build-pages)
             (verifica-fonte-costruzione engine plan)
             (arcdocdb.index.page:sigilla-immagine-pagine builder root append (piano-immagine-motore-source plan)
               :observer (lambda (phase) (osserva-motore engine (case phase
                                           (:before-footer :image-build-before-footer)
                                           (:after-footer :image-build-after-footer)
                                           (:after-flush :image-build-after-flush)
                                           (otherwise (error 'invariant-violation :reason :engine-image-build-phase)))))))
           (io:durable-flush (motore-directory engine))
           (io:chiudi append)
           (multiple-value-bind (file eof)
               (io:apri-lettura-nella-directory (motore-directory engine) (opzione-indice-paginato-name option)
                 :max-transfer size :max-file-bytes (opzione-indice-paginato-bytes option))
             (setf input file)
             (arcdocdb.index.page:recupera-immagine-pagine input eof size (piano-immagine-motore-source plan)
               (p::indice-primario-seed-high (motore-index engine)) (p::indice-primario-seed-low (motore-index engine))
               (lambda (key start end words) (verifica-candidato-immagine-motore engine key start end words))
               :frames (opzione-indice-paginato-frames option) :max-visits (opzione-indice-paginato-visits option)))
           (verifica-fonte-costruzione engine plan)
           (osserva-motore engine :image-build-verified)
           (setf complete t))
      (chiudi-file-costruzione engine append input complete)))
  nil)
