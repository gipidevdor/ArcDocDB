;;; OWNER: attore I/O del costruttore; seme e dominio copiati prima di qualsiasi append.
;;; SHARED: nessuno; memoria di lavoro proporzionale alla sola taglia pagina.
(in-package #:arcdocdb.index.page)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-009 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (index index) null) preflight-pagine-vuoto))
(defun preflight-pagine-vuoto (bytes size)
  "Pre: positive bytes and builder size. Post: no external resource reserved.
Generic sink must honor its own budget; builder checks page count."
  (unless (and (plusp bytes) (plusp size)) (error 'invariant-violation :reason :index-build-reservation)) nil)

;;; REQ: REQ-IDX-009 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (identita-pagina t t u32 u32 &key (:max-pages t) (:preflight t)) costruttore-pagine)
                crea-costruttore-pagine))
(defun crea-costruttore-pagine (start size sink seed-high seed-low &key (max-pages 65536) (preflight #'preflight-pagine-vuoto))
  "Pre: START identifies first free offset in a private image, prefix already owned by caller.
Post: fixed scratch and no I/O; sink(buffer, offset) returns exact end without retaining buffer.
Preflight(bytes, size) returns NIL before every batch; INVALID-ARGUMENT for configuration.
Does not define a container header, close files, or publish a durable root."
  (unless (and (member size '(4096 16384 65536)) (functionp sink) (functionp preflight)
               (typep max-pages '(integer 1 65536)))
    (error 'invalid-argument :reason :index-build-configuration))
  (verifica-identita-allineata start size 'invalid-argument)
  (let ((domain (crea-identita-pagina (identita-pagina-serie start) (identita-pagina-image start)
                                     (identita-pagina-page start) (identita-pagina-generation start)))
        (capacity (nth-value 1 (geometria-pagina size))))
    (%make-costruttore-pagine domain size sink preflight seed-high seed-low max-pages (identita-pagina-page start)
      (make-array size :element-type '(unsigned-byte 8) :initial-element 0)
      (make-array size :element-type '(unsigned-byte 8) :initial-element 0)
      (make-array capacity :element-type t :initial-element nil)
      (make-array capacity :element-type '(unsigned-byte 8) :initial-element 0)
      (make-array capacity :element-type '(unsigned-byte 64) :initial-element 0))))

;;; REQ: REQ-IDX-009 REQ-AFF-001 REQ-AFF-008
(declaim (ftype (function (arcdocdb.io:file-io identita-pagina t u32 u32 &key (:max-pages t)) costruttore-pagine)
                crea-costruttore-pagine-file))
(defun crea-costruttore-pagine-file (file start size seed-high seed-low &key (max-pages 65536))
  "Pre: borrowed append file, aligned position already beyond caller's private prefix.
Post: sink connected to exact append and whole-batch preflight in I/O module.
No flush, close, rename, or commit decision; inconsistent position rejected."
  (unless (= (arcdocdb.io:posizione-scritta file) (identita-pagina-page start))
    (error 'invalid-argument :reason :index-build-file-position))
  (let ((builder (crea-costruttore-pagine start size
    (lambda (buffer offset)
      (unless (= (arcdocdb.io:posizione-scritta file) offset)
        (error 'invariant-violation :reason :index-build-file-position))
      (arcdocdb.io:append-esatto file buffer 0 (length buffer)))
    seed-high seed-low :max-pages max-pages
    :preflight (lambda (bytes page-size) (arcdocdb.io:verifica-capienza-append file bytes page-size)))))
    (setf (costruttore-pagine-file builder) file)
    builder))

;;; REQ: REQ-IDX-009 REQ-AFF-008
(declaim (ftype (function (costruttore-pagine) null) esigi-costruttore-libero))
(defun esigi-costruttore-libero (builder)
  "Pre: canonical input. Post: owner, OPEN, and non-reentrancy without effects; typed errors."
  (unless (eq (costruttore-pagine-owner builder) sb-thread:*current-thread*)
    (error 'invalid-argument :reason :index-build-owner))
  (case (costruttore-pagine-state builder)
    (:open nil)
    (:sealed (error 'invalid-argument :reason :index-build-sealed))
    (otherwise (error 'invalid-argument :reason :index-build-faulted)))
  (when (costruttore-pagine-busy builder) (error 'invalid-argument :reason :index-build-reentry)) nil)
