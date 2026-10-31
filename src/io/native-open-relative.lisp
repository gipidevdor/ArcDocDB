;;; OWNER: il compito I/O trasferisce il nuovo FD al wrapper prima di ogni altra osservazione.
;;; SHARED: sole primitive POSIX; parent borrowed, nessun namespace o metadato globale.
(in-package #:arcdocdb.io)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-001 REQ-AFF-004 REQ-STO-003 REQ-REC-001
(declaim (ftype (function (fd simple-base-string (eql :input)) fd) native-open-relative))
(defun native-open-relative (directory name mode)
  "Pre: owned parent and private ASCII leaf; readonly opening only in the I/O pool.
Post: CLOEXEC/NOFOLLOW/NONBLOCK FD from openat; caller immediately assumes ownership.
UNSUPPORTED-FORMAT for ABI/platform, INVARIANT-VIOLATION for mode other than :input.
No fstat or cleanup here; SYSCALL-ERROR captures errno immediately, no retry or creation."
  (unless (= sb-vm:n-word-bits 64) (error 'unsupported-format :reason :io-abi))
  (unless (eq mode :input) (error 'invariant-violation :reason :io-open-relative-mode))
  #-(or darwin linux) (error 'unsupported-format :reason :io-platform)
  #+(or darwin linux)
  (let ((descriptor (%directory-openat directory name
                                       (logior +open-cloexec+ sb-posix:o-rdonly
                                               sb-posix:o-nonblock sb-posix:o-nofollow))))
    (when (minusp descriptor)
      (error 'sb-posix:syscall-error :errno (sb-alien:get-errno) :name 'openat))
    descriptor))

;;; REQ: REQ-AFF-001 REQ-AFF-004 REQ-FOR-001 REQ-AFF-008
(declaim (ftype (function (fd) (values identity-component identity-component integer &optional))
                native-file-metadata))
(defun native-file-metadata (descriptor)
  "Pre: input or append FD already owned by the wrapper, without concurrent close.
Post: regular-file identity and size from one fstat, without narrowing integers.
IO-FAULT for a different type, original SYSCALL-ERROR; no close, read, or mutation."
  (let ((stat (sb-posix:fstat descriptor)))
    (unless (sb-posix:s-isreg (sb-posix:stat-mode stat))
      (error 'io-fault :reason :io-file-kind :operation :file-metadata))
    (values (sb-posix:stat-dev stat) (sb-posix:stat-ino stat) (sb-posix:stat-size stat))))
