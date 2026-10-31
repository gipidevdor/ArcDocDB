;;; OWNER: compito I/O esclusivo; nessun descrittore o indirizzo nativo viene esportato.
;;; SHARED: ABI della piattaforma, nessuna scrittura fra Serie o fallback su rename ordinaria.
(in-package #:arcdocdb.io)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-004
#+(or darwin linux)
(sb-alien:define-alien-routine (#+darwin "renameatx_np" #+linux "renameat2" %rename-exclusive) sb-alien:int
  (source-directory sb-alien:int) (source sb-alien:c-string)
  (target-directory sb-alien:int) (target sb-alien:c-string) (flags sb-alien:unsigned-int))

;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-008
;; Linux include/uapi/linux/fs.h RENAME_NOREPLACE; Darwin bsd/sys/stdio.h RENAME_EXCL.
#+linux (defconstant +rename-exclusive-flag+ 1)
#+darwin (defconstant +rename-exclusive-flag+ 4)

;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-008
(declaim (ftype (function () null) esigi-rinomina-esclusiva-nativa))
(defun esigi-rinomina-esclusiva-nativa ()
  "Pre: no effect requested. Post: exclusive-rename ABI/platform/symbol available.
UNSUPPORTED-FORMAT before file I/O; symbol presence does not prove volume support."
  (unless (= sb-vm:n-word-bits 64) (error 'unsupported-format :reason :io-abi))
  #-(or darwin linux) (error 'unsupported-format :reason :io-platform)
  #+(or darwin linux)
  (unless (sb-sys:find-foreign-symbol-address #+darwin "renameatx_np" #+linux "renameat2")
    (error 'unsupported-format :reason :io-publish-unavailable))
  nil)

;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-004
(declaim (ftype (function (fd simple-base-string simple-base-string) integer) native-rename-exclusive))
(defun native-rename-exclusive (directory source target)
  "Pre: ABI/symbol already admitted, private leaves, owned exclusive namespace.
Post: one exclusive relative rename, no target replaced and no flush.
Atomic point: successful syscall; completes a preexisting authoritative decision.
SYSCALL-ERROR with immediate errno; no retry/fallback even for EINVAL/ENOSYS/EEXIST."
  #-(or darwin linux) (error 'unsupported-format :reason :io-platform)
  #+(or darwin linux)
  (let ((result (%rename-exclusive directory source directory target +rename-exclusive-flag+)))
    (when (= result -1)
      (error 'sb-posix:syscall-error :errno (sb-alien:get-errno)
             :name #+darwin 'renameatx_np #+linux 'renameat2))
    result))
