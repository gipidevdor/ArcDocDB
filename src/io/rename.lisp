;;; OWNER: compito I/O esclusivo sulla directory e sui nomi riservati dal controller.
;;; SHARED: nessun lock/stato tra Serie; nomi presi in prestito e stabili durante la chiamata.
(in-package #:arcdocdb.io)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-008
(defconstant +max-rename-name-bytes+ 255)

;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-008
(declaim (ftype (function (string) null) verifica-nome-rinomina))
(defun verifica-nome-rinomina (name)
  "Pre: stable string name. Post: ASCII component of 1..255 bytes, without slash/NUL or dot/dotdot.
INVALID-ARGUMENT before I/O; loop bounded to 255 characters. Canonical ASCII storage names."
  (unless (<= 1 (length name) +max-rename-name-bytes+)
    (error 'invalid-argument :reason :io-rename-name))
  (when (member name '("." "..") :test #'string=)
    (error 'invalid-argument :reason :io-rename-name))
  (dotimes (i (length name))
    (let* ((character (char name i)) (code (char-code character)))
      (unless (and (<= 1 code 127) (char/= character #\/))
        (error 'invalid-argument :reason :io-rename-name))))
  nil)

;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-004
(declaim (ftype (function (file-io keyword &optional (or null fixnum)) nil) fallisci-rinomina))
(defun fallisci-rinomina (directory reason &optional errno)
  "Pre: failed effect. Post: open capability faulted before IO-FAULT; a closed one is never reopened.
Local transition protected from interruptions; no close or cause replacement."
  (sb-sys:without-interrupts
    (when (eq (file-state directory) :open)
      (setf (file-state directory) :faulted)))
  (error 'io-fault :reason reason :operation :rename :errno errno))

;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-004
(declaim (ftype (function (file-io (or null backend) simple-base-string simple-base-string
                          &optional boolean) null)
                esegui-rinomina))
(defun esegui-rinomina (directory backend source destination &optional (exclusive nil))
  "Pre: capability/preflight verified and callback present if injected. Post: POSIX zero return.
EXCLUSIVE selects only the no-replacement primitive; never falls back to ordinary rename.
IO-FAULT for syscall/impossible return; capability faulted before signaling, no retry."
  (handler-case
      (let ((result (if backend
                        (funcall (if exclusive (backend-rename-exclusive backend) (backend-rename backend))
                                 (file-fd directory) source destination)
                        (if exclusive (native-rename-exclusive (file-fd directory) source destination)
                            (native-replace (file-fd directory) source destination)))))
        (unless (eql result 0) (fallisci-rinomina directory :io-rename-result)))
    (sb-posix:syscall-error (condition)
      (fallisci-rinomina directory :io-syscall (sb-posix:syscall-errno condition))))
  nil)


;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-004
(declaim (ftype (function (file-io simple-base-string simple-base-string
                          &optional (or null function) boolean) null) rinomina-con-nomi-privati))
(defun rinomina-con-nomi-privati (directory source destination &optional verify-after (exclusive nil))
  "Pre: validated private leaves, admitted backend/callback, sole owner in the I/O pool.
Post: rename and optional postcondition complete, capability still open.
Any incomplete exit faults an open capability; never reopens CLOSED or masks the cause.
The internal postcondition returns NIL; IO-FAULT for any other return, no retry/flush/close.
EXCLUSIVE selects rename that rejects an existing target, with the same cleanup."
  (esigi-aperto directory :directory)
  (let ((backend (file-backend directory)) (complete nil))
    (unwind-protect
         (progn
           (esegui-rinomina directory backend source destination exclusive)
           (when verify-after
             (unless (null (funcall verify-after))
               (fallisci-rinomina directory :io-rename-post-result)))
           (esigi-aperto directory :directory)
           (setf complete t))
      ;; Solo la transizione locale è protetta: nessuna syscall/attesa in WITHOUT-INTERRUPTS.
      (sb-sys:without-interrupts
        (when (and (not complete) (eq (file-state directory) :open))
          (setf (file-state directory) :faulted)))))
  nil)

;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (file-io string string) null) rinomina-nella-directory))
(defun rinomina-nella-directory (directory source destination)
  "Pre: I/O pool, exclusive open parent and reserved namespace; stable names/capabilities.
Post: one FD-relative POSIX rename, without close/flush/frontier mutation.
Atomicity point: successful renameat; parent fsync is separate durable completion.
Attests to neither file identity/contents, EDIT, catalog, nor absence of physical aliases.
INVALID-ARGUMENT/UNSUPPORTED-FORMAT in preflight; IO-FAULT and incomplete exit => FAULTED.
The caller reconciles an uncertain outcome from the authoritative source, without retry or rollback here."
  (esigi-aperto directory :directory)
  (verifica-nome-rinomina source)
  (verifica-nome-rinomina destination)
  (when (string= source destination)
    (error 'invalid-argument :reason :io-rename-same-name))
  (let ((backend (file-backend directory)))
    (when (and backend (null (backend-rename backend)))
      (error 'unsupported-format :reason :io-rename-unavailable)))
  ;; Snapshot bounded prima dell'effetto, anche per stringhe adjustable/displaced/fill-pointer.
  (rinomina-con-nomi-privati directory (map 'simple-base-string #'identity source)
                            (map 'simple-base-string #'identity destination))
  nil)
