;;; OWNER: bootstrap ASDF/loader standalone, prima di compilare o avviare worker.
;;; SHARED: modifica della sola feature di compilazione durante il bootstrap.
(in-package #:arcdocdb.io.cpu)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-FOR-003 REQ-AFF-004
(declaim (ftype (function (list string) boolean) compilatore-crc32c-qualificato-p))
(defun compilatore-crc32c-qualificato-p (features version)
  "Pre: runtime features and SBCL version. Post: T only for qualified compiler.
Pure function, no CPU probing; unknown/disabled combinations => NIL, no error."
  (and (member :sbcl features) (member :arm64 features) (member :darwin features)
       (member :64-bit features) (member :little-endian features)
       (member version '("2.6.9" "2.6.10") :test #'string=) (not (member :arcdocdb-crc32c-software features)) t))

;;; REQ: REQ-FOR-003 REQ-AFF-004
(declaim (ftype (function () null) configura-compilatore-crc32c))
(defun configura-compilatore-crc32c ()
  "Pre: bootstrap, no worker. Post: private feature consistent with current runtime.
Does not attest to CPU CRC32C; removes obsolete features, no operational error."
  (setf *features* (remove :arcdocdb-crc32c-arm64 *features*))
  (when (compilatore-crc32c-qualificato-p *features* (lisp-implementation-version))
    (pushnew :arcdocdb-crc32c-arm64 *features*))
  nil)

(eval-when (:load-toplevel :execute)
  (configura-compilatore-crc32c))
