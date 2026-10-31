;;; OWNER: startup prepara il runtime privato e rende ammissibile la Serie solo dopo indice/radice completi.
;;; SHARED: binding CSN/snapshot/EBR canonico gia' esistente, nessun secondo allocatore operativo.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-REC-001 REQ-STO-006 REQ-IDX-001 REQ-AFF-008 REQ-IDX-010
(declaim (ftype (function (motore c:control-recuperato simple-vector) simple-vector) mappe-motore))
(defun mappe-motore (engine control closed)
  "Pre: all sources already verified, before admission. Post: canonical recovery-view maps.
No FD opened or transferred; every map reads the same FD as the CLOSED proof."
  (let ((maps (make-array (length closed) :initial-element nil)))
    (dotimes (i (length closed) maps)
      (let* ((token (the rc:closed-recuperato (svref closed i)))
             (file (arcdocdb.recovery.closed::closed-recuperato-input token))
             (id (nth-value 0 (rc:frontiere-closed-recuperato token))))
        (setf (svref maps i)
              (if (motore-automatic-index engine) (make-automatic-closed-stub engine control token)
              (r:crea-mappa-segmento-get (motore-view engine) file (c:manifest-control-recuperato control)
               id (motore-scratch engine) :max-bytes (motore-max-file-bytes engine)
               :max-records (motore-max-records engine) :max-batches (motore-max-records engine)
               :max-batch-records (motore-max-records engine)
               :max-batch-bytes (motore-max-file-bytes engine))))))))

;;; REQ: REQ-REC-001 REQ-MVC-006 REQ-MVC-008 REQ-IDX-001 REQ-AFF-008
(declaim (ftype (function (motore rt:runtime-archivio a:segmento-attivo-preparato) null) adotta-active-motore))
(defun adotta-active-motore (engine runtime prepared)
  "Pre: checkpoint already decided, new header-only ACTIVE with completed name, current runtime scope.
Post: runtime wrapper of the same verified FD/log/association; unique controller and owner's lease.
Rebinding rereads canonical header; neither rewrites file nor reconstructs durability proof."
  (let* ((old (arcdocdb.active::segmento-attivo-preparato-segment prepared))
         (id (logior (ash (arcdocdb.get::segmento-get-high old) 32) (arcdocdb.get::segmento-get-low old)))
         (segment (g:crea-segmento-get (motore-view engine) (arcdocdb.get::segmento-get-file old)
                                     id (motore-scratch engine)))
         (wrapped (arcdocdb.active::%make-segmento-attivo-preparato
                    (a:log-segmento-attivo-preparato prepared) segment
                    (arcdocdb.active::segmento-attivo-preparato-association prepared)))
         (controller (rt:adotta-controllore-active runtime wrapped :capacity 8)))
    (setf (motore-active engine) wrapped (motore-controller engine) controller
          (motore-append engine) (arcdocdb.wal::log-io-file (a:log-segmento-attivo-preparato wrapped))
          (motore-lease engine) (s:acquisisci-controllore-serie controller)
          (motore-source engine) (a:crea-sorgente-get-preparata controller (motore-lease engine) wrapped
                                  :max-puts (motore-max-records engine)
                                  :batch-records 1 :batch-bytes (+ (motore-max-record-bytes engine) w::+seal-total+))
          (motore-batch engine) (w:crea-lotto :segment id :version (motore-version engine) :max-records 1
                                            :capacity (+ (motore-max-record-bytes engine) w::+seal-total+))
          (motore-group engine) (w:crea-gruppo (a:log-segmento-attivo-preparato wrapped) :max-lots 1))
    (gd:inizializza-fonti-get-attive (motore-source engine) (motore-lease engine) (motore-sources engine)))
  nil)

;;; REQ: REQ-REC-001 REQ-MVC-006 REQ-MVC-008 REQ-IDX-001 REQ-AFF-008
(declaim (ftype (function (motore dar:archivio-recovery c:control-recuperato simple-vector
                          ac:piano-csn-archivio a:segmento-attivo-preparato) null) adotta-runtime-motore))
(defun adotta-runtime-motore (engine archive control closed plan prepared)
  "Pre: complete checkpoint and names, final CSN gate; admission closed. Post: complete runtime/GET/index.
One operational registry at M, without increment; errors before READY do not return engine."
  (when (motore-automatic-index engine) (remove-automatic-orphans engine))
  (let* ((maps (mappe-motore engine control closed)) (runtime (rt:crea-runtime-archivio plan 1000000000 1000000
                                  :csn-capacity 16 :snapshot-capacity 4 :worker-capacity 1 :retirement-capacity 16)))
    (setf (motore-runtime engine) runtime (motore-registry engine) (rt:csn-runtime-archivio runtime)
          (motore-scope engine) (rt:ambito-runtime-archivio runtime)
          (motore-view engine) (g:crea-vista-get-serie (motore-scope engine) (unless (motore-automatic-index engine) (motore-index engine))
                   (motore-record-cache engine) (motore-series-id engine)
                   :lookup (lambda (key start end probe destination)
                             (sonda-indice-motore engine key start end probe destination))))
    (let ((directory (rt:adotta-directory-closed archive (motore-view engine) control closed maps
                      :max-segmenti (motore-max-segments engine)
                      :budget-payload (* 128 (motore-max-segments engine)))))
      (setf (motore-sources engine) (gd:crea-fonti-get-serie directory)))
    (ricostruisci-indice-motore engine closed (limiti-motore engine))
    (adotta-active-motore engine runtime prepared)
    (setf (motore-get-context engine)
          (g:crea-contesto-get (motore-scope engine) 0 :record-bytes (motore-max-record-bytes engine)
                              :budget-payload (+ 1024 (motore-max-record-bytes engine)))))
  (when (motore-automatic-index engine)
    (return-automatic-resident engine t))
  (unless (motore-automatic-index engine) (recupera-indice-paginato-motore engine))
  (let ((source (fonte-canonica-indice-motore engine))
        (revision (when (motore-index engine) (p::indice-primario-revision (motore-index engine))))
        (stamp (when (motore-automatic-index engine) (automatic-startup-stamp engine))))
    (osserva-motore engine :before-admission)
    (if (motore-automatic-index engine)
        (unless (and (eq (motore-state engine) :recovering)
                     (equal stamp (automatic-startup-stamp engine))
                     (arcdocdb.index.page::stessa-fonte-indice-p source (fonte-canonica-indice-motore engine)))
          (error 'invariant-violation :reason :engine-auto-startup-source))
        (verifica-fonte-startup-indice engine source revision))
    (setf (motore-state engine) :ready))
  nil)
