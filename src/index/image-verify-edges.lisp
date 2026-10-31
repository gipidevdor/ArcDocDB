;;; OWNER: verifica seriale dei riferimenti, incluse strutture vuote senza entry da sondare.
;;; SHARED: nessuno; scratch dei figli distinto dalla pagina fisica corrente.
(in-package #:arcdocdb.index.page)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-010 REQ-LIM-003 REQ-AFF-002
(declaim (ftype (function (ispezione-immagine index index) null) verifica-figlio-directory-immagine))
(defun verifica-figlio-directory-immagine (work ref shift)
  "Pre: verified local PageRef. Post: bucket/directory child with ordered radix ranges.
The check also applies to an empty source, where no entry triggers lookup."
  (let* ((parent (ispezione-immagine-scan work)) (page (leggi-u64 parent ref))
         (generation (leggi-u64 parent (+ ref +reference-generation+))) (child (ispezione-immagine-fragment work)))
    (when (plusp page)
      (carica-pagina-ispezione work page generation child)
      (case (aref child +off-kind+)
        (1 nil)
        (2 (let* ((parameter (leggi-u32 child +off-parameter+))
                  (bits (ldb (byte 8 0) parameter)) (child-shift (ldb (byte 8 8) parameter)))
             (when (> (+ bits child-shift) shift)
               (error 'corruption-detected :reason :index-image-directory-order))))
        (otherwise (error 'corruption-detected :reason :index-image-child-kind))))) nil)

;;; REQ: REQ-IDX-010 REQ-LIM-003 REQ-AFF-002
(declaim (ftype (function (ispezione-immagine) null) verifica-archi-immagine))
(defun verifica-archi-immagine (work)
  "Pre: current page locally verified. Post: child types and continuity verified even if unused.
Budget for every visit, no recursion, fanout bounded by page size."
  (let* ((buffer (ispezione-immagine-scan work)) (kind (aref buffer +off-kind+))
         (next (leggi-u64 buffer +off-next+)) (child (ispezione-immagine-fragment work)))
    (case kind
      (2 (let* ((parameter (leggi-u32 buffer +off-parameter+)) (bits (ldb (byte 8 0) parameter))
                (shift (ldb (byte 8 8) parameter)))
           (dotimes (slot (ash 1 bits))
             (verifica-figlio-directory-immagine work (+ +page-header+ (* slot +reference-bytes+)) shift))))
      (1 (when (plusp next)
           (carica-pagina-ispezione work next (leggi-u64 buffer +off-next-generation+) child)
           (unless (= (aref child +off-kind+) 1) (error 'corruption-detected :reason :index-image-child-kind))))
      (3 (when (plusp next)
           (carica-pagina-ispezione work next (leggi-u64 buffer +off-next-generation+) child)
           (unless (and (= (aref child +off-kind+) 3)
                        (= (leggi-u32 child +off-count+) (leggi-u32 buffer +off-count+))
                        (= (leggi-u32 child +off-parameter+)
                           (+ (leggi-u32 buffer +off-parameter+) (leggi-u32 buffer +off-used+))))
             (error 'corruption-detected :reason :index-image-key-chain))))
      (otherwise (error 'invariant-violation :reason :index-image-page-kind)))) nil)
