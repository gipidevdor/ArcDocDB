;;;; Routing per ordinal immutabile; nessun hash o ricerca nel percorso caldo.
;;; OWNER: registro costruito prima della pubblicazione; tabella del solo worker.
;;; SHARED: registro read-only tra worker, letto una volta per tratto (ADR-0045 §8).
(in-package #:arcdocdb.execution.series)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(defconstant +max-worker-series-routes+ (1+ arcdocdb.execution::+max-writer-routing-index+))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(defstruct (registro-worker-serie
             (:constructor %make-registro-worker-serie (writers controllers)) (:copier nil))
  "Pre: private vectors, bijective mapping, writer ordinal equal to slot.
Post: immutable registry; no access to live Serie state or leases."
  (writers #() :type simple-vector :read-only t)
  (controllers #() :type simple-vector :read-only t))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(defstruct (tabella-worker-serie
             (:constructor %make-tabella-worker-serie (context registry links)) (:copier nil))
  "Pre: owner-only context, one binding per registry slot.
Post: preallocated nonmigrating table; links mutable only on worker."
  (context nil :type contesto-worker-writer :read-only t)
  (registry nil :type registro-worker-serie :read-only t)
  (links #() :type simple-vector :read-only t))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (registro-worker-serie) index) %routing-size))
(defun %routing-size (registry)
  "Pre: constructed registry published immutably. Post: valid size.
INVARIANT-VIOLATION for corrupt shape; neither scans nor mutates elements."
  (let ((size (length (registro-worker-serie-writers registry))))
    (unless (<= 1 size +max-worker-series-routes+)
      (error 'invariant-violation :reason :worker-serie-routing))
    (unless (= size (length (registro-worker-serie-controllers registry)))
      (error 'invariant-violation :reason :worker-serie-routing))
    size))
