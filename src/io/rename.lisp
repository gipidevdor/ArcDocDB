;;; OWNER: compito I/O esclusivo sulla directory e sui nomi riservati dal controller.
;;; SHARED: nessun lock/stato tra Serie; nomi presi in prestito e stabili durante la chiamata.
(in-package #:arcdocdb.io)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-008
(defconstant +max-rename-name-bytes+ 255)

;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-004
(sb-alien:define-alien-routine ("renameat" %renameat) sb-alien:int
  (source-directory sb-alien:int) (source sb-alien:c-string)
  (destination-directory sb-alien:int) (destination sb-alien:c-string))

;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-008
(declaim (ftype (function (string) null) verifica-nome-rinomina))
(defun verifica-nome-rinomina (name)
  "Pre: nome string stabile. Post: componente ASCII di 1..255 byte, senza slash/NUL o dot/dotdot.
INVALID-ARGUMENT prima di I/O; ciclo limitato a 255 caratteri. Nomi storage canonici ASCII."
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
(declaim (ftype (function (fd simple-base-string simple-base-string) integer) native-rename))
(defun native-rename (directory source destination)
  "Pre: FD directory stabile e due componenti controllati. Post: una renameat nel medesimo parent.
SYSCALL-ERROR con errno immediato, nessun retry; zero non attesta fsync o decisione EDIT."
  (let ((result (%renameat directory source directory destination)))
    (when (= result -1)
      (error 'sb-posix:syscall-error :name 'renameat :errno (sb-alien:get-errno)))
    result))

;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-004
(declaim (ftype (function (file-io keyword &optional (or null fixnum)) nil) fallisci-rinomina))
(defun fallisci-rinomina (directory reason &optional errno)
  "Pre: effetto fallito. Post: capacità aperta guastata prima di IO-FAULT, chiusa mai riaperta.
Transizione locale protetta dalle interruzioni; nessuna close o sostituzione della causa."
  (sb-sys:without-interrupts
    (when (eq (file-state directory) :open)
      (setf (file-state directory) :faulted)))
  (error 'io-fault :reason reason :operation :rename :errno errno))

;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-004
(declaim (ftype (function (file-io (or null backend) simple-base-string simple-base-string) null)
                esegui-rinomina))
(defun esegui-rinomina (directory backend source destination)
  "Pre: capacità/preflight verificati e callback presente se iniettato. Post: ritorno POSIX zero.
IO-FAULT per syscall/ritorno impossibile; capacità faulted prima della segnalazione, nessun retry."
  (handler-case
      (let ((result (if backend
                        (funcall (backend-rename backend) (file-fd directory) source destination)
                        (native-rename (file-fd directory) source destination))))
        (unless (eql result 0) (fallisci-rinomina directory :io-rename-result)))
    (sb-posix:syscall-error (condition)
      (fallisci-rinomina directory :io-syscall (sb-posix:syscall-errno condition))))
  nil)

;;; REQ: REQ-REC-001 REQ-AFF-001 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (file-io string string) null) rinomina-nella-directory))
(defun rinomina-nella-directory (directory source destination)
  "Pre: pool I/O, parent aperto esclusivo e namespace riservato; nomi/capacità stabili.
Post: una rinomina POSIX relativa al FD, senza close/flush/mutazione delle frontiere.
Punto atomico: renameat riuscita; fsync del parent è completamento durevole separato.
Non attesta identità/contenuto dei file, EDIT, catalogo o assenza di alias fisici.
INVALID-ARGUMENT/UNSUPPORTED-FORMAT in preflight; IO-FAULT e uscita incompleta => FAULTED.
Il caller riconcilia un esito incerto dalla fonte autorevole, senza retry o rollback qui."
  (esigi-aperto directory :directory)
  (verifica-nome-rinomina source)
  (verifica-nome-rinomina destination)
  (when (string= source destination)
    (error 'invalid-argument :reason :io-rename-same-name))
  (let ((backend (file-backend directory)))
    (when (and backend (null (backend-rename backend)))
      (error 'unsupported-format :reason :io-rename-unavailable))
    ;; Entrambi i nomi sono normalizzati prima di installare l'effetto, anche per backend iniettato.
    (let ((source (map 'simple-base-string #'identity source))
          (destination (map 'simple-base-string #'identity destination)) (complete nil))
      (unwind-protect
         (progn
           (esegui-rinomina directory backend source destination)
           (esigi-aperto directory :directory)
           (setf complete t))
      ;; Rilascia l'effetto incompleto senza nascondere la causa o riaprire una capacità chiusa.
        (sb-sys:without-interrupts
          (when (and (not complete) (eq (file-state directory) :open))
            (setf (file-state directory) :faulted))))))
  nil)
