;;; OWNER: il compito I/O mantiene parent e namespace stabili per l'intera enumerazione.
;;; SHARED: nessuno stato globale; nomi e vettore restituiti appartengono al chiamante.
(in-package #:arcdocdb.io)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-008 REQ-REC-001
(declaim (ftype (function (t t t) null) verifica-budget-directory))
(defun verifica-budget-directory (max-names max-total-name-bytes max-name-bytes)
  "Pre: caller's budgets. Post: finite integer limits and 1..255-byte name, without I/O."
  (unless (and (typep max-names 'index) (typep max-total-name-bytes 'index)
               (typep max-name-bytes '(integer 1 255)))
    (error 'invalid-argument :reason :io-directory-budget))
  nil)

;;; REQ: REQ-AFF-001 REQ-AFF-008 REQ-REC-001
(declaim (ftype (function (t t index index index) simple-vector) copia-nomi-directory))
(defun copia-nomi-directory (names complete max-names max-total-name-bytes max-name-bytes)
  "Pre: callback finished, borrowed result. Post: private vector/names copied byte for byte.
Rejects incomplete results or results outside the contract; budgets also applied to names unrelated to storage."
  (unless (and (eq complete t) (simple-vector-p names))
    (error 'invariant-violation :reason :io-directory-result))
  (when (> (length names) max-names)
    (error 'resource-exhausted :reason :io-directory-names))
  (let ((bytes 0) (result (make-array (length names))))
    (dotimes (i (length names) result)
      (let ((name (svref names i)))
        (unless (and (stringp name) (plusp (length name))
                     (not (member name '("." "..") :test #'string=)))
          (error 'invariant-violation :reason :io-directory-name))
        (when (> (length name) max-name-bytes)
          (error 'resource-exhausted :reason :io-directory-name-bytes))
        (when (> (length name) (- max-total-name-bytes bytes))
          (error 'resource-exhausted :reason :io-directory-total-name-bytes))
        (unless (every (lambda (character) (let ((code (char-code character)))
                                           (and (<= 1 code 255) (/= code 47)))) name)
          (error 'invariant-violation :reason :io-directory-name))
        (incf bytes (length name))
        (setf (svref result i) (map '(simple-array character (*)) #'identity name))))))

;;; REQ: REQ-AFF-001 REQ-AFF-004 REQ-AFF-008 REQ-REC-001
(declaim (ftype (function (file-io &key (:max-names t) (:max-total-name-bytes t) (:max-name-bytes t))
                          (values simple-vector (eql t) &optional)) elenca-directory))
(defun elenca-directory (directory &key (max-names 65536) (max-total-name-bytes 16777216)
                                      (max-name-bytes 255))
  "Pre: open parent, exclusive/stable namespace, and no concurrent close.
Post: all names except . and .. in a private vector, T only after EOF and successful cleanup.
Latin1 names preserve bytes, no implicit identity/CRC/durability; parent/frontiers intact.
INVALID-ARGUMENT, RESOURCE-EXHAUSTED, IO-FAULT, or UNSUPPORTED for absent callback without fallback."
  (verifica-budget-directory max-names max-total-name-bytes max-name-bytes)
  (esigi-aperto directory :directory)
  (let* ((backend (file-backend directory))
         (callback (and backend (backend-directory-entries backend))))
    (when (and backend (null callback))
      (error 'unsupported-format :reason :io-directory-unavailable))
    (handler-case
        (multiple-value-bind (names complete)
            (if backend (funcall callback (file-fd directory) max-names max-total-name-bytes max-name-bytes)
                (native-directory-entries (file-fd directory) max-names max-total-name-bytes max-name-bytes))
          (let ((result (copia-nomi-directory names complete max-names max-total-name-bytes max-name-bytes)))
            (esigi-aperto directory :directory)
            (values result t)))
      (sb-posix:syscall-error (condition)
        (error 'io-fault :reason :io-syscall :operation :directory-entries
               :errno (sb-posix:syscall-errno condition))))))
