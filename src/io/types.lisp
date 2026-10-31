;;;; Capacità locali; nessun descrittore o SAP esportato.
;;; OWNER: il chiamante mantiene il riferimento; un solo compito muta un file.
;;; SHARED: nessuno stato tra Serie; un file readonly ammette pread concorrenti.
(in-package #:arcdocdb.io)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-008
(deftype fd () '(integer 0 2147483647))
(defconstant +max-file-offset+ most-positive-fixnum)
(deftype file-offset () `(integer 0 ,+max-file-offset+))
(defconstant +max-transfer+ 268435456)
(defconstant +default-file-limit+ #xffffffff)

;;; REQ: REQ-AFF-001 REQ-AFF-008
(defstruct (backend (:constructor make-backend
                         (open reader writer flush directory-flush close
                          &key identity entry-identity rename directory-entries open-relative file-metadata
                               create-relative rename-exclusive directory-lock unlink-relative))
                    (:copier nil))
  "Pre: trusted stable functions. Post: immutable table of injectable calls.
Open receives name/mode; read fd/octets/start/count/offset; write fd/octets/start/count.
Flush/directory-flush/close receive fd. Signal syscall-error for errno.
Optional Directory-lock receives directory-fd: acquires nonblocking exclusion until close.
Returns integer zero for success; syscall-error for errno, including busy, without retry.
Optional Identity receives fd and returns integer device/inode of a regular file.
Optional Entry-identity receives directory-fd/leaf name and verifies a regular file without symlinks.
Optional Rename receives directory-fd/source name/target name; zero for success.
Optional Rename-exclusive has the same arguments: atomically rejects every existing target.
Optional Directory-entries receives fd and three budgets; returns a name vector and T at EOF.
Optional Open-relative receives directory-fd/private ASCII leaf/:input; returns a new FD.
Optional File-metadata receives regular fd; returns exact device/inode/size.
Optional Create-relative receives directory-fd/private ASCII leaf/:append; creates a new empty .tmp
with WRONLY/CREAT/EXCL/APPEND/CLOEXEC/NOFOLLOW and requested permissions 0600 (subject to umask).
Returns a new caller-owned FD, without reopening or truncating existing files.
Unlink-relative optionally receives directory-fd/leaf; zero means removal, syscall-error preserves errno.
Only the typed derived-removal proof API can invoke it; no fallback for a missing callback.
No native fallback for missing callbacks."
  (open #'identity :type function :read-only t)
  (reader #'identity :type function :read-only t)
  (writer #'identity :type function :read-only t)
  (flush #'identity :type function :read-only t)
  (directory-flush #'identity :type function :read-only t)
  (close #'identity :type function :read-only t)
  (identity nil :type (or null function) :read-only t)
  (entry-identity nil :type (or null function) :read-only t)
  (rename nil :type (or null function) :read-only t)
  (rename-exclusive nil :type (or null function) :read-only t)
  (directory-lock nil :type (or null function) :read-only t)
  (unlink-relative nil :type (or null function) :read-only t)
  (directory-entries nil :type (or null function) :read-only t)
  (open-relative nil :type (or null function) :read-only t)
  (file-metadata nil :type (or null function) :read-only t)
  (create-relative nil :type (or null function) :read-only t))

;;; REQ: REQ-AFF-001 REQ-AFF-008 REQ-STO-003
(defstruct (file-io (:constructor %make-file (mode backend max-transfer max-file-bytes))
                   (:conc-name file-) (:copier nil))
  "Pre: configuration checked at open. Post: controller-owned capability.
FD assigned once before publication; close after readers finish.
State/positions change only in the owning task."
  (fd -1 :type (integer -1 2147483647))
  (mode :input :type (member :input :append :directory) :read-only t)
  (backend nil :type (or null backend) :read-only t)
  (max-transfer +max-transfer+ :type index :read-only t)
  (max-file-bytes +default-file-limit+ :type file-offset :read-only t)
  (state :open :type (member :open :faulted :closed))
  (written 0 :type file-offset)
  (durable 0 :type file-offset))

;;; REQ: REQ-AFF-001
(declaim (ftype (function (file-io) (member :input :append :directory)) mode-file))
(defun mode-file (file)
  "Pre: owned capability. Post: immutable mode, without FD or mutation." (file-mode file))

;;; REQ: REQ-AFF-001
(declaim (ftype (function (file-io) (member :open :faulted :closed)) stato-file))
(defun stato-file (file)
  "Pre: owned capability. Post: local state observed, without modification or waiting."
  (file-state file))
;;; REQ: REQ-AFF-001
(declaim (ftype (function (file-io) file-offset) posizione-scritta posizione-durevole))
(defun posizione-scritta (file)
  "Pre: read by the owner. Post: known appended bytes, even after partial progress."
  (file-written file))
;;; REQ: REQ-AFF-001
(defun posizione-durevole (file)
  "Pre: read by the owner. Post: frontier of the last successful flush."
  (file-durable file))

;;; REQ: REQ-AFF-001 REQ-AFF-004
(declaim (ftype (function (file-io keyword keyword &optional (or null fixnum) index) nil)
                fallisci))
(defun fallisci (file operation reason &optional errno (transferred 0))
  "Pre: failed operation. Post: write/flush faults OPEN before IO-FAULT; it does not reopen CLOSED.
Read does not change state: the owner manages quarantine and reader lifetimes."
  (sb-sys:without-interrupts
    (when (and (not (eq operation :read)) (eq (file-state file) :open))
      (setf (file-state file) :faulted)))
  (error 'io-fault :reason reason :operation operation :errno errno :transferred transferred))

;;; REQ: REQ-AFF-001 REQ-AFF-004
(declaim (ftype (function (file-io (member :input :append :directory)) null) esigi-aperto))
(defun esigi-aperto (file mode)
  "Pre: valid capability. Post: file open with the exact mode; no syscall on rejection.
INVALID-ARGUMENT for mode; IO-FAULT for a closed/faulted file."
  (unless (eq (file-mode file) mode)
    (error 'invalid-argument :reason :io-mode))
  (unless (eq (file-state file) :open)
    (error 'io-fault :reason :io-unavailable :operation mode))
  (unless (typep (file-fd file) 'fd)
    (error 'invariant-violation :reason :io-descriptor))
  nil)
