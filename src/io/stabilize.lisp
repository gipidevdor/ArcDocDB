;;; OWNER: pool I/O, namespace esclusivo attraverso rinomina e fsync del parent.
;;; SHARED: solo stato della capacità directory; nessun contatore o attesa fra Serie.
(in-package #:arcdocdb.io)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (file-io file-io string string) boolean) stabilizza-nome-temporaneo))
(defun stabilizza-nome-temporaneo (directory file temporary final)
  "Pre: I/O task, exclusive namespace; readonly FILE already verified and named by the authoritative source.
Post: only FINAL binds the same FD, parent synchronized; T if renamed, NIL if already final.
Atomic decision already in authoritative EDIT; exclusive rename completes the name, fsync completes durability.
Does not verify manifest/CRC or data durability. Does not replace existing targets or close/truncate files.
Preflight rejections without effects; incomplete exit after preflight => directory FAULTED, cause intact.
No retry/rollback: reacquire capabilities and namespace from the authoritative source after an uncertain outcome."
  (multiple-value-bind (source target rename) (prepara-stabilizzazione-temporaneo directory file temporary final)
    (let ((complete nil))
      (unwind-protect
           (progn
             (when rename (pubblica-temporaneo directory file source target))
             ;; Verifica comune anche al ramo idempotente; non usa EOF come prova di identità.
             (when (verifica-nomi-stabilizzazione directory file source target)
               (error 'invariant-violation :reason :io-stabilization-post-name))
             (durable-flush directory)
             (esigi-aperto file :input)
             (setf complete t)
             rename)
        ;; Solo invalidazione locale: nessuna syscall/attesa nella regione protetta.
        (sb-sys:without-interrupts
          (when (and (not complete) (eq (file-state directory) :open))
            (setf (file-state directory) :faulted)))))))
