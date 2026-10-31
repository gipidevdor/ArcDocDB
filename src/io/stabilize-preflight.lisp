;;; OWNER: compito I/O mantiene namespace esclusivo e capacità readonly fino al completamento.
;;; SHARED: osservazioni locali; nessun nuovo FD, registro o lock fra Serie.
(in-package #:arcdocdb.io)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-004
(declaim (ftype (function (file-io simple-base-string)
                         (values boolean identity-component identity-component &optional))
                identita-entry-presente))
(defun identita-entry-presente (directory name)
  "Pre: verified callback and private name, exclusive namespace. Post: presence and exact identity.
Only ENOENT from operation ENTRY-IDENTITY becomes NIL/0/0; every other condition propagates.
One nofollow observation; symlinks, incorrect types, and faults do not become absence."
  (handler-case
      (multiple-value-bind (device inode) (leggi-identita-entry directory name)
        (values t device inode))
    (io-fault (condition)
      (unless (and (eq (arcdocdb.conditions:error-operation condition) :entry-identity)
                   (eql (arcdocdb.conditions:error-errno condition) sb-posix:enoent))
        (error condition))
      (values nil 0 0))))

;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-008
(declaim (ftype (function (file-io file-io string string) null) verifica-capacita-stabilizzazione))
(defun verifica-capacita-stabilizzazione (directory file temporary final)
  "Pre: controller capabilities and stable names. Post: open input/parent, identities and .tmp pair admitted.
INVALID-ARGUMENT or UNSUPPORTED-FORMAT before observations/effects; no native fallback."
  (esigi-aperto directory :directory) (esigi-aperto file :input)
  (esigi-nome-foglia temporary) (esigi-nome-foglia final)
  (unless (and (= (length temporary) (+ 4 (length final)))
               (string= temporary final :end1 (length final))
               (string= temporary ".tmp" :start1 (length final)))
    (error 'invalid-argument :reason :io-stabilization-names))
  (unless (eq (file-backend directory) (file-backend file))
    (error 'invalid-argument :reason :io-identity-backend))
  (let ((backend (file-backend directory)))
    (when (and backend (or (null (backend-identity backend))
                          (null (backend-entry-identity backend))))
      (error 'unsupported-format :reason :io-stabilization-unavailable)))
  nil)

;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-008
(declaim (ftype (function (file-io file-io simple-base-string simple-base-string) boolean)
                verifica-nomi-stabilizzazione))
(defun verifica-nomi-stabilizzazione (directory file temporary final)
  "Pre: verified capabilities and private names, exclusive namespace. Post: T rename, NIL already final.
Exactly one name must exist, bound to the same regular FD; both rejected even if aliases.
INVALID-ARGUMENT before the effect for collision/absence/identity; original faults propagate."
  (multiple-value-bind (has-temporary temporary-device temporary-inode)
      (identita-entry-presente directory temporary)
    (multiple-value-bind (has-final final-device final-inode) (identita-entry-presente directory final)
      (when (eq has-temporary has-final)
        (error 'invalid-argument :reason :io-stabilization-presence))
      (multiple-value-bind (device inode) (leggi-identita-file file)
        (unless (and (= device (if has-temporary temporary-device final-device))
                     (= inode (if has-temporary temporary-inode final-inode)))
          (error 'invalid-argument :reason :io-stabilization-identity)))
      (esigi-aperto directory :directory) (esigi-aperto file :input)
      has-temporary)))

;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (file-io file-io string string)
                         (values simple-base-string simple-base-string boolean &optional))
                prepara-stabilizzazione-temporaneo))
(defun prepara-stabilizzazione-temporaneo (directory file temporary final)
  "Pre: controller's stable capabilities and names. Post: private leaves and branch verified without effects.
Nofollow identity of both names and FD; exclusivity required only for the temporary file.
Original conditions before rename/flush; no reservation or guarantee against external mutators."
  (verifica-capacita-stabilizzazione directory file temporary final)
  (let* ((source (map 'simple-base-string #'identity temporary))
         (target (map 'simple-base-string #'identity final))
         (rename (verifica-nomi-stabilizzazione directory file source target)))
    (when rename (verifica-capacita-pubblicazione directory file source target))
    (values source target rename)))

;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (file-io file-io string string) boolean) verifica-stabilizzazione-temporaneo))
(defun verifica-stabilizzazione-temporaneo (directory file temporary final)
  "Pre: exclusive/stable namespace and verified read-only FILE, same authority as completion.
Post: T temporary or NIL final, names/FD/callbacks verified; no rename, fsync, or close.
Original conditions without mutations; the boolean is not a lease and does not authorize traffic."
  (multiple-value-bind (source target rename) (prepara-stabilizzazione-temporaneo directory file temporary final)
    (declare (ignore source target)) ; foglie private verificate, non esiti d'errore.
    rename))
