;;; OWNER: attore M1; ricorsione radix limitata a 65 livelli, massimo 128 prove per livello.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-009 REQ-IDX-010
(declaim (ftype (function (piano-immagine-motore arcdocdb.index.page:costruttore-pagine index index)
                         arcdocdb.index.page:riferimento-costruito) emetti-bucket-costruzione))
(defun emetti-bucket-costruzione (plan builder start end)
  "Pre: sottoinsieme ordinato canonico, nessun writer. Post: bucket o overflow completi, chiavi a lotti.
Un ciclo per al piu' N entry; il builder applica quota e fail-stop, nessuna unicita' probabilistica."
  (let* ((capacity (floor (* 7 (nth-value 1 (arcdocdb.index.page::geometria-pagina
                                           (arcdocdb.index.page::costruttore-pagine-size builder)))) 8))
         (tail nil) (cursor start))
    (loop repeat (max 1 (ceiling (- end start) capacity)) do
      (let* ((limit (min end (+ cursor capacity))) (entries (make-array (- limit cursor))))
        (dotimes (i (length entries))
          (let ((slot (aref (piano-immagine-motore-order plan) (+ cursor i))))
            (multiple-value-bind (ks ke) (leggi-slot-costruzione plan slot)
              (setf (svref entries i)
                    (arcdocdb.index.page:crea-entry-costruzione builder
                      (p::frammento-indice-arena (piano-immagine-motore-fragment plan))
                      (piano-immagine-motore-words plan) :start ks :end ke)))))
        (setf tail (arcdocdb.index.page:costruisci-bucket-pagine builder entries :next tail) cursor limit)))
    (unless (= cursor end) (error 'invariant-violation :reason :engine-image-build-bucket-count))
    (the arcdocdb.index.page:riferimento-costruito tail)))

;;; REQ: REQ-IDX-009 REQ-IDX-010 REQ-LIM-003
(declaim (ftype (function (piano-immagine-motore arcdocdb.index.page:costruttore-pagine index index fixnum fixnum)
                         arcdocdb.index.page:riferimento-costruito) emetti-albero-costruzione))
(defun emetti-albero-costruzione (plan builder start end remaining depth)
  "Pre: span ordinato per digest completo, prefisso fissato dagli antenati, 0<=remaining<=64.
Post: albero append-only; radici dei figli precedenti e routing controllati dal builder.
INVARIANT-VIOLATION per profondita'/span; 65 livelli anche con digest tutti identici."
  (unless (and (<= 0 depth) (< depth +build-radix-levels+) (<= 0 remaining 64)
               (<= start end (length (piano-immagine-motore-order plan))))
    (error 'invariant-violation :reason :engine-image-build-tree-range))
  (let ((entry-limit (floor (* 7 (nth-value 1 (arcdocdb.index.page::geometria-pagina
                                      (arcdocdb.index.page::costruttore-pagine-size builder)))) 8)))
    (when (<= (- end start) entry-limit)
      (return-from emetti-albero-costruzione (emetti-bucket-costruzione plan builder start end)))
    (let ((effective (limite-bit-costruzione plan start end remaining)))
      (when (zerop effective)
        (return-from emetti-albero-costruzione (emetti-bucket-costruzione plan builder start end)))
    (let* ((bits (min effective +build-radix-bits+
                     (max 1 (integer-length (1- (ceiling (- end start) entry-limit))))))
           (shift (- effective bits))
           (children (make-array (ash 1 bits) :initial-element nil)) (cursor start))
      (loop repeat (- end start) while (< cursor end) do
        (let* ((digit (radix-slot-costruzione plan cursor bits shift)) (limit (1+ cursor)))
          (loop repeat (- end limit) while (< limit end)
                while (= digit (radix-slot-costruzione plan limit bits shift)) do (incf limit))
          (when (svref children digit) (error 'invariant-violation :reason :engine-image-build-sort-order))
          (setf (svref children digit) (emetti-albero-costruzione plan builder cursor limit shift (1+ depth))
                cursor limit)))
      (unless (= cursor end) (error 'invariant-violation :reason :engine-image-build-tree-count))
      (arcdocdb.index.page:costruisci-directory-pagine builder bits shift children)))))
