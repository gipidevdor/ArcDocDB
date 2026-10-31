;;; OWNER: controller/pool I/O prima della pubblicazione; input esclusivo e stabile.
;;; SHARED: nessuna radice pubblicata viene modificata o file aperto/chiuso qui.
(in-package #:arcdocdb.get.directory)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-AFF-008
(declaim (ftype (function (t t t) index) verifica-configurazione-directory-get))
(defun verifica-configurazione-directory-get (maps maximum budget)
  "Pre: caller input and budgets. Post: finite cardinality admitted BEFORE scans/arrays.
INVALID-ARGUMENT for shape/configuration; RESOURCE-EXHAUSTED for segments/payload.
No implicit sorting, new opening, expansion, or array allocation."
  (unless (and (typep maximum 'index) (<= 1 maximum +directory-max-segments+)
               (typep budget 'index))
    (error 'invalid-argument :reason :directory-configuration))
  (unless (typep maps 'simple-vector) (error 'invalid-argument :reason :directory-maps))
  (let ((count (length maps)))
    (when (> count maximum) (error 'resource-exhausted :reason :directory-segment-budget))
    (when (> (* count +directory-entry-bytes+) budget)
      (error 'resource-exhausted :reason :directory-payload-budget))
    count))

;;; REQ: REQ-IDX-001 REQ-CMP-007 REQ-AFF-008
(declaim (ftype (function (vista-get-serie t u32) u32) verifica-mappa-directory-get))
(defun verifica-mappa-directory-get (view map previous)
  "Pre: stable input, previous ID zero or positive. Post: canonical CLOSED map and increasing ID.
INVALID-ARGUMENT for type, view, ID, order, or FD not readonly/open.
Does not truncate storage u64 IDs or certify physical identity, health, or FD quiescence."
  (unless (typep map 'mappa-segmento-get) (error 'invalid-argument :reason :directory-maps))
  (let* ((segment (mappa-segmento-get-segment map)) (id (segmento-get-low segment)))
    (unless (eq view (segmento-get-owner segment))
      (error 'invalid-argument :reason :directory-source-owner))
    (unless (and (zerop (segmento-get-high segment)) (plusp id))
      (error 'invalid-argument :reason :directory-source-segment))
    (unless (and (eq :input (mode-file (segmento-get-file segment)))
                 (eq :open (stato-file (segmento-get-file segment))))
      (error 'invalid-argument :reason :directory-source-lifetime))
    (unless (> id previous) (error 'invalid-argument :reason :directory-source-order))
    id))

;;; REQ: REQ-IDX-001 REQ-CMP-007 REQ-AFF-008
(declaim (ftype (function (vista-get-serie t &key (:max-segments t) (:budget-payload t))
                         directory-get-serie) crea-directory-get-serie))
(defun crea-directory-get-serie (view maps &key (max-segments 65536) (budget-payload 786432))
  "Pre: controller, simple-vector of sorted CLOSED maps, stable/exclusive until return.
Post: complete directory, two copied/owned arrays; reusable input, zero segments valid.
Budgets/identity/order/FD checked before allocation; typed errors publish no partial results.
The controller acquires/publishes the directory with EBR, separately from primary locations."
  (let ((count (verifica-configurazione-directory-get maps max-segments budget-payload)) (previous 0))
    (declare (type u32 previous))
    (dotimes (i count) (setf previous (verifica-mappa-directory-get view (svref maps i) previous)))
    (let ((ids (make-array count :element-type '(unsigned-byte 32) :initial-element 0))
          (owned (copy-seq maps)))
      (setf previous 0)
      (dotimes (i count)
        (setf previous (verifica-mappa-directory-get view (svref owned i) previous)
              (aref ids i) previous))
      (unless (= count (length ids) (length owned))
        (error 'invariant-violation :reason :directory-built-shape))
      (%make-directory-get-serie view ids owned))))
