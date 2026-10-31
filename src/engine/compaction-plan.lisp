;;; OWNER: read-only planning inside serial maintenance, before any canonical output creation.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CMP-001 REQ-REC-001 REQ-AFF-002
(declaim (ftype (function (motore dar:decisioni-recuperate ac:insieme-serie-recovery) compaction-plan) compaction-read-plan))
(defun compaction-read-plan (engine decisions set)
  "Pre: BUSY current-only M1, strong frontier. Post: verified complete source plan, live bytes and output geometry.
Selection consults the existing current index with borrowed key spans; no full key table or record list."
  (multiple-value-bind (control sources active closed csns) (recupera-fonti-motore engine decisions set)
    (verifica-ordine-fonti-motore engine control sources decisions closed)
    (verifica-csn-rotazione-motore engine csns)
    (unless (and (eq :complete (nth-value 2 (ra:frontiere-active-recuperato active)))
                 (= (nth-value 1 (ra:frontiere-active-recuperato active))
                    (io:posizione-scritta (motore-append engine)) (io:posizione-durevole (motore-append engine))))
      (error 'invariant-violation :reason :engine-compaction-active-frontier))
    (let ((plan (make-compaction-plan control sources active closed (nth-value 1 (ac:massimo-csn-archivio csns))))
          (records 0))
      (setf (compaction-plan-input-bytes plan)
            (+ (nth-value 1 (ra:frontiere-active-recuperato active))
               (loop for token across closed sum (nth-value 1 (rc:frontiere-closed-recuperato token)))))
      (compaction-visit engine plan
        (lambda (buffer start end segment offset version)
          (declare (ignore version)) (incf records)
          (when (compaction-selected-p engine plan buffer start end segment offset)
            (compaction-plan-record engine plan (- end start)))))
      (unless (= records (motore-history-records engine))
        (error 'invariant-violation :reason :engine-compaction-history-count))
      plan)))

;;; REQ: REQ-CMP-001 REQ-AFF-004
(declaim (ftype (function (motore list list) null) compaction-release-probe))
(defun compaction-release-probe (engine old-files old-sets)
  "Pre: planning skipped with no outputs/effects. Post: only newly acquired readonly capabilities retired.
Consumption precedes close; failures are preserved and fault the maintenance boundary."
  (let ((previous (motore-cleanup-failures engine)))
    (loop until (eq (motore-recovery-sets engine) old-sets) do
      (unless (motore-recovery-sets engine) (error 'invariant-violation :reason :engine-compaction-set-marker))
      (let ((set (pop (motore-recovery-sets engine))))
        (tenta-cleanup-motore engine (lambda () (mf:chiudi-fonti-recovery set)))))
    (loop until (eq (motore-fds engine) old-files) do
      (unless (motore-fds engine) (error 'invariant-violation :reason :engine-compaction-file-marker))
      (let ((file (pop (motore-fds engine)))) (tenta-cleanup-motore engine (lambda () (io:chiudi file)))))
    (unless (eq previous (motore-cleanup-failures engine))
      (error 'errore-cleanup-motore :reason :engine-compaction-probe-cleanup :primary nil
             :errors (reverse (copy-list (motore-cleanup-failures engine)))))) nil)

;;; REQ: REQ-CMP-007 REQ-MVC-007 REQ-AFF-008
(declaim (ftype (function (motore) null) compaction-require-quiescent))
(defun compaction-require-quiescent (engine)
  "Pre: READY M1 owner before resources. Post: one reader slot, no active pin/snapshot or retirement obligation.
This current-only algorithm never silently reclaims historical versions when a borrowed snapshot exists."
  (let* ((runtime (motore-runtime engine)) (epochs (rt:epoche-runtime-archivio runtime))
         (snapshots (rt:snapshot-runtime-archivio runtime)))
    (unless (= 1 (length (arcdocdb.epochs::registro-epoche-readers epochs)))
      (error 'invalid-argument :reason :engine-compaction-concurrent-profile))
    (unless (and (zerop (nth-value 0 (arcdocdb.mvcc:leggi-registro-snapshot snapshots)))
                 (not (arcdocdb.epochs:epoca-attiva-p (arcdocdb.epochs:contesto-epoca epochs 0)))
                 (zerop (nth-value 2 (arcdocdb.epochs:leggi-registro-epoche epochs)))
                 (zerop (nth-value 3 (arcdocdb.epochs:leggi-registro-epoche epochs))))
      (error 'resource-exhausted :reason :engine-compaction-borrowers))) nil)
