;;; OWNER: one serial M1 handle; private fixed cache, independent of the primary-index quota.
;;; SHARED: existing per-Serie CLOCK/seqlocks only; no write/compaction coordination.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CCH-001 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (t) null) verifica-budget-cache-motore))
(defun verifica-budget-cache-motore (budget)
  "Pre: untrusted configuration, before clock or resources. Post: finite nonnegative grant.
INVALID-ARGUMENT above 1 GiB or for other domains; zero disables the record cache."
  (unless (typep budget '(integer 0 1073741824))
    (error 'invalid-argument :reason :engine-record-cache-budget))
  nil)

;;; REQ: REQ-CCH-001 REQ-LIM-003
(declaim (ftype (function (arcdocdb.cache::cache-u32s arcdocdb.cache::cache-u32s) index)
                payload-record-cache))
(defun payload-record-cache (sizes counts)
  "Pre: ordered class sizes and nonzero power-of-two counts, at most 16 classes.
Post: existing cache payload accounting, including class references and one lock stripe.
No allocation or namespace effects; construction repeats the independent budget check."
  (+ (* 8 (length sizes))
     (loop for size across sizes for sets across counts
           sum (arcdocdb.cache::payload-classe-cache size sets 1))))

;;; REQ: REQ-CCH-001 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (index index) (or null arcdocdb.cache:cache-serie)) crea-record-cache-motore))
(defun crea-record-cache-motore (budget frame)
  "Pre: validated grant and frame budget. Post: private fixed classes, 1 KiB through rounded frame size.
Zero allocates no cache. Positive grants need one eight-way set per class or RESOURCE-EXHAUSTED
before resources. Round-robin doubling is bounded by 16 classes and 16 doublings.
Payload excludes Lisp headers/mutex objects; the grant is neither index memory nor process RSS."
  (verifica-budget-cache-motore budget)
  (when (zerop budget) (return-from crea-record-cache-motore nil))
  (let* ((classes (1+ (max 0 (- (integer-length (1- frame)) 10))))
         (sizes (make-array classes :element-type '(unsigned-byte 32)))
         (counts (make-array classes :element-type '(unsigned-byte 32) :initial-element 1)))
    (dotimes (i classes) (setf (aref sizes i) (ash 1024 i)))
    (when (> (payload-record-cache sizes counts) budget)
      (error 'resource-exhausted :reason :engine-record-cache-minimum))
    (dotimes (round 16)
      (dotimes (i classes)
        (let ((old (aref counts i)))
          (when (< old arcdocdb.cache::+cache-max-sets+)
            (setf (aref counts i) (* 2 old))
            (when (> (payload-record-cache sizes counts) budget)
              (setf (aref counts i) old))))))
    (arcdocdb.cache:crea-cache-serie sizes counts budget :stripes 1)))

;;; REQ: REQ-CCH-002 REQ-CCH-004 REQ-OBS-002 REQ-AFF-002
(declaim (ftype (function (motore keyword) null) registra-esito-cache-motore))
(defun registra-esito-cache-motore (engine status)
  "Pre: admitted GET completed record verification from cache or canonical segment.
Post: saturating per-handle counters; altered cache bytes additionally notify the trusted observer.
Only successful segment fallback reports VERIFY-FAILED here; source failures fault the read boundary.
Unknown outcomes are invariant failures; no new clock, file access, or allocation intended."
  (case status
    (:hit (setf (motore-cache-hits engine) (min most-positive-fixnum (1+ (motore-cache-hits engine)))))
    ((:miss :verify-failed)
     (setf (motore-cache-misses engine) (min most-positive-fixnum (1+ (motore-cache-misses engine))))
     (when (eq status :verify-failed)
       (setf (motore-cache-verify-failed engine) (min most-positive-fixnum (1+ (motore-cache-verify-failed engine))))
       (osserva-motore engine :cache-verify-failed)))
    (:disabled nil)
    (otherwise (error 'invariant-violation :reason :engine-record-cache-result)))
  nil)

;;; REQ: REQ-CCH-001 REQ-OBS-002
(declaim (ftype (function (motore) list) statistiche-cache-motore))
(defun statistiche-cache-motore (engine)
  "Pre: READY owner outside a request. Post: copied scalar cache grant/payload and verified record-load outcomes.
Absent keys perform no cache lookup. Counters saturate, are not persisted, and exclude failed source loads.
No key/value, mutable arena, FD or primary-index detail escapes the handle."
  (esigi-motore-pronto engine)
  (list :budget (motore-record-cache-budget engine)
        :payload (if (motore-record-cache engine) (arcdocdb.cache:payload-cache-serie (motore-record-cache engine)) 0)
        :hits (motore-cache-hits engine) :misses (motore-cache-misses engine)
        :verify-failed (motore-cache-verify-failed engine)))
