(in-package #:arcdocdb.fulltext.document)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-SEC-003 REQ-SEC-006 REQ-SEC-010
(declaim (ftype (function (preparazione-full-text keyword) null) rilascia-documento))
(defun rilascia-documento (task state)
  "Pre: exclusive task boundary; error/cancellation. Post: loans released,
run and results invalidated; no external resource, writer reservation, or I/O to cancel."
  (unless (member state '(:failed :cancelled)) (error 'invariant-violation :reason :fulltext-document-release))
  (let ((analysis (preparazione-full-text-analysis task)) (run (preparazione-full-text-run task)))
    (setf (preparazione-full-text-input task) nil (preparazione-full-text-phase task) state
          (a::spazio-full-text-input analysis) nil (a::spazio-full-text-phase analysis) :failed
          (r::indice-posizionale-source run) nil (r::indice-posizionale-state run) :failed))
  nil)

;;; REQ: REQ-SEC-003 REQ-SEC-007 REQ-SEC-010
(declaim (ftype (function (preparazione-full-text) null) avanza-documento))
(defun avanza-documento (task)
  "Pre: active task. Post: one scanner, normalization, copy, sort, or measurement step.
No wait loop; the caller manages scheduling and the external deadline."
  (case (preparazione-full-text-phase task)
    (:scan (passo-scansione-documento task))
    (:field (prossimo-campo-documento task))
    (:analysis (analizza-passo-documento task))
    ((:copy :sort) (run-passo-documento task))
    (:seal
     (lavoro-documento task)
     (let ((run (preparazione-full-text-run task)))
       (r:sigilla-indice-posizionale run :max-work (+ (r::indice-posizionale-work run) (residuo-documento task))))
     (setf (preparazione-full-text-phase task) :sort))
    (:measure (misura-passo-documento task))
    (otherwise (error 'invariant-violation :reason :fulltext-document-phase)))
  nil)

;;; REQ: REQ-SEC-003 REQ-SEC-007 REQ-SEC-010
(declaim (ftype (function (t t) keyword) passo-preparazione-full-text))
(defun passo-preparazione-full-text (task quantum)
  "Pre: exclusive active task, quantum 1..65536. Post: RUNNING or DONE, no public partial result.
Domain errors invalidate the task and propagate; invariants at the worker boundary
require fail-stop, not a commit retry. No callback or I/O."
  (unless (and (typep task 'preparazione-full-text) (typep quantum '(integer 1 65536)))
    (error 'invalid-argument :reason :fulltext-document-step))
  (when (eq :done (preparazione-full-text-phase task)) (return-from passo-preparazione-full-text :done))
  (when (member (preparazione-full-text-phase task) '(:idle :failed :cancelled))
    (error 'invalid-argument :reason :fulltext-document-state))
  (handler-case
      (dotimes (i quantum)
        (when (eq :done (preparazione-full-text-phase task)) (return))
        (avanza-documento task))
    (arcdocdb-error (condition) (rilascia-documento task :failed) (error condition)))
  (if (eq :done (preparazione-full-text-phase task)) :done :running))

;;; REQ: REQ-SEC-006 REQ-SEC-010
(declaim (ftype (function (t) keyword) annulla-preparazione-full-text stato-preparazione-full-text))
(defun annulla-preparazione-full-text (task)
  "Pre: exclusive task, active or already canceled. Post: CANCELLED, loans released.
Idempotent; INVALID-ARGUMENT for type/DONE/IDLE/FAILED state."
  (unless (and (typep task 'preparazione-full-text)
               (not (member (preparazione-full-text-phase task) '(:idle :done :failed))))
    (error 'invalid-argument :reason :fulltext-document-cancel))
  (rilascia-documento task :cancelled) :cancelled)
(defun stato-preparazione-full-text (task)
  "Pre: valid task, read by its owner. Post: public state without partial data."
  (unless (typep task 'preparazione-full-text) (error 'invalid-argument :reason :fulltext-document-input))
  (case (preparazione-full-text-phase task)
    ((:idle :done :failed :cancelled) (preparazione-full-text-phase task))
    ((:scan :field :analysis :copy :seal :sort :measure) :running)
    (otherwise (error 'invariant-violation :reason :fulltext-document-phase))))

;;; REQ: REQ-SEC-003 REQ-SEC-010
(declaim (ftype (function (t) (values r:indice-posizionale index index index index &optional))
                risultati-preparazione-full-text))
(defun risultati-preparazione-full-text (task)
  "Pre: DONE, exclusive loan until the next start. Post: SEALED run, U(documento),
single-file bound, used staging payload, input text bytes over present fields.
Not a writer reservation, hint map, commit, or proof of coverage/MVCC/READY."
  (unless (and (typep task 'preparazione-full-text) (eq :done (preparazione-full-text-phase task)))
    (error 'invalid-argument :reason :fulltext-document-incomplete))
  (values (preparazione-full-text-run task) (preparazione-full-text-bound task)
          (+ (limite-fisso-indice-full-text (preparazione-full-text-config task)) (preparazione-full-text-bound task))
          (preparazione-full-text-prepared-bytes task) (preparazione-full-text-input-bytes task)))
