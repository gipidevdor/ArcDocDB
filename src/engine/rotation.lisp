;;; OWNER: serial M1 actor; quiescent GET and completed strong commits before maintenance.
;;; SHARED: existing CSN/snapshot/epoch family is retained; no new allocator or cross-Serie lock.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-STO-002 REQ-STO-003 REQ-LIM-003
(declaim (ftype (function (motore index) boolean) preflight-rotazione-motore))
(defun preflight-rotazione-motore (engine record-bytes)
  "Pre: READY owner and valid input, before CSN or namespace effects. Post: rotation needed or NIL.
A known segment-count limit refuses with READY and unchanged canonical bytes. No best-effort retry."
  (flet ((needed ()
           (or (>= (r::radice-get-attiva-count (s:leggi-radice-serie (motore-controller engine))) (motore-max-records engine))
               (> (+ (io:posizione-scritta (motore-append engine)) record-bytes w::+seal-total+) (motore-max-file-bytes engine)))))
    (when (needed)
      (let* ((closed (gd:conta-segmenti-directory-get (gd::fonti-get-serie-directory (motore-sources engine))))
             (full (>= (1+ closed) (motore-max-segments engine))))
        (when (or full (and (>= closed 4) (> (motore-history-records engine) (* 2 (compaction-live-count engine)))))
          (compatta-motore engine :force full))
        (when (and (needed) (>= (1+ (gd:conta-segmenti-directory-get
                                       (gd::fonti-get-serie-directory (motore-sources engine)))) (motore-max-segments engine)))
          (error 'resource-exhausted :reason :engine-rotation-segment-budget))))
    (not (null (needed)))))

;;; REQ: REQ-REC-001 REQ-MVC-005 REQ-MVC-006 REQ-AFF-002
(declaim (ftype (function (motore ac:piano-csn-archivio) null) verifica-csn-rotazione-motore))
(defun verifica-csn-rotazione-motore (engine plan)
  "Pre: full canonical scan while serial admission is BUSY. Post: replay maximum equals allocated/visible CSN.
No counter reset, replacement registry, new token or inference from a filename."
  (multiple-value-bind (high low) (ac:parole-base-csn-archivio plan)
    (unless (equal (list high low high low)
                   (multiple-value-list (arcdocdb.csn:leggi-frontiere-csn (motore-registry engine))))
      (error 'invariant-violation :reason :engine-rotation-csn)))
  nil)

;;; REQ: REQ-STO-003 REQ-IDX-001 REQ-AFF-004 REQ-CON-002
(declaim (ftype (function (motore c:control-recuperato simple-vector) null) adotta-fonti-rotazione-motore))
(defun adotta-fonti-rotazione-motore (engine control closed)
  "Pre: complete post-checkpoint canonical gate, BUSY single actor, no GET borrower. Post: new CLOSED directory.
Existing primary descriptors remain valid; automatic resolver's old borrowed rows are invalidated."
  (rc:verifica-closed-completi control closed :max-segmenti (motore-max-segments engine))
  (let* ((maps (mappe-motore engine control closed))
         (directory (gd:crea-directory-get-serie (motore-view engine) maps
                      :max-segments (motore-max-segments engine) :budget-payload (* 128 (motore-max-segments engine)))))
    (setf (motore-sources engine) (gd:crea-fonti-get-serie directory)))
  (when (motore-automatic-index engine)
    (setf (automatic-index-controller-map (motore-automatic-index engine)) nil
          (automatic-index-controller-map-source (motore-automatic-index engine)) nil))
  (setf (motore-get-context engine)
        (g:crea-contesto-get (motore-scope engine) 0 :record-bytes (motore-max-record-bytes engine)
                           :budget-payload (+ 1024 (motore-max-record-bytes engine))))
  nil)

;;; REQ: REQ-AFF-004 REQ-STO-003 REQ-LIM-003
(declaim (ftype (function (motore t) null) ritira-risorse-rotazione-motore))
(defun ritira-risorse-rotazione-motore (engine current-set)
  "Pre: new sources/controller installed, no borrowed old roots. Post: one source set and current writer retained.
All retired capabilities consumed before close; secondary failures fault the enclosing write without retry."
  (let* ((reader (g::segmento-get-file (a::segmento-attivo-preparato-segment (motore-active engine))))
         (keep (list (motore-directory engine) (motore-append engine) reader))
         (files (motore-fds engine)) (sets (motore-recovery-sets engine))
         (previous (motore-cleanup-failures engine)))
    (setf (motore-fds engine) keep (motore-recovery-sets engine) (list current-set))
    (dolist (set sets)
      (unless (eq set current-set) (tenta-cleanup-motore engine (lambda () (mf:chiudi-fonti-recovery set)))))
    (dolist (file files)
      (unless (member file keep :test #'eq) (tenta-cleanup-motore engine (lambda () (io:chiudi file)))))
    (unless (eq previous (motore-cleanup-failures engine))
      (error 'errore-cleanup-motore :reason :engine-rotation-cleanup :primary nil
             :errors (reverse (copy-list (motore-cleanup-failures engine))))))
  nil)

;;; REQ: REQ-STO-002 REQ-STO-003 REQ-STO-004 REQ-REC-001 REQ-MVC-006 REQ-AFF-018
(declaim (ftype (function (motore) null) ruota-segmento-motore))
(defun ruota-segmento-motore (engine)
  "Pre: BUSY serial owner, clean writer batch, no CSN reserved for the next request. Post: fresh canonical ACTIVE.
Existing recovery/checkpoint publishers verify all bytes and decide CONTROL before new writer publication.
Old ACTIVE is never appended again; registry, scope, index and logical source token retain their identities.
All errors/nonlocal exits fault the enclosing request; recovery resolves completed durable effects."
  (unless (and (motore-busy engine) (eq (motore-state engine) :ready))
    (error 'invariant-violation :reason :engine-rotation-admission))
  (osserva-motore engine :rotation-starting)
  (let* ((archive (dar:crea-archivio-recovery (motore-scope engine) (motore-archive-id engine)))
         (decisions (leggi-decisioni-motore engine archive))
         (set (ac:crea-insieme-serie-recovery archive (motore-view engine) (vector (motore-view engine))
                                             :max-series 1 :budget-riferimenti 8)))
    (multiple-value-bind (control sources active closed plan) (recupera-fonti-motore engine decisions set)
      (verifica-ordine-fonti-motore engine control sources decisions closed)
      (verifica-csn-rotazione-motore engine plan)
      (unless (and (eq :complete (nth-value 2 (ra:frontiere-active-recuperato active)))
                   (= (nth-value 1 (ra:frontiere-active-recuperato active))
                      (io:posizione-durevole (motore-append engine))
                      (io:posizione-scritta (motore-append engine))))
        (error 'invariant-violation :reason :engine-rotation-frontier))
      (let ((prepared (checkpoint-motore engine active (verifica-inventario-motore engine control))))
        (multiple-value-bind (current current-sources current-active current-closed current-plan)
            (recupera-fonti-motore engine decisions set)
          (verifica-csn-rotazione-motore engine current-plan)
          (rs:stabilizza-nomi-serie-recuperata (motore-directory engine) current-sources current-active current-closed
                                            :max-segmenti (motore-max-segments engine))
          (osserva-motore engine :rotation-canonical-ready)
          (adotta-fonti-rotazione-motore engine current current-closed)
          (s:rilascia-controllore-serie (motore-controller engine) (motore-lease engine))
          (setf (motore-lease engine) nil)
          (adotta-active-motore engine (motore-runtime engine) prepared)
          (ritira-risorse-rotazione-motore engine current-sources)
          (osserva-motore engine :rotation-ready)))))
  nil)
