;;; OWNER: controller prima di allocare i registri; argomenti di configurazione non fidati.
;;; SHARED: sole letture del piano immutabile; nessuna prenotazione o binding parziale.
(in-package #:arcdocdb.runtime)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-MVC-008 REQ-CMP-007 REQ-AFF-008
(declaim (ftype (function (t t t t t t) null) verifica-configurazione-runtime))
(defun verifica-configurazione-runtime (csns snapshots workers retirements lifetime wait)
  "Pre: six external values. Post: capacities within registry limits and 1<=wait<=lifetime<=u64.
INVALID-ARGUMENT :ARCHIVE-RUNTIME-CONFIGURATION before any array, mutex, or binding."
  (unless (and (typep csns '(integer 1 65536)) (typep snapshots '(integer 1 65536))
               (typep workers '(integer 1 4096)) (typep retirements '(integer 1 65536)))
    (error 'invalid-argument :reason :archive-runtime-configuration))
  (unless (and (typep lifetime '(integer 1 #xffffffffffffffff))
               (typep wait '(integer 1 #xffffffffffffffff)) (<= wait lifetime))
    (error 'invalid-argument :reason :archive-runtime-configuration))
  nil)

;;; REQ: REQ-REC-001 REQ-MVC-006 REQ-AFF-008
(declaim (ftype (function (piano-csn-archivio) null) verifica-piano-runtime))
(defun verifica-piano-runtime (plan)
  "Pre: immutable complete plan, authoritative catalog maintained by controller.
Post: consistent cardinality and normalization; no source reread or retained.
INVARIANT-VIOLATION :ARCHIVE-RUNTIME-PLAN before construction or binding."
  (multiple-value-bind (series segments) (statistiche-piano-csn-archivio plan)
    (unless (and (plusp series) (>= segments series))
      (error 'invariant-violation :reason :archive-runtime-plan)))
  (multiple-value-bind (present maximum) (massimo-csn-archivio plan)
    (unless (or present (zerop maximum))
      (error 'invariant-violation :reason :archive-runtime-plan)))
  nil)
