;;; OWNER: serial full canonical prefix, borrowed spans only.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CMP-001 REQ-CMP-009 REQ-AFF-002
(declaim (ftype (function (motore compaction-plan function) null) compaction-visit))
(defun compaction-visit (engine plan visitor)
  "Pre: complete canonical gate and immutable sources, BUSY admission. Post: ordinary records in strict CSN order.
CLOSED prefixes are reverified by their canonical visitor; ACTIVE prefix was fully sealed and verified."
  (let ((scratch (motore-scratch engine)))
    (loop for token across (compaction-plan-closed plan) do
      (arcdocdb.recovery.replay:visita-record-closed-recuperato token scratch (limiti-motore engine)
        (lambda (buffer start end segment offset version prepared)
          (when prepared (error 'unsupported-format :reason :engine-compaction-prepared))
          (funcall visitor buffer start end segment offset version) nil)))
    (let* ((active (compaction-plan-active plan)) (segment (ra:segmento-active-recuperato active))
           (end (nth-value 1 (ra:frontiere-active-recuperato active))) (position f:+segment-header-bytes+)
           (version (motore-version engine))
           (id (logior (ash (g::segmento-get-high segment) 32) (g::segmento-get-low segment))))
      (unless (= end (io:leggi-esatto (g::segmento-get-file segment) scratch 0 end 0))
        (error 'invariant-violation :reason :engine-compaction-active-read))
      (loop repeat (floor (- end position) arcdocdb.record:+header-bytes+) while (< position end) do
        (multiple-value-bind (next kind flags) (arcdocdb.record:verifica-cornice scratch position end :version version)
          (unless (zerop flags) (error 'unsupported-format :reason :engine-compaction-flags))
          (when (member kind '(1 2)) (funcall visitor scratch position next id position version))
          (setf position next)))
      (unless (= position end) (error 'invariant-violation :reason :engine-compaction-active-bound))))
  nil)

;;; REQ: REQ-CMP-001 REQ-CMP-009 REQ-MVC-006
(declaim (ftype (function (motore compaction-plan octets index index u64 index) boolean) compaction-selected-p))
(defun compaction-selected-p (engine plan buffer start end segment offset)
  "Pre: verified ordinary record. Post: latest global live location, or exact maximum-CSN witness.
Selecting all sources including ACTIVE makes obsolete tombstones safely discardable in serial current-only M1."
  (let ((csn (b:leggi-u64 buffer (+ start arcdocdb.record::+stamp-offset+))))
    (when (= csn (compaction-plan-maximum plan)) (return-from compaction-selected-p t))
    (multiple-value-bind (next kind flags ks ke) (arcdocdb.record:verifica-cornice buffer start end :version (motore-version engine))
      (declare (ignore next flags))
      (when (= kind 1)
        (case (compaction-probe engine buffer ks ke)
          (:live (let ((words (motore-words engine)))
                   (and (= (aref words 0) csn) (= (aref words 1) (logior (ash segment 32) offset))
                        (= (aref words 3) (- end start)))))
          (:absent nil)
          (otherwise (error 'invariant-violation :reason :engine-compaction-probe)))))))

;;; REQ: REQ-CMP-001 REQ-LIM-003
(declaim (ftype (function (motore compaction-plan index) null) compaction-plan-record))
(defun compaction-plan-record (engine plan bytes)
  "Pre: selected record fits an empty configured segment. Post: bounded ordered output geometry, no file effects."
  (when (or (zerop (compaction-plan-output-count plan))
            (> (+ (compaction-plan-current-end plan) bytes) (motore-max-file-bytes engine))
            (>= (compaction-plan-current-records plan) (motore-max-records engine)))
    (incf (compaction-plan-output-count plan)) (incf (compaction-plan-output-bytes plan) f:+segment-header-bytes+)
    (setf (compaction-plan-current-end plan) f:+segment-header-bytes+ (compaction-plan-current-records plan) 0))
  (incf (compaction-plan-current-end plan) bytes) (incf (compaction-plan-output-bytes plan) bytes)
  (incf (compaction-plan-current-records plan)) (incf (compaction-plan-records plan)) nil)
