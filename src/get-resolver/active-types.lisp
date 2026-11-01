;;; OWNER: writer con lease costruisce; ogni prefisso pubblicato resta immutabile.
;;; SHARED: radice locale della Serie via CAS esistente; GET non modifica il grafo.
(in-package #:arcdocdb.get.resolver)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-AFF-008
(defconstant +active-directory-width+ 16)
(defconstant +active-directory-levels+ 4)
(defconstant +active-directory-shift+ 12)
(defconstant +active-max-pages+ 65536)
(defconstant +active-page-attempts+ 17)
(defconstant +active-node-payload+ 128) ; sedici riferimenti, runtime SBCL a 64 bit.
(defconstant +active-row-payload+ (* 4 +row-words+))

;;; REQ: REQ-IDX-001 REQ-WAL-006 REQ-AFF-008
(defstruct (arena-get-attiva (:constructor %make-arena-get-attiva (ends limits rows)) (:copier nil))
  "Pre: cold source construction with the complete payload charged. Post: pointer-free append-only metadata.
One writer initializes each page/row boundary once; readers use only the acquired root's immutable prefix.
COUNT belongs to the writer only and never supplies a reader frontier. No durable effect."
  (ends #() :type resolver-words :read-only t)
  (limits #() :type resolver-words :read-only t)
  (rows #() :type resolver-words :read-only t)
  (count 0 :type (integer 0 65536)))

;;; REQ: REQ-IDX-001 REQ-AFF-008
(declaim (ftype (function (arena-get-attiva) index) payload-arena-get-attiva))
(defun payload-arena-get-attiva (arena)
  "Pre: owned initialized arena. Post: complete fixed u32 payload, including every unused tail entry.
Excludes object/array headers and root descriptors; not an RSS measurement. No mutation or I/O."
  (* 4 (+ (length (arena-get-attiva-ends arena)) (length (arena-get-attiva-limits arena))
          (length (arena-get-attiva-rows arena)))))

;;; REQ: REQ-IDX-001 REQ-WAL-006 REQ-AFF-008
(defstruct (sorgente-get-attiva
             (:constructor %make-sorgente-get-attiva
                 (controller segment max-pages max-puts batch-records batch-bytes budget &optional arena)) (:copier nil))
  "Pre: controller and read-only FD of the same new ACTIVE, caller's physical association.
Post: owned immutable capability/configuration, no invented frontier.
Created before tasks; FD lives until EBR reclamation of last root."
  (controller nil :type controllore-serie :read-only t)
  (segment nil :type segmento-get :read-only t)
  (max-pages 1 :type (integer 1 65536) :read-only t)
  (max-puts 1 :type u32 :read-only t)
  (batch-records 1 :type u32 :read-only t)
  (batch-bytes 56 :type u32 :read-only t)
  (budget 0 :type index :read-only t)
  (arena nil :type (or null arena-get-attiva) :read-only t))

;;; REQ: REQ-IDX-001 REQ-WAL-006 REQ-AFF-008
(defstruct (radice-get-attiva
             (:constructor %make-radice-get-attiva (source directory count puts nodes end content)) (:copier nil))
  "Pre: verified delta or empty startup at offset 64; private persistent directory.
Post: no references to reusable batch/event or previous root; captured prefix bounds never change.
An append-only source shares fixed arrays whose entries inside this root's prefix are immutable.
Initial CAS publishes header only; subsequent CAS operations require WAL coverage."
  (source nil :type sorgente-get-attiva :read-only t)
  (directory nil :type (or null simple-vector) :read-only t)
  (count 0 :type (integer 0 65536) :read-only t)
  (puts 0 :type u32 :read-only t)
  (nodes 0 :type index :read-only t)
  (end 64 :type u32 :read-only t)
  (content nil :type t :read-only t))

;;; REQ: REQ-IDX-001 REQ-WAL-006 REQ-AFF-008
(declaim (ftype (function (sorgente-get-attiva (or null radice-get-attiva) index u32) null)
                verifica-delta-attivo))

;;; REQ: REQ-WAL-006 REQ-IDX-001
(declaim (ftype (function (radice-get-attiva) t) contenuto-radice-get-attiva)
         (ftype (function (radice-get-attiva) index) payload-radice-get-attiva))
(defun contenuto-radice-get-attiva (root)
  "Pre: root prepared or acquired under EBR. Post: caller's immutable payload.
Does not attest to publication, concrete-index consistency, or external-resource lifetime."
  (radice-get-attiva-content root))

;;; REQ: REQ-AFF-008 REQ-IDX-001
(defun payload-radice-get-attiva (root)
  "Pre: complete root. Post: full reserved arena payload, or 24 bytes/PUT plus 128 bytes/persistent node.
Excludes Lisp headers/objects, retired roots, FD, batch, and caller payload; does not measure RSS."
  (let ((arena (sorgente-get-attiva-arena (radice-get-attiva-source root))))
    (if arena (payload-arena-get-attiva arena)
        (+ (* +active-row-payload+ (radice-get-attiva-puts root))
           (* +active-node-payload+ (radice-get-attiva-nodes root))))))
