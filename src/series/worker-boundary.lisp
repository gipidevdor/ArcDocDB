;;;; Confine del tratto composto; nessun cleanup automatico o condizione sostituita.
;;; OWNER: thread del contesto; controller marcato solo con la lease ancora corrente.
;;; SHARED: salute della propria Serie su fault; nessuno stato tra Serie sul percorso normale.
(in-package #:arcdocdb.execution.series)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-004 REQ-AFF-001 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (collegamento-worker-serie) null) %fault-serie-posseduta))
(defun %fault-serie-posseduta (link)
  "Pre: unexpected error at the worker boundary. Post: Archivio FAULTED only if the
captured Serie lease is still owned; no Serie write after handoff.
Private scalar reads without check-ring: does not mask the original condition."
  (let ((controller (collegamento-worker-serie-controller link))
        (lease (collegamento-worker-serie-series-lease link)))
    (when (and (plusp lease)
               (eq (arcdocdb.series::controllore-serie-owner controller) sb-thread:*current-thread*)
               (= (arcdocdb.series::controllore-serie-lease-generation controller) lease))
      (arcdocdb.series::%mark-fault controller :archive)))
  nil)

;;; REQ: REQ-CON-004 REQ-AFF-008
(declaim (ftype (function (collegamento-worker-serie list list error) null) %fault-worker-serie))
(defun %fault-worker-serie (link resources arguments condition)
  "Pre: verified owner, error during the step. Post: expected error propagated; unexpected error
retained by EQ, bridge and worker terminal, capabilities retained without rollback.
Bounded literal reasons; after Serie release, Archivio coordination belongs to the caller."
  (unless (eq (stato-worker-writer (collegamento-worker-serie-context link)) :faulted)
    (when (typep condition 'resource-exhausted)
      (when (member (error-reason condition) resources) (return-from %fault-worker-serie nil)))
    (when (typep condition 'invalid-argument)
      (when (member (error-reason condition) arguments) (return-from %fault-worker-serie nil))))
  (%fault-serie-posseduta link)
  (setf (collegamento-worker-serie-fault link) condition
        (collegamento-worker-serie-state link) :faulted)
  (unless (eq (stato-worker-writer (collegamento-worker-serie-context link)) :faulted)
    (arcdocdb.execution::%classifica-guasto-worker
     (collegamento-worker-serie-context link) nil nil condition))
  (unless (eq (collegamento-worker-serie-fault link) condition)
    (error 'invariant-violation :reason :worker-serie-state))
  (unless (eq (collegamento-worker-serie-state link) :faulted)
    (error 'invariant-violation :reason :worker-serie-state))
  nil)

;;; REQ: REQ-CON-004 REQ-AFF-008
(defmacro %passo-worker-serie ((link resources arguments) &body body)
  "Pre: nonreentrant owner-only, exact reasons per step. Post: body
values or same condition propagated; unexpected condition recorded with terminal state.
Owner and faulted checks before the handler; no waiting/callback or implicit release."
  (let ((value (gensym "LINK")) (handler (gensym "LINK-ERROR")))
    `(let ((,value ,link))
       (%check-owner-worker-serie ,value)
       (when (eq (collegamento-worker-serie-state ,value) :faulted)
         (error 'resource-exhausted :reason :worker-serie-state))
       (flet ((,handler (condition)
                (%fault-worker-serie ,value ',resources ',arguments condition)))
         (declare (dynamic-extent #',handler))
         (handler-bind ((error #',handler)) ,@body)))))
