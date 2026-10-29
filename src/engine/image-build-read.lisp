;;; OWNER: attore seriale; solo scratch del piano, arena canonica prestata immutabile.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-009 REQ-IDX-010 REQ-AFF-008
(declaim (ftype (function (piano-immagine-motore index) (values index index &optional)) leggi-slot-costruzione))
(defun leggi-slot-costruzione (plan slot)
  "Pre: owner esclusivo, slot LIVE del piano. Post: cinque word coerenti e span nell'arena canonica.
INVARIANT-VIOLATION per stato/range inattesi, nessun retry non limitato o risultato parziale."
  (let* ((fragment (piano-immagine-motore-fragment plan)) (words (piano-immagine-motore-words plan)))
    (unless (eq :live (arcdocdb.index.slots:leggi-slot-v2 (p::frammento-indice-bank fragment) slot words))
      (error 'invariant-violation :reason :engine-image-build-slot))
    (let* ((start (ldb (byte 32 0) (aref words 2)))
           (end (+ start (ldb (byte 16 32) (aref words 2)))))
      (unless (and (< start end) (<= end (length (p::frammento-indice-arena fragment))))
        (error 'invariant-violation :reason :engine-image-build-key-range))
      (values start end))))

;;; REQ: REQ-IDX-009 REQ-IDX-010 REQ-AFF-008
(declaim (ftype (function (motore piano-immagine-motore index index) null) registra-slot-costruzione))
(defun registra-slot-costruzione (engine plan slot position)
  "Pre: slot fisico LIVE e posizione densa libera. Post: digest canonico e ID copiati nel piano.
INVARIANT-VIOLATION per conteggio/fingerprint incoerenti, prima della creazione del file."
  (unless (< position (length (piano-immagine-motore-order plan)))
    (error 'invariant-violation :reason :engine-image-build-count))
  (multiple-value-bind (start end) (leggi-slot-costruzione plan slot)
    (let* ((fragment (piano-immagine-motore-fragment plan)) (index (motore-index engine)))
      (multiple-value-bind (high low) (p:digest-chiave-indice index (p::frammento-indice-arena fragment) start end)
        (unless (= (logand low 127) (aref (p::frammento-indice-controls fragment) slot))
          (error 'invariant-violation :reason :engine-image-build-fingerprint))
        (setf (aref (piano-immagine-motore-high plan) slot) high
              (aref (piano-immagine-motore-low plan) slot) low
              (aref (piano-immagine-motore-order plan) position) slot))))
  nil)

;;; REQ: REQ-IDX-009 REQ-IDX-010 REQ-AFF-008
(declaim (ftype (function (piano-immagine-motore index fixnum fixnum) index) radix-slot-costruzione))
(defun radix-slot-costruzione (plan position bits shift)
  "Pre: posizione nell'ordine privato e campo radix valido. Post: bit del digest dello slot sorgente.
Errori di range canonici; nessun digest u64 temporaneo o accesso al file."
  (let ((slot (aref (piano-immagine-motore-order plan) position)))
    (arcdocdb.index.page::radix-digest-pagina (aref (piano-immagine-motore-high plan) slot)
                                           (aref (piano-immagine-motore-low plan) slot) bits shift)))

;;; REQ: REQ-IDX-009 REQ-IDX-010 REQ-AFF-008
(declaim (ftype (function (piano-immagine-motore index index fixnum) fixnum) limite-bit-costruzione))
(defun limite-bit-costruzione (plan start end remaining)
  "Pre: span non vuoto ordinato unsigned, bit piu' alti gia' fissati dagli antenati.
Post: primo bit variabile dagli estremi, zero per collisione completa; prefisso comune saltato.
INVARIANT-VIOLATION se la differenza eccede il campo del padre, prima di una directory."
  (let* ((order (piano-immagine-motore-order plan)) (first (aref order start)) (last (aref order (1- end)))
         (high (logxor (aref (piano-immagine-motore-high plan) first) (aref (piano-immagine-motore-high plan) last)))
         (low (logxor (aref (piano-immagine-motore-low plan) first) (aref (piano-immagine-motore-low plan) last)))
         (effective (if (plusp high) (+ 32 (integer-length high)) (integer-length low))))
    (unless (<= effective remaining) (error 'invariant-violation :reason :engine-image-build-prefix))
    effective))
