;;; OWNER: directory capabilities and stable namespace belong to this I/O caller.
;;; SHARED: no regular-file identity callback or implicit native fallback.
(in-package #:arcdocdb.io)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-014 REQ-AFF-001 REQ-AFF-004
(declaim (ftype (function (file-io &optional (or null simple-base-string))
                         (values identity-component identity-component &optional)) directory-identity))
(defun directory-identity (directory &optional leaf)
  "Pre: open stable directory, optional private ASCII leaf. Post: checked directory device/inode.
Missing injected callback is UNSUPPORTED; no effects or fallback. Syscall errno retained."
  (esigi-aperto directory :directory)
  (let* ((backend (file-backend directory))
         (callback (when backend (if leaf (backend-directory-entry-identity backend)
                                     (backend-directory-identity backend)))))
    (when (and backend (null callback))
      (error 'unsupported-format :reason :io-directory-identity-unavailable))
    (handler-case
        (multiple-value-bind (device inode)
            (if backend (if leaf (funcall callback (file-fd directory) leaf)
                            (funcall callback (file-fd directory)))
                (if leaf (native-directory-entry-identity (file-fd directory) leaf)
                    (native-directory-identity (file-fd directory))))
          (unless (and (typep device 'identity-component) (typep inode 'identity-component))
            (error 'invariant-violation :reason :io-directory-identity-result))
          (esigi-aperto directory :directory)
          (values device inode))
      (sb-posix:syscall-error (cause)
        (error 'io-fault :reason :io-syscall :operation :directory-identity
               :errno (sb-posix:syscall-errno cause))))))

;;; REQ: REQ-AFF-014 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (file-io file-io) null) verifica-directory-distinte))
(defun verifica-directory-distinte (left right)
  "Pre: owned open directory capabilities with equal backend. Post: distinct physical identities.
INVALID-ARGUMENT for backend/alias, typed identity errors before any mutation."
  (unless (eq (file-backend left) (file-backend right))
    (error 'invalid-argument :reason :io-identity-backend))
  (multiple-value-bind (ld li) (directory-identity left)
    (multiple-value-bind (rd ri) (directory-identity right)
      (when (and (= ld rd) (= li ri)) (error 'invalid-argument :reason :io-directory-alias))))
  nil)

;;; REQ: REQ-AFF-014 REQ-AFF-004
(declaim (ftype (function (file-io file-io simple-base-string) null) verifica-legame-directory))
(defun verifica-legame-directory (parent child leaf)
  "Pre: owned stable directory capabilities and leaf. Post: entry and FD identify the same directory.
INVALID-ARGUMENT on replacement; identity errors propagate without effects."
  (multiple-value-bind (device inode) (directory-identity child)
    (multiple-value-bind (ed ei) (directory-identity parent leaf)
      (unless (and (= device ed) (= inode ei))
        (error 'invalid-argument :reason :io-directory-binding))))
  nil)
