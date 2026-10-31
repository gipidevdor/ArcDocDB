;;; OWNER: writer con lease alloca il delta e lo adotta nel ring prima dell'I/O.
;;; SHARED: CAS/ring del controller esistente; nessuna modifica a worker, scheduler o WAL.
(in-package #:arcdocdb.get.resolver)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-008 REQ-IDX-001
(declaim (ftype (function (integer integer integer integer integer) null) verifica-budget-attivo))
(defun verifica-budget-attivo (pages puts records bytes budget)
  "Pre: explicit configuration before tasks. Post: finite representable budgets.
INVALID-ARGUMENT before creating capabilities or arrays; does not change document limits."
  (unless (and (<= 1 pages +active-max-pages+) (<= 1 puts #xffffffff)
               (<= 1 records arcdocdb.wal::+max-lotto-records+)
               (<= arcdocdb.wal::+seal-total+ bytes arcdocdb.wal::+max-lotto-bytes+)
               (<= 0 budget most-positive-fixnum))
    (error 'invalid-argument :reason :active-configuration))
  nil)

;;; REQ: REQ-WAL-006 REQ-FOR-001 REQ-AFF-008
(declaim (ftype (function (controllore-serie t segmento-get
                         &key (:max-pages integer) (:max-puts integer) (:batch-records integer)
                              (:batch-bytes integer) (:budget-payload integer)
                              (:associazione-file (or null associazione-file))) sorgente-get-attiva)
                crea-sorgente-get-attiva))
(defun crea-sorgente-get-attiva (controller lease segment
                                &key (max-pages 65536) (max-puts 1048576) (batch-records 65536)
                                     (batch-bytes 67108864) (budget-payload 67108864) associazione-file)
  "Pre: lease, new ACTIVE with a header verified in the I/O pool; append/readonly for the SAME file.
Post: local source ready, no I/O/frontier/publication. Header/id/version compared.
INVALID-ARGUMENT for association/root already started; health/invariants propagate from the controller.
ASSOCIAZIONE-FILE verifies the exact capabilities without I/O; nil retains the caller's precondition.
The caller retains the FDs until reclaim; the header alone does not attest to physical identity."
  (verifica-budget-attivo max-pages max-puts batch-records batch-bytes budget-payload)
  (arcdocdb.series::%check-owner controller lease) (arcdocdb.series::%require-healthy controller)
  (let ((log (arcdocdb.series::controllore-serie-log controller)))
    (verifica-log-segmento log)
    (when associazione-file
      (verifica-associazione-file associazione-file (segmento-get-file segment)
                                 (arcdocdb.wal::log-io-file log)))
    (unless (and (zerop (segmento-get-high segment)) (plusp (segmento-get-low segment))
                 (= (segmento-get-origin segment) +writer-origin+)
                 (= (segmento-get-low segment) (arcdocdb.wal::log-io-file-id log))
                 (= (segmento-get-version segment) (arcdocdb.wal::log-io-version log)))
      (error 'invalid-argument :reason :active-source-identity)))
  (unless (and (eq (mode-file (segmento-get-file segment)) :input)
               (eq (stato-file (segmento-get-file segment)) :open))
    (error 'invalid-argument :reason :active-source-file))
  (unless (and (null (arcdocdb.series::controllore-serie-planned-root controller))
               (zerop (arcdocdb.series::controllore-serie-count controller))
               (= (arcdocdb.series::controllore-serie-next-offset controller) +segment-header-bytes+))
    (error 'invalid-argument :reason :active-source-started))
  (%make-sorgente-get-attiva controller segment max-pages max-puts batch-records batch-bytes budget-payload))

;;; REQ: REQ-IDX-001 REQ-WAL-006 REQ-AFF-008
(declaim (ftype (function (sorgente-get-attiva (or null radice-get-attiva) index u32) null)
                verifica-delta-attivo))
(defun verifica-delta-attivo (source previous start puts)
  "Pre: planned root/batch verified. Post: contiguity, cardinality, and peak authorized before arrays.
Peak = previous payload + 24/new PUT + four 128-byte vectors; no copying of old PUTs.
Excludes other retained roots/events/objects: the overall budget remains the controller's responsibility.
INVALID-ARGUMENT for source/offset, RESOURCE-EXHAUSTED for saturation, without adoption."
  (when previous
    (unless (eq (radice-get-attiva-source previous) source)
      (error 'invalid-argument :reason :active-root-source)))
  (unless (= start (if previous (radice-get-attiva-end previous) +segment-header-bytes+))
    (error 'invalid-argument :reason :active-root-frontier))
  (when (>= (if previous (radice-get-attiva-count previous) 0) (sorgente-get-attiva-max-pages source))
    (error 'resource-exhausted :reason :active-page-budget))
  (when (> puts (- (sorgente-get-attiva-max-puts source) (if previous (radice-get-attiva-puts previous) 0)))
    (error 'resource-exhausted :reason :active-put-budget))
  (when (> (+ (if previous (payload-radice-get-attiva previous) 0) (* +active-row-payload+ puts)
              (* +active-directory-levels+ +active-node-payload+)) (sorgente-get-attiva-budget source))
    (error 'resource-exhausted :reason :active-payload-budget))
  nil)

;;; REQ: REQ-IDX-001 REQ-WAL-006 REQ-AFF-008
(declaim (ftype (function (sorgente-get-attiva (or null radice-get-attiva) lotto u32 t) radice-get-attiva)
                costruisci-delta-attivo))
(defun costruisci-delta-attivo (source previous batch puts content)
  "Pre: admitted delta and stable sealed buffer. Post: private root sharing only immutable pages.
Builds one page, four vectors, and one root per batch, without a chain of previous roots.
Invariants or incomplete allocation do not expose the root or adopt the batch."
  (verifica-delta-attivo source previous (inizio-lotto batch) puts)
  (let* ((rows (make-array (* puts +row-words+) :element-type '(unsigned-byte 32) :initial-element 0))
         (end (+ (inizio-lotto batch) (lunghezza-lotto batch)))
         (rank (if previous (radice-get-attiva-count previous) 0)))
    (copia-put-attivi source batch rows)
    (multiple-value-bind (directory added)
        (appendi-pagina-attiva (if previous (radice-get-attiva-directory previous) nil) rank
                              (%make-mappa-segmento-get (sorgente-get-attiva-segment source) end rows)
                              +active-directory-shift+)
      (%make-radice-get-attiva source directory (1+ rank)
                              (+ puts (if previous (radice-get-attiva-puts previous) 0))
                              (+ added (if previous (radice-get-attiva-nodes previous) 0)) end content))))

;;; REQ: REQ-WAL-005 REQ-WAL-006 REQ-IDX-001 REQ-AFF-001
(declaim (ftype (function (sorgente-get-attiva t lotto (or null radice-get-attiva) t
                          (member :async :group :strong)) (values commit-serie index radice-get-attiva &optional))
                registra-lotto-get-attivo))
(defun registra-lotto-get-attivo (source lease batch previous content level)
  "Pre: lease and SEALED batch with CSN token, before I/O; caller's content/graph immutable.
Post: event/generation captured and root planned; NOT yet acquirable by readers.
The normal PUBBLICA-COMMIT-SERIE verifies coverage/durability and CAS before exposing the root.
Rejections before adoption leave the batch/CSN with the caller; interruption during adoption => Archivio fail-stop."
  (let ((controller (sorgente-get-attiva-controller source)))
    (arcdocdb.series::%check-owner controller lease) (arcdocdb.series::%require-healthy controller)
    (arcdocdb.series::%check-admission controller batch previous level)
    (arcdocdb.series::%capture-token controller batch)
    (handler-case
        (let* ((puts (verifica-lotto-attivo source batch))
               (root (costruisci-delta-attivo source previous batch puts content)))
          (multiple-value-bind (event generation) (registra-commit-serie controller lease batch previous root level)
            (values event generation root)))
      ;; Il buffer sealed è del writer: integrità/forma impossibili sono un guasto interno.
      (corruption-detected (condition) (arcdocdb.series::%mark-fault controller :archive) (error condition))
      (invariant-violation (condition) (arcdocdb.series::%mark-fault controller :archive) (error condition)))))
