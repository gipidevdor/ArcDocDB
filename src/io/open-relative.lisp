;;; OWNER: un compito I/O possiede parent/namespace fino alla pubblicazione della nuova capacita'.
;;; SHARED: backend ereditato immutabile; foglia e child privati, nessuna mutazione del parent.
(in-package #:arcdocdb.io)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-001 REQ-AFF-008 REQ-STO-003
(declaim (ftype (function (file-io t t t) null) verifica-apertura-relativa))
(defun verifica-apertura-relativa (directory name max-transfer max-file-bytes)
  "Pre: controller capability. Post: open parent, admitted leaf/budgets/callbacks, without I/O.
IO-FAULT for closed/faulted parent; INVALID-ARGUMENT for mode, leaf, or budget;
UNSUPPORTED-FORMAT unless all three callbacks are present."
  (esigi-aperto directory :directory)
  (unless (and (typep max-transfer 'index) (<= 1 max-transfer +max-transfer+)
               (typep max-file-bytes 'file-offset))
    (error 'invalid-argument :reason :io-budget))
  (unless (stringp name) (error 'invalid-argument :reason :io-leaf-name))
  (esigi-nome-foglia name)
  (let ((backend (file-backend directory)))
    (when (and backend (or (null (backend-open-relative backend))
                          (null (backend-file-metadata backend))
                          (null (backend-entry-identity backend))))
      (error 'unsupported-format :reason :io-open-relative-unavailable)))
  nil)

;;; REQ: REQ-AFF-001 REQ-AFF-004 REQ-REC-001
(declaim (ftype (function (file-io file-io simple-base-string) null) esegui-apertura-relativa))
(defun esegui-apertura-relativa (directory file leaf)
  "Pre: preallocated child/leaf, verified backend. Post: only a valid new FD is owned by the child.
Parent checked before/after, IO-FAULT if unavailable; INVARIANT-VIOLATION for an invalid FD
or parent alias, without assuming ownership or closing it; syscall normalized to IO-FAULT.
Only the call/store window is interrupt-free; syscall/callback may block in the I/O pool."
  (esigi-aperto directory :directory)
  (handler-case
      (sb-sys:without-interrupts
        (let* ((backend (file-backend directory))
               (descriptor (if backend
                               (funcall (backend-open-relative backend) (file-fd directory) leaf :input)
                               (native-open-relative (file-fd directory) leaf :input))))
          (unless (typep descriptor 'fd)
            (error 'invariant-violation :reason :io-open-relative-result))
          (when (= descriptor (file-fd directory))
            (error 'invariant-violation :reason :io-open-relative-parent))
          (setf (file-fd file) descriptor)))
    (sb-posix:syscall-error (condition)
      (error 'io-fault :reason :io-syscall :operation :open-relative
             :errno (sb-posix:syscall-errno condition))))
  (esigi-aperto directory :directory)
  nil)

;;; REQ: REQ-AFF-001 REQ-AFF-004 REQ-AFF-008 REQ-FOR-001
(declaim (ftype (function (file-io file-io)
                          (values identity-component identity-component file-offset &optional))
                leggi-metadati-relativi))
(defun leggi-metadati-relativi (directory file)
  "Pre: valid owned child, stable parent/backend. Post: POSIX identity and EOF within budget.
INVARIANT-VIOLATION for invalid tuples, RESOURCE-EXHAUSTED for EOF beyond budget, without coercion.
Original IO-FAULT or normalized syscall, including for unavailable parent; no close here."
  (esigi-aperto directory :directory)
  (handler-case
      (multiple-value-bind (device inode size)
          (let ((backend (file-backend file)))
            (if backend (funcall (backend-file-metadata backend) (file-fd file))
                (native-file-metadata (file-fd file))))
        (esigi-aperto directory :directory)
        (unless (and (typep device 'identity-component) (typep inode 'identity-component)
                     (integerp size) (not (minusp size)))
          (error 'invariant-violation :reason :io-file-metadata-result))
        (when (> size (file-max-file-bytes file))
          (error 'resource-exhausted :reason :io-file-size))
        (values device inode size))
    (sb-posix:syscall-error (condition)
      (error 'io-fault :reason :io-syscall :operation :file-metadata
             :errno (sb-posix:syscall-errno condition)))))

;;; REQ: REQ-AFF-001 REQ-AFF-004 REQ-FOR-001 REQ-REC-001
(declaim (ftype (function (file-io file-io simple-base-string identity-component identity-component
                          &optional (member :input :append) keyword) null)
                verifica-entry-relativa))
(defun verifica-entry-relativa (directory file leaf device inode
                                &optional (mode :input) (reason :io-open-relative-identity))
  "Pre: regular child identity already measured. Post: the same identity at the nofollow leaf.
Parent checked before/after callback; INVALID-ARGUMENT for mismatch or mode;
IO-FAULT for unavailable capability, no partial result."
  (esigi-aperto directory :directory)
  (multiple-value-bind (entry-device entry-inode) (leggi-identita-entry directory leaf)
    (esigi-aperto directory :directory)
    (unless (and (= device entry-device) (= inode entry-inode))
      (error 'invalid-argument :reason reason)))
  (esigi-aperto file mode)
  nil)

;;; REQ: REQ-AFF-001 REQ-AFF-004
(declaim (ftype (function (file-io) (values (or null fixnum) boolean &optional))
                cleanup-lettura-relativa))
(defun cleanup-lettura-relativa (file)
  "Pre: unpublished child; valid FD implies ownership. Post: CLOSED before a single close.
Even an invalidated parent does not prevent cleanup. Syscall/IO-FAULT reduced to errno/failure;
a nonzero return preserves failure with errno NIL; other conditions are outside the contract."
  (if (and (typep (file-fd file) 'fd) (not (eq (file-state file) :closed)))
      (progn
        (setf (file-state file) :closed)
        (handler-case
            (let* ((backend (file-backend file))
                   (result (if backend (funcall (backend-close backend) (file-fd file))
                               (native-close (file-fd file)))))
              (values nil (not (eql result 0))))
          (sb-posix:syscall-error (condition)
            (values (sb-posix:syscall-errno condition) t))
          (io-fault (condition)
            (values (arcdocdb.conditions:error-errno condition) t))))
      (values nil nil)))

;;; REQ: REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function ((or null arcdocdb.conditions:arcdocdb-error) (or null fixnum) boolean
                          &optional (member :open-relative :create-relative)) null)
                segnala-apertura-relativa))
(defun segnala-apertura-relativa (primary cleanup-errno cleanup-failed &optional (operation :open-relative))
  "Pre: cleanup completed or attempted. Post: EQ-identical primary condition if cleanup succeeded.
Cleanup failure produces IO-FAULT with primary reason/offset and original I/O fields if present.
Errno NIL does not distinguish a nonzero close return from a close IO-FAULT without errno.
OPERATION identifies opening/creation for a non-I/O primary cause; cleanup without a primary cause violates the invariant."
  (when primary
    (if cleanup-failed
        (let ((io-primary (typep primary 'io-fault)))
          (error 'io-fault :reason (arcdocdb.conditions:error-reason primary)
                 :offset (arcdocdb.conditions:error-offset primary)
                 :operation (if io-primary (arcdocdb.conditions:error-operation primary) operation)
                 :errno (if io-primary (arcdocdb.conditions:error-errno primary) nil)
                 :transferred (if io-primary (arcdocdb.conditions:error-transferred primary) 0)
                 :cleanup-errno cleanup-errno))
        (error primary)))
  (when cleanup-failed
    (error 'invariant-violation :reason (if (eq operation :create-relative)
                                          :io-create-relative-cleanup :io-open-relative-cleanup)))
  nil)

;;; REQ: REQ-AFF-001 REQ-AFF-004 REQ-AFF-008 REQ-STO-003 REQ-REC-001
(declaim (ftype (function (file-io t &key (:max-transfer t) (:max-file-bytes t))
                          (values file-io file-offset &optional)) apri-lettura-nella-directory))
(defun apri-lettura-nella-directory (directory name &key (max-transfer +max-transfer+)
                                                       (max-file-bytes +default-file-limit+))
  "Pre: I/O pool, exclusive stable parent/namespace, no asynchronous cancellation.
Post: read-only child and verified EOF; borrowed parent and frontiers intact, no partial FD.
Private names, inherited backend without fallback; zero bytes allowed, no append opening.
EOF is the observed size, not a durable frontier; no format or CRC verification.
INVALID-ARGUMENT/UNSUPPORTED-FORMAT/RESOURCE-EXHAUSTED/IO-FAULT for expected rejections.
INVARIANT-VIOLATION for backend FDs or metadata outside the contract, including a parent alias.
Typed errors deferred until after cleanup; foreign nonlocal exits attempt cleanup and preserve
the cause without attaching cleanup-errno. No implicit retry, wall timeout, unlink, or flush."
  (verifica-apertura-relativa directory name max-transfer max-file-bytes)
  (let* ((leaf (map 'simple-base-string #'identity name))
         (file (%make-file :input (file-backend directory) max-transfer max-file-bytes))
         (size 0) (complete nil) (primary nil) (cleanup-errno nil) (cleanup-failed nil))
    (unwind-protect
         (handler-case
             (progn
               (esegui-apertura-relativa directory file leaf)
               (multiple-value-bind (device inode eof) (leggi-metadati-relativi directory file)
                 (verifica-entry-relativa directory file leaf device inode)
                 (esigi-aperto directory :directory)
                 (esigi-aperto file :input)
                 (setf size eof complete t)))
           (arcdocdb.conditions:arcdocdb-error (condition) (setf primary condition))
           (sb-posix:syscall-error (condition)
             (setf primary (make-condition 'io-fault :reason :io-syscall :operation :open-relative
                                           :errno (sb-posix:syscall-errno condition)))))
      (unless complete
        (sb-sys:without-interrupts
          (multiple-value-setq (cleanup-errno cleanup-failed) (cleanup-lettura-relativa file)))))
    (segnala-apertura-relativa primary cleanup-errno cleanup-failed)
    (values file size)))
