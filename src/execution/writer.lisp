;;;; Lease locale del writer; la quota limita ogni acquisizione, non la capacità.
;;; OWNER: generation/extracted solo dal writer con lease corrente; CAS owner separato.
;;; SHARED: payload dalla coda al consumatore solo dopo prelievo, nessun callback.
(in-package #:arcdocdb.execution)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (coda-writer t) null) %check-lease))
(defun %check-lease (queue lease)
  "Pre: opaque caller-supplied token. Post: current thread/generation and valid quota.
INVALID-ARGUMENT for stale/incorrect/foreign-thread token; INVARIANT-VIOLATION for quota."
  (unless (and (typep lease 'index) (plusp lease)
               (eq (coda-writer-owner queue) sb-thread:*current-thread*)
               (= lease (coda-writer-generation queue)))
    (error 'invalid-argument :reason :writer-lease))
  (unless (and (<= 1 (coda-writer-quantum queue) +max-writer-quantum+)
               (<= (coda-writer-extracted queue) (coda-writer-quantum queue)))
    (error 'invariant-violation :reason :writer-owner))
  nil)

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-AFF-008
(declaim (ftype (function (coda-writer sb-thread:thread) null) %libera-owner))
(defun %libera-owner (queue thread)
  "Pre: THREAD owns owner, lease fields already finalized. Post: owner free.
One CAS only; INVARIANT-VIOLATION on failure, caller fail-stop without retry."
  (unless (eq (coda-writer-owner queue) thread)
    (error 'invariant-violation :reason :writer-owner))
  (unless (eq (sb-ext:compare-and-swap (coda-writer-owner queue) thread nil) thread)
    (error 'invariant-violation :reason :writer-owner))
  nil)

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (coda-writer) index) acquisisci-writer))
(defun acquisisci-writer (queue)
  "Pre: caller requests a new lease. Post: positive generation, fresh quota;
RESOURCE-EXHAUSTED for busy writer or exhausted generation. Overflow neither increments
nor changes extracted and releases the acquired CAS; no wrap, callback, or scheduling."
  (let ((thread sb-thread:*current-thread*) (committed nil))
    (unless (null (sb-ext:compare-and-swap (coda-writer-owner queue) nil thread))
      (error 'resource-exhausted :reason :writer-busy))
    (unwind-protect
         (progn
           (unless (and (eq (coda-writer-owner queue) thread)
                        (zerop (coda-writer-extracted queue)))
             (error 'invariant-violation :reason :writer-owner))
           (when (= (coda-writer-generation queue) most-positive-fixnum)
             (error 'resource-exhausted :reason :writer-generation))
           (incf (coda-writer-generation queue))
           (setf committed t)
           (coda-writer-generation queue))
      (unless committed (%libera-owner queue thread)))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-AFF-008
(declaim (ftype (function (coda-writer t t t)
                         (values simple-vector index index &optional)) %check-target))
(defun %check-target (queue target start end)
  "Pre: consumer destination and declared range. Post: SIMPLE-VECTOR and valid
nonempty indices validated before ring access; INVALID-ARGUMENT for incorrect alias, type, or range."
  (unless (and (typep target 'simple-vector) (not (eq target (coda-writer-slots queue))))
    (error 'invalid-argument :reason :writer-target))
  (unless (and (typep start 'index) (typep end 'index) (< start end) (<= end (length target)))
    (error 'invalid-argument :reason :writer-target))
  (values target (the index start) (the index end)))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (coda-writer t t t t)
                         (values index (member :messages :empty :yield) &optional)) preleva-messaggi))
(defun preleva-messaggi (queue lease target start end)
  "Pre: current thread's lease and private destination not aliased with slots.
Post: FIFO up to MIN(count, range, quota), slots freed, ownership with consumer;
target unchanged outside copied messages. :YIELD without ring work at zero quota,
:EMPTY if empty, :MESSAGES after copying. INVALID-ARGUMENT for lease/target, RESOURCE-
EXHAUSTED for busy guard; internal errors require caller fail-stop."
  (%check-lease queue lease)
  (multiple-value-bind (destination first limit) (%check-target queue target start end)
    (let ((remaining (- (coda-writer-quantum queue) (coda-writer-extracted queue))))
      (declare (type index remaining))
      (when (zerop remaining) (return-from preleva-messaggi (values 0 :yield)))
      (let ((thread (%acquisisci-guard queue)))
        (unwind-protect
             (progn
               (%check-queue queue)
               (let* ((count (coda-writer-count queue))
                      (taken (min count (- limit first) remaining))
                      (cursor (coda-writer-head queue))
                      (extracted (coda-writer-extracted queue))
                      (slots (coda-writer-slots queue)) (capacity (coda-writer-capacity queue)))
                 (declare (type index count taken cursor extracted capacity))
                 (dotimes (i taken)
                   (setf (svref destination (+ first i)) (svref slots cursor)
                         (svref slots cursor) nil
                         cursor (mod (1+ cursor) capacity)))
                 (setf (coda-writer-head queue) cursor (coda-writer-count queue) (- count taken)
                       (coda-writer-extracted queue) (+ extracted taken))
                 (%check-queue queue)
                 (unless (and (<= taken remaining)
                              (<= (coda-writer-extracted queue) (coda-writer-quantum queue)))
                   (error 'invariant-violation :reason :writer-owner))
                 (values taken (if (zerop taken) :empty :messages))))
          (%rilascia-guard queue thread))))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (coda-writer t) null) rilascia-writer))
(defun rilascia-writer (queue lease)
  "Pre: current lease of owner thread. Post: quota cleared before owner CAS
to NIL, generation retained. INVALID-ARGUMENT for incorrect/stale/foreign-thread token;
INVARIANT-VIOLATION on failure. No implicit ready, wakeup, callback, or controller."
  (%check-lease queue lease)
  (setf (coda-writer-extracted queue) 0)
  (%libera-owner queue sb-thread:*current-thread*))
