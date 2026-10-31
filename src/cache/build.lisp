;;; OWNER: controller fuori dal percorso caldo, input di configurazione stabili.
;;; SHARED: nessuno durante costruzione; mutex locali pubblicati con la partizione.
(in-package #:arcdocdb.cache)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CCH-001 REQ-AFF-008
(declaim (ftype (function (integer) boolean) potenza-due-cache-p))
(defun potenza-due-cache-p (number)
  "Pre: integer. Post: T only for a positive power of two; no mutation or error."
  (and (plusp number) (zerop (logand number (1- number)))))

;;; REQ: REQ-CCH-001 REQ-AFF-008
(declaim (ftype (function (integer integer integer) integer) payload-classe-cache))
(defun payload-classe-cache (size sets stripes)
  "Pre: verified configuration, positive sets. Post: arena, metadata, hands, and lock-vector payload.
Cold calculation with exact integers; excludes Lisp headers, mutex objects, and runtime alignment."
  (+ (* sets +cache-ways+ (+ size 29)) sets (* 8 (min sets stripes))))

;;; REQ: REQ-CCH-001 REQ-CCH-004 REQ-AFF-008
(declaim (ftype (function (cache-u32s cache-u32s integer integer)
                         (values index index &optional)) preflight-cache))
(defun preflight-cache (sizes counts budget stripes)
  "Pre: stable controller configurations. Post: payload and active class count before allocation.
INVALID-ARGUMENT for order/powers/limits; RESOURCE-EXHAUSTED for budget or unrepresentable index."
  (unless (and (= (length sizes) (length counts))
               (<= (length sizes) +cache-max-classes+) (<= 0 budget most-positive-fixnum)
               (<= 1 stripes 256) (potenza-due-cache-p stripes))
    (error 'invalid-argument :reason :cache-configuration))
  (let ((previous 0) (payload 0) (active 0))
    (dotimes (i (length sizes))
      (let ((size (aref sizes i)) (sets (aref counts i)))
        (unless (and (< previous size) (<= 1024 size +cache-max-slot-bytes+)
                     (potenza-due-cache-p size) (<= sets +cache-max-sets+)
                     (or (zerop sets) (potenza-due-cache-p sets)))
          (error 'invalid-argument :reason :cache-class-configuration))
        (setf previous size)
        (when (plusp sets)
          (incf active)
          (incf payload (+ 8 (payload-classe-cache size sets stripes))))))
    (unless (<= payload budget)
      (error 'resource-exhausted :reason :cache-payload-budget))
    (values payload active)))

;;; REQ: REQ-CCH-001 REQ-AFF-008
(declaim (ftype (function ((integer 1024 33554432) (integer 1 65536) (integer 1 256))
                         classe-cache) alloca-classe-cache))
(defun alloca-classe-cache (size sets stripes)
  "Pre: complete preflight, exclusive controller. Post: all arrays zeroed and private mutexes.
Allocates only during construction; an error leaves unpublished objects discardable by GC."
  (let* ((slots (* sets +cache-ways+)) (locks (make-array (min sets stripes))))
    (dotimes (i (length locks)) (setf (aref locks i) (sb-thread:make-mutex :name "cache-stripe")))
    (%make-classe-cache
     :size size :sets sets :arena (make-array (* slots size) :element-type 'u8 :initial-element 0)
     :tags (make-array (* slots +cache-tag-words+) :element-type 'u32 :initial-element 0)
     :sequences (make-array slots :element-type 'u64 :initial-element 0)
     :references (make-array slots :element-type 'u8 :initial-element 0)
     :origins (make-array slots :element-type 'u8 :initial-element 0)
     :reread (make-array slots :element-type 'u8 :initial-element 0)
     :rejected (make-array slots :element-type 'u8 :initial-element 0)
     :disabled (make-array slots :element-type 'u8 :initial-element 0)
     :hands (make-array sets :element-type 'u8 :initial-element 0) :locks locks)))

;;; REQ: REQ-CCH-001 REQ-CCH-004 REQ-AFF-008
(declaim (ftype (function (cache-u32s cache-u32s integer &key (:stripes integer)) cache-serie)
                crea-cache-serie))
(defun crea-cache-serie (sizes counts budget &key (stripes 16))
  "Pre: u32 vectors of increasing classes and set counts, stable during the call.
Post: fixed partition without retaining input vectors; all zero counts allow zero budget.
Propagates typed preflight errors before allocations; does not resize published partitions."
  (multiple-value-bind (payload active) (preflight-cache sizes counts budget stripes)
    (let ((classes (make-array active)) (position 0))
      (dotimes (i (length sizes))
        (when (plusp (aref counts i))
          (setf (aref classes position)
                (alloca-classe-cache (aref sizes i) (aref counts i) stripes))
          (incf position)))
      (%make-cache-serie classes payload))))

;;; REQ: REQ-CCH-001 REQ-OBS-002
(declaim (ftype (function (cache-serie) index) payload-cache-serie))
(defun payload-cache-serie (cache)
  "Pre: published partition. Post: fixed reserved payload; no scan, lock, or write.
Does not represent RSS, runtime headers, or scheduler budget."
  (cache-serie-payload cache))
