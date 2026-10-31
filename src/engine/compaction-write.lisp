;;; OWNER: bounded sequential output buffers; no per-key relocation array.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CMP-001 REQ-AFF-004
(declaim (ftype (function (compaction-plan) null) compaction-flush-buffer))
(defun compaction-flush-buffer (plan)
  "Pre: private staged bytes for current output. Post: one exact append, buffer reusable; no per-record syscall."
  (let ((used (compaction-plan-used plan)))
    (when (plusp used)
      (io:append-esatto (compaction-plan-append plan) (compaction-plan-buffer plan) 0 used)
      (setf (compaction-plan-used plan) 0))) nil)

;;; REQ: REQ-CMP-001 REQ-AFF-001
(declaim (ftype (function (motore compaction-plan) null) compaction-finish-output))
(defun compaction-finish-output (engine plan)
  "Pre: complete output's ordinary frames. Post: full output durable before metadata is recorded."
  (when (compaction-plan-append plan)
    (compaction-flush-buffer plan)
    (unless (= (compaction-plan-current-end plan) (io:durable-flush (compaction-plan-append plan)))
      (error 'invariant-violation :reason :engine-compaction-output-flush))
    (push (make-compaction-output (compaction-plan-id plan) (compaction-plan-reader plan)
                                 (compaction-plan-append plan) (compaction-plan-current-end plan)
                                 (compaction-plan-current-records plan)) (compaction-plan-outputs plan))
    (compaction-close-file engine (compaction-plan-append plan))
    (setf (compaction-plan-append plan) nil (compaction-plan-reader plan) nil)) nil)

;;; REQ: REQ-CMP-001 REQ-STO-003 REQ-AFF-018
(declaim (ftype (function (motore compaction-plan) null) compaction-start-output))
(defun compaction-start-output (engine plan)
  "Pre: fresh reserved ID range and exclusive namespace. Post: compaction-origin header, private writer and input.
No canonical EDIT or index mutation; partial files remain undecided on failure."
  (let* ((id (+ (compaction-plan-first-id plan) (length (compaction-plan-outputs plan))))
         (name (nome-segmento-motore id :temporary)) (append (output-motore engine name))
         (reader (input-motore engine name)) (buffer (compaction-plan-buffer plan)))
    (unless (<= 1 id #xffffffff) (error 'resource-exhausted :reason :engine-segment-id-range))
    (f:scrivi-header-segmento buffer 0 (motore-series-id engine) id 0 :version (motore-version engine) :origine f::+compaction-origin+)
    (io:append-esatto append buffer 0 f:+segment-header-bytes+)
    (setf (compaction-plan-append plan) append (compaction-plan-reader plan) reader
          (compaction-plan-current-end plan) f:+segment-header-bytes+ (compaction-plan-current-records plan) 0
          (compaction-plan-id plan) id)) nil)

;;; REQ: REQ-CMP-001 REQ-LIM-003
(declaim (ftype (function (motore compaction-plan octets index index) null) compaction-copy-record))
(defun compaction-copy-record (engine plan buffer start end)
  "Pre: selected verified frame, caller span borrowed. Post: identical frame staged in ordered bounded output."
  (let ((bytes (- end start)))
    (when (or (null (compaction-plan-append plan))
              (> (+ (compaction-plan-current-end plan) bytes) (motore-max-file-bytes engine))
              (>= (compaction-plan-current-records plan) (motore-max-records engine)))
      (compaction-finish-output engine plan) (compaction-start-output engine plan))
    (when (> (+ (compaction-plan-used plan) bytes) (length (compaction-plan-buffer plan)))
      (compaction-flush-buffer plan))
    (replace (compaction-plan-buffer plan) buffer :start1 (compaction-plan-used plan) :start2 start :end2 end)
    (incf (compaction-plan-used plan) bytes) (incf (compaction-plan-current-end plan) bytes)
    (incf (compaction-plan-current-records plan))) nil)

;;; REQ: REQ-CMP-001 REQ-CMP-009
(declaim (ftype (function (motore compaction-plan) null) compaction-produce))
(defun compaction-produce (engine plan)
  "Pre: accepted finite geometry and immutable canonical prefix. Post: durable ordinary outputs in original CSN order."
  (setf (compaction-plan-buffer plan) (make-array (min (motore-max-file-bytes engine)
                                           (max 262144 (motore-max-record-bytes engine))) :element-type '(unsigned-byte 8)))
  (compaction-visit engine plan
    (lambda (buffer start end segment offset version)
      (declare (ignore version))
      (when (compaction-selected-p engine plan buffer start end segment offset)
        (compaction-copy-record engine plan buffer start end))))
  (compaction-finish-output engine plan)
  (setf (compaction-plan-outputs plan) (nreverse (compaction-plan-outputs plan)))
  (unless (= (length (compaction-plan-outputs plan)) (compaction-plan-output-count plan))
    (error 'invariant-violation :reason :engine-compaction-output-count))
  (io:durable-flush (motore-directory engine)) nil)
