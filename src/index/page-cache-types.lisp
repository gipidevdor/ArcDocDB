;;; OWNER: un attore I/O per cache; copie private, nessun frame prestato ai reader.
;;; SHARED: nessuno; il caricatore sincrono non puo' rientrare nella cache.
(in-package #:arcdocdb.index.page)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-009 REQ-LIM-003
(defstruct (cache-pagine (:constructor %make-cache-pagine (size frames identities references loader)) (:copier nil))
  "Pre: factory, private memory. Post: fixed frames and local FIFO replacement.
Only the owner may copy pages; no concurrent protocol or durable root."
  (owner sb-thread:*current-thread* :type sb-thread:thread :read-only t)
  (size 4096 :type (member 4096 16384 65536) :read-only t)
  (frames #() :type simple-vector :read-only t)
  (identities #() :type simple-vector :read-only t)
  (references #() :type simple-vector :read-only t)
  (loader #'identity :type function :read-only t)
  (cursor 0 :type index)
  (busy nil :type boolean))

;;; REQ: REQ-IDX-009 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (t t t) cache-pagine) crea-cache-pagine))
(defun crea-cache-pagine (size frame-count loader)
  "Pre: trusted loader (identity buffer) returns SIZE after exact reading.
Post: FRAME-COUNT preallocated frames; payload <= 256 MiB, separate O(frame-count) metadata.
INVALID-ARGUMENT before allocation for invalid size, count, or callback.
The loader borrows BUFFER only during the call, without retaining it."
  (unless (and (member size '(4096 16384 65536))
               (typep frame-count '(integer 1 65536)) (functionp loader))
    (error 'invalid-argument :reason :index-page-cache-configuration))
  (when (> (* size frame-count) 268435456)
    (error 'arcdocdb.conditions:resource-exhausted :reason :index-page-cache-budget))
  (let ((frames (make-array frame-count :element-type t))
        (identities (make-array frame-count :element-type t :initial-element nil))
        (references (make-array frame-count :element-type t)))
    (dotimes (i frame-count)
      (setf (aref frames i) (make-array size :element-type '(unsigned-byte 8) :initial-element 0)
            (aref references i) (crea-identita-pagina
                                (make-array 16 :element-type '(unsigned-byte 8) :initial-element 0) 1 1 1)))
    (%make-cache-pagine size frames identities references loader)))

;;; REQ: REQ-IDX-009 REQ-AFF-008
(declaim (ftype (function (identita-pagina identita-pagina) boolean) stessa-identita-pagina-p))
(defun stessa-identita-pagina-p (first second)
  "Pre: immutable canonical identities. Post: complete equality, without I/O or allocation.
Also compares Serie and image: the same offset does not imply the same page."
  (and (= (identita-pagina-image first) (identita-pagina-image second))
       (= (identita-pagina-page first) (identita-pagina-page second))
       (= (identita-pagina-generation first) (identita-pagina-generation second))
       (equalp (identita-pagina-serie first) (identita-pagina-serie second))))

;;; REQ: REQ-IDX-009 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (t t arcdocdb.io:file-io) cache-pagine) crea-cache-pagine-file))
(defun crea-cache-pagine-file (size frame-count file)
  "Pre: borrowed read-only file, immutable image; I/O actor keeps the file open.
Post: fixed-frame cache connected to the I/O module's exact PREAD, without mmap.
The cache does not own/close the file. Capacity errors before reads;
CRC and identity always verified after transfer, before copying to the caller."
  (unless (member size '(4096 16384 65536))
    (error 'invalid-argument :reason :index-page-cache-configuration))
  (arcdocdb.io:verifica-capienza-lettura file size)
  (crea-cache-pagine size frame-count
    (lambda (identity buffer)
      (arcdocdb.io:leggi-esatto file buffer 0 size (identita-pagina-page identity)))))

;;; REQ: REQ-IDX-009 REQ-AFF-008
(declaim (ftype (function (identita-pagina identita-pagina) null) copia-identita-privata))
(defun copia-identita-privata (source target)
  "Pre: invalid private TARGET cursor, distinct from the published source.
Post: complete copy without allocation; the cache does not retain mutable caller cursors.
INVALID-ARGUMENT for aliasing; no transfer of source ownership."
  (when (eq source target) (error 'invalid-argument :reason :index-page-identity-alias))
  (replace (identita-pagina-serie target) (identita-pagina-serie source))
  (setf (identita-pagina-image target) (identita-pagina-image source)
        (identita-pagina-page target) (identita-pagina-page source)
        (identita-pagina-generation target) (identita-pagina-generation source))
  nil)
