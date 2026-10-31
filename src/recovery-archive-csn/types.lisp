;;; OWNER: coordinatore costruisce una copia dell'elenco canonico prima di aggregare i recovery.
;;; SHARED: legami readonly, nessun vettore esportato o fonte durevole trattenuta nel piano.
(in-package #:arcdocdb.recovery.archive.csn)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-REC-002 REQ-TXM-005 REQ-AFF-008
(defstruct (insieme-serie-recovery
             (:constructor %make-insieme-serie-recovery (archive views)) (:copier nil))
  "Pre: complete authoritative catalog list, unique UUIDs, same scope, Registri included.
Post: owned read-only vector distinct from the caller's; canonical views by EQ.
Does not verify the on-disk catalog or infer the Registri role from the name; no public accessor."
  (archive nil :type archivio-recovery :read-only t)
  (views #() :type simple-vector :read-only t))

;;; REQ: REQ-REC-001 REQ-MVC-006 REQ-TXM-005 REQ-AFF-008
(defstruct (piano-csn-archivio
             (:constructor %make-piano-csn-archivio (archive series segments present maximum)) (:copier nil))
  "Pre: all Serie in the set and same decision replay, frozen and verified sources.
Post: read-only scalar summary; no list, decision table, Serie result, or FD retained.
Does not certify future health or authorize traffic or creation of multiple allocators."
  (archive nil :type archivio-recovery :read-only t)
  (series 0 :type index :read-only t)
  (segments 0 :type index :read-only t)
  (present nil :type boolean :read-only t)
  (maximum 0 :type u64 :read-only t))
