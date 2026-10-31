;;;; Query e cleanup limitato: tutte le capacità acquisite ricevono un tentativo di close.
;;; OWNER: set e close esclusivi; query/letture soltanto prima della chiusura.
;;; SHARED: nessuna mutazione fra Serie, nessuna chiusura del parent prestato.
(in-package #:arcdocdb.recovery.manifest)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-REC-001 REQ-REC-004 REQ-AFF-004
(declaim (ftype (function (recovery-sources)
                         (values (or null arcdocdb.conditions:io-fault) index &optional))
                cleanup-fonti-recovery))
(defun cleanup-fonti-recovery (sources)
  "Pre: no reader or asynchronous cancellation; entries may be partial. Post: set closed, all attempted.
Returns first IO-FAULT and total count; second call is a no-op, no retry or hidden error."
  (let ((first-error nil) (failures 0))
    (unless (%rss-closed sources)
      (setf (%rss-closed sources) t)
      (let ((entries (%rss-entries sources)))
        (dotimes (i (length entries))
          (let ((file (%rs-file (the recovery-source (aref entries i)))))
            (when file
              (handler-case (arcdocdb.io:chiudi file)
                (arcdocdb.conditions:io-fault (condition)
                  (unless first-error (setf first-error condition))
                  (incf failures))))))))
    (values first-error failures)))

;;; REQ: REQ-REC-001 REQ-REC-004 REQ-AFF-004
(declaim (ftype (function (recovery-sources) null) chiudi-fonti-recovery))
(defun chiudi-fonti-recovery (sources)
  "Pre: exclusive owner, all readers finished. Post: all children closed once, parent intact.
RECOVERY-SOURCES-CLEANUP-ERROR after all attempts; primary condition NIL. Repetition idempotent."
  (multiple-value-bind (cleanup count) (cleanup-fonti-recovery sources)
    (when cleanup
      (error 'recovery-sources-cleanup-error :reason :recovery-sources-cleanup
             :primary nil :cleanup cleanup :count count)))
  nil)

;;; REQ: REQ-REC-001 REQ-REC-004 REQ-AFF-008
(declaim (ftype (function (recovery-sources) (values index &optional)) numero-fonti-recovery))
(defun numero-fonti-recovery (sources)
  "Pre: published set, even if closed. Post: immutable cardinality, no capability exposed."
  (length (%rss-entries sources)))

;;; REQ: REQ-REC-001 REQ-REC-004 REQ-AFF-008
(declaim (ftype (function (recovery-sources integer)
                         (values u64 (member :active :closed) (member :final :temporary)
                                 arcdocdb.io:file-io index &optional)) fonte-recovery))
(defun fonte-recovery (sources position)
  "Pre: open set, valid index, and no concurrent close. Post: ID/state/form/borrowed child/EOF.
INVALID-ARGUMENT for closed set or index; IO-FAULT for closed child; internal guard if absent.
The caller does not close the child: finish readers and close the entire set. No byte validation."
  (when (%rss-closed sources) (error 'invalid-argument :reason :recovery-sources-closed))
  (unless (<= 0 position (1- (numero-fonti-recovery sources)))
    (error 'invalid-argument :reason :recovery-sources-index))
  (let* ((entry (the recovery-source (aref (%rss-entries sources) position)))
         (file (%rs-file entry)))
    (unless file (error 'invariant-violation :reason :recovery-source-unopened))
    (arcdocdb.io::esigi-aperto file :input)
    (values (%rs-id entry) (%rs-state entry) (%rs-form entry) file (%rs-size entry))))
