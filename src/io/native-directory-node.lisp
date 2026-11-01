;;; OWNER: synchronous I/O caller; directory FD transferred before metadata checks.
;;; SHARED: existing relative exclusive-rename ABI, no fallback or global state.
(in-package #:arcdocdb.io)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-014 REQ-AFF-001 REQ-AFF-004
#+(or darwin linux)
(sb-alien:define-alien-routine ("mkdirat" %mkdirat) sb-alien:int
  (directory sb-alien:int) (name sb-alien:c-string) (mode sb-alien:unsigned-int))

;;; REQ: REQ-AFF-014 REQ-AFF-001 REQ-AFF-004
(declaim (ftype (function (fd simple-base-string boolean) fd) native-directory-node))
(defun native-directory-node (parent name create-p)
  "Pre: stable owned parent/leaf, supported 64-bit ABI. Post: owned nofollow directory FD.
CREATE-P mkdirat is exclusive, requested 0700; open never creates. No retry/removal/flush.
SYSCALL-ERROR captures errno immediately; failure after mkdir leaves the private stage intact."
  (unless (= sb-vm:n-word-bits 64) (error 'unsupported-format :reason :io-abi))
  #-(or darwin linux) (error 'unsupported-format :reason :io-platform)
  #+(or darwin linux)
  (progn
    (when create-p
      (unless (zerop (%mkdirat parent name #o700))
        (error 'sb-posix:syscall-error :errno (sb-alien:get-errno) :name 'mkdirat)))
    (let ((fd (%directory-openat parent name
                (logior +open-cloexec+ sb-posix:o-rdonly sb-posix:o-directory sb-posix:o-nofollow))))
      (when (minusp fd) (error 'sb-posix:syscall-error :errno (sb-alien:get-errno) :name 'openat))
      fd)))

;;; REQ: REQ-AFF-014 REQ-AFF-001 REQ-AFF-004
(declaim (ftype (function (fd) (values identity-component identity-component &optional))
                native-directory-identity))
(defun native-directory-identity (fd)
  "Pre: owned FD. Post: exact directory identity from one fstat; never a regular-file identity.
IO-FAULT for kind mismatch; syscall errors propagate, no effects."
  (let ((stat (sb-posix:fstat fd)))
    (unless (sb-posix:s-isdir (sb-posix:stat-mode stat))
      (error 'io-fault :reason :io-directory-kind :operation :directory-identity))
    (values (sb-posix:stat-dev stat) (sb-posix:stat-ino stat))))

;;; REQ: REQ-AFF-014 REQ-AFF-001 REQ-AFF-004
(declaim (ftype (function (fd simple-base-string) (values identity-component identity-component &optional))
                native-directory-entry-identity))
(defun native-directory-entry-identity (parent name)
  "Pre: stable parent/leaf. Post: exact nofollow directory entry identity from one fstatat.
Symlink/non-directory rejected as IO-FAULT; errno immediate, no mutation or retry."
  #-(or darwin linux) (error 'unsupported-format :reason :io-platform)
  #+(or darwin linux)
  (sb-posix::with-alien-stat stat ()
    (unless (zerop (%fstatat parent name stat +at-symlink-nofollow+))
      (error 'sb-posix:syscall-error :errno (sb-alien:get-errno) :name 'fstatat))
    (let ((value (sb-posix::alien-to-stat stat nil)))
      (unless (sb-posix:s-isdir (sb-posix:stat-mode value))
        (error 'io-fault :reason :io-directory-entry-kind :operation :directory-identity))
      (values (sb-posix:stat-dev value) (sb-posix:stat-ino value)))))
