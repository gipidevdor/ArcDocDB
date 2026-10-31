;;; OWNER: controller costruisce viste e capacità; scratch posseduto dal solo worker.
;;; SHARED: legami immutabili; nessun riferimento fisico attraversa una migrazione.
(in-package #:arcdocdb.get)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-008 REQ-FOR-004 REQ-IDX-010
(defconstant +get-proof-bytes+ (+ +header-bytes+ +outcome-bytes+))
(defconstant +get-fixed-payload+ (+ (* (+ 5 1 5 4) 8) +get-proof-bytes+))
(deftype get-content () '(simple-array (unsigned-byte 64) (5)))
(deftype get-state () '(member :idle :starting :candidate :loading :verified :copied
                              :absent :history-required :retry :finishing :faulted))

;;; REQ: REQ-CMP-007 REQ-MVC-005 REQ-CON-004 REQ-AFF-008
(defstruct (ambito-get (:constructor crea-ambito-get (epochs snapshots)) (:copier nil))
  "Pre: controller binds EBR and snapshot registry of the same Archivio once only.
Post: immutable canonical identity shared by Archivio views and workers.
TYPE-ERROR for invalid types; correctness of the initial binding belongs to the controller."
  (epochs nil :type registro-epoche :read-only t)
  (snapshots nil :type registro-snapshot :read-only t))
(declaim (ftype (function (registro-epoche registro-snapshot) ambito-get) crea-ambito-get))

;;; REQ: REQ-IDX-001 REQ-CCH-002 REQ-FOR-001 REQ-CMP-007
(defstruct (vista-get-serie (:constructor %make-vista-get-serie (scope primary cache identity lookup)) (:copier nil))
  "Pre: controller binds index, cache, and identity of the same Serie.
Post: immutable bindings, copied identity; no array accessor exported.
Optional LOOKUP belongs to the controller: state and ownership must remain consistent with this view.
Does not certify commit publication or controller health."
  (scope nil :type ambito-get :read-only t)
  (primary nil :type (or null indice-primario) :read-only t)
  (lookup nil :type (or null function) :read-only t)
  (cache nil :type (or null cache-serie) :read-only t)
  (identity #() :type (simple-array (unsigned-byte 8) (#.+serie-id-bytes+)) :read-only t))

;;; REQ: REQ-FOR-001 REQ-FOR-002 REQ-AFF-002 REQ-CMP-007
(defstruct (segmento-get (:constructor %make-segmento-get
                         (owner file high low version origin)) (:copier nil))
  "Pre: header read from FILE and verified against authoritative Serie/segment identity.
Post: immutable read-only capability; file kept open by the controller until EBR reclamation.
Does not certify the committed prefix: the authoritative frontier is required on every access."
  (owner nil :type vista-get-serie :read-only t)
  (file nil :type file-io :read-only t)
  (high 0 :type u32 :read-only t)
  (low 0 :type u32 :read-only t)
  (version 2 :type (member 1 2) :read-only t)
  (origin 1 :type (member 1 2) :read-only t))

;;; REQ: REQ-CON-004 REQ-CCH-002 REQ-MVC-004 REQ-AFF-008
(defstruct (contesto-get (:constructor %make-contesto-get (scope reader probe content limit bytes proof))
                        (:copier nil))
  "Pre: registries of the same Archivio, scratch allocated before worker startup.
Post: IDLE, without a request or location. Only the worker modifies fields and buffers.
FAULTED is terminal; buffers not exported, no continuation or resource retained in a queue."
  (scope nil :type ambito-get :read-only t)
  (reader nil :type contesto-lettura :read-only t)
  (probe nil :type contesto-indice :read-only t)
  (content #() :type get-content :read-only t)
  (limit #() :type (simple-array (unsigned-byte 64) (1)) :read-only t)
  (bytes #() :type octets :read-only t)
  (proof #() :type (simple-array (unsigned-byte 8) (#.+get-proof-bytes+)) :read-only t)
  (view nil :type (or null vista-get-serie))
  (key nil :type (or null octets))
  (snapshot-p nil :type boolean)
  (value-start 0 :type index)
  (value-end 0 :type index)
  (state :idle :type get-state))

;;; REQ: REQ-CON-004 REQ-AFF-008
(declaim (ftype (function (contesto-get) index) payload-contesto-get))
(defun payload-contesto-get (context)
  "Pre: constructed context. Post: payload of its own buffers and index/read scratch.
Excludes Lisp headers/objects, EBR, snapshot registry, view, cache, output, and GC; not RSS."
  (+ (length (contesto-get-bytes context)) +get-fixed-payload+))

;;; REQ: REQ-CON-004 REQ-AFF-004
(declaim (ftype (function (contesto-get) get-state) stato-contesto-get))
(defun stato-contesto-get (context)
  "Pre: owning worker or controller after join. Post: local state observed without waiting.
Not concurrent authorization to take or reuse the worker."
  (contesto-get-state context))
