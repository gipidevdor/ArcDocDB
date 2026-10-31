;;; OWNER: publisher osserva durante il compito; controller legge soltanto dopo consegna/join.
;;; SHARED: osservazioni scalari, nessun nuovo permesso concorrente o prova di salute corrente.
(in-package #:arcdocdb.control)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-AFF-004
(declaim (ftype (function (control-preparato)
                         (values (member :prepared :publishing :published :faulted) boolean &optional))
                stato-pubblicazione-control))
(defun stato-pubblicazione-control (prepared)
  "Pre: owner or controller after join. Post: state and observed rename success at boundary.
NIL does not prove absence of effects: FAULTED always requires new authoritative reconciliation.
Not a concurrent snapshot of both slots or authorization to retry/close/delete."
  (values (control-preparato-publication-state prepared) (control-preparato-rename-observed prepared)))

;;; REQ: REQ-WAL-002 REQ-REC-001
(declaim (ftype (function (control-pubblicato) log-io) log-control-pubblicato))
(defun log-control-pubblicato (published)
  "Pre: completed publication result. Post: canonical log of new control.log.
Attests to neither current health nor old-log quiescence; caller retains ownership."
  (control-preparato-log (control-pubblicato-prepared published)))

;;; REQ: REQ-REC-001
(declaim (ftype (function (control-pubblicato) arcdocdb.recovery.manifest::manifest) manifest-control-pubblicato))
(defun manifest-control-pubblicato (published)
  "Pre: complete result. Post: installed checkpoint manifest; read-only queries.
Inventory, indexes, and multiseries decisions still require recovery reconciliation."
  (control-preparato-manifest (control-pubblicato-prepared published)))

;;; REQ: REQ-REC-001 REQ-STO-003
(declaim (ftype (function (control-pubblicato) segmento-attivo-preparato) active-control-pubblicato))
(defun active-control-pubblicato (published)
  "Pre: complete result. Post: canonical ACTIVE dependency named by installed checkpoint.
Neither creates controller nor publishes GET root; adoption and recovery gate remain with caller."
  (control-preparato-active (control-pubblicato-prepared published)))
