;;; OWNER: controller della fonte e attore I/O; capacita' readonly prestate fino al ritiro.
;;; SHARED: nessuno; il footer deriva da fonte gia' decisa, non e' un commit dati.
(in-package #:arcdocdb.index.page)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-010
(defstruct (fonte-indice (:constructor %make-fonte-indice (archive series token csn count)) (:copier nil))
  "Pre: complete canonical gate. Post: immutable copies of the trusted source binding.
TOKEN is not calculated by this module: the controller guarantees its exact identity and nonreuse."
  (archive #() :type octets :read-only t) (series #() :type octets :read-only t)
  (token #() :type octets :read-only t) (csn 0 :type u64 :read-only t) (count 0 :type index :read-only t))

;;; REQ: REQ-IDX-010 REQ-LIM-003
(defstruct (sigillo-immagine (:constructor %make-sigillo-immagine (source root size pages seed-high seed-low)) (:copier nil))
  "Pre: complete derivative description. Post: immutable metadata, without integrity or flush proof.
Only read-only verification may produce an adoptable image."
  (source nil :type fonte-indice :read-only t) (root nil :type identita-pagina :read-only t)
  (size 4096 :type (member 4096 16384 65536) :read-only t)
  (pages 1 :type (integer 1 65536) :read-only t)
  (seed-high 0 :type u32 :read-only t) (seed-low 0 :type u32 :read-only t))

;;; REQ: REQ-IDX-010 REQ-AFF-008
(declaim (ftype (function (octets octets octets u64 t) fonte-indice) crea-fonte-indice))
(defun crea-fonte-indice (archive series token csn count)
  "Pre: exact identity from the recovered plan, canonical live-key cardinality.
Post: owned data; INVALID-ARGUMENT for domains, no authority inferred from derivative bytes."
  (unless (and (= (length archive) 16) (= (length series) 16) (= (length token) 32)
               (typep count '(integer 0 #.+image-max-entries+)))
    (error 'invalid-argument :reason :index-image-source))
  (%make-fonte-indice (copy-seq archive) (copy-seq series) (copy-seq token) csn count))

;;; REQ: REQ-IDX-010
(declaim (ftype (function (fonte-indice fonte-indice) boolean) stessa-fonte-indice-p))
(defun stessa-fonte-indice-p (left right)
  "Pre: immutable canonical sources. Post: complete identity, no allocation or coordination."
  (and (= (fonte-indice-csn left) (fonte-indice-csn right)) (= (fonte-indice-count left) (fonte-indice-count right))
       (equalp (fonte-indice-archive left) (fonte-indice-archive right))
       (equalp (fonte-indice-series left) (fonte-indice-series right))
       (equalp (fonte-indice-token left) (fonte-indice-token right))))
