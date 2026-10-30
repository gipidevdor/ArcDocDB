;;; OWNER: attore M1 in RECOVERING, directory esclusiva; un solo FD locale alla volta.
;;; SHARED: nessuno; soli derivati readonly, senza rename, cancellazione o decisione di catalogo.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-010 REQ-REC-001
(declaim (ftype (function (t) boolean) nome-candidato-indice-p))
(defun nome-candidato-indice-p (name)
  "Pre: nome dall'inventario o fixture non fidata. Post: T solo per la forma canonica delle immagini M1.
Confronti limitati a 32 caratteri; nessuna interpretazione di autorita' o path."
  (and (stringp name) (= (length name) 32) (string= name "primary-" :end1 8)
       (string= name ".idx.tmp" :start1 24)
       (loop for i from 8 below 24 always (not (null (find (char name i) "0123456789abcdef"))))))

;;; REQ: REQ-IDX-010 REQ-AFF-008
(declaim (ftype (function (string (or null string)) boolean) nome-candidato-preferito-p))
(defun nome-candidato-preferito-p (name selected)
  "Pre: nomi canonici gia' validati di 32 caratteri, SELECTED eventualmente NIL.
Post: priorita' deterministica senza autorita' o cronologia; confronto bounded, nessuna condizione aggiuntiva."
  (or (null selected) (not (null (string> name selected)))))

;;; REQ: REQ-IDX-010 REQ-LIM-003
(declaim (ftype (function (simple-vector index) index) conta-candidati-indice))
(defun conta-candidati-indice (names limit)
  "Pre: inventario bounded completo. Post: conteggio verificato prima di aprire candidati.
RESOURCE-EXHAUSTED oltre quota: nessuna scelta basata su un inventario parziale."
  (let ((count 0))
    (loop for name across names do
      (when (nome-candidato-indice-p name)
        (incf count)
        (when (> count limit) (error 'resource-exhausted :reason :engine-image-discovery-candidates))))
    count))

;;; REQ: REQ-IDX-010 REQ-REC-001 REQ-AFF-002
(declaim (ftype (function (motore io:file-io index octets arcdocdb.index.page:fonte-indice) boolean)
                footer-candidato-corrente-p))
(defun footer-candidato-corrente-p (engine file eof buffer source)
  "Pre: RECOVERING, file readonly/EOF esatto, buffer pagina privato. Post: sola eleggibilita', non prova adottabile.
Geometria/CRC incompleti, profilo diverso e fonte obsoleta sono scartati; altri errori codec/I/O propagati.
Un footer idoneo richiede comunque verifica integrale del file selezionato prima di READY."
  (let ((size (length buffer)))
    (unless (and (>= eof (* 3 size)) (zerop (mod eof size)) (<= eof (* 65538 size)))
      (return-from footer-candidato-corrente-p nil))
    (unless (= size (io:leggi-esatto file buffer 0 size (- eof size)))
      (error 'invariant-violation :reason :engine-image-discovery-read))
    (unless (= (b:leggi-u32 buffer (- size 4)) (b:crc32c buffer 0 (- size 4)))
      (return-from footer-candidato-corrente-p nil))
    (unless (= (aref buffer arcdocdb.index.page::+image-off-size+)
               (nth-value 0 (arcdocdb.index.page::geometria-pagina size)))
      (return-from footer-candidato-corrente-p nil))
    (handler-case
        (progn
          (arcdocdb.index.page::leggi-sigillo-immagine buffer eof source
            (p::indice-primario-seed-high (motore-index engine)) (p::indice-primario-seed-low (motore-index engine)))
          t)
      (corruption-detected (condition)
        (if (eq :index-image-source-mismatch (arcdocdb.conditions:error-reason condition)) nil (error condition))))))

;;; REQ: REQ-IDX-010 REQ-AFF-004 REQ-REC-001
(declaim (ftype (function (motore string opzione-indice-paginato octets arcdocdb.index.page:fonte-indice) boolean)
                ispeziona-candidato-indice))
(defun ispeziona-candidato-indice (engine name template buffer source)
  "Pre: owner RECOVERING, nome canonico, namespace esclusivo. Post: eleggibilita' e FD locale chiuso.
Ogni errore/nonlocal exit tenta cleanup preservando la primaria; close fallito sul successo propaga.
Nessun candidato o FD e' trasferito al motore da questa sonda."
  (multiple-value-bind (file eof)
      (io:apri-lettura-nella-directory (motore-directory engine) name
        :max-transfer (opzione-indice-paginato-size template) :max-file-bytes (opzione-indice-paginato-bytes template))
    (let ((complete nil))
      (unwind-protect
           (multiple-value-prog1
               (progn
                 (osserva-motore engine :index-image-candidate)
                 (footer-candidato-corrente-p engine file eof buffer source))
             (setf complete t))
        (if complete (io:chiudi file) (tenta-cleanup-motore engine (lambda () (io:chiudi file))))))))

;;; REQ: REQ-IDX-010 REQ-LIM-003 REQ-REC-001
(declaim (ftype (function (string opzione-indice-paginato) opzione-indice-paginato) opzione-candidato-scoperto))
(defun opzione-candidato-scoperto (name template)
  "Pre: nome canonico selezionato, profilo immutabile validato. Post: copia privata della scelta.
Nessun I/O o prova di commit: l'adozione deve ancora verificarla completamente."
  (crea-opzione-indice-paginato name :page-size (opzione-indice-paginato-size template)
    :frames (opzione-indice-paginato-frames template) :max-visits (opzione-indice-paginato-visits template)
    :max-bytes (opzione-indice-paginato-bytes template)))

;;; REQ: REQ-IDX-010 REQ-AFF-008
(declaim (ftype (function (motore arcdocdb.index.page:fonte-indice index) null) verifica-fonte-startup-indice))
(defun verifica-fonte-startup-indice (engine source revision)
  "Pre: owner, dopo i callback di scoperta e prima della scelta restituita.
Post: RECOVERING, controller sano, revisione e fonte canonica intatte; INVARIANT-VIOLATION senza adozione."
  (p::esigi-indice-sano (motore-index engine))
  (unless (and (eq :recovering (motore-state engine))
               (eq :healthy (s:stato-controllore-serie (motore-controller engine)))
               (= revision (p::indice-primario-revision (motore-index engine)))
               (arcdocdb.index.page::stessa-fonte-indice-p source (fonte-canonica-indice-motore engine)))
    (error 'invariant-violation :reason :engine-image-discovery-source-changed))
  nil)

;;; REQ: REQ-IDX-010 REQ-REC-001 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (motore opzione-scoperta-indice) (or null opzione-indice-paginato)) scopri-indice-paginato-motore))
(defun scopri-indice-paginato-motore (engine config)
  "Pre: owner RECOVERING dopo replay canonico, namespace esclusivo. Post: nome massimo fra footer idonei o NIL.
Inventario/candidati/footer bounded; zero adozioni. Assenza lascia il residente; errori reali rifiutano startup.
Ordinamento esadecimale lessicografico solo come priorita', non cronologia o fonte di verita'."
  (esigi-owner-motore engine)
  (unless (eq :recovering (motore-state engine)) (error 'invariant-violation :reason :engine-image-discovery-state))
  (osserva-motore engine :before-index-discovery)
  (let* ((limit (opzione-scoperta-indice-names config))
         (names (io:elenca-directory (motore-directory engine) :max-names limit :max-total-name-bytes (* 255 limit)))
         (count (conta-candidati-indice names (opzione-scoperta-indice-candidates config)))
         (template (opzione-scoperta-indice-template config))
         (buffer (make-array (opzione-indice-paginato-size template) :element-type '(unsigned-byte 8) :initial-element 0))
         (source (fonte-canonica-indice-motore engine))
         (revision (p::indice-primario-revision (motore-index engine))) (selected nil) (visited 0))
    (loop for name across names do
      (when (nome-candidato-indice-p name)
        (incf visited)
        (when (ispeziona-candidato-indice engine name template buffer source)
          (when (nome-candidato-preferito-p name selected) (setf selected name)))))
    (unless (= count visited)
      (error 'invariant-violation :reason :engine-image-discovery-inventory))
    (osserva-motore engine :index-image-discovered)
    (verifica-fonte-startup-indice engine source revision)
    (when selected (opzione-candidato-scoperto selected template))))
