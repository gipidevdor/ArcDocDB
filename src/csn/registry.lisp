;;;; ADR-0046: assegnazione e registrazione indivisibili, senza attesa nel worker.
;;; OWNER: un registro privato per Archivio; nessun accesso ai suoi slot dall'esterno.
;;; SHARED: elenco CSN/orizzonte dell'Archivio; due sezioni per lotto o decisione,
;;; mai una sezione per documento. Lettura delle frontiere solo per coordinamento.
(in-package #:arcdocdb.csn)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-MVC-005 REQ-MVC-008 REQ-AFF-008
(defstruct (registro-csn (:constructor %make-registro-csn
                            (capacity highs lows mutex last-high last-low
                             horizon-high horizon-low)) (:copier nil))
  "Pre: exclusive construction with CREA-REGISTRO-CSN. Post: bounded private arrays.
Every mutable field requires the mutex; a zero pair indicates a free slot.
The caller binds numeric tokens to this specific registry."
  (capacity 256 :type (integer 1 65536) :read-only t)
  (highs (make-array 0 :element-type '(unsigned-byte 32))
         :type (simple-array (unsigned-byte 32) (*)) :read-only t)
  (lows (make-array 0 :element-type '(unsigned-byte 32))
        :type (simple-array (unsigned-byte 32) (*)) :read-only t)
  (mutex (sb-thread:make-mutex) :type sb-thread:mutex :read-only t)
  (used 0 :type index)
  (cursor 0 :type index)
  (last-high 0 :type u32)
  (last-low 0 :type u32)
  (horizon-high 0 :type u32)
  (horizon-low 0 :type u32))

;;; REQ: REQ-MVC-005 REQ-MVC-008
(declaim (inline %csn-before-p)
         (ftype (function (u32 u32 u32 u32) boolean) %csn-before-p))
(defun %csn-before-p (high low other-high other-low)
  "Pre: four u32 words. Post: strict comparison of both u64 integers.
No bignum combination, allocation, or domain condition."
  (or (< high other-high) (and (= high other-high) (< low other-low))))

;;; REQ: REQ-MVC-008 REQ-AFF-008
(defmacro %with-csn-guard ((registry) &body body)
  "Pre: registry, evaluated once. Post: body values under mutex, then free.
One attempt without waiting; RESOURCE-EXHAUSTED :CSN-BUSY, body not executed.
Runtime WITH-MUTEX handles interruptions and cleanup, including on body error."
  (let ((value (gensym "REGISTRY")) (acquired (gensym "ACQUIRED")))
    `(let ((,value ,registry) (,acquired nil))
       (when (eq (sb-thread:mutex-owner (registro-csn-mutex ,value)) sb-thread:*current-thread*)
         (error 'resource-exhausted :reason :csn-busy))
       (multiple-value-prog1
           (sb-thread:with-mutex ((registro-csn-mutex ,value) :wait-p nil)
             (setf ,acquired t)
             ,@body)
         (unless ,acquired (error 'resource-exhausted :reason :csn-busy))))))

;;; REQ: REQ-MVC-005 REQ-MVC-008 REQ-AFF-008
(declaim (ftype (function (registro-csn) null) %check-registro-csn))
(defun %check-registro-csn (registry)
  "Pre: mutex owned. Post: consistent shape, count/cursor bounds, and frontiers.
Exact occupied-slot cardinality verified at resolution.
INVARIANT-VIOLATION on fault; the controller applies Archivio fail-stop."
  (unless (eq (sb-thread:mutex-owner (registro-csn-mutex registry))
              sb-thread:*current-thread*)
    (error 'invariant-violation :reason :csn-guard))
  (unless (and (= (length (registro-csn-highs registry)) (registro-csn-capacity registry))
               (= (length (registro-csn-lows registry)) (registro-csn-capacity registry))
               (<= (registro-csn-used registry) (registro-csn-capacity registry))
               (< (registro-csn-cursor registry) (registro-csn-capacity registry)))
    (error 'invariant-violation :reason :csn-registry))
  (let ((hh (registro-csn-horizon-high registry)) (hl (registro-csn-horizon-low registry))
        (lh (registro-csn-last-high registry)) (ll (registro-csn-last-low registry)))
    (when (%csn-before-p lh ll hh hl)
      (error 'invariant-violation :reason :csn-frontier))
    (when (and (zerop (registro-csn-used registry)) (or (/= hh lh) (/= hl ll)))
      (error 'invariant-violation :reason :csn-frontier)))
  nil)

;;; REQ: REQ-MVC-005 REQ-MVC-008 REQ-AFF-008
(declaim (ftype (function (&key (:capacity t) (:initial-high t) (:initial-low t))
                         registro-csn) crea-registro-csn))
(defun crea-registro-csn (&key (capacity 256) (initial-high 0) (initial-low 0))
  "Pre: capacity 1..65536, u64 base as two u32 words, maximum validated by recovery
before admitting requests. Post: none pending, ultimo=H=base, preallocated arrays.
INVALID-ARGUMENT :CSN-CONFIG; zero is only the initial base, never an assigned CSN."
  (unless (and (typep capacity '(integer 1 65536))
               (typep initial-high 'u32) (typep initial-low 'u32))
    (error 'invalid-argument :reason :csn-config))
  (let ((registry (%make-registro-csn
                   capacity (make-array capacity :element-type '(unsigned-byte 32)
                                        :initial-element 0)
                   (make-array capacity :element-type '(unsigned-byte 32) :initial-element 0)
                   (sb-thread:make-mutex :name "ArcDocDB CSN")
                   initial-high initial-low initial-high initial-low)))
    (%with-csn-guard (registry) (%check-registro-csn registry) registry)))

;;; REQ: REQ-MVC-008 REQ-AFF-008
(declaim (ftype (function (registro-csn) index) %slot-libero-csn))
(defun %slot-libero-csn (registry)
  "Pre: mutex and at least one credit. Post: one zero slot, search at most capacity.
INVARIANT-VIOLATION if count promises a nonexistent credit."
  (let ((slot (registro-csn-cursor registry)) (capacity (registro-csn-capacity registry)))
    (dotimes (i capacity)
      (when (and (zerop (aref (registro-csn-highs registry) slot))
                 (zerop (aref (registro-csn-lows registry) slot)))
        (return-from %slot-libero-csn slot))
      (setf slot (if (= (1+ slot) capacity) 0 (1+ slot))))
    (error 'invariant-violation :reason :csn-registry)))

;;; REQ: REQ-MVC-005 REQ-MVC-008 REQ-AFF-008
(declaim (ftype (function (registro-csn) (values index u32 u32 &optional)) prendi-csn))
(defun prendi-csn (registry)
  "Pre: batch contents fixed; token retained with the registry. Post:
slot and unique positive CSN, assignment/registration under the same mutex.
RESOURCE-EXHAUSTED :CSN-BUSY/FULL/EXHAUSTED before any change, never wrap.
  No I/O, publication, waiting, or durable atomicity point."
  (%with-csn-guard (registry)
         (%check-registro-csn registry)
         (when (= (registro-csn-used registry) (registro-csn-capacity registry))
           (error 'resource-exhausted :reason :csn-full))
         (let ((high (registro-csn-last-high registry)) (low (registro-csn-last-low registry)))
           (when (and (= high #xffffffff) (= low #xffffffff))
             (error 'resource-exhausted :reason :csn-exhausted))
           (let ((slot (%slot-libero-csn registry)))
             (if (= low #xffffffff) (setf low 0 high (1+ high)) (incf low))
             (setf (aref (registro-csn-highs registry) slot) high
                   (aref (registro-csn-lows registry) slot) low
                   (registro-csn-last-high registry) high (registro-csn-last-low registry) low
                   (registro-csn-cursor registry)
                   (if (= (1+ slot) (registro-csn-capacity registry)) 0 (1+ slot)))
             (incf (registro-csn-used registry))
             (%check-registro-csn registry)
             (values slot high low)))))

;;; REQ: REQ-MVC-005 REQ-MVC-008
(declaim (ftype (function (registro-csn t t t) null) %check-forma-token-csn))
(defun %check-forma-token-csn (registry slot high low)
  "Pre: mutex, untrusted values. Post: slot in the registry and positive u64 CSN.
INVALID-ARGUMENT :CSN-TOKEN for type, zero, or range, no array access."
  (unless (and (typep slot 'index) (< slot (registro-csn-capacity registry))
               (typep high 'u32) (typep low 'u32) (or (plusp high) (plusp low)))
    (error 'invalid-argument :reason :csn-token))
  nil)

;;; REQ: REQ-MVC-005 REQ-MVC-008
(declaim (ftype (function (registro-csn u32 u32) null) %check-pendente-csn))
(defun %check-pendente-csn (registry high low)
  "Pre: mutex, occupied pair. Post: H<CSN<=ultimo and at least one pending item.
INVARIANT-VIOLATION for incompatible frontiers/count, registry unchanged."
  (unless (and (plusp (registro-csn-used registry))
               (%csn-before-p (registro-csn-horizon-high registry)
                              (registro-csn-horizon-low registry) high low)
               (not (%csn-before-p (registro-csn-last-high registry)
                                   (registro-csn-last-low registry) high low)))
    (error 'invariant-violation :reason :csn-frontier))
  nil)

;;; REQ: REQ-MVC-005 REQ-MVC-008
(declaim (ftype (function (registro-csn t t t) null) %check-token-csn))
(defun %check-token-csn (registry slot high low)
  "Pre: mutex; untrusted values. Post: identity of an in-flight CSN in its slot.
INVALID-ARGUMENT :CSN-TOKEN for shape, stale, or incorrect identity;
INVARIANT-VIOLATION for incompatible frontiers, without registry mutation."
  (%check-forma-token-csn registry slot high low)
  (unless (and (= (aref (registro-csn-highs registry) slot) high)
               (= (aref (registro-csn-lows registry) slot) low))
    (error 'invalid-argument :reason :csn-token))
  (%check-pendente-csn registry high low)
  nil)

;;; REQ: REQ-MVC-005 REQ-MVC-008
(declaim (ftype (function (registro-csn index) (values u32 u32 &optional)) %frontiera-risolta-csn))
(defun %frontiera-risolta-csn (registry resolved)
  "Pre: mutex and verified token. Post: H after removal, calculated without mutation.
Scan at most capacity; INVARIANT-VIOLATION for inconsistent slot or count."
  (let ((high (registro-csn-last-high registry)) (low (registro-csn-last-low registry))
        (count 0))
    (dotimes (slot (registro-csn-capacity registry))
      (unless (= slot resolved)
        (let ((sh (aref (registro-csn-highs registry) slot))
              (sl (aref (registro-csn-lows registry) slot)))
          (unless (and (zerop sh) (zerop sl))
            (%check-pendente-csn registry sh sl)
            (incf count)
            (when (%csn-before-p sh sl high low) (setf high sh low sl))))))
    (unless (= count (1- (registro-csn-used registry)))
      (error 'invariant-violation :reason :csn-registry))
    (when (plusp count)
      (if (zerop low) (setf high (1- high) low #xffffffff) (decf low)))
    (values high low)))

;;; REQ: REQ-MVC-005 REQ-MVC-008 REQ-AFF-008
(declaim (ftype (function (registro-csn t t t) (values u32 u32 &optional)) risolvi-csn))
(defun risolvi-csn (registry slot high low)
  "Pre: effects published or canceled by the owner; token of the current registry.
Post: credit returned, H=min(pendenti)-1 or ultimo; never decreases.
INVALID-ARGUMENT for token; RESOURCE-EXHAUSTED busy retains the resolution obligation.
INVARIANT-VIOLATION imposes fail-stop; no acknowledgment or durable atomicity here."
  (%with-csn-guard (registry)
         (%check-registro-csn registry)
         (%check-token-csn registry slot high low)
         (multiple-value-bind (hh hl) (%frontiera-risolta-csn registry slot)
           (setf (aref (registro-csn-highs registry) slot) 0
                 (aref (registro-csn-lows registry) slot) 0
                 (registro-csn-horizon-high registry) hh (registro-csn-horizon-low registry) hl)
           (decf (registro-csn-used registry))
           (%check-registro-csn registry)
           (values hh hl))))

;;; REQ: REQ-MVC-005 REQ-MVC-008 REQ-AFF-008
(declaim (ftype (function (registro-csn) (values u32 u32 u32 u32 &optional)) leggi-frontiere-csn))
(defun leggi-frontiere-csn (registry)
  "Pre: Archivio coordinator. Post: consistent ultimo-high/low and H-high/low.
RESOURCE-EXHAUSTED :CSN-BUSY without waiting; INVARIANT-VIOLATION on fault.
Does not create snapshots: a GET without snapshot does not query this registry."
  (%with-csn-guard (registry)
    (%check-registro-csn registry)
    (values (registro-csn-last-high registry) (registro-csn-last-low registry)
            (registro-csn-horizon-high registry) (registro-csn-horizon-low registry))))
