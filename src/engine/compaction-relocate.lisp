;;; OWNER: after durable canonical replacement, serial index relocation without replacing the RAM/paged backend.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CMP-001 REQ-IDX-001 REQ-IDX-004 REQ-IDX-013
(declaim (ftype (function (motore octets index index u64 u64 index (simple-array (unsigned-byte 64) (5))) null)
                compaction-relocate-live))
(defun compaction-relocate-live (engine key start end csn location bytes replacement)
  "Pre: identical durable canonical copy, BUSY after CONTROL decision. Post: same version at a fresh location.
Existing resident CAS relocation and paged path-copy relocation preserve key count and reject stale expected tuples."
  (when (and (motore-automatic-index engine) (automatic-index-controller-disk (motore-automatic-index engine)))
    (reserve-automatic-disk engine))
  (unless (and (eq :live (compaction-probe engine key start end)) (= csn (aref (motore-words engine) 0))
               (= bytes (aref (motore-words engine) 3)))
    (error 'invariant-violation :reason :engine-compaction-relocation-membership))
  (let* ((expected (motore-words engine)) (auto (motore-automatic-index engine))
         (tree (when auto (automatic-index-controller-disk auto))))
    (replace replacement expected) (setf (aref replacement 1) location)
    (unless (if tree (d:relocate-disk-index tree key start end expected location)
                (multiple-value-bind (high low) (p:digest-chiave-indice (motore-index engine) key start end)
                  (p:riloca-chiave-indice (motore-index engine) key start end high low expected replacement
                                         (motore-index-context engine))))
      (error 'invariant-violation :reason :engine-compaction-relocation-stale))
    (when tree (verify-automatic-cardinality auto tree))) nil)

;;; REQ: REQ-CMP-001 REQ-CMP-009 REQ-IDX-010 REQ-MVC-006
(declaim (ftype (function (motore compaction-plan) null) compaction-relocate-index))
(defun compaction-relocate-index (engine plan)
  "Pre: new canon verified and durable, no GET borrower. Post: old image retired, every live descriptor relocated.
Logical source identity is rebound to the preserved maximum record's new physical frame, invalidating old images."
  (ritira-indice-paginato-motore engine)
  (let ((buffer (motore-scratch engine)) (token (motore-source-token engine)) (live 0) (replacement (make-array 5 :element-type '(unsigned-byte 64))))
    (fill token 0) (b:scrivi-u64 token 0 (motore-version engine))
    (dolist (output (compaction-plan-outputs plan))
      (let ((end (compaction-output-end output)) (position f:+segment-header-bytes+) (id (compaction-output-id output)))
        (io:leggi-esatto (compaction-output-reader output) buffer 0 end 0)
        (loop while (< position end) do
          (multiple-value-bind (next kind flags ks ke) (arcdocdb.record:verifica-cornice buffer position end :version (motore-version engine))
            (declare (ignore flags))
            (let ((csn (b:leggi-u64 buffer (+ position arcdocdb.record::+stamp-offset+))))
              (when (= kind 1)
                (compaction-relocate-live engine buffer ks ke csn (logior (ash id 32) position) (- next position) replacement)
                (incf live))
              (when (= csn (compaction-plan-maximum plan))
                (b:scrivi-u64 token 8 id) (b:scrivi-u64 token 16 position) (b:scrivi-u64 token 24 (- next position))))
            (setf position next)))))
    (unless (= live (compaction-live-count engine)) (error 'invariant-violation :reason :engine-compaction-relocation-count)))
  (setf (motore-history-records engine) (compaction-plan-records plan)) nil)
