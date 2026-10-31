;;; OWNER: one synchronous M1 I/O actor; one sealed batch/CSN per operation, one durable group flush.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-WAL-002 REQ-WAL-005 REQ-MVC-008 REQ-IDX-001
(declaim (ftype (function (motore operazione-scrittura index r:radice-get-attiva index u64) r:radice-get-attiva)
                group-seal-operation))
(defun group-seal-operation (engine operation i previous start expected)
  "Pre: BUSY owner, cumulative reservations, clean batch and exact prior planned root. Post: captured event/root.
Each operation retains an independent CSN and SEAL; preparation is not a durable point or acknowledgment.
Any error after the first assignment belongs to the outer terminal fault boundary."
  (let* ((work (motore-write-workspace engine)) (batch (the w:lotto (svref (write-group-workspace-batches work) i)))
         (log (a:log-segmento-attivo-preparato (motore-active engine)))
         (controller (motore-controller engine)) (lease (motore-lease engine)))
    (w:aggiungi-record batch (operazione-scrittura-kind operation) (operazione-scrittura-key operation)
                       (or (operazione-scrittura-value operation) (motore-empty engine)))
    (setf (aref (write-group-workspace-sizes work) i) (w:lunghezza-lotto batch)
          (aref (write-group-workspace-offsets work) i) start)
    (r:verifica-capienza-get-attiva (motore-source engine) lease batch previous)
    (multiple-value-bind (bytes high low)
        (w:sigilla-lotto-con-csn batch (motore-registry engine) log start (io:posizione-durevole (motore-append engine)))
      (unless (and (= bytes (+ (aref (write-group-workspace-sizes work) i) w::+seal-total+))
                   (= expected (logior (ash high 32) low)))
        (error 'invariant-violation :reason :engine-group-sealed-identity))
      (setf (aref (write-group-workspace-csns work) i) expected)
      (multiple-value-bind (event generation root)
          (gd:registra-lotto-fonti-get-attivo (motore-source engine) lease batch previous (motore-sources engine) :strong)
        (setf (svref (write-group-workspace-events work) i) event
              (aref (write-group-workspace-generations work) i) generation)
        (s:inizia-io-commit-serie controller lease event generation)
        (w:aggiungi-lotto (motore-group engine) batch)
        (osserva-motore engine :group-operation-prepared)
        root))))

;;; REQ: REQ-WAL-002 REQ-WAL-005 REQ-MVC-008
(declaim (ftype (function (motore simple-vector index) null) group-build-seals))
(defun group-build-seals (engine operations count)
  "Pre: BUSY owner after cumulative capacity reservation. Post: contiguous independently sealed operations.
Planned roots form the existing bounded Serie FIFO; the published root remains unchanged until strong flush."
  (let* ((previous (s:leggi-radice-serie (motore-controller engine)))
         (start (io:posizione-scritta (motore-append engine)))
         (work (motore-write-workspace engine)))
    (multiple-value-bind (high low) (arcdocdb.csn:verifica-capienza-csn (motore-registry engine) count)
      (let ((base (logior (ash high 32) low)))
        (dotimes (i count)
          (setf previous (group-seal-operation engine (svref operations i) i previous start (+ base i 1)))
          (incf start (w:lunghezza-lotto (svref (write-group-workspace-batches work) i)))))))
  (w:chiudi-gruppo (motore-group engine))
  nil)

;;; REQ: REQ-WAL-006 REQ-MVC-008 REQ-IDX-001 REQ-AFF-001
(declaim (ftype (function (motore operazione-scrittura index) null) group-publish-operation))
(defun group-publish-operation (engine operation i)
  "Pre: complete strong flush covers every immutable batch, sole BUSY owner. Post: FIFO root/CSN/location and I/O retirement.
Publication precedes location only under serial exclusion. No response until the complete group succeeds."
  (let* ((work (motore-write-workspace engine)) (event (svref (write-group-workspace-events work) i))
         (generation (aref (write-group-workspace-generations work) i)) (csn (aref (write-group-workspace-csns work) i))
         (controller (motore-controller engine)) (lease (motore-lease engine)))
    (multiple-value-bind (status high low) (s:pubblica-commit-serie controller lease event generation)
      (unless (and (eq status :risolto) (= csn (logior (ash high 32) low)))
        (error 'invariant-violation :reason :engine-group-publication)))
    (pubblica-location-motore engine (operazione-scrittura-kind operation) (operazione-scrittura-key operation) csn
      (w::log-io-file-id (a:log-segmento-attivo-preparato (motore-active engine)))
      (aref (write-group-workspace-offsets work) i) (aref (write-group-workspace-sizes work) i))
    (s:completa-io-commit-serie controller lease event generation)
    (osserva-motore engine :group-operation-published))
  nil)

;;; REQ: REQ-WAL-002 REQ-WAL-006 REQ-AFF-001
(declaim (ftype (function (motore simple-vector index) null) group-commit-strong))
(defun group-commit-strong (engine operations count)
  "Pre: BUSY owner and complete group reservation. Post: one strong flush, all individual effects published/recycled.
Each SEAL is its operation's durable atomicity point; one flush covers the contiguous group. No transaction promise.
Append/flush/publication failure or incomplete exit faults admission; no partial response or reuse on uncertainty."
  (group-build-seals engine operations count)
  (osserva-motore engine :before-append)
  (w:scrivi-gruppo (motore-group engine))
  (osserva-motore engine :after-append)
  (w:sincronizza-gruppo (motore-group engine))
  (osserva-motore engine :after-flush)
  (dotimes (i count) (group-publish-operation engine (svref operations i) i))
  (w:riusa-gruppo (motore-group engine))
  (let ((work (motore-write-workspace engine)))
    (dotimes (i count)
      (s:riusa-commit-serie (motore-controller engine) (motore-lease engine)
        (svref (write-group-workspace-events work) i) (aref (write-group-workspace-generations work) i))))
  (osserva-motore engine :after-commit)
  nil)
