;;; OWNER: exclusive directory actor; canonical files cannot satisfy the removal namespace.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-013 REQ-AFF-004
(declaim (ftype (function (motore d:disk-index) null) retire-automatic-disk))
(defun retire-automatic-disk (engine tree)
  "Pre: no borrower, unpublished or retired derived root. Post: unlink and both closes attempted.
All failures retained; removal uses positive inode proof, never a pathname-only deletion."
  (let ((previous (motore-cleanup-failures engine)))
    (tenta-cleanup-motore engine
      (lambda () (io:rimuovi-derivato
                   (io:prova-derivato-rimovibile (motore-directory engine) (d::disk-index-input tree)
                                                (d:disk-index-name tree)))))
    (tenta-cleanup-motore engine (lambda () (d:close-disk-index tree)))
    (unless (eq previous (motore-cleanup-failures engine))
      (error 'errore-cleanup-motore :reason :engine-auto-cleanup :primary nil
             :errors (reverse (copy-list (motore-cleanup-failures engine))))))
  nil)

;;; REQ: REQ-IDX-013 REQ-REC-001
(declaim (ftype (function (motore) null) remove-automatic-orphans))
(defun remove-automatic-orphans (engine)
  "Pre: canonical recovery gate passed, exclusive private namespace, no automatic root adopted.
Post: only reserved derived leaves removed by inode proofs; malformed canonical names never authorize removal."
  (unless (and (motore-automatic-index engine) (eq (motore-state engine) :recovering))
    (error 'invariant-violation :reason :engine-auto-orphan-admission))
  (loop for name across (io:elenca-directory (motore-directory engine)) do
    (when (io:nome-derivato-automatico-p name)
      (let ((input (io:apri-lettura-nella-directory (motore-directory engine) name :max-file-bytes (1- (ash 1 60)))))
        (unwind-protect (io:rimuovi-derivato (io:prova-derivato-rimovibile (motore-directory engine) input name))
          (io:chiudi input)))))
  nil)

;;; REQ: REQ-IDX-013 REQ-LIM-003
(declaim (ftype (function (motore) d:disk-index) make-automatic-disk))
(defun make-automatic-disk (engine)
  "Pre: fixed cache reservation and exclusive directory. Post: fresh generation, never reused while live.
Counter exhaustion rejects before namespace effects; files remain disposable derivatives."
  (let* ((auto (motore-automatic-index engine)) (policy (automatic-index-controller-policy auto)))
    (when (>= (automatic-index-controller-ordinal auto) (1- (ash 1 60)))
      (error 'resource-exhausted :reason :engine-auto-generation))
    (let* ((id (incf (automatic-index-controller-ordinal auto))) (name (string-downcase (format nil "autoindex-~16,'0X.tmp" id))))
      (d:create-disk-index (motore-directory engine) name id (motore-archive-id engine) (motore-series-id engine)
        (automatic-index-controller-high auto) (automatic-index-controller-low auto)
        :page-size (politica-indice-automatico-size policy) :frames (politica-indice-automatico-frames policy)
        :memory-budget (automatic-index-controller-budget auto) :max-bytes (politica-indice-automatico-max-bytes policy)))))

;;; REQ: REQ-IDX-013 REQ-IDX-008
(declaim (ftype (function (motore) null) compact-automatic-disk))
(defun compact-automatic-disk (engine)
  "Pre: serial maintenance admission, two fixed caches reserved. Post: verified live-only replacement.
Source remains authoritative until publication; incomplete destination is removed and all handles closed."
  (let* ((auto (motore-automatic-index engine)) (old (automatic-index-controller-disk auto))
         (source-root (when old (d:disk-index-root old))) (source-frontier (when old (d:disk-index-frontier old)))
         (new nil) (published nil))
    (unless old (error 'invariant-violation :reason :engine-auto-compaction-source))
    (unwind-protect
         (progn (setf new (make-automatic-disk engine))
           (osserva-motore engine :auto-compact-created)
           (d:copy-disk-index old new)
           (osserva-motore engine :auto-compact-copied)
           (unless (and (eq old (automatic-index-controller-disk auto)) (= (d:disk-index-count new) (automatic-index-controller-count auto)))
             (error 'invariant-violation :reason :engine-auto-compaction-source-changed))
           (require-automatic-admission engine)
           (unless (and (= source-root (d:disk-index-root old)) (= source-frontier (d:disk-index-frontier old)))
             (error 'invariant-violation :reason :engine-auto-compaction-source-changed))
           (setf (automatic-index-controller-disk auto) new published t)
           (finish-automatic-retirement engine old :auto-compact-published))
      (when (and new (not published))
        (tenta-cleanup-motore engine (lambda () (retire-automatic-disk engine new))))))
  nil)

;;; REQ: REQ-IDX-013 REQ-LIM-003
(declaim (ftype (function (motore) null) reserve-automatic-disk))
(defun reserve-automatic-disk (engine)
  "Pre: paged root, no data CSN taken. Post: mutation reservation, after bounded compaction if needed.
Configured disk exhaustion propagates before the data commit; no retry of the canonical write."
  (let* ((auto (motore-automatic-index engine)) (tree (automatic-index-controller-disk auto))
         (maximum (politica-indice-automatico-max-bytes (automatic-index-controller-policy auto))))
    (when (or (> (d:disk-index-frontier tree) (max 4194304 (* 4 (d:disk-index-live-bytes tree))))
              (> (+ (d:disk-index-frontier tree) (d:disk-index-batch-limit)) maximum))
      (compact-automatic-disk engine))
    (d:reserve-disk-index (automatic-index-controller-disk auto)))
  nil)

;;; REQ: REQ-IDX-013 REQ-AFF-008
(declaim (ftype (function (motore) null) require-automatic-admission))
(defun require-automatic-admission (engine)
  "Pre: maintenance owner, observer may have returned. Post: unchanged valid admission and healthy runtime.
A callback cannot publish a root after closing or corrupting the owning request."
  (esigi-owner-motore engine)
  (unless (or (eq (motore-state engine) :recovering)
              (and (eq (motore-state engine) :ready) (motore-busy engine)
                   (eq :healthy (s:stato-controllore-serie (motore-controller engine)))))
    (error 'invariant-violation :reason :engine-auto-admission))
  nil)

;;; REQ: REQ-IDX-013 REQ-AFF-004
(declaim (ftype (function (motore d:disk-index keyword) null) finish-automatic-retirement))
(defun finish-automatic-retirement (engine old phase)
  "Pre: new root already published, OLD no longer tracked by the engine. Post: retired source always consumed.
Even a nonlocal observer exit unlinks/closes OLD; primary exit is preserved and cleanup failures are retained."
  (let ((complete nil))
    (unwind-protect
         (progn (osserva-motore engine phase) (setf complete t))
      (if complete (retire-automatic-disk engine old)
          (tenta-cleanup-motore engine (lambda () (retire-automatic-disk engine old))))))
  nil)

;;; REQ: REQ-IDX-013 REQ-AFF-008
(declaim (ftype (function (motore) null) reserve-automatic-transition))
(defun reserve-automatic-transition (engine)
  "Pre: serial maintenance before publishing a mode change. Post: one bounded counter increment cannot wrap.
Exhaustion rejects before migration effects; the caller owns incomplete-operation fail-stop."
  (require-automatic-admission engine)
  (when (= (automatic-index-controller-transitions (motore-automatic-index engine)) most-positive-fixnum)
    (error 'resource-exhausted :reason :engine-auto-transition-exhausted))
  nil)
