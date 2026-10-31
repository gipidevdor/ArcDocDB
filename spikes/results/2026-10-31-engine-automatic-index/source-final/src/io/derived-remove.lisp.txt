;;; OWNER: exclusive directory actor; only the reserved noncanonical derived namespace.
(in-package #:arcdocdb.io)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-013 REQ-AFF-008
(defstruct (prova-rimozione-derivato (:constructor %make-prova-rimozione-derivato
                                   (directory file name device inode)) (:copier nil))
  "Pre: exclusive owner verified a derived leaf and its open regular inode. Post: single-use removal authority."
  (directory nil :type file-io :read-only t)
  (file nil :type file-io :read-only t)
  (name "" :type simple-base-string :read-only t)
  (device 0 :type identity-component :read-only t)
  (inode 0 :type identity-component :read-only t)
  (used nil :type boolean))

;;; REQ: REQ-IDX-013 REQ-AFF-008
(declaim (ftype (function (string) boolean) nome-derivato-automatico-p))
(defun nome-derivato-automatico-p (name)
  "Pre: leaf candidate. Post: exact reserved namespace, disjoint from every canonical segment/control name."
  (and (= (length name) 30) (string= name "autoindex-" :end1 10)
       (string= name ".tmp" :start1 26)
       (loop for i from 10 below 26 always (find (char name i) "0123456789abcdef"))))

;;; REQ: REQ-IDX-013 REQ-AFF-004
(declaim (ftype (function (file-io file-io string) prova-rimozione-derivato) prova-derivato-rimovibile))
(defun prova-derivato-rimovibile (directory file name)
  "Pre: exclusive private directory and open derived input. Post: copied single-use inode proof.
Rejects canonical names, backend mismatch and entry replacement before any unlink. No source-of-truth authority."
  (esigi-aperto file :input) (esigi-esclusiva-directory directory)
  (unless (and (nome-derivato-automatico-p name) (eq (file-backend file) (file-backend directory)))
    (error 'invalid-argument :reason :io-derived-removal-domain))
  (let ((backend (file-backend directory)) (leaf (map 'simple-base-string #'identity name)))
    (when (and backend (null (backend-unlink-relative backend)))
      (error 'unsupported-format :reason :io-unlink-relative-unavailable))
    (multiple-value-bind (device inode size) (leggi-metadati-relativi directory file)
      (declare (ignore size))
      (verifica-entry-relativa directory file leaf device inode)
      (%make-prova-rimozione-derivato directory file leaf device inode))))

;;; REQ: REQ-IDX-013 REQ-AFF-004
#+(or darwin linux)
(sb-alien:define-alien-routine ("unlinkat" %derived-unlinkat) sb-alien:int
  (descriptor sb-alien:int) (name sb-alien:c-string) (flags sb-alien:int))

;;; REQ: REQ-IDX-013 REQ-AFF-004
(declaim (ftype (function (prova-rimozione-derivato) null) rimuovi-derivato))
(defun rimuovi-derivato (proof)
  "Pre: exact unconsumed proof under exclusive namespace ownership. Post: leaf unlinked once.
Rechecks inode before consumption; syscall failure consumes authority and propagates, with no retry."
  (when (prova-rimozione-derivato-used proof) (error 'invalid-argument :reason :io-derived-proof-used))
  (let* ((directory (prova-rimozione-derivato-directory proof))
         (file (prova-rimozione-derivato-file proof)) (name (prova-rimozione-derivato-name proof))
         (backend (file-backend directory)))
    (esigi-esclusiva-directory directory)
    (verifica-entry-relativa directory file name (prova-rimozione-derivato-device proof)
                             (prova-rimozione-derivato-inode proof))
    (setf (prova-rimozione-derivato-used proof) t)
    (handler-case
        (let ((result (if backend (funcall (backend-unlink-relative backend) (file-fd directory) name)
                          #+(or darwin linux) (%derived-unlinkat (file-fd directory) name 0)
                          #-(or darwin linux) (error 'unsupported-format :reason :io-platform))))
          (when (and (null backend) (eql result -1))
            (error 'io-fault :reason :io-syscall :operation :unlink-relative :errno (sb-alien:get-errno)))
          (unless (eql result 0) (error 'io-fault :reason :io-unlink-result :operation :unlink-relative)))
      (sb-posix:syscall-error (condition)
        (error 'io-fault :reason :io-syscall :operation :unlink-relative :errno (sb-posix:syscall-errno condition)))))
  nil)
