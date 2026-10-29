;;; OWNER: verifica completa di ogni entry fisica rispetto a root e fonte canonica.
;;; SHARED: nessuno; nessuna pubblicazione prima del conteggio e del gate completi.
(in-package #:arcdocdb.index.page)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-010 REQ-LIM-003 REQ-AFF-002
(declaim (ftype (function (ispezione-immagine page-number index index u32 u32) null) verifica-origine-entry-immagine))
(defun verifica-origine-entry-immagine (work page entry length high low)
  "Pre: chiave ricomposta con hash verificato. Post: stessa entry fisica risolta dalla root.
Questo respinge entry irraggiungibili e duplicati globali, anche con payload identico.
Visite del lookup incluse nel budget globale; nessuna falsa assenza su esaurimento."
  (when (zerop (ispezione-immagine-remaining work))
    (error 'arcdocdb.conditions:resource-exhausted :reason :index-image-visit-budget))
  (let* ((reader (ispezione-immagine-reader work))
         (grant (min (ispezione-immagine-remaining work) (lettore-indice-pagine-max-pages reader)))
         (status (leggi-indice-pagine-budget reader (ispezione-immagine-key work) 0 length high low
                                            (ispezione-immagine-actual work) grant)))
    (decf (ispezione-immagine-remaining work) (- grant (lettore-indice-pagine-remaining reader)))
    (unless (and (eq status :live) (= (lettore-indice-pagine-found-page reader) page)
                 (= (lettore-indice-pagine-found-entry reader) entry)
                 (equalp (ispezione-immagine-actual work) (ispezione-immagine-expected work)))
      (error 'corruption-detected :reason :index-image-entry-origin))) nil)

;;; REQ: REQ-IDX-010 REQ-AFF-002
(declaim (ftype (function (ispezione-immagine page-number index) null) verifica-entry-immagine))
(defun verifica-entry-immagine (work page entry)
  "Pre: bucket verificato; callback fidata attesta appartenenza esatta alla fonte, input readonly.
Post: hash, origine e candidato canonico verificati; conteggio incrementato solo dopo il gate completo.
Falso => derivato incompatibile, risultato non booleano => violazione contratto callback."
  (let* ((length (chiave-entry-immagine work entry)) (seal (ispezione-immagine-seal work))
         (buffer (ispezione-immagine-scan work)))
    (multiple-value-bind (high low)
        (arcdocdb.hash64:xxh64 (ispezione-immagine-key work) 0 length
                             (sigillo-immagine-seed-high seal) (sigillo-immagine-seed-low seal))
      (unless (and (= (leggi-u32 buffer entry) low) (= (leggi-u32 buffer (+ entry 4)) high))
        (error 'corruption-detected :reason :index-image-key-digest))
      (candidato-entry-immagine work entry length)
      (verifica-origine-entry-immagine work page entry length high low))
    (let ((accepted (funcall (ispezione-immagine-validator work) (ispezione-immagine-key work) 0 length
                             (ispezione-immagine-expected work))))
      (unless (typep accepted 'boolean) (error 'invalid-argument :reason :index-image-validator-result))
      (unless accepted (error 'corruption-detected :reason :index-image-authority)))
    (incf (ispezione-immagine-seen work))
    (when (> (ispezione-immagine-seen work) (fonte-indice-count (sigillo-immagine-source seal)))
      (error 'corruption-detected :reason :index-image-entry-count))) nil)

;;; REQ: REQ-IDX-010 REQ-LIM-003 REQ-AFF-002
(declaim (ftype (function (ispezione-immagine) null) verifica-pagine-immagine))
(defun verifica-pagine-immagine (work)
  "Pre: footer e prefisso verificati, file readonly stabile. Post: tutte le pagine e tutte le entry verificate.
Scansione fisica limitata dal footer, memoria indipendente dal numero pagine, budget cumulativo.
Unicita' per origine + appartenenza alla fonte + cardinalita' esatta garantiscono copertura delle entry."
  (let* ((seal (ispezione-immagine-seal work)) (size (sigillo-immagine-size seal))
         (generation (identita-pagina-generation (sigillo-immagine-root seal)))
         (buffer (ispezione-immagine-scan work)))
    (dotimes (i (sigillo-immagine-pages seal))
      (let ((page (* (1+ i) size)))
        (carica-pagina-ispezione work page generation buffer)
        (when (and (= page (identita-pagina-page (sigillo-immagine-root seal)))
                   (not (member (aref buffer +off-kind+) '(1 2))))
          (error 'corruption-detected :reason :index-image-root-kind))
        (verifica-archi-immagine work)
        (when (= (aref buffer +off-kind+) 1)
          (let ((capacity (leggi-u32 buffer +off-parameter+)))
            (dotimes (slot capacity)
              (when (< (aref buffer (+ +page-header+ slot)) 128)
                (verifica-entry-immagine work page (+ +page-header+ capacity (* slot +entry-bytes+)))))))))
    (unless (= (ispezione-immagine-seen work) (fonte-indice-count (sigillo-immagine-source seal)))
      (error 'corruption-detected :reason :index-image-entry-count))) nil)
