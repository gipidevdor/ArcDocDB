;;; OWNER: attore I/O dello startup, prima di READY; risorse registrate nel cleanup del motore.
;;; SHARED: nessuno; selezione privata, nessun nuovo record nel catalogo o rename.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-010 REQ-REC-001 REQ-AFF-002
(declaim (ftype (function (motore octets integer integer (simple-array (unsigned-byte 64) (5))) boolean)
                verifica-candidato-immagine-motore))
(defun verifica-candidato-immagine-motore (engine key start end words)
  "Pre: verifica readonly prima di admission, scratch del derivato prestati immutabili.
Post: appartenenza esatta e payload normalizzato contro l'indice ricostruito dai WAL canonici.
Nessun candidato autorevole deriva dal footer; RETRY-LIMIT e' errore esplicito, mai assenza."
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

;;; REQ: REQ-IDX-010 REQ-REC-001 REQ-AFF-004 REQ-LIM-003
(declaim (ftype (function (motore) null) recupera-indice-paginato-motore))
(defun recupera-indice-paginato-motore (engine)
  "Pre: replay canonico finale completato e admission chiusa, namespace esclusivo.
Post: eventuale candidato readonly completamente verificato e adottato, FD posseduto fino al close.
Mancanza/corruzione/budget del candidato esplicito rifiutano startup, senza fallback o modifica al derivato.
Il checkpoint canonico puo' essere gia' completo; nessuna modifica di catalogo per il derivato."
  (unless (and (eq (motore-state engine) :recovering) (null (motore-paged engine)))
    (error 'invariant-violation :reason :engine-image-recovery-state))
  (let ((option (motore-image-option engine)))
    (when option
      (let* ((source (fonte-canonica-indice-motore engine))
             (view (arcdocdb.index.page:crea-vista-indice-paginato source)) (index (motore-index engine)))
        (osserva-motore engine :before-index-image)
        (multiple-value-bind (file eof)
            (io:apri-lettura-nella-directory (motore-directory engine) (opzione-indice-paginato-name option)
              :max-transfer (opzione-indice-paginato-size option) :max-file-bytes (opzione-indice-paginato-bytes option))
          (possiedi-file-motore engine file)
          (let ((image (arcdocdb.index.page:recupera-immagine-pagine file eof (opzione-indice-paginato-size option)
                         source (p::indice-primario-seed-high index) (p::indice-primario-seed-low index)
                         (lambda (key start end words) (verifica-candidato-immagine-motore engine key start end words))
                         :frames (opzione-indice-paginato-frames option)
                         :max-visits (opzione-indice-paginato-visits option))))
            (arcdocdb.index.page:pubblica-immagine-verificata view image)
            (setf (motore-paged engine) view)))
        (osserva-motore engine :index-image-ready))))
  nil)
