;;; OWNER: coordinatore conserva vettori, token e file readonly stabili per l'intero calcolo.
;;; SHARED: sola lettura delle capacità, nessun append, callback I/O o pubblicazione.
(in-package #:arcdocdb.recovery.archive.csn)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-REC-002 REQ-TXM-005 REQ-AFF-008
(declaim (ftype (function (insieme-serie-recovery decisioni-recuperate simple-vector simple-vector index index)
                         index) verifica-piano-csn-preflight))
(defun verifica-piano-csn-preflight (set decisions active closed per-series total)
  "Pre: canonical tokens and stable vectors. Post: exact counts and ACTIVE+CLOSED sum within budget before gates.
Requires the very same Archivio context as the decision log, not merely an equal UUID.
INVALID-ARGUMENT for authority/count; RESOURCE-EXHAUSTED for segments; no container allocation."
  (unless (eq (insieme-serie-recovery-archive set)
              (arcdocdb.recovery.archive::decisioni-recuperate-archive decisions))
    (error 'invalid-argument :reason :archive-csn-decision-owner))
  (let ((count (length (insieme-serie-recovery-views set))) (segments 0))
    (unless (and (= count (length active)) (= count (length closed)))
      (error 'invalid-argument :reason :archive-csn-recovery-count))
    (setf segments count)
    (when (> segments total) (error 'resource-exhausted :reason :archive-csn-segment-budget))
    (loop for item across closed
          do (let ((n (length (the simple-vector item))))
               (when (or (> n per-series) (> n (- total segments)))
                 (error 'resource-exhausted :reason :archive-csn-segment-budget))
               (incf segments n)))
    (unless (<= count segments total)
      (error 'invariant-violation :reason :archive-csn-segment-count))
    segments))

;;; REQ: REQ-REC-001 REQ-MVC-006 REQ-TXM-005 REQ-AFF-008
(declaim (ftype (function (vista-get-serie decisioni-recuperate active-recuperato) null)
                verifica-origine-active-csn))
(defun verifica-origine-active-csn (view decisions active)
  "Pre: canonical ACTIVE result and decision log from the set's Archivio.
Post: same view by EQ and same replay origin actually used to resolve prepared data.
A second replay of the same bytes is not the same authority; INVALID-ARGUMENT before the CLOSED gate.
The private marker does not retain entries, FDs, or the decision table in the ACTIVE result."
  (unless (eq view (arcdocdb.control::control-recuperato-view
                   (arcdocdb.recovery.active::active-recuperato-control active)))
    (error 'invalid-argument :reason :archive-csn-active-view))
  (unless (eq (arcdocdb.recovery.active::active-recuperato-decision-origin active)
              (arcdocdb.recovery.decisions::%table-origin
               (arcdocdb.recovery.archive::decisioni-recuperate-table decisions)))
    (error 'invalid-argument :reason :archive-csn-active-decision-source))
  nil)
