;;; OWNER: sole M1 actor installs configuration; immutable configuration is reusable.
;;; SHARED: no new shared state, names and ordinals belong to each engine.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-012 REQ-LIM-003
(declaim (ftype (function (t &key (:policy t) (:max-renewals t) (:max-maintenance-payload t) (:max-pages t))
                         opzione-rinnovo-automatico) crea-opzione-rinnovo-automatico))
(defun crea-opzione-rinnovo-automatico (first &key (policy (crea-politica-rinnovo-indice))
                                                 (max-renewals 64) (max-maintenance-payload 67108864) (max-pages 65536))
  "Pre: first fresh image option and finite configuration. Post: immutable bounded renewal sequence.
INVALID-ARGUMENT for malformed domains or ID wrap, before I/O; payload excludes runtime objects/RSS."
  (unless (and (typep first 'opzione-indice-paginato) (typep policy 'politica-rinnovo-indice))
    (error 'invalid-argument :reason :engine-auto-renewal-configuration))
  (unless (and (typep max-renewals '(integer 1 65536))
               (typep max-maintenance-payload '(integer 0 536870912)) (typep max-pages '(integer 1 65536)))
    (error 'invalid-argument :reason :engine-auto-renewal-budgets))
  (when (> (+ (id-immagine-costruzione first) (1- max-renewals)) arcdocdb.index.page::+page-id-max+)
    (error 'invalid-argument :reason :engine-auto-renewal-id-range))
  (%make-opzione-rinnovo-automatico first policy max-renewals max-maintenance-payload max-pages))

;;; REQ: REQ-IDX-012 REQ-CON-002
(declaim (ftype (function (motore t) null) configura-rinnovo-automatico-motore))
(defun configura-rinnovo-automatico-motore (engine option)
  "Pre: owner READY, OPTION validated or NIL to disable. Post: private ordinal reset without I/O/CSN.
Enabling requires a paged image with delta; INVALID-ARGUMENT preserves the prior configuration."
  (esigi-motore-pronto engine)
  (when (motore-automatic-index engine) (error 'invalid-argument :reason :engine-legacy-profile-required))
  (unless (typep option '(or null opzione-rinnovo-automatico))
    (error 'invalid-argument :reason :engine-auto-renewal-configuration))
  (when option
    (unless (and (motore-paged engine) (motore-delta engine))
      (error 'invalid-argument :reason :engine-auto-renewal-without-delta)))
  (setf (motore-auto-renewal engine) option (motore-auto-renewals-used engine) 0)
  nil)

;;; REQ: REQ-IDX-012 REQ-LIM-003
(declaim (ftype (function (motore opzione-rinnovo-automatico) opzione-indice-paginato) prossima-opzione-rinnovo))
(defun prossima-opzione-rinnovo (engine config)
  "Pre: owner READY and stable configuration. Post: one bounded fresh-name proposal, no I/O.
RESOURCE-EXHAUSTED at the sequence limit, never wrap, scan, overwrite or retry; allocation only for renewal."
  (esigi-motore-pronto engine)
  (when (motore-automatic-index engine) (error 'invalid-argument :reason :engine-legacy-profile-required))
  (let ((used (motore-auto-renewals-used engine)) (first (opzione-rinnovo-automatico-first config)))
    (when (>= used (opzione-rinnovo-automatico-renewals config))
      (error 'resource-exhausted :reason :engine-auto-renewal-limit))
    (crea-opzione-indice-paginato
      (string-downcase (format nil "primary-~16,'0x.idx.tmp" (+ (id-immagine-costruzione first) used)))
      :page-size (opzione-indice-paginato-size first) :frames (opzione-indice-paginato-frames first)
      :max-visits (opzione-indice-paginato-visits first) :max-bytes (opzione-indice-paginato-bytes first))))
