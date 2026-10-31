;;;; Apertura/chiusura: nessun file esistente è aperto in scrittura.
;;; OWNER: il controller registra la capacità; chiusura solo senza reader in volo.
;;; SHARED: nessuno stato mutabile tra Serie; il backend è immutabile.
(in-package #:arcdocdb.io)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-008 REQ-STO-003
(declaim (ftype (function ((or string pathname) (member :input :append :directory)) string)
                nome-file))
(defun nome-file (path mode)
  "Pre: controller path. Post: nonempty/NUL-free native name; append only for .tmp.
INVALID-ARGUMENT before opening; does not resolve ancestor symlinks."
  (let ((name (sb-ext:native-namestring (pathname path))))
    (when (or (zerop (length name)) (find #\Null name))
      (error 'invalid-argument :reason :io-path))
    ;; Il separatore finale non deve trasformare un symlink finale in un antenato.
    (when (and (eq mode :directory) (find-if (lambda (c) (char/= c #\/)) name))
      (setf name (string-right-trim "/" name)))
    (when (and (eq mode :append)
               (not (and (>= (length name) 4) (string= name ".tmp" :start1 (- (length name) 4)))))
      (error 'invalid-argument :reason :io-temporary-name))
    name))

;;; REQ: REQ-AFF-001 REQ-AFF-008 REQ-STO-003
(declaim (ftype (function ((or string pathname) (member :input :append :directory)
                          (or null backend) index file-offset) file-io) apri))
(defun apri (path mode backend max-transfer max-file-bytes)
  "Pre: controller owns the namespace. Post: new capability, bounded configuration.
Prepares the .tmp; no commit or publication point. IO-FAULT/INVALID-ARGUMENT on rejection."
  (unless (and (<= 1 max-transfer +max-transfer+) (plusp max-file-bytes))
    (error 'invalid-argument :reason :io-budget))
  (let* ((name (nome-file path mode)) (file (%make-file mode backend max-transfer max-file-bytes)))
    (handler-case
        (let ((fd (if backend (funcall (backend-open backend) name mode) (native-open name mode))))
          (unless (typep fd 'fd)
            (error 'invariant-violation :reason :io-open-result))
          (setf (file-fd file) fd)
          file)
      (sb-posix:syscall-error (c)
        (fallisci file :open :io-syscall (sb-posix:syscall-errno c))))))

;;; REQ: REQ-STO-003 REQ-AFF-008
(declaim (ftype (function ((or string pathname) &key (:backend (or null backend))
                          (:max-transfer index)) file-io) apri-lettura apri-directory))
(defun apri-lettura (path &key backend (max-transfer +max-transfer+))
  "Pre: controller owns the reference. Post: readonly file; no file mutation.
Typed errors on opening; directories/FIFOs are not valid segments."
  (apri path :input backend max-transfer +default-file-limit+))
;;; REQ: REQ-STO-003 REQ-AFF-008
(defun apri-directory (path &key backend (max-transfer +max-transfer+))
  "Pre: owned directory. Post: FD for relative metadata, synchronization, and close.
Typed open errors; no creation or rename."
  (apri path :directory backend max-transfer +default-file-limit+))

;;; REQ: REQ-STO-003 REQ-AFF-001 REQ-AFF-008
(declaim (ftype (function ((or string pathname) &key (:backend (or null backend))
                          (:max-transfer index) (:max-file-bytes file-offset)) file-io)
                crea-temporaneo))
(defun crea-temporaneo (path &key backend (max-transfer +max-transfer+)
                                (max-file-bytes +default-file-limit+))
  "Pre: new .tmp name, owned namespace. Post: exclusive append-only file.
INVALID-ARGUMENT or IO-FAULT on rejection; no overwrite or commit point."
  (apri path :append backend max-transfer max-file-bytes))

;;; REQ: REQ-AFF-001 REQ-AFF-004
(declaim (ftype (function (file-io) null) chiudi))
(defun chiudi (file)
  "Pre: no other FD user. Post: capability closed before exactly one close.
IO-FAULT for failure, including EINTR; repeated close is a no-op, never uses a reused FD."
  (unless (eq (file-state file) :closed)
    (setf (file-state file) :closed)
    (handler-case
        (let* ((backend (file-backend file))
               (result (if backend (funcall (backend-close backend) (file-fd file))
                           (native-close (file-fd file)))))
          (unless (eql result 0)
            (error 'io-fault :reason :io-close-result :operation :close)))
      (sb-posix:syscall-error (c)
        (error 'io-fault :reason :io-syscall :operation :close :errno (sb-posix:syscall-errno c)))))
  nil)
