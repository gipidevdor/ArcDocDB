;;; OWNER: writer logico del lotto; esiti I/O osservati solo dopo handoff sincronizzato.
;;; SHARED: registro CSN di Archivio, solo alla chiusura e alla risoluzione del lotto.
;;; Il ponte non possiede indice, scheduler, stato di Serie o conferme al client.
(in-package #:arcdocdb.wal)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-WAL-005 REQ-AFF-001 REQ-AFF-004
(declaim (ftype (function (log-io) null) verifica-log-segmento))
(defun verifica-log-segmento (log)
  "Pre: exclusive capability for the Serie log. Post: healthy segment, without syscalls.
INVALID-ARGUMENT for control/multiseries; IO-FAULT for a terminal log."
  (unless (eq (log-io-kind log) :segment)
    (error 'invalid-argument :reason :log-segment-kind))
  (unless (eq (log-io-state log) :open)
    (error 'io-fault :reason :log-faulted :operation :wal))
  nil)

;;; REQ: REQ-WAL-005 REQ-AFF-008 REQ-AFF-001
(declaim (ftype (function (lotto log-io file-offset file-offset) null) verifica-file-csn))
(defun verifica-file-csn (lotto log file-start durable)
  "Pre: validated batch closure; file state observed by the writer after handoff.
Post: planned frontiers and budgets admitted, append file open; no syscalls.
INVALID-ARGUMENT for offsets, RESOURCE-EXHAUSTED for budgets, IO-FAULT for an unavailable file."
  (let* ((file (log-io-file log)) (written (posizione-scritta file))
         (size (+ (lotto-used lotto) +seal-total+)))
    (unless (<= written file-start)
      (error 'invalid-argument :reason :lotto-written-offset))
    (verifica-capienza-append file (+ (- file-start written) size) size)
    (unless (<= durable (posizione-durevole file))
      (error 'invalid-argument :reason :lotto-future-durable)))
  nil)

;;; REQ: REQ-WAL-005 REQ-MVC-008 REQ-AFF-004
(declaim (ftype (function (lotto log-io file-offset file-offset) null) verifica-log-csn))
(defun verifica-log-csn (lotto log file-start durable)
  "Pre: exclusive writer and log observed after handoff. Post: nonempty segment, consistent log.
INVALID-ARGUMENT for identity/frontier/association; IO-FAULT for a faulty log, before CSN assignment."
  (verifica-chiusura-lotto lotto file-start durable)
  (when (lotto-csn-registry lotto) (error 'invalid-argument :reason :lotto-csn-bound))
  (unless (and (eq (lotto-kind lotto) :segment) (plusp (lotto-count lotto)))
    (error 'invalid-argument :reason :lotto-csn-content))
  (unless (and (eq (log-io-kind log) :segment)
               (= (lotto-file-id lotto) (log-io-file-id log))
               (= (lotto-version lotto) (log-io-version log)))
    (error 'invalid-argument :reason :lotto-csn-log))
  (unless (eq (log-io-state log) :open)
    (error 'io-fault :reason :log-faulted :operation :wal))
  (verifica-file-csn lotto log file-start durable)
  nil)

;;; REQ: REQ-WAL-005 REQ-MVC-008 REQ-AFF-008
(declaim (ftype (function (lotto registro-csn log-io file-offset file-offset)
                         (values index u32 u32 &optional)) sigilla-lotto-con-csn))
(defun sigilla-lotto-con-csn (lotto registry log file-start durable)
  "Pre: contents fixed by the writer; Archivio registry and exclusive Serie log.
Post: registered CSN retained in the batch; ordinary records/SEAL encoded as two u32s.
SEAL is only prepared; write/flush persist the atomicity point. Pre-CSN rejections do not mutate state.
RESOURCE-EXHAUSTED for full/busy/exhausted leaves it open; an error after assignment requires fail-stop."
  (verifica-log-csn lotto log file-start durable)
  (multiple-value-bind (slot high low) (prendi-csn registry)
    (setf (lotto-csn-registry lotto) registry (lotto-csn-log lotto) log
          (lotto-csn-slot lotto) slot (lotto-csn-high lotto) high (lotto-csn-low lotto) low
          (lotto-csn-pending lotto) t)
    (values (sigilla-lotto-parole lotto high low file-start durable) high low)))

;;; REQ: REQ-MVC-008 REQ-AFF-004
(declaim (ftype (function (lotto registro-csn index u32 u32) null) esigi-identita-csn-lotto))
(defun esigi-identita-csn-lotto (lotto registry slot high low)
  "Pre: synchronized event with identity retained at closure. Post: exact current token.
INVALID-ARGUMENT for a stale event/another Archivio; no modification or credit release."
  (esigi-csn-pendente lotto)
  (unless (and (eq (lotto-csn-registry lotto) registry) (= (lotto-csn-slot lotto) slot)
               (= (lotto-csn-high lotto) high) (= (lotto-csn-low lotto) low))
    (error 'invalid-argument :reason :lotto-csn-stale))
  nil)

;;; REQ: REQ-MVC-008 REQ-AFF-004
(declaim (ftype (function (lotto) null) esigi-csn-pendente))
(defun esigi-csn-pendente (lotto)
  "Pre: owned batch after handoff. Post: resolution obligation still retained.
INVALID-ARGUMENT for free/already resolved; INVARIANT-VIOLATION for an incomplete association."
  (unless (lotto-csn-pending lotto)
    (error 'invalid-argument :reason :lotto-csn-not-pending))
  (unless (and (lotto-csn-registry lotto) (lotto-csn-log lotto)
               (or (plusp (lotto-csn-high lotto)) (plusp (lotto-csn-low lotto))))
    (error 'invariant-violation :reason :lotto-csn-token))
  nil)

;;; REQ: REQ-MVC-008 REQ-AFF-004 REQ-WAL-005
(declaim (ftype (function (lotto registro-csn log-io index u32 u32) null) verifica-token-lotto))
(defun verifica-token-lotto (lotto registry log slot high low)
  "Pre: captured token and Serie log, after handoff. Post: exact association.
INVALID-ARGUMENT for a stale event/different log; invariants for an incomplete token.
No mutation, resolution, or reading of the shared registry."
  (esigi-identita-csn-lotto lotto registry slot high low)
  (unless (eq (lotto-csn-log lotto) log)
    (error 'invalid-argument :reason :lotto-csn-log))
  nil)

;;; REQ: REQ-MVC-008 REQ-AFF-001 REQ-WAL-006
(declaim (ftype (function (lotto registro-csn log-io index u32 u32
                          (member :async :group :strong)) null) verifica-pubblicazione-lotto))
(defun verifica-pubblicazione-lotto (lotto registry log slot high low level)
  "Pre: writer owns the captured token; I/O outcome observed after handoff.
Post: identity, health, and coverage verified BEFORE external publication.
INVALID-ARGUMENT for token/coverage; IO-FAULT for health; no mutation."
  (verifica-token-lotto lotto registry log slot high low)
  (verifica-log-segmento log)
  (unless (coperto-p lotto level) (error 'invalid-argument :reason :lotto-not-covered))
  nil)

;;; REQ: REQ-MVC-008 REQ-AFF-004
(declaim (ftype (function (lotto) (values u32 u32 &optional)) risolvi-token-lotto))
(defun risolvi-token-lotto (lotto)
  "Pre: published effect or valid cancellation and pending token verified by the bridge.
Post: credit released and batch resolved. Busy retains the obligation; an incorrect token requires fail-stop.
An unexpected interruption during the registry/batch transition requires fail-stop, not a retry."
  (esigi-csn-pendente lotto)
  (multiple-value-bind (high low)
      (risolvi-csn (lotto-csn-registry lotto) (lotto-csn-slot lotto)
                   (lotto-csn-high lotto) (lotto-csn-low lotto))
    (setf (lotto-csn-pending lotto) nil)
    (values high low)))

;;; REQ: REQ-WAL-006 REQ-MVC-008 REQ-AFF-001
(declaim (ftype (function (lotto registro-csn index u32 u32 (member :async :group :strong))
                         (values u32 u32 &optional)) risolvi-lotto-pubblicato))
(defun risolvi-lotto-pubblicato (lotto registry slot high low level)
  "Pre: index already atomically published by the writer, Serie order respected, handoff complete.
Post: CSN resolved if bytes are covered and the log is healthy; does not publish the index or acknowledge the client.
INVALID-ARGUMENT for coverage/token; IO-FAULT for health; busy retains the token for rescheduling."
  (esigi-identita-csn-lotto lotto registry slot high low)
  (unless (eq (log-io-state (lotto-csn-log lotto)) :open)
    (error 'io-fault :reason :log-faulted :operation :wal))
  (unless (coperto-p lotto level) (error 'invalid-argument :reason :lotto-not-covered))
  (risolvi-token-lotto lotto))

;;; REQ: REQ-WAL-006 REQ-MVC-008 REQ-AFF-001
(declaim (ftype (function (lotto registro-csn index u32 u32) (values u32 u32 &optional)) annulla-csn-lotto))
(defun annulla-csn-lotto (lotto registry slot high low)
  "Pre: controller has made the Serie FAULTED and retired/completed every I/O consumer.
Post: only a faulted log permits cancellation of the pending CSN; no data deleted.
INVALID-ARGUMENT for a healthy log/token; busy retains credit. Does not reopen the faulty buffer."
  (esigi-identita-csn-lotto lotto registry slot high low)
  (unless (eq (log-io-state (lotto-csn-log lotto)) :faulted)
    (error 'invalid-argument :reason :lotto-log-not-faulted))
  (risolvi-token-lotto lotto))

;;; REQ: REQ-MVC-008 REQ-WAL-005
(declaim (ftype (function (lotto) (values (member :libero :pendente :risolto) &optional)) stato-csn-lotto)
         (ftype (function (lotto) (values index u32 u32 &optional)) leggi-csn-lotto))
(defun stato-csn-lotto (lotto)
  "Pre: writer capability/synchronized event. Post: local CSN association, without a mutex.
Observes neither H nor log health; no modification or acknowledgment."
  (if (lotto-csn-registry lotto) (if (lotto-csn-pending lotto) :pendente :risolto) :libero))

;;; REQ: REQ-MVC-008 REQ-WAL-005
(defun leggi-csn-lotto (lotto)
  "Pre: owned batch, handoff complete. Post: slot and CSN words retained even after resolution.
INVALID-ARGUMENT without an association; constructs no u64 and does not observe the shared registry."
  (unless (lotto-csn-registry lotto) (error 'invalid-argument :reason :lotto-csn-free))
  (values (lotto-csn-slot lotto) (lotto-csn-high lotto) (lotto-csn-low lotto)))
