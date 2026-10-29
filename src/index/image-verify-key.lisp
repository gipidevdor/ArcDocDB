;;; OWNER: verifica readonly seriale; la pagina bucket resta separata dai frammenti di chiave.
;;; SHARED: nessuno; nessuna lista di chiavi o PageRef mantenuta fra entry.
(in-package #:arcdocdb.index.page)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-010 REQ-LIM-003 REQ-AFF-002
(declaim (ftype (function (ispezione-immagine index index page-number page-number) null) ricomponi-chiave-immagine))
(defun ricomponi-chiave-immagine (work total position page generation)
  "Pre: entry esterna verificata, totale <=65535. Post: chiave completa dopo catena coerente.
Tipo/totale/posizione verificati prima di ogni copia; al massimo 17 frammenti, budget globale condiviso."
  (let* ((buffer (ispezione-immagine-fragment work)) (size (length buffer))
         (limit (ceiling +max-key-bytes+ (- size +page-header+))))
    (dotimes (step limit)
      (carica-pagina-ispezione work page generation buffer)
      (unless (and (= (aref buffer +off-kind+) 3) (= (leggi-u32 buffer +off-count+) total)
                   (= (leggi-u32 buffer +off-parameter+) position))
        (error 'corruption-detected :reason :index-image-key-chain))
      (let ((used (leggi-u32 buffer +off-used+)))
        (replace (ispezione-immagine-key work) buffer :start1 position :start2 +page-header+
                 :end2 (+ +page-header+ used))
        (incf position used))
      (setf page (leggi-u64 buffer +off-next+) generation (leggi-u64 buffer +off-next-generation+))
      (when (zerop page)
        (unless (= position total) (error 'corruption-detected :reason :index-image-key-chain))
        (return-from ricomponi-chiave-immagine nil)))
    (error 'corruption-detected :reason :index-image-key-chain)))

;;; REQ: REQ-IDX-010 REQ-AFF-002
(declaim (ftype (function (ispezione-immagine index) index) chiave-entry-immagine))
(defun chiave-entry-immagine (work entry)
  "Pre: bucket corrente verificato. Post: copia completa della chiave nello scratch privato e lunghezza.
Nessun riferimento ai frame esce dalla verifica; errori prima di callback o adozione."
  (let* ((buffer (ispezione-immagine-scan work)) (length (leggi-u16 buffer (+ entry +entry-key-length+))))
    (if (zerop (leggi-u16 buffer (+ entry +entry-flags+)))
        (let ((start (+ +page-header+ (leggi-u32 buffer (+ entry +entry-key-offset+)))))
          (replace (ispezione-immagine-key work) buffer :start2 start :end2 (+ start length)))
        (ricomponi-chiave-immagine work length 0 (leggi-u64 buffer (+ entry +entry-key-page+))
                                  (leggi-u64 buffer (+ entry +entry-key-generation+))))
    length))

;;; REQ: REQ-IDX-010 REQ-AFF-002
(declaim (ftype (function (ispezione-immagine index index) null) candidato-entry-immagine))
(defun candidato-entry-immagine (work entry length)
  "Pre: chiave completa e bucket verificato. Post: cinque parole coerenti con il candidato residente.
CSN maggiore della fonte respinto prima del validatore autorevole."
  (let ((buffer (ispezione-immagine-scan work)) (words (ispezione-immagine-expected work)))
    (setf (aref words 0) (leggi-u64 buffer (+ entry +entry-csn+))
          (aref words 1) (leggi-u64 buffer (+ entry +entry-location+))
          (aref words 2) (logior (ash length 32) (ash 1 48))
          (aref words 3) (leggi-u32 buffer (+ entry +entry-length+)) (aref words 4) 0)
    (when (> (aref words 0) (fonte-indice-csn (sigillo-immagine-source (ispezione-immagine-seal work))))
      (error 'corruption-detected :reason :index-image-csn))) nil)
