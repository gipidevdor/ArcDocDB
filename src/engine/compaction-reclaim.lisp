;;; OWNER: exclusive serial quiescence/bootstrap, authority from the current verified REMOVED set.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CMP-007 REQ-AFF-004
(declaim (ftype (function (motore io:file-io) null) compaction-close-file))
(defun compaction-close-file (engine file)
  "Pre: owned explicit capability, no borrower. Post: ownership consumed before the single close attempt."
  (setf (motore-fds engine) (delete file (motore-fds engine) :test #'eq)) (io:chiudi file) nil)

;;; REQ: REQ-CMP-007 REQ-AFF-018 REQ-AFF-002
(declaim (ftype (function (motore c:control-recuperato) null) compaction-reclaim-removed))
(defun compaction-reclaim-removed (engine control)
  "Pre: durable CONTROL, serial no-reader point/bootstrap and exclusive parent. Post: only positively REMOVED leaves reclaimed.
Header UUID/ID and inode binding verified per leaf, no pathname-only unlink; absence never authorizes a live deletion."
  (let* ((manifest (c:manifest-control-recuperato control))
         (ids (compaction-table-ids (mf::%manifest-removed manifest) (* 2 (motore-max-segments engine))))
         (names (io:elenca-directory (motore-directory engine))))
    (when (plusp (length ids))
      (osserva-motore engine :compaction-reclaiming)
      (loop for id across ids do
        (unless (eq :removed (mf:trova-segmento manifest id)) (error 'invariant-violation :reason :engine-compaction-reclaim-authority))
        (let* ((final (nome-segmento-motore id :final)) (temporary (nome-segmento-motore id :temporary))
               (has-final (find final names :test #'string=)) (has-temporary (find temporary names :test #'string=)))
          (when (and has-final has-temporary) (error 'corruption-detected :reason :engine-compaction-removed-name-conflict))
          (when (or has-final has-temporary)
            (let* ((name (if has-final final temporary)) (file (input-motore engine name)))
              (g:crea-segmento-get (motore-view engine) file id (motore-scratch engine))
              (io:rimuovi-segmento (io:prova-segmento-rimovibile (motore-directory engine) file name id))
              (osserva-motore engine :compaction-unlinked)
              (compaction-close-file engine file)))))
      (io:durable-flush (motore-directory engine))
      (osserva-motore engine :compaction-reclaimed))) nil)

;;; REQ: REQ-CMP-007 REQ-AFF-018 REQ-FOR-003
(declaim (ftype (function (motore a:segmento-attivo-preparato c:control-recuperato) null) compaction-prune-removed))
(defun compaction-prune-removed (engine active control)
  "Pre: all REMOVED leaves absent and parent synchronized, fresh header-only ACTIVE. Post: bounded live-only CONTROL.
High-water retained; dropping deletion metadata cannot permit ID reuse or change live membership."
  (let ((manifest (c:manifest-control-recuperato control)))
    (when (plusp (mf:numero-segmenti-rimossi manifest))
      (let* ((ids (compaction-table-ids (mf::%manifest-closed manifest) (motore-max-segments engine)))
             (ends (make-array (length ids) :element-type '(unsigned-byte 64)))
             (empty (make-array 0 :element-type '(unsigned-byte 64))))
        (dotimes (n (length ids))
          (multiple-value-bind (state end outcomes) (mf:trova-segmento manifest (aref ids n))
            (unless (and (eq state :closed) (zerop outcomes)) (error 'unsupported-format :reason :engine-compaction-prune-outcomes))
            (setf (aref ends n) end)))
        (io:durable-flush (motore-directory engine))
        (compaction-publish-control engine control active ids ends empty :prune)))) nil)

;;; REQ: REQ-CMP-007 REQ-AFF-004
(declaim (ftype (function (motore) null) compaction-retire-source-sets))
(defun compaction-retire-source-sets (engine)
  "Pre: CONTROL replacement durable, no GET borrower, output verification complete. Post: old canonical readers closed.
Closing before acquiring replacement sources bounds descriptor peak independently of dead history."
  (let ((sets (motore-recovery-sets engine)) (previous (motore-cleanup-failures engine)))
    (setf (motore-recovery-sets engine) nil)
    (dolist (set sets) (tenta-cleanup-motore engine (lambda () (mf:chiudi-fonti-recovery set))))
    (unless (eq previous (motore-cleanup-failures engine))
      (error 'errore-cleanup-motore :reason :engine-compaction-source-close :primary nil
             :errors (reverse (copy-list (motore-cleanup-failures engine)))))) nil)
