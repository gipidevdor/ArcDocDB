;;; OWNER: controller distribuisce le capacità dopo bootstrap e completamento del recovery.
;;; SHARED: lettura acquire del binding; getter locali senza lock o allocazione esplicita.
(in-package #:arcdocdb.runtime)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-AFF-008
(declaim (ftype (function (archivio-recovery) (or null runtime-archivio)) trova-runtime-archivio))
(defun trova-runtime-archivio (archive)
  "Pre: canonical Archivio object. Post: NIL or the same immutable binding after acquire.
Allows recovering the binding if caller is interrupted after CAS, without reset.
INVARIANT-VIOLATION :ARCHIVE-RUNTIME-BINDING for foreign slot; does not certify runtime health."
  (let ((runtime (arcdocdb.recovery.archive::archivio-recovery-runtime archive)))
    (sb-thread:barrier (:read))
    (unless (typep runtime '(or null runtime-archivio))
      (error 'invariant-violation :reason :archive-runtime-binding))
    runtime))

;;; REQ: REQ-MVC-008 REQ-AFF-008
(declaim (ftype (function (runtime-archivio) registro-csn) csn-runtime-archivio))
(defun csn-runtime-archivio (runtime)
  "Pre: published capsule. Post: unique registry to pass to Archivio writers and decisions.
TYPE-ERROR for invalid type; no assignment or health attestation."
  (runtime-archivio-csns runtime))

;;; REQ: REQ-CMP-007 REQ-MVC-007
(declaim (ftype (function (runtime-archivio) ambito-get) ambito-runtime-archivio))
(defun ambito-runtime-archivio (runtime)
  "Pre: published capsule. Post: new scope for runtime GET views and contexts.
TYPE-ERROR for invalid type; old recovery scope is not modified."
  (runtime-archivio-scope runtime))

;;; REQ: REQ-MVC-007 REQ-MVC-008
(declaim (ftype (function (runtime-archivio) registro-snapshot) snapshot-runtime-archivio))
(defun snapshot-runtime-archivio (runtime)
  "Pre: published capsule. Post: snapshot registry of the same scope and CSN registry.
TYPE-ERROR for invalid type; no snapshot registered."
  (arcdocdb.get::ambito-get-snapshots (runtime-archivio-scope runtime)))

;;; REQ: REQ-CMP-007 REQ-AFF-008
(declaim (ftype (function (runtime-archivio) registro-epoche) epoche-runtime-archivio))
(defun epoche-runtime-archivio (runtime)
  "Pre: published capsule. Post: EBR domain of the same scope, readers already preallocated.
TYPE-ERROR for invalid type; exclusive worker IDs assigned by controller."
  (arcdocdb.get::ambito-get-epochs (runtime-archivio-scope runtime)))
