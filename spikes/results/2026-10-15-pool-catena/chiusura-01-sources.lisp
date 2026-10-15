(:SCHEMA-VERSION 1 :KIND :POOL-WORKER-LIFECYCLE-CLOSURE-SOURCES :VERSION
 "a34cede6fbc9215908d50aa85311d5d703660040" :PART 1 :PARTS 1 :SOURCES
 ((:PATH #A((39) BASE-CHAR . "spikes/out/lifecycle-close-records.lisp") :BYTES 6209 :SHA256
   "d2955e271c7789a60d1c2ba25e0b39c42254770732655f59758ffede391af3b5" :GIT-BLOB
   "75de45b6baa47497aebc62012585a974574f2350" :TEXT
   ";;;; Chiusura esplicita, dopo la prima pubblicazione; nessuna esecuzione al LOAD library.
;;;; Il manifesto nuovo conserva gli stati originali e tutte le impronte delle copie.
(require :asdf)
(let ((*features* (cons :pool-worker-lifecycle-publication-library *features*)))
  (load \"spikes/out/lifecycle-publication.lisp\"))
(in-package #:cl-user)

(defun lifecycle-close-status-fields (data)
  \"Proiezione dei campi presenti: nessuna inferenza o promozione di uno stato assente.\"
  (loop for key in '(:schema-version :kind :status :source-consistency :exit-code :test-count)
        when (loop for field on data by #'cddr thereis (eq (first field) key))
          append (list key (getf data key))))

(defun lifecycle-close-record-plan (record root destination)
  (let* ((plan (pool-publication-record-plan record root destination))
         (source (getf plan :source))
         (target (getf plan :target)))
    (when (probe-file target) (error \"Chiusura non sovrascrive record presenti: ~A\" target))
    (dolist (leaf '(\"report.lisp\" \"conservazione.lisp\"))
      (multiple-value-bind (proof data)
          (worker-evidence-byte-proof (merge-pathnames leaf source))
        (setf (getf plan (if (string= leaf \"report.lisp\") :report-proof :conservation-proof))
              proof)
        (setf (getf plan (if (string= leaf \"report.lisp\") :report-status :conservation-status))
              (lifecycle-close-status-fields data))))
    plan))

(defun lifecycle-close-copy-record (plan)
  (dolist (entry '((\"report.lisp\" :report-proof) (\"conservazione.lisp\" :conservation-proof)))
    (unless (worker-evidence-proofs-equal-p
             (getf plan (second entry))
             (worker-evidence-byte-proof (merge-pathnames (first entry) (getf plan :source))))
      (error \"Record cambiato dopo il piano di chiusura: ~A\" (getf plan :source))))
  (let ((copied (pool-publication-copy-record plan)))
    (dolist (entry '((\"report.lisp\" :report-proof) (\"conservazione.lisp\" :conservation-proof)))
      (unless (and (worker-evidence-proofs-equal-p
                    (getf plan (second entry))
                    (worker-evidence-byte-proof
                     (merge-pathnames (first entry) (getf plan :target))))
                   (worker-evidence-proofs-equal-p
                    (getf plan (second entry))
                    (worker-evidence-byte-proof
                     (merge-pathnames (first entry) (getf plan :source)))))
        (error \"Bytes di chiusura diversi dagli originali pianificati: ~A\" (getf plan :target))))
    (append copied
            (list :original-report-status-fields (getf plan :report-status)
                  :original-conservation-status-fields (getf plan :conservation-status)
                  :copied-files (lifecycle-publication-files (getf plan :target))))))

(defun lifecycle-close-records (input-path stem records
                               &key (record-root (uiop:getcwd)) extra-sources)
  \"Aggiunge prove originali in directory nuove e produce un manifesto di chiusura esclusivo.\"
  (let* ((config (worker-read-raw-data input-path))
         (base (getf config :base))
         (destination (lifecycle-directory *lifecycle-publication-directory*))
         (root (lifecycle-directory record-root)))
    (unless (and (stringp base) (= 40 (length base))
                 (every (lambda (character) (digit-char-p character 16)) base)
                 (worker-leaf-p stem) records)
      (error \"Chiusura richiede base SHA40 dell'input, stem leaf e almeno un record.\"))
    (unless (= (length records)
               (length (remove-duplicates records :test #'string=
                                          :key (lambda (entry) (getf entry :name)))))
      (error \"Nomi dei record di chiusura duplicati.\"))
    (dolist (leaf (list (format nil \"~A.lisp\" stem) (format nil \"~A-file.lisp\" stem)))
      (when (probe-file (merge-pathnames leaf destination))
        (error \"Manifesto di chiusura già esistente: ~A\" leaf)))
    (let* ((plans (mapcar (lambda (record)
                           (lifecycle-close-record-plan record root destination)) records))
           (sources
             (worker-plan-source-bundles
              (remove-duplicates
               (append (list #p\"spikes/out/lifecycle-close-records.lisp\" input-path)
                       extra-sources) :test #'equal)
              (format nil \"~A-sources\" stem) :pool-worker-lifecycle-closure-sources :version base)))
      ;; Preflight delle collisioni anche per ogni bundle, prima della prima nuova copia.
      (dolist (plan sources)
        (when (probe-file (merge-pathnames (getf plan :leaf) destination))
          (error \"Bundle di chiusura già presente: ~A\" (getf plan :leaf))))
      (worker-validate-source-plans sources)
      (let ((copied (mapcar #'lifecycle-close-copy-record plans)))
        (pool-publication-write-plans sources destination)
        (worker-save-data
         (list :schema-version 1 :kind :pool-worker-lifecycle-closure-manifest
               :base base :input-source (worker-byte-record input-path)
               :processes copied :source-bundles (mapcar (lambda (plan) (getf plan :leaf)) sources)
               :limits '(:original-report-and-conservation-bytes :original-status-fields-only
                         :no-status-promotion :exclusive-new-process-directories
                         :sha256-bytes-git-blobs :original-gzip-payload-names))
         (merge-pathnames (format nil \"~A.lisp\" stem) destination))
        (lifecycle-publication-refresh-manifest
         base :stem (format nil \"~A-file\" stem) :directory destination)
        (format t \"Lifecycle closure: ~D original records copied and verified; manifest ~A.lisp.~%\"
                (length copied) stem)
        t))))

(unless (member :pool-worker-lifecycle-closure-library *features*)
  (let ((args (uiop:command-line-arguments)))
    (unless (and (>= (length args) 4) (evenp (- (length args) 2)))
      (error \"Uso: sbcl --script spikes/out/lifecycle-close-records.lisp input-plist stem name id [name id ...]\"))
    (lifecycle-close-records
     (pathname (first args)) (second args)
     (loop for (name id) on (cddr args) by #'cddr collect (list :name name :id id)))))
")
  (:PATH #A((40) BASE-CHAR . "spikes/out/pool-chain/closure-input.lisp") :BYTES 361 :SHA256
   "96b034760d887328c41364cd695023e151a750a18e51b072e9ad621490652916" :GIT-BLOB
   "4e91f90f26f3469ff6310e6e25ce7a8268bd782d" :TEXT
   "(:base \"a34cede6fbc9215908d50aa85311d5d703660040\"
 :implementation \"dae4737810927826105588ee68e308362c1ef4aa\"
 :integrated \"6f830dd3f2fa16fc6de8536dba33bcf4d439ca5f\"
 :integrated-parent \"1bdfce485633cacc924d5e7a3b1149b0185a4fa9\"
 :post-pr-integration \"284b1248\"
 :pull-request-head \"49e66e14f8cade401978b9b969a97989995bcb77\"
 :scope :pool-dispatch-chain-tests)
")
  (:PATH #A((12) BASE-CHAR . "arcdocdb.asd") :BYTES 18761 :SHA256
   "28ed60525122c037370c2326cae8e6fbd1e5e8686791440a2f3d12098ad962d6" :GIT-BLOB
   "1e7b4148b3bce66c03fd4c4be0d8fa131af42a87" :TEXT
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
               (:module \"recovery-active-checkpoint\" :serial t
                :components ((:file \"support\") (:file \"semantics\") (:file \"guards\")
                             (:file \"publication\")))
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
             (uiop:symbol-call '#:arcdocdb.recovery.active.checkpoint.tests '#:run)
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
  (:PATH #A((12) BASE-CHAR . "CHANGELOG.md") :BYTES 24464 :SHA256
   "280902287c77360c76d0e741bec013e74077f14f42c8cf94f50e0a557c2e8e6a" :GIT-BLOB
   "16873864af0a2cec5b1ee62606daa6ae20119442" :TEXT "# Changelog

Formato basato su [Keep a Changelog](https://keepachangelog.com/it-IT/1.1.0/). Il progetto
non ha ancora rilasci; le versioni seguiranno la [roadmap](docs/roadmap.md).

## [Non rilasciato]

### Aggiunto

- Verifica integrata pool/dispatcher/Serie con due worker reali: 32 quantum
  su una Serie mentre l'altra mantiene lease o debito batch, più ritiro con
  ring pieno/libero e trasferimento del lavoro residuo a un altro worker.
  Sei scenari sincronizzati; nessuna misura di speedup o modifica ai protocolli.

- Suite nativa indipendente del checkpoint dal vecchio ACTIVE: file v1/v2,
  risoluzione OUTCOME/DECISION, prefisso e coda, budget, chiusura CLOSED
  e collegamento al publisher del control log con oracoli indipendenti.

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
  (:PATH #A((45) BASE-CHAR . "docs/implementazione/pool-catena-risultati.md") :BYTES 8165 :SHA256
   "a69e5c334b91b0e3e9d98557126b496132036aca58579b5f38c3d741074f3b86" :GIT-BLOB
   "3d6b448db14dae6485efcc73de7a49ef85043c22" :TEXT
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
La sola modifica successiva ai test è la stampa delle righe; la qualifica
completa usa la versione congelata indicata sopra. Nessun tentativo fallito
è omesso.

Il [primo controllo finale](../../spikes/results/2026-10-15-pool-catena/processes/final-attempt-01/report.lisp)
è FAILED/exit 2, sorgenti STABLE, 4,720478 s: il verificatore scandisce anche
le copie Markdown sotto `spikes/out/` e segnala tre riferimenti relativi
mancanti nella copia isolata del metodo. Non è un fallimento della suite.
La sola copia locale è stata rinominata da `.md` a `.md.txt`, con identità
SHA-256 verificata prima e dopo; il bundle della pubblicazione conserva
integralmente il nome e i byte del file al momento della copia.
Il record fallito e la sua conservazione rimangono originali.

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

## Chiusura e integrazione della suite recovery

La [pubblicazione](../../spikes/results/2026-10-15-pool-catena/processes/publication/report.lisp)
è OK/STABLE/exit 0, 85,510822 s, 964 sorgenti e stderr vuoto.
Dopo la correzione della copia locale, il
[secondo controllo finale](../../spikes/results/2026-10-15-pool-catena/processes/final-verification/report.lisp)
è OK/STABLE/exit 0, 200,360344 s, 964 sorgenti e stderr vuoto:
471 Markdown, 3.184 link senza rotture; 122 cataloghi, 3.561 riferimenti,
41.484 file e 1.104.173.105 byte. Questi conteggi precedono le copie di
chiusura, i nuovi collegamenti di questa sezione e l'integrazione seguente.

La [PR 15](https://github.com/gpicchiarelli/ArcDocDB/pull/15), head
`49e66e14f8cade401978b9b969a97989995bcb77`, aggiunge 27 test recovery
in un package distinto, ASDF e documentazione; nessuna modifica a `src/`,
agli strumenti o alla CI. Il merge locale
`284b1248` conserva entrambe le voci del changelog e le due suite.
Il [controllo successivo](../../spikes/results/2026-10-15-pool-catena/processes/post-pr-integration/report.lisp)
è OK/STABLE/exit 0, 56,903611 s, 969 sorgenti: **1.651 test nominati e
2 smoke**, 237 file lint/0 violazioni, 122 requisiti/65 invarianti/13 FI/
52 ADR senza errori, 473 Markdown/3.191 link/0 rotti. Compilazione stretta
senza avvisi; stderr di note conservato integralmente (1.248.665 byte UTF-8).
I file nuovi della catena e il metodo rimangono identici al congelamento;
ASDF e changelog finali sono conservati nel bundle di chiusura.

Il [manifesto di chiusura](../../spikes/results/2026-10-15-pool-catena/chiusura-01.lisp)
aggiunge i tre registri originali senza riscrivere quelli precedenti,
conserva stati, descriptor/payload e sorgenti finali. Non trasforma la
qualifica locale di questa catena in qualifica dell'intero motore.
")
  (:PATH #A((32) BASE-CHAR . "spikes/out/pool-chain/close.lisp") :BYTES 1423 :SHA256
   "a7155d8e469d67e8e9c55b232d9df2518454f121fc651fab3932cdf99e770fd0" :GIT-BLOB
   "090c35418cd7186156de7a2550b5bdba6e686f4e" :TEXT "(require :asdf)
(let ((*features* (cons :pool-worker-lifecycle-closure-library *features*)))
  (load \"spikes/out/lifecycle-close-records.lisp\"))
(let ((args (uiop:command-line-arguments))
      (*lifecycle-publication-directory* #p\"spikes/results/2026-10-15-pool-catena/\"))
  (unless (= (length args) 3) (error \"Publication, final and post-PR record IDs required.\"))
  (lifecycle-close-records
   #p\"spikes/out/pool-chain/closure-input.lisp\" \"chiusura-01\"
   (list (list :name \"publication\" :id (first args))
         (list :name \"final-verification\" :id (second args))
         (list :name \"post-pr-integration\" :id (third args)))
   :extra-sources
   '(#p\"arcdocdb.asd\" #p\"tests/scheduler/pool-chain-support.lisp\"
     #p\"tests/scheduler/pool-chain.lisp\" #p\"CHANGELOG.md\"
     #p\"docs/implementazione/README.md\" #p\"docs/implementazione/pool-catena-metodo.md\"
     #p\"docs/implementazione/pool-catena-risultati.md\" #p\"spikes/out/pool-chain/close.lisp\"
     #p\"spikes/out/pool-chain/publication-attempt-01.log\"
     #p\"spikes/out/pool-chain/final-attempt-01.log\"
     #p\"spikes/out/pool-chain/final-attempt-02.log\"
     #p\"spikes/out/pool-chain/post-pr-integration-attempt-01.log\"
     #p\"spikes/out/pool-chain/preserve-failure.lisp\"
     #p\"spikes/out/pool-chain/preserve-failure.log\"
     #p\"spikes/out/pool-chain/read-process.lisp\"
     #p\"spikes/out/pool-chain/frozen/docs/implementazione/pool-catena-metodo.md.txt\")))
")
  (:PATH #A((48) BASE-CHAR . "spikes/out/pool-chain/publication-attempt-01.log") :BYTES 252 :SHA256
   "4db54a82f99d9fee35efee51dc336c52a33fb7a5a1cc8bc92cbde84ccfacf0fe" :GIT-BLOB
   "65277f5d917140a4d38109a06b4a3d55207172f1" :TEXT
   ":OK: sbcl --noinform --no-userinit --no-sysinit --script spikes/out/pool-chain/publication.lisp spikes/out/4001076253-check-8006-0/; record: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001076486-command-14033-0/report.lisp
")
  (:PATH #A((42) BASE-CHAR . "spikes/out/pool-chain/final-attempt-01.log") :BYTES 149 :SHA256
   "4090079eda0137aa7aca08023877071c86877d2c5b459f7e44153bc3b720892e" :GIT-BLOB
   "43722df8ab99c7976906d215918a4c6f58fd53ec" :TEXT
   ":FAILED: make links evidence; record: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001076618-command-21264-0/report.lisp
")
  (:PATH #A((42) BASE-CHAR . "spikes/out/pool-chain/final-attempt-02.log") :BYTES 145 :SHA256
   "d6e2ca4efd101a8fc2d62a8cf6a2844bedd909b6035dcd467e02e210ae8d0f44" :GIT-BLOB
   "a956b6fc345f30ad5361b374f1adc51dee69fd2f" :TEXT
   ":OK: make links evidence; record: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001076808-command-27398-0/report.lisp
")
  (:PATH #A((56) BASE-CHAR . "spikes/out/pool-chain/post-pr-integration-attempt-01.log") :BYTES 152
   :SHA256 "dfa52ddfc22810ca3b63f2a01896727ad14ed1f59d7a61dedc57c01bd49a9067" :GIT-BLOB
   "492e707fc809b03444a7052a51ab93423c570f1d" :TEXT
   ":OK: make test lint trace links; record: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001077106-command-35002-0/report.lisp
")
  (:PATH #A((43) BASE-CHAR . "spikes/out/pool-chain/preserve-failure.lisp") :BYTES 522 :SHA256
   "e71312f6341fc864ce3ec9e5e2ce7461f751fab09bcac574bf70a0b9e03a0a5c" :GIT-BLOB
   "13a1acb9a7412cd1b68ca6f81f311c0c7728e69c" :TEXT "(require :asdf)
(let ((*features* (cons :pool-worker-lifecycle-publication-library *features*)))
  (load \"spikes/out/lifecycle-publication.lisp\"))
(let ((destination #p\"spikes/results/2026-10-15-pool-catena/\"))
  (pool-publication-copy-record
   (pool-publication-record-plan
    '(:name \"final-attempt-01\" :id \"4001076618-command-21264-0\")
    (truename \"./\") destination))
  (lifecycle-publication-refresh-manifest
   \"a34cede6fbc9215908d50aa85311d5d703660040\" :stem \"manifesto-tentativo-01\"
   :directory destination))
")
  (:PATH #A((42) BASE-CHAR . "spikes/out/pool-chain/preserve-failure.log") :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" :GIT-BLOB
   "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391" :TEXT "")
  (:PATH #A((39) BASE-CHAR . "spikes/out/pool-chain/read-process.lisp") :BYTES 230 :SHA256
   "e58f43fa31757533fc3da935901a9d53cae6f44b921e5f2ee40743c998d63b9b" :GIT-BLOB
   "898cc4b7ceac41266b96d31e3ec1803c1aab760d" :TEXT "(require :asdf)
(load \"tools/evidence-storage.lisp\")
(let ((data (arcdocdb.evidence:read-evidence (first (uiop:command-line-arguments)))))
  (write-string (or (getf data :stdout) \"\"))
  (write-string (or (getf data :stderr) \"\")))
")
  (:PATH
   #A((75) BASE-CHAR
      . "spikes/out/pool-chain/frozen/docs/implementazione/pool-catena-metodo.md.txt")
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
")))
