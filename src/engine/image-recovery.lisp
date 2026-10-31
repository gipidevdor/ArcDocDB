;;; OWNER: attore I/O; verifica privata allo startup o durante richiesta BUSY, FD nel cleanup del motore.
;;; SHARED: nessuno; selezione privata, nessun nuovo record nel catalogo o rename.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-010 REQ-REC-001 REQ-AFF-002
(declaim (ftype (function (motore octets integer integer (simple-array (unsigned-byte 64) (5))) boolean)
                verifica-candidato-immagine-motore))
(defun verifica-candidato-immagine-motore (engine key start end words)
  "Pre: read-only verification at startup or during BUSY maintenance, immutable borrowed derivative scratch.
Post: exact membership and normalized payload checked against index rebuilt from canonical WALs.
No authoritative candidate derives from footer; RETRY-LIMIT is an explicit error, never absence."
  (multiple-value-bind (high low) (p:digest-chiave-indice (motore-index engine) key start end)
    (let ((expected (motore-words engine)))
      (case (p:leggi-indice-primario (motore-index engine) key start end high low
                                   (motore-index-context engine) expected)
        (:live
         (and (= (aref words 0) (aref expected 0)) (= (aref words 1) (aref expected 1))
              (= (aref words 2) (logand (aref expected 2) #xffffffff00000000))
              (= (aref words 3) (aref expected 3)) (= (aref words 4) (aref expected 4))))
        (:absent nil)
        (:retry-limit (error 'resource-exhausted :reason :engine-image-validator-budget))
        (otherwise (error 'invariant-violation :reason :engine-image-validator-result))))))

;;; REQ: REQ-IDX-010 REQ-REC-001 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (motore io:file-io index opzione-indice-paginato arcdocdb.index.page:fonte-indice)
                         arcdocdb.index.page:vista-indice-paginato) carica-vista-paginata-motore))
(defun carica-vista-paginata-motore (engine file eof option source)
  "Pre: exclusive owner, verified read-only file/EOF, stable canonical source.
Post: private view ready only after complete verification; neither transfers file nor modifies engine.
Codec/I/O/budget errors propagated; no fallback or authority inferred from derivative."
  (let* ((index (motore-index engine)) (view (arcdocdb.index.page:crea-vista-indice-paginato source))
         (image (arcdocdb.index.page:recupera-immagine-pagine file eof (opzione-indice-paginato-size option)
                  source (p::indice-primario-seed-high index) (p::indice-primario-seed-low index)
                  (lambda (key start end words) (verifica-candidato-immagine-motore engine key start end words))
                  :frames (opzione-indice-paginato-frames option) :max-visits (opzione-indice-paginato-visits option))))
    (arcdocdb.index.page:pubblica-immagine-verificata view image)
    view))

;;; REQ: REQ-IDX-010 REQ-REC-001 REQ-AFF-004 REQ-LIM-003
(declaim (ftype (function (motore) null) recupera-indice-paginato-motore))
(defun recupera-indice-paginato-motore (engine)
  "Pre: final canonical replay complete, admission closed, exclusive namespace.
Post: any read-only candidate fully verified and adopted, FD owned until close.
Missing/corrupt/over-budget explicit candidate prevents startup, without fallback or derivative modification.
Canonical checkpoint may already be complete; no catalog modification for derivative."
  (unless (and (eq (motore-state engine) :recovering) (null (motore-paged engine))
               (null (motore-paged-file engine)) (null (motore-paged-option engine)))
    (error 'invariant-violation :reason :engine-image-recovery-state))
  (let ((option (or (motore-image-option engine)
                    (when (motore-discovery-option engine)
                      (scopri-indice-paginato-motore engine (motore-discovery-option engine))))))
    (when option
      (let ((source (fonte-canonica-indice-motore engine))
            (revision (p::indice-primario-revision (motore-index engine))))
        (osserva-motore engine :before-index-image)
        (multiple-value-bind (file eof)
            (io:apri-lettura-nella-directory (motore-directory engine) (opzione-indice-paginato-name option)
              :max-transfer (opzione-indice-paginato-size option) :max-file-bytes (opzione-indice-paginato-bytes option))
          ;; Slot posseduto prima della verifica: anche lo startup incompleto lo chiude.
          (setf (motore-paged-file engine) file)
          (let ((view (carica-vista-paginata-motore engine file eof option source)))
            (verifica-fonte-startup-indice engine source revision)
            (setf (motore-paged engine) view (motore-paged-option engine) option)))
        (osserva-motore engine :index-image-ready)
        (verifica-fonte-startup-indice engine source revision))))
  nil)
