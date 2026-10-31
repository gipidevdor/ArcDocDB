;;;; Trasferimenti esatti senza retry degli errori; completare short I/O non è un retry.
;;; OWNER: input stabile per append, output esclusivo per read; controller mantiene il FD.
;;; SHARED: read non scrive nella capacità; append ha un solo proprietario per file.
(in-package #:arcdocdb.io)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-008
(declaim (ftype (function (file-io octets index index) index) regione))
(defun regione (file buffer start end)
  "Pre: caller's buffer and range. Post: range and byte count within budget.
INVALID-ARGUMENT/RESOURCE-EXHAUSTED before any syscall."
  (check-range buffer start end)
  (let ((count (- end start)))
    (when (> count (file-max-transfer file))
      (error 'resource-exhausted :reason :io-byte-budget :offset start))
    count))

;;; REQ: REQ-AFF-008 REQ-AFF-002
(declaim (ftype (function (file-io index) null) verifica-capienza-lettura))
(defun verifica-capienza-lettura (file count)
  "Pre: owned readonly capability. Post: COUNT-byte range admitted, without a syscall.
IO-FAULT/INVALID-ARGUMENT for capability; RESOURCE-EXHAUSTED for transfer limit.
Does not verify buffer, offset, physical byte availability, or data integrity."
  (esigi-aperto file :input)
  (when (> count (file-max-transfer file))
    (error 'resource-exhausted :reason :io-byte-budget))
  nil)

;;; REQ: REQ-AFF-001 REQ-AFF-008
(declaim (ftype (function (file-io t index keyword index) index) progresso))
(defun progresso (file result remaining operation transferred)
  "Pre: syscall result. Post: positive progress within remaining.
IO-FAULT for zero/impossible return; state mutation only for write."
  (unless (and (integerp result) (<= 1 result remaining))
    (fallisci file operation (if (eql result 0)
                                (if (eq operation :read) :io-eof :io-no-progress)
                                :io-invalid-progress)
              nil transferred))
  result)

;;; REQ: REQ-STO-003 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (file-io (member :input :append) (member :read :write) index) null)
                verifica-capacita-trasferimento))
(defun verifica-capacita-trasferimento (file mode operation transferred)
  "Pre: transfer in progress, relative progress known. Post: open capability and admitted FD.
Local IO-FAULT retains operation/progress even after close in the callback.
Does not intercept or modify conditions originating in the callback; no syscall."
  (unless (eq (file-state file) :open)
    (error 'io-fault :reason :io-unavailable :operation operation :transferred transferred))
  (esigi-aperto file mode)
  nil)

;;; REQ: REQ-STO-003 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (file-io octets index index file-offset) index) leggi-esatto))
(defun leggi-esatto (file buffer start end offset)
  "Pre: readonly file kept alive, exclusive buffer. Post: entire range filled, end returned.
Budget/offset before syscall; IO-FAULT with known progress, no partial read returned.
Does not verify CRC: the caller passes bytes to the codec before responding to the client."
  (esigi-aperto file :input)
  (let ((count (regione file buffer start end)) (done 0) (backend (file-backend file)))
    (when (> count (- +max-file-offset+ offset))
      (error 'invalid-argument :reason :io-offset :offset offset))
    (handler-case
        (loop repeat count until (= done count)
              do (verifica-capacita-trasferimento file :input :read done)
                 (let* ((remaining (- count done))
                        (n (if backend
                               (funcall (backend-reader backend) (file-fd file) buffer
                                        (+ start done) remaining (+ offset done))
                               (native-read (file-fd file) buffer (+ start done)
                                            remaining (+ offset done)))))
                   (incf done (progresso file n remaining :read done))
                   (verifica-capacita-trasferimento file :input :read done)))
      (sb-posix:syscall-error (c)
        (fallisci file :read :io-syscall (sb-posix:syscall-errno c) done)))
    (unless (= done count) (error 'invariant-violation :reason :io-incomplete-read))
    end))

;;; REQ: REQ-STO-003 REQ-AFF-001 REQ-AFF-008
(declaim (ftype (function (file-io index index) null) verifica-capienza-append))
(defun verifica-capienza-append (file total largest-transfer)
  "Pre: owned append file, group total and maximum chunk. Post: budgets available.
INVALID-ARGUMENT/RESOURCE-EXHAUSTED/IO-FAULT before any syscall, without mutation."
  (esigi-aperto file :append)
  (unless (<= largest-transfer total) (error 'invalid-argument :reason :io-group-size))
  (when (or (> largest-transfer (file-max-transfer file))
            (> total (- (file-max-file-bytes file) (file-written file))))
    (error 'resource-exhausted :reason :io-group-budget))
  nil)

;;; REQ: REQ-STO-003 REQ-AFF-001 REQ-AFF-008
(declaim (ftype (function (file-io octets index index) file-offset) append-esatto))
(defun append-esatto (file buffer start end)
  "Pre: one task owns the file and stable input. Post: entire range appended.
Returns the written position, not a commit. Incomplete exit => OPEN becomes FAULTED.
CLOSED stays closed; confirmed progress retained, durable position unchanged.
Budgets/ranges rejected before writing; no error retry, including EINTR/ENOSPC."
  (esigi-aperto file :append)
  (let ((count (regione file buffer start end)) (done 0) (backend (file-backend file))
        (initial (file-written file)) (complete nil))
    (when (> count (- (file-max-file-bytes file) (file-written file)))
      (error 'resource-exhausted :reason :io-file-budget))
    (unwind-protect
         (progn
           (handler-case
               (loop repeat count until (= done count)
                     do (verifica-capacita-trasferimento file :append :write done)
                        (let* ((remaining (- count done))
                               (n (if backend
                                      (funcall (backend-writer backend) (file-fd file) buffer
                                               (+ start done) remaining)
                                      (native-write (file-fd file) buffer (+ start done) remaining)))
                               (progress (progresso file n remaining :write done)))
                          (unless (= (file-written file) (+ initial done))
                            (error 'invariant-violation :reason :io-append-frontier))
                          (incf done progress)
                          (incf (file-written file) progress)
                          (verifica-capacita-trasferimento file :append :write done)))
             (sb-posix:syscall-error (c)
               (fallisci file :write :io-syscall (sb-posix:syscall-errno c) done)))
           (unless (= done count) (error 'invariant-violation :reason :io-incomplete-write))
           (setf complete t)
           (file-written file))
      (sb-sys:without-interrupts
        (when (and (not complete) (eq (file-state file) :open))
          (setf (file-state file) :faulted))))))
