;;; OWNER: writer della Serie, solo candidato privato; completezza di ogni chiave prima del trasferimento.
;;; SHARED: mutazione canonica dell'indice locale, nessun nuovo CAS o stato fra Serie.
(in-package #:arcdocdb.recovery.selection)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-IDX-001 REQ-IDX-003 REQ-IDX-006 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (selettore-versione-recuperata arcdocdb.index.primary:indice-primario
                          arcdocdb.index.primary:contesto-indice contenuto-slot)
                         (member :inserted :present :absent)) materializza-chiave-recuperata))
(defun materializza-chiave-recuperata (selector index context source)
  "Pre: all committed candidates for the key considered; private index of the same Serie, admission closed.
Exclusive writer; SOURCE and CONTEXT preallocated, nonaliasing; no key/record modified during the call.
Post: PUT inserted or identical; TOMBSTONE/NONE only verified absence. No live entry overwritten/removed.
Ambiguity, seed, aliasing, incompatibility, and budgets rejected without index mutations; private scratch may change.
Invariants also fault the selector; source is not commit proof. No I/O, public root, or admission.
Capacity exhausted: maintain the candidate and call again, never lose a previous result."
  (arcdocdb.index.primary::esigi-contesto-libero context)
  (when (eq source (arcdocdb.index.primary::contesto-indice-words context))
    (error 'invalid-argument :reason :recovery-index-source-alias))
  (handler-case
      (multiple-value-bind (kind csn segment offset bytes version flags) (leggi-versione-selezionata selector)
        (declare (ignore version flags)) ; fatti verificati: primary non codifica il formato/flag del record.
        (multiple-value-bind (high low)
            (arcdocdb.index.primary:digest-chiave-indice index (selection-key selector) 0 (selection-length selector))
          (prepara-payload-indice-recuperato selector source kind csn segment offset bytes)
          (arcdocdb.index.primary:ripristina-chiave-indice
           index (selection-key selector) 0 (selection-length selector) high low
           (when (eq kind :put) source) context)))
    (invariant-violation (condition)
      (setf (selection-state selector) :faulted)
      (error condition))))
