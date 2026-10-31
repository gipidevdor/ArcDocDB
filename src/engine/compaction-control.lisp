;;; OWNER: canonical full-state compaction/pruning publisher, existing CONTROL token/rename/fsync.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CMP-001 REQ-AFF-018 REQ-LIM-003
(declaim (ftype (function (hash-table index) (simple-array (unsigned-byte 64) (*))) compaction-table-ids))
(defun compaction-table-ids (table maximum)
  "Pre: immutable canonical table and finite metadata grant. Post: sorted scalar IDs only, never document-sized storage."
  (when (> (hash-table-count table) maximum) (error 'resource-exhausted :reason :engine-compaction-metadata-budget))
  (sort (make-array (hash-table-count table) :element-type '(unsigned-byte 64)
                    :initial-contents (loop for id being the hash-keys of table collect id)) #'<))

;;; REQ: REQ-CMP-001 REQ-CMP-007
(declaim (ftype (function (motore c:control-recuperato) (simple-array (unsigned-byte 64) (*))) compaction-retired-ids))
(defun compaction-retired-ids (engine control)
  "Pre: complete current canonical set, full-prefix replacement. Post: every old source and prior pending removal once."
  (let* ((manifest (c:manifest-control-recuperato control)) (limit (* 2 (motore-max-segments engine)))
         (closed (compaction-table-ids (mf::%manifest-closed manifest) limit))
         (removed (compaction-table-ids (mf::%manifest-removed manifest) limit))
         (result (make-array (+ 1 (length closed) (length removed)) :element-type '(unsigned-byte 64))))
    (replace result closed) (replace result removed :start1 (length closed))
    (setf (aref result (1- (length result))) (mf:segmento-attivo manifest))
    (sort result #'<)))

;;; REQ: REQ-CMP-001 REQ-FOR-003 REQ-AFF-008
(declaim (ftype (function (motore u64 u64 (simple-array (unsigned-byte 64) (*))
                          (simple-array (unsigned-byte 64) (*)) (simple-array (unsigned-byte 64) (*))) octets)
                compaction-control-payload))
(defun compaction-control-payload (engine active next ids ends removed)
  "Pre: bounded ID/length vectors, no prepared outcomes in M1. Post: complete EDIT through canonical format codec."
  (unless (and (= (length ids) (length ends)) (<= (length ids) (motore-max-segments engine))
               (<= (length removed) (* 2 (motore-max-segments engine))))
    (error 'invalid-argument :reason :engine-compaction-control-shape))
  (let* ((closed (make-array (* f::+closed-fixed-bytes+ (length ids)) :element-type '(unsigned-byte 8) :initial-element 0))
         (dead (make-array (* 8 (length removed)) :element-type '(unsigned-byte 8)))
         (payload (make-array (+ f::+edit-min-bytes+ (length closed) (length dead)) :element-type '(unsigned-byte 8))))
    (dotimes (n (length ids))
      (b:scrivi-u64 closed (* n f::+closed-fixed-bytes+) (aref ids n))
      (b:scrivi-u64 closed (+ (* n f::+closed-fixed-bytes+) 8) (aref ends n)))
    (dotimes (n (length removed)) (b:scrivi-u64 dead (* 8 n) (aref removed n)))
    (unless (= (length payload) (f:scrivi-valore-edit payload 0 next active closed (length ids) dead :completo t
                                  :max-chiusi (motore-max-segments engine) :max-rimossi (* 2 (motore-max-segments engine))))
      (error 'invariant-violation :reason :engine-compaction-control-payload)) payload))

;;; REQ: REQ-CMP-001 REQ-AFF-018 REQ-AFF-002
(declaim (ftype (function (motore c:control-recuperato c:control-preparato
                          (simple-array (unsigned-byte 64) (*)) (simple-array (unsigned-byte 64) (*))
                          (simple-array (unsigned-byte 64) (*)) keyword) null) compaction-verify-control))
(defun compaction-verify-control (engine previous prepared ids ends removed mode)
  "Pre: candidate complete EDIT, old canon stable. Post: exact new membership, lengths, retirement and high-water checked.
Replacement retires ALL old sources; pruning preserves every live source and forgets only durably absent REMOVED."
  (let* ((old (c:manifest-control-recuperato previous)) (new (c:manifest-control-preparato prepared))
         (active (mf:segmento-attivo new)))
    (unless (and (eq (c::control-recuperato-view previous) (motore-view engine))
                 (= (length ids) (mf:numero-segmenti-chiusi new)) (= (length removed) (mf:numero-segmenti-rimossi new))
                 (>= (nth-value 1 (mf:prossimo-id-segmento new)) (nth-value 1 (mf:prossimo-id-segmento old))))
      (error 'invariant-violation :reason :engine-compaction-control-set))
    (dotimes (n (length ids))
      (multiple-value-bind (state end outcomes) (mf:trova-segmento new (aref ids n))
        (unless (and (eq state :closed) (= end (aref ends n)) (zerop outcomes))
          (error 'invariant-violation :reason :engine-compaction-control-entry))))
    (loop for id across removed do
      (unless (eq :removed (mf:trova-segmento new id)) (error 'invariant-violation :reason :engine-compaction-control-removed)))
    (ecase mode
      (:replace
       (unless (and (equalp removed (compaction-retired-ids engine previous))
                    (>= active (nth-value 1 (mf:prossimo-id-segmento old)))
                    (loop for id across ids always (<= (nth-value 1 (mf:prossimo-id-segmento old)) id (1- active))))
         (error 'invariant-violation :reason :engine-compaction-replacement)))
      (:prune
       (unless (and (= active (mf:segmento-attivo old)) (zerop (length removed))
                    (= (length ids) (mf:numero-segmenti-chiusi old))
                    (loop for n below (length ids) always
                      (multiple-value-bind (state end outcomes) (mf:trova-segmento old (aref ids n))
                        (and (eq state :closed) (= end (aref ends n)) (zerop outcomes)))))
         (error 'invariant-violation :reason :engine-compaction-prune-set))
       (let ((names (io:elenca-directory (motore-directory engine))))
         (maphash (lambda (id state) (declare (ignore state))
                    (when (or (find (nome-segmento-motore id :final) names :test #'string=)
                              (find (nome-segmento-motore id :temporary) names :test #'string=))
                      (error 'invariant-violation :reason :engine-compaction-prune-live-file))) (mf::%manifest-removed old)))))) nil)

;;; REQ: REQ-CMP-001 REQ-AFF-001 REQ-AFF-018
(declaim (ftype (function (motore c:control-recuperato a:segmento-attivo-preparato
                          (simple-array (unsigned-byte 64) (*)) (simple-array (unsigned-byte 64) (*))
                          (simple-array (unsigned-byte 64) (*)) keyword) null) compaction-publish-control))
(defun compaction-publish-control (engine previous active ids ends removed mode)
  "Pre: outputs verified/durable or removed names durably absent, fresh header-only ACTIVE, BUSY/bootstrap.
Post: existing CONTROL rename/fsync commits exactly verified state; no CSN allocated or unsafe rollback."
  (let* ((buffer (motore-scratch engine)) (header (+ f:+log-header-bytes+ arcdocdb.record:+header-bytes+)))
    (io:leggi-esatto (c::control-recuperato-input previous) buffer 0 header 0)
    (let* ((stamp (b:leggi-u64 buffer (+ f:+log-header-bytes+ arcdocdb.record::+stamp-offset+)))
           (id (arcdocdb.wal::log-io-file-id (a:log-segmento-attivo-preparato active))))
      (when (= stamp #xffffffffffffffff) (error 'resource-exhausted :reason :engine-control-stamp))
      (let* ((next (if (eq mode :replace) (1+ id) (nth-value 1 (mf:prossimo-id-segmento (c:manifest-control-recuperato previous)))))
             (payload (compaction-control-payload engine id next ids ends removed)))
        (let ((prepared (prepara-control-motore engine (c:crea-checkpoint-control active payload (1+ stamp)
                          :max-segmenti (* 2 (motore-max-segments engine)) :max-esiti 0))))
          (compaction-verify-control engine previous prepared ids ends removed mode)
          (osserva-motore engine (if (eq mode :replace) :compaction-before-publish :compaction-before-prune))
          (compaction-verify-control engine previous prepared ids ends removed mode)
          (c:pubblica-control-recuperato prepared (c::control-recuperato-input previous))
          (osserva-motore engine (if (eq mode :replace) :compaction-published :compaction-pruned)))))) nil)
