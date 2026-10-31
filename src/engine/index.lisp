;;; OWNER: indice privato fino ad admission, poi un solo writer/reader seriale dell'attore.
;;; SHARED: solo primitive canoniche locali, nessuna radice visibile ad altri attori M1.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IDX-001 REQ-IDX-005 REQ-LIM-003 REQ-AFF-008 REQ-IDX-010
(declaim (ftype (function (motore (member 1 2) octets) null) verifica-capienza-indice-motore))
(defun verifica-capienza-indice-motore (engine kind key)
  "Pre: serial READY owner, validated key; no other mutator until commit.
Post: ordinary capacity rejection without changing index, CSN, or files; engine remains READY.
Invariant/internal error closes admission and retains the primary condition. The fault-marker is
attempted here too; its secondary errors do not mask the cause. No reservation."
  (when (motore-automatic-index engine) (return-from verifica-capienza-indice-motore nil))
  (handler-case
      (let ((index (motore-index engine)))
        (multiple-value-bind (high low) (p:digest-chiave-indice index key 0 (length key))
          (p:verifica-capienza-mutazione-indice index (p:frammento-corrente-indice index high)
            key 0 (length key) high low (motore-index-context engine)
            :rimozione (= kind arcdocdb.record:+tombstone+))))
    (resource-exhausted (condition) (error condition))
    (error (condition)
      (tenta-cleanup-motore engine (lambda () (guasta-motore engine condition)))
      (error condition)))
  nil)

;;; REQ: REQ-IDX-001 REQ-IDX-006 REQ-IDX-011 REQ-REC-001 REQ-AFF-008
(declaim (ftype (function (motore (member 1 2) octets u64 u64 index index) null) pubblica-location-motore))
(defun pubblica-location-motore (engine kind key csn segment offset bytes)
  "Pre: verified committed datum or strong batch already published; one owner, no concurrent GET.
Post: PUT candidate updated or tombstone key absent; u32 slots verified before packing.
Canonical errors without client confirmation; replay remains private until READY."
  (when (motore-automatic-index engine)
    (return-from pubblica-location-motore (publish-automatic-index engine kind key 0 (length key) csn segment offset bytes)))
  (unless (and (<= 1 segment #xffffffff) (<= offset #xffffffff) (<= bytes #xffffffff))
    (error 'unsupported-format :reason :engine-location-range))
  (multiple-value-bind (high low) (p:digest-chiave-indice (motore-index engine) key 0 (length key))
    (let* ((index (motore-index engine)) (fragment (p:frammento-corrente-indice index high))
           (context (motore-index-context engine)) (words (motore-words engine)))
      (case kind
        (1
         (fill words 0)
         (setf (aref words 0) csn (aref words 1) (logior (ash segment 32) offset)
               (aref words 2) (logior (ash (length key) 32) (ash 1 48)) (aref words 3) bytes)
         (p:pubblica-chiave-indice index fragment key 0 (length key) high low words context))
        (2
         ;; NIL e' assenza preesistente ammessa, non un errore o un esito di I/O.
         (let ((removed (p:rimuovi-chiave-indice index fragment key 0 (length key) high low context)))
           (unless (typep removed 'boolean) (error 'invariant-violation :reason :engine-delete-result))))
        (otherwise (error 'invariant-violation :reason :engine-record-kind)))))
  (pubblica-location-delta-motore engine kind key csn segment offset bytes)
  (registra-fonte-indice-motore engine csn segment offset bytes)
  nil)

;;; REQ: REQ-REC-001 REQ-IDX-001 REQ-IDX-006 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (motore simple-vector rs:limiti-recovery-serie) null) ricostruisci-indice-motore))
(defun ricostruisci-indice-motore (engine closed limits)
  "Pre: all CLOSED proofs verified, empty private index, and admission closed.
Post: latest ordinary versions and tombstones in strict CSN order, across all canonical prefixes.
Rejects prepared data as outside M1, and rejects ambiguous data; no preexisting byte modified."
  (let ((previous nil))
    (loop for recovered across closed do
      (arcdocdb.recovery.replay:visita-record-closed-recuperato recovered (motore-scratch engine) limits
       (lambda (buffer start end segment offset version prepared-csn)
         (when prepared-csn (error 'unsupported-format :reason :engine-prepared-outside-m1))
         (multiple-value-bind (next kind flags ks ke vs ve)
             (arcdocdb.record:verifica-cornice buffer start end :version version)
           (declare (ignore vs ve)) ; range valori verificato, non esito d'errore.
           (unless (and (= next end) (zerop flags))
             (error 'corruption-detected :reason :engine-replay-frame))
           (let ((csn (b:leggi-u64 buffer (+ start arcdocdb.record::+stamp-offset+))))
             (when (and previous (<= csn previous))
               (error 'corruption-detected :reason :engine-replay-csn-order))
             (setf previous csn)
             (if (motore-automatic-index engine)
                 (progn (prepare-automatic-index engine kind buffer ks ke)
                        (publish-automatic-index engine kind buffer ks ke csn segment offset (- end start)))
                 (pubblica-location-motore engine kind (subseq buffer ks ke) csn segment offset (- end start)))))
         nil))))
  nil)
