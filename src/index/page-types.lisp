;;; OWNER: controller prepara i descrittori prima del codec, nessun buffer esposto.
;;; SHARED: campi read-only; nessuna risorsa esterna.
(in-package #:arcdocdb.index.page)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-009
(defstruct (identita-pagina (:constructor %make-identita-pagina (serie image page generation))
                           (:copier nil))
  "Pre: verified canonical identity. Post: UUID copied and caller identity immutable by contract.
Only cache/readers modify their own private unpublished cursors; never caller identity.
No file opened; size/alignment verified by the codec."
  (serie #() :type octets :read-only t)
  (image 1 :type page-number)
  (page 1 :type page-number)
  (generation 1 :type page-number))

;;; REQ: REQ-IDX-009
(declaim (ftype (function (octets t t t) identita-pagina) crea-identita-pagina))
(defun crea-identita-pagina (serie image page generation)
  "Pre: controller outside lookup; 16-byte UUID, numbers in 1..2^60-1.
Post: identity with private UUID copy. INVALID-ARGUMENT before allocation."
  (unless (= (length serie) +page-identity-bytes+)
    (error 'invalid-argument :reason :index-page-series))
  (dolist (value (list image page generation))
    (unless (and (typep value 'fixnum) (<= 1 value +page-id-max+))
      (error 'invalid-argument :reason :index-page-identity)))
  (%make-identita-pagina (copy-seq serie) image page generation))

;;; REQ: REQ-IDX-009
(defstruct (descrittore-pagina (:constructor %make-descrittore-pagina
                               (identity kind count parameter next next-generation)) (:copier nil))
  "Pre: verified private descriptor. Post: immutable metadata without entry arrays.
The codec verifies size-dependent geometry, no publication."
  (identity nil :type identita-pagina :read-only t)
  (kind :bucket :type page-kind :read-only t)
  (count 0 :type (integer 0 65535) :read-only t)
  (parameter 0 :type u32 :read-only t)
  (next 0 :type page-number :read-only t)
  (next-generation 0 :type page-number :read-only t))

;;; REQ: REQ-IDX-009
(declaim (ftype (function (identita-pagina t t t &key (:next t) (:next-generation t))
                         descrittore-pagina) crea-descrittore-pagina))
(defun crea-descrittore-pagina (identity kind count parameter &key (next 0) (next-generation 0))
  "Pre: controller, canonical identity. Post: immutable local metadata, no I/O.
INVALID-ARGUMENT for domains; geometry and body verified before writing."
  (unless (member kind '(:bucket :directory :chiave))
    (error 'invalid-argument :reason :index-page-kind))
  (unless (and (typep count '(integer 0 65535)) (typep parameter 'u32)
               (typep next 'page-number) (typep next-generation 'page-number))
    (error 'invalid-argument :reason :index-page-descriptor))
  (%make-descrittore-pagina identity kind count parameter next next-generation))
