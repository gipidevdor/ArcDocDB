;;; OWNER: controller/solo writer; tutte le allocazioni fuori dal lookup.
;;; SHARED: nuovi array non esposti prima della root; budget payload distinto da RSS.
(in-package #:arcdocdb.index.primary)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-IDX-005 REQ-LIM-001 REQ-AFF-008
(declaim (ftype (function (indice-primario &key (:depth integer) (:prefix integer)
                                         (:arena-bytes integer)) frammento-indice)
                crea-frammento-indice))
(defun crea-frammento-indice (index &key (depth 0) (prefix 0) (arena-bytes 65536))
  "Pre: controller/writer, desired rebuild/split geometry. Post: empty BUILDING.
Budget of 41*C + arena verified before allocation; capacity does not grow in place."
  (esigi-indice-sano index)
  (unless (and (<= 0 depth (indice-primario-max-depth index))
               (<= 0 prefix (1- (ash 1 depth))) (<= 1 arena-bytes #x100000000))
    (error 'invalid-argument :reason :primary-fragment-configuration))
  (let ((capacity (indice-primario-capacity index)) (budget (indice-primario-fragment-budget index)))
    (when (> (+ (* 41 capacity) arena-bytes) budget)
      (error 'resource-exhausted :reason :primary-fragment-memory-budget))
    (%make-frammento-indice index depth prefix (crea-banco-slot :capacity capacity :budget-bytes budget)
                           (make-array capacity :element-type '(unsigned-byte 8)
                                                :initial-element +ctrl-empty+)
                           (make-array arena-bytes :element-type '(unsigned-byte 8) :initial-element 0))))

;;; REQ: REQ-IDX-001 REQ-IDX-007 REQ-AFF-008
(declaim (ftype (function (&key (:capacity integer) (:max-depth integer)
                               (:directory-budget-bytes integer) (:fragment-budget-bytes integer)
                               (:arena-bytes integer) (:hash-seed-high t) (:hash-seed-low t))
                         indice-primario) crea-indice-primario))
(defun crea-indice-primario (&key (capacity 8192) (max-depth 20)
                                (directory-budget-bytes 8388608) (fragment-budget-bytes 8388608)
                                (arena-bytes 65536) (hash-seed-high nil) (hash-seed-low nil))
  "Pre: controller; local configuration limits, not the total size of a Serie.
Post: initial root G=0, generation 0, one empty fragment. No thread or I/O.
Optional hash configured with both immutable u32s; NIL/NIL preserves the trusted-digest API.
INVALID-ARGUMENT :primary-hash-seed-configuration for incomplete or non-u32 seed, before arrays."
  (unless (or (and (null hash-seed-high) (null hash-seed-low))
              (and (typep hash-seed-high 'u32) (typep hash-seed-low 'u32)))
    (error 'invalid-argument :reason :primary-hash-seed-configuration))
  (unless (and (<= 16 capacity 65536) (zerop (logand capacity (1- capacity)))
               (<= 0 max-depth 30) (<= 8 directory-budget-bytes most-positive-fixnum)
               (<= 1 fragment-budget-bytes most-positive-fixnum))
    (error 'invalid-argument :reason :primary-index-configuration))
  (let* ((index (%make-indice-primario capacity max-depth directory-budget-bytes fragment-budget-bytes
                                     hash-seed-high hash-seed-low))
         (fragment (crea-frammento-indice index :arena-bytes arena-bytes)))
    (setf (frammento-indice-exposure fragment) :published
          (indice-primario-root index) (%make-root-indice 0 0 (vector fragment)))
    index))

;;; REQ: REQ-IDX-003 REQ-CON-004 REQ-AFF-008
(declaim (ftype (function () contesto-indice) crea-contesto-indice))
(defun crea-contesto-indice ()
  "Pre: controller before worker startup. Post: private scratch, reusable without allocation.
The pool bounds the number of contexts; no Serie binding or pin acquired."
  (%make-contesto-indice (make-array 5 :element-type '(unsigned-byte 64) :initial-element 0)))

;;; REQ: REQ-IDX-005 REQ-AFF-004
(declaim (inline esigi-frammento-writer))
(declaim (ftype (function (indice-primario frammento-indice u32) null) esigi-frammento-writer))
(defun esigi-frammento-writer (index fragment high)
  "Pre: exclusive writer token. Post: domain, digest prefix, and writable state verified.
RETIRED does not reopen; a digest inconsistent with the fragment is rejected before changes."
  (esigi-frammento-sano index fragment)
  (when (eq (frammento-indice-exposure fragment) :retired)
    (error 'invalid-argument :reason :primary-fragment-retired))
  (unless (= (frammento-indice-prefix fragment) (prefix-hash high (frammento-indice-depth fragment)))
    (error 'invalid-argument :reason :primary-fragment-prefix))
  (esigi-banco-writer (frammento-indice-bank fragment))
  nil)

;;; REQ: REQ-IDX-007 REQ-AFF-004
(declaim (ftype (function (indice-primario u32) frammento-indice) frammento-corrente-indice))
(defun frammento-corrente-indice (index high)
  "Pre: writer with the Serie token; key digest. Post: canonical current fragment.
Only for writer preflight/mutations; does not authorize a reader to retain slots or locations."
  (esigi-indice-sano index)
  (let* ((root (acquisisci-root index))
         (fragment (aref (root-indice-directory root) (prefix-hash high (root-indice-depth root)))))
    (esigi-frammento-writer index fragment high)
    fragment))
