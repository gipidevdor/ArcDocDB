;;; OWNER: il compito I/O possiede parent/namespace fino alla pubblicazione del nuovo child append.
;;; SHARED: backend ereditato readonly; nessuna frontiera o stato del parent viene modificato.
(in-package #:arcdocdb.io)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-001 REQ-AFF-008 REQ-STO-003 REQ-REC-001
(declaim (ftype (function (file-io t t t) null) verifica-creazione-relativa))
(defun verifica-creazione-relativa (directory name max-transfer max-file-bytes)
  "Pre: controller capabilities and configuration. Post: parent, .tmp leaf, budgets, and callbacks admitted.
IO-FAULT for an unavailable parent; INVALID-ARGUMENT for mode/name/budget before I/O.
UNSUPPORTED-FORMAT without create-relative, file-metadata, and entry-identity; no fallback."
  (esigi-aperto directory :directory)
  (unless (and (typep max-transfer 'index) (<= 1 max-transfer +max-transfer+)
               (typep max-file-bytes 'file-offset) (plusp max-file-bytes))
    (error 'invalid-argument :reason :io-budget))
  (unless (stringp name) (error 'invalid-argument :reason :io-leaf-name))
  (esigi-nome-foglia name)
  (unless (and (>= (length name) 4) (string= name ".tmp" :start1 (- (length name) 4)))
    (error 'invalid-argument :reason :io-temporary-name))
  (let ((backend (file-backend directory)))
    (when (and backend (or (null (backend-create-relative backend))
                          (null (backend-file-metadata backend))
                          (null (backend-entry-identity backend))))
      (error 'unsupported-format :reason :io-create-relative-unavailable)))
  nil)

;;; REQ: REQ-AFF-001 REQ-AFF-004 REQ-STO-003 REQ-REC-001
(declaim (ftype (function (file-io file-io simple-base-string) null) esegui-creazione-relativa))
(defun esegui-creazione-relativa (directory file leaf)
  "Pre: preallocated child/leaf and admitted callbacks. Post: child owns a new valid FD.
FD zero is valid; INVARIANT-VIOLATION for an invalid result/parent alias without ownership or close.
IO-FAULT for an unavailable parent or normalized syscall; handoff protected from interruptions.
The syscall/callback may block in the I/O pool; no retry, unlink, or flush."
  (esigi-aperto directory :directory)
  (handler-case
      (sb-sys:without-interrupts
        (let* ((backend (file-backend directory))
               (descriptor (if backend
                               (funcall (backend-create-relative backend) (file-fd directory) leaf :append)
                               (native-create-relative (file-fd directory) leaf :append))))
          (unless (typep descriptor 'fd)
            (error 'invariant-violation :reason :io-create-relative-result))
          (when (= descriptor (file-fd directory))
            (error 'invariant-violation :reason :io-create-relative-parent))
          (setf (file-fd file) descriptor)))
    (sb-posix:syscall-error (condition)
      (error 'io-fault :reason :io-syscall :operation :create-relative
             :errno (sb-posix:syscall-errno condition))))
  (esigi-aperto directory :directory)
  nil)

;;; REQ: REQ-AFF-001 REQ-AFF-004 REQ-AFF-008 REQ-STO-003 REQ-REC-001
(declaim (ftype (function (file-io t &key (:max-transfer t) (:max-file-bytes t)) file-io)
                crea-temporaneo-nella-directory))
(defun crea-temporaneo-nella-directory (directory name &key (max-transfer +max-transfer+)
                                                         (max-file-bytes +default-file-limit+))
  "Pre: I/O pool, exclusive/stable parent and namespace; no asynchronous cancellation.
Post: exactly one new append child, regular/empty, name bound to the same FD; written/durable frontiers zero.
Borrowed parent capabilities/frontiers unchanged, private names and inherited backend; no partial FD.
INVALID-ARGUMENT/UNSUPPORTED-FORMAT/RESOURCE-EXHAUSTED/IO-FAULT for expected rejections;
INVARIANT-VIOLATION for an impossible FD/metadata result, parent alias, nonempty file, or inconsistent frontiers.
Typed primary condition remains EQ after successful cleanup; failed close retains cause and cleanup-errno as IO-FAULT.
Unrelated nonlocal exits attempt one close without attaching errno; no retry or wall-clock timeout.
Preparation before EDIT, without a durable decision point, flush, rename, or unlink:
if creation succeeds before an error, the .tmp remains to be reconciled against the authoritative source."
  (verifica-creazione-relativa directory name max-transfer max-file-bytes)
  (let* ((leaf (map 'simple-base-string #'identity name))
         (file (%make-file :append (file-backend directory) max-transfer max-file-bytes))
         (complete nil) (primary nil) (cleanup-errno nil) (cleanup-failed nil))
    (unwind-protect
         (handler-case
             (progn
               (esegui-creazione-relativa directory file leaf)
               (multiple-value-bind (device inode size) (leggi-metadati-relativi directory file)
                 (unless (zerop size) (error 'invariant-violation :reason :io-create-relative-nonempty))
                 (verifica-entry-relativa directory file leaf device inode :append :io-create-relative-identity)
                 (esigi-aperto directory :directory)
                 (esigi-aperto file :append)
                 (unless (and (zerop (file-written file)) (zerop (file-durable file)))
                   (error 'invariant-violation :reason :io-create-relative-frontier))
                 (setf complete t)))
           (arcdocdb.conditions:arcdocdb-error (condition) (setf primary condition))
           (sb-posix:syscall-error (condition)
             (setf primary (make-condition 'io-fault :reason :io-syscall :operation :create-relative
                                           :errno (sb-posix:syscall-errno condition)))))
      (unless complete
        (sb-sys:without-interrupts
          (multiple-value-setq (cleanup-errno cleanup-failed) (cleanup-lettura-relativa file)))))
    (segnala-apertura-relativa primary cleanup-errno cleanup-failed :create-relative)
    file))
