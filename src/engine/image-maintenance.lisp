;;; OWNER: policy immutabile del controller; richieste seriali del solo attore M1.
;;; SHARED: policy condivisibile readonly, nessun contatore o scrittura fra Serie.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-010 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (delta-indice-motore politica-rinnovo-indice) boolean) delta-oltre-soglia-p))
(defun delta-oltre-soglia-p (delta policy)
  "Pre: stable private delta. Post: T if keys or bytes reach inclusive threshold.
Exact integer comparisons without division: even u32*100 remains an SBCL64 fixnum; no allocation.
Out-of-quota counters or inconsistent emptiness signal INVARIANT-VIOLATION, never a false hold result."
  (let ((count (delta-indice-motore-count delta)) (used (delta-indice-motore-used delta))
        (limit (delta-indice-motore-limit delta)) (bytes (length (delta-indice-motore-arena delta)))
        (percent (politica-rinnovo-indice-soglia policy)))
    (unless (and (<= count limit) (<= count used bytes))
      (error 'invariant-violation :reason :engine-image-maintenance-counters))
    (unless (eq (zerop count) (zerop used))
      (error 'invariant-violation :reason :engine-image-maintenance-empty))
    (or (>= (* count 100) (* limit percent)) (>= (* used 100) (* bytes percent)))))

;;; REQ: REQ-IDX-010 REQ-CON-002 REQ-AFF-001
(declaim (ftype (function (motore politica-rinnovo-indice) boolean) rinnovo-indice-richiesto-p))
(defun rinnovo-indice-richiesto-p (engine policy)
  "Pre: READY owner with active image and delta. Post: copied decision, no I/O or reservation.
INVALID-ARGUMENT for mode without delta; corrupt counters cause FAULTED, preserving primary cause.
Does not authorize a future PUT or guarantee space for an as-yet-unobserved key."
  (esigi-motore-pronto engine)
  (when (motore-automatic-index engine) (error 'invalid-argument :reason :engine-legacy-profile-required))
  (let ((delta (motore-delta engine)))
    (unless delta (error 'invalid-argument :reason :engine-image-maintenance-without-delta))
    (handler-case
        (progn
          (unless (motore-paged engine) (error 'invariant-violation :reason :engine-image-maintenance-without-view))
          (delta-oltre-soglia-p delta policy))
      (error (condition)
        (tenta-cleanup-motore engine (lambda () (guasta-motore engine condition)))
        (error condition)))))

;;; REQ: REQ-IDX-010 REQ-LIM-003 REQ-CON-002
(declaim (ftype (function (motore politica-rinnovo-indice opzione-indice-paginato
                         &key (:max-maintenance-payload t) (:max-pages t)) (member :mantieni :rinnovato))
                mantieni-indice-paginato-motore))
(defun mantieni-indice-paginato-motore (engine policy option &key (max-maintenance-payload 67108864) (max-pages 65536))
  "Pre: READY owner with delta; candidate OPTION used only when threshold requires renewal.
Post: MANTIENI without I/O or RINNOVATO after complete request, with unchanged delta quotas.
No timer, retry, mode choice, or generated name; invalid configurations rejected even for no-op.
Renewal inherits preflight and FAULTED boundary; no CSN consumed or write admitted."
  (esigi-motore-pronto engine)
  (when (motore-automatic-index engine) (error 'invalid-argument :reason :engine-legacy-profile-required))
  (unless (and (typep max-maintenance-payload '(integer 0 536870912)) (typep max-pages '(integer 1 65536)))
    (error 'invalid-argument :reason :engine-image-maintenance-configuration))
  (if (rinnovo-indice-richiesto-p engine policy)
      (let ((delta (motore-delta engine)))
        (rinnova-indice-paginato-motore engine option :max-maintenance-payload max-maintenance-payload
          :max-pages max-pages :delta-keys (delta-indice-motore-limit delta)
          :delta-key-bytes (length (delta-indice-motore-arena delta)))
        :rinnovato)
      :mantieni))
