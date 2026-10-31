;;; OWNER: writer modifica geometria/revisione; il confine della Serie propaga i guasti.
;;; SHARED: reader acquisisce solo salute e root; nessun mutex, I/O o coordinamento tra Serie.
(in-package #:arcdocdb.index.primary)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-004 REQ-IDX-003
(declaim (ftype (function (indice-primario) null) invalida-indice-primario))
(defun invalida-indice-primario (index)
  "Pre: internal fault or trusted boundary. Post: terminal FAULTED, no deletion or reset.
Repeatable without a mutex; the Serie controller stops admission and publications."
  (sb-thread:barrier (:write))
  (setf (indice-primario-health index) :faulted)
  nil)

;;; REQ: REQ-AFF-004 REQ-IDX-007
(declaim (ftype (function (indice-primario keyword) nil) guasto-indice))
(defun guasto-indice (index reason)
  "Pre: internal invariant violated. Post: index FAULTED before INVARIANT-VIOLATION.
No local recovery or removal of old fragments."
  (invalida-indice-primario index)
  (error 'invariant-violation :reason reason))

;;; REQ: REQ-IDX-003 REQ-IDX-007 REQ-AFF-004
(declaim (inline esigi-indice-sano acquisisci-root esigi-revisione prefix-hash
                 esigi-chiave esigi-frammento-sano controllo-valido-p))
(declaim (ftype (function (indice-primario) null) esigi-indice-sano))
(defun esigi-indice-sano (index)
  "Pre: canonical index. Post: OPEN health acquired; no usable result on fault."
  (let ((health (indice-primario-health index)))
    (sb-thread:barrier (:read))
    (unless (eq health :open) (guasto-indice index :primary-index-faulted)))
  nil)

;;; REQ: REQ-IDX-007 REQ-AFF-004
(declaim (ftype (function (indice-primario) root-indice) acquisisci-root))
(defun acquisisci-root (index)
  "Pre: initialized index. Post: root acquired after load/barrier; NIL is an internal fault."
  (let ((root (indice-primario-root index)))
    (sb-thread:barrier (:read))
    (unless root (guasto-indice index :primary-index-missing-root))
    root))

;;; REQ: REQ-IDX-007 REQ-AFF-008
(declaim (ftype (function (indice-primario) null) esigi-revisione))
(defun esigi-revisione (index)
  "Pre: exclusive writer before any mutation. Post: credit for monotonic revision.
Exhaustion rejected before changes; no wrap or identity reset."
  (esigi-indice-sano index)
  (when (>= (indice-primario-revision index) (1- +revision-limit+))
    (error 'resource-exhausted :reason :primary-index-revision-exhausted))
  nil)

;;; REQ: REQ-IDX-001 REQ-IDX-007
(declaim (ftype (function (u32 (integer 0 30)) fixnum) prefix-hash))
(defun prefix-hash (high depth)
  "Pre: high half of the trusted 64-bit digest. Post: DEPTH highest bits, fixnum without u64 boxing."
  (ash high (- depth 32)))

;;; REQ: REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (octets integer integer) null) esigi-chiave))
(defun esigi-chiave (key start end)
  "Pre: private/immutable span throughout the operation. Post: binary key of 1..65535 bytes.
Invalid input/range rejected before mutations; no decoding or normalization."
  (check-range key start end)
  (unless (<= 1 (- end start) 65535) (error 'invalid-argument :reason :primary-key-length))
  nil)

;;; REQ: REQ-IDX-003 REQ-AFF-004
(declaim (ftype (function (indice-primario frammento-indice) null) esigi-frammento-sano))
(defun esigi-frammento-sano (index fragment)
  "Pre: canonical Serie fragment. Post: healthy domain and bank acquired.
A FAULTED bank makes the index terminal; external reference rejected without mutations."
  (unless (eq index (frammento-indice-owner fragment))
    (error 'invalid-argument :reason :primary-fragment-owner))
  (esigi-indice-sano index)
  (let ((health (banco-slot-health (frammento-indice-bank fragment))))
    (sb-thread:barrier (:read))
    (unless (eq health :open) (guasto-indice index :primary-fragment-faulted)))
  nil)

;;; REQ: REQ-IDX-001 REQ-AFF-004
(declaim (ftype (function ((unsigned-byte 8)) boolean) controllo-valido-p))
(defun controllo-valido-p (control)
  "Pre: acquired byte or exclusive writer. Post: fingerprint 0..127, EMPTY, or DELETED."
  (or (< control 128) (= control +ctrl-empty+) (= control +ctrl-deleted+)))
