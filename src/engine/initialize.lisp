;;; OWNER: attore di startup, directory vuota posseduta ed esclusiva prima di ogni nuovo file.
;;; SHARED: nessuna pubblicazione runtime; i file mantengono i formati definitivi del prodotto.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-FOR-003 REQ-STO-003 REQ-AFF-008
(declaim (ftype (function (motore c:checkpoint-control) c:control-preparato) prepara-control-motore))
(defun prepara-control-motore (engine plan)
  "Pre: complete plan, control.log.tmp absent, exclusive namespace. Post: verified durable temporary.
Files registered for cleanup; atomicity point remains subsequent CONTROL publication."
  (let* ((append (output-motore engine "control.log.tmp")) (input (input-motore engine "control.log.tmp")))
    (c:prepara-checkpoint-control plan input append (motore-directory engine) (motore-scratch engine))))

;;; REQ: REQ-REC-001 REQ-FOR-001 REQ-AFF-001
(declaim (ftype (function (motore) null) inizializza-decisioni-motore))
(defun inizializza-decisioni-motore (engine)
  "Pre: new exclusive directory. Post: durable canonical decision-log header and completed name.
No DECISION or admission; creation atomicity at exclusive name, then parent fsync."
  (let ((append (output-motore engine "multiserie.log.tmp")) (buffer (motore-scratch engine)))
    (unless (= f:+log-header-bytes+
               (f:scrivi-header-log buffer 0 :multiserie (motore-archive-id engine)
                                   :version (motore-version engine)))
      (error 'invariant-violation :reason :engine-decision-header))
    (unless (= f:+log-header-bytes+ (io:append-esatto append buffer 0 f:+log-header-bytes+)
               (io:durable-flush append))
      (error 'invariant-violation :reason :engine-decision-durable))
    (io:pubblica-temporaneo (motore-directory engine) (input-motore engine "multiserie.log.tmp")
                           "multiserie.log.tmp" "multiserie.log")
    (io:durable-flush (motore-directory engine)))
  nil)

;;; REQ: REQ-REC-001 REQ-STO-003 REQ-FOR-003 REQ-AFF-001 REQ-AFF-008
(declaim (ftype (function (motore) null) inizializza-storage-motore))
(defun inizializza-storage-motore (engine)
  "Pre: explicit init and owned directory lock. Post: durable initial canonical files, admission closed.
Rejects nonempty directory before effects; neither initializes nor deletes preexisting storage.
Decision point: complete CONTROL publication; failures preserve prepared files without rollback."
  (unless (zerop (length (io:elenca-directory (motore-directory engine))))
    (error 'invalid-argument :reason :engine-initialization-not-empty))
  (let* ((prepared (prepara-active-motore engine 1))
         (payload (make-array f::+edit-min-bytes+ :element-type '(unsigned-byte 8) :initial-element 0)))
    (unless (= (length payload) (f:scrivi-valore-edit payload 0 2 1 (motore-empty engine) 0
                                                     (motore-empty engine) :completo t))
      (error 'invariant-violation :reason :engine-initial-edit))
    (inizializza-decisioni-motore engine)
    (prepara-control-motore engine (c:crea-checkpoint-control prepared payload 1))
    (io:pubblica-temporaneo (motore-directory engine) (input-motore engine "control.log.tmp")
                           "control.log.tmp" "control.log")
    (io:durable-flush (motore-directory engine)))
  (osserva-motore engine :storage-created)
  nil)

;;; REQ: REQ-REC-001 REQ-AFF-008 REQ-AFF-018
(declaim (ftype (function (motore u64) null) conserva-control-incompleto-motore))
(defun conserva-control-incompleto-motore (engine fresh-id)
  "Pre: verified authoritative old CONTROL, fresh ID reserved by new segment, lock owned.
Post: previous control.log.tmp preserved under distinct name, absent target verified.
No file deleted; relative rename followed by fsync, before new atomic checkpoint."
  (let ((names (io:elenca-directory (motore-directory engine)))
        (target (format nil "control.unpublished.~16,'0x.tmp" fresh-id)))
    (when (find "control.log.tmp" names :test #'string=)
      (when (find target names :test #'string=)
        (error 'invalid-argument :reason :engine-control-quarantine-collision))
      (input-motore engine "control.log.tmp")
      (io:rinomina-nella-directory (motore-directory engine) "control.log.tmp" target)
      (io:durable-flush (motore-directory engine))
      (osserva-motore engine :unpublished-control-preserved)))
  nil)
