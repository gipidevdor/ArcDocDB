;;; OWNER: one serial maintenance admission, synchronous bounded copy and no hidden request retry.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CMP-001 REQ-LIM-003
(declaim (ftype (function (motore boolean) list) compaction-run))
(defun compaction-run (engine force)
  "Pre: BUSY ready owner. Post: skipped without canonical effects or a fully installed smaller prefix.
A spare segment is reserved for the next recovery; output ID arithmetic is checked before creating files."
  (let* ((old-files (motore-fds engine)) (old-sets (motore-recovery-sets engine))
         (archive (dar:crea-archivio-recovery (motore-scope engine) (motore-archive-id engine)))
         (decisions (leggi-decisioni-motore engine archive))
         (set (ac:crea-insieme-serie-recovery archive (motore-view engine) (vector (motore-view engine)) :max-series 1 :budget-riferimenti 8))
         (plan (compaction-read-plan engine decisions set)))
    (unless (and (<= (+ 2 (compaction-plan-output-count plan)) (motore-max-segments engine))
                 (or force (<= (* 4 (+ f:+segment-header-bytes+ (compaction-plan-output-bytes plan)))
                               (* 3 (compaction-plan-input-bytes plan)))))
      (compaction-release-probe engine old-files old-sets)
      (return-from compaction-run (list :status :skipped :reason :insufficient-gain-or-capacity)))
    (let ((first (verifica-inventario-motore engine (compaction-plan-control plan))))
      (compaction-reserve-recovery engine plan first)
      (setf (compaction-plan-first-id plan) first))
    (osserva-motore engine :compaction-planned)
    (compaction-produce engine plan) (osserva-motore engine :compaction-produced)
    (compaction-verify-outputs engine plan) (osserva-motore engine :compaction-verified)
    (compaction-install engine plan decisions set)
    (let ((reclaimed (- (compaction-plan-input-bytes plan) (compaction-plan-output-bytes plan) f:+segment-header-bytes+)))
      (setf (motore-compactions engine) (min most-positive-fixnum (1+ (motore-compactions engine)))
            (motore-compaction-reclaimed engine) (min #xffffffffffffffff (+ (motore-compaction-reclaimed engine) (max 0 reclaimed))))
      (list :status :compacted :input-bytes (compaction-plan-input-bytes plan) :output-bytes (compaction-plan-output-bytes plan)
            :reclaimed-bytes reclaimed :records (compaction-plan-records plan)
            :output-segments (compaction-plan-output-count plan)))))

;;; REQ: REQ-CMP-001 REQ-CMP-007 REQ-AFF-004 REQ-CON-002
(declaim (ftype (function (motore &key (:force t)) list) compatta-motore))
(defun compatta-motore (engine &key (force nil))
  "Pre: READY owner, ordinary serial current-only M1; optional boolean force only changes the gain threshold.
Post: exact current values/CSNs, canonical compaction and physical reclaim or read-only skip. No data CSN allocated.
RAM/paged choice stays internal. Failure faults admission without ACK, rollback or retry."
  (esigi-motore-pronto engine)
  (compaction-require-quiescent engine)
  (unless (typep force 'boolean) (error 'invalid-argument :reason :engine-compaction-force))
  (let ((complete nil) (cause nil))
    (setf (motore-busy engine) t)
    (unwind-protect
         (handler-case
             (multiple-value-prog1 (compaction-run engine force) (setf complete t))
           (error (condition) (setf cause condition)
             (handler-case (guasta-motore engine condition) (error (cleanup) (push cleanup (motore-cleanup-failures engine))))
             (error condition)))
      (unwind-protect
          (unless (or complete cause)
        (handler-case (guasta-motore engine (make-condition 'invariant-violation :reason :engine-compaction-unwind))
          (error (cleanup) (push cleanup (motore-cleanup-failures engine)))))
      (setf (motore-busy engine) nil)))))

;;; REQ: REQ-CMP-001 REQ-CMP-007 REQ-LIM-003
(declaim (ftype (function (motore) list) statistiche-compattazione-motore))
(defun statistiche-compattazione-motore (engine)
  "Pre: READY owner. Post: copied scalar maintenance counters, not a process-RSS or throughput claim."
  (esigi-motore-pronto engine)
  (list :compactions (motore-compactions engine) :reclaimed-bytes (motore-compaction-reclaimed engine)
        :canonical-records (motore-history-records engine) :live-records (compaction-live-count engine)))
