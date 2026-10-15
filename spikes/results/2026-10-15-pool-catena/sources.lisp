(:SCHEMA-VERSION 1 :KIND :POOL-CHAIN-SOURCE-BUNDLE :PART 1 :PARTS 1 :SOURCES
 ((:PATH #A((12) BASE-CHAR . "arcdocdb.asd") :BYTES 18477 :SHA256
   "334e0bcbd2b9eb681119d1d370f792834b140d5b894f24e9c112bd031fe44ff7" :GIT-BLOB
   "c118995819fce345df49bd760aa1ab9e6ef83903" :TEXT
   ";;;; arcdocdb.asd — definizione di sistema ASDF.
;;;;
;;;; Fondazioni dello storage, autorizzate dall'autore il 2026-10-08.

(in-package #:asdf-user)

(defsystem \"arcdocdb\"
  :description \"Database server documentale general-purpose, append-only, in Common Lisp (SBCL).\"
  :author \"Giacomo Picchiarelli\"
  :license \"BSD-2-Clause\"
  :version \"0.0.0\"
  :pathname \"src/\"
  :serial t
  :depends-on (\"sb-posix\")
  :components ((:file \"package\")
               (:module \"foundation\"
                :serial t
                :components ((:file \"package\") (:file \"conditions\")
                             (:file \"binary\") (:file \"crc32c\")
                             (:file \"record\") (:file \"batch\")))
               (:module \"hash\" :serial t
                :components ((:file \"package\") (:file \"arithmetic\") (:file \"blocks\") (:file \"hash64\")))
               (:module \"codec\" :serial t
                :components ((:file \"package\") (:file \"utf8\")
                             (:file \"cbor-package\") (:file \"cbor-header\")
                             (:file \"cbor-float-minimal\") (:file \"cbor-minimal\")
                             (:file \"cbor-space\") (:file \"cbor-scan-input\")
                             (:file \"cbor-scan-stack\") (:file \"cbor-scan-items\")
                             (:file \"cbor-scan\") (:file \"cbor-scan-minimal\")
                             (:file \"cbor-write\") (:file \"cbor-string-write\")
                             (:file \"cbor-simple-write\")
                             (:file \"cbor-float-narrow\") (:file \"cbor-float-write\")
                             (:file \"cbor-array-input\") (:file \"cbor-array-write\")
                             (:file \"cbor-map-input\") (:file \"cbor-map-write\")
                             (:file \"cbor-tag-input\") (:file \"cbor-tag-write\")
                             (:file \"cbor-item-read\")))
               (:module \"csn\" :serial t
                :components ((:file \"package\") (:file \"registry\")))
               (:module \"cache\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"build\") (:file \"core\")
                             (:file \"read\") (:file \"clock\") (:file \"write\")))
               (:module \"execution\" :serial t
                :components ((:file \"package\") (:file \"queue\") (:file \"writer\")
                             (:file \"handoff\") (:file \"ready-types\") (:file \"ready\")
                             (:file \"ready-recycle\")
                             (:file \"worker-types\") (:file \"worker-boundary\") (:file \"worker-claim\") (:file \"worker-run\")))
               (:module \"scheduler\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"build\")
                             (:file \"read\") (:file \"policy\") (:file \"update\")
                             (:file \"lifecycle-types\") (:file \"lifecycle-read\")
                             (:file \"lifecycle-build\") (:file \"lifecycle-worker\")
                             (:file \"lifecycle-update\") (:file \"pool-claim\")))
               (:module \"storage\"
                :serial t
                :components ((:file \"package\") (:file \"formats\") (:file \"segment-header\")
                             (:file \"log-header\") (:file \"compaction-scan\")
                             (:file \"control-payload\") (:file \"payload-record\")
                             (:file \"payload-write\")))
               (:module \"io\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"identity-types\")
                             (:file \"native\") (:file \"native-namespace\") (:file \"lifecycle\") (:file \"identity\")
                             (:file \"rename\") (:file \"namespace\") (:file \"transfer\") (:file \"flush\")))
               (:module \"wal\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"builder\")
                             (:file \"group\") (:file \"executor\") (:file \"csn\")))
               (:module \"series\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"ownership\")
                             (:file \"events\") (:file \"io-events\") (:file \"publication\")
                             (:file \"query\") (:file \"retirement\")
                             (:file \"worker-package\") (:file \"worker-types\")
                             (:file \"worker-boundary\") (:file \"worker-run\")
                             (:file \"routing-types\") (:file \"routing-build\") (:file \"routing-select\")))
               (:module \"dispatch\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"build\") (:file \"claim\")
                             (:file \"recycle\") (:file \"begin\") (:file \"step\")))
               (:module \"index\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"core\")
                             (:file \"validation\") (:file \"read\") (:file \"write\") (:file \"relocate\")
                             (:file \"primary-package\") (:file \"primary-types\") (:file \"primary-core\")
                             (:file \"primary-build\") (:file \"primary-probe\") (:file \"primary-read\")
                             (:file \"primary-write\") (:file \"primary-relocate\")
                             (:file \"primary-arena\") (:file \"primary-directory\")
                             (:file \"rebuild-scan\") (:file \"rebuild-budget\")
                             (:file \"rebuild-copy\") (:file \"rebuild\")
                             (:file \"hash-seed\") (:file \"hash-digests\")))
               (:module \"mvcc\" :serial t
                :components ((:file \"package\") (:file \"types\")
                             (:file \"snapshots-types\") (:file \"snapshots-core\") (:file \"snapshots-csn\")
                             (:file \"snapshots-register\") (:file \"snapshots-lifecycle\")
                             (:file \"snapshots-read\")))
               (:module \"epochs\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"core\")
                             (:file \"read\") (:file \"retire\") (:file \"reclaim\")))
               (:module \"read\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"core\")
                             (:file \"task\")))
               (:module \"get\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"build\")
                             (:file \"lifecycle\") (:file \"lookup\") (:file \"target\") (:file \"segment\")))
               (:module \"recovery\"
                :serial t
                :components ((:file \"package\") (:file \"scan\")
                             (:file \"decisions-package\") (:file \"decisions-types\")
                             (:file \"decisions-sort\") (:file \"decisions-radix\") (:file \"decisions-build\")
                             (:file \"decisions-query\")
                             (:file \"manifest-package\") (:file \"manifest-types\")
                             (:file \"manifest-decode\") (:file \"manifest-fold\")
                             (:file \"manifest-build\") (:file \"manifest-query\") (:file \"manifest-transition\")
                             (:file \"inventory-types\") (:file \"inventory-build\")
                             (:file \"inventory-query\")))
               (:module \"get-resolver\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"scan\") (:file \"sort\")
                             (:file \"rows\") (:file \"build\") (:file \"read\")
                             (:file \"active-types\") (:file \"active-directory\")
                             (:file \"active-scan\") (:file \"active-build\") (:file \"active-init\")
                             (:file \"active-preflight\") (:file \"active-read\")))
               (:module \"get-directory\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"build\") (:file \"read\")
                             (:file \"sources-types\") (:file \"sources-read\")))
               (:module \"active\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"preflight\")
                             (:file \"prepare\") (:file \"source\")))
               (:module \"control\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"dependency\")
                             (:file \"build\") (:file \"preflight\") (:file \"transfer\") (:file \"prepare\")
                             (:file \"publication\") (:file \"publication-read\")
                             (:file \"recovery-types\") (:file \"recovery-read\") (:file \"recovery-publication\")))
               (:module \"recovery-active\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"read\") (:file \"frames\")
                             (:file \"resolve\") (:file \"build\") (:file \"query\")
                             (:file \"closure\") (:file \"publication\")))
               (:module \"recovery-archive\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"read\")
                             (:file \"build\") (:file \"query\") (:file \"active\")))
               (:module \"recovery-checkpoint\" :serial t
                :components ((:file \"package\") (:file \"preflight\") (:file \"order\")
                             (:file \"sections\") (:file \"build\"))))
  :in-order-to ((test-op (test-op \"arcdocdb/tests\"))))

(defsystem \"arcdocdb/tests\"
  :description \"Test di ArcDocDB.\"
  :author \"Giacomo Picchiarelli\"
  :license \"BSD-2-Clause\"
  :depends-on (\"arcdocdb\")
  :pathname \"tests/\"
  :serial t
  :components ((:file \"smoke\")
               (:module \"hash\" :serial t
                :components ((:file \"support\") (:file \"hash64\") (:file \"guards\") (:file \"threads\")))
               (:module \"foundation\"
                :serial t
                :components ((:file \"support\") (:file \"binary\")
                             (:file \"record\") (:file \"batch\")))
               (:module \"codec\" :serial t
                :components ((:file \"support\") (:file \"utf8\") (:file \"threads\")
                             (:file \"cbor-support\") (:file \"cbor-header\") (:file \"cbor-threads\")
                             (:file \"cbor-minimal-support\") (:file \"cbor-minimal\")
                             (:file \"cbor-minimal-threads\") (:file \"cbor-minimal-edges\")
                             (:file \"cbor-structure-support\") (:file \"cbor-structure\")
                             (:file \"cbor-structure-threads\")
                             (:file \"cbor-minimal-scan-support\") (:file \"cbor-minimal-scan\")
                             (:file \"cbor-minimal-scan-threads\")
                             (:file \"cbor-write-support\") (:file \"cbor-write\")
                             (:file \"cbor-write-threads\") (:file \"cbor-write-roundtrip\")
                             (:file \"cbor-string-write-support\") (:file \"cbor-string-write\")
                             (:file \"cbor-string-write-threads\")
                             (:file \"cbor-simple-write-support\") (:file \"cbor-simple-write\")
                             (:file \"cbor-simple-write-threads\")
                             (:file \"cbor-float-write-support\") (:file \"cbor-float-write\")
                             (:file \"cbor-float-write-threads\")
                             (:file \"cbor-array-write-support\") (:file \"cbor-array-write\")
                             (:file \"cbor-array-write-threads\")
                             (:file \"cbor-map-write-support\") (:file \"cbor-map-write\")
                             (:file \"cbor-map-write-threads\")
                             (:file \"cbor-tag-write-support\") (:file \"cbor-tag-write\")
                             (:file \"cbor-tag-write-threads\")
                             (:file \"cbor-item-read-support\") (:file \"cbor-item-read\")
                             (:file \"cbor-item-read-threads\")))
               (:module \"csn\" :serial t
                :components ((:file \"support\") (:file \"registry\") (:file \"threads\")))
               (:module \"mvcc\" :serial t
                :components ((:file \"support\") (:file \"lifecycle\") (:file \"capture\")))
               (:module \"epochs\" :serial t
                :components ((:file \"support\") (:file \"lifecycle\") (:file \"threads\")))
               (:module \"read\" :serial t
                :components ((:file \"support\") (:file \"lifecycle\") (:file \"threads\")))
               (:module \"get\" :serial t
                :components ((:file \"support\") (:file \"lifecycle\") (:file \"segment\")))
               (:module \"get-performance\" :serial t
                :components ((:file \"support\") (:file \"paths\") (:file \"guards\") (:file \"threads\")))
               (:module \"get-directory\" :serial t
                :components ((:file \"support\") (:file \"construction\") (:file \"read\") (:file \"threads\")
                             (:file \"series-support\") (:file \"series-read\")
                             (:file \"lifetime-support\") (:file \"lifetime\")))
               (:module \"get-resolver\" :serial t
                :components ((:file \"support\") (:file \"sort\") (:file \"construction\") (:file \"read\")))
               (:module \"get-active\" :serial t
                :components ((:file \"support\") (:file \"construction\") (:file \"preflight\")
                             (:file \"directory\") (:file \"read\")))
               (:module \"execution\" :serial t
                :components ((:file \"support\") (:file \"queue\") (:file \"threads\")
                             (:file \"handoff\") (:file \"ready\") (:file \"ready-recycle\") (:file \"worker\")))
               (:module \"scheduler\" :serial t
                :components ((:file \"support\") (:file \"controller\") (:file \"lifecycle\")
                             (:file \"pool-claim\") (:file \"dispatch\") (:file \"pool-recycle\")
                             (:file \"pool-begin\") (:file \"pool-step\")
                             (:file \"pool-chain-support\") (:file \"pool-chain\")))
               (:module \"storage\"
                :serial t
                :components ((:file \"support\") (:file \"segment-header\") (:file \"log-header\")
                             (:file \"compaction-scan\")
                             (:file \"control-payload\")))
               (:module \"io\" :serial t
                :components ((:file \"support\") (:file \"transfer\") (:file \"native\")
                             (:file \"rename\") (:file \"rename-native\") (:file \"flush-failure\")
                             (:file \"transfer-failure\")))
               (:module \"control\" :serial t
                :components ((:file \"support\") (:file \"publication\") (:file \"native\")
                             (:file \"recovery-read\") (:file \"recovery-publication\") (:file \"recovery-guards\")))
               (:module \"recovery\"
                :serial t
                :components ((:file \"support\") (:file \"scan\") (:file \"corruption\")
                             (:file \"decisions-support\") (:file \"decisions\")
                             (:file \"decisions-audit\") (:file \"decisions-radix\") (:file \"manifest-support\")
                             (:file \"manifest\") (:file \"manifest-audit\") (:file \"manifest-transition\")
                             (:file \"inventory-support\") (:file \"inventory\")))
               (:module \"recovery-active\" :serial t
                :components ((:file \"support\") (:file \"read\") (:file \"semantics\") (:file \"publication\")))
               (:module \"wal\" :serial t
                :components ((:file \"support\") (:file \"builder\") (:file \"group\") (:file \"fault\")
                             (:file \"native\") (:file \"csn\") (:file \"csn-threads\")))
               (:module \"series\" :serial t
                :components ((:file \"support\") (:file \"controller\") (:file \"boundaries\") (:file \"threads\")
                             (:file \"worker-bridge\") (:file \"worker-routing\")))
               (:module \"index\" :serial t
                :components ((:file \"slot-support\") (:file \"slots\") (:file \"slot-threads\")
                             (:file \"primary-support\") (:file \"primary\") (:file \"primary-threads\")
                             (:file \"rebuild\") (:file \"hash-digests\"))))
  :perform (test-op (o c)
             (uiop:symbol-call '#:arcdocdb.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.hash64.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.foundation.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.utf8.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.minimal.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.structure.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.minimal.scan.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.string.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.simple.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.float.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.array.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.map.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.tag.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.item.read.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.csn.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.mvcc.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.epochs.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.read.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.performance.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.directory.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.resolver.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.active.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.execution.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.scheduler.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.storage.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.io.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.control.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.recovery.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.recovery.active.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.wal.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.series.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.index.slots.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.index.primary.tests '#:run)))
")
  (:PATH #A((39) BASE-CHAR . "tests/scheduler/pool-chain-support.lisp") :BYTES 3573 :SHA256
   "3a1cfd174c8ca8ee7bb713b026e644e45ab444aa762f0e28d95d6e502b7fbfaf" :GIT-BLOB
   "a1ea8258495b9a717e1e0ef164133f6b7140f8a5" :TEXT
   ";;;; Catena pubblica su thread reali; nessuna FI o stato globale nuovo.
;;;; OWNER: context/port/table/link sul worker; coordinator sul chiamante del test.
;;;; SHARED: ready per tratto, registro immutabile, canali C4 con timeout 15s.
(in-package #:arcdocdb.scheduler.tests)

(defun pool-chain-local (ready registry coordinator &optional (start 0))
  \"Costruisce sul vero owner le risorse locali di un worker della catena.\"
  (let* ((context (arcdocdb.execution:crea-contesto-worker-writer ready :start start))
         (port (arcdocdb.scheduler:crea-porta-worker-pool context :coordinator coordinator))
         (table (arcdocdb.execution.series:crea-tabella-worker-serie context registry)))
    (values context port
            (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port table))))

(defun pool-chain-take (dispatcher context writer origin detail)
  \"Oracolo pubblico: un CLAIMED del writer atteso, con link ancora IDLE.\"
  (multiple-value-bind (link status actual-origin actual-detail action)
      (arcdocdb.scheduler.dispatch:passo-dispatcher-pool dispatcher)
    (is (typep link 'arcdocdb.execution.series:collegamento-worker-serie))
    (is (eq :claimed status)) (is (eq origin actual-origin))
    (is (= detail actual-detail))
    (is (eq (if (eq origin :claim) :unchanged nil) action))
    (is (eq :claimed (arcdocdb.execution:stato-worker-writer context)))
    (is (eq writer (arcdocdb.execution:writer-worker-writer context)))
    (is (eq :idle (arcdocdb.execution.series:stato-worker-serie link)))
    link))

(defun pool-chain-begin (dispatcher link)
  (multiple-value-bind (actual token phase reason)
      (arcdocdb.scheduler.dispatch:inizia-obbligo-pool dispatcher)
    (is (eq actual link)) (is (plusp token)) (is (eq :active phase))
    (is (null reason))
    (is (plusp (arcdocdb.execution.series:lease-worker-serie link token)))
    token))

(defun pool-chain-ack-end (context link token batch action)
  \"Debito verificato e confermato esplicitamente, poi rilascio di entrambe le lease.\"
  (is (eq :batch (arcdocdb.execution:stato-worker-writer context)))
  (is (null (arcdocdb.execution.series:conferma-worker-serie link token batch)))
  (is (eq :running (arcdocdb.execution:stato-worker-writer context)))
  (is (eq action (arcdocdb.execution.series:termina-worker-serie link token)))
  (is (eq :idle (arcdocdb.execution.series:stato-worker-serie link)))
  (is (null (arcdocdb.execution.series:errore-worker-serie link)))
  (is (eq (if (eq action :idle) :idle :reschedule)
          (arcdocdb.execution:stato-worker-writer context))))

(defun pool-chain-finish (dispatcher context link item action)
  (let* ((token (pool-chain-begin dispatcher link))
         (batch (pool-claim-bridge-pop link token item)))
    (pool-chain-ack-end context link token batch action)))

(defun pool-chain-published (dispatcher count)
  (pool-step-check dispatcher nil :published :recycle count nil))

(defun pool-chain-empty (dispatcher context cursor)
  (pool-step-check dispatcher nil :empty :claim cursor :unchanged)
  (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))
  (is (null (arcdocdb.execution:writer-worker-writer context)))
  (is (null (arcdocdb.execution:errore-worker-writer context))))

(defun pool-chain-writer (count ordinal)
  (let ((writer (arcdocdb.execution:crea-writer-programmabile
                 :capacity 64 :quantum 1 :routing-index ordinal)))
    (dotimes (index count)
      (arcdocdb.execution.tests::handoff-check-enqueue
       writer index (1+ index) (if (zerop index) :schedule :queued)))
    writer))
")
  (:PATH #A((31) BASE-CHAR . "tests/scheduler/pool-chain.lisp") :BYTES 8836 :SHA256
   "81da71e08d0e5196b01fb51666b9c123dc3c1d1b206f02076ab5a1c74d6f0c85" :GIT-BLOB
   "86675c17ea47eff262cb03cdb41e50bcdb82b78e" :TEXT
   ";;;; Due worker con ready/routing condivisi: lease distinte e migrazione dopo ritiro.
;;;; Le attese artificiali con lease/debito sono esclusivamente controlli C4.
(in-package #:arcdocdb.scheduler.tests)

(defun pool-chain-independent (held-phase)
  (multiple-value-bind (left left-file) (pool-claim-series 91)
    (multiple-value-bind (right right-file) (pool-claim-series 92)
      (let* ((ready (arcdocdb.execution:crea-lista-writer-pronti :shards 1 :capacity 2))
             (a (pool-chain-writer 2 0)) (b (pool-chain-writer 32 1))
             (registry (arcdocdb.execution.series:crea-registro-worker-serie
                        (vector a b) (vector left right)))
             (coordinator sb-thread:*current-thread*)
             (held (sb-thread:make-semaphore)) (release (sb-thread:make-semaphore))
             (threads nil) (fast nil))
        (unwind-protect
             (progn
               (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 a)))
               (is (= 2 (arcdocdb.execution:pubblica-writer-pronto ready 0 b)))
               (push
                (pool-thread
                 \"pool-chain-held\"
                 (lambda ()
                   (multiple-value-bind (context port dispatcher)
                       (pool-chain-local ready registry coordinator)
                     (declare (ignore port))
                     (let* ((link (pool-chain-take dispatcher context a :claim 0))
                            (token (pool-chain-begin dispatcher link))
                            (batch (when (eq held-phase :batch)
                                     (pool-claim-bridge-pop link token 0))))
                       (is (eq held-phase (arcdocdb.execution:stato-worker-writer context)))
                       (sb-thread:signal-semaphore held)
                       (pool-wait release)
                       ;; B è già joined: nessuna release di A poteva abilitarlo.
                       (unless batch (setf batch (pool-claim-bridge-pop link token 0)))
                       (pool-chain-ack-end context link token batch :schedule))
                     (pool-chain-published dispatcher 1)
                     (pool-chain-finish dispatcher context
                                        (pool-chain-take dispatcher context a :claim 0) 1 :idle)
                     (pool-chain-empty dispatcher context 0)
                     :ok))) threads)
               (pool-wait held)
               (setf fast
                     (pool-thread
                      \"pool-chain-progress\"
                      (lambda ()
                        (multiple-value-bind (context port dispatcher)
                            (pool-chain-local ready registry coordinator)
                          (declare (ignore port))
                          (dotimes (index 32)
                            (pool-chain-finish
                             dispatcher context (pool-chain-take dispatcher context b :claim 0)
                             index (if (= index 31) :idle :schedule))
                            (unless (= index 31) (pool-chain-published dispatcher 1)))
                          (pool-chain-empty dispatcher context 0)
                          :ok))))
               (push fast threads)
               (pool-join fast)
               (sb-thread:signal-semaphore release)
               (pool-join (second threads))
               (format t \"  pool-chain: A ~S, B 32 quantum conclusi prima della release A.~%\"
                       held-phase))
          (sb-thread:signal-semaphore release)
          (pool-stop-threads threads)
          (arcdocdb.io:chiudi right-file) (arcdocdb.io:chiudi left-file))))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-chain-other-series-completes-before-held-lease-and-batch-release
  (dolist (phase '(:running :batch)) (pool-chain-independent phase)))

(defun pool-chain-retiring-worker (ready routing writers coordinator ports started staged resume home full)
  (multiple-value-bind (context port dispatcher)
      (pool-chain-local ready routing coordinator home)
    (setf (svref ports 1) port)
    (sb-thread:signal-semaphore started)
    (pool-wait resume)
    (let ((link (pool-chain-take dispatcher context (svref writers 0)
                                 :claim (mod (1+ home) 3))))
      (pool-chain-finish dispatcher context link :a1 :schedule))
    (sb-thread:signal-semaphore staged)
    (pool-wait resume)
    (if full
        (pool-chain-finish
         dispatcher context
         (pool-chain-take dispatcher context (svref writers 1) :recycle 1) :b1 :idle)
        (pool-chain-published dispatcher 2))
    (pool-step-check dispatcher nil :inactive :claim (mod (1+ home) 3) :retired)
    (pool-step-check dispatcher nil :inactive :claim (mod (1+ home) 3) :unchanged)
    (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))
    (is (null (arcdocdb.execution:errore-worker-writer context)))
    :ok))

(defun pool-chain-retirement (capacity home)
  (multiple-value-bind (left left-file) (pool-claim-series 93)
    (multiple-value-bind (right right-file) (pool-claim-series 94)
      (let* ((ready (arcdocdb.execution:crea-lista-writer-pronti :shards 3 :capacity capacity))
             (a (pool-claim-writer '(:a1 :a2) 0)) (b (pool-claim-writer '(:b1) 1))
             (routing (arcdocdb.execution.series:crea-registro-worker-serie
                       (vector a b) (vector left right)))
             (coordinator sb-thread:*current-thread*) (ports (vector nil nil))
             (started (sb-thread:make-semaphore)) (staged (sb-thread:make-semaphore))
             (resume (sb-thread:make-semaphore)) (take-over (sb-thread:make-semaphore))
             (threads nil) (retiring nil) (remaining nil))
        (unwind-protect
             (progn
               (setf remaining
                     (pool-thread
                      \"pool-chain-take-over\"
                      (lambda ()
                        (multiple-value-bind (context port dispatcher)
                            (pool-chain-local ready routing coordinator home)
                          (setf (svref ports 0) port)
                          (sb-thread:signal-semaphore started)
                          (pool-wait take-over)
                          (when (= capacity 2)
                            (pool-chain-finish
                             dispatcher context
                             (pool-chain-take dispatcher context b :claim (mod (1+ home) 3))
                             :b1 :idle))
                          (pool-chain-finish
                           dispatcher context
                           (pool-chain-take dispatcher context a :claim (mod (1+ home) 3))
                           :a2 :idle)
                          (pool-chain-empty dispatcher context (mod (+ home 2) 3))
                          :ok))))
               (push remaining threads)
               (setf retiring
                     (pool-thread
                      \"pool-chain-retire\"
                      (lambda () (pool-chain-retiring-worker
                                  ready routing (vector a b) coordinator ports started staged resume home
                                  (= capacity 1)))))
               (push retiring threads)
               (pool-wait started 2)
               (let* ((controller (crea-controllore-pool 1 :initial 2 :dwell 500))
                      (registry (arcdocdb.scheduler:crea-registro-pool controller ports)))
                 (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready home a)))
                 (sb-thread:signal-semaphore resume)
                 (pool-wait staged)
                 (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready home b)))
                 (lifecycle-start-retirement controller registry)
                 (sb-thread:signal-semaphore resume)
                 (pool-join retiring)
                 (is (equal '(1 1 nil) (lifecycle-registry-state registry)))
                 (sb-thread:signal-semaphore take-over)
                 (pool-join remaining)
                 (is (equal '(1 1 nil) (lifecycle-registry-state registry)))
                 (format t \"  pool-chain: capacity ~D, home ~D, ~A, ritiro e handoff conclusi.~%\"
                         capacity home (if (= capacity 1) :full :room))))
          (sb-thread:signal-semaphore resume 2)
          (sb-thread:signal-semaphore take-over)
          (pool-stop-threads threads)
          (arcdocdb.io:chiudi right-file) (arcdocdb.io:chiudi left-file))))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-THR-001-pool-chain-full-room-retirement-and-cross-worker-ready-handoff
  (dolist (capacity '(1 2))
    (dolist (home '(0 2)) (pool-chain-retirement capacity home))))
")
  (:PATH #A((42) BASE-CHAR . "docs/implementazione/pool-catena-metodo.md") :BYTES 2812 :SHA256
   "5d6677962c2dc40bcfb7425c08e9b5ed7f509d16b9722530cf74110f39e8cc97" :GIT-BLOB
   "c6affaba71aedd2f1e1ac900f01755bcfab90ce6" :TEXT
   "# Verifica della catena pool, dispatcher e Serie

Metodo C4 preregistrato il 2026-10-15 sulla base
`a34cede6fbc9215908d50aa85311d5d703660040`, prima di eseguire le nuove prove.
REQ-THR-001, REQ-CON-001/002/004/005 e REQ-AFF-008; ADR-0031/0034/0045.
I sorgenti di prodotto restano invariati. Si verificano insieme il
[passo dispatcher](pool-step.md), l'[avvio](pool-begin.md) e il
[bridge Serie](worker-serie.md), usando API pubbliche e thread reali.

## Scenari e oracoli

1. Due worker con contesti, porte, tabelle e link creati sui rispettivi thread,
   registro di routing immutabile e ready condivisa. Il primo mantiene la lease
   della Serie A; il secondo completa **32 quantum** della Serie B prima che il
   coordinatore liberi A. Ripetere con A in ACTIVE/RUNNING e con debito BATCH.
   L'oracolo verifica payload FIFO, token, count, stato e tutti i cinque valori
   del dispatcher. B termina ed è joined prima della release di A.
2. Ritiro del secondo worker mentre deve ricircolare A dopo il primo quantum.
   Il coordinatore accoda B e richiede il ritiro tramite il registro pubblico.
   Ready a tre partizioni, home 0 e 2, capacità 1 e 2: quattro scenari.
   Full scambia A con B, completa B e applica il ritiro soltanto al successivo
   ingresso IDLE. Room pubblica A, termina il passo e ritira senza nuova presa.
   Il primo worker prende e completa il lavoro rimasto; ogni payload atteso
   compare una volta sola, in ordine. Il registro converge a un worker attivo.

Le barriere C4 fissano l'ordine degli eventi, non sostituiscono i trasferimenti
del prodotto. Nessuna FI sui valori, sulle funzioni o sulle parole lifecycle.
Le semafore e i join hanno timeout di 15 secondi; i cicli hanno cardinalità
nota (2 modalità, 32 quantum, 4 scenari). Gli errori dei thread vengono
propagati al test. Nel cleanup si liberano le barriere, si terminano e si
uniscono i thread della fixture prima di chiudere i backend in memoria.

## Verifica e limiti

Compilazione stretta senza warning/style-warning, suite scheduler e suite
completa tramite `make check`; registri originali conservati, anche in caso
di fallimento. Rilettura C4 della fixture e dei suoi oracoli prima della
qualifica finale. Nessun nuovo codice caldo: le misure di allocazione e
copertura precedenti non vengono reinterpretate come misure di queste prove.

Le pause artificiali con lease/debito appartengono solo alla fixture di test:
non sono un compito di prodotto che attende. Il risultato prova la possibilità
di avanzare su due Serie distinte in questi ordini sincronizzati, non lo speedup
su due core, fairness generale, assenza universale di race o memoria debole.
Payload simbolici/interi verificati e confermati dal caller: nessuna applicazione
di PUT, commit durevole, I/O reale, park/wake o loop server viene qualificata.
")
  (:PATH #A((45) BASE-CHAR . "docs/implementazione/pool-catena-risultati.md") :BYTES 5720 :SHA256
   "0e79ea8a86d4202165d938a3c13d72c42a793a518dbaecb76b57b2b0303faf67" :GIT-BLOB
   "b12844637cc5317a2d4fd9214f7472aa9696e26f" :TEXT
   "# Catena pool, dispatcher e Serie: risultati locali

Incremento C4 sulla base `a34cede6fbc9215908d50aa85311d5d703660040`, secondo
il [metodo preregistrato](pool-catena-metodo.md). Due nuovi test registrati
nel sistema ASDF eseguono sei scenari su thread reali. Nessun file in `src/`
è modificato; le qualifiche C1/C3 precedenti mantengono il loro ambito.

## Rilettura C4 dell'autore

Rilettura del codice e degli oracoli prima della chiusura della campagna;
non è una revisione indipendente né una nuova qualifica C1.

| Controllo | Evidenza nel codice |
|---|---|
| Owner e pubblicazione | Context, porta, tabella e link creati nel rispettivo worker; registro costruito prima dell'avvio; porte pubblicate tramite semaforo. |
| Indipendenza delle Serie | A raggiunge RUNNING o BATCH con lease; B è joined dopo 32 quantum prima di segnalare la release di A. |
| Routing e capacità | Writer atteso controllato per EQ, link ancora IDLE e link di begin EQ a quello del passo; lease positiva e token originale. |
| Payload e debito | Ogni pop verifica count/status/token, payload atteso e sentinelle dello span; ACK esplicito, poi end e verifica fase. |
| Full e room | Risultati dei cinque valori, origine recycle, count 1 o 2; full usa B, room non prende un secondo writer. |
| Ritiro e migrazione | Comando dal registro pubblico; retirement al successivo IDLE; altro owner prende A residuo; registro finale `(1 1 NIL)`. |
| Risorse della fixture | Cicli finiti; wait/join con timeout 15s; cleanup libera barriere, arresta/unisce thread prima di chiudere backend. |
| Confini del prodotto | Nessuna sostituzione di funzione o slot privato nella nuova fixture; semafori e pause con lease appartengono soltanto al test. |

Identità SHA-256 dei quattro file congelati prima del controllo completo:

| File | SHA-256 |
|---|---|
| `arcdocdb.asd` | `6af6230a08151f71826b8566f052320a005e1d67e92e52e8701c414af554de14` |
| `tests/scheduler/pool-chain-support.lisp` | `3a1cfd174c8ca8ee7bb713b026e644e45ab444aa762f0e28d95d6e502b7fbfaf` |
| `tests/scheduler/pool-chain.lisp` | `81da71e08d0e5196b01fb51666b9c123dc3c1d1b206f02076ab5a1c74d6f0c85` |
| `docs/implementazione/pool-catena-metodo.md` | `5d6677962c2dc40bcfb7425c08e9b5ed7f509d16b9722530cf74110f39e8cc97` |

## Registri ed esiti

| Processo originale | Esito | Tempo wall | Sorgenti stabili |
|---|---|---:|---:|
| [Sviluppo, tentativo 01](../../spikes/results/2026-10-15-pool-catena/processes/development/report.lisp) | OK, exit 0; due test, sei scenari | 18,677892 s | 947 |
| [Controllo completo](../../spikes/results/2026-10-15-pool-catena/processes/check-core/report.lisp) | OK, exit 0; 1.607 test nominati, 2 smoke, 4 fixture lint | 300,889764 s | 947 |
| [Build integrata](../../spikes/results/2026-10-15-pool-catena/processes/integrated/report.lisp) | OK, exit 0; 1.624 test nominati e 2 smoke | 53,042596 s | 963 |

Il controllo completo registra tutte le sei righe degli scenari, 112 test
scheduler, 231 file lint/0 violazioni, 121 requisiti/65 invarianti/13 scenari
FI/52 ADR senza errori e 462 Markdown/3.139 link/0 rotti. Tutti i 10 spike
completati sono conservati con i loro file originali nel manifesto della
campagna. Verifica archivio precedente alla nuova pubblicazione: 118 cataloghi,
3.518 riferimenti, 40.972 file, 1.090.326.637 byte.

Dopo la campagna congelata è stato integrato il parent
`1bdfce485633cacc924d5e7a3b1149b0185a4fa9` (checkpoint di recovery e lettura
item CBOR), con merge `6f830dd3f2fa16fc6de8536dba33bcf4d439ca5f`.
La build integrata esegue nuovamente l'intera suite: 237 file lint/0
violazioni e 122 requisiti/65 invarianti/13 FI/52 ADR senza errori.
I due file nuovi dei test e il metodo mantengono le impronte frozen; ASDF
include anche i nuovi moduli del parent. La versione ASDF premerge è
conservata nel bundle, insieme alle altre tre copie frozen.

Compilazione stretta senza warning/style-warning in tutti i processi.
Gli stderr del controllo completo e della build integrata contengono note
del compilatore (1.186.895 e 1.219.731 byte UTF-8), conservate integralmente;
non sono presentati come stderr vuoti. Quello dello sviluppo è vuoto.
Il [manifesto](../../spikes/results/2026-10-15-pool-catena/manifesto.lisp)
e il [catalogo](../../spikes/results/2026-10-15-pool-catena/catalogo.lisp)
collegano sorgenti, record originali, conservazione e campagna spike.
Le funzioni di conservazione precedentemente verificate sono riusate
invariate; la famiglia generica `writer-worker` del catalogo è dichiarata
nel manifesto e non amplia lo scope dei test.


Il primo sviluppo non stampava le sei righe descrittive dei singoli scenari.
La variante iniziale è conservata nel bundle sorgenti e il suo Git blob è
stato confrontato con il record originale (`d7ad221b3e665eca54e9d532b54f04d4e53c301c`).
La sola modifica successiva è la stampa delle righe; la qualifica completa
usa la versione congelata indicata sopra. Nessun tentativo fallito è omesso.

## Ambito del risultato

Nei due scenari di isolamento B completa 32 quantum (64 in totale) mentre A
mantiene la propria lease, prima senza pop e poi con debito batch pendente.
Nei quattro scenari di ritiro, i payload sono A1, B1 e A2 una sola volta,
con B e A residuo presi secondo la capacità del ring. La ready finale vuota
è soltanto un'osservazione locale; non autorizza shutdown o park globale.

Questi sono ordini sincronizzati di thread reali con backend in memoria.
Non sono una misura di speedup, un'esplorazione esaustiva di interleaving,
una prova universale su memoria debole o una misura di allocazione.
Non vengono applicati payload del database né eseguiti commit/I/O durevoli.
I timeout sono budget della fixture, non target di latenza del prodotto.
")
  (:PATH #A((30) BASE-CHAR . "docs/implementazione/README.md") :BYTES 12274 :SHA256
   "360b59b5db3d65c3a3512b8dccfb06a08f4d39b3c1ef95d678395bff5daf848b" :GIT-BLOB
   "ccc0f5d130c5b3c04bc37a153234d782cb640f1e" :TEXT "# Implementazione

Fondazioni introdotte dopo la richiesta dell'autore del 2026-10-08 di iniziare la scrittura
del codice. L'autorizzazione non equivale alla chiusura dei criteri della Fase 0 o alla
qualifica del motore completo.

| Modulo | Contratto e verifica | Codice |
|---|---|---|
| Fondazioni binarie | [Record v1/v2, CRC32C e lotti SEAL](fondazioni-binarie.md) | [`src/foundation/`](../../src/foundation/) |
| Testo UTF-8 | [Validazione limitata, pura e parallela](utf8.md) | [`src/codec/utf8.lisp`](../../src/codec/utf8.lisp) |
| Testate CBOR | [Lettura pura in sei valori](cbor-header.md) | [`src/codec/cbor-header.lisp`](../../src/codec/cbor-header.lisp) |
| Testate CBOR minime | [Larghezze di argomenti e float, senza decodifica](cbor-minimo.md) | [`src/codec/cbor-minimal.lisp`](../../src/codec/cbor-minimal.lisp) |
| Scrittura delle testate CBOR | [MT0..6 minimi, destinazione privata e preflight](cbor-scrittura.md) | [`src/codec/cbor-write.lisp`](../../src/codec/cbor-write.lisp) |
| Scrittura delle stringhe CBOR | [Item MT2/3, budget completo, UTF-8 e overlap](cbor-stringhe.md) | [`src/codec/cbor-string-write.lisp`](../../src/codec/cbor-string-write.lisp) |
| Scrittura dei valori semplici CBOR | [Codici wire MT7, preflight e destinazione privata](cbor-semplici.md) | [`src/codec/cbor-simple-write.lisp`](../../src/codec/cbor-simple-write.lisp) |
| Scrittura dei float CBOR | [Bit IEEE, riduzione esatta e destinazione privata](cbor-float-scrittura.md) | [`src/codec/cbor-float-write.lisp`](../../src/codec/cbor-float-write.lisp) |
| Composizione degli array CBOR | [Item verificati, budget della radice e scratch privato](cbor-array.md), [verifiche](cbor-array-risultati.md) | [`src/codec/cbor-array-write.lisp`](../../src/codec/cbor-array-write.lisp) |
| Composizione delle mappe CBOR | [Coppie verificate, budget della radice e scratch privato](cbor-map.md), [verifiche](cbor-map-risultati.md) | [`src/codec/cbor-map-write.lisp`](../../src/codec/cbor-map-write.lisp) |
| Composizione dei tag CBOR | [Contenuto verificato, nodi inclusivi e profondità invariata](cbor-tag.md), [verifiche](cbor-tag-risultati.md) | [`src/codec/cbor-tag-write.lisp`](../../src/codec/cbor-tag-write.lisp) |
| Lettura del primo item CBOR | [Frontiera assoluta, coda non letta e scratch privato](cbor-item.md), [verifiche](cbor-item-risultati.md) | [`src/codec/cbor-item-read.lisp`](../../src/codec/cbor-item-read.lisp) |
| Struttura CBOR | [Item completo, UTF-8 e budget con scratch per worker](cbor-struttura.md) | [`src/codec/cbor-scan.lisp`](../../src/codec/cbor-scan.lisp) |
| Item CBOR con testate minime | [Un attraversamento, limiti e scratch privato](cbor-minimo-struttura.md) | [`src/codec/cbor-scan-minimal.lisp`](../../src/codec/cbor-scan-minimal.lisp) |
| CSN di Archivio | [Registro dei commit in corso e orizzonte](csn.md) | [`src/csn/`](../../src/csn/) |
| Metadati storage | [Header dei segmenti, EDIT e DECISION](metadati-storage.md) | [`src/storage/`](../../src/storage/) |
| Header dei log | [Identità e integrità di control e multiserie](header-log.md) | [`src/storage/log-header.lisp`](../../src/storage/log-header.lisp) |
| Segmenti compattati | [Prefisso CLOSED e record ordinari](segmenti-compattati.md) | [`src/storage/compaction-scan.lisp`](../../src/storage/compaction-scan.lisp) |
| Code dei writer | [MPSC locale, gettone e tratti limitati](code-writer.md) | [`src/execution/`](../../src/execution/) |
| Consegna dei writer | [Idle, pronto, in esecuzione e obbligo di scheduling](writer-handoff.md) | [`src/execution/handoff.lisp`](../../src/execution/handoff.lisp) |
| Lista dei writer pronti | [Ring preallocati, partizioni indipendenti e scansione limitata](writer-ready.md) | [`src/execution/ready.lisp`](../../src/execution/ready.lisp) |
| Ricircolo dei writer pronti | [Scambio FIFO atomico a ring pieno](writer-recycle.md) | [`src/execution/ready-recycle.lisp`](../../src/execution/ready-recycle.lisp) |
| Contesto worker | [Lease, batch confermati, retry e fault locale](writer-worker.md) | [`src/execution/worker-types.lisp`](../../src/execution/worker-types.lisp) |
| Integrazione dei worker | [Base comune, scope e controllo completo](writer-worker-integrazione.md) | [`arcdocdb.asd`](../../arcdocdb.asd) |
| Controllore del pool | [Target limitato, EWMA, AIMD e isteresi](controllore-pool.md) | [`src/scheduler/`](../../src/scheduler/) |
| Attuazione del pool | [Attivazione e ritiro confermati dai worker](pool-worker-lifecycle.md) | [`src/scheduler/lifecycle-worker.lisp`](../../src/scheduler/lifecycle-worker.lisp) |
| Presa governata dal pool | [Gate active, contesto IDLE e presa C1 delegata](pool-worker-claim.md) | [`src/scheduler/pool-claim.lisp`](../../src/scheduler/pool-claim.lisp) |
| Collegamento pool/Serie | [Binding immutabile, nuova presa e obblighi già assunti](pool-dispatch.md) | [`src/dispatch/`](../../src/dispatch/) |
| Ricircolo pool/Serie | [Un solo trasferimento ready e routing del nuovo CLAIMED](pool-recycle.md) | [`src/dispatch/recycle.lisp`](../../src/dispatch/recycle.lisp) |
| Avvio dell'obbligo pool/Serie | [Routing corrente e doppia lease esplicita](pool-begin.md) | [`src/dispatch/begin.lisp`](../../src/dispatch/begin.lisp) |
| Passo del dispatcher pool/Serie | [Scelta unica fra ammissione e obblighi esistenti](pool-step.md) | [`src/dispatch/step.lisp`](../../src/dispatch/step.lisp) |
| Catena pool/dispatcher/Serie | [Worker reali, isolamento e ritiro con handoff](pool-catena-risultati.md); [metodo](pool-catena-metodo.md) | [`tests/scheduler/pool-chain.lisp`](../../tests/scheduler/pool-chain.lisp) |
| Confine I/O | [Append, pread e flush durevole](io.md) | [`src/io/`](../../src/io/) |
| Completamento I/O | [Cleanup, frontiere e capacità dopo short I/O](io-completamento.md) | [`src/io/flush.lisp`](../../src/io/flush.lisp), [`src/io/transfer.lisp`](../../src/io/transfer.lisp) |
| Rinomina nella directory | [FD parent, cambio atomico e fail-stop locale](io-rinomina.md) | [`src/io/rename.lisp`](../../src/io/rename.lisp) |
| Associazione dei file | [Device/inode e capacità readonly/append del medesimo ACTIVE](associazione-file.md) | [`src/io/identity.lisp`](../../src/io/identity.lisp) |
| Nuovo segmento writer | [Header durevole, rilettura, directory e sorgente certificata](inizializzazione-active.md) | [`src/active/`](../../src/active/) |
| ACTIVE vuoto | [Radice iniziale, CLOSED recuperati e primo lotto](get-active-vuoto.md) | [active-init.lisp](../../src/get-resolver/active-init.lisp) |
| Checkpoint del control log | [EDIT completo, piano privato e preparazione durevole a blocchi](checkpoint-control.md) | [`src/control/`](../../src/control/) |
| Pubblicazione del control log | [Rinomina ancorata, identità dei nomi e gettone unico](pubblicazione-control.md) | [`src/control/publication.lisp`](../../src/control/publication.lisp) |
| Control log recuperato | [Lettura readonly, manifest posseduto e transizione conservativa](control-recuperato.md); [metodo delle misure](control-transizione-metodo.md) | [`src/control/recovery-read.lisp`](../../src/control/recovery-read.lisp) |
| Vecchio ACTIVE recuperato | [Prefisso readonly, prepared risolti e chiusura verificata](active-recuperato.md); [verifiche](active-recuperato-verifica.md) e [metodo delle misure](active-recuperato-metodo.md) | [`src/recovery-active/`](../../src/recovery-active/) |
| Checkpoint dal recovery | [Stato completo da CONTROL e ACTIVE](checkpoint-recovery.md) | [`src/recovery-checkpoint/`](../../src/recovery-checkpoint/) |
| Lotti WAL | [Formazione, SEAL e group commit](wal.md) | [`src/wal/`](../../src/wal/) |
| CSN dei lotti WAL | [Chiusura, token e risoluzione](wal-csn.md) | [`src/wal/csn.lisp`](../../src/wal/csn.lisp) |
| Controller della Serie | [Pubblicazione FIFO, token e ritiro I/O](controller-serie.md) | [`src/series/`](../../src/series/) |
| Worker e Serie | [Doppia lease, debito batch e ordine dell'handoff](worker-serie.md) | [`src/series/worker-run.lisp`](../../src/series/worker-run.lisp) |
| Routing dei worker | [Ordinali immutabili, registro copiato e selezione diretta](routing-worker.md) | [`src/series/routing-select.lisp`](../../src/series/routing-select.lisp) |
| Verifica del controller | [Prove strutturate, copertura e misure parallele](controller-serie-risultati.md) | [`tests/series/`](../../tests/series/) |
| Slot dell'indice v2 | [Payload compatto, seqlock e rilocazione](slot-indice-v2.md) | [`src/index/`](../../src/index/) |
| Indice primario v2 | [Chiavi, gruppi Swiss e pubblicazione della directory](indice-primario.md) | [`src/index/primary-read.lisp`](../../src/index/primary-read.lisp) |
| Hash delle chiavi | [XXH64 tipizzato, seme immutabile e mappe fisiche](hash-chiavi.md) | [`src/hash/`](../../src/hash/) |
| Cache dei record | [Insiemi associativi, CLOCK e copie verificate](cache-record.md) | [`src/cache/`](../../src/cache/) |
| Prestazioni del nucleo GET | [Metodo, oracoli e stress parallelo](get-performance-metodo.md) | [`tests/get-performance/`](../../tests/get-performance/) |
| Percorso GET | [Candidato, fonte readonly, cache e conferma snapshot](get-record.md) | [`src/get/`](../../src/get/) |
| Verifica GET | [Prima suite funzionale, metodo e limiti](get-verifica.md) | [`tests/get/`](../../tests/get/) |
| Collegamento CSN/snapshot | [Registro unico e coordinamento senza attese](snapshot-csn.md) | [`src/mvcc/snapshots-csn.lisp`](../../src/mvcc/snapshots-csn.lisp) |
| Verifica snapshot e CSN | [Metodo preregistrato, decisioni e limiti](snapshot-verifica.md) | Registro e adattatore già presenti in `src/mvcc/` |
| Registro snapshot | [Pin, identità, attivazione e scadenza](registro-snapshot.md) | [`src/mvcc/snapshots-register.lisp`](../../src/mvcc/snapshots-register.lisp) |
| Epoche e reclaim | [Slot dei reader e ticket limitati per i segmenti](epoche-e-reclaim.md) | [`src/epochs/`](../../src/epochs/) |
| Compiti di lettura | [Ingresso EBR, controlli snapshot e cleanup](compiti-lettura.md) | [`src/read/`](../../src/read/) |
| Verifica EBR e lettura | [Suite, metodo, mutanti e limiti](lettura-verifica.md) | [`tests/epochs/`](../../tests/epochs/) e [`tests/read/`](../../tests/read/) |
| Resolver GET CLOSED | [Frontiera dal manifest, flag e prova OUTCOME](get-resolver.md); [metodo delle prove funzionali](get-resolver-metodo.md) | [`src/get-resolver/`](../../src/get-resolver/) |
| Directory GET CLOSED | [Selezione limitata del segmento nella Serie](get-directory.md) | [`src/get-directory/`](../../src/get-directory/) |
| Fonti GET della Serie | [Acquisizione ACTIVE/CLOSED dalla singola radice pubblicata](get-fonti-serie.md) | [`src/get-directory/sources-read.lisp`](../../src/get-directory/sources-read.lisp) |
| Resolver GET ACTIVE ordinario | [Lotti verificati, root della Serie e directory persistente](get-active.md); [prove funzionali](get-active-verifica.md), [metodo](get-active-preflight-metodo.md) e [verifica dei rifiuti OPEN](get-active-preflight-verifica.md) | [`src/get-resolver/active-build.lisp`](../../src/get-resolver/active-build.lisp) |
| Scansione recovery | [Prefisso dei log e testimonianze SEAL](scansione-log.md) | [`src/recovery/`](../../src/recovery/) |
| Decisioni multiserie | [Tabella TXID, CSN e partecipanti](decisioni-multiserie.md) | [`src/recovery/decisions-build.lisp`](../../src/recovery/decisions-build.lisp) |
| Decision log dell'Archivio | [Lettura readonly, identità e collegamento al recovery ACTIVE](decisioni-recuperate.md) | [`src/recovery-archive/`](../../src/recovery-archive/) |
| Manifest della Serie | [Ripiegamento degli EDIT del control log](manifest-control-log.md) | [`src/recovery/`](../../src/recovery/) |
| Inventario recovery | [Piano di riconciliazione dei nomi dei segmenti](inventario.md) | [`src/recovery/inventory-build.lisp`](../../src/recovery/inventory-build.lisp) |
| Ordinamento delle decisioni | [Radix misurato e query concorrenti](decisioni-radix-risultati.md) | [`src/recovery/decisions-radix.lisp`](../../src/recovery/decisions-radix.lisp) |

Le evidenze hanno un ambito esplicito: un test del codec non verifica transazioni,
durability, recovery o prestazioni del database.

Gli [esiti dei processi nelle mutazioni CBOR](cbor-mutazioni-processi.md)
distinguono i rilevamenti dei mutanti dagli errori dei worker di verifica.
")
  (:PATH #A((12) BASE-CHAR . "CHANGELOG.md") :BYTES 24243 :SHA256
   "bc337f8ebc635c61f90eebc400abd2f12ee12619eb85e6336b8929dfe7066063" :GIT-BLOB
   "7c325177ce8e62354c0961cae1d1d3d92a43aa78" :TEXT "# Changelog

Formato basato su [Keep a Changelog](https://keepachangelog.com/it-IT/1.1.0/). Il progetto
non ha ancora rilasci; le versioni seguiranno la [roadmap](docs/roadmap.md).

## [Non rilasciato]

### Aggiunto

- Verifica integrata pool/dispatcher/Serie con due worker reali: 32 quantum
  su una Serie mentre l'altra mantiene lease o debito batch, più ritiro con
  ring pieno/libero e trasferimento del lavoro residuo a un altro worker.
  Sei scenari sincronizzati; nessuna misura di speedup o modifica ai protocolli.

- Lettura del primo item CBOR minimo con frontiera assoluta: coda non
  letta, budget della finestra autorizzata e scratch privato per worker.
  Consente di ricavare le frontiere degli item concatenati; qualifica C1
  e profilo documentale restano aperti.

- Builder del checkpoint dal recovery ACTIVE: deriva lo stato completo
  dal CONTROL autorevole, conserva CLOSED/REMOVED/esiti, chiude il vecchio
  ACTIVE a P e collega il nuovo ID verificato. Budget prima degli array e
  verifica della transizione in memoria; preparatore e publisher canonici
  invariati, qualifica C1 dedicata aperta.

- Prove dedicate del recovery ACTIVE: lettura readonly, risoluzione dei
  prepared, chiusura deterministica e pubblicazione su file reali v1/v2.
  Oracoli indipendenti, fault injection, copertura e misure separate
  conservati nella campagna `2026-10-15-active-verifica`.

- Passo bounded del dispatcher pool/Serie: sceglie una sola operazione fra
  nuova presa IDLE, collegamento del CLAIMED e ricircolo RESCHEDULE.
  Origine esplicita distingue cursore, count e assenza di trasferimento;
  gli obblighi esistenti non consultano il pool. Nessun secondo claim,
  begin o retry implicito; fasi attive e prima causa restano conservate.

- Lettura readonly di `Registri/multiserie.log`: header UUID/CRC/formato
  verificato prima del corpo, replay completo fino all'EOF attestato e
  decisioni possedute. Nuovo ingresso ACTIVE vincolato allo stesso ambito
  canonico dell'Archivio; formati invariati, qualifica C1 dedicata aperta.

- Rendezvous delle fixture concorrenti residue CBOR, UTF-8 e due Serie:
  checkpoint dopo il primo lavoro effettivo, mantenendo conteggi, sink e
  oracoli. Diagnostica prima delle asserzioni temporali; intervalli WALL
  della fixture, comprensivi delle attese e dei controlli.

- Verifica integrata del lifetime delle fonti GET: lettori su FD CLOSED reali,
  pubblicazione ACTIVE con superset e riduzione controllata, ritiro EBR e
  chiusura dopo quiescenza. Include errore tipizzato e uscita non locale;
  decisione durabile del catalogo e rotazione completa restano da integrare.

- Rendezvous dopo il primo elemento realmente codificato nei test concorrenti
  CBOR float/tag, per imporre l'interleaving senza dipendere dall'avvio dello
  scheduler. Intervalli e checkpoint stampati prima delle asserzioni; metriche
  della fixture distinte dalla latenza del solo encoder.

- Prove dedicate della lettura CONTROL, transizione conservativa e
  pubblicazione validata: 84 nuovi test v1/v2, matrice finita e file reali
  con quattro Serie. Copertura, 216 finestre di confronto, sorgenti dei
  tentativi falliti e output originali conservati nella campagna
  `2026-10-14-control-transizione`; nessuna promozione del motore completo.

- Composizione di tag CBOR da contenuti già codificati: verifica completa
  prima della scrittura, testata MT6 minima e budget comprensivi del tag
  senza aggiungere profondità ai contenitori. Sorgenti condivisibili in
  lettura con scratch privati; semantica applicativa e qualifica C1 aperte.

- Recovery readonly del vecchio ACTIVE nominato dal control log: header
  e prefisso verificati fino a EOF, prepared risolti da OUTCOME/DECISION,
  esiti derivati in array u64 ordinati e serializer della chiusura CLOSED.
  La pubblicazione verifica P ed esiti prima del publisher unico; nessuna
  troncatura, modifica del formato o nuovo CSN. Qualifica C1 e gate del
  Recovery Manager restano aperti.

- Avvio esplicito dell'obbligo pool già acquisito: selezione del writer
  corrente e un solo begin del bridge, con restituzione del link e dei tre
  risultati originali. Writer-busy conserva CLAIMED; Serie-busy mantiene
  token e chiusura esplicita. Nessun nuovo gate, retry o cleanup implicito.

- Casi dedicati ai rifiuti del preflight GET ACTIVE prima del CSN: identità,
  stato OPEN/SEALED, ordine, capacità e guasti degli header, con witness
  indipendenti di byte, token, radici, frontiere e assenza di I/O.
  Suite ACTIVE a 42 test e quattro mutanti preflight rilevati; conservati
  copertura, regressione bootstrap e audit indipendenti delle prove complete.

- Composizione di mappe CBOR da chiavi e valori già codificati: verifica
  completa prima della scrittura, testata MT5 basata sulle coppie e budget
  comprensivi della radice. Sorgenti condivisibili in lettura con scratch
  privati; ordinamento delle chiavi e qualifica C1 restano aperti.

- Ricircolo esplicito dal dispatcher alla Serie: pubblica l'obbligo e termina
  IDLE se c'è spazio; a ring pieno restituisce il link del nuovo writer
  CLAIMED dopo un solo scambio FIFO. Nessun gate del pool, ritiro o nuova
  presa impliciti; busy e guasti conservano i confini execution esistenti.

- Lettura readonly del control log autorevole, con header verificato e replay
  fino all'EOF attestato. Risultato senza buffer, legato alla vista canonica;
  pubblicazione subordinata alla conservazione di CLOSED, esiti e REMOVED,
  chiusura del vecchio ACTIVE e apertura di un ID nuovo. Nessuna modifica
  al formato o agli ADR; recovery completo e qualifica C1 restano aperti.

- Composizione di array CBOR da elementi già codificati: verifica completa
  prima della scrittura, testata minima e budget comprensivi della radice.
  Sorgente e indice condivisibili in lettura, destinazione e scratch privati
  per worker. Profilo documentale e qualifica C1 restano aperti.

- Dispatcher logico dal pool al collegamento della Serie: binding preallocato
  sul medesimo contesto, routing solo dopo una presa autorizzata e ingresso
  distinto per completare gli obblighi già CLAIMED. Nessun begin, pop o retry
  implicito; ritiro e diagnosi conservano i confini C1 esistenti.

- Pubblicazione del checkpoint recuperato: rinomina ancorata alla directory
  preparata, verifica delle foglie contro i FD del nuovo e vecchio control log,
  controllo del nome installato e fsync del parent. Gettone locale unico con
  cleanup prima del CAS; errori terminali senza retry, rollback o risultati
  parziali. Recovery completo e qualifica delle nuove chiamate restano aperti.

- Suite funzionale dedicata al GET ACTIVE ordinario: 28 test con file reali,
  formati v1/v2, oracoli wire indipendenti, confini di payload e directory,
  cache, guasti e cleanup snapshot/EBR. Copertura isolata e compatibilità
  CLOSED conservate con prove grezze e audit indipendenti; qualifica C1 e
  MC/DC restano aperti.

- Presa dei writer governata dallo stato del pool: conferma il comando solo
  dopo la barriera IDLE, delega il claim C1 quando attivo e lascia ready e
  cursore intatti quando inattivo. Compiti e ricircoli già acquisiti completano
  i propri obblighi prima del ritiro; nessuna attesa o gestione fisica dei thread.

- Preparazione del checkpoint `control.log.tmp`: header della Serie, EDIT
  completo e SEAL costruiti senza I/O, manifest verificato contro il nuovo
  ACTIVE, file fisicamente distinto, trasferimenti a blocchi, rilettura esatta
  e fsync del parent. Nessun CSN o rinomina implicita; integrazione del recovery
  e qualifica C1 restano aperte.

- Attuazione logica del controllore pool su worker preesistenti: richieste
  persistenti e conteggio delle sole conferme, ritiro soltanto a contesto IDLE
  senza abbandonare lease o batch, riattivazione degli stessi contesti.
  Include 18 prove con worker reali, copertura C3 senza esclusioni e misure
  senza allocazioni dopo l'avvio. Dispatcher, risveglio e avvio fisico restano aperti.

- Preparazione del nuovo segmento writer: preflight senza effetti, identità
  readonly/append prima della write, header canonico durevole, rilettura esatta
  e fsync del parent. Adattatore ACTIVE con prova obbligatoria e verifica del
  registro CSN della vista; errori senza retry o risultati parziali. Decisione
  EDIT, apertura/rotazione del server e qualifica C1 restano da integrare.

- Ponte fonti GET della Serie: directory CLOSED nel contenuto della radice
  ACTIVE, acquisizione unica dal controller sotto EBR, risoluzione dalla
  stessa radice catturata e rifiuto di owner/ID duplicati prima dell'adozione.
  Mantiene il protocollo WAL e i cinque esiti del nucleo GET; rotazione e
  reclaim completo restano distinti.

- Scrittura dei float CBOR da parole IEEE: riduzione esatta della larghezza,
  preservazione di segno e payload NaN, preflight prima della mutazione
  e destinazioni private per i worker. Qualifica C1 e profilo documentale
  restano aperti.

- Controllore locale del numero di worker di calcolo: EWMA intere,
  crescita additiva, riduzione moltiplicativa e permanenza delle condizioni.
  Campioni e tempo iniettati, target distinto dai worker effettivi,
  aggiornamento limitato senza allocazioni dopo l’avvio. Avvio, risveglio
  e ritiro dei thread restano il prossimo componente del pool.

- Associazione fisica readonly/append: confronto esatto device/inode nel pool
  I/O, prova immutabile legata alle capacità e verifica senza syscall nel
  costruttore ACTIVE. Backend iniettabile esteso con identity opzionale;
  rifiuti senza fallback, retry o mutazioni. Percorso GET invariato;
  adozione nel server e qualifica C1 restano aperte.

- Directory GET dei segmenti CLOSED: ID u32 compatti e riferimenti privati
  immutabili, controllo di Serie/ordine/budget prima delle copie, ricerca
  limitata a diciassette passi e collegamento al resolver/cache/I/O.
  Una location pubblicata senza segmento è un guasto, mai un miss.
  Pubblicazione, ACTIVE, rotazione e reclaim restano integrazioni distinte.
  Corretto il confronto del ritorno di lettura nel resolver CLOSED: l'API
  restituisce END nel buffer, anche quando la regione comincia a 64.

- Scrittura minima dei valori semplici CBOR MT7: codici wire 0..23 e
  32..255, preflight di range/codice/capacità e destinazione esclusiva.
  Include confronto su tutti i codici, fuzz e due worker riusati;
  profilo applicativo, composizione e qualifica C1 restano aperti.

- Routing preallocato dei writer pronti alla Serie: ordinali immutabili,
  registro con associazioni verificate e tabella privata per worker.
  Selezione diretta in tempo costante, anche dopo ricircolo a coda piena,
  senza scritture condivise per messaggio. Include18 nuove regressioni,
  due letture C1, audit completo della copertura e cinque misure locali;
  pool e coordinatore restano aperti.

- Resolver GET ACTIVE per lotti ordinari: radice acquisita dalla pubblicazione
  della Serie, pagine immutabili e directory persistente con quattro piccoli
  vettori per append. Preflight prima del CSN, verifica del solo lotto nuovo e riuso cache/lettura GET;
  budget, fail-stop e confini documentati. Prepared/OUTCOME ACTIVE, indice
  concreto, rotazione/reclaim e qualifica C1 restano aperti.

- Collegamento preallocato worker/Serie: doppia lease, token monotoni, debito
  batch e rilascio Serie prima del worker, con retry limitato alla fine e
  conservazione dei guasti originali. Include 26 prove, due letture C1,
  copertura completa nel denominatore e cinque misure locali del percorso
  seriale; pool e coordinatore Archivio restano da integrare.

- Resolver GET dei segmenti CLOSED: frontiera dal manifest, prefisso writer
  sigillato o compaction verificato, righe u32 immutabili e prove OUTCOME
  risolte senza I/O nel lookup. Connessione a cache e lettura GET, budget
  espliciti e controlli di posizione/CSN; ACTIVE, prove EDIT, directory e
  qualifica C1 restano aperti.

- Hash delle chiavi XXH64 tipizzato: ritorno in due u32, seme esplicito
  immutabile nell'indice, mappe verificate degli slot fisici per rebuild/split,
  propagazione dei guasti interni. Include 46 nuove regressioni, mutazioni,
  misure seriali/parallele e registri strutturati; lifecycle del seme e GET
  integrato ancora aperti.

- Nucleo GET con contesto preallocato per worker: hash col seme dell'indice e lookup sotto EBR,
  capacità segmento con header verificato, cache e I/O readonly, prova
  OUTCOME letta dallo stesso file e risposta privata fino alla conferma
  snapshot. Ricerca storica richiesta esplicitamente sui casi non risolvibili
  dall'indice corrente; resolver, pool, protocollo e qualifica C1 aperti.

- Cache dei record per Serie: classi preallocate, insiemi di otto posti,
  CLOCK limitato, ricerca senza lock e inserimento opportunistico. Ogni hit
  verifica CRC, chiave, CSN e prova prepared; corruzione della cache distinta
  dall’input del segmento. Verificatore comune con CSN in due u32,
  budget e contratti documentati; GET integrato e qualifica C1 aperti.

- Indice primario v2 in memoria: controlli Swiss a gruppi di 16, chiavi binarie
  in arena, lookup con budget comune e conferma root anche sul miss, upsert e
  cancellazione/rilocazione condizionale nel writer, crescita arena e piani monouso di pubblicazione
  directory, con hash delle chiavi e costruttore verificato split/rebuild.
  Lifecycle del seme e GET integrato ancora aperti;
  include contratti, tracciabilità ed evidenze statiche, qualifica C1 aperta.

- Banco di slot v2 dell'indice: parole u64 contigue, lettura in buffer privato
  con otto tentativi, pubblicazione e rimozione sotto seqlock, rilocazione
  condizionale, credito di scrittura e congelamento permanente. Include
  contratti, decisioni da coprire ed evidenze statiche; qualifica C1 aperta.

- Contesto di lettura preallocato per worker: ingresso EBR a tentativo singolo,
  snapshot controllato prima e dopo il lookup, anche sul miss, e cleanup del
  pin prima della migrazione. Collegato ai registri CSN/snapshot/epoche;
  indice, cache e pool restano da integrare, qualifica concorrente aperta.

- Dominio EBR per Archivio: annunci dei worker distanti 128 byte, ingresso
  senza mutex a tentativo singolo, ticket preallocati e crediti di epoca prima
  dello swap. Frontiera condivisa da più ritiri e claim esclusivo del reclaim;
  integrazione con segmenti/pool e qualifica concorrente restano aperte.

- Registro snapshot per Archivio: soglia annunciata prima della cattura del CSN,
  contesti preallocati con generazione, controlli di lettura senza mutex,
  deadline e scadenze con budget. Interfaccia in buffer per i reader;
  qualifica concorrente, controller ed EBR restano da integrare.

- Registro CSN per Archivio con orizzonte monotono e budget finito;
  l’implementazione attiva è `arcdocdb.csn`, con token slot/high/low.
- Ricostruzione in memoria del manifest dal prefisso sigillato di `control.log`:
  ACTIVE, CLOSED con esiti, rimozioni esplicite e limite degli ID. Workspace
  indipendenti per Serie; nessuna riconciliazione o scrittura dei file.

- Validazione UTF-8 pura su span immutabili, con budget massimo di 16 MiB,
  conteggio dei valori scalari ed errori tipizzati con offset. Utilizzabile
  in parallelo dai worker prima del writer; il parser CBOR resta da integrare.
  Diciassette test, nove mutanti rilevati e zero heap nei 25 campioni locali;
  prove concorrenti ed evidenze grezze conservate.

- Code MPSC locali preallocate e gettone del writer con quota cumulativa:
  contesa e saturazione distinte, FIFO e rifiuto dei gettoni vecchi.
  Diciassette test, inclusi producer/consumer su thread reali e calcolo
  sovrapposto tra Serie; otto mutanti rilevati e zero heap nelle misure locali.

- Verifica in memoria dei segmenti compattati CLOSED v1/v2: identità, CRC,
  soli PUT/TOMBSTONE ordinari, limite valido autorevole e budget byte/record.
  Conteggi fisici restituiti dopo il controllo integrale; 15 test indipendenti,
  otto mutanti rilevati e misure locali delle allocazioni conservate.

- Tabella delle decisioni multiserie inclusa nella compilazione e nei test ordinari:
  ricostruzione dal prefisso sigillato, duplicati idempotenti o discordanti,
  budget finiti, query scalari e copie possedute dei partecipanti. Non applica
  i prepared e non realizza il recovery completo del database.

- SPK-08 bitmap: kernel scalari byte/u64 equivalenti, oracoli indipendenti,
  90 campioni locali e disassemblati conservati. Packing escluso e nessuna
  promozione a ottimizzazione del motore.

- SPK-07: due reader/due slot in SC, 28 mutanti rilevati; crash sui byte
  v1/v2, 49.120 casi e 303.432 interruzioni/ripartenze equivalenti. Frontiera
  esterna e limiti del modello dichiarati; tutti i tentativi conservati.

- SPK-08: maschere scalar/SWAR esatte e kernel NEON/SSE2 a safety 3;
  70 campioni seriali su Apple M4, zero byte consed osservati nei cicli.
  SSE2 e indice concorrente restano da verificare; report leggibili senza
  caricare i package sperimentali, originali integralmente conservati.

- Scansione recovery in memoria dei log v1/v2: prefisso verificato, coda e
  corruzione testimoniata da SEAL successivo, EOF esplicito e budget distinti
  dagli errori dei dati; 19 test, inclusi 20.256 casi di alterazione dei bit.

- SPK-06: modello finito del controllore di carico, quote e timer; 24 confronti
  locali tra letture e copie concorrenti, con verifica integrale, intervalli
  di sovrapposizione e campioni grezzi conservati. Compaction del motore e
  feedback reale restano da verificare.

- SPK-05: letture pread e mmap di file immutabili, CRC/chiave/stamp verificati,
  errori I/O e worker espliciti; 36 confronti locali per variante e profilo
  senza allocazioni osservate nel ciclo finale. Varianti e fallimenti conservati.

- SPK-04: writer sperimentale su pool, code limitate, modelli di parcheggio
  e ripartenza delle letture; controlli e 54 benchmark diagnostici conservati,
  con limiti e tentativi falliti espliciti.

- SPK-10: quattro moduli sperimentali Common Lisp per codec v1/v2, indice a
  cinque parole, CBOR iterativo e modello di migrazione; integrazione in memoria
  dei limiti massimi. Nessun codice di produzione, gate v2 ancora aperto.
- Registro strutturato di prove e benchmark, inclusi fallimenti e diagnostiche;
  blob dei sorgenti prima/dopo, risultati decodificati e output originali.
  `make check` registra l'intera verifica; la CI conserva gli artefatti.
- Campagne locali conservate: indice v1 fino a 10 milioni di documenti,
  profiling di allocazione e controlli/benchmark v2 separati.

- ADR-0050: root dell'indice ricontrollata anche su miss, costi e budget della
  directory separati dagli slot; nessuna promessa di pausa indipendente dalla Serie.
- ADR-0048: documenti da 16 MiB effettivi, profondità 100, chiavi fino a 65.535 byte e layout v2; tre requisiti progettati, gate di verifica e migrazione. ADR-0049 propone il percorso oltre RAM senza dichiararlo disponibile.

- Suite eseguibile della Fase 0 per SPK-01, SPK-02, SPK-03, SPK-07 e SPK-09; harness
  `tools/run-spikes.lisp`, compilazione senza avvisi, processi isolati, comandi e output
  grezzo; `make spikes-check` in CI e `make spikes-bench` per misure locali in serie.
- ADR-0046 e INV-M6: SPK-07 trova un controesempio nell'anello dell'orizzonte; il registro
  preallocato dei veri CSN pendenti lo sostituisce. I requisiti del motore restano progettati.
- ADR-0047: lettura dei prepared con prova autorevole del CSN (OUTCOME o manifest), oltre a
  CRC, chiave e flag. Una location verso un'altra versione della stessa chiave è rifiutata.

- Specifica originale, documentazione tematica (16 documenti), invarianti (`INV-…`),
  glossario.
- Valutazione architetturale: analisi critica, stime, registro dei rischi, piano degli spike.
- Progetto consolidato: [architettura](docs/architettura.md),
  [formati su disco](docs/formati-su-disco.md), [limiti dimensionali](docs/limiti.md).
- 30 ADR (0001–0030): le 26 questioni aperte sono chiuse; ADR-0028 e ADR-0030 attendono la
  conferma dell'autore.
- Sistema ASDF minimo, smoke test, `tools/check-links.lisp`, CI.
- Licenza BSD-2-Clause.
- **Software critico (ADR-0031…0035):** gerarchia delle priorità con l'affidabilità sopra le
  prestazioni; otto nuovi invarianti (INV-A1…A8); analisi dei guasti con 24 modi di guasto;
  standard di codifica (regole `COD-…`); piano di verifica; registro delle deviazioni.
- **Tracciabilità controllata da strumento:** 90 requisiti in `requisiti.lisp`, matrice generata,
  `make trace`.
- Strumenti in Common Lisp: build senza avvisi (`tools/build.lisp`), linter con auto-verifica
  (`tools/lint.lisp`), controllo della tracciabilità (`tools/check-trace.lisp`).
- SPK-09 (costo dei controlli di affidabilità).

- **Analisi progettuale** ([docs/analisi-progettuale.md](docs/analisi-progettuale.md)) e ADR
  0036–0045: dieci leggi di progetto — la prima: **il parallelismo è un principio fondante**,
  con l'elenco chiuso di ciò che le Serie condividono — tabella dei punti di atomicità, sedici
  rilievi `AP-…`; quattordici nuovi invarianti (INV-F2, F3, V5, M4, M5, S7, C11, I3, P5, P6,
  A9…A12), 107 requisiti, 27 modi di guasto, rischio residuo RES-05.

### Cambiato

- I test con worker riusati delle stringhe CBOR usano segnali distinti
  per ondata, evitando che un worker consumi il permesso dell'altro
  nell'ondata successiva.

- Snapshot collegati all'unico registro `arcdocdb.csn` dell'Archivio; rimosso
  l'allocatore CSN duplicato del ramo. Coordinamento snapshot senza attese,
  revoca della soglia provvisoria su `:csn-busy` e invalidazione terminale
  al guasto. API del registro canonico e sue evidenze conservate.

- Guide del repository consolidate, note degli esperimenti uniformate al metodo
  tecnico e specifica originale rinominata; requisiti ed evidenze conservati (ADR-0051).

- ADR-0028 e ADR-0030 confermati dall'autore il 2026-10-08, incluse le revisioni su minimi
  di prestazione, backup, restore verificato, verificatore offline e scrubbing.

- **Correzioni di progetto dall'analisi (nessun codice toccato, formati mai implementati):**
  - uno snapshot nasce quando l'orizzonte di visibilità lo ha raggiunto: prima poteva vedere
    comparire un lotto in volo (ADR-0038);
  - coda o corruzione di un log si decidono con la frontiera durevole dei SEAL: prima un crash
    ordinario con più lotti in volo portava la Serie in `FAULTED`; il recovery non tronca più
    (ADR-0037);
  - tombstone scartati con il filtro di esistenza: la regola per lineage faceva riapparire
    documenti eliminati dopo un MERGE di segmenti non adiacenti (ADR-0042);
  - l'esito di una multiserie sta nello stesso segmento dei record che risolve: prima un CLEAN
    poteva perderlo (ADR-0041);
  - primary index a frammenti: nessun raddoppio che triplica la memoria e ferma il writer; slot
    a 4 parole; stima corretta a ~75–80 byte per documento (ADR-0043).
- **Semplificazioni:** la versione di un documento è il CSN; una sola cornice di record con due
  CRC (24 byte); quattro tipi di record nei segmenti; control log con il solo record EDIT;
  `multiserie.log` con il solo record DECISION; nessun file `.bloom`, nessun lineage, nessuno
  stato `creating`; cache senza ri-etichettatura; EBR solo per i file (ADR 0038–0044).
- **Modello di esecuzione:** compiti a completamento, attese come parcheggi, ogni chiamata
  bloccante nel pool di I/O (ADR-0045).

- **Linguaggio visivo rifatto** ([assets/README.md](assets/README.md)): identità monocroma con un
  solo colore, l'ambra, riservato a ciò che può cambiare; nuovo marchio; illustrazione dei
  segmenti e diagramma del percorso di scrittura e lettura in vettoriale, chiaro e scuro; README
  riscritto; anteprima per i social. Il controllo dei link verifica anche i percorsi delle
  immagini.

- ADR-0032 sostituisce in parte ADR-0015: il contatore seqlock passa da 8 a 64 bit, con tentativi
  limitati e ripiego sul writer, perché l'argomento a 8 bit si reggeva sui tempi e non era una
  garanzia per costruzione. Costo: +8 byte per entry (56 B).
- ADR-0028 (proposta) distingue obiettivi e minimi vincolanti di prestazione; ADR-0030
  (proposta) porta backup e verificatore offline nella v1.
")
  (:PATH #A((42) BASE-CHAR . "spikes/out/pool-chain/development-run.lisp") :BYTES 733 :SHA256
   "adb61823bec144098c685a758900c2af7893182dee7b267b443cb5910b1aa4f1" :GIT-BLOB
   "feb24b7b2c9f27a06ab8dd2c748883be96ba7036" :TEXT "(require :asdf)
(setf asdf:*compile-file-failure-behaviour* :error
      asdf:*compile-file-warnings-behaviour* :error)
(handler-bind ((warning (lambda (c) (unless (typep c 'sb-kernel:redefinition-warning) (error c))))
               (style-warning (lambda (c) (error c))))
  (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
  (asdf:load-system \"arcdocdb\" :force t)
  (asdf:load-system \"arcdocdb/tests\" :force t)
  (dolist (name '(\"TEST-REQ-CON-002-POOL-CHAIN-OTHER-SERIES-COMPLETES-BEFORE-HELD-LEASE-AND-BATCH-RELEASE\"
                  \"TEST-REQ-THR-001-POOL-CHAIN-FULL-ROOM-RETIREMENT-AND-CROSS-WORKER-READY-HANDOFF\"))
    (funcall (find-symbol name \"ARCDOCDB.SCHEDULER.TESTS\"))
    (format t \"ok    ~A~%\" name)))
")
  (:PATH #A((50) BASE-CHAR . "spikes/out/pool-chain/development-test-source.lisp") :BYTES 8537
   :SHA256 "bbe9561177268782bbfc22cc2fed3152f1ca336c7fe81ba055cf9494c76bea6f" :GIT-BLOB
   "d7ad221b3e665eca54e9d532b54f04d4e53c301c" :TEXT
   ";;;; Due worker con ready/routing condivisi: lease distinte e migrazione dopo ritiro.
;;;; Le attese artificiali con lease/debito sono esclusivamente controlli C4.
(in-package #:arcdocdb.scheduler.tests)

(defun pool-chain-independent (held-phase)
  (multiple-value-bind (left left-file) (pool-claim-series 91)
    (multiple-value-bind (right right-file) (pool-claim-series 92)
      (let* ((ready (arcdocdb.execution:crea-lista-writer-pronti :shards 1 :capacity 2))
             (a (pool-chain-writer 2 0)) (b (pool-chain-writer 32 1))
             (registry (arcdocdb.execution.series:crea-registro-worker-serie
                        (vector a b) (vector left right)))
             (coordinator sb-thread:*current-thread*)
             (held (sb-thread:make-semaphore)) (release (sb-thread:make-semaphore))
             (threads nil) (fast nil))
        (unwind-protect
             (progn
               (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 a)))
               (is (= 2 (arcdocdb.execution:pubblica-writer-pronto ready 0 b)))
               (push
                (pool-thread
                 \"pool-chain-held\"
                 (lambda ()
                   (multiple-value-bind (context port dispatcher)
                       (pool-chain-local ready registry coordinator)
                     (declare (ignore port))
                     (let* ((link (pool-chain-take dispatcher context a :claim 0))
                            (token (pool-chain-begin dispatcher link))
                            (batch (when (eq held-phase :batch)
                                     (pool-claim-bridge-pop link token 0))))
                       (is (eq held-phase (arcdocdb.execution:stato-worker-writer context)))
                       (sb-thread:signal-semaphore held)
                       (pool-wait release)
                       ;; B è già joined: nessuna release di A poteva abilitarlo.
                       (unless batch (setf batch (pool-claim-bridge-pop link token 0)))
                       (pool-chain-ack-end context link token batch :schedule))
                     (pool-chain-published dispatcher 1)
                     (pool-chain-finish dispatcher context
                                        (pool-chain-take dispatcher context a :claim 0) 1 :idle)
                     (pool-chain-empty dispatcher context 0)
                     :ok))) threads)
               (pool-wait held)
               (setf fast
                     (pool-thread
                      \"pool-chain-progress\"
                      (lambda ()
                        (multiple-value-bind (context port dispatcher)
                            (pool-chain-local ready registry coordinator)
                          (declare (ignore port))
                          (dotimes (index 32)
                            (pool-chain-finish
                             dispatcher context (pool-chain-take dispatcher context b :claim 0)
                             index (if (= index 31) :idle :schedule))
                            (unless (= index 31) (pool-chain-published dispatcher 1)))
                          (pool-chain-empty dispatcher context 0)
                          :ok))))
               (push fast threads)
               (pool-join fast)
               (sb-thread:signal-semaphore release)
               (pool-join (second threads)))
          (sb-thread:signal-semaphore release)
          (pool-stop-threads threads)
          (arcdocdb.io:chiudi right-file) (arcdocdb.io:chiudi left-file))))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-chain-other-series-completes-before-held-lease-and-batch-release
  (dolist (phase '(:running :batch)) (pool-chain-independent phase)))

(defun pool-chain-retiring-worker (ready routing writers coordinator ports started staged resume home full)
  (multiple-value-bind (context port dispatcher)
      (pool-chain-local ready routing coordinator home)
    (setf (svref ports 1) port)
    (sb-thread:signal-semaphore started)
    (pool-wait resume)
    (let ((link (pool-chain-take dispatcher context (svref writers 0)
                                 :claim (mod (1+ home) 3))))
      (pool-chain-finish dispatcher context link :a1 :schedule))
    (sb-thread:signal-semaphore staged)
    (pool-wait resume)
    (if full
        (pool-chain-finish
         dispatcher context
         (pool-chain-take dispatcher context (svref writers 1) :recycle 1) :b1 :idle)
        (pool-chain-published dispatcher 2))
    (pool-step-check dispatcher nil :inactive :claim (mod (1+ home) 3) :retired)
    (pool-step-check dispatcher nil :inactive :claim (mod (1+ home) 3) :unchanged)
    (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))
    (is (null (arcdocdb.execution:errore-worker-writer context)))
    :ok))

(defun pool-chain-retirement (capacity home)
  (multiple-value-bind (left left-file) (pool-claim-series 93)
    (multiple-value-bind (right right-file) (pool-claim-series 94)
      (let* ((ready (arcdocdb.execution:crea-lista-writer-pronti :shards 3 :capacity capacity))
             (a (pool-claim-writer '(:a1 :a2) 0)) (b (pool-claim-writer '(:b1) 1))
             (routing (arcdocdb.execution.series:crea-registro-worker-serie
                       (vector a b) (vector left right)))
             (coordinator sb-thread:*current-thread*) (ports (vector nil nil))
             (started (sb-thread:make-semaphore)) (staged (sb-thread:make-semaphore))
             (resume (sb-thread:make-semaphore)) (take-over (sb-thread:make-semaphore))
             (threads nil) (retiring nil) (remaining nil))
        (unwind-protect
             (progn
               (setf remaining
                     (pool-thread
                      \"pool-chain-take-over\"
                      (lambda ()
                        (multiple-value-bind (context port dispatcher)
                            (pool-chain-local ready routing coordinator home)
                          (setf (svref ports 0) port)
                          (sb-thread:signal-semaphore started)
                          (pool-wait take-over)
                          (when (= capacity 2)
                            (pool-chain-finish
                             dispatcher context
                             (pool-chain-take dispatcher context b :claim (mod (1+ home) 3))
                             :b1 :idle))
                          (pool-chain-finish
                           dispatcher context
                           (pool-chain-take dispatcher context a :claim (mod (1+ home) 3))
                           :a2 :idle)
                          (pool-chain-empty dispatcher context (mod (+ home 2) 3))
                          :ok))))
               (push remaining threads)
               (setf retiring
                     (pool-thread
                      \"pool-chain-retire\"
                      (lambda () (pool-chain-retiring-worker
                                  ready routing (vector a b) coordinator ports started staged resume home
                                  (= capacity 1)))))
               (push retiring threads)
               (pool-wait started 2)
               (let* ((controller (crea-controllore-pool 1 :initial 2 :dwell 500))
                      (registry (arcdocdb.scheduler:crea-registro-pool controller ports)))
                 (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready home a)))
                 (sb-thread:signal-semaphore resume)
                 (pool-wait staged)
                 (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready home b)))
                 (lifecycle-start-retirement controller registry)
                 (sb-thread:signal-semaphore resume)
                 (pool-join retiring)
                 (is (equal '(1 1 nil) (lifecycle-registry-state registry)))
                 (sb-thread:signal-semaphore take-over)
                 (pool-join remaining)
                 (is (equal '(1 1 nil) (lifecycle-registry-state registry)))))
          (sb-thread:signal-semaphore resume 2)
          (sb-thread:signal-semaphore take-over)
          (pool-stop-threads threads)
          (arcdocdb.io:chiudi right-file) (arcdocdb.io:chiudi left-file))))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-THR-001-pool-chain-full-room-retirement-and-cross-worker-ready-handoff
  (dolist (capacity '(1 2))
    (dolist (home '(0 2)) (pool-chain-retirement capacity home))))
")
  (:PATH #A((51) BASE-CHAR . "spikes/out/pool-chain/check-development-source.lisp") :BYTES 706
   :SHA256 "9735a21e27bcc975582fc4971a42ffe629a4ca940bd97165497d1eb79a61b259" :GIT-BLOB
   "047dfa21f6cfaecbca90bb6ac5b782c999124e1f" :TEXT "(require :asdf)
(load \"tools/evidence-storage.lisp\")
(let* ((r (arcdocdb.evidence:read-evidence
           #p\"spikes/out/4001075917-command-92231-0/report.lisp\"))
       (entry (find \"tests/scheduler/pool-chain.lisp\" (getf r :source-blobs-before)
                    :test #'equal :key (lambda (e) (getf e :path))))
       (hash (string-trim '(#\\Newline #\\Space)
                          (uiop:run-program
                           '(\"git\" \"hash-object\" \"--\" \"spikes/out/pool-chain/development-test-source.lisp\")
                           :output :string))))
  (assert (equal hash (getf entry :git-blob)))
  (format t \"Sorgente dev originale ricostruita e verificata sul blob del registro: ~A~%\" hash))
")
  (:PATH #A((48) BASE-CHAR . "spikes/out/pool-chain/development-attempt-01.log") :BYTES 220 :SHA256
   "b2fbe91390e1d0f899fa7765e3d19f6939dd0d146ae0a59703256216684e6a22" :GIT-BLOB
   "c32775c3d9fec09ff6c02cfc71514637e4214088" :TEXT
   ":OK: sbcl --noinform --no-userinit --no-sysinit --script spikes/out/pool-chain/development-run.lisp; record: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001075917-command-92231-0/report.lisp
")
  (:PATH #A((42) BASE-CHAR . "spikes/out/pool-chain/check-attempt-01.log") :BYTES 141 :SHA256
   "22cc3edd78f564f3992b3dceff82d36459e0d637058270f5dc0942e1374e9c38" :GIT-BLOB
   "1a8be1245b4d27e0b3e1c17d4ea1b9fb475599b6" :TEXT
   ":OK: make check-core; record: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001075987-command-94133-0/report.lisp
")
  (:PATH #A((47) BASE-CHAR . "spikes/out/pool-chain/integrated-attempt-01.log") :BYTES 146 :SHA256
   "da3b4ad047940718ab00fdfc85089317654417fbd257f0a87b22e48bbe6414c0" :GIT-BLOB
   "7c76ccbe2f449d2b0ef7d56832da26b08898d7ff" :TEXT
   ":OK: make test lint trace; record: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001076369-command-11162-0/report.lisp
")
  (:PATH #A((40) BASE-CHAR . "spikes/out/pool-chain/extract-check.lisp") :BYTES 485 :SHA256
   "cb72b332f464366d86870590d62f53b7b657f31bbddf26ff7283b67ddf743d86" :GIT-BLOB
   "96e94ce494bd0572164de74372363017f5c3c1c1" :TEXT "(require :asdf)
(load \"tools/evidence-storage.lisp\")
(let ((r (arcdocdb.evidence:read-evidence #p\"spikes/out/4001075987-command-94133-0/report.lisp\")))
 (dolist (line (uiop:split-string (getf r :stdout) :separator '(#\\Newline)))
  (when (or (search \"pool-chain:\" line) (search \"file, \" line)
            (search \"requisiti\" line) (search \"test del controllore pool\" line)
            (search \"link controllati\" line) (search \"tutti i controlli superati\" line))
   (write-line line))))
")
  (:PATH #A((36) BASE-CHAR . "spikes/out/pool-command-summary.lisp") :BYTES 800 :SHA256
   "896ff001bfd954a6de76cf2d1cc63e790dd5413a7f7aede5905d69293ac0bcf2" :GIT-BLOB
   "8d026b60072462078173c5cc82d57a54cfea0916" :TEXT "(require :asdf)
(load \"tools/evidence-storage.lisp\")
(dolist (arg (uiop:command-line-arguments))
 (let* ((r (arcdocdb.evidence:read-evidence arg)) (out (getf r :stdout)))
  (write (list :path arg :status (getf r :status) :consistency (getf r :source-consistency)
   :exit (getf r :exit-code) :seconds (getf r :wall-seconds)
   :sources (length (getf r :source-blobs-before))
   :named-tests (when out (loop for line in (uiop:split-string out :separator '(#\\Newline)) count (uiop:string-prefix-p \"ok    \" line)))
   :stdout-tail (when out (subseq out (max 0 (- (length out) 400))))
   :stderr-characters (when (getf r :stderr) (length (getf r :stderr)))
   :stderr-utf8-bytes (when (getf r :stderr) (length (sb-ext:string-to-octets (getf r :stderr) :external-format :utf-8)))) :pretty t)
  (terpri)))
")
  (:PATH #A((40) BASE-CHAR . "spikes/out/pool-step-dev/count-full.lisp") :BYTES 584 :SHA256
   "993c211e953819a767544e9a7a3ad4ab039862e1f58427b9fa65ca64b633ea5f" :GIT-BLOB
   "39f7a298957df812969796d011fa9d6ded0dd640" :TEXT "(require :asdf)
(load \"tools/evidence-storage.lisp\")
(let* ((report (arcdocdb.evidence:read-evidence (first (uiop:command-line-arguments))))
       (lines (uiop:split-string (getf report :stdout) :separator '(#\\Newline)))
       (marks (remove-if-not (lambda (s) (uiop:string-prefix-p \"ok    \" s)) lines))
       (product (count-if (lambda (s) (uiop:string-prefix-p \"ok    TEST-\" s)) marks)))
  (format t \"~&markers=~D product-named=~D other=~D~%\" (length marks) product (- (length marks) product))
  (dolist (s marks) (unless (uiop:string-prefix-p \"ok    TEST-\" s) (write-line s))))
")
  (:PATH #A((38) BASE-CHAR . "spikes/out/pool-chain/publication.lisp") :BYTES 4095 :SHA256
   "c00047ebd3ccee78b9d3f6a0e1c38c3fb5d9d252dd72a9011188ace480dfd173" :GIT-BLOB
   "a487655d01083d83a3a6b21484a3da0f12531683" :TEXT
   ";;;; C4: orchestration only; verified byte-preserving writers are reused unchanged.
(require :asdf)
(let ((*features* (cons :pool-worker-lifecycle-publication-library *features*)))
  (load \"spikes/out/lifecycle-publication.lisp\"))

(let* ((base \"a34cede6fbc9215908d50aa85311d5d703660040\")
       (destination #p\"spikes/results/2026-10-15-pool-catena/\")
       (args (uiop:command-line-arguments))
       (root (truename \"./\"))
       (records '((:name \"development\" :id \"4001075917-command-92231-0\")
                  (:name \"check-core\" :id \"4001075987-command-94133-0\")
                  (:name \"integrated\" :id \"4001076369-command-11162-0\")))
       (paths '(\"arcdocdb.asd\" \"tests/scheduler/pool-chain-support.lisp\"
                \"tests/scheduler/pool-chain.lisp\" \"docs/implementazione/pool-catena-metodo.md\"
                \"docs/implementazione/pool-catena-risultati.md\" \"docs/implementazione/README.md\"
                \"CHANGELOG.md\" \"spikes/out/pool-chain/development-run.lisp\"
                \"spikes/out/pool-chain/development-test-source.lisp\"
                \"spikes/out/pool-chain/check-development-source.lisp\"
                \"spikes/out/pool-chain/development-attempt-01.log\"
                \"spikes/out/pool-chain/check-attempt-01.log\"
                \"spikes/out/pool-chain/integrated-attempt-01.log\"
                \"spikes/out/pool-chain/extract-check.lisp\"
                \"spikes/out/pool-command-summary.lisp\"
                \"spikes/out/pool-step-dev/count-full.lisp\"
                \"spikes/out/pool-chain/publication.lisp\"
                \"spikes/out/worker-publication-functions.lisp\"
                \"spikes/out/pool-controller/publish.lisp\"
                \"spikes/out/pool-controller/dev-evidence.lisp\"
                \"spikes/out/lifecycle-publication.lisp\"
                \"spikes/out/pool-chain/frozen/arcdocdb.asd\"
                \"spikes/out/pool-chain/frozen/tests/scheduler/pool-chain-support.lisp\"
                \"spikes/out/pool-chain/frozen/tests/scheduler/pool-chain.lisp\"
                \"spikes/out/pool-chain/frozen/docs/implementazione/pool-catena-metodo.md\"
                \"/tmp/arcdocdb-pool-chain-freeze.json\")))
  (unless (= (length args) 1) (error \"One original spike campaign directory required.\"))
  (when (probe-file destination) (error \"Destination already exists: ~A\" destination))
  (dolist (record records)
    (let ((data (arcdocdb.evidence:read-evidence
                 (format nil \"spikes/out/~A/report.lisp\" (getf record :id)))))
      (assert (eq :ok (getf data :status)))
      (assert (eq :stable (getf data :source-consistency)))
      (assert (eql 0 (getf data :exit-code)))))
  (let* ((source-plans (worker-plan-source-bundles paths \"sources\" :pool-chain-source-bundle))
         (record-plans (mapcar (lambda (record)
                                (pool-publication-record-plan record root destination)) records))
         (campaign (lifecycle-evidence-directory-plan
                    (list :name \"check-core-spikes\" :source (first args)) root destination)))
    (ensure-directories-exist (merge-pathnames \"placeholder\" destination))
    (pool-publication-write-plans source-plans destination)
    (worker-save-data
     (list :schema-version 1 :kind :pool-dispatch-chain-evidence :base base
           :processes (mapcar #'pool-publication-copy-record record-plans)
           :campaign (lifecycle-copy-evidence-directory campaign)
           :scenarios '(:held-running :held-batch :full-home-0 :full-home-2
                        :room-home-0 :room-home-2)
           :compatibility '(:catalog-component :writer-worker
                            :whole-file-manifest-kind :pool-worker-lifecycle-whole-file-manifest)
           :limits '(:no-runtime-source-change :original-reports-and-gzip-basename
                     :no-status-promotion :no-speedup-claim :no-whole-engine-qualification))
     (merge-pathnames \"manifesto.lisp\" destination))
    (lifecycle-publication-refresh-manifest base :directory destination)
    (format t \"Pool chain: original records, sources and spike files copied and verified.~%\")))
")
  (:PATH #A((44) BASE-CHAR . "spikes/out/worker-publication-functions.lisp") :BYTES 24521 :SHA256
   "01ce7104faa1905afa2f6b48a03bee04c176ee4c9f68e16ddb1ff435d70a028b" :GIT-BLOB
   "0f07134b815897b8bd75ee04e9f7e9a1b3eab49f" :TEXT
   ";;;; Adattatore della sola conservazione: definizioni, nessuna pubblicazione al LOAD.
;;;; Copie binarie esclusive; descriptor originale letto separatamente dal decoded.
(require :asdf)
(load \"tools/evidence-storage.lisp\")
(in-package #:cl-user)

(defparameter *worker-publication-directory*
  #p\"spikes/results/2026-10-09-writer-worker/\")

(defun worker-leaf-p (name)
  (and (stringp name) (plusp (length name))
       (not (member name '(\".\" \"..\") :test #'string=))
       (not (find-if (lambda (character)
                       (or (zerop (char-code character))
                           (find character \"/\\\\*?[]\"))) name))))

(defun worker-read-raw-data (path)
  \"Una sola forma originale UTF-8, senza READ-EVAL, prima di qualsiasi decoding.\"
  (let ((*read-eval* nil) (*readtable* (copy-readtable nil)) (*read-base* 10)
        (*read-suppress* nil) (eof (gensym \"EOF\")))
    (with-open-file (stream path :direction :input :external-format :utf-8)
      (let* ((data (read stream nil eof)) (size (and (consp data) (list-length data))))
        (unless (and size (evenp size)
                     (loop for key in data by #'cddr always (keywordp key)))
          (error \"Plist originale non valida: ~A\" path))
        (unless (eq eof (read stream nil eof))
          (error \"Più di una forma originale: ~A\" path))
        data))))

(defun worker-byte-record (path)
  (list :path (namestring (pathname path))
        :bytes (arcdocdb.evidence:file-bytes path)
        :sha256 (arcdocdb.evidence:file-sha256 path)
        :git-blob
        (string-trim '(#\\Newline #\\Space)
                     (uiop:run-program
                      (list \"git\" \"hash-object\" \"--\" (namestring (pathname path)))
                      :output :string))))

(defun worker-source-record (path)
  \"Bundle lossless di sorgenti/log UTF-8 con path, bytes, SHA256 e Git blob.\"
  (let* ((before (worker-byte-record path))
         (text (uiop:read-file-string path :external-format :utf-8))
         (octets (sb-ext:string-to-octets text :external-format :utf-8))
         (after (worker-byte-record path)))
    (unless (equal before after) (error \"Sorgente cambiata durante la lettura: ~A\" path))
    (unless (= (length octets) (getf before :bytes))
      (error \"Roundtrip UTF-8 con numero di bytes diverso: ~A\" path))
    (with-open-file (stream path :direction :input :element-type '(unsigned-byte 8))
      (let ((buffer (make-array 65536 :element-type '(unsigned-byte 8))) (position 0))
        (loop for count = (read-sequence buffer stream) until (zerop count)
              do (unless (and (<= (+ position count) (length octets))
                              (loop for i below count
                                    always (= (aref buffer i) (aref octets (+ position i)))))
                   (error \"Roundtrip UTF-8 non lossless: ~A\" path))
                 (incf position count))
        (unless (= position (length octets)) (error \"Sorgente UTF-8 accorciata: ~A\" path))))
    (unless (equal before (worker-byte-record path))
      (error \"Sorgente cambiata durante la verifica UTF-8: ~A\" path))
    (append before (list :text text))))

(defun worker-exclusive-output (path)
  \"O_EXCL e NOFOLLOW: non sostituisce un file o symlink già presente.\"
  (let ((fd (sb-posix:open (namestring (pathname path))
                           (logior sb-posix:o-wronly sb-posix:o-creat sb-posix:o-excl
                                   sb-posix:o-nofollow)
                           #o644)))
    (unwind-protect
         (prog1 (sb-sys:make-fd-stream fd :output t :element-type '(unsigned-byte 8)
                                        :auto-close t)
           (setf fd nil))
      (when fd (sb-posix:close fd)))))

(defun worker-copy-exclusive (source target)
  \"Conserva esattamente i bytes originali e rifiuta destinazioni già esistenti.\"
  (let ((before (worker-byte-record source))
        (buffer (make-array 65536 :element-type '(unsigned-byte 8))))
    (with-open-file (input source :direction :input :element-type '(unsigned-byte 8))
      (with-open-stream (output (worker-exclusive-output target))
        (loop for count = (read-sequence buffer input) until (zerop count)
              do (write-sequence buffer output :end count))))
    (let ((after (worker-byte-record source)) (copy (worker-byte-record target)))
      (unless (and (equal before after)
                   (= (getf before :bytes) (getf copy :bytes))
                   (string= (getf before :sha256) (getf copy :sha256))
                   (string= (getf before :git-blob) (getf copy :git-blob)))
        (error \"Copia non lossless o sorgente cambiata: ~A -> ~A\" source target))
      copy)))

(defun worker-data-octets (data)
  \"Serializzazione unica usata sia dal preflight sia dalla scrittura bounded.\"
  (sb-ext:string-to-octets
   (with-output-to-string (stream)
     (let ((*print-readably* t) (*print-circle* nil)
           (*print-length* nil) (*print-level* nil)
           (*print-right-margin* 100) (*print-miser-width* nil))
       (write data :stream stream :pretty t) (terpri stream)))
   :external-format :utf-8))

(defun worker-byte-records-equal-p (left right)
  (and left right (= (getf left :bytes) (getf right :bytes))
       (string= (getf left :sha256) (getf right :sha256))
       (string= (getf left :git-blob) (getf right :git-blob))))

(defun worker-octets-match-file-p (octets path)
  (and (= (length octets) (arcdocdb.evidence:file-bytes path))
       (with-open-file (input path :direction :input :element-type '(unsigned-byte 8))
         (let ((buffer (make-array 65536 :element-type '(unsigned-byte 8))) (position 0))
           (loop for count = (read-sequence buffer input) until (zerop count)
                 do (unless (and (<= (+ position count) (length octets))
                                 (loop for i below count
                                       always (= (aref buffer i) (aref octets (+ position i)))))
                      (return-from worker-octets-match-file-p nil))
                    (incf position count))
           (= position (length octets))))))

(defun worker-validate-serialized-data (data path &key (max-expanded-bytes 1048576))
  \"Validità reader distinta dall'identità dei bytes serializzati; #: non usa EQ.\"
  (arcdocdb.evidence:read-evidence path :max-expanded-bytes max-expanded-bytes)
  (unless (worker-octets-match-file-p (worker-data-octets data) path)
    (error \"Bytes serializzati differenti dai dati richiesti: ~A\" path))
  t)

(defun worker-evidence-byte-proof (path &key (max-expanded-bytes 134217728))
  \"Reader valido + raw e bytes espansi verificati; nessun EQUALP di fresh #:.
Il descriptor è letto separatamente, con basename e bytes del payload originali.\"
  (unless (sb-posix:s-isreg (sb-posix:stat-mode (sb-posix:lstat (namestring (pathname path)))))
    (error \"Evidence proof richiede file regolare, senza symlink: ~A\" path))
  (let* ((before (worker-byte-record path))
         (raw (worker-read-raw-data path))
         (descriptor (eq (getf raw :kind) :compressed-evidence))
         (payload (and descriptor (getf raw :payload))))
    (when (and payload (not (worker-leaf-p payload)))
      (error \"Payload proof non leaf: ~S\" payload))
    (let* ((payload-path (and payload
                              (merge-pathnames payload (uiop:pathname-directory-pathname path))))
           (payload-before (and payload-path (worker-byte-record payload-path)))
           (decoded (arcdocdb.evidence:read-evidence path :max-expanded-bytes max-expanded-bytes))
           (expanded (arcdocdb.evidence:call-with-evidence-bytes
                      path (lambda (expanded-path) (worker-byte-record expanded-path))
                      :max-expanded-bytes max-expanded-bytes))
           (after (worker-byte-record path))
           (payload-after (and payload-path (worker-byte-record payload-path))))
      (unless (and (worker-byte-records-equal-p before after)
                   (or (null payload-path)
                       (worker-byte-records-equal-p payload-before payload-after)))
        (error \"Evidence o payload cambiati durante il proof: ~A\" path))
      (values (list :raw before :expanded expanded :payload-name payload
                    :payload-record payload-before)
              decoded))))

(defun worker-evidence-proofs-equal-p (left right)
  (and (worker-byte-records-equal-p (getf left :raw) (getf right :raw))
       (worker-byte-records-equal-p (getf left :expanded) (getf right :expanded))
       (equal (getf left :payload-name) (getf right :payload-name))
       (if (getf left :payload-name)
           (worker-byte-records-equal-p (getf left :payload-record) (getf right :payload-record))
           (null (getf right :payload-record)))))

(defun worker-stage-data (data directory)
  \"Prevalida dati UTF-8 in un tempfile esclusivo; massimo un MiB plain.
Il tempfile viene preservato se la lettura o l'uguaglianza dei dati fallisce.\"
  (let ((octets (worker-data-octets data)))
    (when (> (length octets) 1048576)
      (error \"Dati plain oltre un MiB prima della scrittura: ~D bytes.\" (length octets)))
    (multiple-value-bind (fd name)
        (sb-posix:mkstemp (namestring (merge-pathnames \".worker-data-XXXXXX\" directory)))
      (let ((path (pathname name)))
        (unwind-protect
             (with-open-stream
                 (stream (prog1 (sb-sys:make-fd-stream fd :output t
                                                      :element-type '(unsigned-byte 8)
                                                      :auto-close t)
                           (setf fd nil)))
               (write-sequence octets stream))
          (when fd (sb-posix:close fd)))
        (worker-validate-serialized-data data path)
        path))))

(defun worker-save-data (data path)
  \"Prevalida bytes/decoded in out, poi copia esclusivamente senza sovrascrivere.\"
  (let ((temporary (worker-stage-data data #p\"spikes/out/\")))
    (prog1 (worker-copy-exclusive temporary path)
      (worker-validate-serialized-data data path)
      (delete-file temporary))))

(defun worker-copy-evidence (source target)
  \"Copia esclusiva, validità reader e identità raw/expanded bytes; #: non usa EQ.\"
  (multiple-value-bind (before decoded) (worker-evidence-byte-proof source)
    (let* ((payload (getf before :payload-name))
           (source-payload (and payload (merge-pathnames payload (uiop:pathname-directory-pathname source))))
           (target-payload (and payload (merge-pathnames payload (uiop:pathname-directory-pathname target)))))
      (when (> (getf (getf before :raw) :bytes) 1048576)
        (error \"Originale plain/descriptor oltre un MiB: ~A\" source))
      (when (and payload (> (getf (getf before :payload-record) :bytes) 8388608))
        (error \"Payload gzip oltre otto MiB: ~A\" source-payload))
      (unless (worker-leaf-p (file-namestring (pathname target)))
        (error \"Destinazione evidence non leaf: ~A\" target))
      (when (or (probe-file target) (and target-payload (probe-file target-payload)))
        (error \"Destinazione o payload già esistente: ~A\" target))
      (when source-payload (worker-copy-exclusive source-payload target-payload))
      (let ((copied (worker-copy-exclusive source target)))
        (unless (and (worker-evidence-proofs-equal-p before (worker-evidence-byte-proof source))
                     (worker-evidence-proofs-equal-p before (worker-evidence-byte-proof target)))
          (error \"Raw/expanded bytes divergenti dopo copia: ~A -> ~A\" source target))
        (values decoded copied (and target-payload (worker-byte-record target-payload)))))))

(defun worker-copy-evidence-resume (source target)
  \"Skip solo dopo proof completo; nessun file esistente viene sovrascritto.\"
  (let* ((before (worker-evidence-byte-proof source))
         (payload (getf before :payload-name))
         (target-payload (and payload (merge-pathnames payload (uiop:pathname-directory-pathname target)))))
    (when (> (getf (getf before :raw) :bytes) 1048576)
      (error \"Originale plain/descriptor oltre un MiB: ~A\" source))
    (when (and payload (> (getf (getf before :payload-record) :bytes) 8388608))
      (error \"Payload gzip oltre otto MiB: ~A\" payload))
    (cond
      ((probe-file target)
       (unless (and (worker-evidence-proofs-equal-p before (worker-evidence-byte-proof target))
                    (worker-evidence-proofs-equal-p before (worker-evidence-byte-proof source)))
         (error \"Resume rifiutato: evidence esistente diversa; nessun overwrite: ~A\" target))
       (format t \"Evidence esistente verificata senza overwrite: ~A~%\" target)
       :verified-existing)
      ((and target-payload (probe-file target-payload))
       ;; Interruzione tra payload e descriptor: si completa soltanto se il gzip
       ;; esistente coincide esattamente con l'originale valido e ancora stabile.
       (unless (and (worker-byte-records-equal-p (getf before :payload-record)
                                                (worker-byte-record target-payload))
                    (worker-evidence-proofs-equal-p before (worker-evidence-byte-proof source)))
         (error \"Resume rifiutato: payload esistente diverso; nessun overwrite: ~A\" target-payload))
       (worker-copy-exclusive source target)
       (unless (and (worker-evidence-proofs-equal-p before (worker-evidence-byte-proof target))
                    (worker-evidence-proofs-equal-p before (worker-evidence-byte-proof source)))
         (error \"Resume descriptor divergente; files preservati: ~A\" target))
       :completed-descriptor)
      (t (worker-copy-evidence source target) :copied))))

(defun worker-validate-compacted-review-results ()
  \"Riusa esclusivamente lo stage già valido: niente gzip e niente overwrite.\"
  (let* ((source #p\"spikes/out/worker-review-results-data.lisp\")
         (target #p\"spikes/out/worker-review-results-compacted/worker-review-results-data.lisp\")
         (source-proof (worker-evidence-byte-proof source))
         (target-proof (worker-evidence-byte-proof target))
         (summary (arcdocdb.evidence:read-evidence \"spikes/out/worker-review-summary-data.lisp\")))
    (unless (and (string= (getf summary :original-sha256)
                         (getf (getf source-proof :raw) :sha256))
                 (string= (getf target-proof :payload-name) \"worker-review-results-data.lisp.gz\")
                 (worker-byte-records-equal-p (getf source-proof :expanded)
                                              (getf target-proof :expanded))
                 (worker-evidence-proofs-equal-p source-proof (worker-evidence-byte-proof source)))
      (error \"Stage full esistente diverso dall'originale; nessun overwrite.\"))
    (format t \"Stage full esistente verificato raw/expanded: ~A, ~D bytes logici.~%\"
            target (getf (getf source-proof :expanded) :bytes))
    target))

(defun worker-compact-review-results ()
  \"Compatta una copia ignored del full; il plain originale non viene modificato.
La nuova directory e tutti i file sono esclusivi. Ogni errore conserva i file
prodotti per diagnosi; il payload gzip ha un basename unico e verificato.\"
  (let* ((source #p\"spikes/out/worker-review-results-data.lisp\")
         (directory #p\"spikes/out/worker-review-results-compacted/\")
         (target (merge-pathnames (file-namestring source) directory))
         (payload-name (concatenate 'string (file-namestring source) \".gz\"))
         (payload (merge-pathnames payload-name directory))
         (before (worker-byte-record source))
         (original-valid (progn (arcdocdb.evidence:read-evidence source) t))
         (summary (arcdocdb.evidence:read-evidence
                   \"spikes/out/worker-review-summary-data.lisp\")))
    (declare (ignore original-valid))
    (unless (string= (getf before :sha256) (getf summary :original-sha256))
      (error \"Summary non riferito ai bytes del full originale.\"))
    (sb-posix:mkdir (namestring directory) #o700)
    (with-open-stream (output (worker-exclusive-output payload))
      (uiop:run-program (list \"gzip\" \"-n\" \"-9\" \"-c\" \"--\" (namestring source))
                        :output output :error-output :string))
    (when (> (arcdocdb.evidence:file-bytes payload) 8388608)
      (error \"Payload full compattato oltre otto MiB; file ignored preservati.\"))
    (unless (equal before (worker-byte-record source))
      (error \"Full originale cambiato durante gzip; file ignored preservati.\"))
    (let* ((descriptor
             (list :schema-version 1 :kind :compressed-evidence :codec :gzip
                   :payload payload-name :uncompressed-bytes (getf before :bytes)
                   :uncompressed-sha256 (getf before :sha256)
                   :compressed-bytes (arcdocdb.evidence:file-bytes payload)
                   :compressed-sha256 (arcdocdb.evidence:file-sha256 payload)))
           (octets (worker-data-octets descriptor)))
      (when (> (length octets) 1048576)
        (error \"Descriptor full oltre un MiB prima della scrittura.\"))
      (with-open-stream (output (worker-exclusive-output target))
        (write-sequence octets output))
      ;; READ-EVIDENCE qui è intenzionalmente distinto dalla lettura raw del
      ;; descriptor: il full espanso è 29 MB e usa il limite pubblico del reader.
      (unless (and (worker-octets-match-file-p octets target)
                   (worker-byte-records-equal-p
                    (getf (worker-evidence-byte-proof source) :expanded)
                    (getf (worker-evidence-byte-proof target) :expanded))
                   (equal before (worker-byte-record source)))
        (error \"Descriptor o decoded full divergenti; originali preservati.\"))
      (format t \"Full audit compattato senza modificare il plain: ~D -> ~D bytes, SHA logico ~A.~%\"
              (getf before :bytes) (arcdocdb.evidence:file-bytes payload)
              (getf before :sha256))
      target)))

(defun worker-copy-process (record stem &key (directory *worker-publication-directory*))
  \"Copia report e conservazione con nomi flat; nessun overwrite implicito.\"
  (unless (and (worker-leaf-p record) (worker-leaf-p stem))
    (error \"Record o stem non leaf: ~S / ~S\" record stem))
  (dolist (part '(\"report\" \"conservazione\"))
    (worker-copy-evidence
     (format nil \"spikes/out/~A/~A.lisp\" record part)
     (merge-pathnames
      (format nil \"~A~A.lisp\" stem (if (string= part \"report\") \"\" \"-conservazione\"))
      directory))))

(defun worker-save-source-bundle (paths target kind &key version)
  (worker-save-data
   (append (list :schema-version 1 :kind kind)
           (when version (list :version version))
           (list :sources (mapcar #'worker-source-record paths))) target))

(defun worker-source-bundle-data (sources kind version part parts)
  (append (list :schema-version 1 :kind kind)
          (when version (list :version version))
          (list :part part :parts parts :sources sources)))

(defun worker-plan-source-bundles (paths stem kind &key version)
  \"Legge ogni sorgente intero una volta e pianifica bundle sotto un MiB.
Nessuna scrittura, neppure temporanea; i nomi sono determinati prima delle copie.
Il record conserva path/bytes/SHA256/Git blob/text originali senza frammenti.\"
  (unless (and paths (worker-leaf-p stem))
    (error \"Bundle senza sorgenti o stem leaf: ~S\" stem))
  (unless (= (length paths) (length (remove-duplicates paths :test #'equal)))
    (error \"Sorgenti duplicate nel bundle ~A.\" stem))
  (let ((groups nil) (group nil) (part-bound (length paths)))
    (dolist (path paths)
      (let* ((record (worker-source-record path))
             (candidate (append group (list record))))
        ;; Il massimo indice/numero di parti è il numero di sorgenti: riserva
        ;; esattamente lo spazio di metadata sufficiente per qualsiasi split.
        (if (<= (length (worker-data-octets
                         (worker-source-bundle-data candidate kind version
                                                    part-bound part-bound)))
                1048576)
            (setf group candidate)
            (progn
              (unless group
                (error \"Sorgente singola oltre un MiB serializzato: ~A\" path))
              (push group groups)
              (setf group (list record))
              (when (> (length (worker-data-octets
                               (worker-source-bundle-data group kind version
                                                          part-bound part-bound)))
                       1048576)
                (error \"Sorgente singola oltre un MiB serializzato: ~A\" path))))))
    (push group groups)
    (setf groups (nreverse groups))
    (loop with parts = (length groups)
          for sources in groups for part from 1
          for leaf = (if (= parts 1) (format nil \"~A.lisp\" stem)
                         (format nil \"~A-~D.lisp\" stem part))
          for data = (worker-source-bundle-data sources kind version part parts)
          for bytes = (length (worker-data-octets data))
          do (when (> bytes 1048576)
               (error \"Piano bundle oltre un MiB: ~A (~D).\" leaf bytes))
          collect (list :leaf leaf :data data :bytes bytes))))

(defun worker-validate-source-plans (plans)
  \"Verifica che i bytes conservati nel piano si riferiscano ancora ai sorgenti.\"
  (dolist (plan plans)
    (dolist (source (getf (getf plan :data) :sources))
      (let ((current (worker-byte-record (getf source :path))))
        (unless (and (= (getf source :bytes) (getf current :bytes))
                     (string= (getf source :sha256) (getf current :sha256))
                     (string= (getf source :git-blob) (getf current :git-blob)))
          (error \"Sorgente cambiata dopo il piano: ~A\" (getf source :path))))))
  t)

(defun worker-write-catalog (data target)
  \"Sostituisce soltanto il catalogo del componente, dopo staging verificato.\"
  (unless (string= (file-namestring (pathname target)) \"catalogo.lisp\")
    (error \"La sostituzione è consentita soltanto per catalogo.lisp: ~A\" target))
  (let ((previous (and (probe-file target) (arcdocdb.evidence:read-evidence target))))
    (when (and previous
               (not (and (eq (getf previous :kind) :evidence-catalog)
                         (eq (getf previous :component) :writer-worker))))
      (error \"Catalogo esistente di un altro componente: ~A\" target))
    (let* ((temporary (worker-stage-data data (uiop:pathname-directory-pathname target)))
           (before (worker-byte-record temporary)))
      (sb-posix:rename (namestring temporary) (namestring (pathname target)))
      (let ((after (worker-byte-record target)))
        (unless (and (= (getf before :bytes) (getf after :bytes))
                     (string= (getf before :sha256) (getf after :sha256))
                     (string= (getf before :git-blob) (getf after :git-blob))
                     (worker-validate-serialized-data data target))
          (error \"Catalogo differente dopo rename verificato: ~A\" target))
        after))))

(defun worker-refresh-catalog (base &key historical-bases
                                        (directory *worker-publication-directory*))
  \"Catalogo flat dei dati validati, path originali, hashes e Git blobs dei files.\"
  (let* ((paths (sort (directory (merge-pathnames \"*.lisp\" directory)) #'string<
                      :key #'namestring))
         (entries
           (loop for path in paths
                 unless (string= (file-namestring path) \"catalogo.lisp\")
                 collect
                 (progn
                   (unless (worker-leaf-p (file-namestring path))
                     (error \"Artifact non flat: ~A\" path))
                   (arcdocdb.evidence:read-evidence path)
                   (let ((raw (worker-read-raw-data path)))
                     (append (list :artifact (file-namestring path))
                             (worker-byte-record path)
                             (when (eq (getf raw :kind) :compressed-evidence)
                               (let ((payload (getf raw :payload)))
                                 (list :payload
                                       (append (list :artifact payload)
                                               (worker-byte-record
                                                (merge-pathnames payload directory))))))))))))
    (worker-write-catalog
     (list :schema-version 1 :kind :evidence-catalog :component :writer-worker
           :base base :historical-bases historical-bases :entries entries)
     (merge-pathnames \"catalogo.lisp\" directory))))
")
  (:PATH #A((39) BASE-CHAR . "spikes/out/pool-controller/publish.lisp") :BYTES 10232 :SHA256
   "0cc8bd2cd31501dee4e4c40a8a520ac2b779df100489543ae7dd37e6baf33ab5" :GIT-BLOB
   "3d624e41af60732b0ac5f14432abd047a403cc8e" :TEXT
   ";;;; Pubblicazione solo a esecuzione esplicita dopo il congelamento approvato dal root.
;;;; Il JSON di stato viene proiettato dal root in una plist di input, mai interpretato come codice.
;;;; --script .../publish.lisp input.lisp; feature biblioteca :pool-controller-publication-library.
(require :asdf)
(load \"spikes/out/worker-publication-functions.lisp\")
(load \"spikes/out/pool-controller/dev-evidence.lisp\")
(in-package #:cl-user)

(defparameter *pool-publication-directory* #p\"spikes/results/2026-10-13-pool-controller/\")

(defun pool-publication-root (path)
  (let ((root (uiop:ensure-directory-pathname (pathname path))))
    (unless (uiop:directory-exists-p root)
      (error \"Root delle prove assente: ~A\" root))
    (truename root)))

(defun pool-publication-source (value default-root)
  (let ((path (pathname value)))
    (if (uiop:absolute-pathname-p path) path (merge-pathnames path default-root))))

(defun pool-publication-evidence-preflight (path)
  (let* ((proof (worker-evidence-byte-proof path))
         (raw (getf proof :raw)) (payload (getf proof :payload-record)))
    (when (> (getf raw :bytes) 1048576)
      (error \"Evidence plain/descriptor oltre un MiB: ~A\" path))
    (when (and payload (> (getf payload :bytes) 8388608))
      (error \"Payload oltre otto MiB: ~A\" path))
    proof))

(defun pool-publication-record-plan (record default-root destination)
  \"Una sottodirectory per processo preserva anche basename gzip generici.\"
  (let* ((name (getf record :name)) (id (getf record :id))
         (source (if (getf record :directory)
                     (pool-publication-root (getf record :directory))
                     (merge-pathnames
                      (format nil \"spikes/out/~A/\" id)
                      (pool-publication-root (or (getf record :root) default-root))))))
    (unless (and (worker-leaf-p name) (worker-leaf-p id))
      (error \"Nome o ID del processo non leaf: ~S\" record))
    (let ((target (merge-pathnames (format nil \"processes/~A/\" name) destination)))
      (dolist (leaf '(\"report.lisp\" \"conservazione.lisp\"))
        (pool-publication-evidence-preflight (merge-pathnames leaf source)))
      (list :name name :id id :source source :target target))))

(defun pool-publication-copy-record (plan)
  (ensure-directories-exist (merge-pathnames \"placeholder\" (getf plan :target)))
  (dolist (leaf '(\"report.lisp\" \"conservazione.lisp\"))
    (worker-copy-evidence (merge-pathnames leaf (getf plan :source))
                          (merge-pathnames leaf (getf plan :target))))
  (list :name (getf plan :name) :id (getf plan :id)
        :source-directory (namestring (getf plan :source))
        :published-directory (namestring (getf plan :target))))

(defun pool-publication-copy-data (entry default-root destination)
  \"Report benchmark o audit structured: copie originali, mai rinomina del payload.\"
  (let* ((name (getf entry :name))
         (source (pool-publication-source (getf entry :source) default-root)))
    (unless (worker-leaf-p name) (error \"Nome dati non leaf: ~S\" entry))
    (let ((target (merge-pathnames (format nil \"data/~A/~A\" name (file-namestring source))
                                   destination)))
      (ensure-directories-exist target)
      (worker-copy-evidence source target)
      (list :name name :source (namestring source) :published (namestring target)))))

(defun pool-publication-write-plans (plans destination)
  (worker-validate-source-plans plans)
  (dolist (plan plans)
    (worker-save-data (getf plan :data) (merge-pathnames (getf plan :leaf) destination)))
  (worker-validate-source-plans plans)
  t)

(defun pool-publication-files (destination)
  \"Ogni file canonico ha SHA, bytes e Git blob; root catalog escluso dall'autoriferimento.\"
  (let ((files nil) (destination (truename destination)))
    (labels ((walk (directory)
               (dolist (path (uiop:directory-files directory))
                 (unless (equal path (merge-pathnames \"catalogo.lisp\" destination))
                   (unless (sb-posix:s-isreg
                            (sb-posix:stat-mode (sb-posix:lstat (namestring path))))
                     (error \"Artefatto canonico non regolare: ~A\" path))
                   (let ((limit (if (equal (pathname-type path) \"gz\") 8388608 1048576)))
                     (when (> (arcdocdb.evidence:file-bytes path) limit)
                       (error \"Artefatto canonico oltre budget: ~A\" path)))
                   (when (equal (pathname-type path) \"lisp\")
                     (arcdocdb.evidence:read-evidence path))
                   (push (append (list :relative-path (enough-namestring path destination))
                                 (worker-byte-record path)) files)))
               (dolist (subdirectory (uiop:subdirectories directory))
                 (when (sb-posix:s-islnk
                        (sb-posix:stat-mode (sb-posix:lstat (namestring subdirectory))))
                   (error \"Directory canonica symlink rifiutata: ~A\" subdirectory))
                 (walk subdirectory))))
      (walk destination))
    (sort files #'string< :key (lambda (record) (getf record :relative-path)))))

(defun pool-publication-refresh-manifest (base &key (stem \"manifesto-file\")
                                                   (directory *pool-publication-directory*))
  \"Nuovo manifest esclusivo; solo catalogo.lisp derivato viene sostituito dal helper.\"
  (unless (worker-leaf-p stem) (error \"Stem manifest non leaf: ~S\" stem))
  (worker-save-data
   (list :schema-version 1 :kind :pool-controller-whole-file-manifest
         :base base :files (pool-publication-files directory)
         :limits '(:raw-file-hashes :root-catalog-excluded :manifest-not-self-referential))
   (merge-pathnames (format nil \"~A.lisp\" stem) directory))
  ;; Il helper conserva la sua famiglia :writer-worker; il manifest identifica il componente nuovo.
  (worker-refresh-catalog base :directory directory)
  t)

(defun pool-publication-run (config input-path)
  \"Input trusted come dati, source bundle frozen/finali e tutte le prove dev originali.\"
  (let* ((base (getf config :base))
         (snapshot (pool-publication-root (getf config :snapshot)))
         (current (truename (uiop:getcwd)))
         (paths (getf config :paths))
         (destination *pool-publication-directory*)
         (records (getf config :records))
         (record-root (pool-publication-root (or (getf config :record-root) snapshot)))
         (data (append (getf config :evidence)
                       (when (getf config :benchmark-report)
                         (list (list :name \"benchmark\" :source (getf config :benchmark-report)))))))
    (unless (and (stringp base) (= (length base) 40)
                 (every (lambda (character) (digit-char-p character 16)) base)
                 paths records)
      (error \"Input richiede base SHA40, snapshot, paths e records.\"))
    (unless (= (length records)
               (length (remove-duplicates records :test #'string= :key (lambda (entry) (getf entry :name)))))
      (error \"Nomi dei processi duplicati.\"))
    (unless (= (length data)
               (length (remove-duplicates data :test #'string= :key (lambda (entry) (getf entry :name)))))
      (error \"Nomi delle prove strutturate duplicati.\"))
    (dolist (entry data)
      (unless (worker-leaf-p (getf entry :name)) (error \"Nome evidence non leaf: ~S\" entry))
      (pool-publication-evidence-preflight
       (pool-publication-source (getf entry :source) record-root)))
    (let* ((record-plans (mapcar (lambda (record)
                                  (pool-publication-record-plan record record-root destination)) records))
           (qualified-plans
             (worker-plan-source-bundles
              (mapcar (lambda (path) (pool-publication-source path snapshot)) paths)
              \"sources-qualified\" :pool-controller-qualified-sources :version base))
           (final-plans
             (worker-plan-source-bundles
              (mapcar (lambda (path) (pool-publication-source path current))
                      (or (getf config :final-paths) paths))
              \"sources-final\" :pool-controller-final-sources :version base))
           (orchestration-plans
             (worker-plan-source-bundles
              (remove-duplicates
               (append (list #p\"spikes/out/worker-publication-functions.lisp\"
                             #p\"spikes/out/pool-controller/dev-evidence.lisp\"
                             #p\"spikes/out/pool-controller/publish.lisp\" input-path)
                       (getf config :extra-sources)) :test #'equal)
              \"publication-orchestration\" :pool-controller-publication-sources :version base))
           (development (pool-development-plan)))
      ;; Tutti i piani e le prove sono verificati prima delle prime scritture canoniche.
      (ensure-directories-exist (merge-pathnames \"placeholder\" destination))
      (pool-publication-write-plans qualified-plans destination)
      (pool-publication-write-plans final-plans destination)
      (pool-publication-write-plans orchestration-plans destination)
      (pool-development-write development destination)
      (worker-save-data
       (list :schema-version 1 :kind :pool-controller-process-manifest :base base
             :processes (mapcar #'pool-publication-copy-record record-plans)
             :data (mapcar (lambda (entry)
                             (pool-publication-copy-data entry record-root destination)) data)
             :limits '(:original-process-report-and-conservation :no-status-promotion
                       :one-directory-per-process :original-gzip-payload-basename))
       (merge-pathnames \"process-manifest.lisp\" destination))
      (pool-publication-refresh-manifest base :directory destination)
      (format t \"Pool controller evidence: original bytes verified; no source mutation.~%\")
      t)))

(unless (member :pool-controller-publication-library *features*)
  (let ((args (uiop:command-line-arguments)))
    (unless (= (length args) 1)
      (error \"Uso: sbcl --script spikes/out/pool-controller/publish.lisp input-plist.lisp\"))
    (let* ((path (pathname (first args))) (data (worker-read-raw-data path)))
      (pool-publication-run data path))))
")
  (:PATH #A((44) BASE-CHAR . "spikes/out/pool-controller/dev-evidence.lisp") :BYTES 7019 :SHA256
   "80d3a91387e7d7563dbd82137aaedd29cfba0a3773cc44e88694b6d4302e8712" :GIT-BLOB
   "180ad7bf32e7818eb60364f80ebf26075a32bbf1" :TEXT
   ";;;; Conservazione lossless dei file di sviluppo; il LOAD definisce soltanto funzioni.
;;;; Eseguire soltanto dopo la fine degli scrittori di pool-tests/pool-measure.
(in-package #:cl-user)

(defparameter *pool-development-roots*
  '(#p\"spikes/out/pool-controller/\" #p\"spikes/out/pool-tests/\"
    #p\"spikes/out/pool-measure/\"))

(defparameter *pool-development-required*
  '(#p\"spikes/out/pool-controller/compile-01.log\"
    #p\"spikes/out/pool-controller/lint-01.log\"
    #p\"spikes/out/pool-controller/trace-write-01.log\"
    #p\"spikes/out/pool-tests/scoped-attempt-1.log\"
    #p\"spikes/out/pool-tests/scoped-attempt-2.log\"
    #p\"spikes/out/pool-tests/scoped-attempt-3.log\"
    #p\"spikes/out/pool-tests/scoped-attempt-4.log\"))

(defun pool-development-files ()
  \"Inventario ricorsivo, senza seguire symlink; soltanto FASL sono intermedi esclusi.\"
  (let ((included nil) (excluded nil))
    (labels ((walk (root)
               (dolist (path (uiop:directory-files root))
                 (unless (sb-posix:s-isreg
                          (sb-posix:stat-mode (sb-posix:lstat (namestring path))))
                   (error \"Dev raw non regolare, nessuna pubblicazione: ~A\" path))
                 (let ((type (string-downcase (or (pathname-type path) \"\"))))
                   (cond
                     ((string= type \"fasl\")
                      (push (list :path (namestring path) :reason :compiler-intermediate)
                            excluded))
                     ((member type '(\"lisp\" \"html\" \"log\" \"stdout\" \"stderr\"
                                     \"txt\" \"sha256\" \"json\" \"md\") :test #'string=)
                      (push (truename path) included))
                     (t (error \"Raw con estensione non prevista, preservarlo prima di procedere: ~A\"
                               path)))))
               (dolist (subdirectory (uiop:subdirectories root))
                 (when (sb-posix:s-islnk
                        (sb-posix:stat-mode (sb-posix:lstat (namestring subdirectory))))
                   (error \"Directory dev symlink rifiutata: ~A\" subdirectory))
                 (walk subdirectory))))
      (dolist (root *pool-development-roots*)
        (unless (uiop:directory-exists-p root)
          (error \"Directory dev mancante: ~A\" root))
        (walk root)))
    (dolist (path *pool-development-required*)
      (unless (and (probe-file path) (find (truename path) included :test #'equal))
        (error \"Raw di sviluppo richiesto assente: ~A\" path)))
    (values (sort included #'string< :key #'namestring)
            (sort excluded #'string< :key (lambda (entry) (getf entry :path))))))

(defun pool-development-plan ()
  \"Pianifica prima delle copie; sorgenti singole grandi vanno in bundle gzip lossless.\"
  (multiple-value-bind (paths excluded) (pool-development-files)
    (let ((small nil) (large nil))
      (dolist (path paths)
        (let* ((record (worker-source-record path))
               (data (worker-source-bundle-data
                      (list record) :pool-controller-development-large \"2026-10-13\"
                      (length paths) (length paths))))
          (if (> (length (worker-data-octets data)) 1048576)
              (push record large)
              (push path small))))
      (setf small (nreverse small) large (nreverse large))
      (let ((plans (worker-plan-source-bundles
                    small \"development-evidence\" :pool-controller-development
                    :version \"2026-10-13\")))
        (loop for record in large for part from 1
              do (let ((data (worker-source-bundle-data
                             (list record) :pool-controller-development-large
                             \"2026-10-13\" part (length large))))
                   (when (> (length (worker-data-octets data)) 134217728)
                     (error \"Sorgente dev oltre il budget espanso: ~A\" (getf record :path)))
                   (setf plans
                         (append plans
                                 (list (list :leaf (format nil \"development-large-~D.lisp\" part)
                                             :data data :large t))))))
        (worker-validate-source-plans plans)
        (list :plans plans :paths paths :excluded excluded)))))

(defun pool-development-write (plan destination)
  \"Scrive una volta, mai sovrascrive; stage grandi conservati anche su guasto.\"
  (let* ((plans (getf plan :plans))
         (large (remove-if-not (lambda (entry) (getf entry :large)) plans))
         (stage nil))
    (worker-validate-source-plans plans)
    (dolist (entry plans)
      (unless (getf entry :large)
        (worker-save-data (getf entry :data)
                          (merge-pathnames (getf entry :leaf) destination))))
    (when large
      ;; Stage separato dalle tre directory inventariate: non viene ricopiato come raw.
      (ensure-directories-exist #p\"spikes/out/pool-publication-staging/placeholder\")
      (setf stage
            (uiop:ensure-directory-pathname
             (format nil \"spikes/out/pool-publication-staging/~D-~D/\"
                     (get-universal-time) (sb-posix:getpid))))
      (sb-posix:mkdir (namestring stage) #o700)
      (dolist (entry large)
        (let* ((data (getf entry :data))
               (path (merge-pathnames (getf entry :leaf) stage)))
          (with-open-file (stream path :direction :output :if-exists :error
                                      :if-does-not-exist :create :external-format :utf-8)
            (let ((*print-readably* t) (*print-circle* nil) (*print-length* nil)
                  (*print-level* nil) (*print-right-margin* 100) (*print-miser-width* nil))
              (write data :stream stream :pretty t) (terpri stream)))
          (worker-validate-serialized-data data path :max-expanded-bytes 134217728)))
      (load \"tools/finish-evidence.lisp\")
      (unless (funcall (fdefinition 'compact-finished-directory) stage)
        (error \"Compattazione dev fallita; stage originale conservato: ~A\" stage))
      (dolist (entry large)
        (worker-copy-evidence (merge-pathnames (getf entry :leaf) stage)
                              (merge-pathnames (getf entry :leaf) destination)))
      (worker-copy-evidence
       (merge-pathnames \"conservazione.lisp\" stage)
       (merge-pathnames \"development-large-conservazione.lisp\" destination)))
    (worker-validate-source-plans plans)
    (worker-save-data
     (list :schema-version 1 :kind :pool-controller-development-manifest
           :included (mapcar #'worker-byte-record (getf plan :paths))
           :bundles (mapcar (lambda (entry) (getf entry :leaf)) plans)
           :excluded-intermediates (getf plan :excluded)
           :large-stage (and stage (namestring stage))
           :limits '(:original-development-logs :no-run-status-reinterpretation
                     :current-runners-not-historical-source-reconstruction
                     :compiler-fasl-not-published :utf8-roundtrip-byte-verified))
     (merge-pathnames \"development-manifest.lisp\" destination))
    t))
")
  (:PATH #A((37) BASE-CHAR . "spikes/out/lifecycle-publication.lisp") :BYTES 16129 :SHA256
   "2e127810d51f29c1bc5cd9ca2f0136c764158a77fc1962512537053de60e6754" :GIT-BLOB
   "a5a6d8b1c917b73be2130a1ad47cea53e22845d2" :TEXT
   ";;;; Conservazione del lifecycle solo a esecuzione esplicita dopo il freeze del root.
;;;; Il LOAD con :pool-worker-lifecycle-publication-library definisce soltanto funzioni.
;;;; Input: una plist di dati, proiezione lossless documentata dello stato JSON originale.
(require :asdf)
(let ((*features* (cons :pool-controller-publication-library *features*)))
  (load \"spikes/out/pool-controller/publish.lisp\"))
(in-package #:cl-user)

(defparameter *lifecycle-publication-directory*
  #p\"spikes/results/2026-10-13-pool-worker-lifecycle/\")
(defparameter *lifecycle-development-roots*
  '(#p\"spikes/out/lifecycle-dev/\" #p\"spikes/out/lifecycle-tests/\"
    #p\"spikes/out/lifecycle-measure/\"))
(defparameter *lifecycle-development-required*
  '(#p\"spikes/out/lifecycle-dev/compile-01.stdout\"
    #p\"spikes/out/lifecycle-dev/compile-01.stderr\"
    #p\"spikes/out/lifecycle-dev/compile-02.stdout\"
    #p\"spikes/out/lifecycle-dev/compile-02.stderr\"
    #p\"spikes/out/lifecycle-dev/compile-03.stdout\"
    #p\"spikes/out/lifecycle-dev/compile-03.stderr\"
    #p\"spikes/out/lifecycle-tests/scoped-attempt-1.log\"
    #p\"spikes/out/lifecycle-tests/scoped-attempt-2.log\"))

(defun lifecycle-regular-file (path)
  (unless (sb-posix:s-isreg
           (sb-posix:stat-mode (sb-posix:lstat (namestring path))))
    (error \"Originale non regolare o symlink rifiutato: ~A\" path))
  (truename path))

(defun lifecycle-directory (path)
  (let* ((directory (uiop:ensure-directory-pathname (pathname path)))
         ;; Un slash finale farebbe seguire il link anche a lstat su POSIX.
         (without-slash (string-right-trim \"/\" (namestring directory)))
         (inspection-path (if (zerop (length without-slash)) \"/\" without-slash)))
    (unless (sb-posix:s-isdir
             (sb-posix:stat-mode (sb-posix:lstat inspection-path)))
      (error \"Directory assente, non regolare o symlink: ~A\" directory))
    (truename directory)))

(defun lifecycle-development-files (&key (roots *lifecycle-development-roots*)
                                         (required *lifecycle-development-required*) extra)
  \"Ogni originale UTF8 di qualunque estensione; esclusi soltanto intermedi FASL.\"
  (let ((included nil) (excluded nil))
    (labels ((include-file (path)
               (let ((original (lifecycle-regular-file path)))
                 (if (string-equal (or (pathname-type original) \"\") \"fasl\")
                     (pushnew (list :path (namestring original)
                                    :reason :compiler-intermediate) excluded :test #'equal)
                     (progn
                       ;; Il roundtrip controlla i bytes: estensioni nuove non vengono scartate.
                       (worker-source-record original)
                       (pushnew original included :test #'equal)))))
             (walk (directory)
               (dolist (path (uiop:directory-files directory)) (include-file path))
               (dolist (path (uiop:subdirectories directory))
                 (walk (lifecycle-directory path)))))
      (dolist (root roots) (walk (lifecycle-directory root)))
      (dolist (path extra) (include-file (pathname path))))
    (dolist (path required)
      (unless (and (probe-file path) (find (truename path) included :test #'equal))
        (error \"Raw richiesto assente dall'inventario: ~A\" path)))
    (unless included (error \"Inventario di sviluppo vuoto.\"))
    (values (sort included #'string< :key #'namestring)
            (sort excluded #'string< :key (lambda (entry) (getf entry :path))))))

(defun lifecycle-development-plan (&key (roots *lifecycle-development-roots*)
                                        (required *lifecycle-development-required*) extra)
  \"Fonti UTF8 esatte; singole fonti oltre un MiB in bundle gzip lossless.\"
  (multiple-value-bind (paths excluded)
      (lifecycle-development-files :roots roots :required required :extra extra)
    (let ((small nil) (large nil))
      (dolist (path paths)
        (let* ((record (worker-source-record path))
               (data (worker-source-bundle-data
                      (list record) :pool-worker-lifecycle-development-large \"2026-10-13\"
                      (length paths) (length paths))))
          (if (> (length (worker-data-octets data)) 1048576)
              (push record large) (push path small))))
      (setf small (nreverse small) large (nreverse large))
      (let ((plans (and small
                        (worker-plan-source-bundles
                         small \"development-evidence\" :pool-worker-lifecycle-development
                         :version \"2026-10-13\"))))
        (loop for record in large for part from 1
              do (let ((data (worker-source-bundle-data
                             (list record) :pool-worker-lifecycle-development-large
                             \"2026-10-13\" part (length large))))
                   (when (> (length (worker-data-octets data)) 134217728)
                     (error \"Fonte oltre il budget espanso: ~A\" (getf record :path)))
                   (setf plans
                         (append plans
                                 (list (list :leaf (format nil \"development-large-~D.lisp\" part)
                                             :data data :large t))))))
        (worker-validate-source-plans plans)
        (list :plans plans :paths paths :excluded excluded)))))

(defun lifecycle-evidence-directory-plan (entry default-root destination)
  \"Piano dell'intera campagna originale, compresi i payload gzip e la conservazione.\"
  (let* ((name (getf entry :name))
         (source (lifecycle-directory
                  (pool-publication-source (getf entry :source) default-root)))
         (files nil))
    (unless (worker-leaf-p name) (error \"Nome campagna non leaf: ~S\" name))
    (labels ((walk (directory)
               (dolist (path (uiop:directory-files directory))
                 (lifecycle-regular-file path)
                 (let ((limit (if (string-equal (or (pathname-type path) \"\") \"gz\")
                                  8388608 1048576)))
                   (when (> (arcdocdb.evidence:file-bytes path) limit)
                     (error \"Originale della campagna oltre budget: ~A\" path)))
                 (when (string-equal (or (pathname-type path) \"\") \"lisp\")
                   (pool-publication-evidence-preflight path))
                 (push (append (list :relative-path (enough-namestring path source))
                               (worker-byte-record path)) files))
               (dolist (path (uiop:subdirectories directory))
                 (walk (lifecycle-directory path)))))
      (walk source))
    (unless files (error \"Campagna originale vuota: ~A\" source))
    (list :name name :source source
          :target (merge-pathnames (format nil \"campaigns/~A/\" name) destination)
          :files (sort files #'string< :key (lambda (record) (getf record :relative-path))))))

(defun lifecycle-copy-evidence-directory (plan)
  \"Copie originali esclusive; nessuna modifica ai descriptor o ai nomi dei payload.\"
  (let ((copied nil))
    (dolist (record (getf plan :files))
      (let* ((source (pathname (getf record :path)))
             (target (merge-pathnames (getf record :relative-path) (getf plan :target))))
        (unless (worker-byte-records-equal-p record (worker-byte-record source))
          (error \"Campagna mutata dopo il piano: ~A\" source))
        (ensure-directories-exist target)
        (worker-copy-exclusive source target)
        (unless (worker-byte-records-equal-p record (worker-byte-record target))
          (error \"Copia campagna diversa dai bytes pianificati: ~A\" target))
        (push (append (list :relative-path (getf record :relative-path))
                      (worker-byte-record target)) copied)))
    ;; I descriptor si verificano dopo avere copiato tutti i relativi payload.
    (dolist (record copied)
      (let ((path (pathname (getf record :path))))
        (when (string-equal (or (pathname-type path) \"\") \"lisp\")
          (pool-publication-evidence-preflight path))))
    (list :name (getf plan :name) :source-directory (namestring (getf plan :source))
          :published-directory (namestring (getf plan :target))
          :files (nreverse copied))))

(defun lifecycle-publication-files (destination)
  \"Inventario canonico completo senza seguire directory symlink, escluso il catalogo.\"
  (let ((files nil) (destination (lifecycle-directory destination)))
    (labels ((walk (directory)
               (dolist (path (uiop:directory-files directory))
                 (unless (equal path (merge-pathnames \"catalogo.lisp\" destination))
                   (lifecycle-regular-file path)
                   (let ((limit (if (string-equal (or (pathname-type path) \"\") \"gz\")
                                    8388608 1048576)))
                     (when (> (arcdocdb.evidence:file-bytes path) limit)
                       (error \"Artefatto canonico oltre budget: ~A\" path)))
                   (when (string-equal (or (pathname-type path) \"\") \"lisp\")
                     (arcdocdb.evidence:read-evidence path))
                   (push (append (list :relative-path (enough-namestring path destination))
                                 (worker-byte-record path)) files)))
               (dolist (path (uiop:subdirectories directory))
                 (walk (lifecycle-directory path)))))
      (walk destination))
    (sort files #'string< :key (lambda (record) (getf record :relative-path)))))

(defun lifecycle-publication-refresh-manifest
    (base &key (stem \"manifesto-file\") (directory *lifecycle-publication-directory*))
  \"Manifesto nuovo esclusivo; soltanto il catalogo derivato viene aggiornato.\"
  (unless (worker-leaf-p stem) (error \"Stem manifesto non leaf: ~S\" stem))
  (worker-save-data
   (list :schema-version 1 :kind :pool-worker-lifecycle-whole-file-manifest
         :base base :files (lifecycle-publication-files directory)
         :compatibility '(:catalog-component :writer-worker
                          :development-manifest-kind :pool-controller-development-manifest)
         :limits '(:raw-file-hashes :root-catalog-excluded :manifest-not-self-referential))
   (merge-pathnames (format nil \"~A.lisp\" stem) directory))
  (worker-refresh-catalog base :directory directory)
  t)

(defun lifecycle-publication-run (config input-path)
  \"Pianifica tutte le fonti e le prove prima di creare il nuovo namespace canonico.\"
  (let* ((base (getf config :base))
         (snapshot (pool-publication-root (getf config :snapshot)))
         (current (truename (uiop:getcwd)))
         (paths (getf config :paths))
         (destination *lifecycle-publication-directory*)
         (records (getf config :records))
         (record-root (pool-publication-root (or (getf config :record-root) snapshot)))
         (data (append (getf config :evidence)
                       (when (getf config :benchmark-report)
                         (list (list :name \"benchmark\"
                                     :source (getf config :benchmark-report)))))))
    (unless (and (stringp base) (= (length base) 40)
                 (every (lambda (character) (digit-char-p character 16)) base)
                 paths records)
      (error \"Input richiede base SHA40, snapshot, paths e records.\"))
    (when (probe-file destination) (error \"Namespace canonico già presente: ~A\" destination))
    (dolist (entries (list records data (getf config :evidence-directories)))
      (unless (= (length entries)
                 (length (remove-duplicates entries :test #'string=
                                            :key (lambda (entry) (getf entry :name)))))
        (error \"Nomi duplicati nella stessa famiglia di prove.\")))
    (dolist (entry data)
      (unless (worker-leaf-p (getf entry :name)) (error \"Nome dati non leaf: ~S\" entry))
      (pool-publication-evidence-preflight
       (pool-publication-source (getf entry :source) record-root)))
    (let* ((record-plans (mapcar (lambda (record)
                                  (pool-publication-record-plan record record-root destination))
                                records))
           (campaign-plans
             (mapcar (lambda (entry)
                       (lifecycle-evidence-directory-plan entry record-root destination))
                     (getf config :evidence-directories)))
           (qualified-plans
             (worker-plan-source-bundles
              (mapcar (lambda (path) (pool-publication-source path snapshot)) paths)
              \"sources-qualified\" :pool-worker-lifecycle-qualified-sources :version base))
           (final-plans
             (worker-plan-source-bundles
              (mapcar (lambda (path) (pool-publication-source path current))
                      (or (getf config :final-paths) paths))
              \"sources-final\" :pool-worker-lifecycle-final-sources :version base))
           (orchestration-plans
             (worker-plan-source-bundles
              (remove-duplicates
               (append (list #p\"spikes/out/worker-publication-functions.lisp\"
                             #p\"spikes/out/pool-controller/dev-evidence.lisp\"
                             #p\"spikes/out/pool-controller/publish.lisp\"
                             #p\"spikes/out/lifecycle-publication.lisp\"
                             #p\"spikes/out/lifecycle-publication-selftest.lisp\"
                             #p\"tools/evidence-storage.lisp\" #p\"tools/finish-evidence.lisp\"
                             #p\"tools/compact-evidence.lisp\" input-path)
                       (getf config :extra-sources)) :test #'equal)
              \"publication-orchestration\" :pool-worker-lifecycle-publication-sources :version base))
           (development
             (lifecycle-development-plan
              :roots (or (getf config :development-roots)
                         (append *lifecycle-development-roots*
                                 (list (merge-pathnames \"spikes/out/lifecycle-measure/\" snapshot))))
              :required (or (getf config :development-required) *lifecycle-development-required*)
              :extra (getf config :extra-development-sources))))
      (worker-validate-source-plans qualified-plans)
      (worker-validate-source-plans final-plans)
      (worker-validate-source-plans orchestration-plans)
      (ensure-directories-exist (merge-pathnames \"placeholder\" destination))
      (pool-publication-write-plans qualified-plans destination)
      (pool-publication-write-plans final-plans destination)
      (pool-publication-write-plans orchestration-plans destination)
      ;; Riutilizzo byte per byte del writer verificato: il suo manifest generico resta dichiarato.
      (pool-development-write development destination)
      (worker-save-data
       (list :schema-version 1 :kind :pool-worker-lifecycle-process-manifest :base base
             :processes (mapcar #'pool-publication-copy-record record-plans)
             :data (mapcar (lambda (entry)
                             (pool-publication-copy-data entry record-root destination)) data)
             :campaigns (mapcar #'lifecycle-copy-evidence-directory campaign-plans)
             :compatibility '(:catalog-component :writer-worker
                              :development-manifest-kind :pool-controller-development-manifest)
             :limits '(:original-process-report-and-conservation :no-status-promotion
                       :one-directory-per-process :original-gzip-payload-basename
                       :all-recursive-utf8-development-sources :only-fasl-excluded))
       (merge-pathnames \"process-manifest.lisp\" destination))
      (lifecycle-publication-refresh-manifest base :directory destination)
      (format t \"Lifecycle evidence: original bytes verified; no source mutation.~%\")
      t)))

(unless (member :pool-worker-lifecycle-publication-library *features*)
  (let ((args (uiop:command-line-arguments)))
    (unless (= (length args) 1)
      (error \"Uso: sbcl --script spikes/out/lifecycle-publication.lisp input-plist.lisp\"))
    (let* ((path (pathname (first args))) (data (worker-read-raw-data path)))
      (lifecycle-publication-run data path))))
")
  (:PATH #A((41) BASE-CHAR . "spikes/out/pool-chain/frozen/arcdocdb.asd") :BYTES 17997 :SHA256
   "6af6230a08151f71826b8566f052320a005e1d67e92e52e8701c414af554de14" :GIT-BLOB
   "fed18dfea235a56885c4d1b34da6058a4a0854c0" :TEXT
   ";;;; arcdocdb.asd — definizione di sistema ASDF.
;;;;
;;;; Fondazioni dello storage, autorizzate dall'autore il 2026-10-08.

(in-package #:asdf-user)

(defsystem \"arcdocdb\"
  :description \"Database server documentale general-purpose, append-only, in Common Lisp (SBCL).\"
  :author \"Giacomo Picchiarelli\"
  :license \"BSD-2-Clause\"
  :version \"0.0.0\"
  :pathname \"src/\"
  :serial t
  :depends-on (\"sb-posix\")
  :components ((:file \"package\")
               (:module \"foundation\"
                :serial t
                :components ((:file \"package\") (:file \"conditions\")
                             (:file \"binary\") (:file \"crc32c\")
                             (:file \"record\") (:file \"batch\")))
               (:module \"hash\" :serial t
                :components ((:file \"package\") (:file \"arithmetic\") (:file \"blocks\") (:file \"hash64\")))
               (:module \"codec\" :serial t
                :components ((:file \"package\") (:file \"utf8\")
                             (:file \"cbor-package\") (:file \"cbor-header\")
                             (:file \"cbor-float-minimal\") (:file \"cbor-minimal\")
                             (:file \"cbor-space\") (:file \"cbor-scan-input\")
                             (:file \"cbor-scan-stack\") (:file \"cbor-scan-items\")
                             (:file \"cbor-scan\") (:file \"cbor-scan-minimal\")
                             (:file \"cbor-write\") (:file \"cbor-string-write\")
                             (:file \"cbor-simple-write\")
                             (:file \"cbor-float-narrow\") (:file \"cbor-float-write\")
                             (:file \"cbor-array-input\") (:file \"cbor-array-write\")
                             (:file \"cbor-map-input\") (:file \"cbor-map-write\")
                             (:file \"cbor-tag-input\") (:file \"cbor-tag-write\")))
               (:module \"csn\" :serial t
                :components ((:file \"package\") (:file \"registry\")))
               (:module \"cache\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"build\") (:file \"core\")
                             (:file \"read\") (:file \"clock\") (:file \"write\")))
               (:module \"execution\" :serial t
                :components ((:file \"package\") (:file \"queue\") (:file \"writer\")
                             (:file \"handoff\") (:file \"ready-types\") (:file \"ready\")
                             (:file \"ready-recycle\")
                             (:file \"worker-types\") (:file \"worker-boundary\") (:file \"worker-claim\") (:file \"worker-run\")))
               (:module \"scheduler\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"build\")
                             (:file \"read\") (:file \"policy\") (:file \"update\")
                             (:file \"lifecycle-types\") (:file \"lifecycle-read\")
                             (:file \"lifecycle-build\") (:file \"lifecycle-worker\")
                             (:file \"lifecycle-update\") (:file \"pool-claim\")))
               (:module \"storage\"
                :serial t
                :components ((:file \"package\") (:file \"formats\") (:file \"segment-header\")
                             (:file \"log-header\") (:file \"compaction-scan\")
                             (:file \"control-payload\") (:file \"payload-record\")
                             (:file \"payload-write\")))
               (:module \"io\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"identity-types\")
                             (:file \"native\") (:file \"native-namespace\") (:file \"lifecycle\") (:file \"identity\")
                             (:file \"rename\") (:file \"namespace\") (:file \"transfer\") (:file \"flush\")))
               (:module \"wal\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"builder\")
                             (:file \"group\") (:file \"executor\") (:file \"csn\")))
               (:module \"series\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"ownership\")
                             (:file \"events\") (:file \"io-events\") (:file \"publication\")
                             (:file \"query\") (:file \"retirement\")
                             (:file \"worker-package\") (:file \"worker-types\")
                             (:file \"worker-boundary\") (:file \"worker-run\")
                             (:file \"routing-types\") (:file \"routing-build\") (:file \"routing-select\")))
               (:module \"dispatch\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"build\") (:file \"claim\")
                             (:file \"recycle\") (:file \"begin\") (:file \"step\")))
               (:module \"index\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"core\")
                             (:file \"validation\") (:file \"read\") (:file \"write\") (:file \"relocate\")
                             (:file \"primary-package\") (:file \"primary-types\") (:file \"primary-core\")
                             (:file \"primary-build\") (:file \"primary-probe\") (:file \"primary-read\")
                             (:file \"primary-write\") (:file \"primary-relocate\")
                             (:file \"primary-arena\") (:file \"primary-directory\")
                             (:file \"rebuild-scan\") (:file \"rebuild-budget\")
                             (:file \"rebuild-copy\") (:file \"rebuild\")
                             (:file \"hash-seed\") (:file \"hash-digests\")))
               (:module \"mvcc\" :serial t
                :components ((:file \"package\") (:file \"types\")
                             (:file \"snapshots-types\") (:file \"snapshots-core\") (:file \"snapshots-csn\")
                             (:file \"snapshots-register\") (:file \"snapshots-lifecycle\")
                             (:file \"snapshots-read\")))
               (:module \"epochs\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"core\")
                             (:file \"read\") (:file \"retire\") (:file \"reclaim\")))
               (:module \"read\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"core\")
                             (:file \"task\")))
               (:module \"get\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"build\")
                             (:file \"lifecycle\") (:file \"lookup\") (:file \"target\") (:file \"segment\")))
               (:module \"recovery\"
                :serial t
                :components ((:file \"package\") (:file \"scan\")
                             (:file \"decisions-package\") (:file \"decisions-types\")
                             (:file \"decisions-sort\") (:file \"decisions-radix\") (:file \"decisions-build\")
                             (:file \"decisions-query\")
                             (:file \"manifest-package\") (:file \"manifest-types\")
                             (:file \"manifest-decode\") (:file \"manifest-fold\")
                             (:file \"manifest-build\") (:file \"manifest-query\") (:file \"manifest-transition\")
                             (:file \"inventory-types\") (:file \"inventory-build\")
                             (:file \"inventory-query\")))
               (:module \"get-resolver\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"scan\") (:file \"sort\")
                             (:file \"rows\") (:file \"build\") (:file \"read\")
                             (:file \"active-types\") (:file \"active-directory\")
                             (:file \"active-scan\") (:file \"active-build\") (:file \"active-init\")
                             (:file \"active-preflight\") (:file \"active-read\")))
               (:module \"get-directory\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"build\") (:file \"read\")
                             (:file \"sources-types\") (:file \"sources-read\")))
               (:module \"active\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"preflight\")
                             (:file \"prepare\") (:file \"source\")))
               (:module \"control\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"dependency\")
                             (:file \"build\") (:file \"preflight\") (:file \"transfer\") (:file \"prepare\")
                             (:file \"publication\") (:file \"publication-read\")
                             (:file \"recovery-types\") (:file \"recovery-read\") (:file \"recovery-publication\")))
               (:module \"recovery-active\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"read\") (:file \"frames\")
                             (:file \"resolve\") (:file \"build\") (:file \"query\")
                             (:file \"closure\") (:file \"publication\")))
               (:module \"recovery-archive\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"read\")
                             (:file \"build\") (:file \"query\") (:file \"active\"))))
  :in-order-to ((test-op (test-op \"arcdocdb/tests\"))))

(defsystem \"arcdocdb/tests\"
  :description \"Test di ArcDocDB.\"
  :author \"Giacomo Picchiarelli\"
  :license \"BSD-2-Clause\"
  :depends-on (\"arcdocdb\")
  :pathname \"tests/\"
  :serial t
  :components ((:file \"smoke\")
               (:module \"hash\" :serial t
                :components ((:file \"support\") (:file \"hash64\") (:file \"guards\") (:file \"threads\")))
               (:module \"foundation\"
                :serial t
                :components ((:file \"support\") (:file \"binary\")
                             (:file \"record\") (:file \"batch\")))
               (:module \"codec\" :serial t
                :components ((:file \"support\") (:file \"utf8\") (:file \"threads\")
                             (:file \"cbor-support\") (:file \"cbor-header\") (:file \"cbor-threads\")
                             (:file \"cbor-minimal-support\") (:file \"cbor-minimal\")
                             (:file \"cbor-minimal-threads\") (:file \"cbor-minimal-edges\")
                             (:file \"cbor-structure-support\") (:file \"cbor-structure\")
                             (:file \"cbor-structure-threads\")
                             (:file \"cbor-minimal-scan-support\") (:file \"cbor-minimal-scan\")
                             (:file \"cbor-minimal-scan-threads\")
                             (:file \"cbor-write-support\") (:file \"cbor-write\")
                             (:file \"cbor-write-threads\") (:file \"cbor-write-roundtrip\")
                             (:file \"cbor-string-write-support\") (:file \"cbor-string-write\")
                             (:file \"cbor-string-write-threads\")
                             (:file \"cbor-simple-write-support\") (:file \"cbor-simple-write\")
                             (:file \"cbor-simple-write-threads\")
                             (:file \"cbor-float-write-support\") (:file \"cbor-float-write\")
                             (:file \"cbor-float-write-threads\")
                             (:file \"cbor-array-write-support\") (:file \"cbor-array-write\")
                             (:file \"cbor-array-write-threads\")
                             (:file \"cbor-map-write-support\") (:file \"cbor-map-write\")
                             (:file \"cbor-map-write-threads\")
                             (:file \"cbor-tag-write-support\") (:file \"cbor-tag-write\")
                             (:file \"cbor-tag-write-threads\")))
               (:module \"csn\" :serial t
                :components ((:file \"support\") (:file \"registry\") (:file \"threads\")))
               (:module \"mvcc\" :serial t
                :components ((:file \"support\") (:file \"lifecycle\") (:file \"capture\")))
               (:module \"epochs\" :serial t
                :components ((:file \"support\") (:file \"lifecycle\") (:file \"threads\")))
               (:module \"read\" :serial t
                :components ((:file \"support\") (:file \"lifecycle\") (:file \"threads\")))
               (:module \"get\" :serial t
                :components ((:file \"support\") (:file \"lifecycle\") (:file \"segment\")))
               (:module \"get-performance\" :serial t
                :components ((:file \"support\") (:file \"paths\") (:file \"guards\") (:file \"threads\")))
               (:module \"get-directory\" :serial t
                :components ((:file \"support\") (:file \"construction\") (:file \"read\") (:file \"threads\")
                             (:file \"series-support\") (:file \"series-read\")
                             (:file \"lifetime-support\") (:file \"lifetime\")))
               (:module \"get-resolver\" :serial t
                :components ((:file \"support\") (:file \"sort\") (:file \"construction\") (:file \"read\")))
               (:module \"get-active\" :serial t
                :components ((:file \"support\") (:file \"construction\") (:file \"preflight\")
                             (:file \"directory\") (:file \"read\")))
               (:module \"execution\" :serial t
                :components ((:file \"support\") (:file \"queue\") (:file \"threads\")
                             (:file \"handoff\") (:file \"ready\") (:file \"ready-recycle\") (:file \"worker\")))
               (:module \"scheduler\" :serial t
                :components ((:file \"support\") (:file \"controller\") (:file \"lifecycle\")
                             (:file \"pool-claim\") (:file \"dispatch\") (:file \"pool-recycle\")
                             (:file \"pool-begin\") (:file \"pool-step\")
                             (:file \"pool-chain-support\") (:file \"pool-chain\")))
               (:module \"storage\"
                :serial t
                :components ((:file \"support\") (:file \"segment-header\") (:file \"log-header\")
                             (:file \"compaction-scan\")
                             (:file \"control-payload\")))
               (:module \"io\" :serial t
                :components ((:file \"support\") (:file \"transfer\") (:file \"native\")
                             (:file \"rename\") (:file \"rename-native\") (:file \"flush-failure\")
                             (:file \"transfer-failure\")))
               (:module \"control\" :serial t
                :components ((:file \"support\") (:file \"publication\") (:file \"native\")
                             (:file \"recovery-read\") (:file \"recovery-publication\") (:file \"recovery-guards\")))
               (:module \"recovery\"
                :serial t
                :components ((:file \"support\") (:file \"scan\") (:file \"corruption\")
                             (:file \"decisions-support\") (:file \"decisions\")
                             (:file \"decisions-audit\") (:file \"decisions-radix\") (:file \"manifest-support\")
                             (:file \"manifest\") (:file \"manifest-audit\") (:file \"manifest-transition\")
                             (:file \"inventory-support\") (:file \"inventory\")))
               (:module \"recovery-active\" :serial t
                :components ((:file \"support\") (:file \"read\") (:file \"semantics\") (:file \"publication\")))
               (:module \"wal\" :serial t
                :components ((:file \"support\") (:file \"builder\") (:file \"group\") (:file \"fault\")
                             (:file \"native\") (:file \"csn\") (:file \"csn-threads\")))
               (:module \"series\" :serial t
                :components ((:file \"support\") (:file \"controller\") (:file \"boundaries\") (:file \"threads\")
                             (:file \"worker-bridge\") (:file \"worker-routing\")))
               (:module \"index\" :serial t
                :components ((:file \"slot-support\") (:file \"slots\") (:file \"slot-threads\")
                             (:file \"primary-support\") (:file \"primary\") (:file \"primary-threads\")
                             (:file \"rebuild\") (:file \"hash-digests\"))))
  :perform (test-op (o c)
             (uiop:symbol-call '#:arcdocdb.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.hash64.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.foundation.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.utf8.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.minimal.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.structure.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.minimal.scan.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.string.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.simple.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.float.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.array.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.map.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.tag.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.csn.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.mvcc.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.epochs.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.read.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.performance.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.directory.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.resolver.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.active.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.execution.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.scheduler.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.storage.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.io.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.control.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.recovery.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.recovery.active.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.wal.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.series.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.index.slots.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.index.primary.tests '#:run)))
")
  (:PATH
   #A((68) BASE-CHAR . "spikes/out/pool-chain/frozen/tests/scheduler/pool-chain-support.lisp")
   :BYTES 3573 :SHA256 "3a1cfd174c8ca8ee7bb713b026e644e45ab444aa762f0e28d95d6e502b7fbfaf" :GIT-BLOB
   "a1ea8258495b9a717e1e0ef164133f6b7140f8a5" :TEXT
   ";;;; Catena pubblica su thread reali; nessuna FI o stato globale nuovo.
;;;; OWNER: context/port/table/link sul worker; coordinator sul chiamante del test.
;;;; SHARED: ready per tratto, registro immutabile, canali C4 con timeout 15s.
(in-package #:arcdocdb.scheduler.tests)

(defun pool-chain-local (ready registry coordinator &optional (start 0))
  \"Costruisce sul vero owner le risorse locali di un worker della catena.\"
  (let* ((context (arcdocdb.execution:crea-contesto-worker-writer ready :start start))
         (port (arcdocdb.scheduler:crea-porta-worker-pool context :coordinator coordinator))
         (table (arcdocdb.execution.series:crea-tabella-worker-serie context registry)))
    (values context port
            (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port table))))

(defun pool-chain-take (dispatcher context writer origin detail)
  \"Oracolo pubblico: un CLAIMED del writer atteso, con link ancora IDLE.\"
  (multiple-value-bind (link status actual-origin actual-detail action)
      (arcdocdb.scheduler.dispatch:passo-dispatcher-pool dispatcher)
    (is (typep link 'arcdocdb.execution.series:collegamento-worker-serie))
    (is (eq :claimed status)) (is (eq origin actual-origin))
    (is (= detail actual-detail))
    (is (eq (if (eq origin :claim) :unchanged nil) action))
    (is (eq :claimed (arcdocdb.execution:stato-worker-writer context)))
    (is (eq writer (arcdocdb.execution:writer-worker-writer context)))
    (is (eq :idle (arcdocdb.execution.series:stato-worker-serie link)))
    link))

(defun pool-chain-begin (dispatcher link)
  (multiple-value-bind (actual token phase reason)
      (arcdocdb.scheduler.dispatch:inizia-obbligo-pool dispatcher)
    (is (eq actual link)) (is (plusp token)) (is (eq :active phase))
    (is (null reason))
    (is (plusp (arcdocdb.execution.series:lease-worker-serie link token)))
    token))

(defun pool-chain-ack-end (context link token batch action)
  \"Debito verificato e confermato esplicitamente, poi rilascio di entrambe le lease.\"
  (is (eq :batch (arcdocdb.execution:stato-worker-writer context)))
  (is (null (arcdocdb.execution.series:conferma-worker-serie link token batch)))
  (is (eq :running (arcdocdb.execution:stato-worker-writer context)))
  (is (eq action (arcdocdb.execution.series:termina-worker-serie link token)))
  (is (eq :idle (arcdocdb.execution.series:stato-worker-serie link)))
  (is (null (arcdocdb.execution.series:errore-worker-serie link)))
  (is (eq (if (eq action :idle) :idle :reschedule)
          (arcdocdb.execution:stato-worker-writer context))))

(defun pool-chain-finish (dispatcher context link item action)
  (let* ((token (pool-chain-begin dispatcher link))
         (batch (pool-claim-bridge-pop link token item)))
    (pool-chain-ack-end context link token batch action)))

(defun pool-chain-published (dispatcher count)
  (pool-step-check dispatcher nil :published :recycle count nil))

(defun pool-chain-empty (dispatcher context cursor)
  (pool-step-check dispatcher nil :empty :claim cursor :unchanged)
  (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))
  (is (null (arcdocdb.execution:writer-worker-writer context)))
  (is (null (arcdocdb.execution:errore-worker-writer context))))

(defun pool-chain-writer (count ordinal)
  (let ((writer (arcdocdb.execution:crea-writer-programmabile
                 :capacity 64 :quantum 1 :routing-index ordinal)))
    (dotimes (index count)
      (arcdocdb.execution.tests::handoff-check-enqueue
       writer index (1+ index) (if (zerop index) :schedule :queued)))
    writer))
")
  (:PATH #A((60) BASE-CHAR . "spikes/out/pool-chain/frozen/tests/scheduler/pool-chain.lisp") :BYTES
   8836 :SHA256 "81da71e08d0e5196b01fb51666b9c123dc3c1d1b206f02076ab5a1c74d6f0c85" :GIT-BLOB
   "86675c17ea47eff262cb03cdb41e50bcdb82b78e" :TEXT
   ";;;; Due worker con ready/routing condivisi: lease distinte e migrazione dopo ritiro.
;;;; Le attese artificiali con lease/debito sono esclusivamente controlli C4.
(in-package #:arcdocdb.scheduler.tests)

(defun pool-chain-independent (held-phase)
  (multiple-value-bind (left left-file) (pool-claim-series 91)
    (multiple-value-bind (right right-file) (pool-claim-series 92)
      (let* ((ready (arcdocdb.execution:crea-lista-writer-pronti :shards 1 :capacity 2))
             (a (pool-chain-writer 2 0)) (b (pool-chain-writer 32 1))
             (registry (arcdocdb.execution.series:crea-registro-worker-serie
                        (vector a b) (vector left right)))
             (coordinator sb-thread:*current-thread*)
             (held (sb-thread:make-semaphore)) (release (sb-thread:make-semaphore))
             (threads nil) (fast nil))
        (unwind-protect
             (progn
               (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 a)))
               (is (= 2 (arcdocdb.execution:pubblica-writer-pronto ready 0 b)))
               (push
                (pool-thread
                 \"pool-chain-held\"
                 (lambda ()
                   (multiple-value-bind (context port dispatcher)
                       (pool-chain-local ready registry coordinator)
                     (declare (ignore port))
                     (let* ((link (pool-chain-take dispatcher context a :claim 0))
                            (token (pool-chain-begin dispatcher link))
                            (batch (when (eq held-phase :batch)
                                     (pool-claim-bridge-pop link token 0))))
                       (is (eq held-phase (arcdocdb.execution:stato-worker-writer context)))
                       (sb-thread:signal-semaphore held)
                       (pool-wait release)
                       ;; B è già joined: nessuna release di A poteva abilitarlo.
                       (unless batch (setf batch (pool-claim-bridge-pop link token 0)))
                       (pool-chain-ack-end context link token batch :schedule))
                     (pool-chain-published dispatcher 1)
                     (pool-chain-finish dispatcher context
                                        (pool-chain-take dispatcher context a :claim 0) 1 :idle)
                     (pool-chain-empty dispatcher context 0)
                     :ok))) threads)
               (pool-wait held)
               (setf fast
                     (pool-thread
                      \"pool-chain-progress\"
                      (lambda ()
                        (multiple-value-bind (context port dispatcher)
                            (pool-chain-local ready registry coordinator)
                          (declare (ignore port))
                          (dotimes (index 32)
                            (pool-chain-finish
                             dispatcher context (pool-chain-take dispatcher context b :claim 0)
                             index (if (= index 31) :idle :schedule))
                            (unless (= index 31) (pool-chain-published dispatcher 1)))
                          (pool-chain-empty dispatcher context 0)
                          :ok))))
               (push fast threads)
               (pool-join fast)
               (sb-thread:signal-semaphore release)
               (pool-join (second threads))
               (format t \"  pool-chain: A ~S, B 32 quantum conclusi prima della release A.~%\"
                       held-phase))
          (sb-thread:signal-semaphore release)
          (pool-stop-threads threads)
          (arcdocdb.io:chiudi right-file) (arcdocdb.io:chiudi left-file))))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-chain-other-series-completes-before-held-lease-and-batch-release
  (dolist (phase '(:running :batch)) (pool-chain-independent phase)))

(defun pool-chain-retiring-worker (ready routing writers coordinator ports started staged resume home full)
  (multiple-value-bind (context port dispatcher)
      (pool-chain-local ready routing coordinator home)
    (setf (svref ports 1) port)
    (sb-thread:signal-semaphore started)
    (pool-wait resume)
    (let ((link (pool-chain-take dispatcher context (svref writers 0)
                                 :claim (mod (1+ home) 3))))
      (pool-chain-finish dispatcher context link :a1 :schedule))
    (sb-thread:signal-semaphore staged)
    (pool-wait resume)
    (if full
        (pool-chain-finish
         dispatcher context
         (pool-chain-take dispatcher context (svref writers 1) :recycle 1) :b1 :idle)
        (pool-chain-published dispatcher 2))
    (pool-step-check dispatcher nil :inactive :claim (mod (1+ home) 3) :retired)
    (pool-step-check dispatcher nil :inactive :claim (mod (1+ home) 3) :unchanged)
    (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))
    (is (null (arcdocdb.execution:errore-worker-writer context)))
    :ok))

(defun pool-chain-retirement (capacity home)
  (multiple-value-bind (left left-file) (pool-claim-series 93)
    (multiple-value-bind (right right-file) (pool-claim-series 94)
      (let* ((ready (arcdocdb.execution:crea-lista-writer-pronti :shards 3 :capacity capacity))
             (a (pool-claim-writer '(:a1 :a2) 0)) (b (pool-claim-writer '(:b1) 1))
             (routing (arcdocdb.execution.series:crea-registro-worker-serie
                       (vector a b) (vector left right)))
             (coordinator sb-thread:*current-thread*) (ports (vector nil nil))
             (started (sb-thread:make-semaphore)) (staged (sb-thread:make-semaphore))
             (resume (sb-thread:make-semaphore)) (take-over (sb-thread:make-semaphore))
             (threads nil) (retiring nil) (remaining nil))
        (unwind-protect
             (progn
               (setf remaining
                     (pool-thread
                      \"pool-chain-take-over\"
                      (lambda ()
                        (multiple-value-bind (context port dispatcher)
                            (pool-chain-local ready routing coordinator home)
                          (setf (svref ports 0) port)
                          (sb-thread:signal-semaphore started)
                          (pool-wait take-over)
                          (when (= capacity 2)
                            (pool-chain-finish
                             dispatcher context
                             (pool-chain-take dispatcher context b :claim (mod (1+ home) 3))
                             :b1 :idle))
                          (pool-chain-finish
                           dispatcher context
                           (pool-chain-take dispatcher context a :claim (mod (1+ home) 3))
                           :a2 :idle)
                          (pool-chain-empty dispatcher context (mod (+ home 2) 3))
                          :ok))))
               (push remaining threads)
               (setf retiring
                     (pool-thread
                      \"pool-chain-retire\"
                      (lambda () (pool-chain-retiring-worker
                                  ready routing (vector a b) coordinator ports started staged resume home
                                  (= capacity 1)))))
               (push retiring threads)
               (pool-wait started 2)
               (let* ((controller (crea-controllore-pool 1 :initial 2 :dwell 500))
                      (registry (arcdocdb.scheduler:crea-registro-pool controller ports)))
                 (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready home a)))
                 (sb-thread:signal-semaphore resume)
                 (pool-wait staged)
                 (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready home b)))
                 (lifecycle-start-retirement controller registry)
                 (sb-thread:signal-semaphore resume)
                 (pool-join retiring)
                 (is (equal '(1 1 nil) (lifecycle-registry-state registry)))
                 (sb-thread:signal-semaphore take-over)
                 (pool-join remaining)
                 (is (equal '(1 1 nil) (lifecycle-registry-state registry)))
                 (format t \"  pool-chain: capacity ~D, home ~D, ~A, ritiro e handoff conclusi.~%\"
                         capacity home (if (= capacity 1) :full :room))))
          (sb-thread:signal-semaphore resume 2)
          (sb-thread:signal-semaphore take-over)
          (pool-stop-threads threads)
          (arcdocdb.io:chiudi right-file) (arcdocdb.io:chiudi left-file))))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-THR-001-pool-chain-full-room-retirement-and-cross-worker-ready-handoff
  (dolist (capacity '(1 2))
    (dolist (home '(0 2)) (pool-chain-retirement capacity home))))
")
  (:PATH
   #A((71) BASE-CHAR . "spikes/out/pool-chain/frozen/docs/implementazione/pool-catena-metodo.md")
   :BYTES 2812 :SHA256 "5d6677962c2dc40bcfb7425c08e9b5ed7f509d16b9722530cf74110f39e8cc97" :GIT-BLOB
   "c6affaba71aedd2f1e1ac900f01755bcfab90ce6" :TEXT
   "# Verifica della catena pool, dispatcher e Serie

Metodo C4 preregistrato il 2026-10-15 sulla base
`a34cede6fbc9215908d50aa85311d5d703660040`, prima di eseguire le nuove prove.
REQ-THR-001, REQ-CON-001/002/004/005 e REQ-AFF-008; ADR-0031/0034/0045.
I sorgenti di prodotto restano invariati. Si verificano insieme il
[passo dispatcher](pool-step.md), l'[avvio](pool-begin.md) e il
[bridge Serie](worker-serie.md), usando API pubbliche e thread reali.

## Scenari e oracoli

1. Due worker con contesti, porte, tabelle e link creati sui rispettivi thread,
   registro di routing immutabile e ready condivisa. Il primo mantiene la lease
   della Serie A; il secondo completa **32 quantum** della Serie B prima che il
   coordinatore liberi A. Ripetere con A in ACTIVE/RUNNING e con debito BATCH.
   L'oracolo verifica payload FIFO, token, count, stato e tutti i cinque valori
   del dispatcher. B termina ed è joined prima della release di A.
2. Ritiro del secondo worker mentre deve ricircolare A dopo il primo quantum.
   Il coordinatore accoda B e richiede il ritiro tramite il registro pubblico.
   Ready a tre partizioni, home 0 e 2, capacità 1 e 2: quattro scenari.
   Full scambia A con B, completa B e applica il ritiro soltanto al successivo
   ingresso IDLE. Room pubblica A, termina il passo e ritira senza nuova presa.
   Il primo worker prende e completa il lavoro rimasto; ogni payload atteso
   compare una volta sola, in ordine. Il registro converge a un worker attivo.

Le barriere C4 fissano l'ordine degli eventi, non sostituiscono i trasferimenti
del prodotto. Nessuna FI sui valori, sulle funzioni o sulle parole lifecycle.
Le semafore e i join hanno timeout di 15 secondi; i cicli hanno cardinalità
nota (2 modalità, 32 quantum, 4 scenari). Gli errori dei thread vengono
propagati al test. Nel cleanup si liberano le barriere, si terminano e si
uniscono i thread della fixture prima di chiudere i backend in memoria.

## Verifica e limiti

Compilazione stretta senza warning/style-warning, suite scheduler e suite
completa tramite `make check`; registri originali conservati, anche in caso
di fallimento. Rilettura C4 della fixture e dei suoi oracoli prima della
qualifica finale. Nessun nuovo codice caldo: le misure di allocazione e
copertura precedenti non vengono reinterpretate come misure di queste prove.

Le pause artificiali con lease/debito appartengono solo alla fixture di test:
non sono un compito di prodotto che attende. Il risultato prova la possibilità
di avanzare su due Serie distinte in questi ordini sincronizzati, non lo speedup
su due core, fairness generale, assenza universale di race o memoria debole.
Payload simbolici/interi verificati e confermati dal caller: nessuna applicazione
di PUT, commit durevole, I/O reale, park/wake o loop server viene qualificata.
")
  (:PATH #A((36) BASE-CHAR . "/tmp/arcdocdb-pool-chain-freeze.json") :BYTES 423 :SHA256
   "3015a4e9aa691832c498f29311a9646a673918f9523f56935210b25d60dcbb2d" :GIT-BLOB
   "be2dffd663d0af9dd1307c8c697efbff1308d560" :TEXT "{
  \"arcdocdb.asd\": \"6af6230a08151f71826b8566f052320a005e1d67e92e52e8701c414af554de14\",
  \"tests/scheduler/pool-chain-support.lisp\": \"3a1cfd174c8ca8ee7bb713b026e644e45ab444aa762f0e28d95d6e502b7fbfaf\",
  \"tests/scheduler/pool-chain.lisp\": \"81da71e08d0e5196b01fb51666b9c123dc3c1d1b206f02076ab5a1c74d6f0c85\",
  \"docs/implementazione/pool-catena-metodo.md\": \"5d6677962c2dc40bcfb7425c08e9b5ed7f509d16b9722530cf74110f39e8cc97\"
}
")))
