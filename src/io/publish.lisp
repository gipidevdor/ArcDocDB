;;;; Completamento di un temporaneo deciso, senza sovrascrivere un nome esistente.
;;; OWNER: compito I/O del controller; parent, sorgente, nomi e namespace esclusivi/stabili.
;;; SHARED: nessun lock o stato fra Serie; capacita' prestate, nessun trasferimento di ownership.
(in-package #:arcdocdb.io)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (file-io file-io string string) null) verifica-capacita-pubblicazione))
(defun verifica-capacita-pubblicazione (directory source source-name target-name)
  "Pre: controller's stable capabilities and names. Post: preflight without file I/O or mutations.
INVALID-ARGUMENT for mode, names, or backend; IO-FAULT for a capability not open.
UNSUPPORTED-FORMAT for missing callback/ABI/platform/symbol, no fallback."
  (esigi-aperto directory :directory) (esigi-aperto source :input)
  (esigi-nome-foglia source-name) (esigi-nome-foglia target-name)
  (verifica-nomi-temporaneo source-name target-name)
  (unless (eq (file-backend directory) (file-backend source))
    (error 'invalid-argument :reason :io-identity-backend))
  (let ((backend (file-backend directory)))
    (if backend
        (when (or (null (backend-identity backend)) (null (backend-entry-identity backend))
                  (null (backend-rename-exclusive backend)))
          (error 'unsupported-format :reason :io-publish-unavailable))
        (esigi-rinomina-esclusiva-nativa)))
  nil)

;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (file-io file-io string string) null) pubblica-temporaneo))
(defun pubblica-temporaneo (directory source source-name target-name)
  "Pre: durable authoritative decision and content verified by the caller; exclusive namespace.
SOURCE readonly and open, source-name = target-name + .tmp; no concurrent close or replacement.
Post: target previously absent, now bound to the same regular-file FD; capabilities still open.
Atomic point: exclusive rename, completion of the decision; parent fsync remains the caller's responsibility.
No retry, segment writing/truncation, close, unlink, or implicit flush.
Rejections before the effect do not mutate state; every incomplete exit from the effect faults the parent.
A lost return is reconciled through a new inventory, not by repeating this call."
  (verifica-capacita-pubblicazione directory source source-name target-name)
  (let ((source-leaf (map 'simple-base-string #'identity source-name))
        (target-leaf (map 'simple-base-string #'identity target-name)))
    (verifica-legame-nome-file directory source source-leaf)
    (rinomina-con-nomi-privati
     directory source-leaf target-leaf
     (lambda ()
       (verifica-legame-nome-file directory source target-leaf)
       (esigi-aperto source :input))
     t))
  nil)
