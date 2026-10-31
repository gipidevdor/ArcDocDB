;;;; Contesto preallocato di un worker: nessuna migrazione o reentrancy.
;;; OWNER: campi locali al thread creatore; obbligo e lease mai abbandonati su busy.
;;; SHARED: soltanto lista pronta per tratto (ADR-0045 §8); nessuna scrittura globale.
(in-package #:arcdocdb.execution)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (contesto-worker-writer t t t) (values index (member :messages :empty :yield) index &optional)) preleva-lavori-worker))
(defun preleva-lavori-worker (context target start end)
  "Pre: RUNNING without a batch; private target, valid span. Post: BATCH with new
local token if messages, RUNNING/token0 if empty/yield. Busy/invalid target do not
pop; RESOURCE-EXHAUSTED generation before pop, even for empty/yield.
Token is not global: ack uses the context/token pair; writer conditions delegated."
  (%passo-worker (context (:worker-state :worker-generation :writer-queue-busy) (:writer-target))
  (%richiedi-worker context :running)
  (%check-target (writer-programmabile-queue (contesto-worker-writer-writer context))
                 target start end)
  (when (= (contesto-worker-writer-batch-generation context) most-positive-fixnum)
    (error 'resource-exhausted :reason :worker-generation))
  (multiple-value-bind (count status)
      (preleva-lavori-writer (contesto-worker-writer-writer context)
                             (contesto-worker-writer-lease context) target start end)
    (case status
      (:messages
       (unless (plusp count) (error 'invariant-violation :reason :worker-state))
       (incf (contesto-worker-writer-batch-generation context))
       (setf (contesto-worker-writer-pending context) count
             (contesto-worker-writer-state context) :batch))
      ((:empty :yield)
       (unless (zerop count) (error 'invariant-violation :reason :worker-state)))
      (otherwise (error 'invariant-violation :reason :worker-state)))
    (%check-worker context)
    (values count status (if (plusp count) (contesto-worker-writer-batch-generation context) 0)))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (contesto-worker-writer t) null) conferma-lavori-worker))
(defun conferma-lavori-worker (context token)
  "Pre: BATCH fully processed by the caller, current local token.
Post: RUNNING without debt; INVALID-ARGUMENT for incorrect/stale token before
writes, typed phase/owner/verifiers. The caller attests to work, not external effects."
  (%passo-worker (context (:worker-state) (:worker-batch))
  (%richiedi-worker context :batch)
  (unless (typep token 'index) (error 'invalid-argument :reason :worker-batch))
  (unless (plusp token) (error 'invalid-argument :reason :worker-batch))
  (unless (= token (contesto-worker-writer-batch-generation context))
    (error 'invalid-argument :reason :worker-batch))
  (setf (contesto-worker-writer-pending context) 0
        (contesto-worker-writer-state context) :running)
  (%check-worker context)
  nil))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (contesto-worker-writer (member :idle :schedule)) null) %concludi-worker))
(defun %concludi-worker (context action)
  "Pre: handoff complete, FINISHING context without debt. Post: free IDLE
or RESCHEDULE with obligation; INVARIANT-VIOLATION for inconsistent phase/debt/outcome."
  (%check-owner-worker context)
  (unless (eq (contesto-worker-writer-state context) :finishing)
    (error 'invariant-violation :reason :worker-state))
  (unless (zerop (contesto-worker-writer-pending context))
    (error 'invariant-violation :reason :worker-state))
  (setf (contesto-worker-writer-lease context) 0)
  (case action
    (:idle (setf (contesto-worker-writer-writer context) nil
                 (contesto-worker-writer-state context) :idle))
    (:schedule (setf (contesto-worker-writer-state context) :reschedule))
    (otherwise (error 'invariant-violation :reason :worker-state)))
  (%check-worker context)
  nil)

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (contesto-worker-writer) (member :idle :schedule)) termina-tratto-worker))
(defun termina-tratto-worker (context)
  "Pre: RUNNING after ack or FINISHING to retry. Post: IDLE/RESCHEDULE.
Latches FINISHING before the call: busy retains lease/reference and prevents
new pop/ack. Only completion is retried; typed handoff conditions/verifiers.
No writer cleanup after end, no durable change or callback."
  (%passo-worker (context (:worker-state :writer-queue-busy) ())
  (%check-worker context)
  (case (contesto-worker-writer-state context)
    ((:running :finishing) nil)
    (otherwise (error 'resource-exhausted :reason :worker-state)))
  (setf (contesto-worker-writer-state context) :finishing)
  (%check-worker context)
  (let ((action (termina-tratto-writer (contesto-worker-writer-writer context)
                                      (contesto-worker-writer-lease context))))
    (%concludi-worker context action)
    action)))
