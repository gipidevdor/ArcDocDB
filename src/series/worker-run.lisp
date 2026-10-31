;;;; Writer prima di Serie; Serie prima dell'handoff del writer, sempre bounded.
;;; OWNER: contesto e binding del thread creatore; debito batch non cancellato.
;;; SHARED: owner della sola Serie per tratto; nessuna scrittura globale per messaggio.
(in-package #:arcdocdb.execution.series)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (collegamento-worker-serie)
                         (member nil :serie-busy :serie-lease-generation)) %acquire-worker-serie))
(defun %acquire-worker-serie (link)
  "Pre: writer acquired, CLOSING bridge with Serie lease0. Post: ACTIVE with
the current Serie, or CLOSING for busy/exhaustion without any pop.
Other errors propagated; no healthy gate, allowing I/O draining."
  (%passo-worker-serie (link () ())
  (unless (eq (collegamento-worker-serie-state link) :closing)
    (error 'invariant-violation :reason :worker-serie-state))
  (unless (zerop (collegamento-worker-serie-series-lease link))
    (error 'invariant-violation :reason :worker-serie-lease))
  (let ((refusal
          (handler-case
              (let ((lease (acquisisci-controllore-serie (collegamento-worker-serie-controller link))))
                (setf (collegamento-worker-serie-series-lease link) lease
                      (collegamento-worker-serie-state link) :active)
                nil)
            (resource-exhausted (condition)
              (unless (member (error-reason condition) '(:serie-busy :serie-lease-generation))
                (error condition))
              (error-reason condition)))))
    (%check-worker-serie link)
    refusal)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (collegamento-worker-serie)
                         (values index (member :active :closing)
                                 (member nil :serie-busy :serie-lease-generation) &optional)) inizia-worker-serie))
(defun inizia-worker-serie (link)
  "Pre: IDLE, CLAIMED worker for the associated writer. Post: new token and ACTIVE
only with both leases; rejected second acquisition => CLOSING/token.
Caller ends CLOSING before recycling, without pop/acquisition retry.
Binding/generation/phase checked before begin; writer busy leaves IDLE."
  (%passo-worker-serie (link (:worker-serie-state :worker-state :worker-serie-generation :writer-queue-busy)
                            (:worker-serie-binding))
    (%require-worker-serie link '(:idle))
    (let ((context (collegamento-worker-serie-context link)))
      (arcdocdb.execution::%richiedi-worker context :claimed)
      (unless (eq (writer-worker-writer context) (collegamento-worker-serie-writer link))
        (error 'invalid-argument :reason :worker-serie-binding))
      (when (= (collegamento-worker-serie-generation link) most-positive-fixnum)
        (error 'resource-exhausted :reason :worker-serie-generation))
      (let ((lease (inizia-tratto-worker context)))
        (setf (collegamento-worker-serie-writer-lease link) lease
              (collegamento-worker-serie-state link) :closing)
        (incf (collegamento-worker-serie-generation link)))
      (let ((refusal (%acquire-worker-serie link)))
        (values (collegamento-worker-serie-generation link)
                (collegamento-worker-serie-state link) refusal)))))

;;; REQ: REQ-CON-002 REQ-AFF-008
(declaim (ftype (function (collegamento-worker-serie t) index) lease-worker-serie))
(defun lease-worker-serie (link token)
  "Pre: ACTIVE, token for the current slice. Post: Serie lease for controller APIs.
INVALID-ARGUMENT for token; phase rejected before reading Serie, invariants delegated."
  (%passo-worker-serie (link (:worker-serie-state) (:worker-serie-token))
    (%require-worker-serie link '(:active))
    (%check-token-worker-serie link token)
    (collegamento-worker-serie-series-lease link)))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (collegamento-worker-serie t t t t)
                         (values index (member :messages :empty :yield) index &optional)) preleva-worker-serie))
(defun preleva-worker-serie (link token target start end)
  "Pre: ACTIVE/current token, private target. Post: batch under both
leases, results and debt delegated to worker. Busy/span/alias rejected without pop;
slice token distinct from batch token; unexpected errors retained at boundary."
  (%passo-worker-serie (link (:worker-serie-state :worker-state :worker-generation :writer-queue-busy)
                            (:worker-serie-token :writer-target))
    (%require-worker-serie link '(:active))
    (%check-token-worker-serie link token)
    (preleva-lavori-worker (collegamento-worker-serie-context link) target start end)))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-AFF-008
(declaim (ftype (function (collegamento-worker-serie t t) null) conferma-worker-serie))
(defun conferma-worker-serie (link token batch)
  "Pre: ACTIVE/token and batch fully applied by caller. Post: debt
cleared only with current batch token; worker/token conditions checked before mutation.
Does not verify external effects or permit replay of an applied prefix."
  (%passo-worker-serie (link (:worker-serie-state :worker-state) (:worker-serie-token :worker-batch))
    (%require-worker-serie link '(:active))
    (%check-token-worker-serie link token)
    (conferma-lavori-worker (collegamento-worker-serie-context link) batch)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (collegamento-worker-serie t) (member :idle :schedule)) termina-worker-serie))
(defun termina-worker-serie (link token)
  "Pre: ACTIVE without batch, or CLOSING to retry; current token.
Post: Serie released BEFORE endwriter, local IDLE and schedule obligation with worker.
Debt rejected before release; busy end preserves CLOSING and writer lease.
Failed release preserves Serie token; retry does not repeat a successful release."
  (%passo-worker-serie (link (:worker-serie-state :worker-state :writer-queue-busy) (:worker-serie-token))
    (%require-worker-serie link '(:active :closing))
    (%check-token-worker-serie link token)
    (let ((context (collegamento-worker-serie-context link)))
      (unless (member (stato-worker-writer context) '(:running :finishing))
        (error 'resource-exhausted :reason :worker-state))
      (setf (collegamento-worker-serie-state link) :closing)
      (when (plusp (collegamento-worker-serie-series-lease link))
        (%passo-worker-serie (link () ())
          (rilascia-controllore-serie (collegamento-worker-serie-controller link)
                                     (collegamento-worker-serie-series-lease link)))
        (setf (collegamento-worker-serie-series-lease link) 0))
      (let ((action (termina-tratto-worker context)))
        (setf (collegamento-worker-serie-writer-lease link) 0
              (collegamento-worker-serie-state link) :idle)
        (%check-worker-serie link)
        action))))
