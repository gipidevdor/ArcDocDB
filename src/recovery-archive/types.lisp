;;; OWNER: controller associa una volta UUID autorevole e ambito canonico; copie possedute.
;;; SHARED: identità immutabile; binding runtime una sola volta via CAS, solo nel bootstrap.
(in-package #:arcdocdb.recovery.archive)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-FOR-001 REQ-TXM-005 REQ-AFF-008
(defstruct (archivio-recovery (:constructor %make-archivio-recovery (scope identity)) (:copier nil))
  "Pre: controller binds authoritative UUID and scope of the same Archivio before recovery.
Post: immutable links and initially NIL runtime binding; does not certify catalog uniqueness.
TYPE-ERROR for invalid types; no array accessor exported."
  (scope nil :type ambito-get :read-only t)
  (identity #() :type (simple-array (unsigned-byte 8) (#.+log-identity-bytes+)) :read-only t)
  ;; Tipo opaco per evitare dipendenza circolare: il solo writer è ARCDOCDB.RUNTIME.
  ;; Nessun reset o accesso sul percorso delle operazioni delle Serie.
  (runtime nil :type t))

;;; REQ: REQ-REC-001 REQ-FOR-001 REQ-TXM-005 REQ-AFF-008
(declaim (ftype (function (ambito-get octets) archivio-recovery) crea-archivio-recovery))
(defun crea-archivio-recovery (scope identity)
  "Pre: exclusive bootstrap, stable canonical UUID, GET scope of the same Archivio.
Post: owned copy of sixteen bytes, without aliasing caller ID or future scratch.
INVALID-ARGUMENT for a different length; initial binding guaranteed by the controller."
  (unless (= (length identity) +log-identity-bytes+)
    (error 'invalid-argument :reason :archive-recovery-identity))
  (%make-archivio-recovery scope (copy-seq identity)))

;;; REQ: REQ-REC-001 REQ-TXM-005 REQ-FOR-003 REQ-AFF-008
(defstruct (decisioni-recuperate
             (:constructor %make-decisioni-recuperate (archive input table size prefix status version))
             (:copier nil))
  "Pre: same read-only FD read through attested EOF, header and entire DECISION prefix verified.
Post: owned result bound to the Archivio, without scratch aliasing; no partial table.
Does not measure EOF or certify catalog or future health; TYPE-ERROR for invalid types."
  (archive nil :type archivio-recovery :read-only t)
  (input nil :type file-io :read-only t)
  (table nil :type arcdocdb.recovery.decisions::decision-table :read-only t)
  (size 0 :type index :read-only t)
  (prefix 0 :type index :read-only t)
  (status :complete :type (member :complete :tail) :read-only t)
  (version 2 :type (member 1 2) :read-only t))
