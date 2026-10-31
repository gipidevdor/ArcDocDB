;;; OWNER: builder costruisce dati privati; publisher possiede il gettone locale durante lo swap.
;;; SHARED: buffer non esportati; manifest posseduto, consultato soltanto tramite query.
(in-package #:arcdocdb.control)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-FOR-003 REQ-REC-001 REQ-AFF-008
(defstruct (checkpoint-control
             (:constructor %make-checkpoint-control (active bytes identity manifest version)) (:copier nil))
  "Pre: header, complete EDIT, and SEAL verified; manifest references prepared ACTIVE.
Post: immutable owned plan, without I/O; no API exports the buffer.
Does not attest to the CLOSED inventory, ID allocator, or catalog decision."
  (active nil :type segmento-attivo-preparato :read-only t)
  (bytes #() :type octets :read-only t)
  (identity #() :type (simple-array (unsigned-byte 8) (#.+log-identity-bytes+)) :read-only t)
  (manifest nil :type arcdocdb.recovery.manifest::manifest :read-only t)
  (version 2 :type (member 1 2) :read-only t))

;;; REQ: REQ-AFF-001 REQ-REC-001 REQ-FOR-003
(defstruct (control-preparato
             (:constructor %make-control-preparato (log manifest active association directory end)) (:copier nil))
  "Pre: checkpoint written, synchronized, reread equal; parent synchronized.
Post: log/manifest, canonical directory, and expected frontier, without plan buffer/scratch.
The caller retains capabilities and dependencies until the atomicity point required by the catalog."
  (log nil :type log-io :read-only t)
  (manifest nil :type arcdocdb.recovery.manifest::manifest :read-only t)
  (active nil :type segmento-attivo-preparato :read-only t)
  (association nil :type associazione-file :read-only t)
  (directory nil :type file-io :read-only t)
  (end 0 :type index :read-only t)
  (publication-owner nil :type t)
  (publication-state :prepared :type (member :prepared :publishing :published :faulted))
  (rename-observed nil :type boolean))

;;; REQ: REQ-REC-001 REQ-AFF-001
(defstruct (control-pubblicato (:constructor %make-control-pubblicato (prepared)) (:copier nil))
  "Pre: private wrapper before I/O, delivered only after verified rename and parent fsync.
Post: successful publication capability, without old FD or buffer; does not complete full recovery.
No API constructs this result from a name or an unprepared manifest."
  (prepared nil :type control-preparato :read-only t))

;;; REQ: REQ-AFF-008
(declaim (ftype (function (checkpoint-control) index) lunghezza-checkpoint-control))
(defun lunghezza-checkpoint-control (plan)
  "Pre: complete plan. Post: exact header/EDIT/SEAL bytes, without I/O or mutation."
  (length (checkpoint-control-bytes plan)))

;;; REQ: REQ-REC-001
(declaim (ftype (function (checkpoint-control) arcdocdb.recovery.manifest::manifest)
                manifest-checkpoint-control))
(defun manifest-checkpoint-control (plan)
  "Pre: complete plan. Post: owned manifest accessible through scalar queries.
No buffer exposure or proof of control log durability."
  (checkpoint-control-manifest plan))

;;; REQ: REQ-WAL-002 REQ-AFF-001
(declaim (ftype (function (control-preparato) log-io) log-control-preparato))
(defun log-control-preparato (prepared)
  "Pre: complete result and capabilities still owned. Post: unique canonical CONTROL log.
Does not certify current health, rename, or adoption by the server."
  (control-preparato-log prepared))

;;; REQ: REQ-REC-001
(declaim (ftype (function (control-preparato) arcdocdb.recovery.manifest::manifest)
                manifest-control-preparato))
(defun manifest-control-preparato (prepared)
  "Pre: complete result. Post: validated manifest from the checkpoint reread equal.
Read-only query; does not verify the presence or prefix of named CLOSED files."
  (control-preparato-manifest prepared))
