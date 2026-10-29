;;; OWNER: piano privato dell'attore M1 durante manutenzione; nessuno stato condiviso.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-009 REQ-IDX-010
(defconstant +build-radix-bits+ 7)
(defconstant +build-radix-levels+ 65)
(defconstant +build-radix-fanout+ 128)

;;; REQ: REQ-IDX-009 REQ-IDX-010 REQ-AFF-008
(declaim (ftype (function (opzione-indice-paginato) u64) id-immagine-costruzione))
(defun id-immagine-costruzione (option)
  "Pre: nome validato dalla factory. Post: ID esatto dal nome fresco, 1..2^60-1.
INVALID-ARGUMENT prima dell'I/O per ID non rappresentabile; nessun riuso di un nome esistente."
  (let ((id (parse-integer (opzione-indice-paginato-name option) :start 8 :end 24 :radix 16)))
    (unless (<= 1 id arcdocdb.index.page::+page-id-max+)
      (error 'invalid-argument :reason :engine-image-build-id))
    id))

;;; REQ: REQ-IDX-009 REQ-IDX-010 REQ-LIM-003
(defstruct (piano-immagine-motore (:constructor %make-piano-immagine-motore) (:copier nil))
  "Pre: owner M1 esclusivo, fonte e singolo frammento canonici. Post: metadati senza copie delle chiavi.
Solo gli ID degli slot vengono riordinati; fonte e indici del motore restano intatti."
  (source nil :type arcdocdb.index.page:fonte-indice :read-only t)
  (fragment nil :type p:frammento-indice :read-only t)
  (revision 0 :type index :read-only t)
  (high #() :type (simple-array (unsigned-byte 32) (*)) :read-only t)
  (low #() :type (simple-array (unsigned-byte 32) (*)) :read-only t)
  (order #() :type (simple-array (unsigned-byte 32) (*)))
  (aux #() :type (simple-array (unsigned-byte 32) (*)))
  (counts #() :type (simple-array (unsigned-byte 32) (256)) :read-only t)
  (words #() :type (simple-array (unsigned-byte 64) (5)) :read-only t))

;;; REQ: REQ-IDX-009 REQ-IDX-010 REQ-LIM-003
(declaim (ftype (function (motore opzione-indice-paginato) index) payload-costruzione-immagine))
(defun payload-costruzione-immagine (engine option)
  "Pre: indice residente M1, opzione valida. Post: riserva conservativa dei payload array propri.
Include worst case chiavi del lotto, piano, builder, stack radix e verifica; esclude header/GC/RSS.
Il controller deve riservare separatamente metadati e transitori del runtime; nessun I/O o allocazione."
  (let* ((size (opzione-indice-paginato-size option))
         (capacity (nth-value 1 (arcdocdb.index.page::geometria-pagina size)))
         (entry-limit (floor (* capacity 7) 8)))
    (+ (* 16 (p::indice-primario-capacity (motore-index engine))) 1024 40 262144
       (* +build-radix-levels+ +build-radix-fanout+ 8)
       (* size (+ 8 (opzione-indice-paginato-frames option)))
       (* capacity 17) (* entry-limit (+ 8 arcdocdb.record:+max-key-bytes+)) arcdocdb.record:+max-key-bytes+)))
