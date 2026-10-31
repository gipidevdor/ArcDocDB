;;; OWNER: controllore della Serie; ingressi coerenti per tutta la valutazione.
;;; SHARED: solo configurazione immutabile; nessun I/O, lock o scrittura tra Serie.
(in-package #:arcdocdb.index.mode)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-008 REQ-AFF-008
(declaim (ftype (function (t fixnum keyword) byte-indice) verifica-byte-indice))
(defun verifica-byte-indice (value minimum reason)
  "Pre: MINIMUM is 0 or 1, canonical reason. Post: fixnum within byte domain.
INVALID-ARGUMENT before any effects; no conversion or allocation."
  (unless (and (typep value 'fixnum) (<= minimum value +max-byte-indice+))
    (error 'invalid-argument :reason reason))
  value)

;;; REQ: REQ-IDX-008 REQ-AFF-008
(declaim (ftype (function (politica-indice byte-indice) byte-indice) soglia-rientro-indice))
(defun soglia-rientro-indice (policy budget)
  "Pre: verified budget and canonical policy. Post: floor(budget*percent/100).
Intermediates within fixnum; no multiplication of the entire budget, error, or allocation."
  (multiple-value-bind (whole remainder) (floor budget 100)
    (+ (* whole (politica-indice-rientro policy))
       (floor (* remainder (politica-indice-rientro policy)) 100))))

;;; REQ: REQ-IDX-008 REQ-AFF-008
(declaim (ftype (function (politica-indice modo-indice byte-indice byte-indice)
                         destinazione-indice) destinazione-automatica))
(defun destinazione-automatica (policy current budget resident)
  "Pre: valid sample. Post: resident preferred at startup and retained if it fits.
Returns from paged at low threshold; no publication, error, or mutation."
  (let ((limit (if (eq current :paginato) (soglia-rientro-indice policy budget) budget)))
    (if (<= resident limit) :residente :paginato)))

;;; REQ: REQ-IDX-008 REQ-AFF-008
(declaim (ftype (function (politica-indice t t t t t)
                         (values destinazione-indice azione-indice &optional)) valuta-modo-indice))
(defun valuta-modo-indice (policy current budget resident paged migration)
  "Pre: conservative estimates of next work; no excess already admitted.
Post: destination and action; PREPARA does not change root and requires verified actuator.
MIGRATION covers current source, destination, and staging, excluding deferred work.
INVALID-ARGUMENT for domains/inconsistent estimate; RESOURCE-EXHAUSTED at startup without a mode that fits.
No allocation, waiting, OS measurement, reservation, or mutation on valid paths."
  (unless (member current '(:iniziale :residente :paginato))
    (error 'invalid-argument :reason :index-mode-current))
  (let* ((grant (verifica-byte-indice budget 0 :index-mode-budget))
         (ram (verifica-byte-indice resident 1 :index-mode-resident-peak))
         (disk (verifica-byte-indice paged 1 :index-mode-paged-peak))
         (peak (verifica-byte-indice migration 1 :index-mode-migration-peak)))
    (let* ((target (destinazione-automatica policy current grant ram))
           (required (if (eq target :residente) ram disk)))
      (when (and (not (eq current :iniziale)) (not (eq current target))
                 (< peak required))
        (error 'invalid-argument :reason :index-mode-migration-underestimate))
      (cond
        ((eq current :iniziale)
         (when (> required grant)
           (error 'resource-exhausted :reason :index-mode-start-budget))
         (values target :avvia))
        ((> required grant) (values target :budget-insufficiente))
        ((eq current target) (values target :mantieni))
        ((> peak grant) (values target :budget-insufficiente))
        (t (values target :prepara))))))
