;;; OWNER: writer con lease costruisce; ogni radice e pagina completata è immutabile.
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
(defstruct (sorgente-get-attiva
             (:constructor %make-sorgente-get-attiva
                 (controller segment max-pages max-puts batch-records batch-bytes budget)) (:copier nil))
  "Pre: controller and read-only FD of the same new ACTIVE, caller's physical association.
Post: owned immutable capability/configuration, no invented frontier.
Created before tasks; FD lives until EBR reclamation of last root."
  (controller nil :type controllore-serie :read-only t)
  (segment nil :type segmento-get :read-only t)
  (max-pages 1 :type (integer 1 65536) :read-only t)
  (max-puts 1 :type u32 :read-only t)
  (batch-records 1 :type u32 :read-only t)
  (batch-bytes 56 :type u32 :read-only t)
  (budget 0 :type index :read-only t))

;;; REQ: REQ-IDX-001 REQ-WAL-006 REQ-AFF-008
(defstruct (radice-get-attiva
             (:constructor %make-radice-get-attiva (source directory count puts nodes end content)) (:copier nil))
  "Pre: verified delta or empty startup at offset 64; private persistent directory.
Post: no references to reusable batch/event or previous root.
Initial CAS publishes header only; subsequent CAS operations require WAL coverage."
  (source nil :type sorgente-get-attiva :read-only t)
  (directory nil :type (or null simple-vector) :read-only t)
  (count 0 :type (integer 0 65536) :read-only t)
  (puts 0 :type u32 :read-only t)
  (nodes 0 :type index :read-only t)
  (end 64 :type u32 :read-only t)
  (content nil :type t :read-only t))

;;; REQ: REQ-WAL-006 REQ-IDX-001
(declaim (ftype (function (radice-get-attiva) t) contenuto-radice-get-attiva)
         (ftype (function (radice-get-attiva) index) payload-radice-get-attiva))
(defun contenuto-radice-get-attiva (root)
  "Pre: root prepared or acquired under EBR. Post: caller's immutable payload.
Does not attest to publication, concrete-index consistency, or external-resource lifetime."
  (radice-get-attiva-content root))

;;; REQ: REQ-AFF-008 REQ-IDX-001
(defun payload-radice-get-attiva (root)
  "Pre: complete root. Post: 24 bytes/PUT plus 128 bytes/node in view, on 64-bit SBCL.
Excludes Lisp headers/objects, retired roots, FD, batch, and caller payload; does not measure RSS."
  (+ (* +active-row-payload+ (radice-get-attiva-puts root))
     (* +active-node-payload+ (radice-get-attiva-nodes root))))
