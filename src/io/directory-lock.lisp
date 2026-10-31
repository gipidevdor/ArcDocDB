;;; OWNER: il compito I/O possiede la capacita' dalla startup fino a chiudi, senza close concorrente.
;;; SHARED: flock rende esclusivo l'avvio M1 sullo stesso inode; nessun lock tra Serie per operazione.
(in-package #:arcdocdb.io)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-001 REQ-AFF-004 REQ-AFF-008
;; ADR-0017: int flock(int, int), senza struct o argomenti variadici.
;; Verificati in Xcode MacOSX.sdk/usr/include/sys/fcntl.h (incluso da sys/file.h)
;; e Linux include/uapi/asm-generic/fcntl.h: LOCK_EX=2, LOCK_NB=4.
;; https://github.com/torvalds/linux/blob/master/include/uapi/asm-generic/fcntl.h
;; https://man7.org/linux/man-pages/man2/flock.2.html
#+(or darwin linux)
(sb-alien:define-alien-routine ("flock" %directory-flock) sb-alien:int
  (descriptor sb-alien:int) (operation sb-alien:int))

;;; REQ: REQ-AFF-008
#+(or darwin linux) (defconstant +directory-lock-exclusive+ 2)
;;; REQ: REQ-AFF-008
#+(or darwin linux) (defconstant +directory-lock-nonblocking+ 4)

;;; REQ: REQ-AFF-001 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (fd) integer) native-directory-lock))
(defun native-directory-lock (descriptor)
  "Pre: directory FD owned and stable in the I/O pool, 64-bit Darwin/Linux ABI.
Post: one flock(LOCK_EX|LOCK_NB); advisory lock remains on the FD until close.
SYSCALL-ERROR with errno captured immediately; UNSUPPORTED-FORMAT for ABI/platform.
No new FD, name, unlock, flush, wait for release, or retry, even for EINTR."
  (unless (= sb-vm:n-word-bits 64) (error 'unsupported-format :reason :io-abi))
  #-(or darwin linux) (error 'unsupported-format :reason :io-platform)
  #+(or darwin linux)
  (let ((result (%directory-flock descriptor
                                  (logior +directory-lock-exclusive+ +directory-lock-nonblocking+))))
    (when (= result -1)
      (error 'sb-posix:syscall-error :errno (sb-alien:get-errno) :name 'flock))
    result))

;;; REQ: REQ-AFF-001 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (file-io) null) esigi-esclusiva-directory))
(defun esigi-esclusiva-directory (directory)
  "Pre: open directory capability, stable FD owned by the caller in the I/O pool.
Call before observing or modifying M1 storage and retain the capability until close.
Post: advisory exclusive lock acquired on the exact FD; NIL only after integer zero return and postcheck.
INVALID-ARGUMENT for mode, IO-FAULT for state/syscall/invalid return, INVARIANT-VIOLATION for invalid FD.
Absent callback means UNSUPPORTED-FORMAT, without native fallback; errno in operation :directory-lock.
Rejections/faults do not mutate state or frontiers, including busy; the caller decides startup failure.
No lockfile, format, unlink, early unlock, flush, wait for release, or retry."
  (esigi-aperto directory :directory)
  (let* ((backend (file-backend directory))
         (callback (and backend (backend-directory-lock backend))))
    (when (and backend (null callback))
      (error 'unsupported-format :reason :io-directory-lock-unavailable))
    (handler-case
        (let ((result (if backend (funcall callback (file-fd directory))
                          (native-directory-lock (file-fd directory)))))
          (unless (eql result 0)
            (error 'io-fault :reason :io-directory-lock-result :operation :directory-lock)))
      (sb-posix:syscall-error (condition)
        (error 'io-fault :reason :io-syscall :operation :directory-lock
               :errno (sb-posix:syscall-errno condition)))))
  (esigi-aperto directory :directory)
  nil)
