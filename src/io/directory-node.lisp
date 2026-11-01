;;; OWNER: bounded exclusive stage creation/open; caller retains capabilities until quiescence.
;;; SHARED: existing I/O ownership/cleanup semantics, no global namespace lock.
(in-package #:arcdocdb.io)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-014 REQ-AFF-008 REQ-AFF-004
(declaim (ftype (function (file-io boolean) null) directory-node-callbacks))
(defun directory-node-callbacks (parent create-p)
  "Pre: open directory. Post: complete injected directory callbacks and publication capability admitted.
UNSUPPORTED-FORMAT before mkdir on absence; native exclusive-rename ABI checked without effects."
  (let ((backend (file-backend parent)))
    (when (and backend (or (null (backend-directory-node backend))
                          (null (backend-directory-identity backend))
                          (null (backend-directory-entry-identity backend))))
      (error 'unsupported-format :reason :io-directory-node-unavailable)))
  (when create-p
    (let ((backend (file-backend parent)))
      (if backend
          (unless (backend-rename-exclusive backend)
            (error 'unsupported-format :reason :io-directory-publish-unavailable))
          (esigi-rinomina-esclusiva-nativa))))
  nil)

;;; REQ: REQ-AFF-014 REQ-AFF-004
(declaim (ftype (function (file-io file-io simple-base-string boolean) null) acquire-directory-node))
(defun acquire-directory-node (parent child leaf create-p)
  "Pre: callbacks/leaf admitted, child preallocated. Post: exactly one owned FD adopted before metadata.
Invalid/parent-alias results never adopted or closed; syscall errno normalized, no retry or fallback."
  (esigi-aperto parent :directory)
  (handler-case
      (sb-sys:without-interrupts
        (let* ((backend (file-backend parent))
               (fd (if backend (funcall (backend-directory-node backend) (file-fd parent) leaf create-p)
                       (native-directory-node (file-fd parent) leaf create-p))))
          (unless (and (typep fd 'fd) (/= fd (file-fd parent)))
            (error 'invariant-violation :reason :io-directory-node-result))
          (setf (file-fd child) fd)))
    (sb-posix:syscall-error (cause)
      (error 'io-fault :reason :io-syscall :operation :directory-node :errno (sb-posix:syscall-errno cause))))
  (esigi-aperto child :directory)
  nil)

;;; REQ: REQ-AFF-014 REQ-AFF-001 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (file-io string boolean) file-io) directory-node))
(defun directory-node (parent name create-p)
  "Pre: stable exclusive parent, no asynchronous cancellation during acquisition. Post: owned directory FD.
Creation admits only a new .tmp leaf; never overwrites, flushes or removes. Existing stages reject.
All callbacks admitted before mkdir. Every unsuccessful acquired FD gets one close attempt;
typed primary preserved after successful close, cleanup errno retained by the existing I/O boundary."
  (esigi-aperto parent :directory) (esigi-nome-foglia name)
  (when create-p
    (unless (and (> (length name) 4) (string= ".tmp" name :start2 (- (length name) 4)))
      (error 'invalid-argument :reason :io-temporary-name)))
  (directory-node-callbacks parent create-p)
  (let* ((backend (file-backend parent)) (leaf (map 'simple-base-string #'identity name))
         (child (%make-file :directory backend +max-transfer+ +default-file-limit+))
         (complete nil) (primary nil) (cleanup nil) (cleanup-failed nil))
    (unwind-protect
         (handler-case
             (progn
               (acquire-directory-node parent child leaf create-p)
               (verifica-directory-distinte parent child)
               (verifica-legame-directory parent child leaf)
               (esigi-aperto parent :directory) (esigi-aperto child :directory)
               (setf complete t))
           (arcdocdb.conditions:arcdocdb-error (cause) (setf primary cause))
           (sb-posix:syscall-error (cause)
             (setf primary (make-condition 'io-fault :reason :io-syscall :operation :directory-node
                                           :errno (sb-posix:syscall-errno cause)))))
      (unless complete
        (multiple-value-setq (cleanup cleanup-failed) (cleanup-lettura-relativa child))))
    (segnala-apertura-relativa primary cleanup cleanup-failed :directory-node)
    child))

;;; REQ: REQ-AFF-014 REQ-AFF-004
(declaim (ftype (function (file-io string) file-io) apri-directory-nella-directory crea-directory-temporanea))
(defun apri-directory-nella-directory (parent name)
  "Pre: stable parent/leaf. Post: owned nofollow directory, never creates. Typed directory-node errors."
  (directory-node parent name nil))
;;; REQ: REQ-AFF-014 REQ-AFF-001
(defun crea-directory-temporanea (parent name)
  "Pre: stable parent/new .tmp leaf. Post: exclusive owned stage, no flush/publication. Typed node errors."
  (directory-node parent name t))
