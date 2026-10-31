;;; OWNER: independent output-to-canonical byte comparisons before CONTROL publication.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CMP-001 REQ-AFF-002
(declaim (ftype (function (compaction-plan u64) (values io:file-io index &optional)) compaction-original-file))
(defun compaction-original-file (plan id)
  "Pre: source IDs sorted by the canonical inventory. Post: exact owned FD and physical bound in logarithmic probes."
  (let* ((sources (compaction-plan-sources plan)) (left 0) (right (mf:numero-fonti-recovery sources)))
    (loop repeat (1+ (integer-length right)) while (< left right) do
      (let ((middle (+ left (floor (- right left) 2))))
        (multiple-value-bind (actual state form file size) (mf:fonte-recovery sources middle)
          (declare (ignore state form))
          (cond ((= actual id) (return-from compaction-original-file (values file size)))
                ((< actual id) (setf left (1+ middle))) (t (setf right middle)))))))
  (error 'invariant-violation :reason :engine-compaction-original-source))

;;; REQ: REQ-CMP-001 REQ-AFF-002 REQ-LIM-003
(declaim (ftype (function (compaction-plan compaction-verifier u64 index index) index) compaction-original-window))
(defun compaction-original-window (plan verifier segment offset bytes)
  "Pre: validated original descriptor. Post: exact record start in a bounded read-ahead window.
Sequential original records share one read; window never escapes maintenance or replaces canonical verification."
  (multiple-value-bind (file size) (compaction-original-file plan segment)
    (unless (and (<= f:+segment-header-bytes+ offset) (<= (+ offset bytes) size))
      (error 'invariant-violation :reason :engine-compaction-original-span))
    (unless (and (eq file (compaction-verifier-file verifier))
                 (<= (compaction-verifier-start verifier) offset)
                 (<= (+ offset bytes) (compaction-verifier-end verifier)))
      (let* ((buffer (compaction-verifier-buffer verifier)) (take (min (length buffer) (- size offset))))
        (unless (and (<= bytes take) (= take (io:leggi-esatto file buffer 0 take offset)))
          (error 'invariant-violation :reason :engine-compaction-original-read))
        (setf (compaction-verifier-file verifier) file (compaction-verifier-start verifier) offset
              (compaction-verifier-end verifier) (+ offset take))))
    (- offset (compaction-verifier-start verifier))))

;;; REQ: REQ-CMP-001 REQ-AFF-002 REQ-CMP-009
(declaim (ftype (function (motore compaction-plan octets index index compaction-verifier) boolean) compaction-verify-record))
(defun compaction-verify-record (engine plan buffer start end verifier)
  "Pre: complete output frame. Post: latest live descriptor or maximum tombstone, raw bytes equal original canon.
Returns live membership, independently verifies payload bytes; CRC alone cannot attest semantic equality."
  (multiple-value-bind (next kind flags ks ke) (arcdocdb.record:verifica-cornice buffer start end :version (motore-version engine))
    (declare (ignore next))
    (unless (zerop flags) (error 'invariant-violation :reason :engine-compaction-output-flags))
    (let* ((csn (b:leggi-u64 buffer (+ start arcdocdb.record::+stamp-offset+)))
           (status (compaction-probe engine buffer ks ke)) (words (motore-words engine))
           (live (and (= kind 1) (eq status :live) (= csn (aref words 0))))
           (segment (if live (ldb (byte 32 32) (aref words 1))
                        (b:leggi-u64 (motore-source-token engine) 8)))
           (offset (if live (ldb (byte 32 0) (aref words 1))
                       (b:leggi-u64 (motore-source-token engine) 16)))
           (bytes (- end start)))
      (unless (or live (and (= kind 2) (= csn (compaction-plan-maximum plan)) (eq status :absent)))
        (error 'invariant-violation :reason :engine-compaction-output-membership))
      (unless (= bytes (if live (aref words 3) (b:leggi-u64 (motore-source-token engine) 24)))
        (error 'invariant-violation :reason :engine-compaction-output-length))
      (let ((within (compaction-original-window plan verifier segment offset bytes))
            (original (compaction-verifier-buffer verifier)))
        (unless (loop for n below bytes always (= (aref original (+ within n)) (aref buffer (+ start n))))
          (error 'invariant-violation :reason :engine-compaction-output-content)))
      live)))

;;; REQ: REQ-CMP-001 REQ-CMP-009 REQ-AFF-002 REQ-MVC-006
(declaim (ftype (function (motore compaction-plan) null) compaction-verify-outputs))
(defun compaction-verify-outputs (engine plan)
  "Pre: outputs durable, no index/source changes. Post: exact live coverage, increasing CSNs and preserved maximum.
One fixed original-frame buffer; no hash set or sorted array proportional to live keys."
  (let ((verifier (make-compaction-verifier (make-array (min (motore-max-file-bytes engine)
                                  (max 262144 (motore-max-record-bytes engine))) :element-type '(unsigned-byte 8))))
        (previous nil) (live 0) (records 0) (bytes 0) (buffer (motore-scratch engine)))
    (dolist (output (compaction-plan-outputs plan))
      (let ((end (compaction-output-end output)) (position f:+segment-header-bytes+))
        (unless (= end (io:leggi-esatto (compaction-output-reader output) buffer 0 end 0))
          (error 'invariant-violation :reason :engine-compaction-output-read))
        (f:verifica-segmento-compattato buffer end (motore-series-id engine) (compaction-output-id output)
                                      :max-bytes (motore-max-file-bytes engine) :max-records (motore-max-records engine))
        (loop while (< position end) do
          (let* ((next (arcdocdb.record:verifica-cornice buffer position end :version (motore-version engine)))
                 (csn (b:leggi-u64 buffer (+ position arcdocdb.record::+stamp-offset+))))
            (when (and previous (<= csn previous)) (error 'invariant-violation :reason :engine-compaction-output-order))
            (when (compaction-verify-record engine plan buffer position next verifier) (incf live))
            (incf records) (setf previous csn position next)))
        (incf bytes end)
        (io:verifica-stabilizzazione-temporaneo (motore-directory engine) (compaction-output-reader output)
          (nome-segmento-motore (compaction-output-id output) :temporary) (nome-segmento-motore (compaction-output-id output) :final))))
    (unless (and (= live (compaction-live-count engine)) (= records (compaction-plan-records plan))
                 (= bytes (compaction-plan-output-bytes plan))
                 (= (or previous 0) (compaction-plan-maximum plan)))
      (error 'invariant-violation :reason :engine-compaction-output-coverage))) nil)
