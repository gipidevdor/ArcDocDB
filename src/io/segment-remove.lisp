;;; OWNER: exclusive maintenance/recovery actor, after authoritative REMOVED and reader quiescence.
;;; SHARED: single-use inode proof; never a pathname-only canonical unlink.
(in-package #:arcdocdb.io)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CMP-007 REQ-AFF-004 REQ-AFF-008
(defstruct (prova-rimozione-segmento (:constructor %make-prova-rimozione-segmento (directory file name device inode)) (:copier nil))
  (directory nil :type file-io :read-only t) (file nil :type file-io :read-only t)
  (name "" :type simple-base-string :read-only t)
  (device 0 :type identity-component :read-only t) (inode 0 :type identity-component :read-only t)
  (used nil :type boolean))

;;; REQ: REQ-CMP-007 REQ-AFF-008
(declaim (ftype (function (file-io file-io string arcdocdb.binary:u64) prova-rimozione-segmento) prova-segmento-rimovibile))
(defun prova-segmento-rimovibile (directory file name id)
  "Pre: caller proved ID is REMOVED by durable CONTROL, header identity and reader quiescence.
Post: exact canonical leaf/inode under the exclusive directory, one-use removal permit.
This factory verifies physical binding; it does not infer logical obsolescence from absence."
  (esigi-aperto file :input) (esigi-esclusiva-directory directory)
  (unless (and (plusp id) (eq (file-backend file) (file-backend directory))
               (member name (list (string-downcase (format nil "~16,'0X.seg" id))
                                  (string-downcase (format nil "~16,'0X.seg.tmp" id))) :test #'string=))
    (error 'invalid-argument :reason :io-segment-removal-domain))
  (when (and (file-backend directory) (null (backend-unlink-relative (file-backend directory))))
    (error 'unsupported-format :reason :io-unlink-relative-unavailable))
  (multiple-value-bind (device inode size) (leggi-metadati-relativi directory file)
    (declare (ignore size))
    (verifica-entry-relativa directory file name device inode)
    (%make-prova-rimozione-segmento directory file (map 'simple-base-string #'identity name) device inode)))

;;; REQ: REQ-CMP-007 REQ-AFF-004
(declaim (ftype (function (prova-rimozione-segmento) null) rimuovi-segmento))
(defun rimuovi-segmento (proof)
  "Pre: exact unconsumed canonical retirement permit, no reader. Post: inode unlinked once, no implicit fsync.
Entry replacement is rejected before consumption; syscall failure consumes authority without retry."
  (when (prova-rimozione-segmento-used proof) (error 'invalid-argument :reason :io-segment-proof-used))
  (let* ((directory (prova-rimozione-segmento-directory proof)) (file (prova-rimozione-segmento-file proof))
         (name (prova-rimozione-segmento-name proof)) (backend (file-backend directory)))
    (esigi-esclusiva-directory directory)
    (verifica-entry-relativa directory file name (prova-rimozione-segmento-device proof) (prova-rimozione-segmento-inode proof))
    (setf (prova-rimozione-segmento-used proof) t)
    (handler-case
        (let ((result (if backend (funcall (backend-unlink-relative backend) (file-fd directory) name)
                          #+(or darwin linux) (%derived-unlinkat (file-fd directory) name 0)
                          #-(or darwin linux) (error 'unsupported-format :reason :io-platform))))
          (when (and (null backend) (eql result -1))
            (error 'io-fault :reason :io-syscall :operation :unlink-segment :errno (sb-alien:get-errno)))
          (unless (eql result 0) (error 'io-fault :reason :io-unlink-result :operation :unlink-segment)))
      (sb-posix:syscall-error (condition)
        (error 'io-fault :reason :io-syscall :operation :unlink-segment :errno (sb-posix:syscall-errno condition)))))
  nil)
