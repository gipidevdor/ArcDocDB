(in-package #:arcdocdb.fulltext.index)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-SEC-003 REQ-SEC-010
(declaim (ftype (function (t &key (:max-work t)) keyword) sigilla-indice-posizionale))
(defun sigilla-indice-posizionale (run &key (max-work 268435456))
  "Pre: BUILDING run, fields fully copied. Post: starts resumable sorting.
Limit includes copying already performed. Does not make a Serie index durable or READY.
INVALID-ARGUMENT for state/limit, RESOURCE-EXHAUSTED for budget already consumed."
  (unless (and (typep run 'indice-posizionale) (eq :building (indice-posizionale-state run))
               (typep max-work 'index) (plusp max-work))
    (error 'invalid-argument :reason :fulltext-index-seal))
  (when (< max-work (indice-posizionale-work run))
    (error 'resource-exhausted :reason :fulltext-index-work))
  (setf (indice-posizionale-work-limit run) max-work (indice-posizionale-state run) :heap-build
        (indice-posizionale-heap run) (floor (indice-posizionale-count run) 2)
        (indice-posizionale-heap-end run) (indice-posizionale-count run))
  :running)

;;; REQ: REQ-SEC-003 REQ-SEC-010
(declaim (ftype (function (t t) keyword) passo-indice-posizionale))
(defun passo-indice-posizionale (run quantum)
  "Pre: exclusive run, quantum 1..65536. Post: BUILDING, RUNNING, or SEALED.
One step copies one byte/record or repairs a heap of maximum depth 32.
Domain error: FAILED and SOURCE borrow released, no query admitted."
  (unless (and (typep run 'indice-posizionale) (typep quantum '(integer 1 65536)))
    (error 'invalid-argument :reason :fulltext-index-step))
  (when (eq :failed (indice-posizionale-state run)) (error 'invalid-argument :reason :fulltext-index-failed))
  (handler-case
      (dotimes (i quantum)
        (when (member (indice-posizionale-state run) '(:building :sealed)) (return))
        (consuma-lavoro-indice run)
        (case (indice-posizionale-state run)
          (:copying (copia-passo-full-text run))
          ((:heap-build :heap-sort) (ordina-passo-full-text run))
          (otherwise (error 'invariant-violation :reason :fulltext-index-phase))))
    (arcdocdb-error (condition)
      (setf (indice-posizionale-state run) :failed (indice-posizionale-source run) nil)
      (error condition)))
  (case (indice-posizionale-state run)
    (:building :building) (:sealed :sealed) (otherwise :running)))
