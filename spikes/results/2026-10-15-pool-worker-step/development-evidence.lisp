(:SCHEMA-VERSION 1 :KIND :POOL-WORKER-LIFECYCLE-DEVELOPMENT :VERSION "2026-10-13" :PART 1 :PARTS 1
 :SOURCES
 ((:PATH
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-dev/compile-product-attempt-01.log")
   :BYTES 34 :SHA256 "eb822060ac360d7c70b61a584f855027df9eeb9db5711211cf65f6e89248b6f5" :GIT-BLOB
   "271966228e930825d0e6944d0151bd6a9ae217b4" :TEXT "Product compilation: strict PASS.
")
  (:PATH
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-dev/compile-product.lisp")
   :BYTES 379 :SHA256 "b1150d9e9cc147b15dbd1ecb28adee4c2986a6dae41de4778d47504901963e3d" :GIT-BLOB
   "3b720e06e49be956c30b0e0009f426bafcabfe66" :TEXT "(require :asdf)
(setf asdf:*compile-file-failure-behaviour* :error asdf:*compile-file-warnings-behaviour* :error)
(handler-bind ((warning (lambda (c) (unless (typep c 'sb-kernel:redefinition-warning) (error \"~A\" c)))))
  (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
  (asdf:load-system \"arcdocdb\" :force t))
(format t \"~&Product compilation: strict PASS.~%\")
")
  (:PATH
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-dev/count-full-final.log")
   :BYTES 303 :SHA256 "759546c56066a008ceb4c0d0dcb8885955d5f86870e663dd21e215eaaf9ada41" :GIT-BLOB
   "166c33044ebfb4b4a9400b245b0b596f5807de9d" :TEXT "markers=1550 product-named=1544 other=6
ok    package ARCDOCDB presente
ok    ARCDOCDB:*VERSION* è una stringa
ok    bad.lisp: COD-02 COD-03 COD-12 COD-20 COD-22 COD-34 COD-43 COD-50
ok    good.lisp: nessuna violazione
ok    keyword-barrier.lisp: nessuna violazione
ok    qualified-reader.lisp: COD-34
")
  (:PATH
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-dev/count-full.lisp")
   :BYTES 584 :SHA256 "993c211e953819a767544e9a7a3ad4ab039862e1f58427b9fa65ca64b633ea5f" :GIT-BLOB
   "39f7a298957df812969796d011fa9d6ded0dd640" :TEXT "(require :asdf)
(load \"tools/evidence-storage.lisp\")
(let* ((report (arcdocdb.evidence:read-evidence (first (uiop:command-line-arguments))))
       (lines (uiop:split-string (getf report :stdout) :separator '(#\\Newline)))
       (marks (remove-if-not (lambda (s) (uiop:string-prefix-p \"ok    \" s)) lines))
       (product (count-if (lambda (s) (uiop:string-prefix-p \"ok    TEST-\" s)) marks)))
  (format t \"~&markers=~D product-named=~D other=~D~%\" (length marks) product (- (length marks) product))
  (dolist (s marks) (unless (uiop:string-prefix-p \"ok    TEST-\" s) (write-line s))))
")
  (:PATH
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-dev/lint-trace-attempt-01.log")
   :BYTES 156 :SHA256 "1914f609ef411305fbf840d5c5689c31dafee4ab23fd2ec7b62ac166e8aba1cb" :GIT-BLOB
   "958230fa006dccaf2df52b386eb777381efa3c88" :TEXT "sbcl --script tools/lint.lisp src
225 file, 0 violazioni
sbcl --script tools/check-trace.lisp
121 requisiti, 65 invarianti, 13 scenari FI, 52 ADR: 0 errori
")
  (:PATH
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-dev/product-source-attempt-01/arcdocdb.asd")
   :BYTES 17450 :SHA256 "35df1308676510bde78858c31c756b3f976f8ee0aeb17d8e520d51f7f8506fd0"
   :GIT-BLOB "cd8ff016298d3da2958455c06a9fcc17fa2bce3d" :TEXT
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
                             (:file \"closure\") (:file \"publication\"))))
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
                             (:file \"pool-begin\") (:file \"pool-step\")))
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
                             (:file \"recovery-read\") (:file \"recovery-publication\")))
               (:module \"recovery\"
                :serial t
                :components ((:file \"support\") (:file \"scan\") (:file \"corruption\")
                             (:file \"decisions-support\") (:file \"decisions\")
                             (:file \"decisions-audit\") (:file \"decisions-radix\") (:file \"manifest-support\")
                             (:file \"manifest\") (:file \"manifest-audit\") (:file \"manifest-transition\")
                             (:file \"inventory-support\") (:file \"inventory\")))
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
             (uiop:symbol-call '#:arcdocdb.wal.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.series.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.index.slots.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.index.primary.tests '#:run)))
")
  (:PATH
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-dev/product-source-attempt-01/src/dispatch/begin.lisp")
   :BYTES 1658 :SHA256 "4ae4bf8f6b7afe53af099a4b37ad75d253c05077f0cc7fbe39f4f1cab9f89a8d" :GIT-BLOB
   "1f54e226a0b7d5c796ef09b6336866e1a74b78b1" :TEXT
   ";;;; Avvio esplicito di un obbligo gia acquisito, senza consultare il pool.
;;; OWNER: dispatcher, contesto e link locali al medesimo thread, non rientrante.
;;; SHARED: routing immutabile e lease della sola Serie per tratto (ADR-0045 §8).
(in-package #:arcdocdb.scheduler.dispatch)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (dispatcher-writer-pool)
                         (values arcdocdb.execution.series:collegamento-worker-serie index
                                 (member :active :closing)
                                 (member nil :serie-busy :serie-lease-generation) &optional))
                inizia-obbligo-pool))
(defun inizia-obbligo-pool (dispatcher)
  \"Pre: owner corrente, worker CLAIMED e link associato IDLE, nessuna rientranza.
Post: link corrente e token/fase/ragione originali di un solo begin del bridge.
Binding prima del routing; writer busy conserva CLAIMED/link IDLE senza token;
Serie busy/esaurita restituisce CLOSING/token da chiudere esplicitamente.
Nessun gate, ACK, claim, ricircolo, pop, retry o cleanup; errori C1 propagati
con capacita e causa conservate dai confini originali, senza fault marking C3.\"
  (let ((port (dispatcher-writer-pool-port dispatcher))
        (table (dispatcher-writer-pool-table dispatcher)))
    (%check-dispatcher-binding port table)
    (let ((link (arcdocdb.execution.series:collega-writer-worker-serie table)))
      (multiple-value-bind (token state reason)
          (arcdocdb.execution.series:inizia-worker-serie link)
        (values link token state reason)))))
")
  (:PATH
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-dev/product-source-attempt-01/src/dispatch/build.lisp")
   :BYTES 1176 :SHA256 "c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5" :GIT-BLOB
   "d1f2397592a8ba9c3af21394f191017e9fd2219c" :TEXT
   ";;;; Costruzione separata dal percorso caldo, prima di qualsiasi obbligo.
;;; OWNER: factory sul thread che possiede porta e contesto, senza reentrancy.
;;; SHARED: solo riferimenti immutabili, nessuna pubblicazione o lettura di comandi.
(in-package #:arcdocdb.scheduler.dispatch)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (t t) dispatcher-writer-pool) crea-dispatcher-writer-pool))
(defun crea-dispatcher-writer-pool (port table)
  \"Pre: porta e tabella preallocate, stesso contesto libero, owner corrente.
Post: dispatcher immutabile senza acquisire lavoro o applicare comandi.
INVALID-ARGUMENT tipo/owner/binding; RESOURCE-EXHAUSTED fase non-IDLE;
barriera C1 read-only sull'IDLE completo, nessun nuovo fault marking C3.\"
  (%check-dispatcher-binding port table)
  (let ((context (arcdocdb.scheduler::porta-worker-pool-context port)))
    (unless (eq (arcdocdb.execution:stato-worker-writer context) :idle)
      (error 'resource-exhausted :reason :worker-state))
    (arcdocdb.execution::%richiedi-worker context :idle))
  (%make-dispatcher-writer-pool port table))
")
  (:PATH
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-dev/product-source-attempt-01/src/dispatch/claim.lisp")
   :BYTES 2713 :SHA256 "224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682" :GIT-BLOB
   "f7717c94b765165eae4144042308e3639644ed5e" :TEXT
   ";;;; Nuova presa governata; gli obblighi esistenti hanno un ingresso indipendente.
;;; OWNER: dispatcher, contesto e collegamenti locali al medesimo worker.
;;; SHARED: solo API pool/ready/routing esistenti per tratto (ADR-0045 §8).
(in-package #:arcdocdb.scheduler.dispatch)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (dispatcher-writer-pool)
                         (values (or null arcdocdb.execution.series:collegamento-worker-serie)
                                 (member :claimed :empty :busy :inactive) index
                                 (member :unchanged :activated :retired :busy :faulted) &optional))
                prendi-collegamento-pool))
(defun prendi-collegamento-pool (dispatcher)
  \"Pre: owner corrente, worker IDLE libero. Post: link preallocato solo dopo CLAIMED,
oppure NIL/esito/cursore/azione originali del gate. Nessun begin, lease o pop.
Binding rifiutato prima del gate; errori delegati mantengono confini e obblighi.
Un fault di routing conserva il claim e l'ACK già riuscito, senza rollback.\"
  (let ((port (dispatcher-writer-pool-port dispatcher))
        (table (dispatcher-writer-pool-table dispatcher)))
    (%check-dispatcher-binding port table)
    (multiple-value-bind (writer status cursor action)
        (arcdocdb.scheduler:prendi-writer-pool port)
      (case status
        (:claimed
         (unless writer (error 'invariant-violation :reason :pool-dispatcher-state))
         (values (arcdocdb.execution.series:collega-writer-worker-serie table)
                 status cursor action))
        ((:empty :busy :inactive)
         (when writer (error 'invariant-violation :reason :pool-dispatcher-state))
         (values nil status cursor action))
        (otherwise (error 'invariant-violation :reason :pool-dispatcher-state))))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (dispatcher-writer-pool) arcdocdb.execution.series:collegamento-worker-serie)
                collega-obbligo-pool))
(defun collega-obbligo-pool (dispatcher)
  \"Pre: owner corrente, CLAIMED già assunto da busy begin, ricircolo o adozione.
Post: link corrente preallocato, selezione ripetibile senza nuove capacità.
Non legge comandi/active e non conferma ritiro: il caller completa l'obbligo.
Binding/owner e routing delegati; fase/fault preservati dai confini C1 esistenti.\"
  (let ((port (dispatcher-writer-pool-port dispatcher))
        (table (dispatcher-writer-pool-table dispatcher)))
    (%check-dispatcher-binding port table)
    (arcdocdb.execution.series:collega-writer-worker-serie table)))
")
  (:PATH
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-dev/product-source-attempt-01/src/dispatch/package.lisp")
   :BYTES 573 :SHA256 "98f56140a06f18597e125c13dfa9593f9594daf129bde17c26f75bf1f4252669" :GIT-BLOB
   "d240598b5ae98d3350505fe9f15eda8557db1c14" :TEXT
   ";;;; Dispatcher logico, caricato dopo il routing e il governo del pool.
;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(defpackage #:arcdocdb.scheduler.dispatch
  (:use #:cl)
  (:import-from #:arcdocdb.binary #:index)
  (:import-from #:arcdocdb.conditions #:invalid-argument #:resource-exhausted
                #:invariant-violation)
  (:export #:dispatcher-writer-pool #:crea-dispatcher-writer-pool
           #:prendi-collegamento-pool #:collega-obbligo-pool #:ricircola-collegamento-pool
           #:inizia-obbligo-pool #:passo-dispatcher-pool))
")
  (:PATH
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-dev/product-source-attempt-01/src/dispatch/recycle.lisp")
   :BYTES 2612 :SHA256 "9fa3294cd28d1904cfb8db5153f93188b02f1bfbaf1800dad788731007c29ad0" :GIT-BLOB
   "adcd65ee5fd683d70a40b89b31a2edf7fc93994c" :TEXT
   ";;;; Risolve un obbligo RESCHEDULE prima di consultare nuovamente il pool.
;;; OWNER: dispatcher, contesto e link del thread creatore, senza reentrancy.
;;; SHARED: una partizione ready home per tratto (ADR-0045 §8), poi routing immutabile.
(in-package #:arcdocdb.scheduler.dispatch)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-004 REQ-AFF-008
(declaim (notinline %check-recycle-status))
(declaim (ftype (function (t) (member :claimed :published)) %check-recycle-status))
(defun %check-recycle-status (status)
  \"Pre: ritorno del delegato, verificato come T senza propagare assunzioni ftype.
Post: status noto; INVARIANT-VIOLATION inatteso senza mutare contesto o ready.
NOTINLINE mantiene il controllo al confine anche con FI fuori tipo del delegato.\"
  (case status
    ((:claimed :published) status)
    (otherwise (error 'invariant-violation :reason :pool-dispatcher-state))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (dispatcher-writer-pool)
                         (values (or null arcdocdb.execution.series:collegamento-worker-serie)
                                 (member :claimed :published) index &optional))
                ricircola-collegamento-pool))
(defun ricircola-collegamento-pool (dispatcher)
  \"Pre: owner corrente, RESCHEDULE con obbligo unico e bridge precedente chiuso.
Post: una sola operazione ready: NIL/PUBLISHED/count e IDLE, oppure link IDLE del
nuovo CLAIMED/count. Count della partizione, non cursore; nessun begin implicito.
Non legge il pool né conferma ritiro; busy conserva obbligo e retry esplicito.
Binding prima del trasferimento; errori C1 conservano i propri confini.
Routing fallito dopo full conserva lo scambio, senza rollback o nuovo fault C3.\"
  (let ((port (dispatcher-writer-pool-port dispatcher))
        (table (dispatcher-writer-pool-table dispatcher)))
    (%check-dispatcher-binding port table)
    (multiple-value-bind (writer outcome count)
        (arcdocdb.execution:ricircola-worker
         (arcdocdb.scheduler::porta-worker-pool-context port))
      (let ((status (%check-recycle-status outcome)))
        (case status
          (:claimed
           (unless writer (error 'invariant-violation :reason :pool-dispatcher-state))
           (values (arcdocdb.execution.series:collega-writer-worker-serie table) status count))
          (:published
           (when writer (error 'invariant-violation :reason :pool-dispatcher-state))
           (values nil status count))
          (otherwise (error 'invariant-violation :reason :pool-dispatcher-state)))))))
")
  (:PATH
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-dev/product-source-attempt-01/src/dispatch/step.lisp")
   :BYTES 3096 :SHA256 "0d7653e6cbc0d93295f2ee1f84d142602af795933bf3147de9fc462c476212de" :GIT-BLOB
   "a4089abcd78bb811ca8279361af027e9822722c0" :TEXT
   ";;;; Un passo di governo: prima gli obblighi, nuova admission solo da IDLE.
;;; OWNER: dispatcher e contesto locali al thread creatore, senza reentrancy.
;;; SHARED: soli ingressi pool/ready/routing esistenti per tratto (ADR-0045 §8).
(in-package #:arcdocdb.scheduler.dispatch)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (notinline %passo-dispatcher-fase))
(declaim (ftype (function (dispatcher-writer-pool t)
                         (values (or null arcdocdb.execution.series:collegamento-worker-serie)
                                 (member :claimed :empty :busy :inactive :published)
                                 (member :claim :current :recycle) (or null index)
                                 (member nil :unchanged :activated :retired :busy :faulted) &optional))
                %passo-dispatcher-fase))
(defun %passo-dispatcher-fase (dispatcher phase)
  \"Pre: binding verificato, fase osservata accettata come T senza assunzioni C1.
Post: un solo ingresso operativo, cinque valori senza confondere cursor/count.
Fasi note non ammesse RESOURCE-EXHAUSTED; inattesa INVARIANT-VIOLATION.
NOTINLINE conserva la difesa fuori ftype; nessun controllo dopo acquisizione.\"
  (case phase
    (:idle
     (multiple-value-bind (link status cursor action) (prendi-collegamento-pool dispatcher)
       (values link status :claim cursor action)))
    (:claimed
     (values (collega-obbligo-pool dispatcher) :claimed :current nil nil))
    (:reschedule
     (multiple-value-bind (link status count) (ricircola-collegamento-pool dispatcher)
       (values link status :recycle count nil)))
    ((:running :batch :finishing :faulted)
     (error 'resource-exhausted :reason :worker-state))
    (otherwise (error 'invariant-violation :reason :pool-dispatcher-state))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (dispatcher-writer-pool)
                         (values (or null arcdocdb.execution.series:collegamento-worker-serie)
                                 (member :claimed :empty :busy :inactive :published)
                                 (member :claim :current :recycle) (or null index)
                                 (member nil :unchanged :activated :retired :busy :faulted) &optional))
                passo-dispatcher-pool))
(defun passo-dispatcher-pool (dispatcher)
  \"Pre: owner corrente, fase IDLE/CLAIMED/RESCHEDULE coerente, bridge gia chiuso.
Post: claim/current/recycle esclusivi, al piu un trasferimento ready; nessun begin.
Binding prima della lettura fase; rifiuti/fault delegati senza rollback o cleanup.
Pubblicazione termina il passo; nessuna nuova presa o ACK impliciti dopo recycle.\"
  (let ((port (dispatcher-writer-pool-port dispatcher))
        (table (dispatcher-writer-pool-table dispatcher)))
    (%check-dispatcher-binding port table)
    (%passo-dispatcher-fase
     dispatcher (arcdocdb.execution:stato-worker-writer
                 (arcdocdb.scheduler::porta-worker-pool-context port)))))
")
  (:PATH
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-dev/product-source-attempt-01/src/dispatch/types.lisp")
   :BYTES 1872 :SHA256 "cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720" :GIT-BLOB
   "09b357c8f46c67d8e57994e1fa37affdd25a1695" :TEXT
   ";;;; Binding immutabile tra porta del pool e routing locale dello stesso worker.
;;; OWNER: dispatcher e tabella del thread creatore; nessuna migrazione o reentrancy.
;;; SHARED: nessuna nuova struttura condivisa o scrittura globale per operazione.
(in-package #:arcdocdb.scheduler.dispatch)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(defstruct (dispatcher-writer-pool
             (:constructor %make-dispatcher-writer-pool (port table)) (:copier nil))
  \"Pre: porta e tabella sul medesimo contesto IDLE, owner corrente verificato.
Post: binding preallocato immutabile; nessun claim, lease o comando applicato.\"
  (port nil :type arcdocdb.scheduler:porta-worker-pool :read-only t)
  (table nil :type arcdocdb.execution.series:tabella-worker-serie :read-only t))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (t t) null) %check-dispatcher-binding))
(defun %check-dispatcher-binding (port table)
  \"Pre: factory o dispatcher privato. Post: owner e identità del contesto validi.
INVALID-ARGUMENT configuration/owner/binding prima di ACK, claim o routing.
Nessuna lettura di fase, parole pool, ready, lease o controller vivo.\"
  (unless (typep port 'arcdocdb.scheduler:porta-worker-pool)
    (error 'invalid-argument :reason :pool-dispatcher-configuration))
  (unless (eq (arcdocdb.scheduler::porta-worker-pool-owner port) sb-thread:*current-thread*)
    (error 'invalid-argument :reason :pool-worker-owner))
  (unless (typep table 'arcdocdb.execution.series:tabella-worker-serie)
    (error 'invalid-argument :reason :pool-dispatcher-configuration))
  (unless (eq (arcdocdb.scheduler::porta-worker-pool-context port)
              (arcdocdb.execution.series::tabella-worker-serie-context table))
    (error 'invalid-argument :reason :pool-dispatcher-binding))
  nil)
")
  (:PATH
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-dev/publication-selftest-attempt-01.log")
   :BYTES 76 :SHA256 "f86dc60f08f7411f5d4548477561085293492a1a84288b90b499e9244a3fb7e7" :GIT-BLOB
   "5fd740896d4af46ed5ea6331b8a04376f79ce448" :TEXT
   "Step publication adapter: valid component and eight negative fixtures PASS.
")
  (:PATH
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-dev/publication-selftest.lisp")
   :BYTES 1501 :SHA256 "80e98f97858867463d382f4e5f39304daf9dd1f25a1019aa9b9f996d654db7f3" :GIT-BLOB
   "bea92637066166daf9d4ad40711a4793de61561b" :TEXT "(require :asdf)
(let ((*features* (cons :pool-worker-step-publication-library *features*)))
  (load \"spikes/out/pool-step-publication.lisp\"))
(let* ((paths '(\"src/dispatch/package.lisp\" \"src/dispatch/types.lisp\"
                \"src/dispatch/build.lisp\" \"src/dispatch/claim.lisp\"
                \"src/dispatch/recycle.lisp\" \"src/dispatch/begin.lisp\" \"src/dispatch/step.lisp\"))
       (input #p\"spikes/out/pool-step-publication.lisp\")
       (config (list :base \"5be241d8f295e3c82df06e75c9b12e0bf75eb202\"
                     :snapshot (namestring (truename \"./\")) :paths paths))
       (component (pool-worker-step-component-manifest config input)))
  (unless (= 7 (length (getf component :qualified-source-inventory)))
    (error \"C4: inventory count mismatch.\"))
  (pool-worker-step-validate-component component)
  (dolist (path paths)
    (let ((negative (copy-list config)))
      (setf (getf negative :paths) (remove path paths :test #'string=))
      (unless (handler-case (progn (pool-worker-step-component-manifest negative input) nil)
                (error () t))
        (error \"C4: missing runtime source accepted: ~A.\" path))))
  (let ((bad (copy-tree component)))
    (setf (getf (first (getf bad :qualified-source-inventory)) :sha256) \"invalid\")
    (unless (handler-case (progn (pool-worker-step-validate-component bad) nil) (error () t))
      (error \"C4: altered fingerprint accepted.\"))))
(format t \"~&Step publication adapter: valid component and eight negative fixtures PASS.~%\")
")
  (:PATH
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-integrated-attempt-01.log")
   :BYTES 146 :SHA256 "9b45a226f37d9c79ebe21d7178b1668744cb577843841bd5d61f79be24423b21" :GIT-BLOB
   "87f8bbbc1387c9b83fad5fbb62dbcbd8f029825d" :TEXT
   ":OK: make test lint trace; record: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001073480-command-67324-0/report.lisp
")
  (:PATH
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-measure/compile-only.lisp")
   :BYTES 616 :SHA256 "4b0a51c402b73287b7dc0e217a7a251020f35729f1f019ca02b31199c23e7634" :GIT-BLOB
   "c433557b08d56765e61eec0bb92025034c843d8c" :TEXT "(require :asdf)
(pushnew :arcdocdb-pool-step-measure-library *features*)
(declaim (optimize (safety 3) (debug 3)))
(handler-bind ((warning (lambda (condition) (error condition)))
               (style-warning (lambda (condition) (error condition))))
  (multiple-value-bind (fasl warnings failure)
      (compile-file \"tools/measure-pool-step.lisp\"
                    :output-file \"spikes/out/pool-step-measure/measure-pool-step.fasl\")
    (unless (and fasl (not warnings) (not failure))
      (error \"COD-01: tool pool-step compile failure.\"))
    (load fasl)))

(format t \"~&Pool step tool strict compile PASS~%\")
")
  (:PATH
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-measure/coverage-run.lisp")
   :BYTES 2800 :SHA256 "688398123588abdc7b247cc266dc01e7022c0d074e55658c1cd89e1f6f02958b" :GIT-BLOB
   "46741c268c38d43ac088afb0efdcb58214946729" :TEXT "(require :asdf)
(require :sb-cover)
(require :sb-posix)
(pushnew :dispatch-coverage-reader-library *features*)
;; Keep startup code-component marks across ASDF GC without modifying any observed bit.
(defmethod asdf:perform :after ((operation asdf:load-op) (component asdf:cl-source-file))
  (declare (ignore operation))
  (when (search \"/src/dispatch/\" (namestring (asdf:component-pathname component)))
    (sb-cover:save-coverage)))
(let* ((args (uiop:command-line-arguments)) (root (truename \"./\"))
       (directory (when (= 2 (length args))
                    (uiop:ensure-directory-pathname (merge-pathnames (second args) root)))))
  (unless (and directory (string= \"--report\" (first args)))
    (error \"COD-61 pool dispatch coverage: use --report fresh-directory/.\"))
  (ensure-directories-exist
   (merge-pathnames \"parent-placeholder\" (uiop:pathname-parent-directory-pathname directory)))
  (sb-posix:mkdir (namestring directory) #o700)
  (handler-bind ((warning (lambda (condition) (error condition)))
                 (style-warning (lambda (condition) (error condition))))
    (multiple-value-bind (fasl warnings failure)
        (compile-file \"spikes/out/pool-step-measure/dispatch-coverage-reader.lisp\"
                      :output-file (merge-pathnames \"reader.fasl\" directory))
      (unless (and fasl (not warnings) (not failure)) (error \"COD-01: dispatch reader compile failure.\"))
      (load fasl)))
  (uiop:symbol-call \"ARCDOCDB.DISPATCH.COVERAGE.READER\" \"ADAPTER-SELF-TEST\")
  (asdf:initialize-output-translations
   `(:output-translations
     (,(merge-pathnames \"**/*.*\" root) ,(merge-pathnames \"fasl/**/*.*\" directory))
     :ignore-inherited-configuration))
  (proclaim '(optimize (sb-cover:store-coverage-data 3)))
  (setf asdf:*compile-file-failure-behaviour* :error asdf:*compile-file-warnings-behaviour* :error)
  (handler-bind ((warning (lambda (condition)
                           (unless (typep condition 'sb-kernel:redefinition-warning) (error condition)))))
    (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" root))
    (asdf:load-system \"arcdocdb/tests\" :force t))
  (uiop:symbol-call \"ARCDOCDB.SCHEDULER.TESTS\" \"RUN\")
  (sb-cover:save-coverage-in-file (merge-pathnames \"coverage-state.lisp\" directory))
  (let ((html (sb-cover:report directory
                              :if-matches (lambda (path)
                                            (search \"/src/dispatch/\" path)))))
    (unless html (error \"COD-60: dispatch source data missing.\"))
    (uiop:symbol-call \"ARCDOCDB.DISPATCH.COVERAGE.READER\" \"AUDIT-DISPATCH-COVERAGE\"
                     (merge-pathnames \"coverage-state.lisp\" directory) html
                     (merge-pathnames \"coverage-audit.lisp\" directory)
                     (merge-pathnames \"coverage-dispatch-audit.lisp\" directory))))
")
  (:PATH
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-measure/dispatch-coverage-reader.lisp")
   :BYTES 9117 :SHA256 "036c0698897871690552afdad5798fd44238151310523771a8ef15454e85ee10" :GIT-BLOB
   "e07bb28e0c4c4ace9c36e61b609e0586bf5c037a" :TEXT
   ";;;; C4 adapter: library native/TD/count parser unchanged; whole seven-file dispatch scope.
;;;; The legacy audit remains original; metadata-only dispatch audit retains identical counts/missing.
;;;; --self-test; runner calls AUDIT-DISPATCH-COVERAGE after the independent adapter selftest.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require :asdf)
  (unless (find-package \"ARCDOCDB.LIFECYCLE.COVERAGE.READER\")
    (let ((*features* (cons :lifecycle-coverage-reader-library *features*)))
      (load \"spikes/out/lifecycle-measure/lifecycle-coverage-reader.lisp\"))))
(defpackage #:arcdocdb.dispatch.coverage.reader (:use #:cl))
(in-package #:arcdocdb.dispatch.coverage.reader)
(declaim (optimize (safety 3) (debug 3)))
(defparameter +scope+ '(\"src/dispatch/package.lisp\" \"src/dispatch/types.lisp\"
                        \"src/dispatch/build.lisp\" \"src/dispatch/claim.lisp\" \"src/dispatch/recycle.lisp\" \"src/dispatch/begin.lisp\" \"src/dispatch/step.lisp\"))

(defun dispatch-source-identity (path)
  \"All dispatch-directory files enter the inventory; unexpected modules cannot silently disappear.\"
  (arcdocdb.lifecycle.coverage.reader::reader-require (stringp path) \"dispatch source not a string\")
  (let ((start (if (uiop:string-prefix-p \"src/\" path) 0
                   (let ((position (search \"/src/\" path :from-end t)))
                     (when position (1+ position))))))
    (when start
      (let ((identity (subseq path start)))
        (when (uiop:string-prefix-p \"src/dispatch/\" identity)
          identity)))))

(defun call-dispatch-reader (function)
  \"One-thread C4 adapter restores the library selector even on rejection; no native bit edits.\"
  (let ((original (symbol-function 'arcdocdb.lifecycle.coverage.reader::source-identity))
        (original-html (symbol-function 'arcdocdb.lifecycle.coverage.reader::html-count-rows))
        (arcdocdb.lifecycle.coverage.reader::+scope-files+ +scope+))
    (unwind-protect
         (progn (setf (symbol-function 'arcdocdb.lifecycle.coverage.reader::source-identity)
                      #'dispatch-source-identity
                      (symbol-function 'arcdocdb.lifecycle.coverage.reader::html-count-rows)
                      #'dispatch-html-count-rows)
                (funcall function))
      (setf (symbol-function 'arcdocdb.lifecycle.coverage.reader::source-identity) original
            (symbol-function 'arcdocdb.lifecycle.coverage.reader::html-count-rows) original-html))))


(defun dispatch-html-count-rows (html)
  \"Namespace-only adapter: unchanged native/TD/count parser, original dispatch heading/identities.\"
  (let ((cursor 0) (directory nil) (rows nil) (seen (make-hash-table :test 'equal)))
    (loop for start = (search \"<tr\" html :start2 cursor) while start
          do (let ((close (search \"</tr>\" html :start2 start)))
               (arcdocdb.lifecycle.coverage.reader::reader-require close \"HTML TR delimiter missing\")
               (let ((row (subseq html start (+ close 5))))
                 (cond
                   ((search \"class='subheading'\" row)
                    (let* ((cells (arcdocdb.lifecycle.coverage.reader::html-cells row))
                           (identity (and (= 1 (length cells)) (dispatch-source-identity (first cells)))))
                      (setf directory (when (equal identity \"src/dispatch/\") identity))))
                   ((and directory (or (search \"class='odd'\" row) (search \"class='even'\" row)))
                    (let* ((counts (arcdocdb.lifecycle.coverage.reader::html-data-counts row directory))
                           (identity (first counts)))
                      (arcdocdb.lifecycle.coverage.reader::reader-require
                       (not (gethash identity seen)) \"duplicate HTML source identity\")
                      (setf (gethash identity seen) t)
                      (push counts rows)))
                   (t nil)))
               (setf cursor (+ close 5))))
    (sort rows #'string< :key #'first)))

(defun adapter-self-test ()
  \"Original library malformed input/gate tests plus independent dispatch inventory/path fixtures.\"
  (arcdocdb.lifecycle.coverage.reader::coverage-reader-self-test)
  (call-dispatch-reader
   (lambda ()
     (let* ((native (list (list* \"/a/src/dispatch/package.lisp\" #((0)) #*1)
                          (list* \"/a/src/dispatch/begin.lisp\" #((0)) #*1)
                          (list* \"/a/src/dispatch/step.lisp\" #((0)) #*1)
                          (list* \"/a/src/dispatch/types.lisp\" #((0) (1) (:then 2) (:else 2)) #*1010)
                          (list* \"/a/src/dispatch/build.lisp\" #((0)) #*1)
                          (list* \"/a/src/dispatch/claim.lisp\" #((0)) #*1)
                          (list* \"/a/src/dispatch/recycle.lisp\" #((0)) #*1)
                          (list* \"/a/src/scheduler/pool-claim.lisp\" #((0)) #*1)))
            (rows (arcdocdb.lifecycle.coverage.reader::scope-native-rows native))
            (counts (mapcar #'arcdocdb.lifecycle.coverage.reader::row-counts rows))
            (heading \"<tr class='subheading'><td colspan='7'>/a/src/dispatch/</td></tr>\")
            (html (concatenate 'string heading
                   \"<tr class='odd'><td><a href='begin'>begin.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='odd'><td><a href='b'>build.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='even'><td><a href='c'>claim.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='odd'><td><a href='p'>package.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='odd'><td><a href='r'>recycle.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='even'><td><a href='s'>step.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='even'><td><a href='t'>types.lisp</a></td><td>1</td><td>2</td><td>50</td><td>1</td><td>2</td><td>50</td></tr>\")))
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal counts '((\"src/dispatch/begin.lisp\" 1 1 0 0) (\"src/dispatch/build.lisp\" 1 1 0 0) (\"src/dispatch/claim.lisp\" 1 1 0 0)
                        (\"src/dispatch/package.lisp\" 1 1 0 0) (\"src/dispatch/recycle.lisp\" 1 1 0 0)
                        (\"src/dispatch/step.lisp\" 1 1 0 0) (\"src/dispatch/types.lisp\" 1 2 1 2)))
        \"dispatch independent native count oracle\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal '(7 8 1 2) (arcdocdb.lifecycle.coverage.reader::count-total counts)) \"dispatch denominator oracle\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal counts (arcdocdb.lifecycle.coverage.reader::html-count-rows html)) \"dispatch exact HTML concordance\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal (getf (seventh rows) :missing)
               '((:native-index 1 :kind :expression :path (1))
                 (:native-index 3 :kind :branch :path (:else 2)))) \"dispatch missing paths oracle\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal (dispatch-source-identity \"/a/src/dispatch/unexpected.lisp\") \"src/dispatch/unexpected.lisp\")
        \"unexpected module silently excluded\")
       (arcdocdb.lifecycle.coverage.reader::expect-rejection
        (lambda () (arcdocdb.lifecycle.coverage.reader::scope-native-rows
                    (list (list* \"/a/src/dispatch/types.lisp\" #((0)) #*0)
                          (list* \"/b/src/dispatch/types.lisp\" #((0)) #*1)))))
       (arcdocdb.lifecycle.coverage.reader::expect-rejection
        (lambda () (arcdocdb.lifecycle.coverage.reader::html-count-rows (concatenate 'string html html)))))))
  :passed)

(defun audit-dispatch-coverage (native html library-output dispatch-output)
  \"All seven dispatch files, gate95 without exclusions; preserve native/HTML and both audits.\"
  (adapter-self-test)
  (let ((report (call-dispatch-reader
                 (lambda () (arcdocdb.lifecycle.coverage.reader::audit-coverage native html library-output)))))
    (setf (getf report :kind) :pool-step-coverage-audit
          (getf report :scope) :entire-seven-file-dispatch-package
          (getf report :dispatch-total) (getf report :lifecycle-total)
          (getf report :library-report) (namestring library-output)
          (getf report :namespace-adapter) :dispatch-heading-with-unchanged-td-and-native-parser
          (getf report :scope-adapter-self-test) :passed)
    (with-open-file (stream dispatch-output :direction :output :if-exists :error :external-format :utf-8)
      (let ((*print-readably* t)) (write report :stream stream :pretty t) (terpri stream)))
    report))

(unless (member :dispatch-coverage-reader-library *features*)
  (unless (equal (uiop:command-line-arguments) '(\"--self-test\"))
    (error \"COD-61: dispatch coverage adapter use --self-test.\"))
  (adapter-self-test)
  (format t \"~&Dispatch coverage reader self-test PASS~%\"))
")
  (:PATH
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-measure/drain-fragment.lisp")
   :BYTES 941 :SHA256 "ed359c7be04ddfe221844b0beaa506028963b76103caaff925ee2ae97be67708" :GIT-BLOB
   "c834af56d8fa2a059fe4203576a42245e5d22251" :TEXT "(defun drain-claim (context writer)
  \"Cleanup C4 fuori clock: consuma e conferma il solo payload sentinel, poi termina IDLE.\"
  (let ((target (vector nil)))
    (unless (plusp (funcall (api \"INIZIA-TRATTO-WORKER\" \"ARCDOCDB.EXECUTION\") context))
      (error \"COD-60: cleanup begin senza lease.\"))
    (multiple-value-bind (count status token)
        (funcall (api \"PRELEVA-LAVORI-WORKER\" \"ARCDOCDB.EXECUTION\") context target 0 1)
      (unless (and (= 1 count) (eq :messages status) (eq :step-C4 (svref target 0)) (plusp token))
        (error \"COD-60: cleanup perde il payload della fixture.\"))
      (funcall (api \"CONFERMA-LAVORI-WORKER\" \"ARCDOCDB.EXECUTION\") context token))
    (unless (and (eq writer (funcall (api \"WRITER-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\") context))
                 (eq :idle (funcall (api \"TERMINA-TRATTO-WORKER\" \"ARCDOCDB.EXECUTION\") context)))
      (error \"COD-60: cleanup non termina il compito IDLE.\"))))

")
  (:PATH
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-measure/driver-fragment.lisp")
   :BYTES 4507 :SHA256 "9d0d8b993625084f1e94a106e7dfd067d492f0f09ee6eab6f0b76f5042f83790" :GIT-BLOB
   "a3cac18494543b3099bc203ace1f35a50b07d67f" :TEXT
   "(defun run-driver (args &key (product-loader #'load-product) (tester #'self-test) (runner #'campaign))
  \"Driver step compatto; riusa I/O esclusivo e sensore qualificati, preserva raw del fallimento.\"
  (let ((report (make-report)) (directory nil))
    (handler-case
        (progn
          (unless (or (equal args '(\"--self-test\"))
                      (and (= 2 (length args)) (string= \"--bench\" (first args))))
            (error \"COD-61: uso --self-test oppure --bench directory-nuova/.\"))
          (when (= 2 (length args)) (setf directory (acquire-directory (second args))))
          (setf (getf report :stage) :load-product)
          (when directory (write-report report directory))
          (funcall product-loader)
          (setf (getf report :stage) :self-test (getf report :self-test) (funcall tester))
          (when directory
            (setf (getf report :stage) :campaign)
            (funcall runner report (lambda () (write-report report directory))))
          (setf (getf report :status) :ok (getf report :stage) :complete))
      (error (condition)
        (setf (getf report :status) :failed (getf report :diagnostic) (princ-to-string condition))
        (let ((last (car (last (getf report :samples)))))
          (when (and last (eq :running (getf last :status)))
            (setf (getf last :status) :failed (getf last :diagnostic) (princ-to-string condition))))))
    (let ((after (fingerprints)))
      (setf (getf report :source-fingerprints-after) after (getf report :source-consistency)
            (if (equal (getf report :source-fingerprints-before) after) :stable :changed))
      (when (and (eq :ok (getf report :status)) (eq :changed (getf report :source-consistency)))
        (setf (getf report :status) :source-changed (getf report :diagnostic) \"COD-61: sorgenti cambiati.\")))
    (when directory (write-report report directory))
    report))

(defun self-test-reporter ()
  \"Il driver dispatch rifiuta CLI/destinazione e conserva replica conclusa più raw parziale.\"
  (let ((called nil) (root (arcdocdb.pool-lifecycle.measure::fresh-self-test-directory)))
    (unwind-protect
         (progn
           (dolist (args '(nil (\"--bench\") (\"--bad\") (\"--bench\" \"directory\" \"extra\")))
             (unless (and (eq :failed (getf (run-driver args :product-loader (lambda () (setf called t))) :status))
                          (null called))
               (error \"COD-60: CLI invalida eseguita.\")))
           (let* ((existing (acquire-directory (merge-pathnames \"existing/\" root)))
                  (failed (merge-pathnames \"failed/\" root)))
             (write-report '(:sentinel :unchanged) existing)
             (unless (and (eq :failed (getf (run-driver (list \"--bench\" (namestring existing))
                                                      :product-loader (constantly nil)
                                                      :tester (constantly :passed)) :status))
                          (equal (arcdocdb.pool-lifecycle.measure::read-self-test-report existing)
                                 '(:sentinel :unchanged)))
               (error \"COD-60: destinazione precedente non conservata.\"))
             (run-driver (list \"--bench\" (namestring failed))
                         :product-loader (constantly nil) :tester (constantly :passed)
                         :runner (lambda (report checkpoint)
                                   (setf (getf report :current-replica) 1 (getf report :samples)
                                         (list (list :status :ok :raw-ticks 3 :heap-bytes 0)
                                               (list :status :running :raw-ticks 7 :heap-bytes 11
                                                     :diagnostic nil)))
                                   (funcall checkpoint) (error \"fixture: replica interrotta\")))
             (let* ((saved (arcdocdb.pool-lifecycle.measure::read-self-test-report failed))
                    (samples (getf saved :samples)))
               (unless (and (eq :failed (getf saved :status)) (= 1 (getf saved :current-replica))
                            (= 2 (length samples)) (eq :ok (getf (first samples) :status))
                            (eq :failed (getf (second samples) :status))
                            (= 7 (getf (second samples) :raw-ticks))
                            (= 11 (getf (second samples) :heap-bytes)))
                 (error \"COD-60: replica o raw parziale persi.\")))))
      (uiop:delete-directory-tree root :validate t)))
  :passed)


")
  (:PATH
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-measure/reader-run.lisp")
   :BYTES 725 :SHA256 "f2b73c3685800bb7138b35c5fa82d58e5d43ac05e0c1fdb33242d8fd52b5162b" :GIT-BLOB
   "ea7ee28a8e9796da770bb584b774ec976a540259" :TEXT "(require :asdf)
(pushnew :dispatch-coverage-reader-library *features*)
(declaim (optimize (safety 3) (debug 3)))
(handler-bind ((warning (lambda (condition) (error condition)))
               (style-warning (lambda (condition) (error condition))))
  (multiple-value-bind (fasl warnings failure)
      (compile-file \"spikes/out/pool-step-measure/dispatch-coverage-reader.lisp\"
                    :output-file \"spikes/out/pool-step-measure/dispatch-coverage-reader.fasl\")
    (unless (and fasl (not warnings) (not failure)) (error \"COD-01: dispatch reader compile failure.\"))
    (load fasl)))
(uiop:symbol-call \"ARCDOCDB.DISPATCH.COVERAGE.READER\" \"ADAPTER-SELF-TEST\")
(format t \"~&Dispatch coverage reader self-test PASS~%\")
")
  (:PATH
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-measure/reader-selftest-dev-01.stderr")
   :BYTES 0 :SHA256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" :GIT-BLOB
   "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391" :TEXT "")
  (:PATH
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-measure/reader-selftest-dev-01.stdout")
   :BYTES 40 :SHA256 "db5aa48c4888096c9ee4671504ea0d717f4cbba7b005007a92e13233bd4c9da9" :GIT-BLOB
   "f2658eef8970964e8d8994d3b24609f768845762" :TEXT "Dispatch coverage reader self-test PASS
")
  (:PATH
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-measure/reader-source-dev-01.lisp")
   :BYTES 9117 :SHA256 "036c0698897871690552afdad5798fd44238151310523771a8ef15454e85ee10" :GIT-BLOB
   "e07bb28e0c4c4ace9c36e61b609e0586bf5c037a" :TEXT
   ";;;; C4 adapter: library native/TD/count parser unchanged; whole seven-file dispatch scope.
;;;; The legacy audit remains original; metadata-only dispatch audit retains identical counts/missing.
;;;; --self-test; runner calls AUDIT-DISPATCH-COVERAGE after the independent adapter selftest.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require :asdf)
  (unless (find-package \"ARCDOCDB.LIFECYCLE.COVERAGE.READER\")
    (let ((*features* (cons :lifecycle-coverage-reader-library *features*)))
      (load \"spikes/out/lifecycle-measure/lifecycle-coverage-reader.lisp\"))))
(defpackage #:arcdocdb.dispatch.coverage.reader (:use #:cl))
(in-package #:arcdocdb.dispatch.coverage.reader)
(declaim (optimize (safety 3) (debug 3)))
(defparameter +scope+ '(\"src/dispatch/package.lisp\" \"src/dispatch/types.lisp\"
                        \"src/dispatch/build.lisp\" \"src/dispatch/claim.lisp\" \"src/dispatch/recycle.lisp\" \"src/dispatch/begin.lisp\" \"src/dispatch/step.lisp\"))

(defun dispatch-source-identity (path)
  \"All dispatch-directory files enter the inventory; unexpected modules cannot silently disappear.\"
  (arcdocdb.lifecycle.coverage.reader::reader-require (stringp path) \"dispatch source not a string\")
  (let ((start (if (uiop:string-prefix-p \"src/\" path) 0
                   (let ((position (search \"/src/\" path :from-end t)))
                     (when position (1+ position))))))
    (when start
      (let ((identity (subseq path start)))
        (when (uiop:string-prefix-p \"src/dispatch/\" identity)
          identity)))))

(defun call-dispatch-reader (function)
  \"One-thread C4 adapter restores the library selector even on rejection; no native bit edits.\"
  (let ((original (symbol-function 'arcdocdb.lifecycle.coverage.reader::source-identity))
        (original-html (symbol-function 'arcdocdb.lifecycle.coverage.reader::html-count-rows))
        (arcdocdb.lifecycle.coverage.reader::+scope-files+ +scope+))
    (unwind-protect
         (progn (setf (symbol-function 'arcdocdb.lifecycle.coverage.reader::source-identity)
                      #'dispatch-source-identity
                      (symbol-function 'arcdocdb.lifecycle.coverage.reader::html-count-rows)
                      #'dispatch-html-count-rows)
                (funcall function))
      (setf (symbol-function 'arcdocdb.lifecycle.coverage.reader::source-identity) original
            (symbol-function 'arcdocdb.lifecycle.coverage.reader::html-count-rows) original-html))))


(defun dispatch-html-count-rows (html)
  \"Namespace-only adapter: unchanged native/TD/count parser, original dispatch heading/identities.\"
  (let ((cursor 0) (directory nil) (rows nil) (seen (make-hash-table :test 'equal)))
    (loop for start = (search \"<tr\" html :start2 cursor) while start
          do (let ((close (search \"</tr>\" html :start2 start)))
               (arcdocdb.lifecycle.coverage.reader::reader-require close \"HTML TR delimiter missing\")
               (let ((row (subseq html start (+ close 5))))
                 (cond
                   ((search \"class='subheading'\" row)
                    (let* ((cells (arcdocdb.lifecycle.coverage.reader::html-cells row))
                           (identity (and (= 1 (length cells)) (dispatch-source-identity (first cells)))))
                      (setf directory (when (equal identity \"src/dispatch/\") identity))))
                   ((and directory (or (search \"class='odd'\" row) (search \"class='even'\" row)))
                    (let* ((counts (arcdocdb.lifecycle.coverage.reader::html-data-counts row directory))
                           (identity (first counts)))
                      (arcdocdb.lifecycle.coverage.reader::reader-require
                       (not (gethash identity seen)) \"duplicate HTML source identity\")
                      (setf (gethash identity seen) t)
                      (push counts rows)))
                   (t nil)))
               (setf cursor (+ close 5))))
    (sort rows #'string< :key #'first)))

(defun adapter-self-test ()
  \"Original library malformed input/gate tests plus independent dispatch inventory/path fixtures.\"
  (arcdocdb.lifecycle.coverage.reader::coverage-reader-self-test)
  (call-dispatch-reader
   (lambda ()
     (let* ((native (list (list* \"/a/src/dispatch/package.lisp\" #((0)) #*1)
                          (list* \"/a/src/dispatch/begin.lisp\" #((0)) #*1)
                          (list* \"/a/src/dispatch/step.lisp\" #((0)) #*1)
                          (list* \"/a/src/dispatch/types.lisp\" #((0) (1) (:then 2) (:else 2)) #*1010)
                          (list* \"/a/src/dispatch/build.lisp\" #((0)) #*1)
                          (list* \"/a/src/dispatch/claim.lisp\" #((0)) #*1)
                          (list* \"/a/src/dispatch/recycle.lisp\" #((0)) #*1)
                          (list* \"/a/src/scheduler/pool-claim.lisp\" #((0)) #*1)))
            (rows (arcdocdb.lifecycle.coverage.reader::scope-native-rows native))
            (counts (mapcar #'arcdocdb.lifecycle.coverage.reader::row-counts rows))
            (heading \"<tr class='subheading'><td colspan='7'>/a/src/dispatch/</td></tr>\")
            (html (concatenate 'string heading
                   \"<tr class='odd'><td><a href='begin'>begin.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='odd'><td><a href='b'>build.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='even'><td><a href='c'>claim.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='odd'><td><a href='p'>package.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='odd'><td><a href='r'>recycle.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='even'><td><a href='s'>step.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='even'><td><a href='t'>types.lisp</a></td><td>1</td><td>2</td><td>50</td><td>1</td><td>2</td><td>50</td></tr>\")))
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal counts '((\"src/dispatch/begin.lisp\" 1 1 0 0) (\"src/dispatch/build.lisp\" 1 1 0 0) (\"src/dispatch/claim.lisp\" 1 1 0 0)
                        (\"src/dispatch/package.lisp\" 1 1 0 0) (\"src/dispatch/recycle.lisp\" 1 1 0 0)
                        (\"src/dispatch/step.lisp\" 1 1 0 0) (\"src/dispatch/types.lisp\" 1 2 1 2)))
        \"dispatch independent native count oracle\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal '(7 8 1 2) (arcdocdb.lifecycle.coverage.reader::count-total counts)) \"dispatch denominator oracle\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal counts (arcdocdb.lifecycle.coverage.reader::html-count-rows html)) \"dispatch exact HTML concordance\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal (getf (seventh rows) :missing)
               '((:native-index 1 :kind :expression :path (1))
                 (:native-index 3 :kind :branch :path (:else 2)))) \"dispatch missing paths oracle\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal (dispatch-source-identity \"/a/src/dispatch/unexpected.lisp\") \"src/dispatch/unexpected.lisp\")
        \"unexpected module silently excluded\")
       (arcdocdb.lifecycle.coverage.reader::expect-rejection
        (lambda () (arcdocdb.lifecycle.coverage.reader::scope-native-rows
                    (list (list* \"/a/src/dispatch/types.lisp\" #((0)) #*0)
                          (list* \"/b/src/dispatch/types.lisp\" #((0)) #*1)))))
       (arcdocdb.lifecycle.coverage.reader::expect-rejection
        (lambda () (arcdocdb.lifecycle.coverage.reader::html-count-rows (concatenate 'string html html)))))))
  :passed)

(defun audit-dispatch-coverage (native html library-output dispatch-output)
  \"All seven dispatch files, gate95 without exclusions; preserve native/HTML and both audits.\"
  (adapter-self-test)
  (let ((report (call-dispatch-reader
                 (lambda () (arcdocdb.lifecycle.coverage.reader::audit-coverage native html library-output)))))
    (setf (getf report :kind) :pool-step-coverage-audit
          (getf report :scope) :entire-seven-file-dispatch-package
          (getf report :dispatch-total) (getf report :lifecycle-total)
          (getf report :library-report) (namestring library-output)
          (getf report :namespace-adapter) :dispatch-heading-with-unchanged-td-and-native-parser
          (getf report :scope-adapter-self-test) :passed)
    (with-open-file (stream dispatch-output :direction :output :if-exists :error :external-format :utf-8)
      (let ((*print-readably* t)) (write report :stream stream :pretty t) (terpri stream)))
    report))

(unless (member :dispatch-coverage-reader-library *features*)
  (unless (equal (uiop:command-line-arguments) '(\"--self-test\"))
    (error \"COD-61: dispatch coverage adapter use --self-test.\"))
  (adapter-self-test)
  (format t \"~&Dispatch coverage reader self-test PASS~%\"))
")
  (:PATH
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-measure/tool-compile-dev-01.stderr")
   :BYTES 0 :SHA256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" :GIT-BLOB
   "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391" :TEXT "")
  (:PATH
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-measure/tool-compile-dev-01.stdout")
   :BYTES 35 :SHA256 "b57658e9aca4657922576b4687a1428a31e081e9ca3ba86d6771dc307b8106ae" :GIT-BLOB
   "2453670b7eb2e57b76b394354fdefee894775842" :TEXT "Pool step tool strict compile PASS
")
  (:PATH
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-measure/tool-compile-dev-02.stderr")
   :BYTES 0 :SHA256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" :GIT-BLOB
   "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391" :TEXT "")
  (:PATH
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-measure/tool-compile-dev-02.stdout")
   :BYTES 35 :SHA256 "b57658e9aca4657922576b4687a1428a31e081e9ca3ba86d6771dc307b8106ae" :GIT-BLOB
   "2453670b7eb2e57b76b394354fdefee894775842" :TEXT "Pool step tool strict compile PASS
")
  (:PATH
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-measure/tool-run.lisp")
   :BYTES 618 :SHA256 "49f9d999cfa61531e8d4c32b3fa1c9d9a991bbbbb0945f175a260292ed2796d5" :GIT-BLOB
   "2a1b86ca94a8b4b145f6868bcef0f8e622ae727b" :TEXT "(require :asdf)
(pushnew :arcdocdb-pool-step-measure-library *features*)
(declaim (optimize (safety 3) (debug 3)))
(handler-bind ((warning (lambda (condition) (error condition)))
               (style-warning (lambda (condition) (error condition))))
  (multiple-value-bind (fasl warnings failure)
      (compile-file \"tools/measure-pool-step.lisp\"
                    :output-file \"spikes/out/pool-step-measure/measure-pool-step.fasl\")
    (unless (and fasl (not warnings) (not failure))
      (error \"COD-01: tool pool-step compile failure.\"))
    (load fasl)))
(uiop:symbol-call \"ARCDOCDB.POOL-STEP.MEASURE\" \"MAIN\")
")
  (:PATH
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-measure/tool-selftest-dev-01.stderr")
   :BYTES 0 :SHA256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" :GIT-BLOB
   "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391" :TEXT "")
  (:PATH
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-measure/tool-selftest-dev-01.stdout")
   :BYTES 84527 :SHA256 "bc709b922606a52dd1efb261c199c440cdb08445925240fa0c347e63333c02b3"
   :GIT-BLOB "2a21e032b9c258f33d0e1b9e4e6f522738258371" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :POOL-STEP-BENCHMARK :STATUS :OK :STAGE :COMPLETE
 :DIAGNOSTIC NIL :PROCESS-ARGV
 (#A((48) BASE-CHAR . \"/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl\")
  #A((11) BASE-CHAR . \"--self-test\"))
 :TOOL-ARGUMENTS (#A((11) BASE-CHAR . \"--self-test\"))
 :SOURCE-FINGERPRINTS-BEFORE
 ((:FILE \"arcdocdb.asd\" :MD5
   #A((32) BASE-CHAR . \"3ef9d9f3ca1e4d2341782d7fed6cf819\"))
  (:FILE \"tools/measure-pool-lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"72a85a626ffb60185baf7602d28517e9\"))
  (:FILE \"src/active/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"bf244695c3c14a1a0148517b48052f5d\"))
  (:FILE \"src/active/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"0ce41661b5cd26fe2edb944cca142f98\"))
  (:FILE \"src/active/prepare.lisp\" :MD5
   #A((32) BASE-CHAR . \"e3238a39b721a3a5ac1055bc1a30feba\"))
  (:FILE \"src/active/source.lisp\" :MD5
   #A((32) BASE-CHAR . \"50c6d9f4e4eb68c8018acb6a3fe70c8e\"))
  (:FILE \"src/active/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe47862290f99d6217361f4302e2faf2\"))
  (:FILE \"src/cache/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"5d70197c8b64ad6f20c8be47a60c73ca\"))
  (:FILE \"src/cache/clock.lisp\" :MD5
   #A((32) BASE-CHAR . \"3546cf7f5c5ed138068548c20064f499\"))
  (:FILE \"src/cache/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"72f3a33ce27ddf94c49c495580520004\"))
  (:FILE \"src/cache/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1f6a8e7aa4faed88e984b39871d1e53\"))
  (:FILE \"src/cache/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"82f937b7b08bd1696ad9c88da2e1c60c\"))
  (:FILE \"src/cache/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a25648d870eaa4f0b6e1e3b2cf76e28e\"))
  (:FILE \"src/cache/write.lisp\" :MD5
   #A((32) BASE-CHAR . \"fc09021f74fb50aac57589614dae04d7\"))
  (:FILE \"src/codec/cbor-array-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"560fa1b10432d16edb830014e95ea4dc\"))
  (:FILE \"src/codec/cbor-array-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"0429206ab6069f053c66da4c56439cfb\"))
  (:FILE \"src/codec/cbor-float-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"bc7a7b176e8cdd361b7c4306a1a4de4b\"))
  (:FILE \"src/codec/cbor-float-narrow.lisp\" :MD5
   #A((32) BASE-CHAR . \"c15cc9d91355860357ed434e58d1f4cb\"))
  (:FILE \"src/codec/cbor-float-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"f3b22be81a36e1713c34e890c82c6700\"))
  (:FILE \"src/codec/cbor-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"6e8c6a49314c2f460aa6f8a1759200b6\"))
  (:FILE \"src/codec/cbor-map-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"e3d33d0453e2d2feb57730cb15f12dab\"))
  (:FILE \"src/codec/cbor-map-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"66ff30cb4a72e6486b4a942311da5336\"))
  (:FILE \"src/codec/cbor-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"ecd8fe950344059c629927b38fb6e4aa\"))
  (:FILE \"src/codec/cbor-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"808b6366b341ff82314ff6e9b5d0da7e\"))
  (:FILE \"src/codec/cbor-scan-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"f6488e987889432b375254021825dbe5\"))
  (:FILE \"src/codec/cbor-scan-items.lisp\" :MD5
   #A((32) BASE-CHAR . \"706c0baa4158bf272c4b0df17c1439d2\"))
  (:FILE \"src/codec/cbor-scan-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"987e8ed576a21eb644ac1ef2e06edbda\"))
  (:FILE \"src/codec/cbor-scan-stack.lisp\" :MD5
   #A((32) BASE-CHAR . \"cf1999ddb10f879aeefbeea853742d57\"))
  (:FILE \"src/codec/cbor-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"0c33aedcdb352e78a3c694cf796e6692\"))
  (:FILE \"src/codec/cbor-simple-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"200373402e6e082dd8c7afde305302bb\"))
  (:FILE \"src/codec/cbor-space.lisp\" :MD5
   #A((32) BASE-CHAR . \"c33cdcc45f45218aa3e8bf26ce0ee575\"))
  (:FILE \"src/codec/cbor-string-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"b13e92b5f24a42fe283c17b649722b6a\"))
  (:FILE \"src/codec/cbor-tag-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"e7979d8a4fd14175c15e0f407c96fb3c\"))
  (:FILE \"src/codec/cbor-tag-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca0697060604db0499c90f1cc59d6b50\"))
  (:FILE \"src/codec/cbor-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"69e77bcd15b5413a815a65c5081229db\"))
  (:FILE \"src/codec/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d885bd2a9860eb60aec1a775e5031d5e\"))
  (:FILE \"src/codec/utf8.lisp\" :MD5
   #A((32) BASE-CHAR . \"0f67dd5c51bf6a63bc292ab4e2a280c2\"))
  (:FILE \"src/control/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"8f3dc4a9657b6bb760e31c46c1e7b986\"))
  (:FILE \"src/control/dependency.lisp\" :MD5
   #A((32) BASE-CHAR . \"22ae34181e8ab96d8c8ecab050a1a19e\"))
  (:FILE \"src/control/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"717c3c8807ad919903a6572969ab2fca\"))
  (:FILE \"src/control/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"2dfc2b76c1d3c382db8b50071bdaeadf\"))
  (:FILE \"src/control/prepare.lisp\" :MD5
   #A((32) BASE-CHAR . \"c2667a324b14b2547bee2c8016e6d6c1\"))
  (:FILE \"src/control/publication-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"0e2492b2c97e8d3f7692668f5e09b44f\"))
  (:FILE \"src/control/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"93ce63e1bd43f2e64dc3f233035f0a94\"))
  (:FILE \"src/control/recovery-publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"3e85d56ce10f7c01a155559f10583b7c\"))
  (:FILE \"src/control/recovery-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"62daccbd36e3e85c274db61fd255e050\"))
  (:FILE \"src/control/recovery-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f1ae3786b620734c45ed506bb4a00da\"))
  (:FILE \"src/control/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"468fcf430eede17a38b922dfd373a746\"))
  (:FILE \"src/control/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f525c21d06bf7abb9ee7c4eab9ac380e\"))
  (:FILE \"src/csn/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1130012fc5613a5648d22ed8628be0e8\"))
  (:FILE \"src/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1cdb5661fc54beba5bf00e4765f3235\"))
  (:FILE \"src/dispatch/begin.lisp\" :MD5
   #A((32) BASE-CHAR . \"e66f3d0f40cf83d951d03aa1846906dc\"))
  (:FILE \"src/dispatch/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ba4cd961094f37a157d49b8d7024b677\"))
  (:FILE \"src/dispatch/claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"b10caeff4f726c0ebd01e2c6d1baacba\"))
  (:FILE \"src/dispatch/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"92c75ab3a17a79e6fb9c2460f8e8ed27\"))
  (:FILE \"src/dispatch/recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"c3e120f7a7faba59ffb52e8dc0de96d6\"))
  (:FILE \"src/dispatch/step.lisp\" :MD5
   #A((32) BASE-CHAR . \"a32aed4f1c22877bb0be65c3bd03552c\"))
  (:FILE \"src/dispatch/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"36db6694bc70963149b8068ae7ab96ec\"))
  (:FILE \"src/epochs/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"765d14c88cd288093a77a57930cd6999\"))
  (:FILE \"src/epochs/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"875201dfab0a84efd40fe9828cc293c8\"))
  (:FILE \"src/epochs/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"975b5f74e0c5a38ce978f4d9c7fcc6b8\"))
  (:FILE \"src/epochs/reclaim.lisp\" :MD5
   #A((32) BASE-CHAR . \"036dd02adf87d33c3ae2f40735c733fa\"))
  (:FILE \"src/epochs/retire.lisp\" :MD5
   #A((32) BASE-CHAR . \"653b974f310c09f6e2224a84acc43bbf\"))
  (:FILE \"src/epochs/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"82253491f995f5bc153fb5ebf30d564c\"))
  (:FILE \"src/execution/handoff.lisp\" :MD5
   #A((32) BASE-CHAR . \"6b85eebe69366e78ed5fc5cc20735f00\"))
  (:FILE \"src/execution/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb5710d6c111cadb7121a50998a747fa\"))
  (:FILE \"src/execution/queue.lisp\" :MD5
   #A((32) BASE-CHAR . \"8202843bddb817da4279ac959ae3f3c4\"))
  (:FILE \"src/execution/ready-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"38d26f8c749dd946dfc4b9c57103a892\"))
  (:FILE \"src/execution/ready-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a64d98c9ff429d6103d6e10ee1fd7980\"))
  (:FILE \"src/execution/ready.lisp\" :MD5
   #A((32) BASE-CHAR . \"2c1892002f0599bb8273093031017520\"))
  (:FILE \"src/execution/worker-boundary.lisp\" :MD5
   #A((32) BASE-CHAR . \"c24065d6c8d80d1be53994a0041743df\"))
  (:FILE \"src/execution/worker-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"babd0a78b4185af24ae1fef870c0fabb\"))
  (:FILE \"src/execution/worker-run.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa34ca6bc07535e35fea723878d99f66\"))
  (:FILE \"src/execution/worker-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"0679ee07c46f69db330706303c70d8d2\"))
  (:FILE \"src/execution/writer.lisp\" :MD5
   #A((32) BASE-CHAR . \"73019644090e2971f2b54dc36e4491f5\"))
  (:FILE \"src/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca642ea47e4bff76f78f5b6d7287d6bd\"))
  (:FILE \"src/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"a06115175f450776762761dce25acdb8\"))
  (:FILE \"src/foundation/conditions.lisp\" :MD5
   #A((32) BASE-CHAR . \"942b596396c19815290a57830af2121b\"))
  (:FILE \"src/foundation/crc32c.lisp\" :MD5
   #A((32) BASE-CHAR . \"4db58e2f48bf77d751f1b83bb9f84b5c\"))
  (:FILE \"src/foundation/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"5ee593a112958d94163dab17c5aa4ba2\"))
  (:FILE \"src/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"c3ed0f09fa3fa6fe20c98e2ed6e69abe\"))
  (:FILE \"src/get-directory/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"cde24b2bf5c5637d5501b95bed47df31\"))
  (:FILE \"src/get-directory/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a05062f6ab6d5ebdfdde37e336dfce6\"))
  (:FILE \"src/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"74a694385f1aaf03ec87721545494119\"))
  (:FILE \"src/get-directory/sources-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"2b8193aab6801de19e26fa55e7c53f87\"))
  (:FILE \"src/get-directory/sources-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"7bac02a80ddc22c622f8465642385ae8\"))
  (:FILE \"src/get-directory/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"17c957d6934a31f4ed64313e756de2d2\"))
  (:FILE \"src/get-resolver/active-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"c65593cf172f53a8e90a853bbe9504c2\"))
  (:FILE \"src/get-resolver/active-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"6d95f29b331d335175843f47ae44a6ea\"))
  (:FILE \"src/get-resolver/active-init.lisp\" :MD5
   #A((32) BASE-CHAR . \"7ca975d2534f43c8018d36ecd7c2b042\"))
  (:FILE \"src/get-resolver/active-preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"f13d422adb6aa9e8489352884137f25a\"))
  (:FILE \"src/get-resolver/active-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"521737861e057d663964b0c030552587\"))
  (:FILE \"src/get-resolver/active-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6aaec49504a96f37c8ff1bc182c977b\"))
  (:FILE \"src/get-resolver/active-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"60bb258cf4cc7f50c5c1206af1bb5800\"))
  (:FILE \"src/get-resolver/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbfb2082103e6712419e180ab972245c\"))
  (:FILE \"src/get-resolver/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"263525e8274a8f46ce58a4a0ad6841a2\"))
  (:FILE \"src/get-resolver/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"1339edff0223dbf122f11ff0adbba61c\"))
  (:FILE \"src/get-resolver/rows.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca9002b81efd0aed9761cd1f78514762\"))
  (:FILE \"src/get-resolver/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"536e9dc4ed51072b8a6d1528d3ec18bf\"))
  (:FILE \"src/get-resolver/sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d869293ba47444c4721713d955c6254\"))
  (:FILE \"src/get-resolver/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"9df13bcc6908e9fa601d173a671e1ccf\"))
  (:FILE \"src/get/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"c5cc36884b238221cc13ca0c087ec7c2\"))
  (:FILE \"src/get/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"e70bfeddd694336bbd088e65f8761834\"))
  (:FILE \"src/get/lookup.lisp\" :MD5
   #A((32) BASE-CHAR . \"82258ec87aca513a508bc5dee8410dd6\"))
  (:FILE \"src/get/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"c72633d15c3488699072eb610ebde7c8\"))
  (:FILE \"src/get/segment.lisp\" :MD5
   #A((32) BASE-CHAR . \"811869eb6a197d3c4e26af4322e52652\"))
  (:FILE \"src/get/target.lisp\" :MD5
   #A((32) BASE-CHAR . \"1b70dac05d6d2418909eb5105b808e81\"))
  (:FILE \"src/get/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"c394e5684de5e2d938991c7cb348b93c\"))
  (:FILE \"src/hash/arithmetic.lisp\" :MD5
   #A((32) BASE-CHAR . \"b5c51802e607e3dd22de68204baf64e9\"))
  (:FILE \"src/hash/blocks.lisp\" :MD5
   #A((32) BASE-CHAR . \"bef497b9a267c7306d4100000491c814\"))
  (:FILE \"src/hash/hash64.lisp\" :MD5
   #A((32) BASE-CHAR . \"886b7c08b9929283e8968831cbe5c039\"))
  (:FILE \"src/hash/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d9060e41bc5252067d35e59ac70ee06\"))
  (:FILE \"src/index/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"65076c355c099b5dc73d185948d3bec4\"))
  (:FILE \"src/index/hash-digests.lisp\" :MD5
   #A((32) BASE-CHAR . \"43d2209225707352daec6186ef95a805\"))
  (:FILE \"src/index/hash-seed.lisp\" :MD5
   #A((32) BASE-CHAR . \"45ce41749bc6fa638539815d3f802b96\"))
  (:FILE \"src/index/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"598a9b65e73151c924b2cdcaf6d96705\"))
  (:FILE \"src/index/primary-arena.lisp\" :MD5
   #A((32) BASE-CHAR . \"a319691e3e28b7ea7b927de490cf69ba\"))
  (:FILE \"src/index/primary-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff2cfbb865290d7a1510fdf6877c7229\"))
  (:FILE \"src/index/primary-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa52433eae199ceeb874bf2bc47afca7\"))
  (:FILE \"src/index/primary-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"1dd67c527257e43f17e006644ecdbd00\"))
  (:FILE \"src/index/primary-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d65cfce399b04f905bf969929962e59a\"))
  (:FILE \"src/index/primary-probe.lisp\" :MD5
   #A((32) BASE-CHAR . \"699ce3f1615296fc27fcde3e0d63a4bc\"))
  (:FILE \"src/index/primary-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"3f317a0d3c5ee86a73651aad36135cc3\"))
  (:FILE \"src/index/primary-relocate.lisp\" :MD5
   #A((32) BASE-CHAR . \"5155959766645d3172ae5e73c58cc071\"))
  (:FILE \"src/index/primary-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a59eab6425a60fa2656f86bf87d5c9ac\"))
  (:FILE \"src/index/primary-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"e8e31e599356e592af29c0cc4604872b\"))
  (:FILE \"src/index/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"5b22b90cfe8534086f6aff96d156713e\"))
  (:FILE \"src/index/rebuild-budget.lisp\" :MD5
   #A((32) BASE-CHAR . \"0417dd41cb3ec1d62dfd913c19f810ad\"))
  (:FILE \"src/index/rebuild-copy.lisp\" :MD5
   #A((32) BASE-CHAR . \"8befbbd00ed5c31c1487a11887eba495\"))
  (:FILE \"src/index/rebuild-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"1188e7a64a7a5d9482c1233cb9acb452\"))
  (:FILE \"src/index/rebuild.lisp\" :MD5
   #A((32) BASE-CHAR . \"a450cac8071513365267e7024cbe94b0\"))
  (:FILE \"src/index/relocate.lisp\" :MD5
   #A((32) BASE-CHAR . \"475dd7d5809a836f01544b447cc8df27\"))
  (:FILE \"src/index/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"5157fd03ee806ee998ad8f0002d56268\"))
  (:FILE \"src/index/validation.lisp\" :MD5
   #A((32) BASE-CHAR . \"3384cadf737c7d80c004222022a281f6\"))
  (:FILE \"src/index/write.lisp\" :MD5
   #A((32) BASE-CHAR . \"f0c8c579cd7db466d243ed3ea9f8e8aa\"))
  (:FILE \"src/io/flush.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbb059997772b42708272debc4d29c4b\"))
  (:FILE \"src/io/identity-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"d354a095fb378c1b6f27397ffb902227\"))
  (:FILE \"src/io/identity.lisp\" :MD5
   #A((32) BASE-CHAR . \"4e03b14a0c5015dc6ec897221c9f0eb5\"))
  (:FILE \"src/io/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"fc1cbc7b30e0d74c359e9ee1bbd201ec\"))
  (:FILE \"src/io/namespace.lisp\" :MD5
   #A((32) BASE-CHAR . \"8898b56d45e22212f1db37f208230f34\"))
  (:FILE \"src/io/native-namespace.lisp\" :MD5
   #A((32) BASE-CHAR . \"4c0c79a243bd691d3a602afd89b77980\"))
  (:FILE \"src/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"58030bc0c811248a6537e2909d8762d6\"))
  (:FILE \"src/io/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d5458684a1b169bacc46bc87fdaffed4\"))
  (:FILE \"src/io/rename.lisp\" :MD5
   #A((32) BASE-CHAR . \"40a1415771121f68afaa5165a0c23465\"))
  (:FILE \"src/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"ee2b4b86f91e1b61f7e5a36abe34ce9b\"))
  (:FILE \"src/io/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"95e28214f3629b7f4088b471ea22ce09\"))
  (:FILE \"src/mvcc/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f188d1dbd5d0adb49f53acf09157aef9\"))
  (:FILE \"src/mvcc/snapshots-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"8bb066aab61a18eff175b9edb11e42a2\"))
  (:FILE \"src/mvcc/snapshots-csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"0e9365e674d1584b111f915ce1f58634\"))
  (:FILE \"src/mvcc/snapshots-lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff98aea5cb9a7ae2671f6a887a003725\"))
  (:FILE \"src/mvcc/snapshots-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"ae3ad96269b5e711a9dbb455f3c0ce48\"))
  (:FILE \"src/mvcc/snapshots-register.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d5a795bcefd605c75da91c725ae83a2\"))
  (:FILE \"src/mvcc/snapshots-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"475517bd7ba04a1c37a82efeb8ff73d9\"))
  (:FILE \"src/mvcc/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a9bc70eab6720b5c6f8503178e2c966b\"))
  (:FILE \"src/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"becf5c78049c85f2c05cd1ef54454032\"))
  (:FILE \"src/read/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"4040905f4a64ba704a480d82e87ec748\"))
  (:FILE \"src/read/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7d74d9decc5a0bc9f9331d89bd503e21\"))
  (:FILE \"src/read/task.lisp\" :MD5
   #A((32) BASE-CHAR . \"9e0baf22c53329d393e047c669679645\"))
  (:FILE \"src/read/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"9c37ff8237fcc9fe9ae4f44316e854e3\"))
  (:FILE \"src/recovery-active/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"3df4fbfa866a44b320da4bc3da38789a\"))
  (:FILE \"src/recovery-active/closure.lisp\" :MD5
   #A((32) BASE-CHAR . \"b154d3d29f80146d895a99d84c2e9741\"))
  (:FILE \"src/recovery-active/frames.lisp\" :MD5
   #A((32) BASE-CHAR . \"493993aaec139f7aef9ede131dcd410a\"))
  (:FILE \"src/recovery-active/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1c3c71bdd0f168e151514caed4f469c\"))
  (:FILE \"src/recovery-active/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"b52b8ebacf81aa225b6ea417c4a0e6ac\"))
  (:FILE \"src/recovery-active/query.lisp\" :MD5
   #A((32) BASE-CHAR . \"04a6d2a8201256453b28b9785981a6d1\"))
  (:FILE \"src/recovery-active/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"1dc488f2e6f12feef9a0fe29c3bd7c60\"))
  (:FILE \"src/recovery-active/resolve.lisp\" :MD5
   #A((32) BASE-CHAR . \"81e35c3b0b15f92ecbe17fcd1e7715b9\"))
  (:FILE \"src/recovery-active/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"213f5f7b0442bfa1bfdd73b6ff54df01\"))
  (:FILE \"src/recovery/decisions-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"1a51ef4a488bb9fde2ff7d47bae01379\"))
  (:FILE \"src/recovery/decisions-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"cbdc30f93109c474e1fc25066c9b9b13\"))
  (:FILE \"src/recovery/decisions-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"f782d1137b8ce342b91c9999cfb7accc\"))
  (:FILE \"src/recovery/decisions-radix.lisp\" :MD5
   #A((32) BASE-CHAR . \"852149de4c289b8e067602780378d87a\"))
  (:FILE \"src/recovery/decisions-sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"b33e57a643f2fca810846f6226366253\"))
  (:FILE \"src/recovery/decisions-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f4433fd19ebc7239dbc2628c39f3ecdb\"))
  (:FILE \"src/recovery/inventory-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"9bd6820c4feba3e552aab1a4edd87861\"))
  (:FILE \"src/recovery/inventory-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"fcea263de1938767772e5b11411ecd5e\"))
  (:FILE \"src/recovery/inventory-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"78c136d5838dcfe3019d9069643a8d8f\"))
  (:FILE \"src/recovery/manifest-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bf65b1731eab6e0572461ef5cc60fc40\"))
  (:FILE \"src/recovery/manifest-decode.lisp\" :MD5
   #A((32) BASE-CHAR . \"67975249aaabd751757cdfb9222cc3c4\"))
  (:FILE \"src/recovery/manifest-fold.lisp\" :MD5
   #A((32) BASE-CHAR . \"e0d2498db1011e857b7b0daa1934f187\"))
  (:FILE \"src/recovery/manifest-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1d7d05fce907e6be7a34857ee168b01d\"))
  (:FILE \"src/recovery/manifest-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"ebd7a54adea2213294a887e6d4db0927\"))
  (:FILE \"src/recovery/manifest-transition.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa19e7689d3b74a5c861d95286b9f7c9\"))
  (:FILE \"src/recovery/manifest-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"7b1d4054415faca7e5fca59ad83b4d4a\"))
  (:FILE \"src/recovery/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1c1c8ad0cd15b1703a2fe19cbf3f13c2\"))
  (:FILE \"src/recovery/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"fcacd15460db25ea9cc4036065f9f096\"))
  (:FILE \"src/scheduler/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"36c5ae2dd08fbe546f4392b7b12102ec\"))
  (:FILE \"src/scheduler/lifecycle-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"1c4a4fd316ef034c298db47dfca1daca\"))
  (:FILE \"src/scheduler/lifecycle-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"19c8be44863be30c07bb72fe3fac2a99\"))
  (:FILE \"src/scheduler/lifecycle-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa2f88c50dfec24af40af091f9221590\"))
  (:FILE \"src/scheduler/lifecycle-update.lisp\" :MD5
   #A((32) BASE-CHAR . \"40a78461f91616a935a39f29b87680c8\"))
  (:FILE \"src/scheduler/lifecycle-worker.lisp\" :MD5
   #A((32) BASE-CHAR . \"9d7cdf45c1b594fef5af735ec0955c05\"))
  (:FILE \"src/scheduler/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"0578c541b6ddfaf8827240e967ff76ea\"))
  (:FILE \"src/scheduler/policy.lisp\" :MD5
   #A((32) BASE-CHAR . \"1721005a7545b36df601d75252638eba\"))
  (:FILE \"src/scheduler/pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4995b29d40caa2ee29aa0c167885287\"))
  (:FILE \"src/scheduler/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"170dfc36aef6a3d78f980fbcc37f0176\"))
  (:FILE \"src/scheduler/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"981f9f6db268cd9a46d4239c677c5d5b\"))
  (:FILE \"src/scheduler/update.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a43e6b400b701c69286357ef85469fc\"))
  (:FILE \"src/series/events.lisp\" :MD5
   #A((32) BASE-CHAR . \"32b2156739a6f2ca996abb91df0a2603\"))
  (:FILE \"src/series/io-events.lisp\" :MD5
   #A((32) BASE-CHAR . \"b6026a8b7bb64b45c37a65effda70d8e\"))
  (:FILE \"src/series/ownership.lisp\" :MD5
   #A((32) BASE-CHAR . \"de1aca16a35d34d16aba12ff541c0d2b\"))
  (:FILE \"src/series/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"09653c7479e1498d1545f3f1f0ffd755\"))
  (:FILE \"src/series/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6977aba53c811ec3a373226f9f53795\"))
  (:FILE \"src/series/query.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb0d91405325b508e6b2ab24d178de7a\"))
  (:FILE \"src/series/retirement.lisp\" :MD5
   #A((32) BASE-CHAR . \"b8e04971b8ad75a1bd0c722997badfd2\"))
  (:FILE \"src/series/routing-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6924deff152b941bd49f0bb200b4197\"))
  (:FILE \"src/series/routing-select.lisp\" :MD5
   #A((32) BASE-CHAR . \"e0f987d8767744050ec4d1b3ecb699ed\"))
  (:FILE \"src/series/routing-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ce649df47dd38888d5103c98345f7e41\"))
  (:FILE \"src/series/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab19ec8d15af91511e817858c41cebc8\"))
  (:FILE \"src/series/worker-boundary.lisp\" :MD5
   #A((32) BASE-CHAR . \"2340e0c9074f7b1bf80c74f774986bc5\"))
  (:FILE \"src/series/worker-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a93ce2e84e8aee647b5083ad1d2b899b\"))
  (:FILE \"src/series/worker-run.lisp\" :MD5
   #A((32) BASE-CHAR . \"f0fee18adf357bad98e8a3c3e8c70c0c\"))
  (:FILE \"src/series/worker-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"2b23d468be0165fa009c5ebd5d1bbe23\"))
  (:FILE \"src/storage/compaction-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"1cda77a357ab2147035993b72d135a37\"))
  (:FILE \"src/storage/control-payload.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb64f806b8d69eb42d865b4abfff0b27\"))
  (:FILE \"src/storage/formats.lisp\" :MD5
   #A((32) BASE-CHAR . \"061147be459d8d3b08c661bd3f91d152\"))
  (:FILE \"src/storage/log-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"b53d27dcc9f4badf18b50519c50bc614\"))
  (:FILE \"src/storage/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f86bd104f20616a76b42c02227f72844\"))
  (:FILE \"src/storage/payload-record.lisp\" :MD5
   #A((32) BASE-CHAR . \"8c03f9c01dcb30f2d3970a5694968ecf\"))
  (:FILE \"src/storage/payload-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4ece3c4fa8d9492d2a80df7c0a4f5a0\"))
  (:FILE \"src/storage/segment-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6812fa59bf8fd1252fbf85a9bfa3896\"))
  (:FILE \"src/wal/builder.lisp\" :MD5
   #A((32) BASE-CHAR . \"a229f76f7036f3573a6e528dcd390a19\"))
  (:FILE \"src/wal/csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"42b990e3b254e6fb488c0ab91b6a6502\"))
  (:FILE \"src/wal/executor.lisp\" :MD5
   #A((32) BASE-CHAR . \"c0340924c9130e14d0e8efedeec078f1\"))
  (:FILE \"src/wal/group.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a0e7c99ab70b4720cbb091156560f5e\"))
  (:FILE \"src/wal/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"96c41b1d417135a24fc65659ea3abe11\"))
  (:FILE \"src/wal/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f799f27a8ac1a4c736c04796c1e543f9\"))
  (:FILE \"tests/codec/cbor-array-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"eaff7126d31032812b816d96beed2d1d\"))
  (:FILE \"tests/codec/cbor-array-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"d799a632098e68b3c2d61d415ac7fd45\"))
  (:FILE \"tests/codec/cbor-array-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"b9d14be96752dcf8318c82878549672c\"))
  (:FILE \"tests/codec/cbor-float-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"19e60c5edb24fae449ebbe831bc1b1e8\"))
  (:FILE \"tests/codec/cbor-float-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"5590458e8334cd9774fd212297407308\"))
  (:FILE \"tests/codec/cbor-float-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"e62412cb0e838b241383a5c9103dd2c2\"))
  (:FILE \"tests/codec/cbor-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"208ee0d03652de67ad453bdd34d10b62\"))
  (:FILE \"tests/codec/cbor-map-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"074efafd791f68caf5779b0ccb16a2b3\"))
  (:FILE \"tests/codec/cbor-map-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"6591b26b30365cac76ba0927c090f343\"))
  (:FILE \"tests/codec/cbor-map-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"5478566e25301bda7467493b25194ac2\"))
  (:FILE \"tests/codec/cbor-minimal-edges.lisp\" :MD5
   #A((32) BASE-CHAR . \"392d402b44d04a9ce1c95fef4c4e8bf9\"))
  (:FILE \"tests/codec/cbor-minimal-scan-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"16954ef22a2169e6f9f6de0e9ab187ab\"))
  (:FILE \"tests/codec/cbor-minimal-scan-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"d59e1b8152cbaf0dbf4a6cea649cb611\"))
  (:FILE \"tests/codec/cbor-minimal-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"34587c10ac32129ac531e0a4f03df9a6\"))
  (:FILE \"tests/codec/cbor-minimal-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d7ec43e187859da277b8fb5f66f8e73\"))
  (:FILE \"tests/codec/cbor-minimal-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"5b145690222d1b50984f1a284f118a7e\"))
  (:FILE \"tests/codec/cbor-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"2311a15f8d4af90bf341e91e0e64342b\"))
  (:FILE \"tests/codec/cbor-simple-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"c92e59ed693525e8e3b53656d005e82e\"))
  (:FILE \"tests/codec/cbor-simple-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"5c44f9bcb54dcef327c88156a358313f\"))
  (:FILE \"tests/codec/cbor-simple-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"808ed81b703fd2cf0ac11d148c3ffc08\"))
  (:FILE \"tests/codec/cbor-string-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"07c96de5ded8b12d0db3f8d2dcbfbb1d\"))
  (:FILE \"tests/codec/cbor-string-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"82cf8ab7c6ffb9f1a717d5ba41004b49\"))
  (:FILE \"tests/codec/cbor-string-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"70d9d0d454dd1f296ef6989d3b928842\"))
  (:FILE \"tests/codec/cbor-structure-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"220d386d29b1fa192e06ceebe4ec245c\"))
  (:FILE \"tests/codec/cbor-structure-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"5f103dd263bcacb7b3c6bf0455157fa9\"))
  (:FILE \"tests/codec/cbor-structure.lisp\" :MD5
   #A((32) BASE-CHAR . \"06e6f060aea55a18d06047e5ebabd18e\"))
  (:FILE \"tests/codec/cbor-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e5da97609a2ba58bb35fea24b7518d2b\"))
  (:FILE \"tests/codec/cbor-tag-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"10fe18f5f9280f0de45a56de78114dae\"))
  (:FILE \"tests/codec/cbor-tag-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"f339e28bda3d94cc8f58589999988a6d\"))
  (:FILE \"tests/codec/cbor-tag-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"d697c11e86af9e64a3519707b58aad82\"))
  (:FILE \"tests/codec/cbor-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"d3b8d19096d8d0bab30c0a54e077c7f3\"))
  (:FILE \"tests/codec/cbor-write-roundtrip.lisp\" :MD5
   #A((32) BASE-CHAR . \"646944ef624c06fd86d6a1306041349d\"))
  (:FILE \"tests/codec/cbor-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"13382bdf23e5501e0ca349faf7b05062\"))
  (:FILE \"tests/codec/cbor-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa864f83784e5976a38a43e2a79b7c6b\"))
  (:FILE \"tests/codec/cbor-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"dffa6e75d8c3d7f991f6c4460eb8b9bc\"))
  (:FILE \"tests/codec/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"32534fd42dd8124b50b45deefe143eaf\"))
  (:FILE \"tests/codec/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"5b025b0cfe065c5d934bf0901433ef04\"))
  (:FILE \"tests/codec/utf8.lisp\" :MD5
   #A((32) BASE-CHAR . \"767ead15603be8dce90f340dbb200d8f\"))
  (:FILE \"tests/control/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"8611febd980cadd28945367b979d2392\"))
  (:FILE \"tests/control/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"019432427c5aacfc29d6366032a1ce83\"))
  (:FILE \"tests/control/recovery-publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"37426d589ee6fc5555a28f4d4d5bfc55\"))
  (:FILE \"tests/control/recovery-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"1355e6a03a4ce889031b4c6a9ccb183a\"))
  (:FILE \"tests/control/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"756de79a8b15f4ed479b3206b1ac6d5a\"))
  (:FILE \"tests/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"1d9133c5fd33cb60ff160f468db330f4\"))
  (:FILE \"tests/csn/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e5c151cda2e10e4f9cae46a4326699eb\"))
  (:FILE \"tests/csn/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"087108576603e6cd5b9af14b50475746\"))
  (:FILE \"tests/epochs/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe92ddd79dcaab3d3f7bdf387bf2295e\"))
  (:FILE \"tests/epochs/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"592a2fe2e22214c52d4672d26620980b\"))
  (:FILE \"tests/epochs/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"67cec074bf70074f7f2c6965ef494ba8\"))
  (:FILE \"tests/execution/handoff.lisp\" :MD5
   #A((32) BASE-CHAR . \"f87fdc0f7bd194329c6349026a2f35bb\"))
  (:FILE \"tests/execution/queue.lisp\" :MD5
   #A((32) BASE-CHAR . \"940ebb450bc871f8c2dd7dc9977bb158\"))
  (:FILE \"tests/execution/ready-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"4ccdc0512b3c81837726076d7c795930\"))
  (:FILE \"tests/execution/ready.lisp\" :MD5
   #A((32) BASE-CHAR . \"f6756125a9150b6312dad3e2705b74d3\"))
  (:FILE \"tests/execution/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"bacb1a135c0d73cded57ba21986c8496\"))
  (:FILE \"tests/execution/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"99e06430f652a655a9c029847f9fa345\"))
  (:FILE \"tests/execution/worker.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbaa592327d730fdae78cb881350efe0\"))
  (:FILE \"tests/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"29fc6a9711ea9265840e8cde4971f74e\"))
  (:FILE \"tests/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"07c4c9ac2177f22e5b7fb25f9867a133\"))
  (:FILE \"tests/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a84ca3aa74ab158c6b7d66886cf8b23\"))
  (:FILE \"tests/foundation/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"758adad069aec2f9dbe0635797314ff6\"))
  (:FILE \"tests/get-active/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"447bcc0feb60a5a668474060df098cd7\"))
  (:FILE \"tests/get-active/directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"0de1b79cfcdf9dd19a4336c745726576\"))
  (:FILE \"tests/get-active/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"961c0d8fe5ba267150701a9914369e57\"))
  (:FILE \"tests/get-active/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"da12d6e2b34116951e37764beab59c2a\"))
  (:FILE \"tests/get-active/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"9cbecf43fcd898db4f74826bf2c29fa3\"))
  (:FILE \"tests/get-directory/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"1137938073e71d6d8d62c751fbad05d5\"))
  (:FILE \"tests/get-directory/lifetime-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"074ccd2fc80ba020ef8c13f07c1beb42\"))
  (:FILE \"tests/get-directory/lifetime.lisp\" :MD5
   #A((32) BASE-CHAR . \"f40cde2709b2d93525fa8b8a73cc13d8\"))
  (:FILE \"tests/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"d1ab36d05cc1266e4533d27c693f12f4\"))
  (:FILE \"tests/get-directory/series-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"486604b450bfe8de32feaed1a96dc0cc\"))
  (:FILE \"tests/get-directory/series-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"092192d05b3f85c6c283113c57c02f01\"))
  (:FILE \"tests/get-directory/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"5e47378b562314a863ea850da186b12a\"))
  (:FILE \"tests/get-directory/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"63dd01c852de1399c2c82274d481d257\"))
  (:FILE \"tests/get-performance/guards.lisp\" :MD5
   #A((32) BASE-CHAR . \"324c70304e678cbe022ff33c73f793e2\"))
  (:FILE \"tests/get-performance/paths.lisp\" :MD5
   #A((32) BASE-CHAR . \"eb48216a4b5baa9cf498968ee032b205\"))
  (:FILE \"tests/get-performance/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f5f9fa3ffcc3220f10b7a5f294ee6d9\"))
  (:FILE \"tests/get-performance/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"916e5740db5d52fdf6088694f34d11db\"))
  (:FILE \"tests/get-resolver/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"a64a6a5a34c8ec5f8c4ca4324cc348d2\"))
  (:FILE \"tests/get-resolver/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"e93c7dbf1bf2d7e99651b110a4e01661\"))
  (:FILE \"tests/get-resolver/sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"ffe3551bb49dd60d7d34213c9c93cf06\"))
  (:FILE \"tests/get-resolver/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"0738e161d276394a160a86ed139610f2\"))
  (:FILE \"tests/get/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"3a4bbc3fd3ede5a837f0c0f913637291\"))
  (:FILE \"tests/get/segment.lisp\" :MD5
   #A((32) BASE-CHAR . \"2f25d1904aa4960ce0d6351580a2bcc7\"))
  (:FILE \"tests/get/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"660783988d4f99d0e171bb59c79e3467\"))
  (:FILE \"tests/hash/guards.lisp\" :MD5
   #A((32) BASE-CHAR . \"a59d531a156fc49c39c9265075bd9600\"))
  (:FILE \"tests/hash/hash64.lisp\" :MD5
   #A((32) BASE-CHAR . \"443fdc895f2fa3620d2b1b4af5c32dc4\"))
  (:FILE \"tests/hash/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"40b223712554582c2910971a6b045149\"))
  (:FILE \"tests/hash/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"73ed0785ca1330d69ad336abc019a413\"))
  (:FILE \"tests/index/hash-digests.lisp\" :MD5
   #A((32) BASE-CHAR . \"91c1eda35e14276e795259bceac489be\"))
  (:FILE \"tests/index/primary-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"44e2635d88de3f6ccf69c684c3eff77b\"))
  (:FILE \"tests/index/primary-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d339c2f2680e66ac79ecd8d02c09382\"))
  (:FILE \"tests/index/primary.lisp\" :MD5
   #A((32) BASE-CHAR . \"6ed661242a86117dd2d696e374740a2f\"))
  (:FILE \"tests/index/rebuild.lisp\" :MD5
   #A((32) BASE-CHAR . \"262556582cc0c387d6c59b757d9956b1\"))
  (:FILE \"tests/index/slot-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6ed9249e2eaef3524260804ef7e02567\"))
  (:FILE \"tests/index/slot-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"e9b53e6eac6fc836e8243d41adbafea0\"))
  (:FILE \"tests/index/slots.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe094b4513ceabe8571031ac20935e48\"))
  (:FILE \"tests/io/flush-failure.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa9f0dcf1a0bbd827af0918f8c9816e4\"))
  (:FILE \"tests/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"1e6fd9ab36eb4e307207d371ed947757\"))
  (:FILE \"tests/io/rename-native.lisp\" :MD5
   #A((32) BASE-CHAR . \"d79c13ea447cd8694b14bc6391d7e3ee\"))
  (:FILE \"tests/io/rename.lisp\" :MD5
   #A((32) BASE-CHAR . \"87acf2a7abb532d41aef472600184643\"))
  (:FILE \"tests/io/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"a26526e87fe46794b8bbab1fdd46d68c\"))
  (:FILE \"tests/io/transfer-failure.lisp\" :MD5
   #A((32) BASE-CHAR . \"c9da7d7deac220b193b38dcabe0f6bd6\"))
  (:FILE \"tests/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab2fb36682dd8b8bc757e586ceb3be62\"))
  (:FILE \"tests/lint-fixtures/bad.lisp\" :MD5
   #A((32) BASE-CHAR . \"30f1396c941dd9b8a41ca15698b5a347\"))
  (:FILE \"tests/lint-fixtures/good.lisp\" :MD5
   #A((32) BASE-CHAR . \"f85250c3a057c851db6745b9eba27da1\"))
  (:FILE \"tests/lint-fixtures/keyword-barrier.lisp\" :MD5
   #A((32) BASE-CHAR . \"9f63fdfdf866f17d5491390b710ebb5e\"))
  (:FILE \"tests/lint-fixtures/qualified-reader.lisp\" :MD5
   #A((32) BASE-CHAR . \"7fc689336bb2041dfef4c22090bb7de4\"))
  (:FILE \"tests/mvcc/capture.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f0309fa9258eb62a45167de5d2279d5\"))
  (:FILE \"tests/mvcc/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"341627288b50485858efedc207fc95b5\"))
  (:FILE \"tests/mvcc/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e7d26bd67650663c88ceda526023ae83\"))
  (:FILE \"tests/read/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"73dab63d8414998d72f6c14e0d62e3ac\"))
  (:FILE \"tests/read/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"0d5db03bd804747de7c309c82e40dd43\"))
  (:FILE \"tests/read/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"0cf2cad12c77c82b827da01782bc996d\"))
  (:FILE \"tests/recovery/corruption.lisp\" :MD5
   #A((32) BASE-CHAR . \"a369b8176d4e877ab546d17e983b94ed\"))
  (:FILE \"tests/recovery/decisions-audit.lisp\" :MD5
   #A((32) BASE-CHAR . \"33b98cf215d1ddb469d02cc6c0032bfe\"))
  (:FILE \"tests/recovery/decisions-radix.lisp\" :MD5
   #A((32) BASE-CHAR . \"58eec0feac01e643c76ad19ef5c07df5\"))
  (:FILE \"tests/recovery/decisions-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"80348d0ce2adbc8a4d37db49df291b1d\"))
  (:FILE \"tests/recovery/decisions.lisp\" :MD5
   #A((32) BASE-CHAR . \"5add0e087181bad8ce330af23fc26686\"))
  (:FILE \"tests/recovery/inventory-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"522afcdc6115fdd4d8fec0d06aab7354\"))
  (:FILE \"tests/recovery/inventory.lisp\" :MD5
   #A((32) BASE-CHAR . \"9c78925dd89e94d86a9f577e0225eeb3\"))
  (:FILE \"tests/recovery/manifest-audit.lisp\" :MD5
   #A((32) BASE-CHAR . \"3ca73a199708e2571da3a27e6dc00c76\"))
  (:FILE \"tests/recovery/manifest-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"3286e0dfb66496aafe8b6fbbdd92ab43\"))
  (:FILE \"tests/recovery/manifest-transition.lisp\" :MD5
   #A((32) BASE-CHAR . \"84b53d783522e179d8c8e798d0b5146e\"))
  (:FILE \"tests/recovery/manifest.lisp\" :MD5
   #A((32) BASE-CHAR . \"b6bdcc4d20f7db14c0dc00d5258cbf8c\"))
  (:FILE \"tests/recovery/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa7af12d270673b62542d32ec60b361a\"))
  (:FILE \"tests/recovery/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"769bac1994a5e3d74bd56b510970bf9b\"))
  (:FILE \"tests/scheduler/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"bc20dcd712332fde961fb38e879392b5\"))
  (:FILE \"tests/scheduler/dispatch.lisp\" :MD5
   #A((32) BASE-CHAR . \"0235bb18cc7a6169e47d3aebf2438bdd\"))
  (:FILE \"tests/scheduler/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"1388f446bce5085439c2254edd165118\"))
  (:FILE \"tests/scheduler/pool-begin.lisp\" :MD5
   #A((32) BASE-CHAR . \"5fe1f60cddf25dc099d80f843285018d\"))
  (:FILE \"tests/scheduler/pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"aaba914dea485f812a11767addb94c81\"))
  (:FILE \"tests/scheduler/pool-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"8c1264656e39ff936f904948f6b36802\"))
  (:FILE \"tests/scheduler/pool-step.lisp\" :MD5
   #A((32) BASE-CHAR . \"b8423d1625f5d07501ccbc4c231c622d\"))
  (:FILE \"tests/scheduler/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"34e51e369859bc1c731d73e43053b6f4\"))
  (:FILE \"tests/series/boundaries.lisp\" :MD5
   #A((32) BASE-CHAR . \"6967c7e6396b6df38c637f2d5d9ebfc0\"))
  (:FILE \"tests/series/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"a83818568a27c52d36365597d7113c09\"))
  (:FILE \"tests/series/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6aa566720d1476d13a0f7288be9e1346\"))
  (:FILE \"tests/series/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"67718445a8948da3c7875f6cc6b3e167\"))
  (:FILE \"tests/series/worker-bridge.lisp\" :MD5
   #A((32) BASE-CHAR . \"c714c8db7998acf60256b318488574d8\"))
  (:FILE \"tests/series/worker-routing.lisp\" :MD5
   #A((32) BASE-CHAR . \"f839733b6f5a4d9286a5cdd7ae9bcb55\"))
  (:FILE \"tests/smoke.lisp\" :MD5
   #A((32) BASE-CHAR . \"afb2e2bc7ff7249ebb2e1ccf0f87aaf3\"))
  (:FILE \"tests/storage/compaction-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb4acb5a73eb973f53ef337113880d32\"))
  (:FILE \"tests/storage/control-payload.lisp\" :MD5
   #A((32) BASE-CHAR . \"25f3c822273c898d2263ceb3db538cab\"))
  (:FILE \"tests/storage/log-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"eecb2fe94e710a918254e5ad453a0daa\"))
  (:FILE \"tests/storage/segment-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab2c52fb6b79702d50dcef6d12ca8906\"))
  (:FILE \"tests/storage/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"82a4dbb4767c17f9851143a637af3b83\"))
  (:FILE \"tests/wal/builder.lisp\" :MD5
   #A((32) BASE-CHAR . \"0d01e4e18c0a559873fce584a0ac91cd\"))
  (:FILE \"tests/wal/csn-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"ecb2cbf4f7ace32cdaff329476070d60\"))
  (:FILE \"tests/wal/csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"3e2dbc3319b611db090e27493a10fc2c\"))
  (:FILE \"tests/wal/fault.lisp\" :MD5
   #A((32) BASE-CHAR . \"00367366b82918614d84f517f4bb395e\"))
  (:FILE \"tests/wal/group.lisp\" :MD5
   #A((32) BASE-CHAR . \"0ee2462103a749b58488561aeacaac07\"))
  (:FILE \"tests/wal/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"0643b96c5ee339f9826b19150d065ddf\"))
  (:FILE \"tests/wal/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"15952f6b761acea4519abf701bb2346c\"))
  (:FILE \"tools/measure-pool-step.lisp\" :MD5
   #A((32) BASE-CHAR . \"2e176e89639e71da83393559c8f9999c\")))
 :SOURCE-FINGERPRINTS-AFTER
 ((:FILE \"arcdocdb.asd\" :MD5
   #A((32) BASE-CHAR . \"3ef9d9f3ca1e4d2341782d7fed6cf819\"))
  (:FILE \"tools/measure-pool-lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"72a85a626ffb60185baf7602d28517e9\"))
  (:FILE \"src/active/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"bf244695c3c14a1a0148517b48052f5d\"))
  (:FILE \"src/active/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"0ce41661b5cd26fe2edb944cca142f98\"))
  (:FILE \"src/active/prepare.lisp\" :MD5
   #A((32) BASE-CHAR . \"e3238a39b721a3a5ac1055bc1a30feba\"))
  (:FILE \"src/active/source.lisp\" :MD5
   #A((32) BASE-CHAR . \"50c6d9f4e4eb68c8018acb6a3fe70c8e\"))
  (:FILE \"src/active/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe47862290f99d6217361f4302e2faf2\"))
  (:FILE \"src/cache/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"5d70197c8b64ad6f20c8be47a60c73ca\"))
  (:FILE \"src/cache/clock.lisp\" :MD5
   #A((32) BASE-CHAR . \"3546cf7f5c5ed138068548c20064f499\"))
  (:FILE \"src/cache/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"72f3a33ce27ddf94c49c495580520004\"))
  (:FILE \"src/cache/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1f6a8e7aa4faed88e984b39871d1e53\"))
  (:FILE \"src/cache/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"82f937b7b08bd1696ad9c88da2e1c60c\"))
  (:FILE \"src/cache/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a25648d870eaa4f0b6e1e3b2cf76e28e\"))
  (:FILE \"src/cache/write.lisp\" :MD5
   #A((32) BASE-CHAR . \"fc09021f74fb50aac57589614dae04d7\"))
  (:FILE \"src/codec/cbor-array-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"560fa1b10432d16edb830014e95ea4dc\"))
  (:FILE \"src/codec/cbor-array-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"0429206ab6069f053c66da4c56439cfb\"))
  (:FILE \"src/codec/cbor-float-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"bc7a7b176e8cdd361b7c4306a1a4de4b\"))
  (:FILE \"src/codec/cbor-float-narrow.lisp\" :MD5
   #A((32) BASE-CHAR . \"c15cc9d91355860357ed434e58d1f4cb\"))
  (:FILE \"src/codec/cbor-float-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"f3b22be81a36e1713c34e890c82c6700\"))
  (:FILE \"src/codec/cbor-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"6e8c6a49314c2f460aa6f8a1759200b6\"))
  (:FILE \"src/codec/cbor-map-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"e3d33d0453e2d2feb57730cb15f12dab\"))
  (:FILE \"src/codec/cbor-map-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"66ff30cb4a72e6486b4a942311da5336\"))
  (:FILE \"src/codec/cbor-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"ecd8fe950344059c629927b38fb6e4aa\"))
  (:FILE \"src/codec/cbor-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"808b6366b341ff82314ff6e9b5d0da7e\"))
  (:FILE \"src/codec/cbor-scan-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"f6488e987889432b375254021825dbe5\"))
  (:FILE \"src/codec/cbor-scan-items.lisp\" :MD5
   #A((32) BASE-CHAR . \"706c0baa4158bf272c4b0df17c1439d2\"))
  (:FILE \"src/codec/cbor-scan-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"987e8ed576a21eb644ac1ef2e06edbda\"))
  (:FILE \"src/codec/cbor-scan-stack.lisp\" :MD5
   #A((32) BASE-CHAR . \"cf1999ddb10f879aeefbeea853742d57\"))
  (:FILE \"src/codec/cbor-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"0c33aedcdb352e78a3c694cf796e6692\"))
  (:FILE \"src/codec/cbor-simple-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"200373402e6e082dd8c7afde305302bb\"))
  (:FILE \"src/codec/cbor-space.lisp\" :MD5
   #A((32) BASE-CHAR . \"c33cdcc45f45218aa3e8bf26ce0ee575\"))
  (:FILE \"src/codec/cbor-string-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"b13e92b5f24a42fe283c17b649722b6a\"))
  (:FILE \"src/codec/cbor-tag-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"e7979d8a4fd14175c15e0f407c96fb3c\"))
  (:FILE \"src/codec/cbor-tag-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca0697060604db0499c90f1cc59d6b50\"))
  (:FILE \"src/codec/cbor-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"69e77bcd15b5413a815a65c5081229db\"))
  (:FILE \"src/codec/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d885bd2a9860eb60aec1a775e5031d5e\"))
  (:FILE \"src/codec/utf8.lisp\" :MD5
   #A((32) BASE-CHAR . \"0f67dd5c51bf6a63bc292ab4e2a280c2\"))
  (:FILE \"src/control/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"8f3dc4a9657b6bb760e31c46c1e7b986\"))
  (:FILE \"src/control/dependency.lisp\" :MD5
   #A((32) BASE-CHAR . \"22ae34181e8ab96d8c8ecab050a1a19e\"))
  (:FILE \"src/control/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"717c3c8807ad919903a6572969ab2fca\"))
  (:FILE \"src/control/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"2dfc2b76c1d3c382db8b50071bdaeadf\"))
  (:FILE \"src/control/prepare.lisp\" :MD5
   #A((32) BASE-CHAR . \"c2667a324b14b2547bee2c8016e6d6c1\"))
  (:FILE \"src/control/publication-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"0e2492b2c97e8d3f7692668f5e09b44f\"))
  (:FILE \"src/control/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"93ce63e1bd43f2e64dc3f233035f0a94\"))
  (:FILE \"src/control/recovery-publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"3e85d56ce10f7c01a155559f10583b7c\"))
  (:FILE \"src/control/recovery-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"62daccbd36e3e85c274db61fd255e050\"))
  (:FILE \"src/control/recovery-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f1ae3786b620734c45ed506bb4a00da\"))
  (:FILE \"src/control/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"468fcf430eede17a38b922dfd373a746\"))
  (:FILE \"src/control/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f525c21d06bf7abb9ee7c4eab9ac380e\"))
  (:FILE \"src/csn/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1130012fc5613a5648d22ed8628be0e8\"))
  (:FILE \"src/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1cdb5661fc54beba5bf00e4765f3235\"))
  (:FILE \"src/dispatch/begin.lisp\" :MD5
   #A((32) BASE-CHAR . \"e66f3d0f40cf83d951d03aa1846906dc\"))
  (:FILE \"src/dispatch/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ba4cd961094f37a157d49b8d7024b677\"))
  (:FILE \"src/dispatch/claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"b10caeff4f726c0ebd01e2c6d1baacba\"))
  (:FILE \"src/dispatch/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"92c75ab3a17a79e6fb9c2460f8e8ed27\"))
  (:FILE \"src/dispatch/recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"c3e120f7a7faba59ffb52e8dc0de96d6\"))
  (:FILE \"src/dispatch/step.lisp\" :MD5
   #A((32) BASE-CHAR . \"a32aed4f1c22877bb0be65c3bd03552c\"))
  (:FILE \"src/dispatch/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"36db6694bc70963149b8068ae7ab96ec\"))
  (:FILE \"src/epochs/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"765d14c88cd288093a77a57930cd6999\"))
  (:FILE \"src/epochs/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"875201dfab0a84efd40fe9828cc293c8\"))
  (:FILE \"src/epochs/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"975b5f74e0c5a38ce978f4d9c7fcc6b8\"))
  (:FILE \"src/epochs/reclaim.lisp\" :MD5
   #A((32) BASE-CHAR . \"036dd02adf87d33c3ae2f40735c733fa\"))
  (:FILE \"src/epochs/retire.lisp\" :MD5
   #A((32) BASE-CHAR . \"653b974f310c09f6e2224a84acc43bbf\"))
  (:FILE \"src/epochs/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"82253491f995f5bc153fb5ebf30d564c\"))
  (:FILE \"src/execution/handoff.lisp\" :MD5
   #A((32) BASE-CHAR . \"6b85eebe69366e78ed5fc5cc20735f00\"))
  (:FILE \"src/execution/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb5710d6c111cadb7121a50998a747fa\"))
  (:FILE \"src/execution/queue.lisp\" :MD5
   #A((32) BASE-CHAR . \"8202843bddb817da4279ac959ae3f3c4\"))
  (:FILE \"src/execution/ready-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"38d26f8c749dd946dfc4b9c57103a892\"))
  (:FILE \"src/execution/ready-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a64d98c9ff429d6103d6e10ee1fd7980\"))
  (:FILE \"src/execution/ready.lisp\" :MD5
   #A((32) BASE-CHAR . \"2c1892002f0599bb8273093031017520\"))
  (:FILE \"src/execution/worker-boundary.lisp\" :MD5
   #A((32) BASE-CHAR . \"c24065d6c8d80d1be53994a0041743df\"))
  (:FILE \"src/execution/worker-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"babd0a78b4185af24ae1fef870c0fabb\"))
  (:FILE \"src/execution/worker-run.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa34ca6bc07535e35fea723878d99f66\"))
  (:FILE \"src/execution/worker-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"0679ee07c46f69db330706303c70d8d2\"))
  (:FILE \"src/execution/writer.lisp\" :MD5
   #A((32) BASE-CHAR . \"73019644090e2971f2b54dc36e4491f5\"))
  (:FILE \"src/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca642ea47e4bff76f78f5b6d7287d6bd\"))
  (:FILE \"src/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"a06115175f450776762761dce25acdb8\"))
  (:FILE \"src/foundation/conditions.lisp\" :MD5
   #A((32) BASE-CHAR . \"942b596396c19815290a57830af2121b\"))
  (:FILE \"src/foundation/crc32c.lisp\" :MD5
   #A((32) BASE-CHAR . \"4db58e2f48bf77d751f1b83bb9f84b5c\"))
  (:FILE \"src/foundation/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"5ee593a112958d94163dab17c5aa4ba2\"))
  (:FILE \"src/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"c3ed0f09fa3fa6fe20c98e2ed6e69abe\"))
  (:FILE \"src/get-directory/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"cde24b2bf5c5637d5501b95bed47df31\"))
  (:FILE \"src/get-directory/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a05062f6ab6d5ebdfdde37e336dfce6\"))
  (:FILE \"src/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"74a694385f1aaf03ec87721545494119\"))
  (:FILE \"src/get-directory/sources-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"2b8193aab6801de19e26fa55e7c53f87\"))
  (:FILE \"src/get-directory/sources-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"7bac02a80ddc22c622f8465642385ae8\"))
  (:FILE \"src/get-directory/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"17c957d6934a31f4ed64313e756de2d2\"))
  (:FILE \"src/get-resolver/active-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"c65593cf172f53a8e90a853bbe9504c2\"))
  (:FILE \"src/get-resolver/active-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"6d95f29b331d335175843f47ae44a6ea\"))
  (:FILE \"src/get-resolver/active-init.lisp\" :MD5
   #A((32) BASE-CHAR . \"7ca975d2534f43c8018d36ecd7c2b042\"))
  (:FILE \"src/get-resolver/active-preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"f13d422adb6aa9e8489352884137f25a\"))
  (:FILE \"src/get-resolver/active-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"521737861e057d663964b0c030552587\"))
  (:FILE \"src/get-resolver/active-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6aaec49504a96f37c8ff1bc182c977b\"))
  (:FILE \"src/get-resolver/active-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"60bb258cf4cc7f50c5c1206af1bb5800\"))
  (:FILE \"src/get-resolver/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbfb2082103e6712419e180ab972245c\"))
  (:FILE \"src/get-resolver/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"263525e8274a8f46ce58a4a0ad6841a2\"))
  (:FILE \"src/get-resolver/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"1339edff0223dbf122f11ff0adbba61c\"))
  (:FILE \"src/get-resolver/rows.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca9002b81efd0aed9761cd1f78514762\"))
  (:FILE \"src/get-resolver/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"536e9dc4ed51072b8a6d1528d3ec18bf\"))
  (:FILE \"src/get-resolver/sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d869293ba47444c4721713d955c6254\"))
  (:FILE \"src/get-resolver/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"9df13bcc6908e9fa601d173a671e1ccf\"))
  (:FILE \"src/get/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"c5cc36884b238221cc13ca0c087ec7c2\"))
  (:FILE \"src/get/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"e70bfeddd694336bbd088e65f8761834\"))
  (:FILE \"src/get/lookup.lisp\" :MD5
   #A((32) BASE-CHAR . \"82258ec87aca513a508bc5dee8410dd6\"))
  (:FILE \"src/get/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"c72633d15c3488699072eb610ebde7c8\"))
  (:FILE \"src/get/segment.lisp\" :MD5
   #A((32) BASE-CHAR . \"811869eb6a197d3c4e26af4322e52652\"))
  (:FILE \"src/get/target.lisp\" :MD5
   #A((32) BASE-CHAR . \"1b70dac05d6d2418909eb5105b808e81\"))
  (:FILE \"src/get/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"c394e5684de5e2d938991c7cb348b93c\"))
  (:FILE \"src/hash/arithmetic.lisp\" :MD5
   #A((32) BASE-CHAR . \"b5c51802e607e3dd22de68204baf64e9\"))
  (:FILE \"src/hash/blocks.lisp\" :MD5
   #A((32) BASE-CHAR . \"bef497b9a267c7306d4100000491c814\"))
  (:FILE \"src/hash/hash64.lisp\" :MD5
   #A((32) BASE-CHAR . \"886b7c08b9929283e8968831cbe5c039\"))
  (:FILE \"src/hash/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d9060e41bc5252067d35e59ac70ee06\"))
  (:FILE \"src/index/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"65076c355c099b5dc73d185948d3bec4\"))
  (:FILE \"src/index/hash-digests.lisp\" :MD5
   #A((32) BASE-CHAR . \"43d2209225707352daec6186ef95a805\"))
  (:FILE \"src/index/hash-seed.lisp\" :MD5
   #A((32) BASE-CHAR . \"45ce41749bc6fa638539815d3f802b96\"))
  (:FILE \"src/index/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"598a9b65e73151c924b2cdcaf6d96705\"))
  (:FILE \"src/index/primary-arena.lisp\" :MD5
   #A((32) BASE-CHAR . \"a319691e3e28b7ea7b927de490cf69ba\"))
  (:FILE \"src/index/primary-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff2cfbb865290d7a1510fdf6877c7229\"))
  (:FILE \"src/index/primary-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa52433eae199ceeb874bf2bc47afca7\"))
  (:FILE \"src/index/primary-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"1dd67c527257e43f17e006644ecdbd00\"))
  (:FILE \"src/index/primary-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d65cfce399b04f905bf969929962e59a\"))
  (:FILE \"src/index/primary-probe.lisp\" :MD5
   #A((32) BASE-CHAR . \"699ce3f1615296fc27fcde3e0d63a4bc\"))
  (:FILE \"src/index/primary-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"3f317a0d3c5ee86a73651aad36135cc3\"))
  (:FILE \"src/index/primary-relocate.lisp\" :MD5
   #A((32) BASE-CHAR . \"5155959766645d3172ae5e73c58cc071\"))
  (:FILE \"src/index/primary-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a59eab6425a60fa2656f86bf87d5c9ac\"))
  (:FILE \"src/index/primary-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"e8e31e599356e592af29c0cc4604872b\"))
  (:FILE \"src/index/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"5b22b90cfe8534086f6aff96d156713e\"))
  (:FILE \"src/index/rebuild-budget.lisp\" :MD5
   #A((32) BASE-CHAR . \"0417dd41cb3ec1d62dfd913c19f810ad\"))
  (:FILE \"src/index/rebuild-copy.lisp\" :MD5
   #A((32) BASE-CHAR . \"8befbbd00ed5c31c1487a11887eba495\"))
  (:FILE \"src/index/rebuild-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"1188e7a64a7a5d9482c1233cb9acb452\"))
  (:FILE \"src/index/rebuild.lisp\" :MD5
   #A((32) BASE-CHAR . \"a450cac8071513365267e7024cbe94b0\"))
  (:FILE \"src/index/relocate.lisp\" :MD5
   #A((32) BASE-CHAR . \"475dd7d5809a836f01544b447cc8df27\"))
  (:FILE \"src/index/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"5157fd03ee806ee998ad8f0002d56268\"))
  (:FILE \"src/index/validation.lisp\" :MD5
   #A((32) BASE-CHAR . \"3384cadf737c7d80c004222022a281f6\"))
  (:FILE \"src/index/write.lisp\" :MD5
   #A((32) BASE-CHAR . \"f0c8c579cd7db466d243ed3ea9f8e8aa\"))
  (:FILE \"src/io/flush.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbb059997772b42708272debc4d29c4b\"))
  (:FILE \"src/io/identity-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"d354a095fb378c1b6f27397ffb902227\"))
  (:FILE \"src/io/identity.lisp\" :MD5
   #A((32) BASE-CHAR . \"4e03b14a0c5015dc6ec897221c9f0eb5\"))
  (:FILE \"src/io/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"fc1cbc7b30e0d74c359e9ee1bbd201ec\"))
  (:FILE \"src/io/namespace.lisp\" :MD5
   #A((32) BASE-CHAR . \"8898b56d45e22212f1db37f208230f34\"))
  (:FILE \"src/io/native-namespace.lisp\" :MD5
   #A((32) BASE-CHAR . \"4c0c79a243bd691d3a602afd89b77980\"))
  (:FILE \"src/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"58030bc0c811248a6537e2909d8762d6\"))
  (:FILE \"src/io/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d5458684a1b169bacc46bc87fdaffed4\"))
  (:FILE \"src/io/rename.lisp\" :MD5
   #A((32) BASE-CHAR . \"40a1415771121f68afaa5165a0c23465\"))
  (:FILE \"src/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"ee2b4b86f91e1b61f7e5a36abe34ce9b\"))
  (:FILE \"src/io/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"95e28214f3629b7f4088b471ea22ce09\"))
  (:FILE \"src/mvcc/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f188d1dbd5d0adb49f53acf09157aef9\"))
  (:FILE \"src/mvcc/snapshots-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"8bb066aab61a18eff175b9edb11e42a2\"))
  (:FILE \"src/mvcc/snapshots-csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"0e9365e674d1584b111f915ce1f58634\"))
  (:FILE \"src/mvcc/snapshots-lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff98aea5cb9a7ae2671f6a887a003725\"))
  (:FILE \"src/mvcc/snapshots-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"ae3ad96269b5e711a9dbb455f3c0ce48\"))
  (:FILE \"src/mvcc/snapshots-register.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d5a795bcefd605c75da91c725ae83a2\"))
  (:FILE \"src/mvcc/snapshots-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"475517bd7ba04a1c37a82efeb8ff73d9\"))
  (:FILE \"src/mvcc/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a9bc70eab6720b5c6f8503178e2c966b\"))
  (:FILE \"src/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"becf5c78049c85f2c05cd1ef54454032\"))
  (:FILE \"src/read/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"4040905f4a64ba704a480d82e87ec748\"))
  (:FILE \"src/read/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7d74d9decc5a0bc9f9331d89bd503e21\"))
  (:FILE \"src/read/task.lisp\" :MD5
   #A((32) BASE-CHAR . \"9e0baf22c53329d393e047c669679645\"))
  (:FILE \"src/read/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"9c37ff8237fcc9fe9ae4f44316e854e3\"))
  (:FILE \"src/recovery-active/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"3df4fbfa866a44b320da4bc3da38789a\"))
  (:FILE \"src/recovery-active/closure.lisp\" :MD5
   #A((32) BASE-CHAR . \"b154d3d29f80146d895a99d84c2e9741\"))
  (:FILE \"src/recovery-active/frames.lisp\" :MD5
   #A((32) BASE-CHAR . \"493993aaec139f7aef9ede131dcd410a\"))
  (:FILE \"src/recovery-active/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1c3c71bdd0f168e151514caed4f469c\"))
  (:FILE \"src/recovery-active/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"b52b8ebacf81aa225b6ea417c4a0e6ac\"))
  (:FILE \"src/recovery-active/query.lisp\" :MD5
   #A((32) BASE-CHAR . \"04a6d2a8201256453b28b9785981a6d1\"))
  (:FILE \"src/recovery-active/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"1dc488f2e6f12feef9a0fe29c3bd7c60\"))
  (:FILE \"src/recovery-active/resolve.lisp\" :MD5
   #A((32) BASE-CHAR . \"81e35c3b0b15f92ecbe17fcd1e7715b9\"))
  (:FILE \"src/recovery-active/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"213f5f7b0442bfa1bfdd73b6ff54df01\"))
  (:FILE \"src/recovery/decisions-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"1a51ef4a488bb9fde2ff7d47bae01379\"))
  (:FILE \"src/recovery/decisions-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"cbdc30f93109c474e1fc25066c9b9b13\"))
  (:FILE \"src/recovery/decisions-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"f782d1137b8ce342b91c9999cfb7accc\"))
  (:FILE \"src/recovery/decisions-radix.lisp\" :MD5
   #A((32) BASE-CHAR . \"852149de4c289b8e067602780378d87a\"))
  (:FILE \"src/recovery/decisions-sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"b33e57a643f2fca810846f6226366253\"))
  (:FILE \"src/recovery/decisions-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f4433fd19ebc7239dbc2628c39f3ecdb\"))
  (:FILE \"src/recovery/inventory-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"9bd6820c4feba3e552aab1a4edd87861\"))
  (:FILE \"src/recovery/inventory-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"fcea263de1938767772e5b11411ecd5e\"))
  (:FILE \"src/recovery/inventory-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"78c136d5838dcfe3019d9069643a8d8f\"))
  (:FILE \"src/recovery/manifest-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bf65b1731eab6e0572461ef5cc60fc40\"))
  (:FILE \"src/recovery/manifest-decode.lisp\" :MD5
   #A((32) BASE-CHAR . \"67975249aaabd751757cdfb9222cc3c4\"))
  (:FILE \"src/recovery/manifest-fold.lisp\" :MD5
   #A((32) BASE-CHAR . \"e0d2498db1011e857b7b0daa1934f187\"))
  (:FILE \"src/recovery/manifest-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1d7d05fce907e6be7a34857ee168b01d\"))
  (:FILE \"src/recovery/manifest-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"ebd7a54adea2213294a887e6d4db0927\"))
  (:FILE \"src/recovery/manifest-transition.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa19e7689d3b74a5c861d95286b9f7c9\"))
  (:FILE \"src/recovery/manifest-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"7b1d4054415faca7e5fca59ad83b4d4a\"))
  (:FILE \"src/recovery/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1c1c8ad0cd15b1703a2fe19cbf3f13c2\"))
  (:FILE \"src/recovery/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"fcacd15460db25ea9cc4036065f9f096\"))
  (:FILE \"src/scheduler/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"36c5ae2dd08fbe546f4392b7b12102ec\"))
  (:FILE \"src/scheduler/lifecycle-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"1c4a4fd316ef034c298db47dfca1daca\"))
  (:FILE \"src/scheduler/lifecycle-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"19c8be44863be30c07bb72fe3fac2a99\"))
  (:FILE \"src/scheduler/lifecycle-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa2f88c50dfec24af40af091f9221590\"))
  (:FILE \"src/scheduler/lifecycle-update.lisp\" :MD5
   #A((32) BASE-CHAR . \"40a78461f91616a935a39f29b87680c8\"))
  (:FILE \"src/scheduler/lifecycle-worker.lisp\" :MD5
   #A((32) BASE-CHAR . \"9d7cdf45c1b594fef5af735ec0955c05\"))
  (:FILE \"src/scheduler/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"0578c541b6ddfaf8827240e967ff76ea\"))
  (:FILE \"src/scheduler/policy.lisp\" :MD5
   #A((32) BASE-CHAR . \"1721005a7545b36df601d75252638eba\"))
  (:FILE \"src/scheduler/pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4995b29d40caa2ee29aa0c167885287\"))
  (:FILE \"src/scheduler/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"170dfc36aef6a3d78f980fbcc37f0176\"))
  (:FILE \"src/scheduler/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"981f9f6db268cd9a46d4239c677c5d5b\"))
  (:FILE \"src/scheduler/update.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a43e6b400b701c69286357ef85469fc\"))
  (:FILE \"src/series/events.lisp\" :MD5
   #A((32) BASE-CHAR . \"32b2156739a6f2ca996abb91df0a2603\"))
  (:FILE \"src/series/io-events.lisp\" :MD5
   #A((32) BASE-CHAR . \"b6026a8b7bb64b45c37a65effda70d8e\"))
  (:FILE \"src/series/ownership.lisp\" :MD5
   #A((32) BASE-CHAR . \"de1aca16a35d34d16aba12ff541c0d2b\"))
  (:FILE \"src/series/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"09653c7479e1498d1545f3f1f0ffd755\"))
  (:FILE \"src/series/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6977aba53c811ec3a373226f9f53795\"))
  (:FILE \"src/series/query.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb0d91405325b508e6b2ab24d178de7a\"))
  (:FILE \"src/series/retirement.lisp\" :MD5
   #A((32) BASE-CHAR . \"b8e04971b8ad75a1bd0c722997badfd2\"))
  (:FILE \"src/series/routing-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6924deff152b941bd49f0bb200b4197\"))
  (:FILE \"src/series/routing-select.lisp\" :MD5
   #A((32) BASE-CHAR . \"e0f987d8767744050ec4d1b3ecb699ed\"))
  (:FILE \"src/series/routing-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ce649df47dd38888d5103c98345f7e41\"))
  (:FILE \"src/series/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab19ec8d15af91511e817858c41cebc8\"))
  (:FILE \"src/series/worker-boundary.lisp\" :MD5
   #A((32) BASE-CHAR . \"2340e0c9074f7b1bf80c74f774986bc5\"))
  (:FILE \"src/series/worker-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a93ce2e84e8aee647b5083ad1d2b899b\"))
  (:FILE \"src/series/worker-run.lisp\" :MD5
   #A((32) BASE-CHAR . \"f0fee18adf357bad98e8a3c3e8c70c0c\"))
  (:FILE \"src/series/worker-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"2b23d468be0165fa009c5ebd5d1bbe23\"))
  (:FILE \"src/storage/compaction-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"1cda77a357ab2147035993b72d135a37\"))
  (:FILE \"src/storage/control-payload.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb64f806b8d69eb42d865b4abfff0b27\"))
  (:FILE \"src/storage/formats.lisp\" :MD5
   #A((32) BASE-CHAR . \"061147be459d8d3b08c661bd3f91d152\"))
  (:FILE \"src/storage/log-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"b53d27dcc9f4badf18b50519c50bc614\"))
  (:FILE \"src/storage/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f86bd104f20616a76b42c02227f72844\"))
  (:FILE \"src/storage/payload-record.lisp\" :MD5
   #A((32) BASE-CHAR . \"8c03f9c01dcb30f2d3970a5694968ecf\"))
  (:FILE \"src/storage/payload-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4ece3c4fa8d9492d2a80df7c0a4f5a0\"))
  (:FILE \"src/storage/segment-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6812fa59bf8fd1252fbf85a9bfa3896\"))
  (:FILE \"src/wal/builder.lisp\" :MD5
   #A((32) BASE-CHAR . \"a229f76f7036f3573a6e528dcd390a19\"))
  (:FILE \"src/wal/csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"42b990e3b254e6fb488c0ab91b6a6502\"))
  (:FILE \"src/wal/executor.lisp\" :MD5
   #A((32) BASE-CHAR . \"c0340924c9130e14d0e8efedeec078f1\"))
  (:FILE \"src/wal/group.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a0e7c99ab70b4720cbb091156560f5e\"))
  (:FILE \"src/wal/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"96c41b1d417135a24fc65659ea3abe11\"))
  (:FILE \"src/wal/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f799f27a8ac1a4c736c04796c1e543f9\"))
  (:FILE \"tests/codec/cbor-array-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"eaff7126d31032812b816d96beed2d1d\"))
  (:FILE \"tests/codec/cbor-array-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"d799a632098e68b3c2d61d415ac7fd45\"))
  (:FILE \"tests/codec/cbor-array-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"b9d14be96752dcf8318c82878549672c\"))
  (:FILE \"tests/codec/cbor-float-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"19e60c5edb24fae449ebbe831bc1b1e8\"))
  (:FILE \"tests/codec/cbor-float-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"5590458e8334cd9774fd212297407308\"))
  (:FILE \"tests/codec/cbor-float-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"e62412cb0e838b241383a5c9103dd2c2\"))
  (:FILE \"tests/codec/cbor-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"208ee0d03652de67ad453bdd34d10b62\"))
  (:FILE \"tests/codec/cbor-map-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"074efafd791f68caf5779b0ccb16a2b3\"))
  (:FILE \"tests/codec/cbor-map-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"6591b26b30365cac76ba0927c090f343\"))
  (:FILE \"tests/codec/cbor-map-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"5478566e25301bda7467493b25194ac2\"))
  (:FILE \"tests/codec/cbor-minimal-edges.lisp\" :MD5
   #A((32) BASE-CHAR . \"392d402b44d04a9ce1c95fef4c4e8bf9\"))
  (:FILE \"tests/codec/cbor-minimal-scan-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"16954ef22a2169e6f9f6de0e9ab187ab\"))
  (:FILE \"tests/codec/cbor-minimal-scan-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"d59e1b8152cbaf0dbf4a6cea649cb611\"))
  (:FILE \"tests/codec/cbor-minimal-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"34587c10ac32129ac531e0a4f03df9a6\"))
  (:FILE \"tests/codec/cbor-minimal-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d7ec43e187859da277b8fb5f66f8e73\"))
  (:FILE \"tests/codec/cbor-minimal-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"5b145690222d1b50984f1a284f118a7e\"))
  (:FILE \"tests/codec/cbor-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"2311a15f8d4af90bf341e91e0e64342b\"))
  (:FILE \"tests/codec/cbor-simple-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"c92e59ed693525e8e3b53656d005e82e\"))
  (:FILE \"tests/codec/cbor-simple-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"5c44f9bcb54dcef327c88156a358313f\"))
  (:FILE \"tests/codec/cbor-simple-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"808ed81b703fd2cf0ac11d148c3ffc08\"))
  (:FILE \"tests/codec/cbor-string-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"07c96de5ded8b12d0db3f8d2dcbfbb1d\"))
  (:FILE \"tests/codec/cbor-string-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"82cf8ab7c6ffb9f1a717d5ba41004b49\"))
  (:FILE \"tests/codec/cbor-string-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"70d9d0d454dd1f296ef6989d3b928842\"))
  (:FILE \"tests/codec/cbor-structure-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"220d386d29b1fa192e06ceebe4ec245c\"))
  (:FILE \"tests/codec/cbor-structure-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"5f103dd263bcacb7b3c6bf0455157fa9\"))
  (:FILE \"tests/codec/cbor-structure.lisp\" :MD5
   #A((32) BASE-CHAR . \"06e6f060aea55a18d06047e5ebabd18e\"))
  (:FILE \"tests/codec/cbor-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e5da97609a2ba58bb35fea24b7518d2b\"))
  (:FILE \"tests/codec/cbor-tag-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"10fe18f5f9280f0de45a56de78114dae\"))
  (:FILE \"tests/codec/cbor-tag-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"f339e28bda3d94cc8f58589999988a6d\"))
  (:FILE \"tests/codec/cbor-tag-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"d697c11e86af9e64a3519707b58aad82\"))
  (:FILE \"tests/codec/cbor-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"d3b8d19096d8d0bab30c0a54e077c7f3\"))
  (:FILE \"tests/codec/cbor-write-roundtrip.lisp\" :MD5
   #A((32) BASE-CHAR . \"646944ef624c06fd86d6a1306041349d\"))
  (:FILE \"tests/codec/cbor-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"13382bdf23e5501e0ca349faf7b05062\"))
  (:FILE \"tests/codec/cbor-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa864f83784e5976a38a43e2a79b7c6b\"))
  (:FILE \"tests/codec/cbor-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"dffa6e75d8c3d7f991f6c4460eb8b9bc\"))
  (:FILE \"tests/codec/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"32534fd42dd8124b50b45deefe143eaf\"))
  (:FILE \"tests/codec/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"5b025b0cfe065c5d934bf0901433ef04\"))
  (:FILE \"tests/codec/utf8.lisp\" :MD5
   #A((32) BASE-CHAR . \"767ead15603be8dce90f340dbb200d8f\"))
  (:FILE \"tests/control/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"8611febd980cadd28945367b979d2392\"))
  (:FILE \"tests/control/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"019432427c5aacfc29d6366032a1ce83\"))
  (:FILE \"tests/control/recovery-publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"37426d589ee6fc5555a28f4d4d5bfc55\"))
  (:FILE \"tests/control/recovery-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"1355e6a03a4ce889031b4c6a9ccb183a\"))
  (:FILE \"tests/control/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"756de79a8b15f4ed479b3206b1ac6d5a\"))
  (:FILE \"tests/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"1d9133c5fd33cb60ff160f468db330f4\"))
  (:FILE \"tests/csn/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e5c151cda2e10e4f9cae46a4326699eb\"))
  (:FILE \"tests/csn/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"087108576603e6cd5b9af14b50475746\"))
  (:FILE \"tests/epochs/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe92ddd79dcaab3d3f7bdf387bf2295e\"))
  (:FILE \"tests/epochs/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"592a2fe2e22214c52d4672d26620980b\"))
  (:FILE \"tests/epochs/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"67cec074bf70074f7f2c6965ef494ba8\"))
  (:FILE \"tests/execution/handoff.lisp\" :MD5
   #A((32) BASE-CHAR . \"f87fdc0f7bd194329c6349026a2f35bb\"))
  (:FILE \"tests/execution/queue.lisp\" :MD5
   #A((32) BASE-CHAR . \"940ebb450bc871f8c2dd7dc9977bb158\"))
  (:FILE \"tests/execution/ready-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"4ccdc0512b3c81837726076d7c795930\"))
  (:FILE \"tests/execution/ready.lisp\" :MD5
   #A((32) BASE-CHAR . \"f6756125a9150b6312dad3e2705b74d3\"))
  (:FILE \"tests/execution/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"bacb1a135c0d73cded57ba21986c8496\"))
  (:FILE \"tests/execution/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"99e06430f652a655a9c029847f9fa345\"))
  (:FILE \"tests/execution/worker.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbaa592327d730fdae78cb881350efe0\"))
  (:FILE \"tests/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"29fc6a9711ea9265840e8cde4971f74e\"))
  (:FILE \"tests/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"07c4c9ac2177f22e5b7fb25f9867a133\"))
  (:FILE \"tests/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a84ca3aa74ab158c6b7d66886cf8b23\"))
  (:FILE \"tests/foundation/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"758adad069aec2f9dbe0635797314ff6\"))
  (:FILE \"tests/get-active/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"447bcc0feb60a5a668474060df098cd7\"))
  (:FILE \"tests/get-active/directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"0de1b79cfcdf9dd19a4336c745726576\"))
  (:FILE \"tests/get-active/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"961c0d8fe5ba267150701a9914369e57\"))
  (:FILE \"tests/get-active/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"da12d6e2b34116951e37764beab59c2a\"))
  (:FILE \"tests/get-active/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"9cbecf43fcd898db4f74826bf2c29fa3\"))
  (:FILE \"tests/get-directory/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"1137938073e71d6d8d62c751fbad05d5\"))
  (:FILE \"tests/get-directory/lifetime-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"074ccd2fc80ba020ef8c13f07c1beb42\"))
  (:FILE \"tests/get-directory/lifetime.lisp\" :MD5
   #A((32) BASE-CHAR . \"f40cde2709b2d93525fa8b8a73cc13d8\"))
  (:FILE \"tests/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"d1ab36d05cc1266e4533d27c693f12f4\"))
  (:FILE \"tests/get-directory/series-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"486604b450bfe8de32feaed1a96dc0cc\"))
  (:FILE \"tests/get-directory/series-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"092192d05b3f85c6c283113c57c02f01\"))
  (:FILE \"tests/get-directory/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"5e47378b562314a863ea850da186b12a\"))
  (:FILE \"tests/get-directory/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"63dd01c852de1399c2c82274d481d257\"))
  (:FILE \"tests/get-performance/guards.lisp\" :MD5
   #A((32) BASE-CHAR . \"324c70304e678cbe022ff33c73f793e2\"))
  (:FILE \"tests/get-performance/paths.lisp\" :MD5
   #A((32) BASE-CHAR . \"eb48216a4b5baa9cf498968ee032b205\"))
  (:FILE \"tests/get-performance/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f5f9fa3ffcc3220f10b7a5f294ee6d9\"))
  (:FILE \"tests/get-performance/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"916e5740db5d52fdf6088694f34d11db\"))
  (:FILE \"tests/get-resolver/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"a64a6a5a34c8ec5f8c4ca4324cc348d2\"))
  (:FILE \"tests/get-resolver/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"e93c7dbf1bf2d7e99651b110a4e01661\"))
  (:FILE \"tests/get-resolver/sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"ffe3551bb49dd60d7d34213c9c93cf06\"))
  (:FILE \"tests/get-resolver/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"0738e161d276394a160a86ed139610f2\"))
  (:FILE \"tests/get/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"3a4bbc3fd3ede5a837f0c0f913637291\"))
  (:FILE \"tests/get/segment.lisp\" :MD5
   #A((32) BASE-CHAR . \"2f25d1904aa4960ce0d6351580a2bcc7\"))
  (:FILE \"tests/get/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"660783988d4f99d0e171bb59c79e3467\"))
  (:FILE \"tests/hash/guards.lisp\" :MD5
   #A((32) BASE-CHAR . \"a59d531a156fc49c39c9265075bd9600\"))
  (:FILE \"tests/hash/hash64.lisp\" :MD5
   #A((32) BASE-CHAR . \"443fdc895f2fa3620d2b1b4af5c32dc4\"))
  (:FILE \"tests/hash/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"40b223712554582c2910971a6b045149\"))
  (:FILE \"tests/hash/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"73ed0785ca1330d69ad336abc019a413\"))
  (:FILE \"tests/index/hash-digests.lisp\" :MD5
   #A((32) BASE-CHAR . \"91c1eda35e14276e795259bceac489be\"))
  (:FILE \"tests/index/primary-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"44e2635d88de3f6ccf69c684c3eff77b\"))
  (:FILE \"tests/index/primary-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d339c2f2680e66ac79ecd8d02c09382\"))
  (:FILE \"tests/index/primary.lisp\" :MD5
   #A((32) BASE-CHAR . \"6ed661242a86117dd2d696e374740a2f\"))
  (:FILE \"tests/index/rebuild.lisp\" :MD5
   #A((32) BASE-CHAR . \"262556582cc0c387d6c59b757d9956b1\"))
  (:FILE \"tests/index/slot-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6ed9249e2eaef3524260804ef7e02567\"))
  (:FILE \"tests/index/slot-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"e9b53e6eac6fc836e8243d41adbafea0\"))
  (:FILE \"tests/index/slots.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe094b4513ceabe8571031ac20935e48\"))
  (:FILE \"tests/io/flush-failure.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa9f0dcf1a0bbd827af0918f8c9816e4\"))
  (:FILE \"tests/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"1e6fd9ab36eb4e307207d371ed947757\"))
  (:FILE \"tests/io/rename-native.lisp\" :MD5
   #A((32) BASE-CHAR . \"d79c13ea447cd8694b14bc6391d7e3ee\"))
  (:FILE \"tests/io/rename.lisp\" :MD5
   #A((32) BASE-CHAR . \"87acf2a7abb532d41aef472600184643\"))
  (:FILE \"tests/io/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"a26526e87fe46794b8bbab1fdd46d68c\"))
  (:FILE \"tests/io/transfer-failure.lisp\" :MD5
   #A((32) BASE-CHAR . \"c9da7d7deac220b193b38dcabe0f6bd6\"))
  (:FILE \"tests/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab2fb36682dd8b8bc757e586ceb3be62\"))
  (:FILE \"tests/lint-fixtures/bad.lisp\" :MD5
   #A((32) BASE-CHAR . \"30f1396c941dd9b8a41ca15698b5a347\"))
  (:FILE \"tests/lint-fixtures/good.lisp\" :MD5
   #A((32) BASE-CHAR . \"f85250c3a057c851db6745b9eba27da1\"))
  (:FILE \"tests/lint-fixtures/keyword-barrier.lisp\" :MD5
   #A((32) BASE-CHAR . \"9f63fdfdf866f17d5491390b710ebb5e\"))
  (:FILE \"tests/lint-fixtures/qualified-reader.lisp\" :MD5
   #A((32) BASE-CHAR . \"7fc689336bb2041dfef4c22090bb7de4\"))
  (:FILE \"tests/mvcc/capture.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f0309fa9258eb62a45167de5d2279d5\"))
  (:FILE \"tests/mvcc/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"341627288b50485858efedc207fc95b5\"))
  (:FILE \"tests/mvcc/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e7d26bd67650663c88ceda526023ae83\"))
  (:FILE \"tests/read/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"73dab63d8414998d72f6c14e0d62e3ac\"))
  (:FILE \"tests/read/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"0d5db03bd804747de7c309c82e40dd43\"))
  (:FILE \"tests/read/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"0cf2cad12c77c82b827da01782bc996d\"))
  (:FILE \"tests/recovery/corruption.lisp\" :MD5
   #A((32) BASE-CHAR . \"a369b8176d4e877ab546d17e983b94ed\"))
  (:FILE \"tests/recovery/decisions-audit.lisp\" :MD5
   #A((32) BASE-CHAR . \"33b98cf215d1ddb469d02cc6c0032bfe\"))
  (:FILE \"tests/recovery/decisions-radix.lisp\" :MD5
   #A((32) BASE-CHAR . \"58eec0feac01e643c76ad19ef5c07df5\"))
  (:FILE \"tests/recovery/decisions-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"80348d0ce2adbc8a4d37db49df291b1d\"))
  (:FILE \"tests/recovery/decisions.lisp\" :MD5
   #A((32) BASE-CHAR . \"5add0e087181bad8ce330af23fc26686\"))
  (:FILE \"tests/recovery/inventory-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"522afcdc6115fdd4d8fec0d06aab7354\"))
  (:FILE \"tests/recovery/inventory.lisp\" :MD5
   #A((32) BASE-CHAR . \"9c78925dd89e94d86a9f577e0225eeb3\"))
  (:FILE \"tests/recovery/manifest-audit.lisp\" :MD5
   #A((32) BASE-CHAR . \"3ca73a199708e2571da3a27e6dc00c76\"))
  (:FILE \"tests/recovery/manifest-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"3286e0dfb66496aafe8b6fbbdd92ab43\"))
  (:FILE \"tests/recovery/manifest-transition.lisp\" :MD5
   #A((32) BASE-CHAR . \"84b53d783522e179d8c8e798d0b5146e\"))
  (:FILE \"tests/recovery/manifest.lisp\" :MD5
   #A((32) BASE-CHAR . \"b6bdcc4d20f7db14c0dc00d5258cbf8c\"))
  (:FILE \"tests/recovery/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa7af12d270673b62542d32ec60b361a\"))
  (:FILE \"tests/recovery/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"769bac1994a5e3d74bd56b510970bf9b\"))
  (:FILE \"tests/scheduler/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"bc20dcd712332fde961fb38e879392b5\"))
  (:FILE \"tests/scheduler/dispatch.lisp\" :MD5
   #A((32) BASE-CHAR . \"0235bb18cc7a6169e47d3aebf2438bdd\"))
  (:FILE \"tests/scheduler/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"1388f446bce5085439c2254edd165118\"))
  (:FILE \"tests/scheduler/pool-begin.lisp\" :MD5
   #A((32) BASE-CHAR . \"5fe1f60cddf25dc099d80f843285018d\"))
  (:FILE \"tests/scheduler/pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"aaba914dea485f812a11767addb94c81\"))
  (:FILE \"tests/scheduler/pool-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"8c1264656e39ff936f904948f6b36802\"))
  (:FILE \"tests/scheduler/pool-step.lisp\" :MD5
   #A((32) BASE-CHAR . \"b8423d1625f5d07501ccbc4c231c622d\"))
  (:FILE \"tests/scheduler/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"34e51e369859bc1c731d73e43053b6f4\"))
  (:FILE \"tests/series/boundaries.lisp\" :MD5
   #A((32) BASE-CHAR . \"6967c7e6396b6df38c637f2d5d9ebfc0\"))
  (:FILE \"tests/series/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"a83818568a27c52d36365597d7113c09\"))
  (:FILE \"tests/series/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6aa566720d1476d13a0f7288be9e1346\"))
  (:FILE \"tests/series/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"67718445a8948da3c7875f6cc6b3e167\"))
  (:FILE \"tests/series/worker-bridge.lisp\" :MD5
   #A((32) BASE-CHAR . \"c714c8db7998acf60256b318488574d8\"))
  (:FILE \"tests/series/worker-routing.lisp\" :MD5
   #A((32) BASE-CHAR . \"f839733b6f5a4d9286a5cdd7ae9bcb55\"))
  (:FILE \"tests/smoke.lisp\" :MD5
   #A((32) BASE-CHAR . \"afb2e2bc7ff7249ebb2e1ccf0f87aaf3\"))
  (:FILE \"tests/storage/compaction-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb4acb5a73eb973f53ef337113880d32\"))
  (:FILE \"tests/storage/control-payload.lisp\" :MD5
   #A((32) BASE-CHAR . \"25f3c822273c898d2263ceb3db538cab\"))
  (:FILE \"tests/storage/log-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"eecb2fe94e710a918254e5ad453a0daa\"))
  (:FILE \"tests/storage/segment-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab2c52fb6b79702d50dcef6d12ca8906\"))
  (:FILE \"tests/storage/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"82a4dbb4767c17f9851143a637af3b83\"))
  (:FILE \"tests/wal/builder.lisp\" :MD5
   #A((32) BASE-CHAR . \"0d01e4e18c0a559873fce584a0ac91cd\"))
  (:FILE \"tests/wal/csn-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"ecb2cbf4f7ace32cdaff329476070d60\"))
  (:FILE \"tests/wal/csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"3e2dbc3319b611db090e27493a10fc2c\"))
  (:FILE \"tests/wal/fault.lisp\" :MD5
   #A((32) BASE-CHAR . \"00367366b82918614d84f517f4bb395e\"))
  (:FILE \"tests/wal/group.lisp\" :MD5
   #A((32) BASE-CHAR . \"0ee2462103a749b58488561aeacaac07\"))
  (:FILE \"tests/wal/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"0643b96c5ee339f9826b19150d065ddf\"))
  (:FILE \"tests/wal/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"15952f6b761acea4519abf701bb2346c\"))
  (:FILE \"tools/measure-pool-step.lisp\" :MD5
   #A((32) BASE-CHAR . \"2e176e89639e71da83393559c8f9999c\")))
 :SOURCE-CONSISTENCY :STABLE :RECORDED-AT 4001032438 :SELF-TEST
 (:STATUS :OK :SHARED-SENSOR
  (:STATUS :OK :BASELINE
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096 :WARMUP-ITERATIONS
    128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS 36 :SECONDS 3.6d-5
    :TIME-QUALITY :MEASURED :SINK 8386560 :DIAGNOSTIC NIL :EXPECTED-SINK
    8386560)
   :POSITIVE-CONTROL
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 16 :WARMUP-ITERATIONS 0
    :COMPLETED-ITERATIONS 16 :HEAP-BYTES 16777472 :RAW-TICKS 40 :SECONDS 4.0d-5
    :TIME-QUALITY :MEASURED :SINK 16777336 :DIAGNOSTIC NIL :EXPECTED-SINK
    16777336)
   :WRONG-SINK-PROBE
   (:REPLICA 0 :STATUS :EXPECTED-REJECTION :STAGE :MEASURED :ITERATIONS 2
    :WARMUP-ITERATIONS 0 :COMPLETED-ITERATIONS 2 :HEAP-BYTES 0 :RAW-TICKS 0
    :SECONDS NIL :TIME-QUALITY :BELOW-RESOLUTION :SINK 3 :DIAGNOSTIC
    #A((50) BASE-CHAR . \"COD-60: heap/clock negativo o sink 3 diverso da 1.\")
    :EXPECTED-SINK 1)
   :ZERO-CLOCK-PROBE
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 2 :WARMUP-ITERATIONS 0
    :COMPLETED-ITERATIONS 2 :HEAP-BYTES 0 :RAW-TICKS 0 :SECONDS NIL
    :TIME-QUALITY :BELOW-RESOLUTION :SINK 1 :DIAGNOSTIC NIL :EXPECTED-SINK 1)
   :COMPOSED-API-PROBE
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
    :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 5 :SECONDS 5.0d-6
    :TIME-QUALITY :MEASURED :SINK 318 :DIAGNOSTIC NIL :EXPECTED-SINK 318)
   :COMPOSED-REGISTRY-PROBE
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
    :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 7 :SECONDS 7.0d-6
    :TIME-QUALITY :MEASURED :SINK 142 :DIAGNOSTIC NIL :EXPECTED-SINK 142)
   :INVALID-CLI :REJECTED :OWNER-AND-REGISTRY-ORACLE-POSITIVE-NEGATIVE :PASSED
   :INVALID-NON-HOT :PASSED :EXISTING-DESTINATION-AND-PARTIAL-RAW :PASSED
   :MEASURED-PARTIAL-RAW
   (:REPLICA 0 :STATUS :EXPECTED-REJECTION :STAGE :MEASURED :ITERATIONS 4
    :WARMUP-ITERATIONS 0 :COMPLETED-ITERATIONS 1 :HEAP-BYTES 0 :RAW-TICKS 7
    :SECONDS 7.0d-6 :TIME-QUALITY :MEASURED :SINK 0 :DIAGNOSTIC
    #A((26) BASE-CHAR . \"fixture: misura interrotta\") :EXPECTED-SINK 6))
  :STEP-ORACLES :PASSED :STEP-CLI-AND-PARTIAL-RAW :PASSED :EMPTY
  (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
   :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 12 :SECONDS 1.2d-5
   :TIME-QUALITY :MEASURED :SINK 54 :DIAGNOSTIC NIL :EXPECTED-SINK 54)
  :INACTIVE
  (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
   :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 6 :SECONDS 6.0d-6
   :TIME-QUALITY :MEASURED :SINK 86 :DIAGNOSTIC NIL :EXPECTED-SINK 86)
  :CURRENT-INACTIVE
  (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
   :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 9 :SECONDS 9.0d-6
   :TIME-QUALITY :MEASURED :SINK 118 :DIAGNOSTIC NIL :EXPECTED-SINK 118))
 :SAMPLES NIL :CURRENT-REPLICA NIL :SBCL #A((5) BASE-CHAR . \"2.6.9\") :MACHINE
 #A((5) BASE-CHAR . \"ARM64\") :OS #A((6) BASE-CHAR . \"Darwin\") :OS-VERSION
 #A((6) BASE-CHAR . \"27.0.0\") :SAFETY 3 :ITERATIONS 4096 :WARMUP 128 :REPLICAS
 5 :TIMER-UNITS-PER-SECOND 1000000 :CAMPAIGNS
 ((:EMPTY :FIXTURES-PER-CAMPAIGN 5 :SHARDS 4 :PORT-ACTIVE T :INITIAL-CURSOR 0
   :CALLS-PER-CYCLE 4 :TOKEN 12)
  (:CURRENT-INACTIVE :FIXTURES-PER-CAMPAIGN 5 :SHARDS 4 :PORT-ACTIVE NIL
   :INITIAL-CURSOR 1 :CALLS-PER-CYCLE 4 :INITIAL-CLAIM-OUTSIDE-CLOCK T
   :WORKER-PHASE :CLAIMED :LINK-PHASE :IDLE :DETAIL NIL :LIFECYCLE-ACTION NIL
   :SCALAR-STATE-ORACLE-IN-CYCLE T :TOKEN 28))
 :TOKEN-FORMULA \"sample=N*cycle-token+N*(N-1)/2; EMPTY=12; CURRENT-INACTIVE=28\"
 :LIMITS
 (:PREALLOCATED-PRODUCT-AND-INPUTS :FRESH-FIXTURE-PER-REPLICA
  :STARTUP-CLAIM-DRAIN-AND-GC-EXCLUDED :PUBLIC-CLAIM-AND-BOUNDED-DRAIN
  :COUNTER-NOT-ABSOLUTE-NONALLOCATION-PROOF :EXTERNAL-LOAD-UNCONTROLLED
  :CLOCK-ZERO-IS-BELOW-RESOLUTION :NO-TIME-THRESHOLD-NO-TUNING-CLAIM
  :EMPTY-IS-LOCAL-OBSERVATION :NO-REAL-QUEUED-IDLE-CLAIM-MEASURED
  :CURRENT-IS-REPEATED-CLAIMED-LOOKUP-WITH-INACTIVE-PORT
  :NO-BEGIN-OR-LIVE-LEASE-IN-CLOCK :NO-RECYCLE-OR-REFUSAL-LATENCY-MEASURED
  :INACTIVE-IDLE-ONLY-IN-SELF-TEST :NO-CONCURRENT-COORDINATOR
  :NO-PHYSICAL-WORKER-LIFECYCLE-QUALIFICATION))
")
  (:PATH
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-measure/tool-source-dev-01.lisp")
   :BYTES 18009 :SHA256 "50c6980c514fd6042b90e3bfa10f2ce5004b7907da27153f396832ba802a26e3"
   :GIT-BLOB "0721fa8daa06c5320011f5b3b9b17dd2f6c0541b" :TEXT
   ";;;; C4: passo di dispatch; campagne EMPTY e CURRENT-INACTIVE, INACTIVE solo self-test.
;;;; Cinque repliche di 4096 cicli, 128 warmup e quattro chiamate per ciclo.
;;;; Factory, claim iniziale, cleanup e GC fuori clock; nessun begin nel ciclo misurato.
;;;; CURRENT conserva un CLAIMED reale con porta inattiva, senza begin; priorita dell obbligo.
;;;; --self-test | --bench directory-nuova/. Feature: :arcdocdb-pool-step-measure-library.
;;; REQ: REQ-CON-005 REQ-AFF-008 REQ-THR-001 REQ-BEN-001 REQ-BEN-002
;;; OWNER: dispatcher, contesto, link e sensore allo stesso thread C4.
;;; SHARED: ready autentico privato alla fixture; nessun coordinatore concorrente nel clock.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require :asdf)
  (unless (find-package \"ARCDOCDB.POOL-LIFECYCLE.MEASURE\")
    (let ((*features* (cons :arcdocdb-pool-lifecycle-measure-library *features*)))
      (load \"tools/measure-pool-lifecycle.lisp\"))))
(defpackage #:arcdocdb.pool-step.measure
  (:use #:cl)
  (:import-from #:arcdocdb.pool-lifecycle.measure
                #:lookup-function #:sample #:sample-record #:campaign-group
                #:acquire-directory #:write-report #:load-product
                #:+iterations+ #:+warmup+ #:+replicas+))
(in-package #:arcdocdb.pool-step.measure)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

(defun fingerprints ()
  \"Stabilita: biblioteca, questo sensore e tutti i sorgenti/test prodotto.\"
  (append (arcdocdb.pool-lifecycle.measure::fingerprints)
          (list (list :file \"tools/measure-pool-step.lisp\"
                      :md5 (format nil \"~(~{~2,'0X~}~)\"
                                   (coerce (sb-md5:md5sum-file \"tools/measure-pool-step.lisp\") 'list))))))

(defun api (name &optional (package \"ARCDOCDB.SCHEDULER.DISPATCH\"))
  \"Risolve soltanto funzioni pubbliche prima del clock, senza nomi nel percorso caldo.\"
  (multiple-value-bind (symbol visibility) (find-symbol name package)
    (unless (and symbol (eq :external visibility) (fboundp symbol))
      (error \"COD-60: API pubblica ~A/~A assente.\" package name))
    (symbol-function symbol)))

(defun make-series ()
  \"Backend pubblico C4 locale, nessun I/O richiesto dai lookup della campagna.\"
  (let* ((backend (funcall (api \"MAKE-BACKEND\" \"ARCDOCDB.IO\")
                           (lambda (path mode) (declare (ignore path mode)) 814)
                           (lambda (&rest arguments) (declare (ignore arguments))
                             (error \"COD-60: lettura I/O inattesa nella fixture step.\"))
                           (lambda (fd bytes start count) (declare (ignore fd bytes start)) count)
                           (lambda (fd) (declare (ignore fd)) 0)
                           (lambda (fd) (declare (ignore fd)) 0)
                           (lambda (fd) (declare (ignore fd)) 0)))
         (file (funcall (api \"CREA-TEMPORANEO\" \"ARCDOCDB.IO\") \"pool-step-C4.tmp\" :backend backend))
         (log (funcall (api \"CREA-LOG-IO\" \"ARCDOCDB.WAL\") file :segment 814)))
    (values (funcall (api \"CREA-CONTROLLORE-SERIE\" \"ARCDOCDB.SERIES\")
                     (funcall (api \"CREA-REGISTRO-CSN\" \"ARCDOCDB.CSN\") :capacity 4) log :capacity 2)
            file)))

(defun make-dispatch (active cursor)
  \"Quattro shard autentici e tabella singleton; costruzione e risoluzione API fuori clock.\"
  (multiple-value-bind (controller file) (make-series)
    (let* ((ready (funcall (api \"CREA-LISTA-WRITER-PRONTI\" \"ARCDOCDB.EXECUTION\") :shards 4 :capacity 1))
           (context (funcall (api \"CREA-CONTESTO-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\") ready :start cursor))
           (port (funcall (api \"CREA-PORTA-WORKER-POOL\" \"ARCDOCDB.SCHEDULER\") context :active active))
           (writer (funcall (api \"CREA-WRITER-PROGRAMMABILE\" \"ARCDOCDB.EXECUTION\")
                            :capacity 1 :quantum 1 :routing-index 0))
           (registry (funcall (api \"CREA-REGISTRO-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\")
                              (vector writer) (vector controller)))
           (table (funcall (api \"CREA-TABELLA-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\") context registry))
           (links (funcall (lookup-function \"TABELLA-WORKER-SERIE-LINKS\" \"ARCDOCDB.EXECUTION.SERIES\") table)))
      (values (funcall (api \"CREA-DISPATCHER-WRITER-POOL\") port table)
              context ready writer (svref links 0) file))))

(defun close-fixture (file)
  \"Solo cleanup C4: chiude il backend della fixture dopo ogni misura o rifiuto.\"
  (funcall (api \"CHIUDI\" \"ARCDOCDB.IO\") file))

(defun verify-step (step dispatcher expected status origin detail lifecycle)
  \"Oracolo scalare indipendente per tutti e cinque i risultati del passo.\"
  (multiple-value-bind (link outcome actual-origin actual-detail action) (funcall step dispatcher)
    (unless (and (eq expected link) (eq status outcome) (eq origin actual-origin)
                 (eql detail actual-detail) (eq lifecycle action))
      (error \"COD-60: step ~S/~S/~S/~S/~S invece di ~S/~S/~S/~S/~S.\"
             link outcome actual-origin actual-detail action expected status origin detail lifecycle))))
(defun create-empty-cycle ()
  \"Quattro EMPTY attivi: origine CLAIM, cursore0->1->2->3->0, azioneUNCHANGED; token12.\"
  (multiple-value-bind (dispatcher context ready writer link file) (make-dispatch t 0)
    (declare (ignore context ready writer link))
    (let ((step (api \"PASSO-DISPATCHER-POOL\")))
      (values (lambda ()
                (verify-step step dispatcher nil :empty :claim 1 :unchanged)
                (verify-step step dispatcher nil :empty :claim 2 :unchanged)
                (verify-step step dispatcher nil :empty :claim 3 :unchanged)
                (verify-step step dispatcher nil :empty :claim 0 :unchanged)
                12)
              12 (lambda () (close-fixture file))))))
(defun create-inactive-cycle ()
  \"Solo self-test: quattro INACTIVE IDLE conservano cursore2 e origineCLAIM; token20.\"
  (multiple-value-bind (dispatcher context ready writer link file) (make-dispatch nil 2)
    (declare (ignore context ready writer link))
    (let ((step (api \"PASSO-DISPATCHER-POOL\")))
      (values (lambda ()
                (dotimes (i 4) (verify-step step dispatcher nil :inactive :claim 2 :unchanged))
                20)
              20 (lambda () (close-fixture file))))))
(defun drain-claim (context writer)
  \"Cleanup C4 fuori clock: consuma e conferma il solo payload sentinel, poi termina IDLE.\"
  (let ((target (vector nil)))
    (unless (plusp (funcall (api \"INIZIA-TRATTO-WORKER\" \"ARCDOCDB.EXECUTION\") context))
      (error \"COD-60: cleanup begin senza lease.\"))
    (multiple-value-bind (count status token)
        (funcall (api \"PRELEVA-LAVORI-WORKER\" \"ARCDOCDB.EXECUTION\") context target 0 1)
      (unless (and (= 1 count) (eq :messages status) (eq :step-C4 (svref target 0)) (plusp token))
        (error \"COD-60: cleanup perde il payload della fixture.\"))
      (funcall (api \"CONFERMA-LAVORI-WORKER\" \"ARCDOCDB.EXECUTION\") context token))
    (unless (and (eq writer (funcall (api \"WRITER-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\") context))
                 (eq :idle (funcall (api \"TERMINA-TRATTO-WORKER\" \"ARCDOCDB.EXECUTION\") context)))
      (error \"COD-60: cleanup non termina il compito IDLE.\"))))

(defun verify-current (step dispatcher link context writer read-state read-writer read-link-state read-cursor)
  \"CLAIMED prioritario con porta inattiva; nessuna lease, gate o rotazione del cursore.\"
  (verify-step step dispatcher link :claimed :current nil nil)
  (unless (and (eq :claimed (funcall read-state context))
               (eq writer (funcall read-writer context))
               (eq :idle (funcall read-link-state link)) (= 1 (funcall read-cursor context)))
    (error \"COD-60: step CURRENT altera obbligo, link IDLE o cursore1.\")))
(defun create-current-cycle ()
  \"Quattro passi CURRENT su porta inattiva e CLAIMED reale; claim/drain fuori clock; token28.\"
  (multiple-value-bind (dispatcher context ready writer link file) (make-dispatch nil 0)
    (let ((step (api \"PASSO-DISPATCHER-POOL\"))
          (read-state (api \"STATO-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\"))
          (read-writer (api \"WRITER-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\"))
          (read-link-state (api \"STATO-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\"))
          (read-cursor (lookup-function \"CONTESTO-WORKER-WRITER-CURSOR\" \"ARCDOCDB.EXECUTION\")))
      (multiple-value-bind (count status)
          (funcall (api \"ACCODA-LAVORO-WRITER\" \"ARCDOCDB.EXECUTION\") writer :step-C4)
        (unless (and (= 1 count) (eq :schedule status)) (error \"COD-60: enqueue iniziale difforme.\")))
      (unless (= 1 (funcall (api \"PUBBLICA-WRITER-PRONTO\" \"ARCDOCDB.EXECUTION\") ready 0 writer))
        (error \"COD-60: pubblicazione iniziale difforme.\"))
      (multiple-value-bind (actual status cursor)
          (funcall (api \"PRENDI-WRITER-WORKER\" \"ARCDOCDB.EXECUTION\") context)
        (unless (and (eq writer actual) (eq :claimed status) (= 1 cursor))
          (error \"COD-60: claim pubblico iniziale difforme.\")))
      (values (lambda ()
                (dotimes (i 4)
                  (verify-current step dispatcher link context writer read-state read-writer read-link-state read-cursor))
                28)
              28 (lambda () (unwind-protect (drain-claim context writer) (close-fixture file)))))))
(defun campaign (report checkpoint)
  \"Due campagne, fixture stabile per campagna; INACTIVE e RECYCLE non misurati.\"
  (campaign-group :empty #'create-empty-cycle report checkpoint)
  (campaign-group :current-inactive #'create-current-cycle report checkpoint)
  (setf (getf report :current-replica) nil) report)
(defun make-report ()
  \"Raw e confini: IDLE governato e CLAIMED prioritario; nessun begin o ricircolo nel clock.\"
  (list :schema-version 1 :kind :pool-step-benchmark :status :running :stage :pending
        :diagnostic nil :process-argv sb-ext:*posix-argv* :tool-arguments (uiop:command-line-arguments)
        :source-fingerprints-before (fingerprints) :source-fingerprints-after nil
        :source-consistency :pending :recorded-at (get-universal-time) :self-test nil
        :samples nil :current-replica nil :sbcl (lisp-implementation-version)
        :machine (machine-type) :os (software-type) :os-version (software-version) :safety 3
        :iterations +iterations+ :warmup +warmup+ :replicas +replicas+
        :timer-units-per-second internal-time-units-per-second
        :campaigns '((:empty :shards 4 :port-active t :initial-cursor 0 :calls-per-cycle 4 :token 12)
                    (:current-inactive :shards 4 :port-active nil :initial-cursor 1 :calls-per-cycle 4
                     :initial-claim-outside-clock t :worker-phase :claimed :link-phase :idle
                     :detail nil :lifecycle-action nil :scalar-state-oracle-in-cycle t :token 28))
        :token-formula \"sample=N*cycle-token+N*(N-1)/2; EMPTY=12; CURRENT-INACTIVE=28\"
        :limits '(:preallocated-product-and-inputs :stable-fixture-per-campaign
                  :startup-claim-drain-and-gc-excluded :public-claim-and-bounded-drain
                  :counter-not-absolute-nonallocation-proof :external-load-uncontrolled
                  :clock-zero-is-below-resolution :no-time-threshold-no-tuning-claim
                  :empty-is-local-observation :no-real-queued-idle-claim-measured
                  :current-is-repeated-claimed-lookup-with-inactive-port
                  :no-begin-or-live-lease-in-clock :no-recycle-or-refusal-latency-measured
                  :inactive-idle-only-in-self-test :no-concurrent-coordinator
                  :no-physical-worker-lifecycle-qualification)))
(defun run-driver (args &key (product-loader #'load-product) (tester #'self-test) (runner #'campaign))
  \"Driver step compatto; riusa I/O esclusivo e sensore qualificati, preserva raw del fallimento.\"
  (let ((report (make-report)) (directory nil))
    (handler-case
        (progn
          (unless (or (equal args '(\"--self-test\"))
                      (and (= 2 (length args)) (string= \"--bench\" (first args))))
            (error \"COD-61: uso --self-test oppure --bench directory-nuova/.\"))
          (when (= 2 (length args)) (setf directory (acquire-directory (second args))))
          (setf (getf report :stage) :load-product)
          (when directory (write-report report directory))
          (funcall product-loader)
          (setf (getf report :stage) :self-test (getf report :self-test) (funcall tester))
          (when directory
            (setf (getf report :stage) :campaign)
            (funcall runner report (lambda () (write-report report directory))))
          (setf (getf report :status) :ok (getf report :stage) :complete))
      (error (condition)
        (setf (getf report :status) :failed (getf report :diagnostic) (princ-to-string condition))
        (let ((last (car (last (getf report :samples)))))
          (when (and last (eq :running (getf last :status)))
            (setf (getf last :status) :failed (getf last :diagnostic) (princ-to-string condition))))))
    (let ((after (fingerprints)))
      (setf (getf report :source-fingerprints-after) after (getf report :source-consistency)
            (if (equal (getf report :source-fingerprints-before) after) :stable :changed))
      (when (and (eq :ok (getf report :status)) (eq :changed (getf report :source-consistency)))
        (setf (getf report :status) :source-changed (getf report :diagnostic) \"COD-61: sorgenti cambiati.\")))
    (when directory (write-report report directory))
    report))

(defun self-test-reporter ()
  \"Il driver dispatch rifiuta CLI/destinazione e conserva replica conclusa più raw parziale.\"
  (let ((called nil) (root (arcdocdb.pool-lifecycle.measure::fresh-self-test-directory)))
    (unwind-protect
         (progn
           (dolist (args '(nil (\"--bench\") (\"--bad\") (\"--bench\" \"directory\" \"extra\")))
             (unless (and (eq :failed (getf (run-driver args :product-loader (lambda () (setf called t))) :status))
                          (null called))
               (error \"COD-60: CLI invalida eseguita.\")))
           (let* ((existing (acquire-directory (merge-pathnames \"existing/\" root)))
                  (failed (merge-pathnames \"failed/\" root)))
             (write-report '(:sentinel :unchanged) existing)
             (unless (and (eq :failed (getf (run-driver (list \"--bench\" (namestring existing))
                                                      :product-loader (constantly nil)
                                                      :tester (constantly :passed)) :status))
                          (equal (arcdocdb.pool-lifecycle.measure::read-self-test-report existing)
                                 '(:sentinel :unchanged)))
               (error \"COD-60: destinazione precedente non conservata.\"))
             (run-driver (list \"--bench\" (namestring failed))
                         :product-loader (constantly nil) :tester (constantly :passed)
                         :runner (lambda (report checkpoint)
                                   (setf (getf report :current-replica) 1 (getf report :samples)
                                         (list (list :status :ok :raw-ticks 3 :heap-bytes 0)
                                               (list :status :running :raw-ticks 7 :heap-bytes 11
                                                     :diagnostic nil)))
                                   (funcall checkpoint) (error \"fixture: replica interrotta\")))
             (let* ((saved (arcdocdb.pool-lifecycle.measure::read-self-test-report failed))
                    (samples (getf saved :samples)))
               (unless (and (eq :failed (getf saved :status)) (= 1 (getf saved :current-replica))
                            (= 2 (length samples)) (eq :ok (getf (first samples) :status))
                            (eq :failed (getf (second samples) :status))
                            (= 7 (getf (second samples) :raw-ticks))
                            (= 11 (getf (second samples) :heap-bytes)))
                 (error \"COD-60: replica o raw parziale persi.\")))))
      (uiop:delete-directory-tree root :validate t)))
  :passed)


(defun self-test-oracle ()
  \"Ogni risultato step difforme viene respinto separatamente; RECYCLE ha solo oracolo positivo.\"
  (dolist (row '((:wrong :empty :claim 1 :unchanged) (nil :inactive :claim 1 :unchanged)
                 (nil :empty :current 1 :unchanged) (nil :empty :claim 2 :unchanged)
                 (nil :empty :claim 1 :activated)))
    (unless (handler-case
                (progn (verify-step (lambda (dispatcher) (declare (ignore dispatcher)) (values-list row))
                                    nil nil :empty :claim 1 :unchanged) nil)
              (error () t))
      (error \"COD-60: risultato step difforme non respinto: ~S.\" row)))
  (verify-step (lambda (dispatcher) (declare (ignore dispatcher)) (values :link :claimed :recycle 1 nil))
               nil :link :claimed :recycle 1 nil)
  :passed)
(defun self-test ()
  \"Sensore condiviso heap/sink/clock/partial, cinque risultati e tre fixture pubbliche con drain.\"
  (list :status :ok :shared-sensor (arcdocdb.pool-lifecycle.measure::self-test)
        :step-oracles (self-test-oracle) :step-cli-and-partial-raw (self-test-reporter)
        :empty (arcdocdb.pool-lifecycle.measure::self-test-composed #'create-empty-cycle)
        :inactive (arcdocdb.pool-lifecycle.measure::self-test-composed #'create-inactive-cycle)
        :current-inactive (arcdocdb.pool-lifecycle.measure::self-test-composed #'create-current-cycle)))
(defun main ()
  \"Rapporto leggibile; errore nonzero anche per fonte cambiata o heap osservato positivo.\"
  (let ((report (run-driver (uiop:command-line-arguments))))
    (let ((*print-readably* t)) (write report :pretty t) (terpri))
    (unless (eq :ok (getf report :status))
      (format *error-output* \"~&tools/measure-pool-step.lisp: ~A~%\" (getf report :diagnostic))
      (uiop:quit 1))))
(unless (member :arcdocdb-pool-step-measure-library *features*) (main))
")
  (:PATH
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-measure/tool-source-dev-02.lisp")
   :BYTES 19012 :SHA256 "91cc73d2d1550312c60b9ff5b3e74561ce38dbcd3960ff013613ff811b86862c"
   :GIT-BLOB "cdcb410e27475282d157b0d64a4656ea6ad069a1" :TEXT
   ";;;; C4: passo di dispatch; campagne EMPTY e CURRENT-INACTIVE, INACTIVE solo self-test.
;;;; Cinque fixture per campagna: 4096 cicli, 128 warmup e quattro chiamate per ciclo.
;;;; Factory, claim iniziale, cleanup e GC fuori clock; nessun begin nel ciclo misurato.
;;;; CURRENT conserva un CLAIMED reale con porta inattiva, senza begin; priorita dell obbligo.
;;;; --self-test | --bench directory-nuova/. Feature: :arcdocdb-pool-step-measure-library.
;;; REQ: REQ-CON-005 REQ-AFF-008 REQ-THR-001 REQ-BEN-001 REQ-BEN-002
;;; OWNER: dispatcher, contesto, link e sensore allo stesso thread C4.
;;; SHARED: ready autentico privato alla fixture; nessun coordinatore concorrente nel clock.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require :asdf)
  (unless (find-package \"ARCDOCDB.POOL-LIFECYCLE.MEASURE\")
    (let ((*features* (cons :arcdocdb-pool-lifecycle-measure-library *features*)))
      (load \"tools/measure-pool-lifecycle.lisp\"))))
(defpackage #:arcdocdb.pool-step.measure
  (:use #:cl)
  (:import-from #:arcdocdb.pool-lifecycle.measure
                #:lookup-function #:sample #:sample-record
                #:acquire-directory #:write-report #:load-product
                #:+iterations+ #:+warmup+ #:+replicas+))
(in-package #:arcdocdb.pool-step.measure)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

(defun fingerprints ()
  \"Stabilita: biblioteca, questo sensore e tutti i sorgenti/test prodotto.\"
  (append (arcdocdb.pool-lifecycle.measure::fingerprints)
          (list (list :file \"tools/measure-pool-step.lisp\"
                      :md5 (format nil \"~(~{~2,'0X~}~)\"
                                   (coerce (sb-md5:md5sum-file \"tools/measure-pool-step.lisp\") 'list))))))

(defun api (name &optional (package \"ARCDOCDB.SCHEDULER.DISPATCH\"))
  \"Risolve soltanto funzioni pubbliche prima del clock, senza nomi nel percorso caldo.\"
  (multiple-value-bind (symbol visibility) (find-symbol name package)
    (unless (and symbol (eq :external visibility) (fboundp symbol))
      (error \"COD-60: API pubblica ~A/~A assente.\" package name))
    (symbol-function symbol)))

(defun make-series ()
  \"Backend pubblico C4 locale, nessun I/O richiesto dai lookup della campagna.\"
  (let* ((backend (funcall (api \"MAKE-BACKEND\" \"ARCDOCDB.IO\")
                           (lambda (path mode) (declare (ignore path mode)) 814)
                           (lambda (&rest arguments) (declare (ignore arguments))
                             (error \"COD-60: lettura I/O inattesa nella fixture step.\"))
                           (lambda (fd bytes start count) (declare (ignore fd bytes start)) count)
                           (lambda (fd) (declare (ignore fd)) 0)
                           (lambda (fd) (declare (ignore fd)) 0)
                           (lambda (fd) (declare (ignore fd)) 0)))
         (file (funcall (api \"CREA-TEMPORANEO\" \"ARCDOCDB.IO\") \"pool-step-C4.tmp\" :backend backend))
         (log (funcall (api \"CREA-LOG-IO\" \"ARCDOCDB.WAL\") file :segment 814)))
    (values (funcall (api \"CREA-CONTROLLORE-SERIE\" \"ARCDOCDB.SERIES\")
                     (funcall (api \"CREA-REGISTRO-CSN\" \"ARCDOCDB.CSN\") :capacity 4) log :capacity 2)
            file)))

(defun make-dispatch (active cursor)
  \"Quattro shard autentici e tabella singleton; costruzione e risoluzione API fuori clock.\"
  (multiple-value-bind (controller file) (make-series)
    (let* ((ready (funcall (api \"CREA-LISTA-WRITER-PRONTI\" \"ARCDOCDB.EXECUTION\") :shards 4 :capacity 1))
           (context (funcall (api \"CREA-CONTESTO-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\") ready :start cursor))
           (port (funcall (api \"CREA-PORTA-WORKER-POOL\" \"ARCDOCDB.SCHEDULER\") context :active active))
           (writer (funcall (api \"CREA-WRITER-PROGRAMMABILE\" \"ARCDOCDB.EXECUTION\")
                            :capacity 1 :quantum 1 :routing-index 0))
           (registry (funcall (api \"CREA-REGISTRO-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\")
                              (vector writer) (vector controller)))
           (table (funcall (api \"CREA-TABELLA-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\") context registry))
           (links (funcall (lookup-function \"TABELLA-WORKER-SERIE-LINKS\" \"ARCDOCDB.EXECUTION.SERIES\") table)))
      (values (funcall (api \"CREA-DISPATCHER-WRITER-POOL\") port table)
              context ready writer (svref links 0) file))))

(defun close-fixture (file)
  \"Solo cleanup C4: chiude il backend della fixture dopo ogni misura o rifiuto.\"
  (funcall (api \"CHIUDI\" \"ARCDOCDB.IO\") file))

(defun verify-step (step dispatcher expected status origin detail lifecycle)
  \"Oracolo scalare indipendente per tutti e cinque i risultati del passo.\"
  (multiple-value-bind (link outcome actual-origin actual-detail action) (funcall step dispatcher)
    (unless (and (eq expected link) (eq status outcome) (eq origin actual-origin)
                 (eql detail actual-detail) (eq lifecycle action))
      (error \"COD-60: step ~S/~S/~S/~S/~S invece di ~S/~S/~S/~S/~S.\"
             link outcome actual-origin actual-detail action expected status origin detail lifecycle))))
(defun create-empty-cycle ()
  \"Quattro EMPTY attivi: origine CLAIM, cursore0->1->2->3->0, azioneUNCHANGED; token12.\"
  (multiple-value-bind (dispatcher context ready writer link file) (make-dispatch t 0)
    (declare (ignore context ready writer link))
    (let ((step (api \"PASSO-DISPATCHER-POOL\")))
      (values (lambda ()
                (verify-step step dispatcher nil :empty :claim 1 :unchanged)
                (verify-step step dispatcher nil :empty :claim 2 :unchanged)
                (verify-step step dispatcher nil :empty :claim 3 :unchanged)
                (verify-step step dispatcher nil :empty :claim 0 :unchanged)
                12)
              12 (lambda () (close-fixture file))))))
(defun create-inactive-cycle ()
  \"Solo self-test: quattro INACTIVE IDLE conservano cursore2 e origineCLAIM; token20.\"
  (multiple-value-bind (dispatcher context ready writer link file) (make-dispatch nil 2)
    (declare (ignore context ready writer link))
    (let ((step (api \"PASSO-DISPATCHER-POOL\")))
      (values (lambda ()
                (dotimes (i 4) (verify-step step dispatcher nil :inactive :claim 2 :unchanged))
                20)
              20 (lambda () (close-fixture file))))))
(defun drain-claim (context writer)
  \"Cleanup C4 fuori clock: consuma e conferma il solo payload sentinel, poi termina IDLE.\"
  (let ((target (vector nil)))
    (unless (plusp (funcall (api \"INIZIA-TRATTO-WORKER\" \"ARCDOCDB.EXECUTION\") context))
      (error \"COD-60: cleanup begin senza lease.\"))
    (multiple-value-bind (count status token)
        (funcall (api \"PRELEVA-LAVORI-WORKER\" \"ARCDOCDB.EXECUTION\") context target 0 1)
      (unless (and (= 1 count) (eq :messages status) (eq :step-C4 (svref target 0)) (plusp token))
        (error \"COD-60: cleanup perde il payload della fixture.\"))
      (funcall (api \"CONFERMA-LAVORI-WORKER\" \"ARCDOCDB.EXECUTION\") context token))
    (unless (and (eq writer (funcall (api \"WRITER-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\") context))
                 (eq :idle (funcall (api \"TERMINA-TRATTO-WORKER\" \"ARCDOCDB.EXECUTION\") context)))
      (error \"COD-60: cleanup non termina il compito IDLE.\"))))

(defun verify-current (step dispatcher link context writer read-state read-writer read-link-state read-cursor)
  \"CLAIMED prioritario con porta inattiva; nessuna lease, gate o rotazione del cursore.\"
  (verify-step step dispatcher link :claimed :current nil nil)
  (unless (and (eq :claimed (funcall read-state context))
               (eq writer (funcall read-writer context))
               (eq :idle (funcall read-link-state link)) (= 1 (funcall read-cursor context)))
    (error \"COD-60: step CURRENT altera obbligo, link IDLE o cursore1.\")))
(defun create-current-cycle ()
  \"Quattro passi CURRENT su porta inattiva e CLAIMED reale; claim/drain fuori clock; token28.\"
  (multiple-value-bind (dispatcher context ready writer link file) (make-dispatch nil 0)
    (let ((step (api \"PASSO-DISPATCHER-POOL\"))
          (read-state (api \"STATO-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\"))
          (read-writer (api \"WRITER-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\"))
          (read-link-state (api \"STATO-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\"))
          (read-cursor (lookup-function \"CONTESTO-WORKER-WRITER-CURSOR\" \"ARCDOCDB.EXECUTION\")))
      (multiple-value-bind (count status)
          (funcall (api \"ACCODA-LAVORO-WRITER\" \"ARCDOCDB.EXECUTION\") writer :step-C4)
        (unless (and (= 1 count) (eq :schedule status)) (error \"COD-60: enqueue iniziale difforme.\")))
      (unless (= 1 (funcall (api \"PUBBLICA-WRITER-PRONTO\" \"ARCDOCDB.EXECUTION\") ready 0 writer))
        (error \"COD-60: pubblicazione iniziale difforme.\"))
      (multiple-value-bind (actual status cursor)
          (funcall (api \"PRENDI-WRITER-WORKER\" \"ARCDOCDB.EXECUTION\") context)
        (unless (and (eq writer actual) (eq :claimed status) (= 1 cursor))
          (error \"COD-60: claim pubblico iniziale difforme.\")))
      (values (lambda ()
                (dotimes (i 4)
                  (verify-current step dispatcher link context writer read-state read-writer read-link-state read-cursor))
                28)
              28 (lambda () (unwind-protect (drain-claim context writer) (close-fixture file)))))))
(defun campaign-group (name maker report checkpoint)
  \"Nuova fixture per ciascuna replica: obbligo privato indipendente e cleanup sempre fuori clock.\"
  (dotimes (replica +replicas+)
    (multiple-value-bind (function token cleanup) (funcall maker)
      (unwind-protect
           (let ((progress (sample-record replica +iterations+ +warmup+ token)))
             (setf (getf progress :campaign) name (getf report :current-replica) replica
                   (getf report :samples) (append (getf report :samples) (list progress)))
             (funcall checkpoint)
             (sample function +iterations+ token progress)
             (funcall checkpoint)
             (unless (zerop (getf progress :heap-bytes))
               (setf (getf progress :status) :failed (getf progress :diagnostic) \"COD-30: heap osservato positivo.\")
               (error \"COD-30: heap positivo nella campagna ~S replica ~D.\" name replica)))
        (funcall cleanup))))
  report)
(defun campaign (report checkpoint)
  \"Due campagne, fixture nuova per replica; INACTIVE e RECYCLE non misurati.\"
  (campaign-group :empty #'create-empty-cycle report checkpoint)
  (campaign-group :current-inactive #'create-current-cycle report checkpoint)
  (setf (getf report :current-replica) nil) report)
(defun make-report ()
  \"Raw e confini: IDLE governato e CLAIMED prioritario; nessun begin o ricircolo nel clock.\"
  (list :schema-version 1 :kind :pool-step-benchmark :status :running :stage :pending
        :diagnostic nil :process-argv sb-ext:*posix-argv* :tool-arguments (uiop:command-line-arguments)
        :source-fingerprints-before (fingerprints) :source-fingerprints-after nil
        :source-consistency :pending :recorded-at (get-universal-time) :self-test nil
        :samples nil :current-replica nil :sbcl (lisp-implementation-version)
        :machine (machine-type) :os (software-type) :os-version (software-version) :safety 3
        :iterations +iterations+ :warmup +warmup+ :replicas +replicas+
        :timer-units-per-second internal-time-units-per-second
        :campaigns '((:empty :fixtures-per-campaign 5 :shards 4 :port-active t :initial-cursor 0 :calls-per-cycle 4 :token 12)
                    (:current-inactive :fixtures-per-campaign 5 :shards 4 :port-active nil :initial-cursor 1 :calls-per-cycle 4
                     :initial-claim-outside-clock t :worker-phase :claimed :link-phase :idle
                     :detail nil :lifecycle-action nil :scalar-state-oracle-in-cycle t :token 28))
        :token-formula \"sample=N*cycle-token+N*(N-1)/2; EMPTY=12; CURRENT-INACTIVE=28\"
        :limits '(:preallocated-product-and-inputs :fresh-fixture-per-replica
                  :startup-claim-drain-and-gc-excluded :public-claim-and-bounded-drain
                  :counter-not-absolute-nonallocation-proof :external-load-uncontrolled
                  :clock-zero-is-below-resolution :no-time-threshold-no-tuning-claim
                  :empty-is-local-observation :no-real-queued-idle-claim-measured
                  :current-is-repeated-claimed-lookup-with-inactive-port
                  :no-begin-or-live-lease-in-clock :no-recycle-or-refusal-latency-measured
                  :inactive-idle-only-in-self-test :no-concurrent-coordinator
                  :no-physical-worker-lifecycle-qualification)))
(defun run-driver (args &key (product-loader #'load-product) (tester #'self-test) (runner #'campaign))
  \"Driver step compatto; riusa I/O esclusivo e sensore qualificati, preserva raw del fallimento.\"
  (let ((report (make-report)) (directory nil))
    (handler-case
        (progn
          (unless (or (equal args '(\"--self-test\"))
                      (and (= 2 (length args)) (string= \"--bench\" (first args))))
            (error \"COD-61: uso --self-test oppure --bench directory-nuova/.\"))
          (when (= 2 (length args)) (setf directory (acquire-directory (second args))))
          (setf (getf report :stage) :load-product)
          (when directory (write-report report directory))
          (funcall product-loader)
          (setf (getf report :stage) :self-test (getf report :self-test) (funcall tester))
          (when directory
            (setf (getf report :stage) :campaign)
            (funcall runner report (lambda () (write-report report directory))))
          (setf (getf report :status) :ok (getf report :stage) :complete))
      (error (condition)
        (setf (getf report :status) :failed (getf report :diagnostic) (princ-to-string condition))
        (let ((last (car (last (getf report :samples)))))
          (when (and last (eq :running (getf last :status)))
            (setf (getf last :status) :failed (getf last :diagnostic) (princ-to-string condition))))))
    (let ((after (fingerprints)))
      (setf (getf report :source-fingerprints-after) after (getf report :source-consistency)
            (if (equal (getf report :source-fingerprints-before) after) :stable :changed))
      (when (and (eq :ok (getf report :status)) (eq :changed (getf report :source-consistency)))
        (setf (getf report :status) :source-changed (getf report :diagnostic) \"COD-61: sorgenti cambiati.\")))
    (when directory (write-report report directory))
    report))

(defun self-test-reporter ()
  \"Il driver dispatch rifiuta CLI/destinazione e conserva replica conclusa più raw parziale.\"
  (let ((called nil) (root (arcdocdb.pool-lifecycle.measure::fresh-self-test-directory)))
    (unwind-protect
         (progn
           (dolist (args '(nil (\"--bench\") (\"--bad\") (\"--bench\" \"directory\" \"extra\")))
             (unless (and (eq :failed (getf (run-driver args :product-loader (lambda () (setf called t))) :status))
                          (null called))
               (error \"COD-60: CLI invalida eseguita.\")))
           (let* ((existing (acquire-directory (merge-pathnames \"existing/\" root)))
                  (failed (merge-pathnames \"failed/\" root)))
             (write-report '(:sentinel :unchanged) existing)
             (unless (and (eq :failed (getf (run-driver (list \"--bench\" (namestring existing))
                                                      :product-loader (constantly nil)
                                                      :tester (constantly :passed)) :status))
                          (equal (arcdocdb.pool-lifecycle.measure::read-self-test-report existing)
                                 '(:sentinel :unchanged)))
               (error \"COD-60: destinazione precedente non conservata.\"))
             (run-driver (list \"--bench\" (namestring failed))
                         :product-loader (constantly nil) :tester (constantly :passed)
                         :runner (lambda (report checkpoint)
                                   (setf (getf report :current-replica) 1 (getf report :samples)
                                         (list (list :status :ok :raw-ticks 3 :heap-bytes 0)
                                               (list :status :running :raw-ticks 7 :heap-bytes 11
                                                     :diagnostic nil)))
                                   (funcall checkpoint) (error \"fixture: replica interrotta\")))
             (let* ((saved (arcdocdb.pool-lifecycle.measure::read-self-test-report failed))
                    (samples (getf saved :samples)))
               (unless (and (eq :failed (getf saved :status)) (= 1 (getf saved :current-replica))
                            (= 2 (length samples)) (eq :ok (getf (first samples) :status))
                            (eq :failed (getf (second samples) :status))
                            (= 7 (getf (second samples) :raw-ticks))
                            (= 11 (getf (second samples) :heap-bytes)))
                 (error \"COD-60: replica o raw parziale persi.\")))))
      (uiop:delete-directory-tree root :validate t)))
  :passed)


(defun self-test-oracle ()
  \"Ogni risultato step difforme viene respinto separatamente; RECYCLE ha solo oracolo positivo.\"
  (dolist (row '((:wrong :empty :claim 1 :unchanged) (nil :inactive :claim 1 :unchanged)
                 (nil :empty :current 1 :unchanged) (nil :empty :claim 2 :unchanged)
                 (nil :empty :claim 1 :activated)))
    (unless (handler-case
                (progn (verify-step (lambda (dispatcher) (declare (ignore dispatcher)) (values-list row))
                                    nil nil :empty :claim 1 :unchanged) nil)
              (error () t))
      (error \"COD-60: risultato step difforme non respinto: ~S.\" row)))
  (verify-step (lambda (dispatcher) (declare (ignore dispatcher)) (values :link :claimed :recycle 1 nil))
               nil :link :claimed :recycle 1 nil)
  :passed)
(defun self-test ()
  \"Sensore condiviso heap/sink/clock/partial, cinque risultati e tre fixture pubbliche con drain.\"
  (list :status :ok :shared-sensor (arcdocdb.pool-lifecycle.measure::self-test)
        :step-oracles (self-test-oracle) :step-cli-and-partial-raw (self-test-reporter)
        :empty (arcdocdb.pool-lifecycle.measure::self-test-composed #'create-empty-cycle)
        :inactive (arcdocdb.pool-lifecycle.measure::self-test-composed #'create-inactive-cycle)
        :current-inactive (arcdocdb.pool-lifecycle.measure::self-test-composed #'create-current-cycle)))
(defun main ()
  \"Rapporto leggibile; errore nonzero anche per fonte cambiata o heap osservato positivo.\"
  (let ((report (run-driver (uiop:command-line-arguments))))
    (let ((*print-readably* t)) (write report :pretty t) (terpri))
    (unless (eq :ok (getf report :status))
      (format *error-output* \"~&tools/measure-pool-step.lisp: ~A~%\" (getf report :diagnostic))
      (uiop:quit 1))))
(unless (member :arcdocdb-pool-step-measure-library *features*) (main))
")
  (:PATH
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-measure/tool-source-functional-dev-01.lisp")
   :BYTES 19012 :SHA256 "91cc73d2d1550312c60b9ff5b3e74561ce38dbcd3960ff013613ff811b86862c"
   :GIT-BLOB "cdcb410e27475282d157b0d64a4656ea6ad069a1" :TEXT
   ";;;; C4: passo di dispatch; campagne EMPTY e CURRENT-INACTIVE, INACTIVE solo self-test.
;;;; Cinque fixture per campagna: 4096 cicli, 128 warmup e quattro chiamate per ciclo.
;;;; Factory, claim iniziale, cleanup e GC fuori clock; nessun begin nel ciclo misurato.
;;;; CURRENT conserva un CLAIMED reale con porta inattiva, senza begin; priorita dell obbligo.
;;;; --self-test | --bench directory-nuova/. Feature: :arcdocdb-pool-step-measure-library.
;;; REQ: REQ-CON-005 REQ-AFF-008 REQ-THR-001 REQ-BEN-001 REQ-BEN-002
;;; OWNER: dispatcher, contesto, link e sensore allo stesso thread C4.
;;; SHARED: ready autentico privato alla fixture; nessun coordinatore concorrente nel clock.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require :asdf)
  (unless (find-package \"ARCDOCDB.POOL-LIFECYCLE.MEASURE\")
    (let ((*features* (cons :arcdocdb-pool-lifecycle-measure-library *features*)))
      (load \"tools/measure-pool-lifecycle.lisp\"))))
(defpackage #:arcdocdb.pool-step.measure
  (:use #:cl)
  (:import-from #:arcdocdb.pool-lifecycle.measure
                #:lookup-function #:sample #:sample-record
                #:acquire-directory #:write-report #:load-product
                #:+iterations+ #:+warmup+ #:+replicas+))
(in-package #:arcdocdb.pool-step.measure)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

(defun fingerprints ()
  \"Stabilita: biblioteca, questo sensore e tutti i sorgenti/test prodotto.\"
  (append (arcdocdb.pool-lifecycle.measure::fingerprints)
          (list (list :file \"tools/measure-pool-step.lisp\"
                      :md5 (format nil \"~(~{~2,'0X~}~)\"
                                   (coerce (sb-md5:md5sum-file \"tools/measure-pool-step.lisp\") 'list))))))

(defun api (name &optional (package \"ARCDOCDB.SCHEDULER.DISPATCH\"))
  \"Risolve soltanto funzioni pubbliche prima del clock, senza nomi nel percorso caldo.\"
  (multiple-value-bind (symbol visibility) (find-symbol name package)
    (unless (and symbol (eq :external visibility) (fboundp symbol))
      (error \"COD-60: API pubblica ~A/~A assente.\" package name))
    (symbol-function symbol)))

(defun make-series ()
  \"Backend pubblico C4 locale, nessun I/O richiesto dai lookup della campagna.\"
  (let* ((backend (funcall (api \"MAKE-BACKEND\" \"ARCDOCDB.IO\")
                           (lambda (path mode) (declare (ignore path mode)) 814)
                           (lambda (&rest arguments) (declare (ignore arguments))
                             (error \"COD-60: lettura I/O inattesa nella fixture step.\"))
                           (lambda (fd bytes start count) (declare (ignore fd bytes start)) count)
                           (lambda (fd) (declare (ignore fd)) 0)
                           (lambda (fd) (declare (ignore fd)) 0)
                           (lambda (fd) (declare (ignore fd)) 0)))
         (file (funcall (api \"CREA-TEMPORANEO\" \"ARCDOCDB.IO\") \"pool-step-C4.tmp\" :backend backend))
         (log (funcall (api \"CREA-LOG-IO\" \"ARCDOCDB.WAL\") file :segment 814)))
    (values (funcall (api \"CREA-CONTROLLORE-SERIE\" \"ARCDOCDB.SERIES\")
                     (funcall (api \"CREA-REGISTRO-CSN\" \"ARCDOCDB.CSN\") :capacity 4) log :capacity 2)
            file)))

(defun make-dispatch (active cursor)
  \"Quattro shard autentici e tabella singleton; costruzione e risoluzione API fuori clock.\"
  (multiple-value-bind (controller file) (make-series)
    (let* ((ready (funcall (api \"CREA-LISTA-WRITER-PRONTI\" \"ARCDOCDB.EXECUTION\") :shards 4 :capacity 1))
           (context (funcall (api \"CREA-CONTESTO-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\") ready :start cursor))
           (port (funcall (api \"CREA-PORTA-WORKER-POOL\" \"ARCDOCDB.SCHEDULER\") context :active active))
           (writer (funcall (api \"CREA-WRITER-PROGRAMMABILE\" \"ARCDOCDB.EXECUTION\")
                            :capacity 1 :quantum 1 :routing-index 0))
           (registry (funcall (api \"CREA-REGISTRO-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\")
                              (vector writer) (vector controller)))
           (table (funcall (api \"CREA-TABELLA-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\") context registry))
           (links (funcall (lookup-function \"TABELLA-WORKER-SERIE-LINKS\" \"ARCDOCDB.EXECUTION.SERIES\") table)))
      (values (funcall (api \"CREA-DISPATCHER-WRITER-POOL\") port table)
              context ready writer (svref links 0) file))))

(defun close-fixture (file)
  \"Solo cleanup C4: chiude il backend della fixture dopo ogni misura o rifiuto.\"
  (funcall (api \"CHIUDI\" \"ARCDOCDB.IO\") file))

(defun verify-step (step dispatcher expected status origin detail lifecycle)
  \"Oracolo scalare indipendente per tutti e cinque i risultati del passo.\"
  (multiple-value-bind (link outcome actual-origin actual-detail action) (funcall step dispatcher)
    (unless (and (eq expected link) (eq status outcome) (eq origin actual-origin)
                 (eql detail actual-detail) (eq lifecycle action))
      (error \"COD-60: step ~S/~S/~S/~S/~S invece di ~S/~S/~S/~S/~S.\"
             link outcome actual-origin actual-detail action expected status origin detail lifecycle))))
(defun create-empty-cycle ()
  \"Quattro EMPTY attivi: origine CLAIM, cursore0->1->2->3->0, azioneUNCHANGED; token12.\"
  (multiple-value-bind (dispatcher context ready writer link file) (make-dispatch t 0)
    (declare (ignore context ready writer link))
    (let ((step (api \"PASSO-DISPATCHER-POOL\")))
      (values (lambda ()
                (verify-step step dispatcher nil :empty :claim 1 :unchanged)
                (verify-step step dispatcher nil :empty :claim 2 :unchanged)
                (verify-step step dispatcher nil :empty :claim 3 :unchanged)
                (verify-step step dispatcher nil :empty :claim 0 :unchanged)
                12)
              12 (lambda () (close-fixture file))))))
(defun create-inactive-cycle ()
  \"Solo self-test: quattro INACTIVE IDLE conservano cursore2 e origineCLAIM; token20.\"
  (multiple-value-bind (dispatcher context ready writer link file) (make-dispatch nil 2)
    (declare (ignore context ready writer link))
    (let ((step (api \"PASSO-DISPATCHER-POOL\")))
      (values (lambda ()
                (dotimes (i 4) (verify-step step dispatcher nil :inactive :claim 2 :unchanged))
                20)
              20 (lambda () (close-fixture file))))))
(defun drain-claim (context writer)
  \"Cleanup C4 fuori clock: consuma e conferma il solo payload sentinel, poi termina IDLE.\"
  (let ((target (vector nil)))
    (unless (plusp (funcall (api \"INIZIA-TRATTO-WORKER\" \"ARCDOCDB.EXECUTION\") context))
      (error \"COD-60: cleanup begin senza lease.\"))
    (multiple-value-bind (count status token)
        (funcall (api \"PRELEVA-LAVORI-WORKER\" \"ARCDOCDB.EXECUTION\") context target 0 1)
      (unless (and (= 1 count) (eq :messages status) (eq :step-C4 (svref target 0)) (plusp token))
        (error \"COD-60: cleanup perde il payload della fixture.\"))
      (funcall (api \"CONFERMA-LAVORI-WORKER\" \"ARCDOCDB.EXECUTION\") context token))
    (unless (and (eq writer (funcall (api \"WRITER-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\") context))
                 (eq :idle (funcall (api \"TERMINA-TRATTO-WORKER\" \"ARCDOCDB.EXECUTION\") context)))
      (error \"COD-60: cleanup non termina il compito IDLE.\"))))

(defun verify-current (step dispatcher link context writer read-state read-writer read-link-state read-cursor)
  \"CLAIMED prioritario con porta inattiva; nessuna lease, gate o rotazione del cursore.\"
  (verify-step step dispatcher link :claimed :current nil nil)
  (unless (and (eq :claimed (funcall read-state context))
               (eq writer (funcall read-writer context))
               (eq :idle (funcall read-link-state link)) (= 1 (funcall read-cursor context)))
    (error \"COD-60: step CURRENT altera obbligo, link IDLE o cursore1.\")))
(defun create-current-cycle ()
  \"Quattro passi CURRENT su porta inattiva e CLAIMED reale; claim/drain fuori clock; token28.\"
  (multiple-value-bind (dispatcher context ready writer link file) (make-dispatch nil 0)
    (let ((step (api \"PASSO-DISPATCHER-POOL\"))
          (read-state (api \"STATO-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\"))
          (read-writer (api \"WRITER-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\"))
          (read-link-state (api \"STATO-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\"))
          (read-cursor (lookup-function \"CONTESTO-WORKER-WRITER-CURSOR\" \"ARCDOCDB.EXECUTION\")))
      (multiple-value-bind (count status)
          (funcall (api \"ACCODA-LAVORO-WRITER\" \"ARCDOCDB.EXECUTION\") writer :step-C4)
        (unless (and (= 1 count) (eq :schedule status)) (error \"COD-60: enqueue iniziale difforme.\")))
      (unless (= 1 (funcall (api \"PUBBLICA-WRITER-PRONTO\" \"ARCDOCDB.EXECUTION\") ready 0 writer))
        (error \"COD-60: pubblicazione iniziale difforme.\"))
      (multiple-value-bind (actual status cursor)
          (funcall (api \"PRENDI-WRITER-WORKER\" \"ARCDOCDB.EXECUTION\") context)
        (unless (and (eq writer actual) (eq :claimed status) (= 1 cursor))
          (error \"COD-60: claim pubblico iniziale difforme.\")))
      (values (lambda ()
                (dotimes (i 4)
                  (verify-current step dispatcher link context writer read-state read-writer read-link-state read-cursor))
                28)
              28 (lambda () (unwind-protect (drain-claim context writer) (close-fixture file)))))))
(defun campaign-group (name maker report checkpoint)
  \"Nuova fixture per ciascuna replica: obbligo privato indipendente e cleanup sempre fuori clock.\"
  (dotimes (replica +replicas+)
    (multiple-value-bind (function token cleanup) (funcall maker)
      (unwind-protect
           (let ((progress (sample-record replica +iterations+ +warmup+ token)))
             (setf (getf progress :campaign) name (getf report :current-replica) replica
                   (getf report :samples) (append (getf report :samples) (list progress)))
             (funcall checkpoint)
             (sample function +iterations+ token progress)
             (funcall checkpoint)
             (unless (zerop (getf progress :heap-bytes))
               (setf (getf progress :status) :failed (getf progress :diagnostic) \"COD-30: heap osservato positivo.\")
               (error \"COD-30: heap positivo nella campagna ~S replica ~D.\" name replica)))
        (funcall cleanup))))
  report)
(defun campaign (report checkpoint)
  \"Due campagne, fixture nuova per replica; INACTIVE e RECYCLE non misurati.\"
  (campaign-group :empty #'create-empty-cycle report checkpoint)
  (campaign-group :current-inactive #'create-current-cycle report checkpoint)
  (setf (getf report :current-replica) nil) report)
(defun make-report ()
  \"Raw e confini: IDLE governato e CLAIMED prioritario; nessun begin o ricircolo nel clock.\"
  (list :schema-version 1 :kind :pool-step-benchmark :status :running :stage :pending
        :diagnostic nil :process-argv sb-ext:*posix-argv* :tool-arguments (uiop:command-line-arguments)
        :source-fingerprints-before (fingerprints) :source-fingerprints-after nil
        :source-consistency :pending :recorded-at (get-universal-time) :self-test nil
        :samples nil :current-replica nil :sbcl (lisp-implementation-version)
        :machine (machine-type) :os (software-type) :os-version (software-version) :safety 3
        :iterations +iterations+ :warmup +warmup+ :replicas +replicas+
        :timer-units-per-second internal-time-units-per-second
        :campaigns '((:empty :fixtures-per-campaign 5 :shards 4 :port-active t :initial-cursor 0 :calls-per-cycle 4 :token 12)
                    (:current-inactive :fixtures-per-campaign 5 :shards 4 :port-active nil :initial-cursor 1 :calls-per-cycle 4
                     :initial-claim-outside-clock t :worker-phase :claimed :link-phase :idle
                     :detail nil :lifecycle-action nil :scalar-state-oracle-in-cycle t :token 28))
        :token-formula \"sample=N*cycle-token+N*(N-1)/2; EMPTY=12; CURRENT-INACTIVE=28\"
        :limits '(:preallocated-product-and-inputs :fresh-fixture-per-replica
                  :startup-claim-drain-and-gc-excluded :public-claim-and-bounded-drain
                  :counter-not-absolute-nonallocation-proof :external-load-uncontrolled
                  :clock-zero-is-below-resolution :no-time-threshold-no-tuning-claim
                  :empty-is-local-observation :no-real-queued-idle-claim-measured
                  :current-is-repeated-claimed-lookup-with-inactive-port
                  :no-begin-or-live-lease-in-clock :no-recycle-or-refusal-latency-measured
                  :inactive-idle-only-in-self-test :no-concurrent-coordinator
                  :no-physical-worker-lifecycle-qualification)))
(defun run-driver (args &key (product-loader #'load-product) (tester #'self-test) (runner #'campaign))
  \"Driver step compatto; riusa I/O esclusivo e sensore qualificati, preserva raw del fallimento.\"
  (let ((report (make-report)) (directory nil))
    (handler-case
        (progn
          (unless (or (equal args '(\"--self-test\"))
                      (and (= 2 (length args)) (string= \"--bench\" (first args))))
            (error \"COD-61: uso --self-test oppure --bench directory-nuova/.\"))
          (when (= 2 (length args)) (setf directory (acquire-directory (second args))))
          (setf (getf report :stage) :load-product)
          (when directory (write-report report directory))
          (funcall product-loader)
          (setf (getf report :stage) :self-test (getf report :self-test) (funcall tester))
          (when directory
            (setf (getf report :stage) :campaign)
            (funcall runner report (lambda () (write-report report directory))))
          (setf (getf report :status) :ok (getf report :stage) :complete))
      (error (condition)
        (setf (getf report :status) :failed (getf report :diagnostic) (princ-to-string condition))
        (let ((last (car (last (getf report :samples)))))
          (when (and last (eq :running (getf last :status)))
            (setf (getf last :status) :failed (getf last :diagnostic) (princ-to-string condition))))))
    (let ((after (fingerprints)))
      (setf (getf report :source-fingerprints-after) after (getf report :source-consistency)
            (if (equal (getf report :source-fingerprints-before) after) :stable :changed))
      (when (and (eq :ok (getf report :status)) (eq :changed (getf report :source-consistency)))
        (setf (getf report :status) :source-changed (getf report :diagnostic) \"COD-61: sorgenti cambiati.\")))
    (when directory (write-report report directory))
    report))

(defun self-test-reporter ()
  \"Il driver dispatch rifiuta CLI/destinazione e conserva replica conclusa più raw parziale.\"
  (let ((called nil) (root (arcdocdb.pool-lifecycle.measure::fresh-self-test-directory)))
    (unwind-protect
         (progn
           (dolist (args '(nil (\"--bench\") (\"--bad\") (\"--bench\" \"directory\" \"extra\")))
             (unless (and (eq :failed (getf (run-driver args :product-loader (lambda () (setf called t))) :status))
                          (null called))
               (error \"COD-60: CLI invalida eseguita.\")))
           (let* ((existing (acquire-directory (merge-pathnames \"existing/\" root)))
                  (failed (merge-pathnames \"failed/\" root)))
             (write-report '(:sentinel :unchanged) existing)
             (unless (and (eq :failed (getf (run-driver (list \"--bench\" (namestring existing))
                                                      :product-loader (constantly nil)
                                                      :tester (constantly :passed)) :status))
                          (equal (arcdocdb.pool-lifecycle.measure::read-self-test-report existing)
                                 '(:sentinel :unchanged)))
               (error \"COD-60: destinazione precedente non conservata.\"))
             (run-driver (list \"--bench\" (namestring failed))
                         :product-loader (constantly nil) :tester (constantly :passed)
                         :runner (lambda (report checkpoint)
                                   (setf (getf report :current-replica) 1 (getf report :samples)
                                         (list (list :status :ok :raw-ticks 3 :heap-bytes 0)
                                               (list :status :running :raw-ticks 7 :heap-bytes 11
                                                     :diagnostic nil)))
                                   (funcall checkpoint) (error \"fixture: replica interrotta\")))
             (let* ((saved (arcdocdb.pool-lifecycle.measure::read-self-test-report failed))
                    (samples (getf saved :samples)))
               (unless (and (eq :failed (getf saved :status)) (= 1 (getf saved :current-replica))
                            (= 2 (length samples)) (eq :ok (getf (first samples) :status))
                            (eq :failed (getf (second samples) :status))
                            (= 7 (getf (second samples) :raw-ticks))
                            (= 11 (getf (second samples) :heap-bytes)))
                 (error \"COD-60: replica o raw parziale persi.\")))))
      (uiop:delete-directory-tree root :validate t)))
  :passed)


(defun self-test-oracle ()
  \"Ogni risultato step difforme viene respinto separatamente; RECYCLE ha solo oracolo positivo.\"
  (dolist (row '((:wrong :empty :claim 1 :unchanged) (nil :inactive :claim 1 :unchanged)
                 (nil :empty :current 1 :unchanged) (nil :empty :claim 2 :unchanged)
                 (nil :empty :claim 1 :activated)))
    (unless (handler-case
                (progn (verify-step (lambda (dispatcher) (declare (ignore dispatcher)) (values-list row))
                                    nil nil :empty :claim 1 :unchanged) nil)
              (error () t))
      (error \"COD-60: risultato step difforme non respinto: ~S.\" row)))
  (verify-step (lambda (dispatcher) (declare (ignore dispatcher)) (values :link :claimed :recycle 1 nil))
               nil :link :claimed :recycle 1 nil)
  :passed)
(defun self-test ()
  \"Sensore condiviso heap/sink/clock/partial, cinque risultati e tre fixture pubbliche con drain.\"
  (list :status :ok :shared-sensor (arcdocdb.pool-lifecycle.measure::self-test)
        :step-oracles (self-test-oracle) :step-cli-and-partial-raw (self-test-reporter)
        :empty (arcdocdb.pool-lifecycle.measure::self-test-composed #'create-empty-cycle)
        :inactive (arcdocdb.pool-lifecycle.measure::self-test-composed #'create-inactive-cycle)
        :current-inactive (arcdocdb.pool-lifecycle.measure::self-test-composed #'create-current-cycle)))
(defun main ()
  \"Rapporto leggibile; errore nonzero anche per fonte cambiata o heap osservato positivo.\"
  (let ((report (run-driver (uiop:command-line-arguments))))
    (let ((*print-readably* t)) (write report :pretty t) (terpri))
    (unless (eq :ok (getf report :status))
      (format *error-output* \"~&tools/measure-pool-step.lisp: ~A~%\" (getf report :diagnostic))
      (uiop:quit 1))))
(unless (member :arcdocdb-pool-step-measure-library *features*) (main))
")
  (:PATH
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-tests/attempt-01.log")
   :BYTES 1390 :SHA256 "041c050116df5e38b04a8a2838eddceaf0e05f2ce043b6ec1f1ce96940c51e2b" :GIT-BLOB
   "b90eeb1841b4045055cb319ff4b87b75e4ceec57" :TEXT
   "ok    TEST-REQ-CON-002-POOL-STEP-IDLE-ACTIVATES-BEFORE-CLAIM-AND-FORWARDS-ORIGINAL-CURSOR
ok    TEST-REQ-CON-005-POOL-STEP-IDLE-EMPTY-ROTATES-ONCE-WITHOUT-IMPLICIT-SECOND-ATTEMPT
ok    TEST-REQ-CON-005-POOL-STEP-IDLE-REAL-READY-BUSY-FORWARDS-STATUS-WITHOUT-RETRY
ok    TEST-REQ-CON-005-POOL-STEP-IDLE-INACTIVE-KEEPS-READY-AND-CURSOR-WITHOUT-SCAN
ok    TEST-REQ-CON-005-POOL-STEP-IDLE-PENDING-RETIRE-ACKNOWLEDGES-BEFORE-READY-ACCESS
ok    TEST-REQ-CON-002-POOL-STEP-CURRENT-IGNORES-INACTIVE-CORRUPT-AND-RETIRE-WORDS
ok    TEST-REQ-CON-002-POOL-STEP-ROOM-PUBLISHES-AND-RETURNS-WITHOUT-FALL-THROUGH-OR-ACK
ok    TEST-REQ-CON-002-POOL-STEP-FULL-ROUTES-B-ONCE-AND-NEXT-STEP-IS-CURRENT
ok    TEST-REQ-CON-004-POOL-STEP-RESCHEDULE-READY-BUSY-PRESERVES-OBLIGATION-WITHOUT-RETRY
ok    TEST-REQ-CON-004-POOL-STEP-RUNNING-BATCH-FINISHING-AND-FAULTED-REFUSE-BEFORE-DELEGATION
ok    TEST-REQ-AFF-008-POOL-STEP-BINDING-PRECEDES-PHASE-AND-ANY-OPERATIONAL-ENTRY
ok    TEST-REQ-CON-005-POOL-STEP-FOREIGN-OWNER-PRECEDES-BINDING-PHASE-AND-POOL-WORDS
ok    TEST-REQ-AFF-008-POOL-STEP-FULL-ROUTING-FAULT-KEEPS-TRANSFER-AND-FIRST-CONDITION-EQ
ok    TEST-REQ-AFF-008-POOL-STEP-CLAIM-ROUTING-FAULT-KEEPS-SUCCESSFUL-ACTIVATION-ACK
ok    TEST-REQ-CON-004-POOL-STEP-GETTER-FI-OUTSIDE-TYPE-REFUSES-BEFORE-DELEGATION
ok    TEST-REQ-AFF-008-POOL-STEP-INVALID-DISPATCHER-TYPE-KEEPS-FIXTURE
16 test scoped passo superati.
")
  (:PATH
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-tests/scheduler-attempt-01.log")
   :BYTES 9065 :SHA256 "96f18ca6295c87984c1ece6f24beddce7f9ea29867ca220646b27e884da081be" :GIT-BLOB
   "7be4db74b98b8e5a45141209b9eeccfb913aa49f" :TEXT
   "ok    TEST-REQ-THR-001-POOL-CONSTRUCTION-DEFAULTS-AND-VALID-BOUNDS
ok    TEST-REQ-AFF-008-POOL-PRIVATE-CONSTRUCTION-DEFAULTS-AND-EXPLICIT-STATE
ok    TEST-REQ-AFF-008-POOL-GENERATED-EQUALITY-COMPARES-EACH-BOUNDED-SIGNAL
ok    TEST-REQ-AFF-008-POOL-DECLARED-INTEGER-DOMAINS-AND-DIRECTION-MEMBERS
ok    TEST-REQ-AFF-008-POOL-INVALID-CONFIGURATION-HAS-TYPED-REASONS
ok    TEST-REQ-THR-001-POOL-FIRST-SAMPLE-SEEDS-EXACT-FIXED-POINT-SIGNALS
ok    TEST-REQ-AFF-013-POOL-EWMA-INDEPENDENT-ORACLE-AND-NEGATIVE-ROUNDING
ok    TEST-REQ-AFF-008-POOL-INVALID-SAMPLES-PRESERVE-ENTIRE-PUBLIC-STATE
ok    TEST-REQ-AFF-008-POOL-SAMPLE-UPPER-BOUNDS-AND-CLOCK-EXHAUSTION
ok    TEST-REQ-THR-001-POOL-ADDITIVE-GROWTH-NEEDS-COMPLETE-DWELL
ok    TEST-REQ-THR-001-POOL-MULTIPLICATIVE-DECREASE-FLOORS-AND-CLAMPS
ok    TEST-REQ-THR-001-POOL-HYSTERESIS-THRESHOLDS-ARE-INCLUSIVE-AS-SPECIFIED
ok    TEST-REQ-THR-001-POOL-CONFIGURABLE-QUEUE-THRESHOLD-AND-CUSTOM-PERIOD
ok    TEST-REQ-THR-001-POOL-BOUNDS-DO-NOT-EMIT-ZERO-CHANGE-COMMANDS
ok    TEST-REQ-THR-001-POOL-HOLD-REGION-BREAKS-CONTINUOUS-DWELL
ok    TEST-REQ-THR-001-POOL-DIRECTION-CHANGE-RESTARTS-DWELL
ok    TEST-REQ-THR-001-POOL-LONG-GAP-RESETS-EWMA-AND-DWELL
ok    TEST-REQ-THR-001-POOL-GAP-EXACTLY-TWO-PERIODS-KEEPS-EXISTING-DWELL
ok    TEST-REQ-THR-001-POOL-PENDING-TARGET-IS-RETAINED-AND-SENSORS-ADVANCE
ok    TEST-REQ-THR-001-POOL-FIRST-PENDING-SAMPLE-AND-COMPLETED-COMMAND-DWELL
ok    TEST-REQ-CON-005-POOL-CROSS-THREAD-ACCESS-REJECTED-WITHOUT-OWNER-MUTATION
ok    TEST-REQ-AFF-008-POOL-PRIVATE-BOUND-AND-CLOCK-FAULTS-ARE-DETECTED
ok    TEST-REQ-CON-005-POOL-INDEPENDENT-CONTROLLERS-HAVE-DETERMINISTIC-PARALLEL-TRACES
ok    TEST-REQ-CON-005-POOL-PORT-OWNER-AND-REGISTRY-COORDINATOR-ARE-DISTINCT
ok    TEST-REQ-THR-001-POOL-ACTIVATION-RETIREMENT-AWAIT-REAL-WORKER-ACKS
ok    TEST-REQ-AFF-008-POOL-REGISTRY-COPIES-CALLER-VECTOR-AND-BINDS-ONCE
ok    TEST-REQ-AFF-008-POOL-REGISTRY-INVALID-SHAPE-DOES-NOT-BIND-ANY-PORT
ok    TEST-REQ-CON-001-POOL-RETIREMENT-PRESERVES-CLAIM-LEASE-BATCH-AND-FINISHING
ok    TEST-REQ-CON-002-POOL-RESCHEDULE-OBLIGATION-BLOCKS-RETIREMENT-UNTIL-TRANSFER
ok    TEST-REQ-CON-004-POOL-FAULTED-WORKER-RETAINS-COMMAND-REFERENCE-AND-DIAGNOSTIC
ok    TEST-REQ-AFF-008-POOL-PORT-STARTUP-VALIDATES-FLAGS-COORDINATOR-AND-IDLE-DEBTS
ok    TEST-REQ-AFF-008-POOL-STARTUP-REJECTS-COORDINATOR-AND-REUSED-WORKER-OWNER
ok    TEST-REQ-AFF-008-POOL-STARTUP-REJECTS-NONZERO-OR-PENDING-GENERATION-BEFORE-BINDING
ok    TEST-REQ-AFF-008-POOL-INVALID-SAMPLES-DO-NOT-MUTATE-CONTROLLER-OR-PORTS
ok    TEST-REQ-AFF-008-POOL-GENERATION-EXHAUSTION-PRECEDES-EVERY-CONTROLLER-AND-PORT-WRITE
ok    TEST-REQ-AFF-008-POOL-WORD-PROTOCOL-FAULTS-REFUSE-READER-COORDINATOR-AND-WORKER
ok    TEST-REQ-AFF-008-POOL-IDLE-DEBT-REFUSES-ACK-WITHOUT-POISONING-OR-RESET
ok    TEST-REQ-AFF-008-POOL-PRIVATE-REGISTRY-TARGET-CAPACITY-PREFIX-AND-COUNT-INVARIANTS
ok    TEST-REQ-AFF-008-POOL-CAS-CONFLICT-CANNOT-REPORT-REQUEST-OR-ACK-SUCCESS
ok    TEST-REQ-AFF-008-POOL-GENERATED-PORT-EQUALITY-COMPARES-REQUEST-ACK-AND-BINDING
ok    TEST-REQ-CON-005-POOL-TWO-RETIREMENT-ACKS-CAN-ARRIVE-WITH-A-PREFIX-HOLE
ok    TEST-REQ-CON-005-POOL-INACTIVE-CLAIM-KEEPS-REAL-READY-OBLIGATION-AND-CURSOR
ok    TEST-REQ-THR-001-POOL-REAL-GROW-ACKNOWLEDGES-BEFORE-TAKING-READY-WRITER
ok    TEST-REQ-THR-001-POOL-REAL-SHRINK-RETIRES-BEFORE-REMOVING-READY-WRITER
ok    TEST-REQ-CON-005-POOL-FOREIGN-OWNER-REJECTION-PRECEDES-PHASE-AND-WORD-CHECKS
ok    TEST-REQ-CON-004-POOL-EVERY-NONIDLE-PHASE-REFUSES-BEFORE-INACTIVE-OR-DEBT-VALIDATION
ok    TEST-REQ-AFF-008-POOL-IDLE-INCONSISTENCY-REFUSES-RETIREMENT-ACK-AND-C1-POISONING
ok    TEST-REQ-AFF-008-POOL-CORRUPT-WORD-PROTOCOL-PRESERVES-READY-AND-LOCAL-WORKER
ok    TEST-REQ-AFF-008-POOL-RETIREMENT-ACK-CAS-CONFLICT-CANNOT-TAKE-A-READY-WRITER
ok    TEST-REQ-CON-005-POOL-ACTIVE-EMPTY-AND-BUSY-PRESERVE-C1-CURSOR-ROTATION
ok    TEST-REQ-THR-001-POOL-RETIRE-AFTER-ACTIVE-SAMPLE-PERMITS-ONE-LAST-COMPLETE-TASK
ok    TEST-REQ-CON-002-POOL-PENDING-RETIRE-WAITS-FOR-BRIDGE-BATCH-AND-EXPLICIT-HANDOFF
ok    TEST-REQ-CON-002-POOL-FULL-RECYCLE-KEEPS-CLAIMED-AND-ROUTES-NEW-WRITER-BEFORE-RETIRE
ok    TEST-REQ-AFF-008-POOL-DISPATCH-FACTORY-TYPE-AND-CONTEXT-BINDING-REFUSE-WITHOUT-EFFECTS
ok    TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION
ok    TEST-REQ-CON-005-POOL-DISPATCH-FOREIGN-OWNER-PRECEDES-TABLE-PHASE-AND-POOL-CHECKS
ok    TEST-REQ-CON-005-POOL-DISPATCH-INACTIVE-EMPTY-BUSY-NEVER-ENTER-ROUTING
ok    TEST-REQ-CON-002-POOL-DISPATCH-ROUTES-TWO-REAL-WRITERS-WITHOUT-IMPLICIT-BEGIN
ok    TEST-REQ-CON-002-POOL-DISPATCH-EXISTING-CLAIMED-ROUTES-WITHOUT-READING-CORRUPT-POOL-WORDS
ok    TEST-REQ-CON-002-POOL-DISPATCH-PENDING-RETIRE-DRAINS-EXISTING-CLAIMED-BEFORE-ACK
ok    TEST-REQ-CON-002-POOL-DISPATCH-FULL-RECYCLE-ROUTES-NEW-CLAIMED-WHILE-RETIRE-PENDING
ok    TEST-REQ-CON-004-POOL-DISPATCH-ALL-DISALLOWED-PHASES-PRESERVE-FIRST-FAULT-AND-DEBTS
ok    TEST-REQ-AFF-008-POOL-DISPATCH-ROUTING-FAULT-RETAINS-ACTIVATION-ACK-AND-ACQUIRED-OBLIGATION
ok    TEST-REQ-AFF-008-POOL-DISPATCH-CORRUPT-TABLE-BINDING-REFUSES-BEFORE-CLAIM-OR-ROUTING
ok    TEST-REQ-AFF-008-POOL-DISPATCH-CORRUPT-LINK-FAULTS-AFTER-CLAIM-WITHOUT-BEGIN-OR-ROLLBACK
ok    TEST-REQ-AFF-008-POOL-DISPATCH-CONTRADICTORY-GATE-OUTPUT-REFUSES-BEFORE-ROUTING
ok    TEST-REQ-CON-002-POOL-DISPATCH-WRITER-BUSY-BEGIN-KEEPS-CLAIMED-FOR-EXPLICIT-RETRY
ok    TEST-REQ-CON-002-POOL-RECYCLE-ROOM-PUBLISHES-ONCE-WITHOUT-SECOND-CLAIM-OR-ROUTING
ok    TEST-REQ-CON-002-POOL-RECYCLE-FULL-ROUTES-NEW-WRITER-WITHOUT-BEGIN-OR-CURSOR-CHANGE
ok    TEST-REQ-CON-004-POOL-RECYCLE-READY-BUSY-PRESERVES-COMPLETE-OBLIGATION-AND-RING
ok    TEST-REQ-CON-005-POOL-RECYCLE-SIX-DISALLOWED-PHASES-PRESERVE-DEBTS-AND-FIRST-FAULT
ok    TEST-REQ-CON-002-POOL-RECYCLE-EXISTING-OBLIGATION-IGNORES-INACTIVE-AND-CORRUPT-WORDS
ok    TEST-REQ-CON-002-POOL-RECYCLE-ROOM-DOES-NOT-ACKNOWLEDGE-PENDING-RETIRE
ok    TEST-REQ-AFF-008-POOL-RECYCLE-BINDING-REFUSES-BEFORE-TRANSFER
ok    TEST-REQ-CON-005-POOL-RECYCLE-FOREIGN-OWNER-PRECEDES-BINDING-AND-POOL-DATA
ok    TEST-REQ-AFF-008-POOL-RECYCLE-ROUTING-FAULT-KEEPS-COMPLETED-FULL-TRANSFER
ok    TEST-REQ-AFF-008-POOL-RECYCLE-CONTRADICTORY-OUTPUT-REFUSES-BEFORE-ROUTING-WITHOUT-C3-FAULT
ok    TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS
ok    TEST-REQ-CON-004-POOL-RECYCLE-READY-INVARIANT-PRESERVES-ORIGINAL-C1-FAULT
ok    TEST-REQ-CON-004-POOL-RECYCLE-UNKNOWN-STATUS-REFUSES-AT-RUNTIME-WITHOUT-EFFECTS
ok    TEST-REQ-CON-002-POOL-BEGIN-REAL-ACTIVE-FORWARDS-FOUR-VALUES-WITHOUT-POP
ok    TEST-REQ-CON-002-POOL-BEGIN-FULL-RECYCLE-STARTS-CURRENT-B-INSTEAD-OF-PREVIOUS-A
ok    TEST-REQ-CON-002-POOL-BEGIN-EXISTING-CLAIM-IGNORES-INACTIVE-CORRUPT-AND-RETIRE-WORDS
ok    TEST-REQ-CON-005-POOL-BEGIN-REAL-WRITER-BUSY-KEEPS-CLAIMED-AND-BOTH-GENERATIONS
ok    TEST-REQ-CON-005-POOL-BEGIN-REAL-SERIE-BUSY-RETURNS-CLOSING-WITH-EXPLICIT-CLOSE
ok    TEST-REQ-AFF-008-POOL-BEGIN-SERIE-GENERATION-LIMIT-RETURNS-TOKEN-AND-EXPLICIT-CLOSE
ok    TEST-REQ-AFF-008-POOL-BEGIN-LOCAL-GENERATION-LIMIT-PRECEDES-WRITER-AND-SERIE-ACQUIRE
ok    TEST-REQ-AFF-008-POOL-BEGIN-BINDING-PRECEDES-ROUTING-AND-ANY-ACQUISITION
ok    TEST-REQ-CON-005-POOL-BEGIN-REAL-FOREIGN-OWNER-PRECEDES-BINDING-AND-ACQUISITIONS
ok    TEST-REQ-CON-005-POOL-BEGIN-SIX-WRONG-PHASES-PRESERVE-CAPACITIES-AND-PRIOR-FAULT
ok    TEST-REQ-AFF-008-POOL-BEGIN-ROUTING-FAULT-PRECEDES-BEGIN-AND-PRESERVES-ORIGINAL-CONDITION
ok    TEST-REQ-AFF-008-POOL-BEGIN-REAL-WRITER-NOT-READY-PROPAGATES-C1-FAULT-EQ
ok    TEST-REQ-AFF-008-POOL-BEGIN-UNEXPECTED-SERIE-ACQUIRE-KEEPS-C1-CAPACITY-AND-CONDITION-EQ
ok    TEST-REQ-AFF-008-POOL-BEGIN-INVALID-DISPATCHER-TYPE-PRESERVES-FIXTURE
ok    TEST-REQ-CON-002-POOL-STEP-IDLE-ACTIVATES-BEFORE-CLAIM-AND-FORWARDS-ORIGINAL-CURSOR
ok    TEST-REQ-CON-005-POOL-STEP-IDLE-EMPTY-ROTATES-ONCE-WITHOUT-IMPLICIT-SECOND-ATTEMPT
ok    TEST-REQ-CON-005-POOL-STEP-IDLE-REAL-READY-BUSY-FORWARDS-STATUS-WITHOUT-RETRY
ok    TEST-REQ-CON-005-POOL-STEP-IDLE-INACTIVE-KEEPS-READY-AND-CURSOR-WITHOUT-SCAN
ok    TEST-REQ-CON-005-POOL-STEP-IDLE-PENDING-RETIRE-ACKNOWLEDGES-BEFORE-READY-ACCESS
ok    TEST-REQ-CON-002-POOL-STEP-CURRENT-IGNORES-INACTIVE-CORRUPT-AND-RETIRE-WORDS
ok    TEST-REQ-CON-002-POOL-STEP-ROOM-PUBLISHES-AND-RETURNS-WITHOUT-FALL-THROUGH-OR-ACK
ok    TEST-REQ-CON-002-POOL-STEP-FULL-ROUTES-B-ONCE-AND-NEXT-STEP-IS-CURRENT
ok    TEST-REQ-CON-004-POOL-STEP-RESCHEDULE-READY-BUSY-PRESERVES-OBLIGATION-WITHOUT-RETRY
ok    TEST-REQ-CON-004-POOL-STEP-RUNNING-BATCH-FINISHING-AND-FAULTED-REFUSE-BEFORE-DELEGATION
ok    TEST-REQ-AFF-008-POOL-STEP-BINDING-PRECEDES-PHASE-AND-ANY-OPERATIONAL-ENTRY
ok    TEST-REQ-CON-005-POOL-STEP-FOREIGN-OWNER-PRECEDES-BINDING-PHASE-AND-POOL-WORDS
ok    TEST-REQ-AFF-008-POOL-STEP-FULL-ROUTING-FAULT-KEEPS-TRANSFER-AND-FIRST-CONDITION-EQ
ok    TEST-REQ-AFF-008-POOL-STEP-CLAIM-ROUTING-FAULT-KEEPS-SUCCESSFUL-ACTIVATION-ACK
ok    TEST-REQ-CON-004-POOL-STEP-GETTER-FI-OUTSIDE-TYPE-REFUSES-BEFORE-DELEGATION
ok    TEST-REQ-AFF-008-POOL-STEP-INVALID-DISPATCHER-TYPE-KEEPS-FIXTURE
110 test del controllore pool superati.
")
  (:PATH
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-tests/scheduler.lisp")
   :BYTES 649 :SHA256 "3b5a1e4ff1e3b32cfae44674b9e378dd25a1ebd260ed074af811d73c4d9f7e2e" :GIT-BLOB
   "c0c04c55381a7dc521604d5a7eb41c7c66ea5851" :TEXT "(require :asdf)
(asdf:initialize-output-translations
 `(:output-translations
   (t ,(namestring (merge-pathnames \"spikes/out/pool-step-tests/cache/\" (truename \"./\"))))
   :ignore-inherited-configuration))
(setf asdf:*compile-file-failure-behaviour* :error
      asdf:*compile-file-warnings-behaviour* :error)
(handler-bind ((warning (lambda (condition)
                          (unless (typep condition 'sb-kernel:redefinition-warning)
                            (error \"Avviso non ammesso: ~A\" condition)))))
  (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
  (asdf:load-system \"arcdocdb/tests\"))
(arcdocdb.scheduler.tests:run)
")
  (:PATH
   #A((99) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-tests/scoped.lisp")
   :BYTES 910 :SHA256 "c4411af9950552ef98263431d7470a0e3bdb541485be85c3cf27cd8a0010196e" :GIT-BLOB
   "7e4e1ec46a73fab6b16a4086672c15b45e868072" :TEXT "(require :asdf)
(asdf:initialize-output-translations
 `(:output-translations
   (t ,(namestring (merge-pathnames \"spikes/out/pool-step-tests/cache/\" (truename \"./\"))))
   :ignore-inherited-configuration))
(setf asdf:*compile-file-failure-behaviour* :error
      asdf:*compile-file-warnings-behaviour* :error)
(handler-bind ((warning (lambda (condition)
                          (unless (typep condition 'sb-kernel:redefinition-warning)
                            (error \"Avviso non ammesso: ~A\" condition)))))
  (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
  (asdf:load-system \"arcdocdb/tests\"))
(let ((tests (remove-if-not
              (lambda (name) (search \"POOL-STEP-\" (symbol-name name)))
              arcdocdb.scheduler.tests::*tests*)))
  (dolist (name (reverse tests)) (funcall name) (format t \"ok    ~A~%\" name))
  (format t \"~D test scoped passo superati.~%\" (length tests)))
")
  (:PATH
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-tests/source-attempt-01.lisp")
   :BYTES 28210 :SHA256 "d3e71761c6c27e3f90fb445eb1994e3c567812ea5e512acf10e36232ef26fc31"
   :GIT-BLOB "d0ff803608990744408749722210e812f6268782" :TEXT
   ";;;; Un passo bounded seleziona claim, obbligo corrente oppure ricircolo.
;;;; OWNER: porta, dispatcher, contesto e link sul creatore della fixture.
;;;; FI quiescenti: sentinelle ripristinate, parole/binding/limiti dichiarati.
(in-package #:arcdocdb.scheduler.tests)

(defun pool-step-check (dispatcher link status origin detail action)
  \"Oracolo dei cinque valori: cursore, count e NIL non sono intercambiabili.\"
  (is (equal (list link status origin detail action)
             (multiple-value-list
              (arcdocdb.scheduler.dispatch:passo-dispatcher-pool dispatcher)))))

(defun pool-step-delegates (expected thunk)
  \"FI di osservazione: una sola chiamata all'ingresso selezionato, zero agli altri.\"
  (let ((names #(arcdocdb.scheduler.dispatch:prendi-collegamento-pool
                 arcdocdb.scheduler.dispatch:collega-obbligo-pool
                 arcdocdb.scheduler.dispatch:ricircola-collegamento-pool))
        (origins #(:claim :current :recycle)) (calls (vector 0 0 0)))
    (labels ((protect (index)
               (if (= index 3) (funcall thunk)
                   (let ((original (fdefinition (svref names index))))
                     (pool-claim-function-fi
                      (svref names index)
                      (lambda (dispatcher)
                        (incf (svref calls index)) (funcall original dispatcher))
                      (lambda () (protect (1+ index))))))))
      (multiple-value-prog1 (protect 0)
        (dotimes (index 3)
          (is (= (if (eq expected (svref origins index)) 1 0) (svref calls index))))))))

(defun pool-step-without-progress (thunk)
  \"Nessun begin, pop, ACK batch o end prima che il caller li richieda esplicitamente.\"
  (labels ((protect (names)
             (if (null names) (funcall thunk)
                 (pool-claim-function-fi
                  (first names)
                  (lambda (&rest arguments) (declare (ignore arguments))
                    (error \"Avanzamento implicito nel passo dispatcher: ~S.\" (first names)))
                  (lambda () (protect (rest names)))))))
    (protect '(arcdocdb.scheduler.dispatch:inizia-obbligo-pool
               arcdocdb.execution.series:inizia-worker-serie
               arcdocdb.execution.series:preleva-worker-serie
               arcdocdb.execution.series:conferma-worker-serie
               arcdocdb.execution.series:termina-worker-serie))))

(defun pool-step-refusal (dispatcher port table writers type reason)
  (pool-dispatch-refusal
   port table writers
   (lambda () (arcdocdb.scheduler.dispatch:passo-dispatcher-pool dispatcher)) type reason))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-step-idle-activates-before-claim-and-forwards-original-cursor
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :active nil :shards 3 :start 1 :left-items '(:a1))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 0))))
    ;; FI coordinator quiescente: l'ACK deve precedere la vera presa di A.
    (setf (arcdocdb.scheduler::porta-worker-pool-request port) 3)
    (let ((before (map 'list #'pool-dispatch-series-image controllers))
          (link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)))
      (pool-step-without-progress
       (lambda ()
         (pool-step-delegates :claim
          (lambda () (pool-step-check dispatcher link :claimed :claim 0 :activated)))))
      (is (equal '(3 3 nil) (lifecycle-words port)))
      (is (eq :claimed (arcdocdb.execution:stato-worker-writer context)))
      (is (eq (svref writers 0) (arcdocdb.execution:writer-worker-writer context)))
      (is (= 2 (arcdocdb.execution::contesto-worker-writer-home context)))
      (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
      (is (eq :idle (arcdocdb.execution.series:stato-worker-serie link)))
      (is (equalp before (map 'list #'pool-dispatch-series-image controllers)))
      (pool-dispatch-finish link :a1 :idle))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-step-idle-empty-rotates-once-without-implicit-second-attempt
  (with-pool-dispatch (dispatcher port context ready table writers controllers :shards 3 :start 1)
    (declare (ignorable ready))
    (let ((before (map 'list #'pool-dispatch-series-image controllers)))
      (pool-step-without-progress
       (lambda ()
         (pool-step-delegates :claim
          (lambda () (pool-step-check dispatcher nil :empty :claim 2 :unchanged)))))
      (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))
      (is (null (arcdocdb.execution:writer-worker-writer context)))
      (is (equal '(1 1 nil) (lifecycle-words port)))
      (is (equalp before (map 'list #'pool-dispatch-series-image controllers)))
      (is (every (lambda (link) (eq :idle (arcdocdb.execution.series:stato-worker-serie link)))
                 (arcdocdb.execution.series::tabella-worker-serie-links table))))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-step-idle-real-ready-busy-forwards-status-without-retry
  (with-pool-dispatch (dispatcher port context ready table writers controllers :shards 3 :start 1)
    (declare (ignorable port controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 1))))
    (let ((partition (arcdocdb.execution.tests::ready-test-partition ready 2)))
      (arcdocdb.execution.tests::ready-call-with-guards
       (list partition)
       (lambda ()
         (let ((before (arcdocdb.execution.tests::ready-fi-snapshot partition)))
           (pool-step-without-progress
            (lambda ()
              (pool-step-delegates :claim
               (lambda () (pool-step-check dispatcher nil :busy :claim 2 :unchanged)))))
           (is (equalp before (arcdocdb.execution.tests::ready-fi-snapshot partition)))))))
    (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 1) :claimed 0)
    (pool-dispatch-finish
     (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 1) :b1 :idle)))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-step-idle-inactive-keeps-ready-and-cursor-without-scan
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :active nil :shards 3 :start 2 :left-items '(:a1))
    (declare (ignorable controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (let ((before (pool-dispatch-image port table writers)))
      (pool-claim-function-fi
       'arcdocdb.execution::%prova-pronta
       (lambda (partition) (declare (ignore partition)) (error \"Scansione inattiva nel passo.\"))
       (lambda ()
         (pool-step-without-progress
          (lambda ()
            (pool-step-delegates :claim
             (lambda () (pool-step-check dispatcher nil :inactive :claim 2 :unchanged)))))))
      (is (equalp before (pool-dispatch-image port table writers))))
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 1)
    (pool-dispatch-finish
     (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0) :a1 :idle)))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-step-idle-pending-retire-acknowledges-before-ready-access
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :shards 3 :start 1 :left-items '(:a1))
    (declare (ignorable controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 0))))
    (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
    (let ((before (arcdocdb.execution.tests::ready-fi-snapshot
                   (arcdocdb.execution.tests::ready-test-partition ready 2))))
      (pool-claim-function-fi
       'arcdocdb.execution::%prova-pronta
       (lambda (partition) (declare (ignore partition)) (error \"Scansione dopo ritiro.\"))
       (lambda ()
         (pool-step-delegates :claim
          (lambda () (pool-step-check dispatcher nil :inactive :claim 1 :retired)))))
      (is (equal '(2 2 nil) (lifecycle-words port)))
      (is (equalp before (arcdocdb.execution.tests::ready-fi-snapshot
                         (arcdocdb.execution.tests::ready-test-partition ready 2)))))
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0) :a1 :idle)))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-step-current-ignores-inactive-corrupt-and-retire-words
  (dolist (scenario '(:inactive :corrupt :retire))
    (with-pool-dispatch (dispatcher port context ready table writers controllers
                                   :active (not (eq scenario :inactive)) :left-items '(:a1))
      (declare (ignorable ready controllers))
      (is (null (arcdocdb.execution:adotta-writer-worker context (svref writers 0) 0)))
      ;; FI coordinator quiescente: CURRENT non valida o conferma il canale pool.
      (case scenario
        (:corrupt (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4
                        (arcdocdb.scheduler::porta-worker-pool-ack port) 0))
        (:retire (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)))
      (let ((before (pool-dispatch-image port table writers))
            (link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)))
        (pool-recycle-without-gate
         (lambda ()
           (pool-step-without-progress
            (lambda ()
              (pool-step-delegates :current
               (lambda () (pool-step-check dispatcher link :claimed :current nil nil)))))))
        (is (equalp before (pool-dispatch-image port table writers)))
        (pool-dispatch-finish link :a1 :idle))
      (when (eq scenario :retire)
        (pool-step-check dispatcher nil :inactive :claim 0 :retired)
        (is (equal '(2 2 nil) (lifecycle-words port)))))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-step-room-publishes-and-returns-without-fall-through-or-ack
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :shards 3 :capacity 2 :start 1)
    (declare (ignorable controllers))
    (pool-recycle-reschedule dispatcher context ready writers 2)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 1))))
    (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
    (pool-recycle-without-gate
     (lambda ()
       (pool-step-without-progress
        (lambda ()
          (pool-step-delegates :recycle
           (lambda () (pool-step-check dispatcher nil :published :recycle 2 nil)))))))
    (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))
    (is (null (arcdocdb.execution:writer-worker-writer context)))
    (is (zerop (arcdocdb.execution::contesto-worker-writer-cursor context)))
    (is (= 2 (arcdocdb.execution::contesto-worker-writer-home context)))
    (is (equal '(2 1 nil) (lifecycle-words port)))
    ;; Solo il passo successivo osserva IDLE e conferma il ritiro pendente.
    (pool-step-check dispatcher nil :inactive :claim 0 :retired)
    (is (equal '(2 2 nil) (lifecycle-words port)))
    ;; FIFO atteso B poi A: entrambi sono rimasti nel ring dopo il passo room.
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 1) :claimed 0)
    (pool-dispatch-finish
     (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 1) :b1 :idle)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0) :a2 :idle)))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-step-full-routes-b-once-and-next-step-is-current
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :shards 3 :start 1)
    (pool-recycle-reschedule dispatcher context ready writers 2)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 1))))
    (let ((link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 1))
          (before (map 'list #'pool-dispatch-series-image controllers)))
      (pool-recycle-without-gate
       (lambda ()
         (pool-step-without-progress
          (lambda ()
            (pool-step-delegates :recycle
             (lambda () (pool-step-check dispatcher link :claimed :recycle 1 nil)))))))
      (is (eq :claimed (arcdocdb.execution:stato-worker-writer context)))
      (is (eq (svref writers 1) (arcdocdb.execution:writer-worker-writer context)))
      (is (eq :idle (arcdocdb.execution.series:stato-worker-serie link)))
      (is (zerop (arcdocdb.execution::contesto-worker-writer-cursor context)))
      (is (= 2 (arcdocdb.execution::contesto-worker-writer-home context)))
      (is (equalp before (map 'list #'pool-dispatch-series-image controllers)))
      (is (equal '(1 1 nil) (lifecycle-words port)))
      (let ((current-before (pool-dispatch-image port table writers)))
        (pool-step-delegates :current
         (lambda () (pool-step-check dispatcher link :claimed :current nil nil)))
        (is (equalp current-before (pool-dispatch-image port table writers))))
      (pool-dispatch-finish link :b1 :idle))
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0) :a2 :idle)))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-004-pool-step-reschedule-ready-busy-preserves-obligation-without-retry
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable controllers))
    (pool-recycle-reschedule dispatcher context ready writers 0)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 1))))
    ;; Contesa reale sulla guard CAS della partizione home, non BUSY sintetico.
    (arcdocdb.execution.tests::ready-call-with-guards
     (list (arcdocdb.execution.tests::ready-test-partition ready 0))
     (lambda ()
       (pool-step-without-progress
        (lambda ()
          (pool-step-delegates :recycle
           (lambda () (pool-step-refusal dispatcher port table writers
                                          'resource-exhausted :ready-queue-busy)))))))
    (let ((link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 1)))
      (pool-step-check dispatcher link :claimed :recycle 1 nil)
      (pool-dispatch-finish link :b1 :idle))
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0) :a2 :idle)))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-004-pool-step-running-batch-finishing-and-faulted-refuse-before-delegation
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable controllers))
    (flet ((refuse ()
             (pool-step-delegates nil
              (lambda () (pool-step-refusal dispatcher port table writers
                                             'resource-exhausted :worker-state)))))
      (let* ((link (pool-begin-claim dispatcher context ready table writers))
             (token (pool-claim-bridge-begin link)))
        (refuse)
        (let ((batch (pool-claim-bridge-pop link token :a1)))
          (refuse)
          (is (null (arcdocdb.execution.series:conferma-worker-serie link token batch))))
        (lifecycle-queue-busy
         (arcdocdb.execution::writer-programmabile-queue (svref writers 0))
         (lambda ()
           (signals resource-exhausted
             (arcdocdb.execution.series:termina-worker-serie link token) :writer-queue-busy)
           (is (eq :finishing (arcdocdb.execution:stato-worker-writer context)))
           (refuse)))
        (is (eq :schedule (arcdocdb.execution.series:termina-worker-serie link token)))
        (pool-recycle-check dispatcher nil :published 1)
        (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
        (pool-dispatch-finish link :a2 :idle))
      ;; FI diagnostica: la prima causa e terminale, mai sostituita da un rifiuto C3.
      (let ((original (make-condition 'invariant-violation :reason :worker-state)))
        (setf (arcdocdb.execution::contesto-worker-writer-state context) :faulted
              (arcdocdb.execution::contesto-worker-writer-fault context) original)
        (refuse)
        (is (eq original (arcdocdb.execution:errore-worker-writer context)))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-step-binding-precedes-phase-and-any-operational-entry
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable controllers))
    (pool-recycle-reschedule dispatcher context ready writers 0)
    (let* ((other (arcdocdb.execution:crea-contesto-worker-writer ready))
           (bad-table (arcdocdb.execution.series::%make-tabella-worker-serie
                       other (arcdocdb.execution.series::tabella-worker-serie-registry table)
                       (arcdocdb.execution.series::tabella-worker-serie-links table)))
           (bad (arcdocdb.scheduler.dispatch::%make-dispatcher-writer-pool port bad-table)))
      (pool-claim-function-fi
       'arcdocdb.execution:stato-worker-writer
       (lambda (worker) (declare (ignore worker)) (error \"Fase letta prima del binding.\"))
       (lambda ()
         (pool-step-delegates nil
          (lambda () (pool-step-refusal bad port table writers
                                         'invalid-argument :pool-dispatcher-binding)))))
      (is (eq :idle (arcdocdb.execution:stato-worker-writer other))))
    (pool-step-check dispatcher nil :published :recycle 1 nil)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0) :a2 :idle)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-step-foreign-owner-precedes-binding-phase-and-pool-words
  ;; Prova negativa su owner distinto; non afferma lavoro positivo concorrente.
  (let ((worker (lifecycle-fixture-start t)) (dispatcher nil) (table nil) (writers nil)
        (left-file nil) (right-file nil))
    (unwind-protect
         (progn
           (lifecycle-call
            worker
            (lambda (owned)
              (multiple-value-bind (left resource) (pool-claim-series 89)
                (setf left-file resource)
                (multiple-value-bind (right resource) (pool-claim-series 90)
                  (setf right-file resource writers (vector (pool-claim-writer '(:a1) 0)
                                                           (pool-claim-writer '(:b1) 1))
                        table (arcdocdb.execution.series:crea-tabella-worker-serie
                               (lifecycle-fixture-context owned)
                               (arcdocdb.execution.series:crea-registro-worker-serie
                                writers (vector left right)))
                        dispatcher (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool
                                    (lifecycle-fixture-port owned) table))))
              (is (null (arcdocdb.execution:adotta-writer-worker
                         (lifecycle-fixture-context owned) (svref writers 0) 0))) :ok))
           (let* ((port (lifecycle-fixture-port worker))
                  (other (arcdocdb.execution:crea-contesto-worker-writer
                          (pool-claim-ready (lifecycle-fixture-context worker))))
                  (bad-table (arcdocdb.execution.series::%make-tabella-worker-serie
                              other (arcdocdb.execution.series::tabella-worker-serie-registry table)
                              (arcdocdb.execution.series::tabella-worker-serie-links table)))
                  (bad (arcdocdb.scheduler.dispatch::%make-dispatcher-writer-pool port bad-table)))
             (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4)
             (pool-claim-function-fi
              'arcdocdb.execution:stato-worker-writer
              (lambda (context) (declare (ignore context)) (error \"Fase da owner straniero.\"))
              (lambda ()
                (pool-step-delegates nil
                 (lambda () (pool-step-refusal bad port table writers
                                                'invalid-argument :pool-worker-owner)))))
             (setf (arcdocdb.scheduler::porta-worker-pool-request port) 1))
           (lifecycle-call
            worker
            (lambda (owned)
              (declare (ignore owned))
              (pool-dispatch-finish
               (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0) :a1 :idle)
              :ok)))
      (when left-file
        (lifecycle-call worker (lambda (owned) (declare (ignore owned))
                                 (when right-file (arcdocdb.io:chiudi right-file))
                                 (arcdocdb.io:chiudi left-file) :ok)))
      (lifecycle-fixtures-stop (list worker)))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-step-full-routing-fault-keeps-transfer-and-first-condition-eq
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :shards 3 :start 1)
    (pool-recycle-reschedule dispatcher context ready writers 2)
    (let* ((unknown (pool-claim-writer '(:unknown) 2))
           (series-before (map 'list #'pool-dispatch-series-image controllers))
           (old-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0)))
           (unknown-before (arcdocdb.execution.tests::handoff-fi-snapshot unknown)))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 unknown)))
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
      (let ((condition
              (pool-step-without-progress
               (lambda ()
                 (pool-step-delegates :recycle
                  (lambda ()
                    (arcdocdb.execution.tests::worker-capture-condition
                     (lambda () (arcdocdb.scheduler.dispatch:passo-dispatcher-pool dispatcher))
                     'invariant-violation :worker-serie-routing)))))))
        (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
        (is (eq unknown (arcdocdb.execution:writer-worker-writer context)))
        (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
        (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
        (is (zerop (arcdocdb.execution::contesto-worker-writer-pending context)))
        (is (= 2 (arcdocdb.execution::contesto-worker-writer-home context)))
        (is (zerop (arcdocdb.execution::contesto-worker-writer-cursor context)))
        (is (equal '(2 1 nil) (lifecycle-words port)))
        (is (equalp old-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
        (is (equalp unknown-before (arcdocdb.execution.tests::handoff-fi-snapshot unknown)))
        (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
        (pool-step-delegates nil
         (lambda () (pool-step-refusal dispatcher port table writers
                                        'resource-exhausted :worker-state)))
        (is (eq condition (arcdocdb.execution:errore-worker-writer context))))
      ;; Il vecchio A e gia nel ring: niente rollback o seconda presa dopo il fault.
      (multiple-value-bind (writer status next) (arcdocdb.execution:preleva-writer-pronto ready 2)
        (is (eq writer (svref writers 0))) (is (eq status :writer)) (is (zerop next))))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-step-claim-routing-fault-keeps-successful-activation-ack
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :active nil :shards 3 :start 1)
    (let* ((unknown (pool-claim-writer '(:unknown) 2))
           (series-before (map 'list #'pool-dispatch-series-image controllers)))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 unknown)))
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 3)
      (let ((condition
              (pool-step-delegates :claim
               (lambda ()
                 (arcdocdb.execution.tests::worker-capture-condition
                  (lambda () (arcdocdb.scheduler.dispatch:passo-dispatcher-pool dispatcher))
                  'invariant-violation :worker-serie-routing)))))
        (is (equal '(3 3 nil) (lifecycle-words port)))
        (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
        (is (eq unknown (arcdocdb.execution:writer-worker-writer context)))
        (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
        (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
        (is (zerop (arcdocdb.execution::contesto-worker-writer-cursor context)))
        (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
        (pool-step-delegates nil
         (lambda () (pool-step-refusal dispatcher port table writers
                                        'resource-exhausted :worker-state)))
        (is (eq condition (arcdocdb.execution:errore-worker-writer context)))))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-004-pool-step-getter-fi-outside-type-refuses-before-delegation
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (declare (ignorable ready controllers))
    (is (null (arcdocdb.execution:adotta-writer-worker context (svref writers 0) 0)))
    (labels ((reject-phase (phase)
               (let ((calls 0))
                 ;; FI fuori dalla ftype del getter, distinta dalle fasi nominali C1.
                 (pool-claim-function-fi
                  'arcdocdb.execution:stato-worker-writer
                  (lambda (worker) (declare (ignore worker)) (incf calls) phase)
                  (lambda ()
                    (pool-step-delegates nil
                     (lambda () (pool-step-refusal dispatcher port table writers
                                                    'invariant-violation :pool-dispatcher-state)))))
                 (is (= 1 calls)))))
      (dolist (phase (list :unknown nil 0 \"invalid\" '(invalid) #()))
        (reject-phase phase))
      (pool-dispatch-finish
       (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0) :a1 :idle)
      ;; FI diagnostica: il rifiuto C3 non sostituisce una prima causa gia presente.
      (let ((original (make-condition 'invariant-violation :reason :worker-state)))
        (setf (arcdocdb.execution::contesto-worker-writer-state context) :faulted
              (arcdocdb.execution::contesto-worker-writer-fault context) original)
        (reject-phase :unknown)
        (is (eq original (arcdocdb.execution:errore-worker-writer context)))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-step-invalid-dispatcher-type-keeps-fixture
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable dispatcher context ready controllers))
    (let ((before (pool-dispatch-image port table writers)))
      (signals type-error
        (funcall (fdefinition 'arcdocdb.scheduler.dispatch:passo-dispatcher-pool) :invalid))
      (is (equalp before (pool-dispatch-image port table writers))))))
")
  (:PATH
   #A((102) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-benchmark-attempt-01.log")
   :BYTES 271 :SHA256 "ce92fde28b6a2cbfb94cb0d98d3410b14ea1bd1063931496f09f64054c780638" :GIT-BLOB
   "15e0f6bb2b02b9ff042283832a7abbf57e0339c2" :TEXT
   ":OK: sbcl --noinform --no-userinit --no-sysinit --script spikes/out/pool-step-measure/tool-run.lisp --bench spikes/out/pool-step-measure/bench-attempt-01/; record: /private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/4001073141-command-45181-0/report.lisp
")
  (:PATH
   #A((101) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-coverage-attempt-01.log")
   :BYTES 305 :SHA256 "b685cd2a02d8a7f67e7d397534bb49d59381db15fb358aa13fd642cbcf0db8ee" :GIT-BLOB
   "58410ffe252f7645f5f7945dbe317f8d02f2393a" :TEXT
   ":OK: sbcl --dynamic-space-size 2048 --noinform --no-userinit --no-sysinit --script spikes/out/pool-step-measure/coverage-run.lisp --report spikes/out/pool-step-measure/coverage-attempt-01/; record: /private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/4001073032-command-39128-0/report.lisp
")
  (:PATH
   #A((102) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-fullcheck-attempt-01.log")
   :BYTES 137 :SHA256 "65be31533f954949259058eff5e8d0cf024125249d26714a266ae64f5c869f75" :GIT-BLOB
   "7036a337d4f1f5bb7480830a6563a371416551c3" :TEXT
   ":OK: make check-core; record: /private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/4001073020-command-38577-0/report.lisp
")
  (:PATH
   #A((114) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-measure/bench-attempt-01/report.lisp")
   :BYTES 87351 :SHA256 "9e590a3e3ce0e5b14f6ff3d6481499cf7b1684186a127c639dbb3676e83de95b"
   :GIT-BLOB "515b042ac22cebfca6e87d2e717b5976c6a392b5" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :POOL-STEP-BENCHMARK :STATUS :OK :STAGE :COMPLETE
 :DIAGNOSTIC NIL :PROCESS-ARGV
 (#A((48) BASE-CHAR . \"/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl\")
  #A((7) BASE-CHAR . \"--bench\")
  #A((46) BASE-CHAR . \"spikes/out/pool-step-measure/bench-attempt-01/\"))
 :TOOL-ARGUMENTS
 (#A((7) BASE-CHAR . \"--bench\")
  #A((46) BASE-CHAR . \"spikes/out/pool-step-measure/bench-attempt-01/\"))
 :SOURCE-FINGERPRINTS-BEFORE
 ((:FILE \"arcdocdb.asd\" :MD5
   #A((32) BASE-CHAR . \"3ef9d9f3ca1e4d2341782d7fed6cf819\"))
  (:FILE \"tools/measure-pool-lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"72a85a626ffb60185baf7602d28517e9\"))
  (:FILE \"src/active/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"bf244695c3c14a1a0148517b48052f5d\"))
  (:FILE \"src/active/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"0ce41661b5cd26fe2edb944cca142f98\"))
  (:FILE \"src/active/prepare.lisp\" :MD5
   #A((32) BASE-CHAR . \"e3238a39b721a3a5ac1055bc1a30feba\"))
  (:FILE \"src/active/source.lisp\" :MD5
   #A((32) BASE-CHAR . \"50c6d9f4e4eb68c8018acb6a3fe70c8e\"))
  (:FILE \"src/active/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe47862290f99d6217361f4302e2faf2\"))
  (:FILE \"src/cache/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"5d70197c8b64ad6f20c8be47a60c73ca\"))
  (:FILE \"src/cache/clock.lisp\" :MD5
   #A((32) BASE-CHAR . \"3546cf7f5c5ed138068548c20064f499\"))
  (:FILE \"src/cache/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"72f3a33ce27ddf94c49c495580520004\"))
  (:FILE \"src/cache/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1f6a8e7aa4faed88e984b39871d1e53\"))
  (:FILE \"src/cache/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"82f937b7b08bd1696ad9c88da2e1c60c\"))
  (:FILE \"src/cache/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a25648d870eaa4f0b6e1e3b2cf76e28e\"))
  (:FILE \"src/cache/write.lisp\" :MD5
   #A((32) BASE-CHAR . \"fc09021f74fb50aac57589614dae04d7\"))
  (:FILE \"src/codec/cbor-array-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"560fa1b10432d16edb830014e95ea4dc\"))
  (:FILE \"src/codec/cbor-array-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"0429206ab6069f053c66da4c56439cfb\"))
  (:FILE \"src/codec/cbor-float-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"bc7a7b176e8cdd361b7c4306a1a4de4b\"))
  (:FILE \"src/codec/cbor-float-narrow.lisp\" :MD5
   #A((32) BASE-CHAR . \"c15cc9d91355860357ed434e58d1f4cb\"))
  (:FILE \"src/codec/cbor-float-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"f3b22be81a36e1713c34e890c82c6700\"))
  (:FILE \"src/codec/cbor-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"6e8c6a49314c2f460aa6f8a1759200b6\"))
  (:FILE \"src/codec/cbor-map-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"e3d33d0453e2d2feb57730cb15f12dab\"))
  (:FILE \"src/codec/cbor-map-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"66ff30cb4a72e6486b4a942311da5336\"))
  (:FILE \"src/codec/cbor-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"ecd8fe950344059c629927b38fb6e4aa\"))
  (:FILE \"src/codec/cbor-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"808b6366b341ff82314ff6e9b5d0da7e\"))
  (:FILE \"src/codec/cbor-scan-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"f6488e987889432b375254021825dbe5\"))
  (:FILE \"src/codec/cbor-scan-items.lisp\" :MD5
   #A((32) BASE-CHAR . \"706c0baa4158bf272c4b0df17c1439d2\"))
  (:FILE \"src/codec/cbor-scan-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"987e8ed576a21eb644ac1ef2e06edbda\"))
  (:FILE \"src/codec/cbor-scan-stack.lisp\" :MD5
   #A((32) BASE-CHAR . \"cf1999ddb10f879aeefbeea853742d57\"))
  (:FILE \"src/codec/cbor-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"0c33aedcdb352e78a3c694cf796e6692\"))
  (:FILE \"src/codec/cbor-simple-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"200373402e6e082dd8c7afde305302bb\"))
  (:FILE \"src/codec/cbor-space.lisp\" :MD5
   #A((32) BASE-CHAR . \"c33cdcc45f45218aa3e8bf26ce0ee575\"))
  (:FILE \"src/codec/cbor-string-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"b13e92b5f24a42fe283c17b649722b6a\"))
  (:FILE \"src/codec/cbor-tag-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"e7979d8a4fd14175c15e0f407c96fb3c\"))
  (:FILE \"src/codec/cbor-tag-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca0697060604db0499c90f1cc59d6b50\"))
  (:FILE \"src/codec/cbor-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"69e77bcd15b5413a815a65c5081229db\"))
  (:FILE \"src/codec/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d885bd2a9860eb60aec1a775e5031d5e\"))
  (:FILE \"src/codec/utf8.lisp\" :MD5
   #A((32) BASE-CHAR . \"0f67dd5c51bf6a63bc292ab4e2a280c2\"))
  (:FILE \"src/control/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"8f3dc4a9657b6bb760e31c46c1e7b986\"))
  (:FILE \"src/control/dependency.lisp\" :MD5
   #A((32) BASE-CHAR . \"22ae34181e8ab96d8c8ecab050a1a19e\"))
  (:FILE \"src/control/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"717c3c8807ad919903a6572969ab2fca\"))
  (:FILE \"src/control/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"2dfc2b76c1d3c382db8b50071bdaeadf\"))
  (:FILE \"src/control/prepare.lisp\" :MD5
   #A((32) BASE-CHAR . \"c2667a324b14b2547bee2c8016e6d6c1\"))
  (:FILE \"src/control/publication-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"0e2492b2c97e8d3f7692668f5e09b44f\"))
  (:FILE \"src/control/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"93ce63e1bd43f2e64dc3f233035f0a94\"))
  (:FILE \"src/control/recovery-publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"3e85d56ce10f7c01a155559f10583b7c\"))
  (:FILE \"src/control/recovery-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"62daccbd36e3e85c274db61fd255e050\"))
  (:FILE \"src/control/recovery-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f1ae3786b620734c45ed506bb4a00da\"))
  (:FILE \"src/control/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"468fcf430eede17a38b922dfd373a746\"))
  (:FILE \"src/control/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f525c21d06bf7abb9ee7c4eab9ac380e\"))
  (:FILE \"src/csn/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1130012fc5613a5648d22ed8628be0e8\"))
  (:FILE \"src/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1cdb5661fc54beba5bf00e4765f3235\"))
  (:FILE \"src/dispatch/begin.lisp\" :MD5
   #A((32) BASE-CHAR . \"e66f3d0f40cf83d951d03aa1846906dc\"))
  (:FILE \"src/dispatch/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ba4cd961094f37a157d49b8d7024b677\"))
  (:FILE \"src/dispatch/claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"b10caeff4f726c0ebd01e2c6d1baacba\"))
  (:FILE \"src/dispatch/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"92c75ab3a17a79e6fb9c2460f8e8ed27\"))
  (:FILE \"src/dispatch/recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"c3e120f7a7faba59ffb52e8dc0de96d6\"))
  (:FILE \"src/dispatch/step.lisp\" :MD5
   #A((32) BASE-CHAR . \"a32aed4f1c22877bb0be65c3bd03552c\"))
  (:FILE \"src/dispatch/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"36db6694bc70963149b8068ae7ab96ec\"))
  (:FILE \"src/epochs/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"765d14c88cd288093a77a57930cd6999\"))
  (:FILE \"src/epochs/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"875201dfab0a84efd40fe9828cc293c8\"))
  (:FILE \"src/epochs/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"975b5f74e0c5a38ce978f4d9c7fcc6b8\"))
  (:FILE \"src/epochs/reclaim.lisp\" :MD5
   #A((32) BASE-CHAR . \"036dd02adf87d33c3ae2f40735c733fa\"))
  (:FILE \"src/epochs/retire.lisp\" :MD5
   #A((32) BASE-CHAR . \"653b974f310c09f6e2224a84acc43bbf\"))
  (:FILE \"src/epochs/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"82253491f995f5bc153fb5ebf30d564c\"))
  (:FILE \"src/execution/handoff.lisp\" :MD5
   #A((32) BASE-CHAR . \"6b85eebe69366e78ed5fc5cc20735f00\"))
  (:FILE \"src/execution/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb5710d6c111cadb7121a50998a747fa\"))
  (:FILE \"src/execution/queue.lisp\" :MD5
   #A((32) BASE-CHAR . \"8202843bddb817da4279ac959ae3f3c4\"))
  (:FILE \"src/execution/ready-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"38d26f8c749dd946dfc4b9c57103a892\"))
  (:FILE \"src/execution/ready-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a64d98c9ff429d6103d6e10ee1fd7980\"))
  (:FILE \"src/execution/ready.lisp\" :MD5
   #A((32) BASE-CHAR . \"2c1892002f0599bb8273093031017520\"))
  (:FILE \"src/execution/worker-boundary.lisp\" :MD5
   #A((32) BASE-CHAR . \"c24065d6c8d80d1be53994a0041743df\"))
  (:FILE \"src/execution/worker-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"babd0a78b4185af24ae1fef870c0fabb\"))
  (:FILE \"src/execution/worker-run.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa34ca6bc07535e35fea723878d99f66\"))
  (:FILE \"src/execution/worker-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"0679ee07c46f69db330706303c70d8d2\"))
  (:FILE \"src/execution/writer.lisp\" :MD5
   #A((32) BASE-CHAR . \"73019644090e2971f2b54dc36e4491f5\"))
  (:FILE \"src/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca642ea47e4bff76f78f5b6d7287d6bd\"))
  (:FILE \"src/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"a06115175f450776762761dce25acdb8\"))
  (:FILE \"src/foundation/conditions.lisp\" :MD5
   #A((32) BASE-CHAR . \"942b596396c19815290a57830af2121b\"))
  (:FILE \"src/foundation/crc32c.lisp\" :MD5
   #A((32) BASE-CHAR . \"4db58e2f48bf77d751f1b83bb9f84b5c\"))
  (:FILE \"src/foundation/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"5ee593a112958d94163dab17c5aa4ba2\"))
  (:FILE \"src/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"c3ed0f09fa3fa6fe20c98e2ed6e69abe\"))
  (:FILE \"src/get-directory/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"cde24b2bf5c5637d5501b95bed47df31\"))
  (:FILE \"src/get-directory/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a05062f6ab6d5ebdfdde37e336dfce6\"))
  (:FILE \"src/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"74a694385f1aaf03ec87721545494119\"))
  (:FILE \"src/get-directory/sources-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"2b8193aab6801de19e26fa55e7c53f87\"))
  (:FILE \"src/get-directory/sources-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"7bac02a80ddc22c622f8465642385ae8\"))
  (:FILE \"src/get-directory/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"17c957d6934a31f4ed64313e756de2d2\"))
  (:FILE \"src/get-resolver/active-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"c65593cf172f53a8e90a853bbe9504c2\"))
  (:FILE \"src/get-resolver/active-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"6d95f29b331d335175843f47ae44a6ea\"))
  (:FILE \"src/get-resolver/active-init.lisp\" :MD5
   #A((32) BASE-CHAR . \"7ca975d2534f43c8018d36ecd7c2b042\"))
  (:FILE \"src/get-resolver/active-preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"f13d422adb6aa9e8489352884137f25a\"))
  (:FILE \"src/get-resolver/active-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"521737861e057d663964b0c030552587\"))
  (:FILE \"src/get-resolver/active-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6aaec49504a96f37c8ff1bc182c977b\"))
  (:FILE \"src/get-resolver/active-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"60bb258cf4cc7f50c5c1206af1bb5800\"))
  (:FILE \"src/get-resolver/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbfb2082103e6712419e180ab972245c\"))
  (:FILE \"src/get-resolver/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"263525e8274a8f46ce58a4a0ad6841a2\"))
  (:FILE \"src/get-resolver/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"1339edff0223dbf122f11ff0adbba61c\"))
  (:FILE \"src/get-resolver/rows.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca9002b81efd0aed9761cd1f78514762\"))
  (:FILE \"src/get-resolver/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"536e9dc4ed51072b8a6d1528d3ec18bf\"))
  (:FILE \"src/get-resolver/sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d869293ba47444c4721713d955c6254\"))
  (:FILE \"src/get-resolver/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"9df13bcc6908e9fa601d173a671e1ccf\"))
  (:FILE \"src/get/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"c5cc36884b238221cc13ca0c087ec7c2\"))
  (:FILE \"src/get/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"e70bfeddd694336bbd088e65f8761834\"))
  (:FILE \"src/get/lookup.lisp\" :MD5
   #A((32) BASE-CHAR . \"82258ec87aca513a508bc5dee8410dd6\"))
  (:FILE \"src/get/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"c72633d15c3488699072eb610ebde7c8\"))
  (:FILE \"src/get/segment.lisp\" :MD5
   #A((32) BASE-CHAR . \"811869eb6a197d3c4e26af4322e52652\"))
  (:FILE \"src/get/target.lisp\" :MD5
   #A((32) BASE-CHAR . \"1b70dac05d6d2418909eb5105b808e81\"))
  (:FILE \"src/get/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"c394e5684de5e2d938991c7cb348b93c\"))
  (:FILE \"src/hash/arithmetic.lisp\" :MD5
   #A((32) BASE-CHAR . \"b5c51802e607e3dd22de68204baf64e9\"))
  (:FILE \"src/hash/blocks.lisp\" :MD5
   #A((32) BASE-CHAR . \"bef497b9a267c7306d4100000491c814\"))
  (:FILE \"src/hash/hash64.lisp\" :MD5
   #A((32) BASE-CHAR . \"886b7c08b9929283e8968831cbe5c039\"))
  (:FILE \"src/hash/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d9060e41bc5252067d35e59ac70ee06\"))
  (:FILE \"src/index/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"65076c355c099b5dc73d185948d3bec4\"))
  (:FILE \"src/index/hash-digests.lisp\" :MD5
   #A((32) BASE-CHAR . \"43d2209225707352daec6186ef95a805\"))
  (:FILE \"src/index/hash-seed.lisp\" :MD5
   #A((32) BASE-CHAR . \"45ce41749bc6fa638539815d3f802b96\"))
  (:FILE \"src/index/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"598a9b65e73151c924b2cdcaf6d96705\"))
  (:FILE \"src/index/primary-arena.lisp\" :MD5
   #A((32) BASE-CHAR . \"a319691e3e28b7ea7b927de490cf69ba\"))
  (:FILE \"src/index/primary-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff2cfbb865290d7a1510fdf6877c7229\"))
  (:FILE \"src/index/primary-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa52433eae199ceeb874bf2bc47afca7\"))
  (:FILE \"src/index/primary-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"1dd67c527257e43f17e006644ecdbd00\"))
  (:FILE \"src/index/primary-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d65cfce399b04f905bf969929962e59a\"))
  (:FILE \"src/index/primary-probe.lisp\" :MD5
   #A((32) BASE-CHAR . \"699ce3f1615296fc27fcde3e0d63a4bc\"))
  (:FILE \"src/index/primary-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"3f317a0d3c5ee86a73651aad36135cc3\"))
  (:FILE \"src/index/primary-relocate.lisp\" :MD5
   #A((32) BASE-CHAR . \"5155959766645d3172ae5e73c58cc071\"))
  (:FILE \"src/index/primary-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a59eab6425a60fa2656f86bf87d5c9ac\"))
  (:FILE \"src/index/primary-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"e8e31e599356e592af29c0cc4604872b\"))
  (:FILE \"src/index/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"5b22b90cfe8534086f6aff96d156713e\"))
  (:FILE \"src/index/rebuild-budget.lisp\" :MD5
   #A((32) BASE-CHAR . \"0417dd41cb3ec1d62dfd913c19f810ad\"))
  (:FILE \"src/index/rebuild-copy.lisp\" :MD5
   #A((32) BASE-CHAR . \"8befbbd00ed5c31c1487a11887eba495\"))
  (:FILE \"src/index/rebuild-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"1188e7a64a7a5d9482c1233cb9acb452\"))
  (:FILE \"src/index/rebuild.lisp\" :MD5
   #A((32) BASE-CHAR . \"a450cac8071513365267e7024cbe94b0\"))
  (:FILE \"src/index/relocate.lisp\" :MD5
   #A((32) BASE-CHAR . \"475dd7d5809a836f01544b447cc8df27\"))
  (:FILE \"src/index/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"5157fd03ee806ee998ad8f0002d56268\"))
  (:FILE \"src/index/validation.lisp\" :MD5
   #A((32) BASE-CHAR . \"3384cadf737c7d80c004222022a281f6\"))
  (:FILE \"src/index/write.lisp\" :MD5
   #A((32) BASE-CHAR . \"f0c8c579cd7db466d243ed3ea9f8e8aa\"))
  (:FILE \"src/io/flush.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbb059997772b42708272debc4d29c4b\"))
  (:FILE \"src/io/identity-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"d354a095fb378c1b6f27397ffb902227\"))
  (:FILE \"src/io/identity.lisp\" :MD5
   #A((32) BASE-CHAR . \"4e03b14a0c5015dc6ec897221c9f0eb5\"))
  (:FILE \"src/io/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"fc1cbc7b30e0d74c359e9ee1bbd201ec\"))
  (:FILE \"src/io/namespace.lisp\" :MD5
   #A((32) BASE-CHAR . \"8898b56d45e22212f1db37f208230f34\"))
  (:FILE \"src/io/native-namespace.lisp\" :MD5
   #A((32) BASE-CHAR . \"4c0c79a243bd691d3a602afd89b77980\"))
  (:FILE \"src/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"58030bc0c811248a6537e2909d8762d6\"))
  (:FILE \"src/io/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d5458684a1b169bacc46bc87fdaffed4\"))
  (:FILE \"src/io/rename.lisp\" :MD5
   #A((32) BASE-CHAR . \"40a1415771121f68afaa5165a0c23465\"))
  (:FILE \"src/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"ee2b4b86f91e1b61f7e5a36abe34ce9b\"))
  (:FILE \"src/io/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"95e28214f3629b7f4088b471ea22ce09\"))
  (:FILE \"src/mvcc/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f188d1dbd5d0adb49f53acf09157aef9\"))
  (:FILE \"src/mvcc/snapshots-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"8bb066aab61a18eff175b9edb11e42a2\"))
  (:FILE \"src/mvcc/snapshots-csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"0e9365e674d1584b111f915ce1f58634\"))
  (:FILE \"src/mvcc/snapshots-lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff98aea5cb9a7ae2671f6a887a003725\"))
  (:FILE \"src/mvcc/snapshots-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"ae3ad96269b5e711a9dbb455f3c0ce48\"))
  (:FILE \"src/mvcc/snapshots-register.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d5a795bcefd605c75da91c725ae83a2\"))
  (:FILE \"src/mvcc/snapshots-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"475517bd7ba04a1c37a82efeb8ff73d9\"))
  (:FILE \"src/mvcc/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a9bc70eab6720b5c6f8503178e2c966b\"))
  (:FILE \"src/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"becf5c78049c85f2c05cd1ef54454032\"))
  (:FILE \"src/read/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"4040905f4a64ba704a480d82e87ec748\"))
  (:FILE \"src/read/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7d74d9decc5a0bc9f9331d89bd503e21\"))
  (:FILE \"src/read/task.lisp\" :MD5
   #A((32) BASE-CHAR . \"9e0baf22c53329d393e047c669679645\"))
  (:FILE \"src/read/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"9c37ff8237fcc9fe9ae4f44316e854e3\"))
  (:FILE \"src/recovery-active/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"3df4fbfa866a44b320da4bc3da38789a\"))
  (:FILE \"src/recovery-active/closure.lisp\" :MD5
   #A((32) BASE-CHAR . \"b154d3d29f80146d895a99d84c2e9741\"))
  (:FILE \"src/recovery-active/frames.lisp\" :MD5
   #A((32) BASE-CHAR . \"493993aaec139f7aef9ede131dcd410a\"))
  (:FILE \"src/recovery-active/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1c3c71bdd0f168e151514caed4f469c\"))
  (:FILE \"src/recovery-active/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"b52b8ebacf81aa225b6ea417c4a0e6ac\"))
  (:FILE \"src/recovery-active/query.lisp\" :MD5
   #A((32) BASE-CHAR . \"04a6d2a8201256453b28b9785981a6d1\"))
  (:FILE \"src/recovery-active/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"1dc488f2e6f12feef9a0fe29c3bd7c60\"))
  (:FILE \"src/recovery-active/resolve.lisp\" :MD5
   #A((32) BASE-CHAR . \"81e35c3b0b15f92ecbe17fcd1e7715b9\"))
  (:FILE \"src/recovery-active/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"213f5f7b0442bfa1bfdd73b6ff54df01\"))
  (:FILE \"src/recovery/decisions-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"1a51ef4a488bb9fde2ff7d47bae01379\"))
  (:FILE \"src/recovery/decisions-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"cbdc30f93109c474e1fc25066c9b9b13\"))
  (:FILE \"src/recovery/decisions-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"f782d1137b8ce342b91c9999cfb7accc\"))
  (:FILE \"src/recovery/decisions-radix.lisp\" :MD5
   #A((32) BASE-CHAR . \"852149de4c289b8e067602780378d87a\"))
  (:FILE \"src/recovery/decisions-sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"b33e57a643f2fca810846f6226366253\"))
  (:FILE \"src/recovery/decisions-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f4433fd19ebc7239dbc2628c39f3ecdb\"))
  (:FILE \"src/recovery/inventory-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"9bd6820c4feba3e552aab1a4edd87861\"))
  (:FILE \"src/recovery/inventory-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"fcea263de1938767772e5b11411ecd5e\"))
  (:FILE \"src/recovery/inventory-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"78c136d5838dcfe3019d9069643a8d8f\"))
  (:FILE \"src/recovery/manifest-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bf65b1731eab6e0572461ef5cc60fc40\"))
  (:FILE \"src/recovery/manifest-decode.lisp\" :MD5
   #A((32) BASE-CHAR . \"67975249aaabd751757cdfb9222cc3c4\"))
  (:FILE \"src/recovery/manifest-fold.lisp\" :MD5
   #A((32) BASE-CHAR . \"e0d2498db1011e857b7b0daa1934f187\"))
  (:FILE \"src/recovery/manifest-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1d7d05fce907e6be7a34857ee168b01d\"))
  (:FILE \"src/recovery/manifest-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"ebd7a54adea2213294a887e6d4db0927\"))
  (:FILE \"src/recovery/manifest-transition.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa19e7689d3b74a5c861d95286b9f7c9\"))
  (:FILE \"src/recovery/manifest-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"7b1d4054415faca7e5fca59ad83b4d4a\"))
  (:FILE \"src/recovery/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1c1c8ad0cd15b1703a2fe19cbf3f13c2\"))
  (:FILE \"src/recovery/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"fcacd15460db25ea9cc4036065f9f096\"))
  (:FILE \"src/scheduler/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"36c5ae2dd08fbe546f4392b7b12102ec\"))
  (:FILE \"src/scheduler/lifecycle-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"1c4a4fd316ef034c298db47dfca1daca\"))
  (:FILE \"src/scheduler/lifecycle-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"19c8be44863be30c07bb72fe3fac2a99\"))
  (:FILE \"src/scheduler/lifecycle-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa2f88c50dfec24af40af091f9221590\"))
  (:FILE \"src/scheduler/lifecycle-update.lisp\" :MD5
   #A((32) BASE-CHAR . \"40a78461f91616a935a39f29b87680c8\"))
  (:FILE \"src/scheduler/lifecycle-worker.lisp\" :MD5
   #A((32) BASE-CHAR . \"9d7cdf45c1b594fef5af735ec0955c05\"))
  (:FILE \"src/scheduler/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"0578c541b6ddfaf8827240e967ff76ea\"))
  (:FILE \"src/scheduler/policy.lisp\" :MD5
   #A((32) BASE-CHAR . \"1721005a7545b36df601d75252638eba\"))
  (:FILE \"src/scheduler/pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4995b29d40caa2ee29aa0c167885287\"))
  (:FILE \"src/scheduler/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"170dfc36aef6a3d78f980fbcc37f0176\"))
  (:FILE \"src/scheduler/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"981f9f6db268cd9a46d4239c677c5d5b\"))
  (:FILE \"src/scheduler/update.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a43e6b400b701c69286357ef85469fc\"))
  (:FILE \"src/series/events.lisp\" :MD5
   #A((32) BASE-CHAR . \"32b2156739a6f2ca996abb91df0a2603\"))
  (:FILE \"src/series/io-events.lisp\" :MD5
   #A((32) BASE-CHAR . \"b6026a8b7bb64b45c37a65effda70d8e\"))
  (:FILE \"src/series/ownership.lisp\" :MD5
   #A((32) BASE-CHAR . \"de1aca16a35d34d16aba12ff541c0d2b\"))
  (:FILE \"src/series/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"09653c7479e1498d1545f3f1f0ffd755\"))
  (:FILE \"src/series/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6977aba53c811ec3a373226f9f53795\"))
  (:FILE \"src/series/query.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb0d91405325b508e6b2ab24d178de7a\"))
  (:FILE \"src/series/retirement.lisp\" :MD5
   #A((32) BASE-CHAR . \"b8e04971b8ad75a1bd0c722997badfd2\"))
  (:FILE \"src/series/routing-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6924deff152b941bd49f0bb200b4197\"))
  (:FILE \"src/series/routing-select.lisp\" :MD5
   #A((32) BASE-CHAR . \"e0f987d8767744050ec4d1b3ecb699ed\"))
  (:FILE \"src/series/routing-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ce649df47dd38888d5103c98345f7e41\"))
  (:FILE \"src/series/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab19ec8d15af91511e817858c41cebc8\"))
  (:FILE \"src/series/worker-boundary.lisp\" :MD5
   #A((32) BASE-CHAR . \"2340e0c9074f7b1bf80c74f774986bc5\"))
  (:FILE \"src/series/worker-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a93ce2e84e8aee647b5083ad1d2b899b\"))
  (:FILE \"src/series/worker-run.lisp\" :MD5
   #A((32) BASE-CHAR . \"f0fee18adf357bad98e8a3c3e8c70c0c\"))
  (:FILE \"src/series/worker-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"2b23d468be0165fa009c5ebd5d1bbe23\"))
  (:FILE \"src/storage/compaction-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"1cda77a357ab2147035993b72d135a37\"))
  (:FILE \"src/storage/control-payload.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb64f806b8d69eb42d865b4abfff0b27\"))
  (:FILE \"src/storage/formats.lisp\" :MD5
   #A((32) BASE-CHAR . \"061147be459d8d3b08c661bd3f91d152\"))
  (:FILE \"src/storage/log-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"b53d27dcc9f4badf18b50519c50bc614\"))
  (:FILE \"src/storage/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f86bd104f20616a76b42c02227f72844\"))
  (:FILE \"src/storage/payload-record.lisp\" :MD5
   #A((32) BASE-CHAR . \"8c03f9c01dcb30f2d3970a5694968ecf\"))
  (:FILE \"src/storage/payload-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4ece3c4fa8d9492d2a80df7c0a4f5a0\"))
  (:FILE \"src/storage/segment-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6812fa59bf8fd1252fbf85a9bfa3896\"))
  (:FILE \"src/wal/builder.lisp\" :MD5
   #A((32) BASE-CHAR . \"a229f76f7036f3573a6e528dcd390a19\"))
  (:FILE \"src/wal/csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"42b990e3b254e6fb488c0ab91b6a6502\"))
  (:FILE \"src/wal/executor.lisp\" :MD5
   #A((32) BASE-CHAR . \"c0340924c9130e14d0e8efedeec078f1\"))
  (:FILE \"src/wal/group.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a0e7c99ab70b4720cbb091156560f5e\"))
  (:FILE \"src/wal/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"96c41b1d417135a24fc65659ea3abe11\"))
  (:FILE \"src/wal/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f799f27a8ac1a4c736c04796c1e543f9\"))
  (:FILE \"tests/codec/cbor-array-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"eaff7126d31032812b816d96beed2d1d\"))
  (:FILE \"tests/codec/cbor-array-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"d799a632098e68b3c2d61d415ac7fd45\"))
  (:FILE \"tests/codec/cbor-array-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"b9d14be96752dcf8318c82878549672c\"))
  (:FILE \"tests/codec/cbor-float-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"19e60c5edb24fae449ebbe831bc1b1e8\"))
  (:FILE \"tests/codec/cbor-float-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"5590458e8334cd9774fd212297407308\"))
  (:FILE \"tests/codec/cbor-float-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"e62412cb0e838b241383a5c9103dd2c2\"))
  (:FILE \"tests/codec/cbor-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"208ee0d03652de67ad453bdd34d10b62\"))
  (:FILE \"tests/codec/cbor-map-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"074efafd791f68caf5779b0ccb16a2b3\"))
  (:FILE \"tests/codec/cbor-map-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"6591b26b30365cac76ba0927c090f343\"))
  (:FILE \"tests/codec/cbor-map-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"5478566e25301bda7467493b25194ac2\"))
  (:FILE \"tests/codec/cbor-minimal-edges.lisp\" :MD5
   #A((32) BASE-CHAR . \"392d402b44d04a9ce1c95fef4c4e8bf9\"))
  (:FILE \"tests/codec/cbor-minimal-scan-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"16954ef22a2169e6f9f6de0e9ab187ab\"))
  (:FILE \"tests/codec/cbor-minimal-scan-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"d59e1b8152cbaf0dbf4a6cea649cb611\"))
  (:FILE \"tests/codec/cbor-minimal-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"34587c10ac32129ac531e0a4f03df9a6\"))
  (:FILE \"tests/codec/cbor-minimal-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d7ec43e187859da277b8fb5f66f8e73\"))
  (:FILE \"tests/codec/cbor-minimal-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"5b145690222d1b50984f1a284f118a7e\"))
  (:FILE \"tests/codec/cbor-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"2311a15f8d4af90bf341e91e0e64342b\"))
  (:FILE \"tests/codec/cbor-simple-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"c92e59ed693525e8e3b53656d005e82e\"))
  (:FILE \"tests/codec/cbor-simple-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"5c44f9bcb54dcef327c88156a358313f\"))
  (:FILE \"tests/codec/cbor-simple-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"808ed81b703fd2cf0ac11d148c3ffc08\"))
  (:FILE \"tests/codec/cbor-string-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"07c96de5ded8b12d0db3f8d2dcbfbb1d\"))
  (:FILE \"tests/codec/cbor-string-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"82cf8ab7c6ffb9f1a717d5ba41004b49\"))
  (:FILE \"tests/codec/cbor-string-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"70d9d0d454dd1f296ef6989d3b928842\"))
  (:FILE \"tests/codec/cbor-structure-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"220d386d29b1fa192e06ceebe4ec245c\"))
  (:FILE \"tests/codec/cbor-structure-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"5f103dd263bcacb7b3c6bf0455157fa9\"))
  (:FILE \"tests/codec/cbor-structure.lisp\" :MD5
   #A((32) BASE-CHAR . \"06e6f060aea55a18d06047e5ebabd18e\"))
  (:FILE \"tests/codec/cbor-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e5da97609a2ba58bb35fea24b7518d2b\"))
  (:FILE \"tests/codec/cbor-tag-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"10fe18f5f9280f0de45a56de78114dae\"))
  (:FILE \"tests/codec/cbor-tag-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"f339e28bda3d94cc8f58589999988a6d\"))
  (:FILE \"tests/codec/cbor-tag-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"d697c11e86af9e64a3519707b58aad82\"))
  (:FILE \"tests/codec/cbor-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"d3b8d19096d8d0bab30c0a54e077c7f3\"))
  (:FILE \"tests/codec/cbor-write-roundtrip.lisp\" :MD5
   #A((32) BASE-CHAR . \"646944ef624c06fd86d6a1306041349d\"))
  (:FILE \"tests/codec/cbor-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"13382bdf23e5501e0ca349faf7b05062\"))
  (:FILE \"tests/codec/cbor-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa864f83784e5976a38a43e2a79b7c6b\"))
  (:FILE \"tests/codec/cbor-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"dffa6e75d8c3d7f991f6c4460eb8b9bc\"))
  (:FILE \"tests/codec/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"32534fd42dd8124b50b45deefe143eaf\"))
  (:FILE \"tests/codec/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"5b025b0cfe065c5d934bf0901433ef04\"))
  (:FILE \"tests/codec/utf8.lisp\" :MD5
   #A((32) BASE-CHAR . \"767ead15603be8dce90f340dbb200d8f\"))
  (:FILE \"tests/control/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"8611febd980cadd28945367b979d2392\"))
  (:FILE \"tests/control/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"019432427c5aacfc29d6366032a1ce83\"))
  (:FILE \"tests/control/recovery-publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"37426d589ee6fc5555a28f4d4d5bfc55\"))
  (:FILE \"tests/control/recovery-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"1355e6a03a4ce889031b4c6a9ccb183a\"))
  (:FILE \"tests/control/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"756de79a8b15f4ed479b3206b1ac6d5a\"))
  (:FILE \"tests/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"1d9133c5fd33cb60ff160f468db330f4\"))
  (:FILE \"tests/csn/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e5c151cda2e10e4f9cae46a4326699eb\"))
  (:FILE \"tests/csn/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"087108576603e6cd5b9af14b50475746\"))
  (:FILE \"tests/epochs/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe92ddd79dcaab3d3f7bdf387bf2295e\"))
  (:FILE \"tests/epochs/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"592a2fe2e22214c52d4672d26620980b\"))
  (:FILE \"tests/epochs/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"67cec074bf70074f7f2c6965ef494ba8\"))
  (:FILE \"tests/execution/handoff.lisp\" :MD5
   #A((32) BASE-CHAR . \"f87fdc0f7bd194329c6349026a2f35bb\"))
  (:FILE \"tests/execution/queue.lisp\" :MD5
   #A((32) BASE-CHAR . \"940ebb450bc871f8c2dd7dc9977bb158\"))
  (:FILE \"tests/execution/ready-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"4ccdc0512b3c81837726076d7c795930\"))
  (:FILE \"tests/execution/ready.lisp\" :MD5
   #A((32) BASE-CHAR . \"f6756125a9150b6312dad3e2705b74d3\"))
  (:FILE \"tests/execution/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"bacb1a135c0d73cded57ba21986c8496\"))
  (:FILE \"tests/execution/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"99e06430f652a655a9c029847f9fa345\"))
  (:FILE \"tests/execution/worker.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbaa592327d730fdae78cb881350efe0\"))
  (:FILE \"tests/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"29fc6a9711ea9265840e8cde4971f74e\"))
  (:FILE \"tests/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"07c4c9ac2177f22e5b7fb25f9867a133\"))
  (:FILE \"tests/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a84ca3aa74ab158c6b7d66886cf8b23\"))
  (:FILE \"tests/foundation/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"758adad069aec2f9dbe0635797314ff6\"))
  (:FILE \"tests/get-active/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"447bcc0feb60a5a668474060df098cd7\"))
  (:FILE \"tests/get-active/directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"0de1b79cfcdf9dd19a4336c745726576\"))
  (:FILE \"tests/get-active/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"961c0d8fe5ba267150701a9914369e57\"))
  (:FILE \"tests/get-active/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"da12d6e2b34116951e37764beab59c2a\"))
  (:FILE \"tests/get-active/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"9cbecf43fcd898db4f74826bf2c29fa3\"))
  (:FILE \"tests/get-directory/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"1137938073e71d6d8d62c751fbad05d5\"))
  (:FILE \"tests/get-directory/lifetime-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"074ccd2fc80ba020ef8c13f07c1beb42\"))
  (:FILE \"tests/get-directory/lifetime.lisp\" :MD5
   #A((32) BASE-CHAR . \"f40cde2709b2d93525fa8b8a73cc13d8\"))
  (:FILE \"tests/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"d1ab36d05cc1266e4533d27c693f12f4\"))
  (:FILE \"tests/get-directory/series-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"486604b450bfe8de32feaed1a96dc0cc\"))
  (:FILE \"tests/get-directory/series-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"092192d05b3f85c6c283113c57c02f01\"))
  (:FILE \"tests/get-directory/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"5e47378b562314a863ea850da186b12a\"))
  (:FILE \"tests/get-directory/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"63dd01c852de1399c2c82274d481d257\"))
  (:FILE \"tests/get-performance/guards.lisp\" :MD5
   #A((32) BASE-CHAR . \"324c70304e678cbe022ff33c73f793e2\"))
  (:FILE \"tests/get-performance/paths.lisp\" :MD5
   #A((32) BASE-CHAR . \"eb48216a4b5baa9cf498968ee032b205\"))
  (:FILE \"tests/get-performance/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f5f9fa3ffcc3220f10b7a5f294ee6d9\"))
  (:FILE \"tests/get-performance/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"916e5740db5d52fdf6088694f34d11db\"))
  (:FILE \"tests/get-resolver/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"a64a6a5a34c8ec5f8c4ca4324cc348d2\"))
  (:FILE \"tests/get-resolver/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"e93c7dbf1bf2d7e99651b110a4e01661\"))
  (:FILE \"tests/get-resolver/sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"ffe3551bb49dd60d7d34213c9c93cf06\"))
  (:FILE \"tests/get-resolver/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"0738e161d276394a160a86ed139610f2\"))
  (:FILE \"tests/get/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"3a4bbc3fd3ede5a837f0c0f913637291\"))
  (:FILE \"tests/get/segment.lisp\" :MD5
   #A((32) BASE-CHAR . \"2f25d1904aa4960ce0d6351580a2bcc7\"))
  (:FILE \"tests/get/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"660783988d4f99d0e171bb59c79e3467\"))
  (:FILE \"tests/hash/guards.lisp\" :MD5
   #A((32) BASE-CHAR . \"a59d531a156fc49c39c9265075bd9600\"))
  (:FILE \"tests/hash/hash64.lisp\" :MD5
   #A((32) BASE-CHAR . \"443fdc895f2fa3620d2b1b4af5c32dc4\"))
  (:FILE \"tests/hash/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"40b223712554582c2910971a6b045149\"))
  (:FILE \"tests/hash/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"73ed0785ca1330d69ad336abc019a413\"))
  (:FILE \"tests/index/hash-digests.lisp\" :MD5
   #A((32) BASE-CHAR . \"91c1eda35e14276e795259bceac489be\"))
  (:FILE \"tests/index/primary-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"44e2635d88de3f6ccf69c684c3eff77b\"))
  (:FILE \"tests/index/primary-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d339c2f2680e66ac79ecd8d02c09382\"))
  (:FILE \"tests/index/primary.lisp\" :MD5
   #A((32) BASE-CHAR . \"6ed661242a86117dd2d696e374740a2f\"))
  (:FILE \"tests/index/rebuild.lisp\" :MD5
   #A((32) BASE-CHAR . \"262556582cc0c387d6c59b757d9956b1\"))
  (:FILE \"tests/index/slot-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6ed9249e2eaef3524260804ef7e02567\"))
  (:FILE \"tests/index/slot-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"e9b53e6eac6fc836e8243d41adbafea0\"))
  (:FILE \"tests/index/slots.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe094b4513ceabe8571031ac20935e48\"))
  (:FILE \"tests/io/flush-failure.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa9f0dcf1a0bbd827af0918f8c9816e4\"))
  (:FILE \"tests/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"1e6fd9ab36eb4e307207d371ed947757\"))
  (:FILE \"tests/io/rename-native.lisp\" :MD5
   #A((32) BASE-CHAR . \"d79c13ea447cd8694b14bc6391d7e3ee\"))
  (:FILE \"tests/io/rename.lisp\" :MD5
   #A((32) BASE-CHAR . \"87acf2a7abb532d41aef472600184643\"))
  (:FILE \"tests/io/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"a26526e87fe46794b8bbab1fdd46d68c\"))
  (:FILE \"tests/io/transfer-failure.lisp\" :MD5
   #A((32) BASE-CHAR . \"c9da7d7deac220b193b38dcabe0f6bd6\"))
  (:FILE \"tests/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab2fb36682dd8b8bc757e586ceb3be62\"))
  (:FILE \"tests/lint-fixtures/bad.lisp\" :MD5
   #A((32) BASE-CHAR . \"30f1396c941dd9b8a41ca15698b5a347\"))
  (:FILE \"tests/lint-fixtures/good.lisp\" :MD5
   #A((32) BASE-CHAR . \"f85250c3a057c851db6745b9eba27da1\"))
  (:FILE \"tests/lint-fixtures/keyword-barrier.lisp\" :MD5
   #A((32) BASE-CHAR . \"9f63fdfdf866f17d5491390b710ebb5e\"))
  (:FILE \"tests/lint-fixtures/qualified-reader.lisp\" :MD5
   #A((32) BASE-CHAR . \"7fc689336bb2041dfef4c22090bb7de4\"))
  (:FILE \"tests/mvcc/capture.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f0309fa9258eb62a45167de5d2279d5\"))
  (:FILE \"tests/mvcc/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"341627288b50485858efedc207fc95b5\"))
  (:FILE \"tests/mvcc/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e7d26bd67650663c88ceda526023ae83\"))
  (:FILE \"tests/read/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"73dab63d8414998d72f6c14e0d62e3ac\"))
  (:FILE \"tests/read/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"0d5db03bd804747de7c309c82e40dd43\"))
  (:FILE \"tests/read/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"0cf2cad12c77c82b827da01782bc996d\"))
  (:FILE \"tests/recovery/corruption.lisp\" :MD5
   #A((32) BASE-CHAR . \"a369b8176d4e877ab546d17e983b94ed\"))
  (:FILE \"tests/recovery/decisions-audit.lisp\" :MD5
   #A((32) BASE-CHAR . \"33b98cf215d1ddb469d02cc6c0032bfe\"))
  (:FILE \"tests/recovery/decisions-radix.lisp\" :MD5
   #A((32) BASE-CHAR . \"58eec0feac01e643c76ad19ef5c07df5\"))
  (:FILE \"tests/recovery/decisions-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"80348d0ce2adbc8a4d37db49df291b1d\"))
  (:FILE \"tests/recovery/decisions.lisp\" :MD5
   #A((32) BASE-CHAR . \"5add0e087181bad8ce330af23fc26686\"))
  (:FILE \"tests/recovery/inventory-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"522afcdc6115fdd4d8fec0d06aab7354\"))
  (:FILE \"tests/recovery/inventory.lisp\" :MD5
   #A((32) BASE-CHAR . \"9c78925dd89e94d86a9f577e0225eeb3\"))
  (:FILE \"tests/recovery/manifest-audit.lisp\" :MD5
   #A((32) BASE-CHAR . \"3ca73a199708e2571da3a27e6dc00c76\"))
  (:FILE \"tests/recovery/manifest-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"3286e0dfb66496aafe8b6fbbdd92ab43\"))
  (:FILE \"tests/recovery/manifest-transition.lisp\" :MD5
   #A((32) BASE-CHAR . \"84b53d783522e179d8c8e798d0b5146e\"))
  (:FILE \"tests/recovery/manifest.lisp\" :MD5
   #A((32) BASE-CHAR . \"b6bdcc4d20f7db14c0dc00d5258cbf8c\"))
  (:FILE \"tests/recovery/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa7af12d270673b62542d32ec60b361a\"))
  (:FILE \"tests/recovery/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"769bac1994a5e3d74bd56b510970bf9b\"))
  (:FILE \"tests/scheduler/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"bc20dcd712332fde961fb38e879392b5\"))
  (:FILE \"tests/scheduler/dispatch.lisp\" :MD5
   #A((32) BASE-CHAR . \"0235bb18cc7a6169e47d3aebf2438bdd\"))
  (:FILE \"tests/scheduler/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"1388f446bce5085439c2254edd165118\"))
  (:FILE \"tests/scheduler/pool-begin.lisp\" :MD5
   #A((32) BASE-CHAR . \"5fe1f60cddf25dc099d80f843285018d\"))
  (:FILE \"tests/scheduler/pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"aaba914dea485f812a11767addb94c81\"))
  (:FILE \"tests/scheduler/pool-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"8c1264656e39ff936f904948f6b36802\"))
  (:FILE \"tests/scheduler/pool-step.lisp\" :MD5
   #A((32) BASE-CHAR . \"b8423d1625f5d07501ccbc4c231c622d\"))
  (:FILE \"tests/scheduler/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"34e51e369859bc1c731d73e43053b6f4\"))
  (:FILE \"tests/series/boundaries.lisp\" :MD5
   #A((32) BASE-CHAR . \"6967c7e6396b6df38c637f2d5d9ebfc0\"))
  (:FILE \"tests/series/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"a83818568a27c52d36365597d7113c09\"))
  (:FILE \"tests/series/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6aa566720d1476d13a0f7288be9e1346\"))
  (:FILE \"tests/series/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"67718445a8948da3c7875f6cc6b3e167\"))
  (:FILE \"tests/series/worker-bridge.lisp\" :MD5
   #A((32) BASE-CHAR . \"c714c8db7998acf60256b318488574d8\"))
  (:FILE \"tests/series/worker-routing.lisp\" :MD5
   #A((32) BASE-CHAR . \"f839733b6f5a4d9286a5cdd7ae9bcb55\"))
  (:FILE \"tests/smoke.lisp\" :MD5
   #A((32) BASE-CHAR . \"afb2e2bc7ff7249ebb2e1ccf0f87aaf3\"))
  (:FILE \"tests/storage/compaction-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb4acb5a73eb973f53ef337113880d32\"))
  (:FILE \"tests/storage/control-payload.lisp\" :MD5
   #A((32) BASE-CHAR . \"25f3c822273c898d2263ceb3db538cab\"))
  (:FILE \"tests/storage/log-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"eecb2fe94e710a918254e5ad453a0daa\"))
  (:FILE \"tests/storage/segment-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab2c52fb6b79702d50dcef6d12ca8906\"))
  (:FILE \"tests/storage/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"82a4dbb4767c17f9851143a637af3b83\"))
  (:FILE \"tests/wal/builder.lisp\" :MD5
   #A((32) BASE-CHAR . \"0d01e4e18c0a559873fce584a0ac91cd\"))
  (:FILE \"tests/wal/csn-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"ecb2cbf4f7ace32cdaff329476070d60\"))
  (:FILE \"tests/wal/csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"3e2dbc3319b611db090e27493a10fc2c\"))
  (:FILE \"tests/wal/fault.lisp\" :MD5
   #A((32) BASE-CHAR . \"00367366b82918614d84f517f4bb395e\"))
  (:FILE \"tests/wal/group.lisp\" :MD5
   #A((32) BASE-CHAR . \"0ee2462103a749b58488561aeacaac07\"))
  (:FILE \"tests/wal/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"0643b96c5ee339f9826b19150d065ddf\"))
  (:FILE \"tests/wal/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"15952f6b761acea4519abf701bb2346c\"))
  (:FILE \"tools/measure-pool-step.lisp\" :MD5
   #A((32) BASE-CHAR . \"2e176e89639e71da83393559c8f9999c\")))
 :SOURCE-FINGERPRINTS-AFTER
 ((:FILE \"arcdocdb.asd\" :MD5
   #A((32) BASE-CHAR . \"3ef9d9f3ca1e4d2341782d7fed6cf819\"))
  (:FILE \"tools/measure-pool-lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"72a85a626ffb60185baf7602d28517e9\"))
  (:FILE \"src/active/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"bf244695c3c14a1a0148517b48052f5d\"))
  (:FILE \"src/active/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"0ce41661b5cd26fe2edb944cca142f98\"))
  (:FILE \"src/active/prepare.lisp\" :MD5
   #A((32) BASE-CHAR . \"e3238a39b721a3a5ac1055bc1a30feba\"))
  (:FILE \"src/active/source.lisp\" :MD5
   #A((32) BASE-CHAR . \"50c6d9f4e4eb68c8018acb6a3fe70c8e\"))
  (:FILE \"src/active/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe47862290f99d6217361f4302e2faf2\"))
  (:FILE \"src/cache/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"5d70197c8b64ad6f20c8be47a60c73ca\"))
  (:FILE \"src/cache/clock.lisp\" :MD5
   #A((32) BASE-CHAR . \"3546cf7f5c5ed138068548c20064f499\"))
  (:FILE \"src/cache/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"72f3a33ce27ddf94c49c495580520004\"))
  (:FILE \"src/cache/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1f6a8e7aa4faed88e984b39871d1e53\"))
  (:FILE \"src/cache/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"82f937b7b08bd1696ad9c88da2e1c60c\"))
  (:FILE \"src/cache/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a25648d870eaa4f0b6e1e3b2cf76e28e\"))
  (:FILE \"src/cache/write.lisp\" :MD5
   #A((32) BASE-CHAR . \"fc09021f74fb50aac57589614dae04d7\"))
  (:FILE \"src/codec/cbor-array-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"560fa1b10432d16edb830014e95ea4dc\"))
  (:FILE \"src/codec/cbor-array-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"0429206ab6069f053c66da4c56439cfb\"))
  (:FILE \"src/codec/cbor-float-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"bc7a7b176e8cdd361b7c4306a1a4de4b\"))
  (:FILE \"src/codec/cbor-float-narrow.lisp\" :MD5
   #A((32) BASE-CHAR . \"c15cc9d91355860357ed434e58d1f4cb\"))
  (:FILE \"src/codec/cbor-float-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"f3b22be81a36e1713c34e890c82c6700\"))
  (:FILE \"src/codec/cbor-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"6e8c6a49314c2f460aa6f8a1759200b6\"))
  (:FILE \"src/codec/cbor-map-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"e3d33d0453e2d2feb57730cb15f12dab\"))
  (:FILE \"src/codec/cbor-map-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"66ff30cb4a72e6486b4a942311da5336\"))
  (:FILE \"src/codec/cbor-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"ecd8fe950344059c629927b38fb6e4aa\"))
  (:FILE \"src/codec/cbor-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"808b6366b341ff82314ff6e9b5d0da7e\"))
  (:FILE \"src/codec/cbor-scan-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"f6488e987889432b375254021825dbe5\"))
  (:FILE \"src/codec/cbor-scan-items.lisp\" :MD5
   #A((32) BASE-CHAR . \"706c0baa4158bf272c4b0df17c1439d2\"))
  (:FILE \"src/codec/cbor-scan-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"987e8ed576a21eb644ac1ef2e06edbda\"))
  (:FILE \"src/codec/cbor-scan-stack.lisp\" :MD5
   #A((32) BASE-CHAR . \"cf1999ddb10f879aeefbeea853742d57\"))
  (:FILE \"src/codec/cbor-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"0c33aedcdb352e78a3c694cf796e6692\"))
  (:FILE \"src/codec/cbor-simple-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"200373402e6e082dd8c7afde305302bb\"))
  (:FILE \"src/codec/cbor-space.lisp\" :MD5
   #A((32) BASE-CHAR . \"c33cdcc45f45218aa3e8bf26ce0ee575\"))
  (:FILE \"src/codec/cbor-string-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"b13e92b5f24a42fe283c17b649722b6a\"))
  (:FILE \"src/codec/cbor-tag-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"e7979d8a4fd14175c15e0f407c96fb3c\"))
  (:FILE \"src/codec/cbor-tag-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca0697060604db0499c90f1cc59d6b50\"))
  (:FILE \"src/codec/cbor-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"69e77bcd15b5413a815a65c5081229db\"))
  (:FILE \"src/codec/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d885bd2a9860eb60aec1a775e5031d5e\"))
  (:FILE \"src/codec/utf8.lisp\" :MD5
   #A((32) BASE-CHAR . \"0f67dd5c51bf6a63bc292ab4e2a280c2\"))
  (:FILE \"src/control/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"8f3dc4a9657b6bb760e31c46c1e7b986\"))
  (:FILE \"src/control/dependency.lisp\" :MD5
   #A((32) BASE-CHAR . \"22ae34181e8ab96d8c8ecab050a1a19e\"))
  (:FILE \"src/control/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"717c3c8807ad919903a6572969ab2fca\"))
  (:FILE \"src/control/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"2dfc2b76c1d3c382db8b50071bdaeadf\"))
  (:FILE \"src/control/prepare.lisp\" :MD5
   #A((32) BASE-CHAR . \"c2667a324b14b2547bee2c8016e6d6c1\"))
  (:FILE \"src/control/publication-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"0e2492b2c97e8d3f7692668f5e09b44f\"))
  (:FILE \"src/control/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"93ce63e1bd43f2e64dc3f233035f0a94\"))
  (:FILE \"src/control/recovery-publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"3e85d56ce10f7c01a155559f10583b7c\"))
  (:FILE \"src/control/recovery-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"62daccbd36e3e85c274db61fd255e050\"))
  (:FILE \"src/control/recovery-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f1ae3786b620734c45ed506bb4a00da\"))
  (:FILE \"src/control/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"468fcf430eede17a38b922dfd373a746\"))
  (:FILE \"src/control/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f525c21d06bf7abb9ee7c4eab9ac380e\"))
  (:FILE \"src/csn/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1130012fc5613a5648d22ed8628be0e8\"))
  (:FILE \"src/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1cdb5661fc54beba5bf00e4765f3235\"))
  (:FILE \"src/dispatch/begin.lisp\" :MD5
   #A((32) BASE-CHAR . \"e66f3d0f40cf83d951d03aa1846906dc\"))
  (:FILE \"src/dispatch/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ba4cd961094f37a157d49b8d7024b677\"))
  (:FILE \"src/dispatch/claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"b10caeff4f726c0ebd01e2c6d1baacba\"))
  (:FILE \"src/dispatch/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"92c75ab3a17a79e6fb9c2460f8e8ed27\"))
  (:FILE \"src/dispatch/recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"c3e120f7a7faba59ffb52e8dc0de96d6\"))
  (:FILE \"src/dispatch/step.lisp\" :MD5
   #A((32) BASE-CHAR . \"a32aed4f1c22877bb0be65c3bd03552c\"))
  (:FILE \"src/dispatch/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"36db6694bc70963149b8068ae7ab96ec\"))
  (:FILE \"src/epochs/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"765d14c88cd288093a77a57930cd6999\"))
  (:FILE \"src/epochs/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"875201dfab0a84efd40fe9828cc293c8\"))
  (:FILE \"src/epochs/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"975b5f74e0c5a38ce978f4d9c7fcc6b8\"))
  (:FILE \"src/epochs/reclaim.lisp\" :MD5
   #A((32) BASE-CHAR . \"036dd02adf87d33c3ae2f40735c733fa\"))
  (:FILE \"src/epochs/retire.lisp\" :MD5
   #A((32) BASE-CHAR . \"653b974f310c09f6e2224a84acc43bbf\"))
  (:FILE \"src/epochs/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"82253491f995f5bc153fb5ebf30d564c\"))
  (:FILE \"src/execution/handoff.lisp\" :MD5
   #A((32) BASE-CHAR . \"6b85eebe69366e78ed5fc5cc20735f00\"))
  (:FILE \"src/execution/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb5710d6c111cadb7121a50998a747fa\"))
  (:FILE \"src/execution/queue.lisp\" :MD5
   #A((32) BASE-CHAR . \"8202843bddb817da4279ac959ae3f3c4\"))
  (:FILE \"src/execution/ready-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"38d26f8c749dd946dfc4b9c57103a892\"))
  (:FILE \"src/execution/ready-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a64d98c9ff429d6103d6e10ee1fd7980\"))
  (:FILE \"src/execution/ready.lisp\" :MD5
   #A((32) BASE-CHAR . \"2c1892002f0599bb8273093031017520\"))
  (:FILE \"src/execution/worker-boundary.lisp\" :MD5
   #A((32) BASE-CHAR . \"c24065d6c8d80d1be53994a0041743df\"))
  (:FILE \"src/execution/worker-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"babd0a78b4185af24ae1fef870c0fabb\"))
  (:FILE \"src/execution/worker-run.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa34ca6bc07535e35fea723878d99f66\"))
  (:FILE \"src/execution/worker-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"0679ee07c46f69db330706303c70d8d2\"))
  (:FILE \"src/execution/writer.lisp\" :MD5
   #A((32) BASE-CHAR . \"73019644090e2971f2b54dc36e4491f5\"))
  (:FILE \"src/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca642ea47e4bff76f78f5b6d7287d6bd\"))
  (:FILE \"src/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"a06115175f450776762761dce25acdb8\"))
  (:FILE \"src/foundation/conditions.lisp\" :MD5
   #A((32) BASE-CHAR . \"942b596396c19815290a57830af2121b\"))
  (:FILE \"src/foundation/crc32c.lisp\" :MD5
   #A((32) BASE-CHAR . \"4db58e2f48bf77d751f1b83bb9f84b5c\"))
  (:FILE \"src/foundation/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"5ee593a112958d94163dab17c5aa4ba2\"))
  (:FILE \"src/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"c3ed0f09fa3fa6fe20c98e2ed6e69abe\"))
  (:FILE \"src/get-directory/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"cde24b2bf5c5637d5501b95bed47df31\"))
  (:FILE \"src/get-directory/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a05062f6ab6d5ebdfdde37e336dfce6\"))
  (:FILE \"src/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"74a694385f1aaf03ec87721545494119\"))
  (:FILE \"src/get-directory/sources-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"2b8193aab6801de19e26fa55e7c53f87\"))
  (:FILE \"src/get-directory/sources-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"7bac02a80ddc22c622f8465642385ae8\"))
  (:FILE \"src/get-directory/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"17c957d6934a31f4ed64313e756de2d2\"))
  (:FILE \"src/get-resolver/active-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"c65593cf172f53a8e90a853bbe9504c2\"))
  (:FILE \"src/get-resolver/active-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"6d95f29b331d335175843f47ae44a6ea\"))
  (:FILE \"src/get-resolver/active-init.lisp\" :MD5
   #A((32) BASE-CHAR . \"7ca975d2534f43c8018d36ecd7c2b042\"))
  (:FILE \"src/get-resolver/active-preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"f13d422adb6aa9e8489352884137f25a\"))
  (:FILE \"src/get-resolver/active-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"521737861e057d663964b0c030552587\"))
  (:FILE \"src/get-resolver/active-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6aaec49504a96f37c8ff1bc182c977b\"))
  (:FILE \"src/get-resolver/active-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"60bb258cf4cc7f50c5c1206af1bb5800\"))
  (:FILE \"src/get-resolver/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbfb2082103e6712419e180ab972245c\"))
  (:FILE \"src/get-resolver/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"263525e8274a8f46ce58a4a0ad6841a2\"))
  (:FILE \"src/get-resolver/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"1339edff0223dbf122f11ff0adbba61c\"))
  (:FILE \"src/get-resolver/rows.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca9002b81efd0aed9761cd1f78514762\"))
  (:FILE \"src/get-resolver/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"536e9dc4ed51072b8a6d1528d3ec18bf\"))
  (:FILE \"src/get-resolver/sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d869293ba47444c4721713d955c6254\"))
  (:FILE \"src/get-resolver/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"9df13bcc6908e9fa601d173a671e1ccf\"))
  (:FILE \"src/get/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"c5cc36884b238221cc13ca0c087ec7c2\"))
  (:FILE \"src/get/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"e70bfeddd694336bbd088e65f8761834\"))
  (:FILE \"src/get/lookup.lisp\" :MD5
   #A((32) BASE-CHAR . \"82258ec87aca513a508bc5dee8410dd6\"))
  (:FILE \"src/get/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"c72633d15c3488699072eb610ebde7c8\"))
  (:FILE \"src/get/segment.lisp\" :MD5
   #A((32) BASE-CHAR . \"811869eb6a197d3c4e26af4322e52652\"))
  (:FILE \"src/get/target.lisp\" :MD5
   #A((32) BASE-CHAR . \"1b70dac05d6d2418909eb5105b808e81\"))
  (:FILE \"src/get/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"c394e5684de5e2d938991c7cb348b93c\"))
  (:FILE \"src/hash/arithmetic.lisp\" :MD5
   #A((32) BASE-CHAR . \"b5c51802e607e3dd22de68204baf64e9\"))
  (:FILE \"src/hash/blocks.lisp\" :MD5
   #A((32) BASE-CHAR . \"bef497b9a267c7306d4100000491c814\"))
  (:FILE \"src/hash/hash64.lisp\" :MD5
   #A((32) BASE-CHAR . \"886b7c08b9929283e8968831cbe5c039\"))
  (:FILE \"src/hash/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d9060e41bc5252067d35e59ac70ee06\"))
  (:FILE \"src/index/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"65076c355c099b5dc73d185948d3bec4\"))
  (:FILE \"src/index/hash-digests.lisp\" :MD5
   #A((32) BASE-CHAR . \"43d2209225707352daec6186ef95a805\"))
  (:FILE \"src/index/hash-seed.lisp\" :MD5
   #A((32) BASE-CHAR . \"45ce41749bc6fa638539815d3f802b96\"))
  (:FILE \"src/index/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"598a9b65e73151c924b2cdcaf6d96705\"))
  (:FILE \"src/index/primary-arena.lisp\" :MD5
   #A((32) BASE-CHAR . \"a319691e3e28b7ea7b927de490cf69ba\"))
  (:FILE \"src/index/primary-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff2cfbb865290d7a1510fdf6877c7229\"))
  (:FILE \"src/index/primary-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa52433eae199ceeb874bf2bc47afca7\"))
  (:FILE \"src/index/primary-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"1dd67c527257e43f17e006644ecdbd00\"))
  (:FILE \"src/index/primary-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d65cfce399b04f905bf969929962e59a\"))
  (:FILE \"src/index/primary-probe.lisp\" :MD5
   #A((32) BASE-CHAR . \"699ce3f1615296fc27fcde3e0d63a4bc\"))
  (:FILE \"src/index/primary-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"3f317a0d3c5ee86a73651aad36135cc3\"))
  (:FILE \"src/index/primary-relocate.lisp\" :MD5
   #A((32) BASE-CHAR . \"5155959766645d3172ae5e73c58cc071\"))
  (:FILE \"src/index/primary-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a59eab6425a60fa2656f86bf87d5c9ac\"))
  (:FILE \"src/index/primary-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"e8e31e599356e592af29c0cc4604872b\"))
  (:FILE \"src/index/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"5b22b90cfe8534086f6aff96d156713e\"))
  (:FILE \"src/index/rebuild-budget.lisp\" :MD5
   #A((32) BASE-CHAR . \"0417dd41cb3ec1d62dfd913c19f810ad\"))
  (:FILE \"src/index/rebuild-copy.lisp\" :MD5
   #A((32) BASE-CHAR . \"8befbbd00ed5c31c1487a11887eba495\"))
  (:FILE \"src/index/rebuild-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"1188e7a64a7a5d9482c1233cb9acb452\"))
  (:FILE \"src/index/rebuild.lisp\" :MD5
   #A((32) BASE-CHAR . \"a450cac8071513365267e7024cbe94b0\"))
  (:FILE \"src/index/relocate.lisp\" :MD5
   #A((32) BASE-CHAR . \"475dd7d5809a836f01544b447cc8df27\"))
  (:FILE \"src/index/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"5157fd03ee806ee998ad8f0002d56268\"))
  (:FILE \"src/index/validation.lisp\" :MD5
   #A((32) BASE-CHAR . \"3384cadf737c7d80c004222022a281f6\"))
  (:FILE \"src/index/write.lisp\" :MD5
   #A((32) BASE-CHAR . \"f0c8c579cd7db466d243ed3ea9f8e8aa\"))
  (:FILE \"src/io/flush.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbb059997772b42708272debc4d29c4b\"))
  (:FILE \"src/io/identity-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"d354a095fb378c1b6f27397ffb902227\"))
  (:FILE \"src/io/identity.lisp\" :MD5
   #A((32) BASE-CHAR . \"4e03b14a0c5015dc6ec897221c9f0eb5\"))
  (:FILE \"src/io/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"fc1cbc7b30e0d74c359e9ee1bbd201ec\"))
  (:FILE \"src/io/namespace.lisp\" :MD5
   #A((32) BASE-CHAR . \"8898b56d45e22212f1db37f208230f34\"))
  (:FILE \"src/io/native-namespace.lisp\" :MD5
   #A((32) BASE-CHAR . \"4c0c79a243bd691d3a602afd89b77980\"))
  (:FILE \"src/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"58030bc0c811248a6537e2909d8762d6\"))
  (:FILE \"src/io/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d5458684a1b169bacc46bc87fdaffed4\"))
  (:FILE \"src/io/rename.lisp\" :MD5
   #A((32) BASE-CHAR . \"40a1415771121f68afaa5165a0c23465\"))
  (:FILE \"src/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"ee2b4b86f91e1b61f7e5a36abe34ce9b\"))
  (:FILE \"src/io/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"95e28214f3629b7f4088b471ea22ce09\"))
  (:FILE \"src/mvcc/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f188d1dbd5d0adb49f53acf09157aef9\"))
  (:FILE \"src/mvcc/snapshots-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"8bb066aab61a18eff175b9edb11e42a2\"))
  (:FILE \"src/mvcc/snapshots-csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"0e9365e674d1584b111f915ce1f58634\"))
  (:FILE \"src/mvcc/snapshots-lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff98aea5cb9a7ae2671f6a887a003725\"))
  (:FILE \"src/mvcc/snapshots-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"ae3ad96269b5e711a9dbb455f3c0ce48\"))
  (:FILE \"src/mvcc/snapshots-register.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d5a795bcefd605c75da91c725ae83a2\"))
  (:FILE \"src/mvcc/snapshots-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"475517bd7ba04a1c37a82efeb8ff73d9\"))
  (:FILE \"src/mvcc/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a9bc70eab6720b5c6f8503178e2c966b\"))
  (:FILE \"src/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"becf5c78049c85f2c05cd1ef54454032\"))
  (:FILE \"src/read/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"4040905f4a64ba704a480d82e87ec748\"))
  (:FILE \"src/read/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7d74d9decc5a0bc9f9331d89bd503e21\"))
  (:FILE \"src/read/task.lisp\" :MD5
   #A((32) BASE-CHAR . \"9e0baf22c53329d393e047c669679645\"))
  (:FILE \"src/read/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"9c37ff8237fcc9fe9ae4f44316e854e3\"))
  (:FILE \"src/recovery-active/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"3df4fbfa866a44b320da4bc3da38789a\"))
  (:FILE \"src/recovery-active/closure.lisp\" :MD5
   #A((32) BASE-CHAR . \"b154d3d29f80146d895a99d84c2e9741\"))
  (:FILE \"src/recovery-active/frames.lisp\" :MD5
   #A((32) BASE-CHAR . \"493993aaec139f7aef9ede131dcd410a\"))
  (:FILE \"src/recovery-active/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1c3c71bdd0f168e151514caed4f469c\"))
  (:FILE \"src/recovery-active/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"b52b8ebacf81aa225b6ea417c4a0e6ac\"))
  (:FILE \"src/recovery-active/query.lisp\" :MD5
   #A((32) BASE-CHAR . \"04a6d2a8201256453b28b9785981a6d1\"))
  (:FILE \"src/recovery-active/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"1dc488f2e6f12feef9a0fe29c3bd7c60\"))
  (:FILE \"src/recovery-active/resolve.lisp\" :MD5
   #A((32) BASE-CHAR . \"81e35c3b0b15f92ecbe17fcd1e7715b9\"))
  (:FILE \"src/recovery-active/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"213f5f7b0442bfa1bfdd73b6ff54df01\"))
  (:FILE \"src/recovery/decisions-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"1a51ef4a488bb9fde2ff7d47bae01379\"))
  (:FILE \"src/recovery/decisions-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"cbdc30f93109c474e1fc25066c9b9b13\"))
  (:FILE \"src/recovery/decisions-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"f782d1137b8ce342b91c9999cfb7accc\"))
  (:FILE \"src/recovery/decisions-radix.lisp\" :MD5
   #A((32) BASE-CHAR . \"852149de4c289b8e067602780378d87a\"))
  (:FILE \"src/recovery/decisions-sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"b33e57a643f2fca810846f6226366253\"))
  (:FILE \"src/recovery/decisions-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f4433fd19ebc7239dbc2628c39f3ecdb\"))
  (:FILE \"src/recovery/inventory-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"9bd6820c4feba3e552aab1a4edd87861\"))
  (:FILE \"src/recovery/inventory-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"fcea263de1938767772e5b11411ecd5e\"))
  (:FILE \"src/recovery/inventory-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"78c136d5838dcfe3019d9069643a8d8f\"))
  (:FILE \"src/recovery/manifest-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bf65b1731eab6e0572461ef5cc60fc40\"))
  (:FILE \"src/recovery/manifest-decode.lisp\" :MD5
   #A((32) BASE-CHAR . \"67975249aaabd751757cdfb9222cc3c4\"))
  (:FILE \"src/recovery/manifest-fold.lisp\" :MD5
   #A((32) BASE-CHAR . \"e0d2498db1011e857b7b0daa1934f187\"))
  (:FILE \"src/recovery/manifest-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1d7d05fce907e6be7a34857ee168b01d\"))
  (:FILE \"src/recovery/manifest-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"ebd7a54adea2213294a887e6d4db0927\"))
  (:FILE \"src/recovery/manifest-transition.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa19e7689d3b74a5c861d95286b9f7c9\"))
  (:FILE \"src/recovery/manifest-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"7b1d4054415faca7e5fca59ad83b4d4a\"))
  (:FILE \"src/recovery/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1c1c8ad0cd15b1703a2fe19cbf3f13c2\"))
  (:FILE \"src/recovery/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"fcacd15460db25ea9cc4036065f9f096\"))
  (:FILE \"src/scheduler/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"36c5ae2dd08fbe546f4392b7b12102ec\"))
  (:FILE \"src/scheduler/lifecycle-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"1c4a4fd316ef034c298db47dfca1daca\"))
  (:FILE \"src/scheduler/lifecycle-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"19c8be44863be30c07bb72fe3fac2a99\"))
  (:FILE \"src/scheduler/lifecycle-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa2f88c50dfec24af40af091f9221590\"))
  (:FILE \"src/scheduler/lifecycle-update.lisp\" :MD5
   #A((32) BASE-CHAR . \"40a78461f91616a935a39f29b87680c8\"))
  (:FILE \"src/scheduler/lifecycle-worker.lisp\" :MD5
   #A((32) BASE-CHAR . \"9d7cdf45c1b594fef5af735ec0955c05\"))
  (:FILE \"src/scheduler/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"0578c541b6ddfaf8827240e967ff76ea\"))
  (:FILE \"src/scheduler/policy.lisp\" :MD5
   #A((32) BASE-CHAR . \"1721005a7545b36df601d75252638eba\"))
  (:FILE \"src/scheduler/pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4995b29d40caa2ee29aa0c167885287\"))
  (:FILE \"src/scheduler/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"170dfc36aef6a3d78f980fbcc37f0176\"))
  (:FILE \"src/scheduler/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"981f9f6db268cd9a46d4239c677c5d5b\"))
  (:FILE \"src/scheduler/update.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a43e6b400b701c69286357ef85469fc\"))
  (:FILE \"src/series/events.lisp\" :MD5
   #A((32) BASE-CHAR . \"32b2156739a6f2ca996abb91df0a2603\"))
  (:FILE \"src/series/io-events.lisp\" :MD5
   #A((32) BASE-CHAR . \"b6026a8b7bb64b45c37a65effda70d8e\"))
  (:FILE \"src/series/ownership.lisp\" :MD5
   #A((32) BASE-CHAR . \"de1aca16a35d34d16aba12ff541c0d2b\"))
  (:FILE \"src/series/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"09653c7479e1498d1545f3f1f0ffd755\"))
  (:FILE \"src/series/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6977aba53c811ec3a373226f9f53795\"))
  (:FILE \"src/series/query.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb0d91405325b508e6b2ab24d178de7a\"))
  (:FILE \"src/series/retirement.lisp\" :MD5
   #A((32) BASE-CHAR . \"b8e04971b8ad75a1bd0c722997badfd2\"))
  (:FILE \"src/series/routing-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6924deff152b941bd49f0bb200b4197\"))
  (:FILE \"src/series/routing-select.lisp\" :MD5
   #A((32) BASE-CHAR . \"e0f987d8767744050ec4d1b3ecb699ed\"))
  (:FILE \"src/series/routing-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ce649df47dd38888d5103c98345f7e41\"))
  (:FILE \"src/series/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab19ec8d15af91511e817858c41cebc8\"))
  (:FILE \"src/series/worker-boundary.lisp\" :MD5
   #A((32) BASE-CHAR . \"2340e0c9074f7b1bf80c74f774986bc5\"))
  (:FILE \"src/series/worker-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a93ce2e84e8aee647b5083ad1d2b899b\"))
  (:FILE \"src/series/worker-run.lisp\" :MD5
   #A((32) BASE-CHAR . \"f0fee18adf357bad98e8a3c3e8c70c0c\"))
  (:FILE \"src/series/worker-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"2b23d468be0165fa009c5ebd5d1bbe23\"))
  (:FILE \"src/storage/compaction-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"1cda77a357ab2147035993b72d135a37\"))
  (:FILE \"src/storage/control-payload.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb64f806b8d69eb42d865b4abfff0b27\"))
  (:FILE \"src/storage/formats.lisp\" :MD5
   #A((32) BASE-CHAR . \"061147be459d8d3b08c661bd3f91d152\"))
  (:FILE \"src/storage/log-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"b53d27dcc9f4badf18b50519c50bc614\"))
  (:FILE \"src/storage/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f86bd104f20616a76b42c02227f72844\"))
  (:FILE \"src/storage/payload-record.lisp\" :MD5
   #A((32) BASE-CHAR . \"8c03f9c01dcb30f2d3970a5694968ecf\"))
  (:FILE \"src/storage/payload-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4ece3c4fa8d9492d2a80df7c0a4f5a0\"))
  (:FILE \"src/storage/segment-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6812fa59bf8fd1252fbf85a9bfa3896\"))
  (:FILE \"src/wal/builder.lisp\" :MD5
   #A((32) BASE-CHAR . \"a229f76f7036f3573a6e528dcd390a19\"))
  (:FILE \"src/wal/csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"42b990e3b254e6fb488c0ab91b6a6502\"))
  (:FILE \"src/wal/executor.lisp\" :MD5
   #A((32) BASE-CHAR . \"c0340924c9130e14d0e8efedeec078f1\"))
  (:FILE \"src/wal/group.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a0e7c99ab70b4720cbb091156560f5e\"))
  (:FILE \"src/wal/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"96c41b1d417135a24fc65659ea3abe11\"))
  (:FILE \"src/wal/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f799f27a8ac1a4c736c04796c1e543f9\"))
  (:FILE \"tests/codec/cbor-array-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"eaff7126d31032812b816d96beed2d1d\"))
  (:FILE \"tests/codec/cbor-array-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"d799a632098e68b3c2d61d415ac7fd45\"))
  (:FILE \"tests/codec/cbor-array-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"b9d14be96752dcf8318c82878549672c\"))
  (:FILE \"tests/codec/cbor-float-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"19e60c5edb24fae449ebbe831bc1b1e8\"))
  (:FILE \"tests/codec/cbor-float-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"5590458e8334cd9774fd212297407308\"))
  (:FILE \"tests/codec/cbor-float-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"e62412cb0e838b241383a5c9103dd2c2\"))
  (:FILE \"tests/codec/cbor-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"208ee0d03652de67ad453bdd34d10b62\"))
  (:FILE \"tests/codec/cbor-map-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"074efafd791f68caf5779b0ccb16a2b3\"))
  (:FILE \"tests/codec/cbor-map-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"6591b26b30365cac76ba0927c090f343\"))
  (:FILE \"tests/codec/cbor-map-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"5478566e25301bda7467493b25194ac2\"))
  (:FILE \"tests/codec/cbor-minimal-edges.lisp\" :MD5
   #A((32) BASE-CHAR . \"392d402b44d04a9ce1c95fef4c4e8bf9\"))
  (:FILE \"tests/codec/cbor-minimal-scan-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"16954ef22a2169e6f9f6de0e9ab187ab\"))
  (:FILE \"tests/codec/cbor-minimal-scan-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"d59e1b8152cbaf0dbf4a6cea649cb611\"))
  (:FILE \"tests/codec/cbor-minimal-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"34587c10ac32129ac531e0a4f03df9a6\"))
  (:FILE \"tests/codec/cbor-minimal-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d7ec43e187859da277b8fb5f66f8e73\"))
  (:FILE \"tests/codec/cbor-minimal-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"5b145690222d1b50984f1a284f118a7e\"))
  (:FILE \"tests/codec/cbor-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"2311a15f8d4af90bf341e91e0e64342b\"))
  (:FILE \"tests/codec/cbor-simple-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"c92e59ed693525e8e3b53656d005e82e\"))
  (:FILE \"tests/codec/cbor-simple-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"5c44f9bcb54dcef327c88156a358313f\"))
  (:FILE \"tests/codec/cbor-simple-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"808ed81b703fd2cf0ac11d148c3ffc08\"))
  (:FILE \"tests/codec/cbor-string-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"07c96de5ded8b12d0db3f8d2dcbfbb1d\"))
  (:FILE \"tests/codec/cbor-string-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"82cf8ab7c6ffb9f1a717d5ba41004b49\"))
  (:FILE \"tests/codec/cbor-string-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"70d9d0d454dd1f296ef6989d3b928842\"))
  (:FILE \"tests/codec/cbor-structure-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"220d386d29b1fa192e06ceebe4ec245c\"))
  (:FILE \"tests/codec/cbor-structure-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"5f103dd263bcacb7b3c6bf0455157fa9\"))
  (:FILE \"tests/codec/cbor-structure.lisp\" :MD5
   #A((32) BASE-CHAR . \"06e6f060aea55a18d06047e5ebabd18e\"))
  (:FILE \"tests/codec/cbor-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e5da97609a2ba58bb35fea24b7518d2b\"))
  (:FILE \"tests/codec/cbor-tag-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"10fe18f5f9280f0de45a56de78114dae\"))
  (:FILE \"tests/codec/cbor-tag-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"f339e28bda3d94cc8f58589999988a6d\"))
  (:FILE \"tests/codec/cbor-tag-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"d697c11e86af9e64a3519707b58aad82\"))
  (:FILE \"tests/codec/cbor-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"d3b8d19096d8d0bab30c0a54e077c7f3\"))
  (:FILE \"tests/codec/cbor-write-roundtrip.lisp\" :MD5
   #A((32) BASE-CHAR . \"646944ef624c06fd86d6a1306041349d\"))
  (:FILE \"tests/codec/cbor-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"13382bdf23e5501e0ca349faf7b05062\"))
  (:FILE \"tests/codec/cbor-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa864f83784e5976a38a43e2a79b7c6b\"))
  (:FILE \"tests/codec/cbor-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"dffa6e75d8c3d7f991f6c4460eb8b9bc\"))
  (:FILE \"tests/codec/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"32534fd42dd8124b50b45deefe143eaf\"))
  (:FILE \"tests/codec/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"5b025b0cfe065c5d934bf0901433ef04\"))
  (:FILE \"tests/codec/utf8.lisp\" :MD5
   #A((32) BASE-CHAR . \"767ead15603be8dce90f340dbb200d8f\"))
  (:FILE \"tests/control/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"8611febd980cadd28945367b979d2392\"))
  (:FILE \"tests/control/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"019432427c5aacfc29d6366032a1ce83\"))
  (:FILE \"tests/control/recovery-publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"37426d589ee6fc5555a28f4d4d5bfc55\"))
  (:FILE \"tests/control/recovery-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"1355e6a03a4ce889031b4c6a9ccb183a\"))
  (:FILE \"tests/control/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"756de79a8b15f4ed479b3206b1ac6d5a\"))
  (:FILE \"tests/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"1d9133c5fd33cb60ff160f468db330f4\"))
  (:FILE \"tests/csn/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e5c151cda2e10e4f9cae46a4326699eb\"))
  (:FILE \"tests/csn/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"087108576603e6cd5b9af14b50475746\"))
  (:FILE \"tests/epochs/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe92ddd79dcaab3d3f7bdf387bf2295e\"))
  (:FILE \"tests/epochs/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"592a2fe2e22214c52d4672d26620980b\"))
  (:FILE \"tests/epochs/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"67cec074bf70074f7f2c6965ef494ba8\"))
  (:FILE \"tests/execution/handoff.lisp\" :MD5
   #A((32) BASE-CHAR . \"f87fdc0f7bd194329c6349026a2f35bb\"))
  (:FILE \"tests/execution/queue.lisp\" :MD5
   #A((32) BASE-CHAR . \"940ebb450bc871f8c2dd7dc9977bb158\"))
  (:FILE \"tests/execution/ready-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"4ccdc0512b3c81837726076d7c795930\"))
  (:FILE \"tests/execution/ready.lisp\" :MD5
   #A((32) BASE-CHAR . \"f6756125a9150b6312dad3e2705b74d3\"))
  (:FILE \"tests/execution/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"bacb1a135c0d73cded57ba21986c8496\"))
  (:FILE \"tests/execution/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"99e06430f652a655a9c029847f9fa345\"))
  (:FILE \"tests/execution/worker.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbaa592327d730fdae78cb881350efe0\"))
  (:FILE \"tests/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"29fc6a9711ea9265840e8cde4971f74e\"))
  (:FILE \"tests/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"07c4c9ac2177f22e5b7fb25f9867a133\"))
  (:FILE \"tests/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a84ca3aa74ab158c6b7d66886cf8b23\"))
  (:FILE \"tests/foundation/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"758adad069aec2f9dbe0635797314ff6\"))
  (:FILE \"tests/get-active/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"447bcc0feb60a5a668474060df098cd7\"))
  (:FILE \"tests/get-active/directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"0de1b79cfcdf9dd19a4336c745726576\"))
  (:FILE \"tests/get-active/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"961c0d8fe5ba267150701a9914369e57\"))
  (:FILE \"tests/get-active/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"da12d6e2b34116951e37764beab59c2a\"))
  (:FILE \"tests/get-active/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"9cbecf43fcd898db4f74826bf2c29fa3\"))
  (:FILE \"tests/get-directory/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"1137938073e71d6d8d62c751fbad05d5\"))
  (:FILE \"tests/get-directory/lifetime-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"074ccd2fc80ba020ef8c13f07c1beb42\"))
  (:FILE \"tests/get-directory/lifetime.lisp\" :MD5
   #A((32) BASE-CHAR . \"f40cde2709b2d93525fa8b8a73cc13d8\"))
  (:FILE \"tests/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"d1ab36d05cc1266e4533d27c693f12f4\"))
  (:FILE \"tests/get-directory/series-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"486604b450bfe8de32feaed1a96dc0cc\"))
  (:FILE \"tests/get-directory/series-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"092192d05b3f85c6c283113c57c02f01\"))
  (:FILE \"tests/get-directory/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"5e47378b562314a863ea850da186b12a\"))
  (:FILE \"tests/get-directory/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"63dd01c852de1399c2c82274d481d257\"))
  (:FILE \"tests/get-performance/guards.lisp\" :MD5
   #A((32) BASE-CHAR . \"324c70304e678cbe022ff33c73f793e2\"))
  (:FILE \"tests/get-performance/paths.lisp\" :MD5
   #A((32) BASE-CHAR . \"eb48216a4b5baa9cf498968ee032b205\"))
  (:FILE \"tests/get-performance/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f5f9fa3ffcc3220f10b7a5f294ee6d9\"))
  (:FILE \"tests/get-performance/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"916e5740db5d52fdf6088694f34d11db\"))
  (:FILE \"tests/get-resolver/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"a64a6a5a34c8ec5f8c4ca4324cc348d2\"))
  (:FILE \"tests/get-resolver/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"e93c7dbf1bf2d7e99651b110a4e01661\"))
  (:FILE \"tests/get-resolver/sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"ffe3551bb49dd60d7d34213c9c93cf06\"))
  (:FILE \"tests/get-resolver/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"0738e161d276394a160a86ed139610f2\"))
  (:FILE \"tests/get/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"3a4bbc3fd3ede5a837f0c0f913637291\"))
  (:FILE \"tests/get/segment.lisp\" :MD5
   #A((32) BASE-CHAR . \"2f25d1904aa4960ce0d6351580a2bcc7\"))
  (:FILE \"tests/get/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"660783988d4f99d0e171bb59c79e3467\"))
  (:FILE \"tests/hash/guards.lisp\" :MD5
   #A((32) BASE-CHAR . \"a59d531a156fc49c39c9265075bd9600\"))
  (:FILE \"tests/hash/hash64.lisp\" :MD5
   #A((32) BASE-CHAR . \"443fdc895f2fa3620d2b1b4af5c32dc4\"))
  (:FILE \"tests/hash/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"40b223712554582c2910971a6b045149\"))
  (:FILE \"tests/hash/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"73ed0785ca1330d69ad336abc019a413\"))
  (:FILE \"tests/index/hash-digests.lisp\" :MD5
   #A((32) BASE-CHAR . \"91c1eda35e14276e795259bceac489be\"))
  (:FILE \"tests/index/primary-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"44e2635d88de3f6ccf69c684c3eff77b\"))
  (:FILE \"tests/index/primary-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d339c2f2680e66ac79ecd8d02c09382\"))
  (:FILE \"tests/index/primary.lisp\" :MD5
   #A((32) BASE-CHAR . \"6ed661242a86117dd2d696e374740a2f\"))
  (:FILE \"tests/index/rebuild.lisp\" :MD5
   #A((32) BASE-CHAR . \"262556582cc0c387d6c59b757d9956b1\"))
  (:FILE \"tests/index/slot-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6ed9249e2eaef3524260804ef7e02567\"))
  (:FILE \"tests/index/slot-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"e9b53e6eac6fc836e8243d41adbafea0\"))
  (:FILE \"tests/index/slots.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe094b4513ceabe8571031ac20935e48\"))
  (:FILE \"tests/io/flush-failure.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa9f0dcf1a0bbd827af0918f8c9816e4\"))
  (:FILE \"tests/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"1e6fd9ab36eb4e307207d371ed947757\"))
  (:FILE \"tests/io/rename-native.lisp\" :MD5
   #A((32) BASE-CHAR . \"d79c13ea447cd8694b14bc6391d7e3ee\"))
  (:FILE \"tests/io/rename.lisp\" :MD5
   #A((32) BASE-CHAR . \"87acf2a7abb532d41aef472600184643\"))
  (:FILE \"tests/io/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"a26526e87fe46794b8bbab1fdd46d68c\"))
  (:FILE \"tests/io/transfer-failure.lisp\" :MD5
   #A((32) BASE-CHAR . \"c9da7d7deac220b193b38dcabe0f6bd6\"))
  (:FILE \"tests/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab2fb36682dd8b8bc757e586ceb3be62\"))
  (:FILE \"tests/lint-fixtures/bad.lisp\" :MD5
   #A((32) BASE-CHAR . \"30f1396c941dd9b8a41ca15698b5a347\"))
  (:FILE \"tests/lint-fixtures/good.lisp\" :MD5
   #A((32) BASE-CHAR . \"f85250c3a057c851db6745b9eba27da1\"))
  (:FILE \"tests/lint-fixtures/keyword-barrier.lisp\" :MD5
   #A((32) BASE-CHAR . \"9f63fdfdf866f17d5491390b710ebb5e\"))
  (:FILE \"tests/lint-fixtures/qualified-reader.lisp\" :MD5
   #A((32) BASE-CHAR . \"7fc689336bb2041dfef4c22090bb7de4\"))
  (:FILE \"tests/mvcc/capture.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f0309fa9258eb62a45167de5d2279d5\"))
  (:FILE \"tests/mvcc/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"341627288b50485858efedc207fc95b5\"))
  (:FILE \"tests/mvcc/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e7d26bd67650663c88ceda526023ae83\"))
  (:FILE \"tests/read/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"73dab63d8414998d72f6c14e0d62e3ac\"))
  (:FILE \"tests/read/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"0d5db03bd804747de7c309c82e40dd43\"))
  (:FILE \"tests/read/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"0cf2cad12c77c82b827da01782bc996d\"))
  (:FILE \"tests/recovery/corruption.lisp\" :MD5
   #A((32) BASE-CHAR . \"a369b8176d4e877ab546d17e983b94ed\"))
  (:FILE \"tests/recovery/decisions-audit.lisp\" :MD5
   #A((32) BASE-CHAR . \"33b98cf215d1ddb469d02cc6c0032bfe\"))
  (:FILE \"tests/recovery/decisions-radix.lisp\" :MD5
   #A((32) BASE-CHAR . \"58eec0feac01e643c76ad19ef5c07df5\"))
  (:FILE \"tests/recovery/decisions-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"80348d0ce2adbc8a4d37db49df291b1d\"))
  (:FILE \"tests/recovery/decisions.lisp\" :MD5
   #A((32) BASE-CHAR . \"5add0e087181bad8ce330af23fc26686\"))
  (:FILE \"tests/recovery/inventory-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"522afcdc6115fdd4d8fec0d06aab7354\"))
  (:FILE \"tests/recovery/inventory.lisp\" :MD5
   #A((32) BASE-CHAR . \"9c78925dd89e94d86a9f577e0225eeb3\"))
  (:FILE \"tests/recovery/manifest-audit.lisp\" :MD5
   #A((32) BASE-CHAR . \"3ca73a199708e2571da3a27e6dc00c76\"))
  (:FILE \"tests/recovery/manifest-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"3286e0dfb66496aafe8b6fbbdd92ab43\"))
  (:FILE \"tests/recovery/manifest-transition.lisp\" :MD5
   #A((32) BASE-CHAR . \"84b53d783522e179d8c8e798d0b5146e\"))
  (:FILE \"tests/recovery/manifest.lisp\" :MD5
   #A((32) BASE-CHAR . \"b6bdcc4d20f7db14c0dc00d5258cbf8c\"))
  (:FILE \"tests/recovery/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa7af12d270673b62542d32ec60b361a\"))
  (:FILE \"tests/recovery/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"769bac1994a5e3d74bd56b510970bf9b\"))
  (:FILE \"tests/scheduler/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"bc20dcd712332fde961fb38e879392b5\"))
  (:FILE \"tests/scheduler/dispatch.lisp\" :MD5
   #A((32) BASE-CHAR . \"0235bb18cc7a6169e47d3aebf2438bdd\"))
  (:FILE \"tests/scheduler/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"1388f446bce5085439c2254edd165118\"))
  (:FILE \"tests/scheduler/pool-begin.lisp\" :MD5
   #A((32) BASE-CHAR . \"5fe1f60cddf25dc099d80f843285018d\"))
  (:FILE \"tests/scheduler/pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"aaba914dea485f812a11767addb94c81\"))
  (:FILE \"tests/scheduler/pool-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"8c1264656e39ff936f904948f6b36802\"))
  (:FILE \"tests/scheduler/pool-step.lisp\" :MD5
   #A((32) BASE-CHAR . \"b8423d1625f5d07501ccbc4c231c622d\"))
  (:FILE \"tests/scheduler/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"34e51e369859bc1c731d73e43053b6f4\"))
  (:FILE \"tests/series/boundaries.lisp\" :MD5
   #A((32) BASE-CHAR . \"6967c7e6396b6df38c637f2d5d9ebfc0\"))
  (:FILE \"tests/series/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"a83818568a27c52d36365597d7113c09\"))
  (:FILE \"tests/series/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6aa566720d1476d13a0f7288be9e1346\"))
  (:FILE \"tests/series/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"67718445a8948da3c7875f6cc6b3e167\"))
  (:FILE \"tests/series/worker-bridge.lisp\" :MD5
   #A((32) BASE-CHAR . \"c714c8db7998acf60256b318488574d8\"))
  (:FILE \"tests/series/worker-routing.lisp\" :MD5
   #A((32) BASE-CHAR . \"f839733b6f5a4d9286a5cdd7ae9bcb55\"))
  (:FILE \"tests/smoke.lisp\" :MD5
   #A((32) BASE-CHAR . \"afb2e2bc7ff7249ebb2e1ccf0f87aaf3\"))
  (:FILE \"tests/storage/compaction-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb4acb5a73eb973f53ef337113880d32\"))
  (:FILE \"tests/storage/control-payload.lisp\" :MD5
   #A((32) BASE-CHAR . \"25f3c822273c898d2263ceb3db538cab\"))
  (:FILE \"tests/storage/log-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"eecb2fe94e710a918254e5ad453a0daa\"))
  (:FILE \"tests/storage/segment-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab2c52fb6b79702d50dcef6d12ca8906\"))
  (:FILE \"tests/storage/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"82a4dbb4767c17f9851143a637af3b83\"))
  (:FILE \"tests/wal/builder.lisp\" :MD5
   #A((32) BASE-CHAR . \"0d01e4e18c0a559873fce584a0ac91cd\"))
  (:FILE \"tests/wal/csn-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"ecb2cbf4f7ace32cdaff329476070d60\"))
  (:FILE \"tests/wal/csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"3e2dbc3319b611db090e27493a10fc2c\"))
  (:FILE \"tests/wal/fault.lisp\" :MD5
   #A((32) BASE-CHAR . \"00367366b82918614d84f517f4bb395e\"))
  (:FILE \"tests/wal/group.lisp\" :MD5
   #A((32) BASE-CHAR . \"0ee2462103a749b58488561aeacaac07\"))
  (:FILE \"tests/wal/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"0643b96c5ee339f9826b19150d065ddf\"))
  (:FILE \"tests/wal/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"15952f6b761acea4519abf701bb2346c\"))
  (:FILE \"tools/measure-pool-step.lisp\" :MD5
   #A((32) BASE-CHAR . \"2e176e89639e71da83393559c8f9999c\")))
 :SOURCE-CONSISTENCY :STABLE :RECORDED-AT 4001073146 :SELF-TEST
 (:STATUS :OK :SHARED-SENSOR
  (:STATUS :OK :BASELINE
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096 :WARMUP-ITERATIONS
    128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS 48 :SECONDS 4.8d-5
    :TIME-QUALITY :MEASURED :SINK 8386560 :DIAGNOSTIC NIL :EXPECTED-SINK
    8386560)
   :POSITIVE-CONTROL
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 16 :WARMUP-ITERATIONS 0
    :COMPLETED-ITERATIONS 16 :HEAP-BYTES 16777472 :RAW-TICKS 29 :SECONDS 2.9d-5
    :TIME-QUALITY :MEASURED :SINK 16777336 :DIAGNOSTIC NIL :EXPECTED-SINK
    16777336)
   :WRONG-SINK-PROBE
   (:REPLICA 0 :STATUS :EXPECTED-REJECTION :STAGE :MEASURED :ITERATIONS 2
    :WARMUP-ITERATIONS 0 :COMPLETED-ITERATIONS 2 :HEAP-BYTES 0 :RAW-TICKS 1
    :SECONDS 1.0d-6 :TIME-QUALITY :MEASURED :SINK 3 :DIAGNOSTIC
    #A((50) BASE-CHAR . \"COD-60: heap/clock negativo o sink 3 diverso da 1.\")
    :EXPECTED-SINK 1)
   :ZERO-CLOCK-PROBE
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 2 :WARMUP-ITERATIONS 0
    :COMPLETED-ITERATIONS 2 :HEAP-BYTES 0 :RAW-TICKS 0 :SECONDS NIL
    :TIME-QUALITY :BELOW-RESOLUTION :SINK 1 :DIAGNOSTIC NIL :EXPECTED-SINK 1)
   :COMPOSED-API-PROBE
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
    :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 7 :SECONDS 7.0d-6
    :TIME-QUALITY :MEASURED :SINK 318 :DIAGNOSTIC NIL :EXPECTED-SINK 318)
   :COMPOSED-REGISTRY-PROBE
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
    :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 8 :SECONDS 8.0d-6
    :TIME-QUALITY :MEASURED :SINK 142 :DIAGNOSTIC NIL :EXPECTED-SINK 142)
   :INVALID-CLI :REJECTED :OWNER-AND-REGISTRY-ORACLE-POSITIVE-NEGATIVE :PASSED
   :INVALID-NON-HOT :PASSED :EXISTING-DESTINATION-AND-PARTIAL-RAW :PASSED
   :MEASURED-PARTIAL-RAW
   (:REPLICA 0 :STATUS :EXPECTED-REJECTION :STAGE :MEASURED :ITERATIONS 4
    :WARMUP-ITERATIONS 0 :COMPLETED-ITERATIONS 1 :HEAP-BYTES 0 :RAW-TICKS 7
    :SECONDS 7.0d-6 :TIME-QUALITY :MEASURED :SINK 0 :DIAGNOSTIC
    #A((26) BASE-CHAR . \"fixture: misura interrotta\") :EXPECTED-SINK 6))
  :STEP-ORACLES :PASSED :STEP-CLI-AND-PARTIAL-RAW :PASSED :EMPTY
  (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
   :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 27 :SECONDS 2.7d-5
   :TIME-QUALITY :MEASURED :SINK 54 :DIAGNOSTIC NIL :EXPECTED-SINK 54)
  :INACTIVE
  (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
   :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 18 :SECONDS 1.8d-5
   :TIME-QUALITY :MEASURED :SINK 86 :DIAGNOSTIC NIL :EXPECTED-SINK 86)
  :CURRENT-INACTIVE
  (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
   :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 12 :SECONDS 1.2d-5
   :TIME-QUALITY :MEASURED :SINK 118 :DIAGNOSTIC NIL :EXPECTED-SINK 118))
 :SAMPLES
 ((:CAMPAIGN :EMPTY :REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   9224 :SECONDS 0.009224d0 :TIME-QUALITY :MEASURED :SINK 8435712 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8435712)
  (:CAMPAIGN :EMPTY :REPLICA 1 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   9866 :SECONDS 0.009866d0 :TIME-QUALITY :MEASURED :SINK 8435712 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8435712)
  (:CAMPAIGN :EMPTY :REPLICA 2 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   8655 :SECONDS 0.008655d0 :TIME-QUALITY :MEASURED :SINK 8435712 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8435712)
  (:CAMPAIGN :EMPTY :REPLICA 3 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   8957 :SECONDS 0.008957d0 :TIME-QUALITY :MEASURED :SINK 8435712 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8435712)
  (:CAMPAIGN :EMPTY :REPLICA 4 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   8282 :SECONDS 0.008282d0 :TIME-QUALITY :MEASURED :SINK 8435712 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8435712)
  (:CAMPAIGN :CURRENT-INACTIVE :REPLICA 0 :STATUS :OK :STAGE :COMPLETE
   :ITERATIONS 4096 :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096
   :HEAP-BYTES 0 :RAW-TICKS 3529 :SECONDS 0.003529d0 :TIME-QUALITY :MEASURED
   :SINK 8501248 :DIAGNOSTIC NIL :EXPECTED-SINK 8501248)
  (:CAMPAIGN :CURRENT-INACTIVE :REPLICA 1 :STATUS :OK :STAGE :COMPLETE
   :ITERATIONS 4096 :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096
   :HEAP-BYTES 0 :RAW-TICKS 3680 :SECONDS 0.00368d0 :TIME-QUALITY :MEASURED
   :SINK 8501248 :DIAGNOSTIC NIL :EXPECTED-SINK 8501248)
  (:CAMPAIGN :CURRENT-INACTIVE :REPLICA 2 :STATUS :OK :STAGE :COMPLETE
   :ITERATIONS 4096 :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096
   :HEAP-BYTES 0 :RAW-TICKS 5305 :SECONDS 0.005305d0 :TIME-QUALITY :MEASURED
   :SINK 8501248 :DIAGNOSTIC NIL :EXPECTED-SINK 8501248)
  (:CAMPAIGN :CURRENT-INACTIVE :REPLICA 3 :STATUS :OK :STAGE :COMPLETE
   :ITERATIONS 4096 :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096
   :HEAP-BYTES 0 :RAW-TICKS 6781 :SECONDS 0.006781d0 :TIME-QUALITY :MEASURED
   :SINK 8501248 :DIAGNOSTIC NIL :EXPECTED-SINK 8501248)
  (:CAMPAIGN :CURRENT-INACTIVE :REPLICA 4 :STATUS :OK :STAGE :COMPLETE
   :ITERATIONS 4096 :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096
   :HEAP-BYTES 0 :RAW-TICKS 4345 :SECONDS 0.004345d0 :TIME-QUALITY :MEASURED
   :SINK 8501248 :DIAGNOSTIC NIL :EXPECTED-SINK 8501248))
 :CURRENT-REPLICA NIL :SBCL #A((5) BASE-CHAR . \"2.6.9\") :MACHINE
 #A((5) BASE-CHAR . \"ARM64\") :OS #A((6) BASE-CHAR . \"Darwin\") :OS-VERSION
 #A((6) BASE-CHAR . \"27.0.0\") :SAFETY 3 :ITERATIONS 4096 :WARMUP 128 :REPLICAS
 5 :TIMER-UNITS-PER-SECOND 1000000 :CAMPAIGNS
 ((:EMPTY :FIXTURES-PER-CAMPAIGN 5 :SHARDS 4 :PORT-ACTIVE T :INITIAL-CURSOR 0
   :CALLS-PER-CYCLE 4 :TOKEN 12)
  (:CURRENT-INACTIVE :FIXTURES-PER-CAMPAIGN 5 :SHARDS 4 :PORT-ACTIVE NIL
   :INITIAL-CURSOR 1 :CALLS-PER-CYCLE 4 :INITIAL-CLAIM-OUTSIDE-CLOCK T
   :WORKER-PHASE :CLAIMED :LINK-PHASE :IDLE :DETAIL NIL :LIFECYCLE-ACTION NIL
   :SCALAR-STATE-ORACLE-IN-CYCLE T :TOKEN 28))
 :TOKEN-FORMULA \"sample=N*cycle-token+N*(N-1)/2; EMPTY=12; CURRENT-INACTIVE=28\"
 :LIMITS
 (:PREALLOCATED-PRODUCT-AND-INPUTS :FRESH-FIXTURE-PER-REPLICA
  :STARTUP-CLAIM-DRAIN-AND-GC-EXCLUDED :PUBLIC-CLAIM-AND-BOUNDED-DRAIN
  :COUNTER-NOT-ABSOLUTE-NONALLOCATION-PROOF :EXTERNAL-LOAD-UNCONTROLLED
  :CLOCK-ZERO-IS-BELOW-RESOLUTION :NO-TIME-THRESHOLD-NO-TUNING-CLAIM
  :EMPTY-IS-LOCAL-OBSERVATION :NO-REAL-QUEUED-IDLE-CLAIM-MEASURED
  :CURRENT-IS-REPEATED-CLAIMED-LOOKUP-WITH-INACTIVE-PORT
  :NO-BEGIN-OR-LIVE-LEASE-IN-CLOCK :NO-RECYCLE-OR-REFUSAL-LATENCY-MEASURED
  :INACTIVE-IDLE-ONLY-IN-SELF-TEST :NO-CONCURRENT-COORDINATOR
  :NO-PHYSICAL-WORKER-LIFECYCLE-QUALIFICATION))
")
  (:PATH
   #A((143) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-measure/coverage-attempt-01/1d1e416d1328d9c678a8622dfa5a7e8c.html")
   :BYTES 10924 :SHA256 "e73c96da45fa366fb39c54dabac1b2daa87d8c5cc492b709ffaeb5198547682b"
   :GIT-BLOB "fe3f1d5e085ce8a76fda83eecccbaf6583d19bd0" :TEXT "<html><head><style type='text/css'>
*.state-0 { background-color: #eeeeee }
*.state-1 { background-color: #aaffaa }
*.state-5 { background-color: #44dd44 }
*.state-2 { background-color: #ffaaaa }
*.state-10 { background-color: #ee6666 }
*.state-15 { color: #aaaaaa; background-color: #eeeeee }
*.state-9,*.state-6 { background-color: #ffffaa }
div.key { margin: 20px; width: 200px }
div.source { width: 88ex; background-color: #eeeeee; padding-left: 5px;
             /* border-style: solid none none none; border-width: 1px;
             border-color: #dddddd */ }

*.line-number { color: #666666; float: left; width: 6ex; text-align: right; margin-right: 1ex; }

table.summary tr.head-row { background-color: #aaaaff }
table.summary tr td.text-cell { text-align: left }
table.summary tr td.main-head { text-align: center }
table.summary tr td { text-align: right }
table.summary tr.even { background-color: #eeeeff }
table.summary tr.subheading { background-color: #aaaaff}
table.summary tr.subheading td { text-align: left; font-weight: bold; padding-left: 5ex; }
</style></head><body><h3>Coverage report: /private/tmp/arcdocdb-pool-step-qualification-1792043614/src/dispatch/types.lisp <br />
</h3>
<table class='summary'><tr class='head-row'><td width='80px'>Kind</td><td width='80px'>Covered</td><td width='80px'>All</td><td width='80px'>%</td><tr class='odd'><td>expression</td><td>40</td><td>40</td><td>100.0</td></tr>
<tr class='even'><td>branch</td><td>8</td><td>8</td><td>100.0</td></tr>
</table><div class='key'><b>Key</b><br />
<div class='state-0'>Not instrumented</div><div class='state-15'>Conditionalized out</div><div class='state-1'>Executed</div><div class='state-2'>Not executed</div><div>&#160;</div><div class='state-5'>Both branches taken</div><div class='state-6'>One branch taken</div><div class='state-10'>Neither branch taken</div></div><nobr><div><code>
</code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>1</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#59;&#160;Binding&#160;immutabile&#160;tra&#160;porta&#160;del&#160;pool&#160;e&#160;routing&#160;locale&#160;dello&#160;stesso&#160;worker&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>2</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;OWNER&#58;&#160;dispatcher&#160;e&#160;tabella&#160;del&#160;thread&#160;creatore&#59;&#160;nessuna&#160;migrazione&#160;o&#160;reentrancy&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>3</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;SHARED&#58;&#160;nessuna&#160;nuova&#160;struttura&#160;condivisa&#160;o&#160;scrittura&#160;globale&#160;per&#160;operazione&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>4</code></div><code>&#160;<span class='state-1'>&#40;in&#45;package&#160;&#35;&#58;arcdocdb&#46;scheduler&#46;dispatch&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>5</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;optimize&#160;&#40;safety&#160;3&#41;&#160;&#40;speed&#160;2&#41;&#160;&#40;debug&#160;2&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>6</code></div><code>&#160;<span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>7</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;REQ&#58;&#160;REQ&#45;THR&#45;001&#160;REQ&#45;CON&#45;002&#160;REQ&#45;CON&#45;005&#160;REQ&#45;AFF&#45;008</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>8</code></div><code>&#160;<span class='state-1'>&#40;defstruct&#160;&#40;dispatcher&#45;writer&#45;pool</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>9</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;&#58;constructor&#160;&#37;make&#45;dispatcher&#45;writer&#45;pool&#160;&#40;port&#160;table&#41;&#41;&#160;&#40;&#58;copier&#160;nil&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>10</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#34;Pre&#58;&#160;porta&#160;e&#160;tabella&#160;sul&#160;medesimo&#160;contesto&#160;IDLE&#44;&#160;owner&#160;corrente&#160;verificato&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>11</code></div><code>&#160;<span class='state-1'>Post&#58;&#160;binding&#160;preallocato&#160;immutabile&#59;&#160;nessun&#160;claim&#44;&#160;lease&#160;o&#160;comando&#160;applicato&#46;&#34;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>12</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;port&#160;nil&#160;&#58;type&#160;arcdocdb&#46;scheduler&#58;porta&#45;worker&#45;pool&#160;&#58;read&#45;only&#160;t&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>13</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;table&#160;nil&#160;&#58;type&#160;arcdocdb&#46;execution&#46;series&#58;tabella&#45;worker&#45;serie&#160;&#58;read&#45;only&#160;t&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>14</code></div><code>&#160;<span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>15</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;REQ&#58;&#160;REQ&#45;THR&#45;001&#160;REQ&#45;CON&#45;002&#160;REQ&#45;CON&#45;005&#160;REQ&#45;AFF&#45;008</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>16</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;ftype&#160;&#40;function&#160;&#40;t&#160;t&#41;&#160;null&#41;&#160;&#37;check&#45;dispatcher&#45;binding&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>17</code></div><code>&#160;<span class='state-1'>&#40;defun&#160;&#37;check&#45;dispatcher&#45;binding&#160;&#40;port&#160;table&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>18</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#34;Pre&#58;&#160;factory&#160;o&#160;dispatcher&#160;privato&#46;&#160;Post&#58;&#160;owner&#160;e&#160;identità&#160;del&#160;contesto&#160;validi&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>19</code></div><code>&#160;<span class='state-1'>INVALID&#45;ARGUMENT&#160;configuration&#47;owner&#47;binding&#160;prima&#160;di&#160;ACK&#44;&#160;claim&#160;o&#160;routing&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>20</code></div><code>&#160;<span class='state-1'>Nessuna&#160;lettura&#160;di&#160;fase&#44;&#160;parole&#160;pool&#44;&#160;ready&#44;&#160;lease&#160;o&#160;controller&#160;vivo&#46;&#34;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>21</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;unless&#160;</span><span class='state-5'>&#40;typep&#160;</span><span class='state-1'>port</span><span class='state-5'>&#160;</span><span class='state-1'>&#39;arcdocdb&#46;scheduler&#58;porta&#45;worker&#45;pool</span><span class='state-5'>&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>22</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;error&#160;&#39;invalid&#45;argument&#160;&#58;reason&#160;&#58;pool&#45;dispatcher&#45;configuration&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>23</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;unless&#160;</span><span class='state-5'>&#40;eq&#160;</span><span class='state-1'>&#40;arcdocdb&#46;scheduler&#58;&#58;porta&#45;worker&#45;pool&#45;owner&#160;port&#41;</span><span class='state-5'>&#160;</span><span class='state-1'>sb&#45;thread&#58;&#42;current&#45;thread&#42;</span><span class='state-5'>&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>24</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;error&#160;&#39;invalid&#45;argument&#160;&#58;reason&#160;&#58;pool&#45;worker&#45;owner&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>25</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;unless&#160;</span><span class='state-5'>&#40;typep&#160;</span><span class='state-1'>table</span><span class='state-5'>&#160;</span><span class='state-1'>&#39;arcdocdb&#46;execution&#46;series&#58;tabella&#45;worker&#45;serie</span><span class='state-5'>&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>26</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;error&#160;&#39;invalid&#45;argument&#160;&#58;reason&#160;&#58;pool&#45;dispatcher&#45;configuration&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>27</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;unless&#160;</span><span class='state-5'>&#40;eq&#160;</span><span class='state-1'>&#40;arcdocdb&#46;scheduler&#58;&#58;porta&#45;worker&#45;pool&#45;context&#160;port&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>28</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</span><span class='state-5'>&#160;&#160;&#160;&#160;</span><span class='state-1'>&#40;arcdocdb&#46;execution&#46;series&#58;&#58;tabella&#45;worker&#45;serie&#45;context&#160;table&#41;</span><span class='state-5'>&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>29</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;error&#160;&#39;invalid&#45;argument&#160;&#58;reason&#160;&#58;pool&#45;dispatcher&#45;binding&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>30</code></div><code>&#160;<span class='state-1'>&#160;&#160;nil&#41;</code></div></body></html>")
  (:PATH
   #A((143) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-measure/coverage-attempt-01/40f80e7d9e76d7b1de26c7c5b5503c7c.html")
   :BYTES 17201 :SHA256 "26bd9430d938e56be87ae29cdb3aed997b1047f81bf05ed5bc046906728cf1d4"
   :GIT-BLOB "c90ffde4e778dfc50a8e8d8ed3cec916434ec26c" :TEXT "<html><head><style type='text/css'>
*.state-0 { background-color: #eeeeee }
*.state-1 { background-color: #aaffaa }
*.state-5 { background-color: #44dd44 }
*.state-2 { background-color: #ffaaaa }
*.state-10 { background-color: #ee6666 }
*.state-15 { color: #aaaaaa; background-color: #eeeeee }
*.state-9,*.state-6 { background-color: #ffffaa }
div.key { margin: 20px; width: 200px }
div.source { width: 88ex; background-color: #eeeeee; padding-left: 5px;
             /* border-style: solid none none none; border-width: 1px;
             border-color: #dddddd */ }

*.line-number { color: #666666; float: left; width: 6ex; text-align: right; margin-right: 1ex; }

table.summary tr.head-row { background-color: #aaaaff }
table.summary tr td.text-cell { text-align: left }
table.summary tr td.main-head { text-align: center }
table.summary tr td { text-align: right }
table.summary tr.even { background-color: #eeeeff }
table.summary tr.subheading { background-color: #aaaaff}
table.summary tr.subheading td { text-align: left; font-weight: bold; padding-left: 5ex; }
</style></head><body><h3>Coverage report: /private/tmp/arcdocdb-pool-step-qualification-1792043614/src/dispatch/step.lisp <br />
</h3>
<table class='summary'><tr class='head-row'><td width='80px'>Kind</td><td width='80px'>Covered</td><td width='80px'>All</td><td width='80px'>%</td><tr class='odd'><td>expression</td><td>51</td><td>51</td><td>100.0</td></tr>
<tr class='even'><td>branch</td><td>0</td><td>0</td><td>nil  </td></tr>
</table><div class='key'><b>Key</b><br />
<div class='state-0'>Not instrumented</div><div class='state-15'>Conditionalized out</div><div class='state-1'>Executed</div><div class='state-2'>Not executed</div><div>&#160;</div><div class='state-5'>Both branches taken</div><div class='state-6'>One branch taken</div><div class='state-10'>Neither branch taken</div></div><nobr><div><code>
</code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>1</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#59;&#160;Un&#160;passo&#160;di&#160;governo&#58;&#160;prima&#160;gli&#160;obblighi&#44;&#160;nuova&#160;admission&#160;solo&#160;da&#160;IDLE&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>2</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;OWNER&#58;&#160;dispatcher&#160;e&#160;contesto&#160;locali&#160;al&#160;thread&#160;creatore&#44;&#160;senza&#160;reentrancy&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>3</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;SHARED&#58;&#160;soli&#160;ingressi&#160;pool&#47;ready&#47;routing&#160;esistenti&#160;per&#160;tratto&#160;&#40;ADR&#45;0045&#160;&#167;8&#41;&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>4</code></div><code>&#160;<span class='state-1'>&#40;in&#45;package&#160;&#35;&#58;arcdocdb&#46;scheduler&#46;dispatch&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>5</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;optimize&#160;&#40;safety&#160;3&#41;&#160;&#40;speed&#160;2&#41;&#160;&#40;debug&#160;2&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>6</code></div><code>&#160;<span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>7</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;REQ&#58;&#160;REQ&#45;THR&#45;001&#160;REQ&#45;CON&#45;001&#160;REQ&#45;CON&#45;002&#160;REQ&#45;CON&#45;004&#160;REQ&#45;CON&#45;005&#160;REQ&#45;AFF&#45;008</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>8</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;notinline&#160;&#37;passo&#45;dispatcher&#45;fase&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>9</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;ftype&#160;&#40;function&#160;&#40;dispatcher&#45;writer&#45;pool&#160;t&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>10</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;values&#160;&#40;or&#160;null&#160;arcdocdb&#46;execution&#46;series&#58;collegamento&#45;worker&#45;serie&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>11</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;member&#160;&#58;claimed&#160;&#58;empty&#160;&#58;busy&#160;&#58;inactive&#160;&#58;published&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>12</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;member&#160;&#58;claim&#160;&#58;current&#160;&#58;recycle&#41;&#160;&#40;or&#160;null&#160;index&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>13</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;member&#160;nil&#160;&#58;unchanged&#160;&#58;activated&#160;&#58;retired&#160;&#58;busy&#160;&#58;faulted&#41;&#160;&#38;optional&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>14</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#37;passo&#45;dispatcher&#45;fase&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>15</code></div><code>&#160;<span class='state-1'>&#40;defun&#160;&#37;passo&#45;dispatcher&#45;fase&#160;&#40;dispatcher&#160;phase&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>16</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#34;Pre&#58;&#160;binding&#160;verificato&#44;&#160;fase&#160;osservata&#160;accettata&#160;come&#160;T&#160;senza&#160;assunzioni&#160;C1&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>17</code></div><code>&#160;<span class='state-1'>Post&#58;&#160;un&#160;solo&#160;ingresso&#160;operativo&#44;&#160;cinque&#160;valori&#160;senza&#160;confondere&#160;cursor&#47;count&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>18</code></div><code>&#160;<span class='state-1'>Fasi&#160;note&#160;non&#160;ammesse&#160;RESOURCE&#45;EXHAUSTED&#59;&#160;inattesa&#160;INVARIANT&#45;VIOLATION&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>19</code></div><code>&#160;<span class='state-1'>NOTINLINE&#160;conserva&#160;la&#160;difesa&#160;fuori&#160;ftype&#59;&#160;nessun&#160;controllo&#160;dopo&#160;acquisizione&#46;&#34;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>20</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;case&#160;phase</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>21</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;&#58;idle</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>22</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#40;multiple&#45;value&#45;bind&#160;&#40;link&#160;status&#160;cursor&#160;action&#41;&#160;&#40;prendi&#45;collegamento&#45;pool&#160;dispatcher&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>23</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;values&#160;link&#160;status&#160;&#58;claim&#160;cursor&#160;action&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>24</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;&#58;claimed</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>25</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#40;values&#160;&#40;collega&#45;obbligo&#45;pool&#160;dispatcher&#41;&#160;&#58;claimed&#160;&#58;current&#160;nil&#160;nil&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>26</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;&#58;reschedule</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>27</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#40;multiple&#45;value&#45;bind&#160;&#40;link&#160;status&#160;count&#41;&#160;&#40;ricircola&#45;collegamento&#45;pool&#160;dispatcher&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>28</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;values&#160;link&#160;status&#160;&#58;recycle&#160;count&#160;nil&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>29</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;&#40;&#58;running&#160;&#58;batch&#160;&#58;finishing&#160;&#58;faulted&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>30</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#40;error&#160;&#39;resource&#45;exhausted&#160;&#58;reason&#160;&#58;worker&#45;state&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>31</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;otherwise&#160;&#40;error&#160;&#39;invariant&#45;violation&#160;&#58;reason&#160;&#58;pool&#45;dispatcher&#45;state&#41;&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>32</code></div><code>&#160;<span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>33</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;REQ&#58;&#160;REQ&#45;THR&#45;001&#160;REQ&#45;CON&#45;001&#160;REQ&#45;CON&#45;002&#160;REQ&#45;CON&#45;004&#160;REQ&#45;CON&#45;005&#160;REQ&#45;AFF&#45;008</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>34</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;ftype&#160;&#40;function&#160;&#40;dispatcher&#45;writer&#45;pool&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>35</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;values&#160;&#40;or&#160;null&#160;arcdocdb&#46;execution&#46;series&#58;collegamento&#45;worker&#45;serie&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>36</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;member&#160;&#58;claimed&#160;&#58;empty&#160;&#58;busy&#160;&#58;inactive&#160;&#58;published&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>37</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;member&#160;&#58;claim&#160;&#58;current&#160;&#58;recycle&#41;&#160;&#40;or&#160;null&#160;index&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>38</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;member&#160;nil&#160;&#58;unchanged&#160;&#58;activated&#160;&#58;retired&#160;&#58;busy&#160;&#58;faulted&#41;&#160;&#38;optional&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>39</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;passo&#45;dispatcher&#45;pool&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>40</code></div><code>&#160;<span class='state-1'>&#40;defun&#160;passo&#45;dispatcher&#45;pool&#160;&#40;dispatcher&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>41</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#34;Pre&#58;&#160;owner&#160;corrente&#44;&#160;fase&#160;IDLE&#47;CLAIMED&#47;RESCHEDULE&#160;coerente&#44;&#160;bridge&#160;gia&#160;chiuso&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>42</code></div><code>&#160;<span class='state-1'>Post&#58;&#160;claim&#47;current&#47;recycle&#160;esclusivi&#44;&#160;al&#160;piu&#160;un&#160;trasferimento&#160;ready&#59;&#160;nessun&#160;begin&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>43</code></div><code>&#160;<span class='state-1'>Binding&#160;prima&#160;della&#160;lettura&#160;fase&#59;&#160;rifiuti&#47;fault&#160;delegati&#160;senza&#160;rollback&#160;o&#160;cleanup&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>44</code></div><code>&#160;<span class='state-1'>Pubblicazione&#160;termina&#160;il&#160;passo&#59;&#160;nessuna&#160;nuova&#160;presa&#160;o&#160;ACK&#160;impliciti&#160;dopo&#160;recycle&#46;&#34;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>45</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;let&#160;&#40;&#40;port&#160;&#40;dispatcher&#45;writer&#45;pool&#45;port&#160;dispatcher&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>46</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;table&#160;&#40;dispatcher&#45;writer&#45;pool&#45;table&#160;dispatcher&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>47</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;&#37;check&#45;dispatcher&#45;binding&#160;port&#160;table&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>48</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;&#37;passo&#45;dispatcher&#45;fase</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>49</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;dispatcher&#160;&#40;arcdocdb&#46;execution&#58;stato&#45;worker&#45;writer</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>50</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;arcdocdb&#46;scheduler&#58;&#58;porta&#45;worker&#45;pool&#45;context&#160;port&#41;&#41;&#41;&#41;&#41;</code></div></body></html>")
  (:PATH
   #A((143) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-measure/coverage-attempt-01/4c7b6e6666b7bf467861c71cd6aa7a8e.html")
   :BYTES 7280 :SHA256 "2810350a9139e7ae3614d5e967558b80140791b76d87f9f403f546cfed0e23aa" :GIT-BLOB
   "ff9d0f1d9c07b390acfc4bfa84571865f8cad402" :TEXT "<html><head><style type='text/css'>
*.state-0 { background-color: #eeeeee }
*.state-1 { background-color: #aaffaa }
*.state-5 { background-color: #44dd44 }
*.state-2 { background-color: #ffaaaa }
*.state-10 { background-color: #ee6666 }
*.state-15 { color: #aaaaaa; background-color: #eeeeee }
*.state-9,*.state-6 { background-color: #ffffaa }
div.key { margin: 20px; width: 200px }
div.source { width: 88ex; background-color: #eeeeee; padding-left: 5px;
             /* border-style: solid none none none; border-width: 1px;
             border-color: #dddddd */ }

*.line-number { color: #666666; float: left; width: 6ex; text-align: right; margin-right: 1ex; }

table.summary tr.head-row { background-color: #aaaaff }
table.summary tr td.text-cell { text-align: left }
table.summary tr td.main-head { text-align: center }
table.summary tr td { text-align: right }
table.summary tr.even { background-color: #eeeeff }
table.summary tr.subheading { background-color: #aaaaff}
table.summary tr.subheading td { text-align: left; font-weight: bold; padding-left: 5ex; }
</style></head><body><h3>Coverage report: /private/tmp/arcdocdb-pool-step-qualification-1792043614/src/dispatch/build.lisp <br />
</h3>
<table class='summary'><tr class='head-row'><td width='80px'>Kind</td><td width='80px'>Covered</td><td width='80px'>All</td><td width='80px'>%</td><tr class='odd'><td>expression</td><td>24</td><td>24</td><td>100.0</td></tr>
<tr class='even'><td>branch</td><td>2</td><td>2</td><td>100.0</td></tr>
</table><div class='key'><b>Key</b><br />
<div class='state-0'>Not instrumented</div><div class='state-15'>Conditionalized out</div><div class='state-1'>Executed</div><div class='state-2'>Not executed</div><div>&#160;</div><div class='state-5'>Both branches taken</div><div class='state-6'>One branch taken</div><div class='state-10'>Neither branch taken</div></div><nobr><div><code>
</code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>1</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#59;&#160;Costruzione&#160;separata&#160;dal&#160;percorso&#160;caldo&#44;&#160;prima&#160;di&#160;qualsiasi&#160;obbligo&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>2</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;OWNER&#58;&#160;factory&#160;sul&#160;thread&#160;che&#160;possiede&#160;porta&#160;e&#160;contesto&#44;&#160;senza&#160;reentrancy&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>3</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;SHARED&#58;&#160;solo&#160;riferimenti&#160;immutabili&#44;&#160;nessuna&#160;pubblicazione&#160;o&#160;lettura&#160;di&#160;comandi&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>4</code></div><code>&#160;<span class='state-1'>&#40;in&#45;package&#160;&#35;&#58;arcdocdb&#46;scheduler&#46;dispatch&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>5</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;optimize&#160;&#40;safety&#160;3&#41;&#160;&#40;speed&#160;2&#41;&#160;&#40;debug&#160;2&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>6</code></div><code>&#160;<span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>7</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;REQ&#58;&#160;REQ&#45;THR&#45;001&#160;REQ&#45;CON&#45;002&#160;REQ&#45;CON&#45;004&#160;REQ&#45;CON&#45;005&#160;REQ&#45;AFF&#45;008</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>8</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;ftype&#160;&#40;function&#160;&#40;t&#160;t&#41;&#160;dispatcher&#45;writer&#45;pool&#41;&#160;crea&#45;dispatcher&#45;writer&#45;pool&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>9</code></div><code>&#160;<span class='state-1'>&#40;defun&#160;crea&#45;dispatcher&#45;writer&#45;pool&#160;&#40;port&#160;table&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>10</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#34;Pre&#58;&#160;porta&#160;e&#160;tabella&#160;preallocate&#44;&#160;stesso&#160;contesto&#160;libero&#44;&#160;owner&#160;corrente&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>11</code></div><code>&#160;<span class='state-1'>Post&#58;&#160;dispatcher&#160;immutabile&#160;senza&#160;acquisire&#160;lavoro&#160;o&#160;applicare&#160;comandi&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>12</code></div><code>&#160;<span class='state-1'>INVALID&#45;ARGUMENT&#160;tipo&#47;owner&#47;binding&#59;&#160;RESOURCE&#45;EXHAUSTED&#160;fase&#160;non&#45;IDLE&#59;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>13</code></div><code>&#160;<span class='state-1'>barriera&#160;C1&#160;read&#45;only&#160;sull&#39;IDLE&#160;completo&#44;&#160;nessun&#160;nuovo&#160;fault&#160;marking&#160;C3&#46;&#34;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>14</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;&#37;check&#45;dispatcher&#45;binding&#160;port&#160;table&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>15</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;let&#160;&#40;&#40;context&#160;&#40;arcdocdb&#46;scheduler&#58;&#58;porta&#45;worker&#45;pool&#45;context&#160;port&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>16</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;unless&#160;</span><span class='state-5'>&#40;eq&#160;</span><span class='state-1'>&#40;arcdocdb&#46;execution&#58;stato&#45;worker&#45;writer&#160;context&#41;</span><span class='state-5'>&#160;</span><span class='state-1'>&#58;idle</span><span class='state-5'>&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>17</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#40;error&#160;&#39;resource&#45;exhausted&#160;&#58;reason&#160;&#58;worker&#45;state&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>18</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;arcdocdb&#46;execution&#58;&#58;&#37;richiedi&#45;worker&#160;context&#160;&#58;idle&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>19</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;&#37;make&#45;dispatcher&#45;writer&#45;pool&#160;port&#160;table&#41;&#41;</code></div></body></html>")
  (:PATH
   #A((143) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-measure/coverage-attempt-01/633ac734f1e31deee00a2c35c6531753.html")
   :BYTES 4727 :SHA256 "c084cfb82b5fd2a3abd133a432a8280d5c4d7ce3ecd54975b1d684e785185682" :GIT-BLOB
   "6a7dd60ecdae1eab524973b7abba6b84c68d1570" :TEXT "<html><head><style type='text/css'>
*.state-0 { background-color: #eeeeee }
*.state-1 { background-color: #aaffaa }
*.state-5 { background-color: #44dd44 }
*.state-2 { background-color: #ffaaaa }
*.state-10 { background-color: #ee6666 }
*.state-15 { color: #aaaaaa; background-color: #eeeeee }
*.state-9,*.state-6 { background-color: #ffffaa }
div.key { margin: 20px; width: 200px }
div.source { width: 88ex; background-color: #eeeeee; padding-left: 5px;
             /* border-style: solid none none none; border-width: 1px;
             border-color: #dddddd */ }

*.line-number { color: #666666; float: left; width: 6ex; text-align: right; margin-right: 1ex; }

table.summary tr.head-row { background-color: #aaaaff }
table.summary tr td.text-cell { text-align: left }
table.summary tr td.main-head { text-align: center }
table.summary tr td { text-align: right }
table.summary tr.even { background-color: #eeeeff }
table.summary tr.subheading { background-color: #aaaaff}
table.summary tr.subheading td { text-align: left; font-weight: bold; padding-left: 5ex; }
</style></head><body><h3>Coverage report: /private/tmp/arcdocdb-pool-step-qualification-1792043614/src/dispatch/package.lisp <br />
</h3>
<table class='summary'><tr class='head-row'><td width='80px'>Kind</td><td width='80px'>Covered</td><td width='80px'>All</td><td width='80px'>%</td><tr class='odd'><td>expression</td><td>1</td><td>1</td><td>100.0</td></tr>
<tr class='even'><td>branch</td><td>0</td><td>0</td><td>nil  </td></tr>
</table><div class='key'><b>Key</b><br />
<div class='state-0'>Not instrumented</div><div class='state-15'>Conditionalized out</div><div class='state-1'>Executed</div><div class='state-2'>Not executed</div><div>&#160;</div><div class='state-5'>Both branches taken</div><div class='state-6'>One branch taken</div><div class='state-10'>Neither branch taken</div></div><nobr><div><code>
</code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>1</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#59;&#160;Dispatcher&#160;logico&#44;&#160;caricato&#160;dopo&#160;il&#160;routing&#160;e&#160;il&#160;governo&#160;del&#160;pool&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>2</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;REQ&#58;&#160;REQ&#45;THR&#45;001&#160;REQ&#45;CON&#45;001&#160;REQ&#45;CON&#45;002&#160;REQ&#45;CON&#45;005&#160;REQ&#45;AFF&#45;008</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>3</code></div><code>&#160;<span class='state-1'>&#40;defpackage&#160;&#35;&#58;arcdocdb&#46;scheduler&#46;dispatch</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>4</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;&#58;use&#160;&#35;&#58;cl&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>5</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;&#58;import&#45;from&#160;&#35;&#58;arcdocdb&#46;binary&#160;&#35;&#58;index&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>6</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;&#58;import&#45;from&#160;&#35;&#58;arcdocdb&#46;conditions&#160;&#35;&#58;invalid&#45;argument&#160;&#35;&#58;resource&#45;exhausted</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>7</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#35;&#58;invariant&#45;violation&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>8</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;&#58;export&#160;&#35;&#58;dispatcher&#45;writer&#45;pool&#160;&#35;&#58;crea&#45;dispatcher&#45;writer&#45;pool</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>9</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#35;&#58;prendi&#45;collegamento&#45;pool&#160;&#35;&#58;collega&#45;obbligo&#45;pool&#160;&#35;&#58;ricircola&#45;collegamento&#45;pool</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>10</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#35;&#58;inizia&#45;obbligo&#45;pool&#160;&#35;&#58;passo&#45;dispatcher&#45;pool&#41;&#41;</code></div></body></html>")
  (:PATH
   #A((143) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-measure/coverage-attempt-01/695fa4de2754fae3d3e6a366609d60ca.html")
   :BYTES 14995 :SHA256 "2f6f541668d31f35641a180cf230b87ec5efa0a4b847b64a7dcb0a3b0cd4a241"
   :GIT-BLOB "1ca17dbbce2827298dbbe1200ac979c247c4845e" :TEXT "<html><head><style type='text/css'>
*.state-0 { background-color: #eeeeee }
*.state-1 { background-color: #aaffaa }
*.state-5 { background-color: #44dd44 }
*.state-2 { background-color: #ffaaaa }
*.state-10 { background-color: #ee6666 }
*.state-15 { color: #aaaaaa; background-color: #eeeeee }
*.state-9,*.state-6 { background-color: #ffffaa }
div.key { margin: 20px; width: 200px }
div.source { width: 88ex; background-color: #eeeeee; padding-left: 5px;
             /* border-style: solid none none none; border-width: 1px;
             border-color: #dddddd */ }

*.line-number { color: #666666; float: left; width: 6ex; text-align: right; margin-right: 1ex; }

table.summary tr.head-row { background-color: #aaaaff }
table.summary tr td.text-cell { text-align: left }
table.summary tr td.main-head { text-align: center }
table.summary tr td { text-align: right }
table.summary tr.even { background-color: #eeeeff }
table.summary tr.subheading { background-color: #aaaaff}
table.summary tr.subheading td { text-align: left; font-weight: bold; padding-left: 5ex; }
</style></head><body><h3>Coverage report: /private/tmp/arcdocdb-pool-step-qualification-1792043614/src/dispatch/claim.lisp <br />
</h3>
<table class='summary'><tr class='head-row'><td width='80px'>Kind</td><td width='80px'>Covered</td><td width='80px'>All</td><td width='80px'>%</td><tr class='odd'><td>expression</td><td>45</td><td>49</td><td> 91.8</td></tr>
<tr class='even'><td>branch</td><td>0</td><td>0</td><td>nil  </td></tr>
</table><div class='key'><b>Key</b><br />
<div class='state-0'>Not instrumented</div><div class='state-15'>Conditionalized out</div><div class='state-1'>Executed</div><div class='state-2'>Not executed</div><div>&#160;</div><div class='state-5'>Both branches taken</div><div class='state-6'>One branch taken</div><div class='state-10'>Neither branch taken</div></div><nobr><div><code>
</code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>1</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#59;&#160;Nuova&#160;presa&#160;governata&#59;&#160;gli&#160;obblighi&#160;esistenti&#160;hanno&#160;un&#160;ingresso&#160;indipendente&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>2</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;OWNER&#58;&#160;dispatcher&#44;&#160;contesto&#160;e&#160;collegamenti&#160;locali&#160;al&#160;medesimo&#160;worker&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>3</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;SHARED&#58;&#160;solo&#160;API&#160;pool&#47;ready&#47;routing&#160;esistenti&#160;per&#160;tratto&#160;&#40;ADR&#45;0045&#160;&#167;8&#41;&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>4</code></div><code>&#160;<span class='state-1'>&#40;in&#45;package&#160;&#35;&#58;arcdocdb&#46;scheduler&#46;dispatch&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>5</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;optimize&#160;&#40;safety&#160;3&#41;&#160;&#40;speed&#160;2&#41;&#160;&#40;debug&#160;2&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>6</code></div><code>&#160;<span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>7</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;REQ&#58;&#160;REQ&#45;THR&#45;001&#160;REQ&#45;CON&#45;001&#160;REQ&#45;CON&#45;002&#160;REQ&#45;CON&#45;004&#160;REQ&#45;CON&#45;005&#160;REQ&#45;AFF&#45;008</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>8</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;ftype&#160;&#40;function&#160;&#40;dispatcher&#45;writer&#45;pool&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>9</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;values&#160;&#40;or&#160;null&#160;arcdocdb&#46;execution&#46;series&#58;collegamento&#45;worker&#45;serie&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>10</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;member&#160;&#58;claimed&#160;&#58;empty&#160;&#58;busy&#160;&#58;inactive&#41;&#160;index</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>11</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;member&#160;&#58;unchanged&#160;&#58;activated&#160;&#58;retired&#160;&#58;busy&#160;&#58;faulted&#41;&#160;&#38;optional&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>12</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;prendi&#45;collegamento&#45;pool&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>13</code></div><code>&#160;<span class='state-1'>&#40;defun&#160;prendi&#45;collegamento&#45;pool&#160;&#40;dispatcher&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>14</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#34;Pre&#58;&#160;owner&#160;corrente&#44;&#160;worker&#160;IDLE&#160;libero&#46;&#160;Post&#58;&#160;link&#160;preallocato&#160;solo&#160;dopo&#160;CLAIMED&#44;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>15</code></div><code>&#160;<span class='state-1'>oppure&#160;NIL&#47;esito&#47;cursore&#47;azione&#160;originali&#160;del&#160;gate&#46;&#160;Nessun&#160;begin&#44;&#160;lease&#160;o&#160;pop&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>16</code></div><code>&#160;<span class='state-1'>Binding&#160;rifiutato&#160;prima&#160;del&#160;gate&#59;&#160;errori&#160;delegati&#160;mantengono&#160;confini&#160;e&#160;obblighi&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>17</code></div><code>&#160;<span class='state-1'>Un&#160;fault&#160;di&#160;routing&#160;conserva&#160;il&#160;claim&#160;e&#160;l&#39;ACK&#160;già&#160;riuscito&#44;&#160;senza&#160;rollback&#46;&#34;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>18</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;let&#160;&#40;&#40;port&#160;&#40;dispatcher&#45;writer&#45;pool&#45;port&#160;dispatcher&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>19</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;table&#160;&#40;dispatcher&#45;writer&#45;pool&#45;table&#160;dispatcher&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>20</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;&#37;check&#45;dispatcher&#45;binding&#160;port&#160;table&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>21</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;multiple&#45;value&#45;bind&#160;&#40;writer&#160;status&#160;cursor&#160;action&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>22</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;arcdocdb&#46;scheduler&#58;prendi&#45;writer&#45;pool&#160;port&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>23</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#40;case&#160;status</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>24</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;&#58;claimed</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>25</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;unless&#160;writer&#160;&#40;error&#160;&#39;invariant&#45;violation&#160;&#58;reason&#160;&#58;pool&#45;dispatcher&#45;state&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>26</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;values&#160;&#40;arcdocdb&#46;execution&#46;series&#58;collega&#45;writer&#45;worker&#45;serie&#160;table&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>27</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;status&#160;cursor&#160;action&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>28</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;&#40;&#58;empty&#160;&#58;busy&#160;&#58;inactive&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>29</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;when&#160;writer&#160;&#40;error&#160;&#39;invariant&#45;violation&#160;&#58;reason&#160;&#58;pool&#45;dispatcher&#45;state&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>30</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;values&#160;nil&#160;status&#160;cursor&#160;action&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>31</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;otherwise&#160;</span><span class='state-2'>&#40;error&#160;&#39;invariant&#45;violation&#160;&#58;reason&#160;&#58;pool&#45;dispatcher&#45;state&#41;</span><span class='state-1'>&#41;&#41;&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>32</code></div><code>&#160;<span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>33</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;REQ&#58;&#160;REQ&#45;THR&#45;001&#160;REQ&#45;CON&#45;001&#160;REQ&#45;CON&#45;002&#160;REQ&#45;CON&#45;004&#160;REQ&#45;CON&#45;005&#160;REQ&#45;AFF&#45;008</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>34</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;ftype&#160;&#40;function&#160;&#40;dispatcher&#45;writer&#45;pool&#41;&#160;arcdocdb&#46;execution&#46;series&#58;collegamento&#45;worker&#45;serie&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>35</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;collega&#45;obbligo&#45;pool&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>36</code></div><code>&#160;<span class='state-1'>&#40;defun&#160;collega&#45;obbligo&#45;pool&#160;&#40;dispatcher&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>37</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#34;Pre&#58;&#160;owner&#160;corrente&#44;&#160;CLAIMED&#160;già&#160;assunto&#160;da&#160;busy&#160;begin&#44;&#160;ricircolo&#160;o&#160;adozione&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>38</code></div><code>&#160;<span class='state-1'>Post&#58;&#160;link&#160;corrente&#160;preallocato&#44;&#160;selezione&#160;ripetibile&#160;senza&#160;nuove&#160;capacità&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>39</code></div><code>&#160;<span class='state-1'>Non&#160;legge&#160;comandi&#47;active&#160;e&#160;non&#160;conferma&#160;ritiro&#58;&#160;il&#160;caller&#160;completa&#160;l&#39;obbligo&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>40</code></div><code>&#160;<span class='state-1'>Binding&#47;owner&#160;e&#160;routing&#160;delegati&#59;&#160;fase&#47;fault&#160;preservati&#160;dai&#160;confini&#160;C1&#160;esistenti&#46;&#34;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>41</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;let&#160;&#40;&#40;port&#160;&#40;dispatcher&#45;writer&#45;pool&#45;port&#160;dispatcher&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>42</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;table&#160;&#40;dispatcher&#45;writer&#45;pool&#45;table&#160;dispatcher&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>43</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;&#37;check&#45;dispatcher&#45;binding&#160;port&#160;table&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>44</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;arcdocdb&#46;execution&#46;series&#58;collega&#45;writer&#45;worker&#45;serie&#160;table&#41;&#41;&#41;</code></div></body></html>")
  (:PATH
   #A((143) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-measure/coverage-attempt-01/843c9cdafa70c00ccb97a37510baeee4.html")
   :BYTES 14671 :SHA256 "6ae413e31aefdd6b09fa23dd61832d3619b4ed4c5864685e2dfeb73ede9cc7e5"
   :GIT-BLOB "563007e1bf79e56d5cc0e990292556f4d1493ef8" :TEXT "<html><head><style type='text/css'>
*.state-0 { background-color: #eeeeee }
*.state-1 { background-color: #aaffaa }
*.state-5 { background-color: #44dd44 }
*.state-2 { background-color: #ffaaaa }
*.state-10 { background-color: #ee6666 }
*.state-15 { color: #aaaaaa; background-color: #eeeeee }
*.state-9,*.state-6 { background-color: #ffffaa }
div.key { margin: 20px; width: 200px }
div.source { width: 88ex; background-color: #eeeeee; padding-left: 5px;
             /* border-style: solid none none none; border-width: 1px;
             border-color: #dddddd */ }

*.line-number { color: #666666; float: left; width: 6ex; text-align: right; margin-right: 1ex; }

table.summary tr.head-row { background-color: #aaaaff }
table.summary tr td.text-cell { text-align: left }
table.summary tr td.main-head { text-align: center }
table.summary tr td { text-align: right }
table.summary tr.even { background-color: #eeeeff }
table.summary tr.subheading { background-color: #aaaaff}
table.summary tr.subheading td { text-align: left; font-weight: bold; padding-left: 5ex; }
</style></head><body><h3>Coverage report: /private/tmp/arcdocdb-pool-step-qualification-1792043614/src/dispatch/recycle.lisp <br />
</h3>
<table class='summary'><tr class='head-row'><td width='80px'>Kind</td><td width='80px'>Covered</td><td width='80px'>All</td><td width='80px'>%</td><tr class='odd'><td>expression</td><td>45</td><td>49</td><td> 91.8</td></tr>
<tr class='even'><td>branch</td><td>0</td><td>0</td><td>nil  </td></tr>
</table><div class='key'><b>Key</b><br />
<div class='state-0'>Not instrumented</div><div class='state-15'>Conditionalized out</div><div class='state-1'>Executed</div><div class='state-2'>Not executed</div><div>&#160;</div><div class='state-5'>Both branches taken</div><div class='state-6'>One branch taken</div><div class='state-10'>Neither branch taken</div></div><nobr><div><code>
</code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>1</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#59;&#160;Risolve&#160;un&#160;obbligo&#160;RESCHEDULE&#160;prima&#160;di&#160;consultare&#160;nuovamente&#160;il&#160;pool&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>2</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;OWNER&#58;&#160;dispatcher&#44;&#160;contesto&#160;e&#160;link&#160;del&#160;thread&#160;creatore&#44;&#160;senza&#160;reentrancy&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>3</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;SHARED&#58;&#160;una&#160;partizione&#160;ready&#160;home&#160;per&#160;tratto&#160;&#40;ADR&#45;0045&#160;&#167;8&#41;&#44;&#160;poi&#160;routing&#160;immutabile&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>4</code></div><code>&#160;<span class='state-1'>&#40;in&#45;package&#160;&#35;&#58;arcdocdb&#46;scheduler&#46;dispatch&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>5</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;optimize&#160;&#40;safety&#160;3&#41;&#160;&#40;speed&#160;2&#41;&#160;&#40;debug&#160;2&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>6</code></div><code>&#160;<span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>7</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;REQ&#58;&#160;REQ&#45;CON&#45;004&#160;REQ&#45;AFF&#45;008</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>8</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;notinline&#160;&#37;check&#45;recycle&#45;status&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>9</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;ftype&#160;&#40;function&#160;&#40;t&#41;&#160;&#40;member&#160;&#58;claimed&#160;&#58;published&#41;&#41;&#160;&#37;check&#45;recycle&#45;status&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>10</code></div><code>&#160;<span class='state-1'>&#40;defun&#160;&#37;check&#45;recycle&#45;status&#160;&#40;status&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>11</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#34;Pre&#58;&#160;ritorno&#160;del&#160;delegato&#44;&#160;verificato&#160;come&#160;T&#160;senza&#160;propagare&#160;assunzioni&#160;ftype&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>12</code></div><code>&#160;<span class='state-1'>Post&#58;&#160;status&#160;noto&#59;&#160;INVARIANT&#45;VIOLATION&#160;inatteso&#160;senza&#160;mutare&#160;contesto&#160;o&#160;ready&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>13</code></div><code>&#160;<span class='state-1'>NOTINLINE&#160;mantiene&#160;il&#160;controllo&#160;al&#160;confine&#160;anche&#160;con&#160;FI&#160;fuori&#160;tipo&#160;del&#160;delegato&#46;&#34;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>14</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;case&#160;status</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>15</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;&#40;&#58;claimed&#160;&#58;published&#41;&#160;status&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>16</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;otherwise&#160;&#40;error&#160;&#39;invariant&#45;violation&#160;&#58;reason&#160;&#58;pool&#45;dispatcher&#45;state&#41;&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>17</code></div><code>&#160;<span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>18</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;REQ&#58;&#160;REQ&#45;THR&#45;001&#160;REQ&#45;CON&#45;001&#160;REQ&#45;CON&#45;002&#160;REQ&#45;CON&#45;004&#160;REQ&#45;CON&#45;005&#160;REQ&#45;AFF&#45;008</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>19</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;ftype&#160;&#40;function&#160;&#40;dispatcher&#45;writer&#45;pool&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>20</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;values&#160;&#40;or&#160;null&#160;arcdocdb&#46;execution&#46;series&#58;collegamento&#45;worker&#45;serie&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>21</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;member&#160;&#58;claimed&#160;&#58;published&#41;&#160;index&#160;&#38;optional&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>22</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;ricircola&#45;collegamento&#45;pool&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>23</code></div><code>&#160;<span class='state-1'>&#40;defun&#160;ricircola&#45;collegamento&#45;pool&#160;&#40;dispatcher&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>24</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#34;Pre&#58;&#160;owner&#160;corrente&#44;&#160;RESCHEDULE&#160;con&#160;obbligo&#160;unico&#160;e&#160;bridge&#160;precedente&#160;chiuso&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>25</code></div><code>&#160;<span class='state-1'>Post&#58;&#160;una&#160;sola&#160;operazione&#160;ready&#58;&#160;NIL&#47;PUBLISHED&#47;count&#160;e&#160;IDLE&#44;&#160;oppure&#160;link&#160;IDLE&#160;del</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>26</code></div><code>&#160;<span class='state-1'>nuovo&#160;CLAIMED&#47;count&#46;&#160;Count&#160;della&#160;partizione&#44;&#160;non&#160;cursore&#59;&#160;nessun&#160;begin&#160;implicito&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>27</code></div><code>&#160;<span class='state-1'>Non&#160;legge&#160;il&#160;pool&#160;né&#160;conferma&#160;ritiro&#59;&#160;busy&#160;conserva&#160;obbligo&#160;e&#160;retry&#160;esplicito&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>28</code></div><code>&#160;<span class='state-1'>Binding&#160;prima&#160;del&#160;trasferimento&#59;&#160;errori&#160;C1&#160;conservano&#160;i&#160;propri&#160;confini&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>29</code></div><code>&#160;<span class='state-1'>Routing&#160;fallito&#160;dopo&#160;full&#160;conserva&#160;lo&#160;scambio&#44;&#160;senza&#160;rollback&#160;o&#160;nuovo&#160;fault&#160;C3&#46;&#34;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>30</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;let&#160;&#40;&#40;port&#160;&#40;dispatcher&#45;writer&#45;pool&#45;port&#160;dispatcher&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>31</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;table&#160;&#40;dispatcher&#45;writer&#45;pool&#45;table&#160;dispatcher&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>32</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;&#37;check&#45;dispatcher&#45;binding&#160;port&#160;table&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>33</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;multiple&#45;value&#45;bind&#160;&#40;writer&#160;outcome&#160;count&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>34</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;arcdocdb&#46;execution&#58;ricircola&#45;worker</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>35</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;arcdocdb&#46;scheduler&#58;&#58;porta&#45;worker&#45;pool&#45;context&#160;port&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>36</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#40;let&#160;&#40;&#40;status&#160;&#40;&#37;check&#45;recycle&#45;status&#160;outcome&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>37</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;case&#160;status</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>38</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;&#58;claimed</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>39</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;unless&#160;writer&#160;&#40;error&#160;&#39;invariant&#45;violation&#160;&#58;reason&#160;&#58;pool&#45;dispatcher&#45;state&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>40</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;values&#160;&#40;arcdocdb&#46;execution&#46;series&#58;collega&#45;writer&#45;worker&#45;serie&#160;table&#41;&#160;status&#160;count&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>41</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;&#58;published</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>42</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;when&#160;writer&#160;&#40;error&#160;&#39;invariant&#45;violation&#160;&#58;reason&#160;&#58;pool&#45;dispatcher&#45;state&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>43</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;values&#160;nil&#160;status&#160;count&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>44</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;otherwise&#160;</span><span class='state-2'>&#40;error&#160;&#39;invariant&#45;violation&#160;&#58;reason&#160;&#58;pool&#45;dispatcher&#45;state&#41;</span><span class='state-1'>&#41;&#41;&#41;&#41;&#41;&#41;</code></div></body></html>")
  (:PATH
   #A((143) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-measure/coverage-attempt-01/a7ae1cfdd010b630950a31f9969c8a1a.html")
   :BYTES 9712 :SHA256 "5760c1ddb6e7cb8eae7ab89bc43b964830a65771b3aa2af5ab179cac2383ecc1" :GIT-BLOB
   "86b6c88cbaf9bd48402332bba1b6cee4f3ea038b" :TEXT "<html><head><style type='text/css'>
*.state-0 { background-color: #eeeeee }
*.state-1 { background-color: #aaffaa }
*.state-5 { background-color: #44dd44 }
*.state-2 { background-color: #ffaaaa }
*.state-10 { background-color: #ee6666 }
*.state-15 { color: #aaaaaa; background-color: #eeeeee }
*.state-9,*.state-6 { background-color: #ffffaa }
div.key { margin: 20px; width: 200px }
div.source { width: 88ex; background-color: #eeeeee; padding-left: 5px;
             /* border-style: solid none none none; border-width: 1px;
             border-color: #dddddd */ }

*.line-number { color: #666666; float: left; width: 6ex; text-align: right; margin-right: 1ex; }

table.summary tr.head-row { background-color: #aaaaff }
table.summary tr td.text-cell { text-align: left }
table.summary tr td.main-head { text-align: center }
table.summary tr td { text-align: right }
table.summary tr.even { background-color: #eeeeff }
table.summary tr.subheading { background-color: #aaaaff}
table.summary tr.subheading td { text-align: left; font-weight: bold; padding-left: 5ex; }
</style></head><body><h3>Coverage report: /private/tmp/arcdocdb-pool-step-qualification-1792043614/src/dispatch/begin.lisp <br />
</h3>
<table class='summary'><tr class='head-row'><td width='80px'>Kind</td><td width='80px'>Covered</td><td width='80px'>All</td><td width='80px'>%</td><tr class='odd'><td>expression</td><td>21</td><td>21</td><td>100.0</td></tr>
<tr class='even'><td>branch</td><td>0</td><td>0</td><td>nil  </td></tr>
</table><div class='key'><b>Key</b><br />
<div class='state-0'>Not instrumented</div><div class='state-15'>Conditionalized out</div><div class='state-1'>Executed</div><div class='state-2'>Not executed</div><div>&#160;</div><div class='state-5'>Both branches taken</div><div class='state-6'>One branch taken</div><div class='state-10'>Neither branch taken</div></div><nobr><div><code>
</code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>1</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#59;&#160;Avvio&#160;esplicito&#160;di&#160;un&#160;obbligo&#160;gia&#160;acquisito&#44;&#160;senza&#160;consultare&#160;il&#160;pool&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>2</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;OWNER&#58;&#160;dispatcher&#44;&#160;contesto&#160;e&#160;link&#160;locali&#160;al&#160;medesimo&#160;thread&#44;&#160;non&#160;rientrante&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>3</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;SHARED&#58;&#160;routing&#160;immutabile&#160;e&#160;lease&#160;della&#160;sola&#160;Serie&#160;per&#160;tratto&#160;&#40;ADR&#45;0045&#160;&#167;8&#41;&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>4</code></div><code>&#160;<span class='state-1'>&#40;in&#45;package&#160;&#35;&#58;arcdocdb&#46;scheduler&#46;dispatch&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>5</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;optimize&#160;&#40;safety&#160;3&#41;&#160;&#40;speed&#160;2&#41;&#160;&#40;debug&#160;2&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>6</code></div><code>&#160;<span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>7</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;REQ&#58;&#160;REQ&#45;THR&#45;001&#160;REQ&#45;CON&#45;001&#160;REQ&#45;CON&#45;002&#160;REQ&#45;CON&#45;004&#160;REQ&#45;CON&#45;005&#160;REQ&#45;AFF&#45;008</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>8</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;ftype&#160;&#40;function&#160;&#40;dispatcher&#45;writer&#45;pool&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>9</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;values&#160;arcdocdb&#46;execution&#46;series&#58;collegamento&#45;worker&#45;serie&#160;index</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>10</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;member&#160;&#58;active&#160;&#58;closing&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>11</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;member&#160;nil&#160;&#58;serie&#45;busy&#160;&#58;serie&#45;lease&#45;generation&#41;&#160;&#38;optional&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>12</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;inizia&#45;obbligo&#45;pool&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>13</code></div><code>&#160;<span class='state-1'>&#40;defun&#160;inizia&#45;obbligo&#45;pool&#160;&#40;dispatcher&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>14</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#34;Pre&#58;&#160;owner&#160;corrente&#44;&#160;worker&#160;CLAIMED&#160;e&#160;link&#160;associato&#160;IDLE&#44;&#160;nessuna&#160;rientranza&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>15</code></div><code>&#160;<span class='state-1'>Post&#58;&#160;link&#160;corrente&#160;e&#160;token&#47;fase&#47;ragione&#160;originali&#160;di&#160;un&#160;solo&#160;begin&#160;del&#160;bridge&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>16</code></div><code>&#160;<span class='state-1'>Binding&#160;prima&#160;del&#160;routing&#59;&#160;writer&#160;busy&#160;conserva&#160;CLAIMED&#47;link&#160;IDLE&#160;senza&#160;token&#59;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>17</code></div><code>&#160;<span class='state-1'>Serie&#160;busy&#47;esaurita&#160;restituisce&#160;CLOSING&#47;token&#160;da&#160;chiudere&#160;esplicitamente&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>18</code></div><code>&#160;<span class='state-1'>Nessun&#160;gate&#44;&#160;ACK&#44;&#160;claim&#44;&#160;ricircolo&#44;&#160;pop&#44;&#160;retry&#160;o&#160;cleanup&#59;&#160;errori&#160;C1&#160;propagati</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>19</code></div><code>&#160;<span class='state-1'>con&#160;capacita&#160;e&#160;causa&#160;conservate&#160;dai&#160;confini&#160;originali&#44;&#160;senza&#160;fault&#160;marking&#160;C3&#46;&#34;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>20</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;let&#160;&#40;&#40;port&#160;&#40;dispatcher&#45;writer&#45;pool&#45;port&#160;dispatcher&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>21</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;table&#160;&#40;dispatcher&#45;writer&#45;pool&#45;table&#160;dispatcher&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>22</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;&#37;check&#45;dispatcher&#45;binding&#160;port&#160;table&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>23</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;let&#160;&#40;&#40;link&#160;&#40;arcdocdb&#46;execution&#46;series&#58;collega&#45;writer&#45;worker&#45;serie&#160;table&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>24</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#40;multiple&#45;value&#45;bind&#160;&#40;token&#160;state&#160;reason&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>25</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;arcdocdb&#46;execution&#46;series&#58;inizia&#45;worker&#45;serie&#160;link&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>26</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;values&#160;link&#160;token&#160;state&#160;reason&#41;&#41;&#41;&#41;&#41;</code></div></body></html>")
  (:PATH
   #A((122) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-measure/coverage-attempt-01/cover-index.html")
   :BYTES 2804 :SHA256 "8a3beb42aec24a88721d57867573cc63b4d2b578356ba3e544b6a00b6f52a3c4" :GIT-BLOB
   "9ede43e31af9a35dc6365278291f083d27e1a08f" :TEXT "<style type='text/css'>
*.state-0 { background-color: #eeeeee }
*.state-1 { background-color: #aaffaa }
*.state-5 { background-color: #44dd44 }
*.state-2 { background-color: #ffaaaa }
*.state-10 { background-color: #ee6666 }
*.state-15 { color: #aaaaaa; background-color: #eeeeee }
*.state-9,*.state-6 { background-color: #ffffaa }
div.key { margin: 20px; width: 200px }
div.source { width: 88ex; background-color: #eeeeee; padding-left: 5px;
             /* border-style: solid none none none; border-width: 1px;
             border-color: #dddddd */ }

*.line-number { color: #666666; float: left; width: 6ex; text-align: right; margin-right: 1ex; }

table.summary tr.head-row { background-color: #aaaaff }
table.summary tr td.text-cell { text-align: left }
table.summary tr td.main-head { text-align: center }
table.summary tr td { text-align: right }
table.summary tr.even { background-color: #eeeeff }
table.summary tr.subheading { background-color: #aaaaff}
table.summary tr.subheading td { text-align: left; font-weight: bold; padding-left: 5ex; }
</style><table class='summary'><tr class='head-row'><td></td><td class='main-head' colspan='3'>Expression</td><td class='main-head' colspan='3'>Branch</td></tr><tr class='head-row'><td width='80px'>Source file</td><td width='80px'>Covered</td><td width='80px'>Total</td><td width='80px'>%</td><td width='80px'>Covered</td><td width='80px'>Total</td><td width='80px'>%</td></tr><tr class='subheading'><td colspan='7'>/private/tmp/arcdocdb-pool-step-qualification-1792043614/src/dispatch/</td></tr>
<tr class='odd'><td class='text-cell'><a href='a7ae1cfdd010b630950a31f9969c8a1a.html'>begin.lisp</a></td><td>21</td><td>21</td><td>100.0</td><td>0</td><td>0</td><td>-</td></tr><tr class='even'><td class='text-cell'><a href='4c7b6e6666b7bf467861c71cd6aa7a8e.html'>build.lisp</a></td><td>24</td><td>24</td><td>100.0</td><td>2</td><td>2</td><td>100.0</td></tr><tr class='odd'><td class='text-cell'><a href='695fa4de2754fae3d3e6a366609d60ca.html'>claim.lisp</a></td><td>45</td><td>49</td><td> 91.8</td><td>0</td><td>0</td><td>-</td></tr><tr class='even'><td class='text-cell'><a href='633ac734f1e31deee00a2c35c6531753.html'>package.lisp</a></td><td>1</td><td>1</td><td>100.0</td><td>0</td><td>0</td><td>-</td></tr><tr class='odd'><td class='text-cell'><a href='843c9cdafa70c00ccb97a37510baeee4.html'>recycle.lisp</a></td><td>45</td><td>49</td><td> 91.8</td><td>0</td><td>0</td><td>-</td></tr><tr class='even'><td class='text-cell'><a href='40f80e7d9e76d7b1de26c7c5b5503c7c.html'>step.lisp</a></td><td>51</td><td>51</td><td>100.0</td><td>0</td><td>0</td><td>-</td></tr><tr class='odd'><td class='text-cell'><a href='1d1e416d1328d9c678a8622dfa5a7e8c.html'>types.lisp</a></td><td>40</td><td>40</td><td>100.0</td><td>8</td><td>8</td><td>100.0</td></tr></table>")
  (:PATH
   #A((125) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-measure/coverage-attempt-01/coverage-audit.lisp")
   :BYTES 2441 :SHA256 "f629713a4b566ae3907fbc0ee4111e5655e9bf8512a5f90ff31a85cf88809b74" :GIT-BLOB
   "09da08ce9ef1a2b203a10a480331f937983049d5" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :POOL-LIFECYCLE-COVERAGE-AUDIT :STATUS :OK :SCOPE
 :ENTIRE-NEW-LIFECYCLE-PLUS-PACKAGE :NATIVE-PATH
 #A((125) BASE-CHAR
    . \"/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-measure/coverage-attempt-01/coverage-state.lisp\")
 :HTML-PATH
 #A((122) BASE-CHAR
    . \"/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-measure/coverage-attempt-01/cover-index.html\")
 :FILES
 ((:FILE #A((23) BASE-CHAR . \"src/dispatch/begin.lisp\") :EXPRESSIONS-HIT 21
   :EXPRESSIONS-TOTAL 21 :BRANCHES-HIT 0 :BRANCHES-TOTAL 0 :MISSING NIL)
  (:FILE #A((23) BASE-CHAR . \"src/dispatch/build.lisp\") :EXPRESSIONS-HIT 24
   :EXPRESSIONS-TOTAL 24 :BRANCHES-HIT 2 :BRANCHES-TOTAL 2 :MISSING NIL)
  (:FILE #A((23) BASE-CHAR . \"src/dispatch/claim.lisp\") :EXPRESSIONS-HIT 45
   :EXPRESSIONS-TOTAL 49 :BRANCHES-HIT 0 :BRANCHES-TOTAL 0 :MISSING
   ((:NATIVE-INDEX 31 :KIND :EXPRESSION :PATH (1 4 3 3 4 3))
    (:NATIVE-INDEX 32 :KIND :EXPRESSION :PATH (1 1 4 3 3 4 3))
    (:NATIVE-INDEX 33 :KIND :EXPRESSION :PATH (2 1 4 3 3 4 3))
    (:NATIVE-INDEX 34 :KIND :EXPRESSION :PATH (3 1 4 3 3 4 3))))
  (:FILE #A((25) BASE-CHAR . \"src/dispatch/package.lisp\") :EXPRESSIONS-HIT 1
   :EXPRESSIONS-TOTAL 1 :BRANCHES-HIT 0 :BRANCHES-TOTAL 0 :MISSING NIL)
  (:FILE #A((25) BASE-CHAR . \"src/dispatch/recycle.lisp\") :EXPRESSIONS-HIT 45
   :EXPRESSIONS-TOTAL 49 :BRANCHES-HIT 0 :BRANCHES-TOTAL 0 :MISSING
   ((:NATIVE-INDEX 39 :KIND :EXPRESSION :PATH (1 4 2 3 3 4 6))
    (:NATIVE-INDEX 40 :KIND :EXPRESSION :PATH (1 1 4 2 3 3 4 6))
    (:NATIVE-INDEX 41 :KIND :EXPRESSION :PATH (2 1 4 2 3 3 4 6))
    (:NATIVE-INDEX 42 :KIND :EXPRESSION :PATH (3 1 4 2 3 3 4 6))))
  (:FILE #A((22) BASE-CHAR . \"src/dispatch/step.lisp\") :EXPRESSIONS-HIT 51
   :EXPRESSIONS-TOTAL 51 :BRANCHES-HIT 0 :BRANCHES-TOTAL 0 :MISSING NIL)
  (:FILE #A((23) BASE-CHAR . \"src/dispatch/types.lisp\") :EXPRESSIONS-HIT 40
   :EXPRESSIONS-TOTAL 40 :BRANCHES-HIT 8 :BRANCHES-TOTAL 8 :MISSING NIL))
 :LIFECYCLE-TOTAL (227 235 10 10) :MINIMUM-PERCENT 95 :HTML-COUNTS
 ((\"src/dispatch/begin.lisp\" 21 21 0 0) (\"src/dispatch/build.lisp\" 24 24 2 2)
  (\"src/dispatch/claim.lisp\" 45 49 0 0) (\"src/dispatch/package.lisp\" 1 1 0 0)
  (\"src/dispatch/recycle.lisp\" 45 49 0 0) (\"src/dispatch/step.lisp\" 51 51 0 0)
  (\"src/dispatch/types.lisp\" 40 40 8 8))
 :HTML-COUNTS-ORIGIN :PARSED-SB-COVER-INDEX :SELF-TEST :PASSED :EXCLUSIONS NIL
 :MCDC-INFERRED NIL)
")
  (:PATH
   #A((134) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-measure/coverage-attempt-01/coverage-dispatch-audit.lisp")
   :BYTES 2749 :SHA256 "91596192228bbc2660bb42c49bb53cf7f736df16374fa186f7c2273c60788f24" :GIT-BLOB
   "ccec9fd731356806d280da7ed1858e76f21b5766" :TEXT
   "(:SCOPE-ADAPTER-SELF-TEST :PASSED :NAMESPACE-ADAPTER
 :DISPATCH-HEADING-WITH-UNCHANGED-TD-AND-NATIVE-PARSER :LIBRARY-REPORT
 #A((125) BASE-CHAR
    . \"/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-measure/coverage-attempt-01/coverage-audit.lisp\")
 :DISPATCH-TOTAL (227 235 10 10) :SCHEMA-VERSION 1 :KIND
 :POOL-STEP-COVERAGE-AUDIT :STATUS :OK :SCOPE
 :ENTIRE-SEVEN-FILE-DISPATCH-PACKAGE :NATIVE-PATH
 #A((125) BASE-CHAR
    . \"/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-measure/coverage-attempt-01/coverage-state.lisp\")
 :HTML-PATH
 #A((122) BASE-CHAR
    . \"/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-measure/coverage-attempt-01/cover-index.html\")
 :FILES
 ((:FILE #A((23) BASE-CHAR . \"src/dispatch/begin.lisp\") :EXPRESSIONS-HIT 21
   :EXPRESSIONS-TOTAL 21 :BRANCHES-HIT 0 :BRANCHES-TOTAL 0 :MISSING NIL)
  (:FILE #A((23) BASE-CHAR . \"src/dispatch/build.lisp\") :EXPRESSIONS-HIT 24
   :EXPRESSIONS-TOTAL 24 :BRANCHES-HIT 2 :BRANCHES-TOTAL 2 :MISSING NIL)
  (:FILE #A((23) BASE-CHAR . \"src/dispatch/claim.lisp\") :EXPRESSIONS-HIT 45
   :EXPRESSIONS-TOTAL 49 :BRANCHES-HIT 0 :BRANCHES-TOTAL 0 :MISSING
   ((:NATIVE-INDEX 31 :KIND :EXPRESSION :PATH (1 4 3 3 4 3))
    (:NATIVE-INDEX 32 :KIND :EXPRESSION :PATH (1 1 4 3 3 4 3))
    (:NATIVE-INDEX 33 :KIND :EXPRESSION :PATH (2 1 4 3 3 4 3))
    (:NATIVE-INDEX 34 :KIND :EXPRESSION :PATH (3 1 4 3 3 4 3))))
  (:FILE #A((25) BASE-CHAR . \"src/dispatch/package.lisp\") :EXPRESSIONS-HIT 1
   :EXPRESSIONS-TOTAL 1 :BRANCHES-HIT 0 :BRANCHES-TOTAL 0 :MISSING NIL)
  (:FILE #A((25) BASE-CHAR . \"src/dispatch/recycle.lisp\") :EXPRESSIONS-HIT 45
   :EXPRESSIONS-TOTAL 49 :BRANCHES-HIT 0 :BRANCHES-TOTAL 0 :MISSING
   ((:NATIVE-INDEX 39 :KIND :EXPRESSION :PATH (1 4 2 3 3 4 6))
    (:NATIVE-INDEX 40 :KIND :EXPRESSION :PATH (1 1 4 2 3 3 4 6))
    (:NATIVE-INDEX 41 :KIND :EXPRESSION :PATH (2 1 4 2 3 3 4 6))
    (:NATIVE-INDEX 42 :KIND :EXPRESSION :PATH (3 1 4 2 3 3 4 6))))
  (:FILE #A((22) BASE-CHAR . \"src/dispatch/step.lisp\") :EXPRESSIONS-HIT 51
   :EXPRESSIONS-TOTAL 51 :BRANCHES-HIT 0 :BRANCHES-TOTAL 0 :MISSING NIL)
  (:FILE #A((23) BASE-CHAR . \"src/dispatch/types.lisp\") :EXPRESSIONS-HIT 40
   :EXPRESSIONS-TOTAL 40 :BRANCHES-HIT 8 :BRANCHES-TOTAL 8 :MISSING NIL))
 :LIFECYCLE-TOTAL (227 235 10 10) :MINIMUM-PERCENT 95 :HTML-COUNTS
 ((\"src/dispatch/begin.lisp\" 21 21 0 0) (\"src/dispatch/build.lisp\" 24 24 2 2)
  (\"src/dispatch/claim.lisp\" 45 49 0 0) (\"src/dispatch/package.lisp\" 1 1 0 0)
  (\"src/dispatch/recycle.lisp\" 45 49 0 0) (\"src/dispatch/step.lisp\" 51 51 0 0)
  (\"src/dispatch/types.lisp\" 40 40 8 8))
 :HTML-COUNTS-ORIGIN :PARSED-SB-COVER-INDEX :SELF-TEST :PASSED :EXCLUSIONS NIL
 :MCDC-INFERRED NIL)
")
  (:PATH
   #A((103) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-measure/coverage-run.lisp")
   :BYTES 2800 :SHA256 "688398123588abdc7b247cc266dc01e7022c0d074e55658c1cd89e1f6f02958b" :GIT-BLOB
   "46741c268c38d43ac088afb0efdcb58214946729" :TEXT "(require :asdf)
(require :sb-cover)
(require :sb-posix)
(pushnew :dispatch-coverage-reader-library *features*)
;; Keep startup code-component marks across ASDF GC without modifying any observed bit.
(defmethod asdf:perform :after ((operation asdf:load-op) (component asdf:cl-source-file))
  (declare (ignore operation))
  (when (search \"/src/dispatch/\" (namestring (asdf:component-pathname component)))
    (sb-cover:save-coverage)))
(let* ((args (uiop:command-line-arguments)) (root (truename \"./\"))
       (directory (when (= 2 (length args))
                    (uiop:ensure-directory-pathname (merge-pathnames (second args) root)))))
  (unless (and directory (string= \"--report\" (first args)))
    (error \"COD-61 pool dispatch coverage: use --report fresh-directory/.\"))
  (ensure-directories-exist
   (merge-pathnames \"parent-placeholder\" (uiop:pathname-parent-directory-pathname directory)))
  (sb-posix:mkdir (namestring directory) #o700)
  (handler-bind ((warning (lambda (condition) (error condition)))
                 (style-warning (lambda (condition) (error condition))))
    (multiple-value-bind (fasl warnings failure)
        (compile-file \"spikes/out/pool-step-measure/dispatch-coverage-reader.lisp\"
                      :output-file (merge-pathnames \"reader.fasl\" directory))
      (unless (and fasl (not warnings) (not failure)) (error \"COD-01: dispatch reader compile failure.\"))
      (load fasl)))
  (uiop:symbol-call \"ARCDOCDB.DISPATCH.COVERAGE.READER\" \"ADAPTER-SELF-TEST\")
  (asdf:initialize-output-translations
   `(:output-translations
     (,(merge-pathnames \"**/*.*\" root) ,(merge-pathnames \"fasl/**/*.*\" directory))
     :ignore-inherited-configuration))
  (proclaim '(optimize (sb-cover:store-coverage-data 3)))
  (setf asdf:*compile-file-failure-behaviour* :error asdf:*compile-file-warnings-behaviour* :error)
  (handler-bind ((warning (lambda (condition)
                           (unless (typep condition 'sb-kernel:redefinition-warning) (error condition)))))
    (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" root))
    (asdf:load-system \"arcdocdb/tests\" :force t))
  (uiop:symbol-call \"ARCDOCDB.SCHEDULER.TESTS\" \"RUN\")
  (sb-cover:save-coverage-in-file (merge-pathnames \"coverage-state.lisp\" directory))
  (let ((html (sb-cover:report directory
                              :if-matches (lambda (path)
                                            (search \"/src/dispatch/\" path)))))
    (unless html (error \"COD-60: dispatch source data missing.\"))
    (uiop:symbol-call \"ARCDOCDB.DISPATCH.COVERAGE.READER\" \"AUDIT-DISPATCH-COVERAGE\"
                     (merge-pathnames \"coverage-state.lisp\" directory) html
                     (merge-pathnames \"coverage-audit.lisp\" directory)
                     (merge-pathnames \"coverage-dispatch-audit.lisp\" directory))))
")
  (:PATH
   #A((115) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-measure/dispatch-coverage-reader.lisp")
   :BYTES 9117 :SHA256 "036c0698897871690552afdad5798fd44238151310523771a8ef15454e85ee10" :GIT-BLOB
   "e07bb28e0c4c4ace9c36e61b609e0586bf5c037a" :TEXT
   ";;;; C4 adapter: library native/TD/count parser unchanged; whole seven-file dispatch scope.
;;;; The legacy audit remains original; metadata-only dispatch audit retains identical counts/missing.
;;;; --self-test; runner calls AUDIT-DISPATCH-COVERAGE after the independent adapter selftest.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require :asdf)
  (unless (find-package \"ARCDOCDB.LIFECYCLE.COVERAGE.READER\")
    (let ((*features* (cons :lifecycle-coverage-reader-library *features*)))
      (load \"spikes/out/lifecycle-measure/lifecycle-coverage-reader.lisp\"))))
(defpackage #:arcdocdb.dispatch.coverage.reader (:use #:cl))
(in-package #:arcdocdb.dispatch.coverage.reader)
(declaim (optimize (safety 3) (debug 3)))
(defparameter +scope+ '(\"src/dispatch/package.lisp\" \"src/dispatch/types.lisp\"
                        \"src/dispatch/build.lisp\" \"src/dispatch/claim.lisp\" \"src/dispatch/recycle.lisp\" \"src/dispatch/begin.lisp\" \"src/dispatch/step.lisp\"))

(defun dispatch-source-identity (path)
  \"All dispatch-directory files enter the inventory; unexpected modules cannot silently disappear.\"
  (arcdocdb.lifecycle.coverage.reader::reader-require (stringp path) \"dispatch source not a string\")
  (let ((start (if (uiop:string-prefix-p \"src/\" path) 0
                   (let ((position (search \"/src/\" path :from-end t)))
                     (when position (1+ position))))))
    (when start
      (let ((identity (subseq path start)))
        (when (uiop:string-prefix-p \"src/dispatch/\" identity)
          identity)))))

(defun call-dispatch-reader (function)
  \"One-thread C4 adapter restores the library selector even on rejection; no native bit edits.\"
  (let ((original (symbol-function 'arcdocdb.lifecycle.coverage.reader::source-identity))
        (original-html (symbol-function 'arcdocdb.lifecycle.coverage.reader::html-count-rows))
        (arcdocdb.lifecycle.coverage.reader::+scope-files+ +scope+))
    (unwind-protect
         (progn (setf (symbol-function 'arcdocdb.lifecycle.coverage.reader::source-identity)
                      #'dispatch-source-identity
                      (symbol-function 'arcdocdb.lifecycle.coverage.reader::html-count-rows)
                      #'dispatch-html-count-rows)
                (funcall function))
      (setf (symbol-function 'arcdocdb.lifecycle.coverage.reader::source-identity) original
            (symbol-function 'arcdocdb.lifecycle.coverage.reader::html-count-rows) original-html))))


(defun dispatch-html-count-rows (html)
  \"Namespace-only adapter: unchanged native/TD/count parser, original dispatch heading/identities.\"
  (let ((cursor 0) (directory nil) (rows nil) (seen (make-hash-table :test 'equal)))
    (loop for start = (search \"<tr\" html :start2 cursor) while start
          do (let ((close (search \"</tr>\" html :start2 start)))
               (arcdocdb.lifecycle.coverage.reader::reader-require close \"HTML TR delimiter missing\")
               (let ((row (subseq html start (+ close 5))))
                 (cond
                   ((search \"class='subheading'\" row)
                    (let* ((cells (arcdocdb.lifecycle.coverage.reader::html-cells row))
                           (identity (and (= 1 (length cells)) (dispatch-source-identity (first cells)))))
                      (setf directory (when (equal identity \"src/dispatch/\") identity))))
                   ((and directory (or (search \"class='odd'\" row) (search \"class='even'\" row)))
                    (let* ((counts (arcdocdb.lifecycle.coverage.reader::html-data-counts row directory))
                           (identity (first counts)))
                      (arcdocdb.lifecycle.coverage.reader::reader-require
                       (not (gethash identity seen)) \"duplicate HTML source identity\")
                      (setf (gethash identity seen) t)
                      (push counts rows)))
                   (t nil)))
               (setf cursor (+ close 5))))
    (sort rows #'string< :key #'first)))

(defun adapter-self-test ()
  \"Original library malformed input/gate tests plus independent dispatch inventory/path fixtures.\"
  (arcdocdb.lifecycle.coverage.reader::coverage-reader-self-test)
  (call-dispatch-reader
   (lambda ()
     (let* ((native (list (list* \"/a/src/dispatch/package.lisp\" #((0)) #*1)
                          (list* \"/a/src/dispatch/begin.lisp\" #((0)) #*1)
                          (list* \"/a/src/dispatch/step.lisp\" #((0)) #*1)
                          (list* \"/a/src/dispatch/types.lisp\" #((0) (1) (:then 2) (:else 2)) #*1010)
                          (list* \"/a/src/dispatch/build.lisp\" #((0)) #*1)
                          (list* \"/a/src/dispatch/claim.lisp\" #((0)) #*1)
                          (list* \"/a/src/dispatch/recycle.lisp\" #((0)) #*1)
                          (list* \"/a/src/scheduler/pool-claim.lisp\" #((0)) #*1)))
            (rows (arcdocdb.lifecycle.coverage.reader::scope-native-rows native))
            (counts (mapcar #'arcdocdb.lifecycle.coverage.reader::row-counts rows))
            (heading \"<tr class='subheading'><td colspan='7'>/a/src/dispatch/</td></tr>\")
            (html (concatenate 'string heading
                   \"<tr class='odd'><td><a href='begin'>begin.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='odd'><td><a href='b'>build.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='even'><td><a href='c'>claim.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='odd'><td><a href='p'>package.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='odd'><td><a href='r'>recycle.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='even'><td><a href='s'>step.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='even'><td><a href='t'>types.lisp</a></td><td>1</td><td>2</td><td>50</td><td>1</td><td>2</td><td>50</td></tr>\")))
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal counts '((\"src/dispatch/begin.lisp\" 1 1 0 0) (\"src/dispatch/build.lisp\" 1 1 0 0) (\"src/dispatch/claim.lisp\" 1 1 0 0)
                        (\"src/dispatch/package.lisp\" 1 1 0 0) (\"src/dispatch/recycle.lisp\" 1 1 0 0)
                        (\"src/dispatch/step.lisp\" 1 1 0 0) (\"src/dispatch/types.lisp\" 1 2 1 2)))
        \"dispatch independent native count oracle\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal '(7 8 1 2) (arcdocdb.lifecycle.coverage.reader::count-total counts)) \"dispatch denominator oracle\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal counts (arcdocdb.lifecycle.coverage.reader::html-count-rows html)) \"dispatch exact HTML concordance\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal (getf (seventh rows) :missing)
               '((:native-index 1 :kind :expression :path (1))
                 (:native-index 3 :kind :branch :path (:else 2)))) \"dispatch missing paths oracle\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal (dispatch-source-identity \"/a/src/dispatch/unexpected.lisp\") \"src/dispatch/unexpected.lisp\")
        \"unexpected module silently excluded\")
       (arcdocdb.lifecycle.coverage.reader::expect-rejection
        (lambda () (arcdocdb.lifecycle.coverage.reader::scope-native-rows
                    (list (list* \"/a/src/dispatch/types.lisp\" #((0)) #*0)
                          (list* \"/b/src/dispatch/types.lisp\" #((0)) #*1)))))
       (arcdocdb.lifecycle.coverage.reader::expect-rejection
        (lambda () (arcdocdb.lifecycle.coverage.reader::html-count-rows (concatenate 'string html html)))))))
  :passed)

(defun audit-dispatch-coverage (native html library-output dispatch-output)
  \"All seven dispatch files, gate95 without exclusions; preserve native/HTML and both audits.\"
  (adapter-self-test)
  (let ((report (call-dispatch-reader
                 (lambda () (arcdocdb.lifecycle.coverage.reader::audit-coverage native html library-output)))))
    (setf (getf report :kind) :pool-step-coverage-audit
          (getf report :scope) :entire-seven-file-dispatch-package
          (getf report :dispatch-total) (getf report :lifecycle-total)
          (getf report :library-report) (namestring library-output)
          (getf report :namespace-adapter) :dispatch-heading-with-unchanged-td-and-native-parser
          (getf report :scope-adapter-self-test) :passed)
    (with-open-file (stream dispatch-output :direction :output :if-exists :error :external-format :utf-8)
      (let ((*print-readably* t)) (write report :stream stream :pretty t) (terpri stream)))
    report))

(unless (member :dispatch-coverage-reader-library *features*)
  (unless (equal (uiop:command-line-arguments) '(\"--self-test\"))
    (error \"COD-61: dispatch coverage adapter use --self-test.\"))
  (adapter-self-test)
  (format t \"~&Dispatch coverage reader self-test PASS~%\"))
")
  (:PATH
   #A((101) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-measure/reader-run.lisp")
   :BYTES 725 :SHA256 "f2b73c3685800bb7138b35c5fa82d58e5d43ac05e0c1fdb33242d8fd52b5162b" :GIT-BLOB
   "ea7ee28a8e9796da770bb584b774ec976a540259" :TEXT "(require :asdf)
(pushnew :dispatch-coverage-reader-library *features*)
(declaim (optimize (safety 3) (debug 3)))
(handler-bind ((warning (lambda (condition) (error condition)))
               (style-warning (lambda (condition) (error condition))))
  (multiple-value-bind (fasl warnings failure)
      (compile-file \"spikes/out/pool-step-measure/dispatch-coverage-reader.lisp\"
                    :output-file \"spikes/out/pool-step-measure/dispatch-coverage-reader.fasl\")
    (unless (and fasl (not warnings) (not failure)) (error \"COD-01: dispatch reader compile failure.\"))
    (load fasl)))
(uiop:symbol-call \"ARCDOCDB.DISPATCH.COVERAGE.READER\" \"ADAPTER-SELF-TEST\")
(format t \"~&Dispatch coverage reader self-test PASS~%\")
")
  (:PATH
   #A((99) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-measure/tool-run.lisp")
   :BYTES 618 :SHA256 "49f9d999cfa61531e8d4c32b3fa1c9d9a991bbbbb0945f175a260292ed2796d5" :GIT-BLOB
   "2a1b86ca94a8b4b145f6868bcef0f8e622ae727b" :TEXT "(require :asdf)
(pushnew :arcdocdb-pool-step-measure-library *features*)
(declaim (optimize (safety 3) (debug 3)))
(handler-bind ((warning (lambda (condition) (error condition)))
               (style-warning (lambda (condition) (error condition))))
  (multiple-value-bind (fasl warnings failure)
      (compile-file \"tools/measure-pool-step.lisp\"
                    :output-file \"spikes/out/pool-step-measure/measure-pool-step.fasl\")
    (unless (and fasl (not warnings) (not failure))
      (error \"COD-01: tool pool-step compile failure.\"))
    (load fasl)))
(uiop:symbol-call \"ARCDOCDB.POOL-STEP.MEASURE\" \"MAIN\")
")
  (:PATH
   #A((113) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-publication-selftest-attempt-01.log")
   :BYTES 224 :SHA256 "0f19c94cefafb6839841ae6e6b80c1fe0eec62bd85bee007896ea0b2e6d33c47" :GIT-BLOB
   "e378a22149aee8f19c4b76f423319fb8aedf52fd" :TEXT
   ":OK: sbcl --noinform --no-userinit --no-sysinit --script spikes/out/pool-step-dev/publication-selftest.lisp; record: /private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/4001073020-command-38578-0/report.lisp
")
  (:PATH
   #A((99) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-reader-attempt-01.log")
   :BYTES 218 :SHA256 "2775e82211d7cf51b31c4d655e6e45d4dfc58391cfe409d6ce6d629499ac7459" :GIT-BLOB
   "781a4fba898ab379e1362888e1381258109c1d10" :TEXT
   ":OK: sbcl --noinform --no-userinit --no-sysinit --script spikes/out/pool-step-measure/reader-run.lisp; record: /private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/4001073020-command-38579-0/report.lisp
")
  (:PATH
   #A((101) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-selftest-attempt-01.log")
   :BYTES 228 :SHA256 "3f3b5379dcd8d7604a35fe2494ab674f0a0e9de27927b44d24b413dc4a595b7a" :GIT-BLOB
   "f6005b20836ef636d75b4215d1d2040a94ac2000" :TEXT
   ":OK: sbcl --noinform --no-userinit --no-sysinit --script spikes/out/pool-step-measure/tool-run.lisp --self-test; record: /private/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/4001073020-command-38582-0/report.lisp
")))
