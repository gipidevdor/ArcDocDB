;;; OWNER: motore registra subito ogni capacita', set chiusi prima dei FD espliciti/parent.
;;; SHARED: nomi e array solo di startup; nessun file esistente aperto in scrittura.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-AFF-004
(declaim (ftype (function (motore io:file-io) io:file-io) possiedi-file-motore))
(defun possiedi-file-motore (engine file)
  "Pre: new capability returned to the owner, no asynchronous thread cancellation.
Post: resource registered for complete cleanup; no FD exported or second owner."
  (push file (motore-fds engine)) file)

;;; REQ: REQ-REC-001 REQ-AFF-008 REQ-AFF-004
(declaim (ftype (function (motore string) (values io:file-io index &optional)) input-motore))
(defun input-motore (engine name)
  "Pre: exclusive namespace, owned parent. Post: readonly and EOF on the same FD, registered.
Original relative-open errors; no reopening for writing."
  (multiple-value-bind (file size)
      (io:apri-lettura-nella-directory (motore-directory engine) name
                                     :max-transfer (motore-max-file-bytes engine)
                                     :max-file-bytes (motore-max-file-bytes engine))
    (values (possiedi-file-motore engine file) size)))

;;; REQ: REQ-REC-001 REQ-STO-003 REQ-AFF-004
(declaim (ftype (function (motore string) io:file-io) output-motore))
(defun output-motore (engine name)
  "Pre: new temporary file reserved in the exclusive namespace. Post: registered O_EXCL append capability.
Collisions and original conditions preserved; no existing file truncated or reopened."
  (possiedi-file-motore engine
    (io:crea-temporaneo-nella-directory (motore-directory engine) name
       :max-transfer (motore-max-file-bytes engine) :max-file-bytes (motore-max-file-bytes engine))))

;;; REQ: REQ-FOR-001 REQ-REC-001
(declaim (ftype (function (u64 (member :temporary :final)) simple-base-string) nome-segmento-motore))
(defun nome-segmento-motore (id form)
  "Pre: u64 ID and canonical form. Post: unique leaf in recovery format, no derived pathname."
  (arcdocdb.recovery.manifest::nome-fonte-recovery id form))

;;; REQ: REQ-REC-001 REQ-STO-003 REQ-AFF-001
(declaim (ftype (function (motore u64) a:segmento-attivo-preparato) prepara-active-motore))
(defun prepara-active-motore (engine id)
  "Pre: fresh ID <=u32 from the planner, exclusive namespace. Post: new durable header reread.
Append/readonly registered; before the authoritative EDIT, no admission or destruction."
  (unless (<= 1 id #xffffffff) (error 'resource-exhausted :reason :engine-segment-id-range))
  (let* ((name (nome-segmento-motore id :temporary)) (append (output-motore engine name))
         (input (input-motore engine name)))
    (a:prepara-segmento-attivo (motore-view engine) input append (motore-directory engine) id 0
                             (make-array f:+segment-header-bytes+ :element-type '(unsigned-byte 8))
                             (motore-scratch engine) :version (motore-version engine))))

;;; REQ: REQ-REC-001 REQ-FOR-003 REQ-AFF-008
(declaim (ftype (function (motore) c:control-recuperato) leggi-control-motore))
(defun leggi-control-motore (engine)
  "Pre: authoritative CONTROL, exclusive namespace. Post: entire EOF verified on the same FD.
No bytes or manifest published to the client; M1 limits applied by the canonical reader."
  (multiple-value-bind (file size) (input-motore engine "control.log")
    (c:leggi-control-recuperato (motore-view engine) file size (motore-scratch engine)
       :max-bytes (motore-max-file-bytes engine) :max-segmenti (* 2 (motore-max-segments engine)))))

;;; REQ: REQ-REC-001 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (motore c:control-recuperato) mf::recovery-sources) fonti-motore))
(defun fonti-motore (engine control)
  "Pre: canonical CONTROL, exclusive namespace. Post: complete owned registered set.
EOF/file budgets before readers; no child capability closed separately."
  (when (> (1+ (mf:numero-segmenti-chiusi (c:manifest-control-recuperato control))) (motore-max-segments engine))
    (error 'resource-exhausted :reason :engine-live-segment-budget))
  (let ((set (mf:apri-fonti-recovery (c:manifest-control-recuperato control) (motore-directory engine)
               :max-segmenti (* 2 (motore-max-segments engine)) :max-files (+ 16 (* 4 (motore-max-segments engine)))
               :max-file-bytes (motore-max-file-bytes engine)
               :max-transfer (motore-max-file-bytes engine)
               :max-total-file-bytes (* (motore-max-segments engine) (motore-max-file-bytes engine)))))
    (push set (motore-recovery-sets engine)) set))
