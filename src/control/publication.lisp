;;; OWNER: recovery esclusivo della Serie; CAS locale reclama una sola pubblicazione per risultato.
;;; SHARED: nessuna pubblicazione di indici/CSN o lock tra Serie; I/O solo nel pool dedicato.
(in-package #:arcdocdb.control)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-008
(declaim (ftype (function (control-preparato) null) verifica-dipendenze-pubblicazione))
(defun verifica-dipendenze-pubblicazione (prepared)
  "Pre: exclusively owned capabilities and complete result. Post: same stable durable checkpoint.
Proof of FDs, canonical directory, log health, and new ACTIVE still header-only.
IO-FAULT/INVALID-ARGUMENT before rename; no syscall or manifest reconstruction."
  (let* ((log (control-preparato-log prepared)) (file (arcdocdb.wal::log-io-file log))
         (association (control-preparato-association prepared)))
    (verifica-associazione-file association (arcdocdb.io::associazione-file-input association) file)
    (arcdocdb.io::esigi-aperto (control-preparato-directory prepared) :directory)
    (unless (eq (stato-log log) :open) (error 'invalid-argument :reason :control-publication-log))
    (unless (= (posizione-scritta file) (posizione-durevole file) (control-preparato-end prepared))
      (error 'invalid-argument :reason :control-publication-advanced))
    (verifica-active-checkpoint (control-preparato-active prepared)))
  nil)

;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-008
(declaim (ftype (function (control-preparato file-io) null) verifica-pubblicazione-control))
(defun verifica-pubblicazione-control (prepared previous)
  "Pre: old readonly control log already validated and authoritative; namespace frozen by recovery.
Post: token available, dependencies, backend, and callbacks admitted without I/O or mutation.
INVALID-ARGUMENT/IO-FAULT/UNSUPPORTED-FORMAT: no publication attempted."
  (unless (and (eq (control-preparato-publication-state prepared) :prepared)
               (null (control-preparato-publication-owner prepared)))
    (error 'invalid-argument :reason :control-publication-state))
  (verifica-dipendenze-pubblicazione prepared)
  (verifica-capacita-sostituzione (control-preparato-directory prepared)
                                 (arcdocdb.io::associazione-file-input (control-preparato-association prepared))
                                 previous "control.log.tmp" "control.log")
  nil)

;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-004
(declaim (ftype (function (control-preparato file-io) control-pubblicato) pubblica-control-recuperato))
(defun pubblica-control-recuperato (prepared previous)
  "Pre: I/O pool, exclusive recovery, validated old log, and names owned until the call ends.
Post: checkpoint installed through verified renameat and directory fsync; complete result.
Atomicity point: rename to control.log; no confirmation before subsequent parent fsync.
Errors after acquisition make the token FAULTED; no retry, deletion, close, or rollback.
UNWIND-PROTECT releases the token on every nonlocal exit, without masking the condition."
  (verifica-pubblicazione-control prepared previous)
  (let ((result (%make-control-pubblicato prepared)) (complete nil))
    (unwind-protect
         (progn
           (unless (null (sb-ext:compare-and-swap (control-preparato-publication-owner prepared) nil result))
             (error 'invalid-argument :reason :control-publication-state))
           (setf (control-preparato-publication-state prepared) :publishing)
           (sostituisci-temporaneo (control-preparato-directory prepared)
                                  (arcdocdb.io::associazione-file-input (control-preparato-association prepared))
                                  previous "control.log.tmp" "control.log")
           (setf (control-preparato-rename-observed prepared) t)
           (unless (zerop (durable-flush (control-preparato-directory prepared)))
             (error 'invariant-violation :reason :control-publication-directory))
           (verifica-dipendenze-pubblicazione prepared)
           (arcdocdb.io::esigi-aperto previous :input)
           (setf (control-preparato-publication-state prepared) :published complete t)
           result)
      (when (and (eq (control-preparato-publication-owner prepared) result) (not complete))
        (setf (control-preparato-publication-state prepared) :faulted)))))
