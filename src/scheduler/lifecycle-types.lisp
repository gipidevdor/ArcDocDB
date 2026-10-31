;;;; Attivazione logica di worker preesistenti; nessun thread o attesa nel prodotto.
;;; OWNER: contesto e ack al worker; request/binding al coordinatore non rientrante.
;;; SHARED: una porta per worker, al massimo un comando per campione (INV-P6).
(in-package #:arcdocdb.scheduler)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008
(deftype pool-command () '(and fixnum unsigned-byte))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-005 REQ-AFF-008
(defstruct (porta-worker-pool
             (:constructor %make-porta-worker-pool (owner coordinator context request ack))
             (:copier nil))
  "Pre: creation on the IDLE worker, valid coordinator. Post: acknowledged initial state.
REQUEST/ACK = 2*generation + active bit; one outstanding command only, never reset.
Retirement retains context, thread, and diagnostics; does not transfer obligations."
  (owner sb-thread:*current-thread* :type sb-thread:thread :read-only t)
  (coordinator sb-thread:*current-thread* :type sb-thread:thread :read-only t)
  (context (error 'invariant-violation :reason :pool-port-state)
           :type arcdocdb.execution:contesto-worker-writer :read-only t)
  (request 1 :type pool-command) (ack 1 :type pool-command)
  (bound nil :type boolean))

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008 REQ-AFF-013
(defstruct (registro-pool
             (:constructor %make-registro-pool (controller ports owner target)) (:copier nil))
  "Pre: distinct stable ports and active prefix equal to the controller target.
Post: private vector, permanent binding; owner-only access without a heap snapshot.
ACTUAL counts logical acknowledgments, not OS threads or Archivio health."
  (controller (error 'invariant-violation :reason :pool-state)
              :type controllore-pool :read-only t)
  (ports #() :type simple-vector :read-only t)
  (owner sb-thread:*current-thread* :type sb-thread:thread :read-only t)
  (target 1 :type pool-workers))
