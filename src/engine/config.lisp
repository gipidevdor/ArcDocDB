;;; OWNER: configurazione privata prima dell'apertura; seed e UUID espliciti, nessun valore dal nome del path.
;;; SHARED: solo il runtime finale pubblichera' il registro CSN canonico a recovery concluso.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-LIM-003 REQ-AFF-008 REQ-IDX-010
(declaim (ftype (function (octets octets t t t t t t t) null) verifica-configurazione-motore))
(defun verifica-configurazione-motore (archive-id series-id version clock observer bytes records segments frame)
  "Pre: caller configuration before I/O. Post: consistent UUIDs and finite budgets, injectable clock.
INVALID-ARGUMENT before resources/effects; M1 uses the same canonical v1/v2 format."
  (unless (and (= (length archive-id) 16) (= (length series-id) 16) (member version '(1 2))
               (functionp clock) (typep observer '(or null function)))
    (error 'invalid-argument :reason :engine-configuration))
  (unless (and (typep bytes '(integer 4096 268435456))
               (typep records '(integer 1 65536)) (typep segments '(integer 2 65536))
               (typep frame '(integer 64 16777216)) (<= (+ frame w::+seal-total+ f:+segment-header-bytes+) bytes))
    (error 'invalid-argument :reason :engine-budgets))
  nil)

;;; REQ: REQ-REC-001 REQ-IDX-001 REQ-MVC-008 REQ-AFF-008
(declaim (ftype (function (motore index index u32 u32) null) prepara-ispezione-motore))
(defun prepara-ispezione-motore (engine capacity arena seed-high seed-low)
  "Pre: valid configuration, no I/O. Post: candidate index and read-only recovery view, no writer.
Zero CSN in the inspection-only context is not operational; the final one derives from the complete gate.
Factory errors before opening; no admission or seed derived from unverified input."
  (b:scrivi-u64 (motore-source-token engine) 0 (motore-version engine))
  (let* ((registry (arcdocdb.csn:crea-registro-csn :capacity 16))
         (snapshots (arcdocdb.mvcc:crea-registro-snapshot registry 4 1000000000 1000000))
         (epochs (arcdocdb.epochs:crea-registro-epoche 1 16))
         (scope (g:crea-ambito-get epochs snapshots)))
    (setf (motore-index engine)
          (if (motore-automatic-index engine) (make-automatic-resident (motore-automatic-index engine))
          (p:crea-indice-primario :capacity capacity :arena-bytes arena :max-depth 1
             :directory-budget-bytes 4096 :fragment-budget-bytes (+ 4096 arena (* 256 capacity))
             :hash-seed-high seed-high :hash-seed-low seed-low))
          (motore-index-context engine) (p:crea-contesto-indice)
          (motore-scope engine) scope
          (motore-view engine) (g:crea-vista-get-serie scope (unless (motore-automatic-index engine) (motore-index engine)) nil (motore-series-id engine)
            :lookup (when (motore-automatic-index engine)
              (lambda (key start end probe output) (sonda-indice-motore engine key start end probe output))))))
  (when (motore-automatic-index engine)
    (setf (automatic-index-controller-resident-charge (motore-automatic-index engine))
          (automatic-resident-charge (motore-index engine))))
  nil)
