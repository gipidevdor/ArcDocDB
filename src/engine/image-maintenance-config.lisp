;;; OWNER: immutable controller policy; no resource or per-request shared state.
;;; SHARED: readonly configuration may be shared between Serie.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-010 REQ-LIM-003
(defstruct (politica-rinnovo-indice (:constructor %make-politica-rinnovo-indice (soglia)) (:copier nil))
  "Pre: threshold validated in 1..100. Post: immutable policy, no timer, I/O or assigned quota."
  (soglia 75 :type (integer 1 100) :read-only t))

;;; REQ: REQ-IDX-010 REQ-LIM-003
(declaim (ftype (function (&key (:soglia-percentuale t)) politica-rinnovo-indice) crea-politica-rinnovo-indice))
(defun crea-politica-rinnovo-indice (&key (soglia-percentuale 75))
  "Pre: controller configuration. Post: immutable policy; INVALID-ARGUMENT outside integer 1..100.
Configuration allocation only; the percentage does not measure free memory or RSS."
  (unless (and (typep soglia-percentuale 'fixnum) (<= 1 soglia-percentuale 100))
    (error 'invalid-argument :reason :engine-image-maintenance-policy))
  (%make-politica-rinnovo-indice soglia-percentuale))
