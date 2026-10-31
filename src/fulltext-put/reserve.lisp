(in-package #:arcdocdb.fulltext.put)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-SEC-003 REQ-SEC-006 REQ-CON-002
(declaim (ftype (function (t t t t) null) verifica-riserva-put))
(defun verifica-riserva-put (pool lease request generation)
  "Pre: request token and writer lease. Post: same private reservation, copying/ready.
Type/state/provenance rejections before any effect or batch access."
  (verifica-token-put request generation) (f::verifica-writer-riserve pool lease)
  (unless (and (eq pool (preparazione-put-full-text-pool request))
               (member (preparazione-put-full-text-state request) '(:reserving :reserved)))
    (error 'invalid-argument :reason :fulltext-put-reservation))
  (f::verifica-token-riserva pool (preparazione-put-full-text-slot request) (preparazione-put-full-text-slot-generation request))
  nil)

;;; REQ: REQ-SEC-003 REQ-SEC-006 REQ-SEC-010 REQ-CON-002
(declaim (ftype (function (t t t t) keyword) prenota-put-full-text))
(defun prenota-put-full-text (pool lease request generation)
  "Pre: PREPARED delivered from worker to writer through synchronized handoff.
Post: reservation of all tasks on the same frame, handles privately retained until append.
Pool rejections before effects; incomplete adoption exit => request/pool FAULTED."
  (verifica-token-put request generation) (f::verifica-writer-riserve pool lease)
  (unless (eq :prepared (preparazione-put-full-text-state request))
    (error 'invalid-argument :reason :fulltext-put-not-prepared))
  (esigi-cornice-put-validata request)
  (let ((complete nil) (before (f::riserve-full-text-generation pool)))
    (unwind-protect
         (multiple-value-bind (slot token) (f:prenota-full-text pool lease (preparazione-put-full-text-tasks request))
           (setf (preparazione-put-full-text-pool request) pool (preparazione-put-full-text-slot request) slot
                 (preparazione-put-full-text-slot-generation request) token (preparazione-put-full-text-state request) :reserving
                 complete t)
           :reserving)
      (unless (or complete (and (= before (f::riserve-full-text-generation pool))
                                (eq :healthy (f::riserve-full-text-state pool))))
        (setf (preparazione-put-full-text-state request) :faulted (f::riserve-full-text-state pool) :faulted)))))

;;; REQ: REQ-SEC-003 REQ-SEC-006 REQ-SEC-010 REQ-CON-002
(declaim (ftype (function (t t t t t) keyword) passo-riserva-put-full-text))
(defun passo-riserva-put-full-text (pool lease request generation quantum)
  "Pre: valid private reservation and quantum 1..65536. Post: RESERVING or RESERVED after all copies.
Each source returned to context, which cannot restart before append/cancellation."
  (verifica-riserva-put pool lease request generation)
  (unless (typep quantum '(integer 1 65536)) (error 'invalid-argument :reason :fulltext-put-quantum))
  (let ((complete nil))
    (unwind-protect
         (progn
           (when (eq :ready (f:passo-riserva-full-text pool lease (preparazione-put-full-text-slot request)
                                                     (preparazione-put-full-text-slot-generation request) quantum))
             (setf (preparazione-put-full-text-state request) :reserved))
           (setf complete t) (preparazione-put-full-text-state request))
      (unless complete (setf (preparazione-put-full-text-state request) :faulted (f::riserve-full-text-state pool) :faulted)))))

;;; REQ: REQ-SEC-006 REQ-SEC-010 REQ-CON-002
(declaim (ftype (function (t t t t) keyword) annulla-riserva-put-full-text))
(defun annulla-riserva-put-full-text (pool lease request generation)
  "Pre: before append, request's private reservation. Post: costs returned and CANCELLED.
Does not retire an enqueued/prepared PUT or convert a decided commit to abort."
  (verifica-riserva-put pool lease request generation)
  (let ((complete nil))
    (unwind-protect
         (progn
           (f:annulla-riserva-full-text pool lease (preparazione-put-full-text-slot request)
                                      (preparazione-put-full-text-slot-generation request))
           (setf (preparazione-put-full-text-state request) :cancelled complete t) :cancelled)
      (unless complete (setf (preparazione-put-full-text-state request) :faulted (f::riserve-full-text-state pool) :faulted)))))
