;;; OWNER: piano dell'attore M1; scansione finita C, otto passaggi radix stabili sui soli metadati.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-009 REQ-IDX-010 REQ-LIM-003
(declaim (ftype (function (arcdocdb.index.page:fonte-indice index) index) conta-chiavi-costruzione))
(defun conta-chiavi-costruzione (source capacity)
  "Pre: cardinalita' della fonte privata M1. Post: numero entro il carico massimo, prima degli array.
INVARIANT-VIOLATION per conteggio fuori geometria: metadati corrotti non ampliano la riserva."
  (let ((count (arcdocdb.index.page::fonte-indice-count source)))
    (unless (<= count (floor (* 7 capacity) 8))
      (error 'invariant-violation :reason :engine-image-build-count-range))
    count))

;;; REQ: REQ-IDX-009 REQ-IDX-010 REQ-LIM-003
(declaim (ftype (function (piano-immagine-motore fixnum) null) ordina-byte-costruzione))
(defun ordina-byte-costruzione (plan shift)
  "Pre: piano completo, SHIFT uno degli otto byte del digest. Post: ordinamento stabile del byte.
Tre scansioni limitate a N e 256 contatori, nessuna copia di chiavi o modifica alla fonte."
  (let ((counts (piano-immagine-motore-counts plan)) (order (piano-immagine-motore-order plan))
        (aux (piano-immagine-motore-aux plan)) (cursor 0))
    (fill counts 0)
    (dotimes (i (length order)) (incf (aref counts (radix-slot-costruzione plan i 8 shift))))
    (dotimes (i 256)
      (let ((count (aref counts i))) (setf (aref counts i) cursor) (incf cursor count)))
    (unless (= cursor (length order)) (error 'invariant-violation :reason :engine-image-build-sort-count))
    (dotimes (i (length order))
      (let ((digit (radix-slot-costruzione plan i 8 shift)))
        (setf (aref aux (aref counts digit)) (aref order i)) (incf (aref counts digit))))
    (rotatef (piano-immagine-motore-order plan) (piano-immagine-motore-aux plan)))
  nil)

;;; REQ: REQ-IDX-009 REQ-IDX-010 REQ-AFF-008
(declaim (ftype (function (motore) piano-immagine-motore) prepara-piano-immagine-motore))
(defun prepara-piano-immagine-motore (engine)
  "Pre: motore BUSY esclusivo, quota payload gia' controllata. Post: snapshot metadati ordinati per digest.
Fonte canonica senza split; errori di salute, conteggio e controlli prima di creare il derivato."
  (let* ((source (fonte-canonica-indice-motore engine)) (index (motore-index engine))
         (fragment (svref (p::root-indice-directory (p::acquisisci-root index)) 0))
         (capacity (p::indice-primario-capacity index)) (count (conta-chiavi-costruzione source capacity))
         (plan (%make-piano-immagine-motore :source source :fragment fragment
                  :revision (p::indice-primario-revision index)
                  :high (make-array capacity :element-type '(unsigned-byte 32) :initial-element 0)
                  :low (make-array capacity :element-type '(unsigned-byte 32) :initial-element 0)
                  :order (make-array count :element-type '(unsigned-byte 32) :initial-element 0)
                  :aux (make-array count :element-type '(unsigned-byte 32) :initial-element 0)
                  :counts (make-array 256 :element-type '(unsigned-byte 32) :initial-element 0)
                  :words (make-array 5 :element-type '(unsigned-byte 64) :initial-element 0))) (position 0))
    (unless (motore-busy engine) (error 'invariant-violation :reason :engine-image-build-admission))
    (dotimes (slot capacity)
      (let ((control (aref (p::frammento-indice-controls fragment) slot)))
        (unless (p::controllo-valido-p control) (error 'invariant-violation :reason :engine-image-build-control))
        (when (< control 128) (registra-slot-costruzione engine plan slot position) (incf position))))
    (unless (= position count) (error 'invariant-violation :reason :engine-image-build-count))
    (dotimes (byte 8) (ordina-byte-costruzione plan (* byte 8)))
    plan))
