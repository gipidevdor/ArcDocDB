;;; OWNER: unico writer; crescita esplicita prima del commit e delle prenotazioni di nuovi byte.
;;; SHARED: array precedente resta immutato; nuovo riferimento pubblicato con barriera.
(in-package #:arcdocdb.index.primary)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-IDX-005 REQ-AFF-008
(declaim (ftype (function (frammento-indice) fixnum) payload-frammento))
(defun payload-frammento (fragment)
  "Pre: writer/controller, canonical fragment. Post: slot/control/arena payload bytes.
Not RSS; excludes headers, garbage, or arrays retained by other readers/plans."
  (+ (* 41 (banco-slot-capacity (frammento-indice-bank fragment)))
     (length (frammento-indice-arena fragment))))

;;; REQ: REQ-IDX-007 REQ-AFF-008
(declaim (ftype (function (root-indice) fixnum) payload-root))
(defun payload-root (root)
  "Pre: root built by this module, canonical geometry. Post: directory and distinct fragments.
Each prefix block appears once; payload sum, without a collector estimate."
  (let* ((directory (root-indice-directory root)) (depth (root-indice-depth root))
         (sum (* 8 (length directory))) (i 0))
    (loop while (< i (length directory))
          do (let ((fragment (aref directory i)))
               (incf sum (payload-frammento fragment))
               (when (> sum most-positive-fixnum)
                 (error 'resource-exhausted :reason :primary-memory-accounting-range))
               (incf i (ash 1 (- depth (frammento-indice-depth fragment))))))
    sum))

;;; REQ: REQ-IDX-005 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (indice-primario frammento-indice integer integer) null) estendi-arena-indice))
(defun estendi-arena-indice (index fragment new-size transient-budget-bytes)
  "Pre: writer, transient budget reserved by the controller, no unaccounted plan/work.
Post: same key at the same offsets; arena grows by replacement, never in place or by shrinking.
Checks current root + any building fragment + new arena before allocating."
  (esigi-frammento-sano index fragment)
  (esigi-banco-writer (frammento-indice-bank fragment))
  (let* ((old (frammento-indice-arena fragment)) (root (acquisisci-root index))
         (building (eq (frammento-indice-exposure fragment) :building)))
    (unless (and (not (eq (frammento-indice-exposure fragment) :retired))
                 (< (length old) new-size) (<= new-size #x100000000)
                 (<= 1 transient-budget-bytes most-positive-fixnum))
      (error 'invalid-argument :reason :primary-arena-configuration))
    (when (> (+ (* 41 (indice-primario-capacity index)) new-size)
             (indice-primario-fragment-budget index))
      (error 'resource-exhausted :reason :primary-fragment-memory-budget))
    (when (> (+ (payload-root root) (if building (payload-frammento fragment) 0) new-size)
             transient-budget-bytes)
      (error 'resource-exhausted :reason :primary-arena-transient-budget))
    (esigi-revisione index)
    (let ((new (make-array new-size :element-type '(unsigned-byte 8) :initial-element 0)) (complete nil))
      (replace new old)
      (unwind-protect
           (progn
             (incf (indice-primario-revision index))
             (sb-thread:barrier (:write))
             (setf (frammento-indice-arena fragment) new)
             (esigi-frammento-sano index fragment)
             (setf complete t))
        (unless complete (invalida-indice-primario index)))))
  nil)
