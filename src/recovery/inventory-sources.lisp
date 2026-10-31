;;;; Composizione: una enumerazione, acquisizione completa o cleanup di tutti i child.
;;; OWNER: compito I/O del controller fino al ritorno; poi il chiamante possiede il set.
;;; SHARED: solo capacità locali, nessun registro o scrittura condivisa fra Serie.
(in-package #:arcdocdb.recovery.manifest)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-REC-001 REQ-REC-004 REQ-AFF-004
(declaim (ftype (function ((or null arcdocdb.conditions:arcdocdb-error)
                          (or null arcdocdb.conditions:io-fault) index) null)
                segnala-acquisizione-fonti))
(defun segnala-acquisizione-fonti (primary cleanup count)
  "Pre: cleanup finished. Post: returns only without error; EQ-identical original primary cause if closes succeeded.
RECOVERY-SOURCES-CLEANUP-ERROR preserves primary cause, first cleanup failure, and total count."
  (when cleanup
    (error 'recovery-sources-cleanup-error :reason :recovery-sources-cleanup
           :primary primary :cleanup cleanup :count count))
  (when primary (error primary))
  nil)

;;; REQ: REQ-REC-001 REQ-REC-002 REQ-REC-004 REQ-AFF-001 REQ-AFF-004 REQ-AFF-008 REQ-AFF-018
(declaim (ftype (function (manifest arcdocdb.io:file-io
                          &key (:max-files integer) (:max-segmenti integer) (:max-names t)
                               (:max-total-name-bytes t) (:max-name-bytes t) (:max-transfer t)
                               (:max-file-bytes t) (:max-total-file-bytes t))
                         (values recovery-sources reconciliation-plan &optional)) apri-fonti-recovery))
(defun apri-fonti-recovery
    (manifest directory &key (max-files 65536) (max-segmenti 65536) (max-names 65536)
                            (max-total-name-bytes 16777216) (max-name-bytes 255)
                            (max-transfer 268435456) (max-file-bytes #xffffffff)
                            (max-total-file-bytes #xffffffff))
  "Pre: I/O pool, exclusive stable manifest/namespace until return, no asynchronous cancellation.
Post: complete owned read-only ACTIVE/CLOSED set and plan, or no child published.
One enumeration only; parent borrowed and intact, live temporaries opened without rename.
INVALID-ARGUMENT if plan not READY or budgets invalid; dependency conditions propagated.
Each acquired child enters set before subsequent checks; all closed on error.
Cleanup failures aggregated after all attempts; other nonlocal exits preserve cause.
EOF certifies neither header/CRC nor durable prefix; no admission or durable atomicity."
  (arcdocdb.io::verifica-apertura-relativa directory "0000000000000000.seg" max-transfer max-file-bytes)
  (unless (typep max-total-file-bytes 'index)
    (error 'invalid-argument :reason :recovery-sources-total-budget))
  (let* ((plan (pianifica-riconciliazione-directory
                manifest directory :max-files max-files :max-segmenti max-segmenti
                :max-names max-names :max-total-name-bytes max-total-name-bytes
                :max-name-bytes max-name-bytes))
         (sources (prepara-fonti-recovery plan))
         (complete nil) (primary nil) (cleanup nil) (failures 0))
    (unwind-protect
         (handler-case
             (progn
               (acquista-fonti-recovery sources directory max-transfer max-file-bytes max-total-file-bytes)
               (setf complete t))
           (arcdocdb.conditions:arcdocdb-error (condition) (setf primary condition)))
      (unless complete
        (multiple-value-setq (cleanup failures) (cleanup-fonti-recovery sources))))
    (segnala-acquisizione-fonti primary cleanup failures)
    (values sources plan)))
