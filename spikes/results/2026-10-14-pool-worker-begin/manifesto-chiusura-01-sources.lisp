(:SCHEMA-VERSION 1 :KIND :POOL-WORKER-LIFECYCLE-CLOSURE-SOURCES :VERSION
 "ad829a40f6ce72837b59982d2e4f83e8c9ca9f3e" :PART 1 :PARTS 1 :SOURCES
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
  (:PATH #A((44) BASE-CHAR . "spikes/out/pool-begin-publication-input.lisp") :BYTES 2546 :SHA256
   "c7aa705896d87d61d05c5a4452e2aded54b674eedf15c5d28c8e3859e70af8a5" :GIT-BLOB
   "99bf71dcb2c50f8b250f4674284f61c7f674de72" :TEXT
   "(:base \"ad829a40f6ce72837b59982d2e4f83e8c9ca9f3e\" :snapshot \"/tmp/arcdocdb-pool-begin-qualification-1792007072\" :paths (\"CHANGELOG.md\" \"arcdocdb.asd\" \"docs/implementazione/README.md\" \"docs/implementazione/pool-dispatch.md\" \"src/dispatch/begin.lisp\" \"src/dispatch/build.lisp\" \"src/dispatch/claim.lisp\" \"src/dispatch/package.lisp\" \"src/dispatch/recycle.lisp\" \"src/dispatch/types.lisp\" \"tests/scheduler/pool-begin.lisp\" \"tools/measure-pool-begin.lisp\" \"docs/implementazione/pool-begin.md\" \"docs/implementazione/pool-begin-metodo.md\" \"docs/implementazione/pool-begin-revisione.md\") :final-paths (\"CHANGELOG.md\" \"arcdocdb.asd\" \"docs/implementazione/README.md\" \"docs/implementazione/pool-dispatch.md\" \"src/dispatch/begin.lisp\" \"src/dispatch/build.lisp\" \"src/dispatch/claim.lisp\" \"src/dispatch/package.lisp\" \"src/dispatch/recycle.lisp\" \"src/dispatch/types.lisp\" \"tests/scheduler/pool-begin.lisp\" \"tools/measure-pool-begin.lisp\" \"docs/implementazione/pool-begin.md\" \"docs/implementazione/pool-begin-metodo.md\" \"docs/implementazione/pool-begin-revisione.md\" \"docs/implementazione/pool-begin-risultati.md\") :records ((:name \"publisher-selftest\" :id \"4000996071-command-39309-0\") (:name \"coverage-reader\" :id \"4000996086-command-40256-0\") (:name \"selftest\" :id \"4000996086-command-40255-0\") (:name \"coverage\" :id \"4000996086-command-40257-0\") (:name \"benchmark\" :id \"4000996125-command-41073-0\") (:name \"check-core\" :id \"4000996069-command-39211-0\")) :benchmark-report \"/tmp/arcdocdb-pool-begin-qualification-1792007072/spikes/out/pool-begin-measure/bench-attempt-01/report.lisp\" :evidence ((:name \"coverage-audit\" :source \"/tmp/arcdocdb-pool-begin-qualification-1792007072/spikes/out/pool-begin-measure/coverage-attempt-01/coverage-audit.lisp\") (:name \"begin-coverage-audit\" :source \"/tmp/arcdocdb-pool-begin-qualification-1792007072/spikes/out/pool-begin-measure/coverage-attempt-01/coverage-dispatch-audit.lisp\")) :evidence-directories ((:name \"check-core-spikes\" :source \"/tmp/arcdocdb-pool-begin-qualification-1792007072/spikes/out/4000996306-check-44850-0\")) :extra-development-sources (\"/tmp/arcdocdb-pool-begin-qualification-1792007072/spikes/out/pool-begin-fullcheck-attempt-01.log\" \"/tmp/arcdocdb-pool-begin-qualification-1792007072/spikes/out/pool-begin-publication-selftest-attempt-01.log\") :extra-sources (\"/tmp/arcdocdb-pool-begin-state.json\" \"spikes/out/pool-command-summary.lisp\" \"tools/measure-pool-lifecycle.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/lifecycle-measure/lifecycle-coverage-reader.lisp\"))
")
  (:PATH #A((38) BASE-CHAR . "spikes/out/pool-begin-publication.lisp") :BYTES 6567 :SHA256
   "d3639119b9dee0a6475d3098e2a649616a7dcb4ed6f9ea93903c852ae251e759" :GIT-BLOB
   "c64d76ceff7c58912bb0d015abbba50526e1a191" :TEXT
   ";;;; Wrapper begin: riusa byte per byte il publisher C4 lifecycle verificato.
;;;; Solo esecuzione esplicita dopo freeze; feature :pool-worker-begin-publication-library.
(require :asdf)
(let ((*features* (cons :pool-worker-lifecycle-publication-library *features*)))
  (load \"spikes/out/lifecycle-publication.lisp\"))
(in-package #:cl-user)

(defparameter *pool-worker-begin-publication-directory*
  #p\"spikes/results/2026-10-14-pool-worker-begin/\")
(defparameter *pool-worker-begin-development-roots*
  '(#p\"spikes/out/pool-begin-dev/\" #p\"spikes/out/pool-begin-tests/\"
    #p\"spikes/out/pool-begin-measure/\"))
(defparameter *pool-worker-begin-development-required*
  '(#p\"spikes/out/pool-begin-dev/compile-product-attempt-01.log\"
    #p\"spikes/out/pool-begin-dev/lint-trace-attempt-01.log\"))

(defun pool-worker-begin-publication-input (config)
  \"Adatta solo i parametri del publisher generico; l'input originale resta conservato.\"
  (let* ((adapted (copy-list config))
         (snapshot (pool-publication-root (getf config :snapshot))))
    (unless (getf adapted :development-roots)
      (setf (getf adapted :development-roots)
            (append *pool-worker-begin-development-roots*
                    (list (merge-pathnames \"spikes/out/pool-begin-measure/\" snapshot)))))
    (unless (getf adapted :development-required)
      (setf (getf adapted :development-required) *pool-worker-begin-development-required*))
    (setf (getf adapted :extra-sources)
          (remove-duplicates
           (append (getf config :extra-sources)
                   '(#p\"spikes/out/pool-begin-publication.lisp\"
                     #p\"spikes/out/pool-begin-closure-run.lisp\"
                     #p\"spikes/out/lifecycle-close-records.lisp\")) :test #'equal))
    adapted))

(defun pool-worker-begin-component-manifest (config input-path)
  \"Identifica il componente concreto e le impronte esatte delle fonti frozen qualificate.\"
  (let* ((snapshot (pool-publication-root (getf config :snapshot)))
         (paths (getf config :paths))
         (sources
           (mapcar (lambda (path)
                     (let ((source (pool-publication-source path snapshot)))
                       (lifecycle-regular-file source)
                       (append (list :relative-path (enough-namestring source snapshot))
                               (worker-byte-record source)))) paths)))
    (dolist (required '(\"src/dispatch/package.lisp\" \"src/dispatch/types.lisp\"
                        \"src/dispatch/build.lisp\" \"src/dispatch/claim.lisp\"
                        \"src/dispatch/recycle.lisp\" \"src/dispatch/begin.lisp\"))
      (unless (find required sources :test #'string=
                    :key (lambda (source) (getf source :relative-path)))
        (error \"Il componente begin richiede la fonte frozen ~A.\" required)))
    (list :schema-version 1 :kind :pool-worker-begin-component-manifest
          :base (getf config :base) :qualified-snapshot (namestring snapshot)
          :public-api '(\"arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool\"
                         \"arcdocdb.scheduler.dispatch:prendi-collegamento-pool\"
                         \"arcdocdb.scheduler.dispatch:collega-obbligo-pool\"
                         \"arcdocdb.scheduler.dispatch:ricircola-collegamento-pool\"
                         \"arcdocdb.scheduler.dispatch:inizia-obbligo-pool\")
          :runtime-sources '(\"src/dispatch/package.lisp\" \"src/dispatch/types.lisp\"
                            \"src/dispatch/build.lisp\" \"src/dispatch/claim.lisp\"
                            \"src/dispatch/recycle.lisp\" \"src/dispatch/begin.lisp\")
          :scope '(:claimed-only :lifecycle-independent :direct-ordinal-routing
                   :single-delegated-c1-begin :unchanged-token-state-reason
                   :no-post-acquisition-check :no-implicit-claim-recycle-or-cleanup)
          :qualified-source-inventory sources :original-input (worker-byte-record input-path)
          :generic-compatibility
          '(:catalog-component :writer-worker
            :qualified-source-kind :pool-worker-lifecycle-qualified-sources
            :final-source-kind :pool-worker-lifecycle-final-sources
            :development-source-kind :pool-worker-lifecycle-development
            :large-development-kind :pool-worker-lifecycle-development-large
            :development-manifest-kind :pool-controller-development-manifest
            :process-manifest-kind :pool-worker-lifecycle-process-manifest
            :whole-file-manifest-kind :pool-worker-lifecycle-whole-file-manifest)
          :limits '(:logical-begin-only :generic-family-does-not-expand-product-scope
                    :original-proof-and-status-preserved :no-native-park-wake))))

(defun pool-worker-begin-validate-component (component)
  (dolist (source (append (getf component :qualified-source-inventory)
                         (list (getf component :original-input))))
    (unless (worker-byte-records-equal-p source (worker-byte-record (getf source :path)))
      (error \"Fonte/input del manifesto begin mutato: ~A\" (getf source :path))))
  t)

(defun pool-worker-begin-publication-run (config input-path)
  \"Namespace begin nuovo; prove originali e writer esclusivo sono quelli C4 già verificati.\"
  (let* ((adapted (pool-worker-begin-publication-input config))
         (component (pool-worker-begin-component-manifest config input-path))
         (*lifecycle-publication-directory* *pool-worker-begin-publication-directory*))
    (when (> (length (worker-data-octets component)) 1048576)
      (error \"Manifesto componente oltre il budget plain prima della pubblicazione.\"))
    (lifecycle-publication-run adapted input-path)
    (pool-worker-begin-validate-component component)
    (worker-save-data component (merge-pathnames \"component-manifest.lisp\"
                                                *lifecycle-publication-directory*))
    (pool-worker-begin-validate-component component)
    (lifecycle-publication-refresh-manifest
     (getf config :base) :stem \"manifesto-componente-file\"
     :directory *lifecycle-publication-directory*)
    (format t \"Pool worker begin component: frozen sources and generic compatibility recorded.~%\")
    t))

(unless (member :pool-worker-begin-publication-library *features*)
  (let ((args (uiop:command-line-arguments)))
    (unless (= (length args) 1)
      (error \"Uso: sbcl --script spikes/out/pool-begin-publication.lisp input-plist.lisp\"))
    (let* ((path (pathname (first args))) (config (worker-read-raw-data path)))
      (pool-worker-begin-publication-run config path))))
")
  (:PATH #A((38) BASE-CHAR . "spikes/out/pool-begin-closure-run.lisp") :BYTES 1417 :SHA256
   "170551eee91df021f6b2e961d8ea6d8dc454b3f9364d80dd42b0e286112ae13a" :GIT-BLOB
   "9b6617c655b91b35842a9bfcae65301166ff7da6" :TEXT
   ";;;; Chiusura begin: stesso helper C4, con directory dinamica del namespace recycle.
;;;; Input/source extra e risultati finali sono copiati in bundle lossless nuovi.
(require :asdf)
(let ((*features* (cons :pool-worker-begin-publication-library
                       (cons :pool-worker-lifecycle-closure-library *features*))))
  (load \"spikes/out/pool-begin-publication.lisp\")
  (load \"spikes/out/lifecycle-close-records.lisp\"))
(in-package #:cl-user)

(defun pool-worker-begin-close-records (input-path stem records &key extra-sources)
  (let ((*lifecycle-publication-directory* *pool-worker-begin-publication-directory*))
    (lifecycle-close-records
     input-path stem records
     :extra-sources
     (remove-duplicates
      (append '(#p\"spikes/out/pool-begin-publication.lisp\"
                #p\"spikes/out/pool-begin-closure-run.lisp\"
                #p\"docs/implementazione/pool-begin-risultati.md\")
              extra-sources) :test #'equal))))

(unless (member :pool-worker-begin-closure-library *features*)
  (let ((args (uiop:command-line-arguments)))
    (unless (and (>= (length args) 4) (evenp (- (length args) 2)))
      (error \"Uso: sbcl --script spikes/out/pool-begin-closure-run.lisp input-plist stem name id [name id ...]\"))
    (pool-worker-begin-close-records
     (pathname (first args)) (second args)
     (loop for (name id) on (cddr args) by #'cddr collect (list :name name :id id)))))
")
  (:PATH #A((33) BASE-CHAR . "spikes/out/pool-begin-finish.lisp") :BYTES 1257 :SHA256
   "02e1dc4cd4f9662b13f87172854b9c116f4f49758fcc6c887db957b2a8c0557a" :GIT-BLOB
   "8eaab91503c0637c46b237aa8f2a81bfa0d9507b" :TEXT
   ";;;; Chiusura dei record originali begin e dell'archivio verificato.
(let ((*features* (cons :pool-worker-begin-closure-library *features*)))
  (load \"spikes/out/pool-begin-closure-run.lisp\"))
(pool-worker-begin-close-records
 #p\"spikes/out/pool-begin-publication-input.lisp\" \"manifesto-chiusura-01\"
 '((:name \"publication\" :id \"4000996412-command-48485-0\")
   (:name \"final-verification\" :id \"4000996730-command-62223-0\"))
 :extra-sources '(
  #p\"spikes/out/pool-begin-finish.lisp\"
  #p\"spikes/out/pool-begin-publication-attempt-01.log\"
  #p\"spikes/out/pool-begin-final-verification-attempt-01.log\"
  #p\"/tmp/arcdocdb-pool-begin-state.json\"
  #p\"CHANGELOG.md\"
  #p\"arcdocdb.asd\"
  #p\"docs/implementazione/README.md\"
  #p\"docs/implementazione/pool-dispatch.md\"
  #p\"src/dispatch/begin.lisp\"
  #p\"src/dispatch/build.lisp\"
  #p\"src/dispatch/claim.lisp\"
  #p\"src/dispatch/package.lisp\"
  #p\"src/dispatch/recycle.lisp\"
  #p\"src/dispatch/types.lisp\"
  #p\"tests/scheduler/pool-begin.lisp\"
  #p\"tools/measure-pool-begin.lisp\"
  #p\"docs/implementazione/pool-begin.md\"
  #p\"docs/implementazione/pool-begin-metodo.md\"
  #p\"docs/implementazione/pool-begin-revisione.md\"
  #p\"docs/implementazione/pool-begin-risultati.md\"
  #p\"spikes/out/pool-command-summary.lisp\"
 ))
")
  (:PATH #A((48) BASE-CHAR . "spikes/out/pool-begin-publication-attempt-01.log") :BYTES 287 :SHA256
   "4981b66c5942ac3ea662c9fd5f2bf09a305ade131158f00f8031b8fb05f0332d" :GIT-BLOB
   "b56def815c2d0739018b43f48fbc96885f2ad477" :TEXT
   ":OK: sbcl --dynamic-space-size 2048 --noinform --no-userinit --no-sysinit --script spikes/out/pool-begin-publication.lisp spikes/out/pool-begin-publication-input.lisp; record: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4000996412-command-48485-0/report.lisp
")
  (:PATH #A((55) BASE-CHAR . "spikes/out/pool-begin-final-verification-attempt-01.log") :BYTES 145
   :SHA256 "a91c81440d893a242e0fd1db76dd64e3d86a57698722f2540e47fea5f08b1e1d" :GIT-BLOB
   "ba87a2497e09ea020d8a9d94e387182139baafbe" :TEXT
   ":OK: make links evidence; record: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4000996730-command-62223-0/report.lisp
")
  (:PATH #A((35) BASE-CHAR . "/tmp/arcdocdb-pool-begin-state.json") :BYTES 8244 :SHA256
   "0736ddf6a56d9363d0f4d5c20e45aca071fd30f144fd4cb05661d4b1a538331b" :GIT-BLOB
   "fd0601bfb9a9f765050b2b72fd0bea894f46377b" :TEXT "{
  \"base\": \"ad829a40f6ce72837b59982d2e4f83e8c9ca9f3e\",
  \"snapshot\": \"/tmp/arcdocdb-pool-begin-qualification-1792007072\",
  \"root\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\",
  \"frozen\": true,
  \"paths\": [
    \"CHANGELOG.md\",
    \"arcdocdb.asd\",
    \"docs/implementazione/README.md\",
    \"docs/implementazione/pool-dispatch.md\",
    \"src/dispatch/begin.lisp\",
    \"src/dispatch/build.lisp\",
    \"src/dispatch/claim.lisp\",
    \"src/dispatch/package.lisp\",
    \"src/dispatch/recycle.lisp\",
    \"src/dispatch/types.lisp\",
    \"tests/scheduler/pool-begin.lisp\",
    \"tools/measure-pool-begin.lisp\",
    \"docs/implementazione/pool-begin.md\",
    \"docs/implementazione/pool-begin-metodo.md\",
    \"docs/implementazione/pool-begin-revisione.md\"
  ],
  \"helpers\": [
    \"spikes/out/pool-begin-measure/coverage-run.lisp\",
    \"spikes/out/pool-begin-measure/dispatch-coverage-reader.lisp\",
    \"spikes/out/pool-begin-measure/reader-run.lisp\",
    \"spikes/out/pool-begin-measure/tool-run.lisp\",
    \"spikes/out/lifecycle-measure/lifecycle-coverage-reader.lisp\",
    \"spikes/out/pool-begin-publication.lisp\",
    \"spikes/out/pool-begin-closure-run.lisp\",
    \"spikes/out/pool-begin-dev/publication-selftest.lisp\",
    \"spikes/out/lifecycle-publication.lisp\",
    \"spikes/out/lifecycle-close-records.lisp\",
    \"spikes/out/lifecycle-publication-selftest.lisp\",
    \"spikes/out/worker-publication-functions.lisp\",
    \"spikes/out/pool-controller/publish.lisp\",
    \"spikes/out/pool-controller/dev-evidence.lisp\"
  ],
  \"records\": [
    {
      \"name\": \"publisher-selftest\",
      \"id\": \"4000996071-command-39309-0\"
    },
    {
      \"name\": \"coverage-reader\",
      \"id\": \"4000996086-command-40256-0\"
    },
    {
      \"name\": \"selftest\",
      \"id\": \"4000996086-command-40255-0\"
    },
    {
      \"name\": \"coverage\",
      \"id\": \"4000996086-command-40257-0\"
    },
    {
      \"name\": \"benchmark\",
      \"id\": \"4000996125-command-41073-0\"
    },
    {
      \"name\": \"check-core\",
      \"id\": \"4000996069-command-39211-0\"
    },
    {
      \"name\": \"publication\",
      \"id\": \"4000996412-command-48485-0\",
      \"root\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\"
    },
    {
      \"name\": \"final-verification\",
      \"id\": \"4000996730-command-62223-0\",
      \"root\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\"
    }
  ],
  \"source_sha256\": {
    \"CHANGELOG.md\": \"a3a3a0ebbb04600fc498519827c7e847087bb82327db6304970ba09221b57973\",
    \"arcdocdb.asd\": \"c9f2d60f0e73f1d951504da145b192584300a161cfd4df90984536fa9a34ec53\",
    \"docs/implementazione/README.md\": \"dfe2df8776ce028df1f682bc66cd4963010279e67728591415d268283e3768e7\",
    \"docs/implementazione/pool-dispatch.md\": \"c7d5a5ff9c6324c2a5f40cb658e79fa4d5f6051f50640bbb58d7515a12c9c2bc\",
    \"src/dispatch/begin.lisp\": \"4ae4bf8f6b7afe53af099a4b37ad75d253c05077f0cc7fbe39f4f1cab9f89a8d\",
    \"src/dispatch/build.lisp\": \"c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5\",
    \"src/dispatch/claim.lisp\": \"224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682\",
    \"src/dispatch/package.lisp\": \"34ecf62cd625f8af0a884d713563338c88635afd88fd0eaa0ab8ba43d5f19486\",
    \"src/dispatch/recycle.lisp\": \"9fa3294cd28d1904cfb8db5153f93188b02f1bfbaf1800dad788731007c29ad0\",
    \"src/dispatch/types.lisp\": \"cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720\",
    \"tests/scheduler/pool-begin.lisp\": \"ecb295cc76e3308f6e12e7a28b0fb46d517043709bffdac565ef8cbfd866b044\",
    \"tools/measure-pool-begin.lisp\": \"f572b29c9566c9ab282ef804c8136367beb574c7b57bee4a570bae961cb5c732\",
    \"docs/implementazione/pool-begin.md\": \"c3ca973e76cea42038adc378fcedb61c7688d50228eaac38821c245b7ed60b5e\",
    \"docs/implementazione/pool-begin-metodo.md\": \"70308477c656e8fa44334e14aac68458f9345c38feb988be939e5d61c042b7ac\",
    \"docs/implementazione/pool-begin-revisione.md\": \"1b58c2b2bc903dfc9035a356e54cde82fed2f3855a326bf561835af771e215fb\"
  },
  \"helper_sha256\": {
    \"spikes/out/pool-begin-measure/coverage-run.lisp\": \"ea0bafab12a727d10675529f37d8536a37de821a8ddf79d6beba9e94d43329f2\",
    \"spikes/out/pool-begin-measure/dispatch-coverage-reader.lisp\": \"f240f76e62f41567c439e58042a3427ae0181750890096836d33e07813f4b63e\",
    \"spikes/out/pool-begin-measure/reader-run.lisp\": \"954f53022e44b74f02d4963fcc208bb42e788ba27ef91aad073684fd0feee6d9\",
    \"spikes/out/pool-begin-measure/tool-run.lisp\": \"8299f07fe71db3a74258986684e507ffcd900c2cd89c55e880c55b114de6cce7\",
    \"spikes/out/lifecycle-measure/lifecycle-coverage-reader.lisp\": \"4696348d1a4cb37c1d135e2df29309f4f7abc58b9da3220214612109fd5bfb2c\",
    \"spikes/out/pool-begin-publication.lisp\": \"d3639119b9dee0a6475d3098e2a649616a7dcb4ed6f9ea93903c852ae251e759\",
    \"spikes/out/pool-begin-closure-run.lisp\": \"170551eee91df021f6b2e961d8ea6d8dc454b3f9364d80dd42b0e286112ae13a\",
    \"spikes/out/pool-begin-dev/publication-selftest.lisp\": \"2e509d57786c1ede639c35c005538ba56a7bc94a923f5919106ad6f3819497ae\",
    \"spikes/out/lifecycle-publication.lisp\": \"2e127810d51f29c1bc5cd9ca2f0136c764158a77fc1962512537053de60e6754\",
    \"spikes/out/lifecycle-close-records.lisp\": \"d2955e271c7789a60d1c2ba25e0b39c42254770732655f59758ffede391af3b5\",
    \"spikes/out/lifecycle-publication-selftest.lisp\": \"7168bad315b46326cac275c75d2a8c0478da6877591189516b50ceaceb93dbc0\",
    \"spikes/out/worker-publication-functions.lisp\": \"01ce7104faa1905afa2f6b48a03bee04c176ee4c9f68e16ddb1ff435d70a028b\",
    \"spikes/out/pool-controller/publish.lisp\": \"0cc8bd2cd31501dee4e4c40a8a520ac2b779df100489543ae7dd37e6baf33ab5\",
    \"spikes/out/pool-controller/dev-evidence.lisp\": \"80d3a91387e7d7563dbd82137aaedd29cfba0a3773cc44e88694b6d4302e8712\"
  },
  \"reviewed_sha256\": {
    \"src/dispatch/package.lisp\": \"34ecf62cd625f8af0a884d713563338c88635afd88fd0eaa0ab8ba43d5f19486\",
    \"src/dispatch/types.lisp\": \"cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720\",
    \"src/dispatch/build.lisp\": \"c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5\",
    \"src/dispatch/claim.lisp\": \"224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682\",
    \"src/dispatch/recycle.lisp\": \"9fa3294cd28d1904cfb8db5153f93188b02f1bfbaf1800dad788731007c29ad0\",
    \"src/dispatch/begin.lisp\": \"4ae4bf8f6b7afe53af099a4b37ad75d253c05077f0cc7fbe39f4f1cab9f89a8d\",
    \"arcdocdb.asd\": \"c9f2d60f0e73f1d951504da145b192584300a161cfd4df90984536fa9a34ec53\",
    \"tests/scheduler/pool-begin.lisp\": \"ecb295cc76e3308f6e12e7a28b0fb46d517043709bffdac565ef8cbfd866b044\",
    \"tools/measure-pool-begin.lisp\": \"f572b29c9566c9ab282ef804c8136367beb574c7b57bee4a570bae961cb5c732\",
    \"docs/implementazione/pool-begin.md\": \"c3ca973e76cea42038adc378fcedb61c7688d50228eaac38821c245b7ed60b5e\",
    \"docs/implementazione/pool-begin-metodo.md\": \"70308477c656e8fa44334e14aac68458f9345c38feb988be939e5d61c042b7ac\",
    \"src/series/routing-select.lisp\": \"796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a\",
    \"src/series/worker-run.lisp\": \"f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f\",
    \"src/series/worker-boundary.lisp\": \"793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73\",
    \"src/series/worker-types.lisp\": \"a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a\",
    \"src/execution/worker-claim.lisp\": \"62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e\",
    \"src/execution/worker-boundary.lisp\": \"4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a\"
  },
  \"implementation_commit\": \"5b3673f407777ebeeefa7caa6320f387a14c85db\",
  \"final_paths\": [
    \"CHANGELOG.md\",
    \"arcdocdb.asd\",
    \"docs/implementazione/README.md\",
    \"docs/implementazione/pool-dispatch.md\",
    \"src/dispatch/begin.lisp\",
    \"src/dispatch/build.lisp\",
    \"src/dispatch/claim.lisp\",
    \"src/dispatch/package.lisp\",
    \"src/dispatch/recycle.lisp\",
    \"src/dispatch/types.lisp\",
    \"tests/scheduler/pool-begin.lisp\",
    \"tools/measure-pool-begin.lisp\",
    \"docs/implementazione/pool-begin.md\",
    \"docs/implementazione/pool-begin-metodo.md\",
    \"docs/implementazione/pool-begin-revisione.md\",
    \"docs/implementazione/pool-begin-risultati.md\"
  ],
  \"spike_directory\": \"/tmp/arcdocdb-pool-begin-qualification-1792007072/spikes/out/4000996306-check-44850-0\"
}
")
  (:PATH #A((12) BASE-CHAR . "CHANGELOG.md") :BYTES 20477 :SHA256
   "a3a3a0ebbb04600fc498519827c7e847087bb82327db6304970ba09221b57973" :GIT-BLOB
   "b829512e0b9332d65a465d974613d891d15738ad" :TEXT "# Changelog

Formato basato su [Keep a Changelog](https://keepachangelog.com/it-IT/1.1.0/). Il progetto
non ha ancora rilasci; le versioni seguiranno la [roadmap](docs/roadmap.md).

## [Non rilasciato]

### Aggiunto

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
  (:PATH #A((12) BASE-CHAR . "arcdocdb.asd") :BYTES 16629 :SHA256
   "c9f2d60f0e73f1d951504da145b192584300a161cfd4df90984536fa9a34ec53" :GIT-BLOB
   "37876041b5104cdb4396017d8d891f547b060a1c" :TEXT
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
                             (:file \"cbor-map-input\") (:file \"cbor-map-write\")))
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
                             (:file \"recycle\") (:file \"begin\")))
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
                             (:file \"recovery-types\") (:file \"recovery-read\") (:file \"recovery-publication\"))))
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
                             (:file \"cbor-map-write-threads\")))
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
                             (:file \"series-support\") (:file \"series-read\")))
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
                             (:file \"pool-begin\")))
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
                :components ((:file \"support\") (:file \"publication\") (:file \"native\")))
               (:module \"recovery\"
                :serial t
                :components ((:file \"support\") (:file \"scan\") (:file \"corruption\")
                             (:file \"decisions-support\") (:file \"decisions\")
                             (:file \"decisions-audit\") (:file \"decisions-radix\") (:file \"manifest-support\")
                             (:file \"manifest\") (:file \"manifest-audit\")
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
  (:PATH #A((30) BASE-CHAR . "docs/implementazione/README.md") :BYTES 10810 :SHA256
   "dfe2df8776ce028df1f682bc66cd4963010279e67728591415d268283e3768e7" :GIT-BLOB
   "fe4b735330176353bea8a2a2939a24606cb97ef5" :TEXT "# Implementazione

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
| Confine I/O | [Append, pread e flush durevole](io.md) | [`src/io/`](../../src/io/) |
| Completamento I/O | [Cleanup, frontiere e capacità dopo short I/O](io-completamento.md) | [`src/io/flush.lisp`](../../src/io/flush.lisp), [`src/io/transfer.lisp`](../../src/io/transfer.lisp) |
| Rinomina nella directory | [FD parent, cambio atomico e fail-stop locale](io-rinomina.md) | [`src/io/rename.lisp`](../../src/io/rename.lisp) |
| Associazione dei file | [Device/inode e capacità readonly/append del medesimo ACTIVE](associazione-file.md) | [`src/io/identity.lisp`](../../src/io/identity.lisp) |
| Nuovo segmento writer | [Header durevole, rilettura, directory e sorgente certificata](inizializzazione-active.md) | [`src/active/`](../../src/active/) |
| ACTIVE vuoto | [Radice iniziale, CLOSED recuperati e primo lotto](get-active-vuoto.md) | [active-init.lisp](../../src/get-resolver/active-init.lisp) |
| Checkpoint del control log | [EDIT completo, piano privato e preparazione durevole a blocchi](checkpoint-control.md) | [`src/control/`](../../src/control/) |
| Pubblicazione del control log | [Rinomina ancorata, identità dei nomi e gettone unico](pubblicazione-control.md) | [`src/control/publication.lisp`](../../src/control/publication.lisp) |
| Control log recuperato | [Lettura readonly, manifest posseduto e transizione conservativa](control-recuperato.md) | [`src/control/recovery-read.lisp`](../../src/control/recovery-read.lisp) |
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
| Manifest della Serie | [Ripiegamento degli EDIT del control log](manifest-control-log.md) | [`src/recovery/`](../../src/recovery/) |
| Inventario recovery | [Piano di riconciliazione dei nomi dei segmenti](inventario.md) | [`src/recovery/inventory-build.lisp`](../../src/recovery/inventory-build.lisp) |
| Ordinamento delle decisioni | [Radix misurato e query concorrenti](decisioni-radix-risultati.md) | [`src/recovery/decisions-radix.lisp`](../../src/recovery/decisions-radix.lisp) |

Le evidenze hanno un ambito esplicito: un test del codec non verifica transazioni,
durability, recovery o prestazioni del database.

Gli [esiti dei processi nelle mutazioni CBOR](cbor-mutazioni-processi.md)
distinguono i rilevamenti dei mutanti dagli errori dei worker di verifica.
")
  (:PATH #A((37) BASE-CHAR . "docs/implementazione/pool-dispatch.md") :BYTES 5425 :SHA256
   "c7d5a5ff9c6324c2a5f40cb658e79fa4d5f6051f50640bbb58d7515a12c9c2bc" :GIT-BLOB
   "4f68de61016c21066841ffd02d9f671963b566da" :TEXT "# Collegamento dal pool alla Serie

Il componente C3 `arcdocdb.scheduler.dispatch` collega la
[presa governata dal pool](pool-worker-claim.md) al
[routing preallocato](routing-worker.md), per REQ-THR-001,
REQ-CON-001/002/004/005 e REQ-AFF-008. Il governo delle risorse resta
fuori dalle barriere C1; non scrive campi di integrità, writer o controller.
Il [metodo preregistrato](pool-dispatch-metodo.md) delimita la qualifica.

## Binding e ingressi

`crea-dispatcher-writer-pool porta tabella` crea un binding immutabile sul
thread proprietario. Porta e tabella devono riferirsi EQ allo stesso contesto
execution completamente IDLE. Tipo della porta, owner, tipo della tabella
e identità del contesto sono verificati in quest'ordine, prima di leggere
la fase o applicare un comando. La barriera IDLE C1 è read-only.
La factory non assume obblighi, acquisisce lease o conferma il pool.
La porta può essere inattiva o avere un comando pendente.

| API | Esito |
|---|---|
| `prendi-collegamento-pool dispatcher` | Solo IDLE libero: nuova presa attraverso il gate, poi routing del CLAIMED. Restituisce link oppure NIL, status, cursore e azione lifecycle originali. |
| `collega-obbligo-pool dispatcher` | Solo CLAIMED già assunto: routing del writer corrente, senza leggere request/ack/active e senza conferme del pool. Restituisce il link preallocato. |
| `ricircola-collegamento-pool dispatcher` | Solo RESCHEDULE: un ricircolo, poi routing del nuovo CLAIMED se full; altrimenti pubblica e termina IDLE. Restituisce link/NIL, status e count della partizione. |
| `inizia-obbligo-pool dispatcher` | Solo CLAIMED: routing corrente e un begin del bridge; restituisce link, token, fase e ragione originali. |

Il primo ingresso restituisce un link solo con `:claimed`. Con `:empty`,
`:busy` o `:inactive` restituisce NIL senza routing. Il link è ancora IDLE:
`inizia-worker-serie`, token, pop, ack e chiusura rimangono passi espliciti
del [bridge](worker-serie.md). Nessuna acquisizione della Serie è implicita.
EMPTY e BUSY non dimostrano quiescenza globale né autorizzano park/shutdown.

Il secondo ingresso riprende un CLAIMED conservato dopo writer-busy, un
ricircolo full o un'adozione. Ogni selezione usa il writer attuale; non
riutilizza il collegamento del tratto precedente. È ripetibile finché il link
rimane IDLE, senza nuove capacità. Neppure parole lifecycle incoerenti
impediscono questo ingresso: l'obbligo esistente deve restare completabile.
Un binding incoerente o un owner estraneo sono invece sempre rifiutati.

## Ritiro, errore e responsabilità del caller

Il ritiro pendente viene confermato al prossimo ingresso IDLE attraverso il
gate. Non viene applicato durante CLAIMED, RUNNING, BATCH, FINISHING o
RESCHEDULE. Dopo `:schedule` il caller invoca esplicitamente
`ricircola-collegamento-pool`, oppure ricircola o cede l'obbligo con le API
execution. Se il ricircolo diretto assegna un nuovo CLAIMED, usa
`collega-obbligo-pool`; l'adattatore di ricircolo restituisce già il suo link.
Dopo una pubblicazione riuscita il contesto torna
IDLE e può applicare il ritiro con la successiva nuova presa.

Il [ricircolo esplicito](pool-recycle.md) risolve il singolo obbligo senza
consultare il pool. L'[avvio esplicito](pool-begin.md) usa un ingresso distinto
sui CLAIMED; gli ingressi di presa e ricircolo non includono begin. Pop, end,
retry, cleanup e rollback restano al caller. I rifiuti writer-busy e Serie-busy mantengono gli stati differenti
del bridge: il primo conserva CLAIMED, il secondo produce CLOSING e un
token da chiudere esplicitamente. Il caller conserva riferimenti e token
fino alla conclusione; non ignora alcun obbligo su errore.

Un routing invalido dopo claim conserva writer, home e obbligo nel contesto
FAULTED secondo la barriera C1 già presente. Nessuna lease della Serie
viene acquisita. L'ACK di attivazione già riuscito resta valido: non si
revocano generazioni. L'Archivio deve gestire la diagnosi, come nei contratti
execution/bridge. C3 non marca direttamente worker o controller.

Tipo della configurazione errato: `invalid-argument
:pool-dispatcher-configuration`; owner estraneo: `invalid-argument
:pool-worker-owner`; contesti diversi: `invalid-argument
:pool-dispatcher-binding`. Fase non-IDLE nella factory o nel gate:
`resource-exhausted :worker-state`, senza sostituire la prima causa.
I rifiuti di routing restano quelli dell'API C1. Un ritorno del gate
incoerente fra writer e status segnala `invariant-violation
:pool-dispatcher-state`, senza abbandonare o mutare il contesto.

## Costo e ambito

Il binding costa O(1) all'avvio, oltre alla tabella O(N) già preallocata.
Ogni ingresso verifica owner e identità EQ in O(1). Nuova presa: gate e
scansione ready O(K), con K massimo 64; solo dopo CLAIMED, routing O(1)
tramite ordinale. Obbligo corrente: solo routing O(1). Nessuna nuova
allocazione intenzionale nel percorso caldo, scansione delle Serie, hash,
scrittura condivisa tra Serie, attesa, thread, callback o I/O.

Il coupling privato legge soltanto owner/context della porta e context della
tabella. I protocolli C1 e lifecycle restano invariati. Il dispatcher è un
ingresso logico per writer, non il loop completo del server: avvio e arresto
dei thread, park/wake, sensori reali, admission dei messaggi, applicazione dei
payload e coordinamento dell'Archivio restano aperti. Nessun gate del motore
completo viene chiuso da questa qualifica.
")
  (:PATH #A((23) BASE-CHAR . "src/dispatch/begin.lisp") :BYTES 1658 :SHA256
   "4ae4bf8f6b7afe53af099a4b37ad75d253c05077f0cc7fbe39f4f1cab9f89a8d" :GIT-BLOB
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
  (:PATH #A((23) BASE-CHAR . "src/dispatch/build.lisp") :BYTES 1176 :SHA256
   "c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5" :GIT-BLOB
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
  (:PATH #A((23) BASE-CHAR . "src/dispatch/claim.lisp") :BYTES 2713 :SHA256
   "224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682" :GIT-BLOB
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
  (:PATH #A((25) BASE-CHAR . "src/dispatch/package.lisp") :BYTES 549 :SHA256
   "34ecf62cd625f8af0a884d713563338c88635afd88fd0eaa0ab8ba43d5f19486" :GIT-BLOB
   "2666d111a76d8510c490ac3f31cbe11118b55b29" :TEXT
   ";;;; Dispatcher logico, caricato dopo il routing e il governo del pool.
;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(defpackage #:arcdocdb.scheduler.dispatch
  (:use #:cl)
  (:import-from #:arcdocdb.binary #:index)
  (:import-from #:arcdocdb.conditions #:invalid-argument #:resource-exhausted
                #:invariant-violation)
  (:export #:dispatcher-writer-pool #:crea-dispatcher-writer-pool
           #:prendi-collegamento-pool #:collega-obbligo-pool #:ricircola-collegamento-pool
           #:inizia-obbligo-pool))
")
  (:PATH #A((25) BASE-CHAR . "src/dispatch/recycle.lisp") :BYTES 2612 :SHA256
   "9fa3294cd28d1904cfb8db5153f93188b02f1bfbaf1800dad788731007c29ad0" :GIT-BLOB
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
  (:PATH #A((23) BASE-CHAR . "src/dispatch/types.lisp") :BYTES 1872 :SHA256
   "cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720" :GIT-BLOB
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
  (:PATH #A((31) BASE-CHAR . "tests/scheduler/pool-begin.lisp") :BYTES 28155 :SHA256
   "ecb295cc76e3308f6e12e7a28b0fb46d517043709bffdac565ef8cbfd866b044" :GIT-BLOB
   "13a239cf97403806a73242abbd5b545440a17645" :TEXT
   ";;;; Begin pool: routing corrente e un solo begin composto, nessun lavoro implicito.
;;;; OWNER: porta, tabella, contesto e bridge sul creatore della fixture.
;;;; FI quiescenti: parole, limiti e sostituzioni temporanee sempre dichiarati.
(in-package #:arcdocdb.scheduler.tests)

(defun pool-begin-check (dispatcher expected status reason)
  \"Oracolo dei quattro valori pubblici; token positivo anche per CLOSING.\"
  (multiple-value-bind (link token actual refusal)
      (arcdocdb.scheduler.dispatch:inizia-obbligo-pool dispatcher)
    (is (eq link expected)) (is (and (typep token 'fixnum) (plusp token)))
    (is (eq actual status)) (is (eq refusal reason)) token))

(defun pool-begin-claim (dispatcher context ready table writers &optional (ordinal 0))
  \"Claim reale prima del nuovo ingresso; fixture attiva e ring a una partizione.\"
  (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers ordinal))))
  (let ((link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) ordinal)))
    (pool-dispatch-check dispatcher link :claimed 0 :unchanged)
    (is (eq :claimed (arcdocdb.execution:stato-worker-writer context))) link))

(defun pool-begin-without-work (thunk)
  \"Sentinelle C4: nessun gate, ACK, claim, ricircolo, pop o chiusura nascosti.\"
  (labels ((protect (names)
             (if (null names) (funcall thunk)
                 (pool-claim-function-fi
                  (first names)
                  (lambda (&rest arguments) (declare (ignore arguments))
                    (error \"Operazione implicita durante begin pool: ~S.\" (first names)))
                  (lambda () (protect (rest names)))))))
    (protect '(arcdocdb.scheduler:prendi-writer-pool
               arcdocdb.scheduler:applica-stato-worker-pool
               arcdocdb.execution:prendi-writer-worker
               arcdocdb.execution:ricircola-worker
               arcdocdb.execution.series:preleva-worker-serie
               arcdocdb.execution.series:termina-worker-serie))))

(defun pool-begin-refusal (dispatcher port table writers type reason)
  (pool-dispatch-refusal
   port table writers
   (lambda () (arcdocdb.scheduler.dispatch:inizia-obbligo-pool dispatcher)) type reason))

(defun pool-begin-complete (link token item action)
  \"Il caller applica e conferma il batch e termina esplicitamente il tratto.\"
  (is (null (arcdocdb.execution.series:conferma-worker-serie
             link token (pool-claim-bridge-pop link token item))))
  (is (eq action (arcdocdb.execution.series:termina-worker-serie link token))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-begin-real-active-forwards-four-values-without-pop
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (let* ((link (pool-begin-claim dispatcher context ready table writers))
           (queue (arcdocdb.execution::writer-programmabile-queue (svref writers 0)))
           (original (fdefinition 'arcdocdb.execution.series:inizia-worker-serie))
           (calls 0) (token nil))
      (pool-begin-without-work
       (lambda ()
         (pool-claim-function-fi
          'arcdocdb.execution.series:inizia-worker-serie
          (lambda (selected) (is (eq link selected)) (incf calls) (funcall original selected))
          (lambda () (setf token (pool-begin-check dispatcher link :active nil))))))
      (is (= 1 calls))
      (is (eq :running (arcdocdb.execution:stato-worker-writer context)))
      (is (eq :active (arcdocdb.execution.series:stato-worker-serie link)))
      (is (= 1 (arcdocdb.execution::coda-writer-count queue)))
      (is (zerop (arcdocdb.execution::coda-writer-extracted queue)))
      (is (plusp (arcdocdb.execution.series:lease-worker-serie link token)))
      (is (equal '(1 1 nil) (lifecycle-words port)))
      (signals resource-exhausted
        (arcdocdb.series:acquisisci-controllore-serie (svref controllers 0)) :serie-busy)
      (pool-begin-complete link token :a1 :idle)
      (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))
      (is (null (arcdocdb.execution:writer-worker-writer context)))
      (let ((lease (arcdocdb.series:acquisisci-controllore-serie (svref controllers 0))))
        (arcdocdb.series:rilascia-controllore-serie (svref controllers 0) lease)))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-begin-full-recycle-starts-current-b-instead-of-previous-a
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable port))
    (pool-recycle-reschedule dispatcher context ready writers 0)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 1))))
    (let* ((links (arcdocdb.execution.series::tabella-worker-serie-links table))
           (left (svref links 0)) (right (svref links 1))
           (left-before (pool-dispatch-link-image left))
           (controller-before (pool-dispatch-series-image (svref controllers 0))))
      (pool-recycle-check dispatcher right :claimed 1)
      (let ((token (pool-begin-without-work
                    (lambda () (pool-begin-check dispatcher right :active nil)))))
        (is (not (eq left right)))
        (is (eq (svref writers 1) (arcdocdb.execution:writer-worker-writer context)))
        (is (equalp left-before (pool-dispatch-link-image left)))
        (is (equalp controller-before (pool-dispatch-series-image (svref controllers 0))))
        (let ((lease (arcdocdb.series:acquisisci-controllore-serie (svref controllers 0))))
          (arcdocdb.series:rilascia-controllore-serie (svref controllers 0) lease))
        (signals resource-exhausted
          (arcdocdb.series:acquisisci-controllore-serie (svref controllers 1)) :serie-busy)
        (pool-begin-complete right token :b1 :idle))
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-begin-complete left (pool-begin-check dispatcher left :active nil) :a2 :idle))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-begin-existing-claim-ignores-inactive-corrupt-and-retire-words
  (dolist (scenario '(:inactive :corrupt :retire))
    (with-pool-dispatch (dispatcher port context ready table writers controllers
                                   :active (not (eq scenario :inactive)) :left-items '(:a1))
      (declare (ignorable ready controllers))
      (is (null (arcdocdb.execution:adotta-writer-worker context (svref writers 0) 0)))
      ;; FI coordinator quiescente: comandi non validati da un obbligo gia CLAIMED.
      (case scenario
        (:corrupt (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4
                        (arcdocdb.scheduler::porta-worker-pool-ack port) 0))
        (:retire (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)))
      (let* ((words (lifecycle-words port))
             (link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0))
             (token (pool-begin-without-work
                     (lambda () (pool-begin-check dispatcher link :active nil)))))
        (is (equal words (lifecycle-words port)))
        (pool-begin-complete link token :a1 :idle)
        (is (equal words (lifecycle-words port))))
      (when (eq scenario :retire)
        (pool-dispatch-check dispatcher nil :inactive 0 :retired)
        (is (equal '(2 2 nil) (lifecycle-words port)))))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-begin-real-writer-busy-keeps-claimed-and-both-generations
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (declare (ignorable controllers))
    (let ((link (pool-begin-claim dispatcher context ready table writers)))
      (lifecycle-queue-busy
       (arcdocdb.execution::writer-programmabile-queue (svref writers 0))
       (lambda ()
         (pool-begin-without-work
          (lambda () (pool-begin-refusal dispatcher port table writers
                                          'resource-exhausted :writer-queue-busy)))))
      (is (eq :claimed (arcdocdb.execution:stato-worker-writer context)))
      (is (eq :idle (arcdocdb.execution.series:stato-worker-serie link)))
      (is (zerop (arcdocdb.execution.series::collegamento-worker-serie-generation link)))
      (pool-begin-complete link (pool-begin-check dispatcher link :active nil) :a1 :idle))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-begin-real-serie-busy-returns-closing-with-explicit-close
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (let* ((link (pool-begin-claim dispatcher context ready table writers))
           (controller (svref controllers 0))
           (held (arcdocdb.series:acquisisci-controllore-serie controller))
           (controller-before (pool-dispatch-series-image controller))
           (queue (arcdocdb.execution::writer-programmabile-queue (svref writers 0)))
           (original (fdefinition 'arcdocdb.series:acquisisci-controllore-serie))
           (calls 0))
      (unwind-protect
           (let ((token
                   (pool-begin-without-work
                    (lambda ()
                      (pool-claim-function-fi
                       'arcdocdb.series:acquisisci-controllore-serie
                       (lambda (selected) (incf calls) (funcall original selected))
                       (lambda () (pool-begin-check dispatcher link :closing :serie-busy)))))))
             (is (= 1 calls))
             (is (eq :running (arcdocdb.execution:stato-worker-writer context)))
             (is (eq :closing (arcdocdb.execution.series:stato-worker-serie link)))
             (is (plusp (arcdocdb.execution.series::collegamento-worker-serie-writer-lease link)))
             (is (zerop (arcdocdb.execution.series::collegamento-worker-serie-series-lease link)))
             (is (= 1 (arcdocdb.execution::coda-writer-count queue)))
             (is (zerop (arcdocdb.execution::coda-writer-extracted queue)))
             (is (equalp controller-before (pool-dispatch-series-image controller)))
             (pool-begin-refusal dispatcher port table writers 'resource-exhausted :worker-state)
             (is (eq :schedule (arcdocdb.execution.series:termina-worker-serie link token)))
             (is (eq :reschedule (arcdocdb.execution:stato-worker-writer context)))
             (is (equalp controller-before (pool-dispatch-series-image controller))))
        (arcdocdb.series:rilascia-controllore-serie controller held))
      (pool-recycle-check dispatcher nil :published 1)
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-begin-complete link (pool-begin-check dispatcher link :active nil) :a1 :idle))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-begin-serie-generation-limit-returns-token-and-explicit-close
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (declare (ignorable port))
    (let* ((link (pool-begin-claim dispatcher context ready table writers))
           (controller (svref controllers 0))
           (saved (arcdocdb.series::controllore-serie-lease-generation controller))
           (queue (arcdocdb.execution::writer-programmabile-queue (svref writers 0))))
      (unwind-protect
           (progn
             ;; FI del limite, senza wrap o owner costruiti artificialmente.
             (setf (arcdocdb.series::controllore-serie-lease-generation controller)
                   most-positive-fixnum)
             (let* ((before (pool-dispatch-series-image controller))
                    (token (pool-begin-without-work
                            (lambda () (pool-begin-check dispatcher link :closing
                                                          :serie-lease-generation)))))
               (is (eq :closing (arcdocdb.execution.series:stato-worker-serie link)))
               (is (eq :running (arcdocdb.execution:stato-worker-writer context)))
               (is (null (arcdocdb.series::controllore-serie-owner controller)))
               (is (zerop (arcdocdb.execution.series::collegamento-worker-serie-series-lease link)))
               (is (= 1 (arcdocdb.execution::coda-writer-count queue)))
               (is (zerop (arcdocdb.execution::coda-writer-extracted queue)))
               (is (eq :schedule (arcdocdb.execution.series:termina-worker-serie link token)))
               (is (equalp before (pool-dispatch-series-image controller)))))
        (setf (arcdocdb.series::controllore-serie-lease-generation controller) saved))
      (pool-recycle-check dispatcher nil :published 1)
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-begin-complete link (pool-begin-check dispatcher link :active nil) :a1 :idle))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-begin-local-generation-limit-precedes-writer-and-serie-acquire
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (declare (ignorable controllers))
    (let* ((link (pool-begin-claim dispatcher context ready table writers))
           (saved (arcdocdb.execution.series::collegamento-worker-serie-generation link)))
      (unwind-protect
           (progn
             (setf (arcdocdb.execution.series::collegamento-worker-serie-generation link)
                   most-positive-fixnum)
             (pool-begin-refusal dispatcher port table writers
                                 'resource-exhausted :worker-serie-generation))
        (setf (arcdocdb.execution.series::collegamento-worker-serie-generation link) saved))
      (pool-begin-complete link (pool-begin-check dispatcher link :active nil) :a1 :idle))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-begin-binding-precedes-routing-and-any-acquisition
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (declare (ignorable controllers))
    (let* ((link (pool-begin-claim dispatcher context ready table writers))
           (other (arcdocdb.execution:crea-contesto-worker-writer ready))
           (bad-table (arcdocdb.execution.series::%make-tabella-worker-serie
                       other (arcdocdb.execution.series::tabella-worker-serie-registry table)
                       (arcdocdb.execution.series::tabella-worker-serie-links table)))
           (bad (arcdocdb.scheduler.dispatch::%make-dispatcher-writer-pool port bad-table)))
      (pool-claim-function-fi
       'arcdocdb.execution.series:collega-writer-worker-serie
       (lambda (routing) (declare (ignore routing)) (error \"Routing dopo binding errato.\"))
       (lambda ()
         (pool-claim-function-fi
          'arcdocdb.execution.series:inizia-worker-serie
          (lambda (selected) (declare (ignore selected)) (error \"Begin dopo binding errato.\"))
          (lambda () (pool-begin-refusal bad port table writers
                                          'invalid-argument :pool-dispatcher-binding)))))
      (is (eq :idle (arcdocdb.execution:stato-worker-writer other)))
      (pool-begin-complete link (pool-begin-check dispatcher link :active nil) :a1 :idle))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-begin-real-foreign-owner-precedes-binding-and-acquisitions
  (let ((worker (lifecycle-fixture-start t)) (dispatcher nil) (table nil) (writers nil)
        (left-file nil) (right-file nil))
    (unwind-protect
         (progn
           (lifecycle-call
            worker
            (lambda (owned)
              (multiple-value-bind (left resource) (pool-claim-series 87)
                (setf left-file resource)
                (multiple-value-bind (right resource) (pool-claim-series 88)
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
                  (ready (pool-claim-ready (lifecycle-fixture-context worker)))
                  (other (arcdocdb.execution:crea-contesto-worker-writer ready))
                  (bad-table (arcdocdb.execution.series::%make-tabella-worker-serie
                              other (arcdocdb.execution.series::tabella-worker-serie-registry table)
                              (arcdocdb.execution.series::tabella-worker-serie-links table)))
                  (bad (arcdocdb.scheduler.dispatch::%make-dispatcher-writer-pool port bad-table)))
             ;; FI quiescente: owner viene prima di binding e parole invalide.
             (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4)
             (pool-claim-function-fi
              'arcdocdb.execution.series:inizia-worker-serie
              (lambda (selected) (declare (ignore selected)) (error \"Begin da owner straniero.\"))
              (lambda () (pool-begin-refusal bad port table writers
                                              'invalid-argument :pool-worker-owner)))
             (setf (arcdocdb.scheduler::porta-worker-pool-request port) 1))
           (lifecycle-call
            worker
            (lambda (owned)
              (declare (ignore owned))
              (let ((link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)))
                (pool-begin-complete link (pool-begin-check dispatcher link :active nil) :a1 :idle))
              :ok)))
      (when left-file
        (lifecycle-call worker (lambda (owned) (declare (ignore owned))
                                 (when right-file (arcdocdb.io:chiudi right-file))
                                 (arcdocdb.io:chiudi left-file) :ok)))
      (lifecycle-fixtures-stop (list worker)))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-begin-six-wrong-phases-preserve-capacities-and-prior-fault
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable controllers))
    (flet ((refuse () (pool-begin-refusal dispatcher port table writers
                                           'resource-exhausted :worker-state)))
      (refuse)
      (let* ((link (pool-begin-claim dispatcher context ready table writers))
             (token (pool-begin-check dispatcher link :active nil)))
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
        (refuse)
        (pool-recycle-check dispatcher nil :published 1)
        (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
        (pool-begin-complete link (pool-begin-check dispatcher link :active nil) :a2 :idle))
      ;; FI diagnostica quiescente per la sesta fase, senza resettare un fault.
      (let ((original (make-condition 'invariant-violation :reason :worker-state)))
        (setf (arcdocdb.execution::contesto-worker-writer-state context) :faulted
              (arcdocdb.execution::contesto-worker-writer-fault context) original)
        (refuse)
        (is (eq original (arcdocdb.execution:errore-worker-writer context)))))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-begin-routing-fault-precedes-begin-and-preserves-original-condition
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable ready))
    (let* ((unknown (pool-claim-writer '(:unknown) 2))
           (writer-before (arcdocdb.execution.tests::handoff-fi-snapshot unknown))
           (series-before (map 'list #'pool-dispatch-series-image controllers))
           (links-before (map 'list #'pool-dispatch-link-image
                              (arcdocdb.execution.series::tabella-worker-serie-links table))))
      (is (null (arcdocdb.execution:adotta-writer-worker context unknown 0)))
      (let ((condition
              (pool-claim-function-fi
               'arcdocdb.execution.series:inizia-worker-serie
               (lambda (selected) (declare (ignore selected)) (error \"Begin dopo routing errato.\"))
               (lambda ()
                 (arcdocdb.execution.tests::worker-capture-condition
                  (lambda () (arcdocdb.scheduler.dispatch:inizia-obbligo-pool dispatcher))
                  'invariant-violation :worker-serie-routing)))))
        (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
        (is (eq unknown (arcdocdb.execution:writer-worker-writer context)))
        (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
        (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
        (is (zerop (arcdocdb.execution::contesto-worker-writer-pending context)))
        (is (equalp writer-before (arcdocdb.execution.tests::handoff-fi-snapshot unknown)))
        (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
        (is (equalp links-before (map 'list #'pool-dispatch-link-image
                                     (arcdocdb.execution.series::tabella-worker-serie-links table))))
        (is (equal '(1 1 nil) (lifecycle-words port)))
        (pool-begin-refusal dispatcher port table writers 'resource-exhausted :worker-state)
        (is (eq condition (arcdocdb.execution:errore-worker-writer context)))))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-begin-real-writer-not-ready-propagates-c1-fault-eq
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (let ((link (pool-begin-claim dispatcher context ready table writers)))
      ;; FI tramite bypass pubblico: la fixture consuma il writer gia assegnato.
      (is (equal '(:a1) (arcdocdb.execution.tests::handoff-drain (svref writers 0) 1)))
      (let* ((series-before (map 'list #'pool-dispatch-series-image controllers))
             (writer-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0)))
             (condition
               (arcdocdb.execution.tests::worker-capture-condition
                (lambda () (arcdocdb.scheduler.dispatch:inizia-obbligo-pool dispatcher))
                'resource-exhausted :writer-not-ready)))
        (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
        (is (eq :faulted (arcdocdb.execution.series:stato-worker-serie link)))
        (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
        (is (eq condition (arcdocdb.execution.series:errore-worker-serie link)))
        (is (eq (svref writers 0) (arcdocdb.execution:writer-worker-writer context)))
        (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
        (is (zerop (arcdocdb.execution.series::collegamento-worker-serie-generation link)))
        (is (equalp writer-before
                    (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
        (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
        (pool-begin-refusal dispatcher port table writers 'resource-exhausted :worker-state)
        (is (eq condition (arcdocdb.execution:errore-worker-writer context)))))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-begin-unexpected-serie-acquire-keeps-c1-capacity-and-condition-eq
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (let* ((link (pool-begin-claim dispatcher context ready table writers))
           (writer (svref writers 0))
           (queue (arcdocdb.execution::writer-programmabile-queue writer))
           (series-before (map 'list #'pool-dispatch-series-image controllers))
           (original (make-condition 'arcdocdb.conditions:io-fault
                                     :reason :pool-begin-acquire :operation :series))
           (writer-lease nil) (calls 0))
      (unwind-protect
           (progn
             ;; FI di errore nel secondo acquire, dopo la vera lease writer.
             (let ((caught
                     (pool-claim-function-fi
                      'arcdocdb.series:acquisisci-controllore-serie
                      (lambda (selected) (declare (ignore selected))
                        (incf calls) (error original))
                      (lambda ()
                        (arcdocdb.execution.tests::worker-capture-condition
                         (lambda () (arcdocdb.scheduler.dispatch:inizia-obbligo-pool dispatcher))
                         'arcdocdb.conditions:io-fault :pool-begin-acquire)))))
               (setf writer-lease
                     (arcdocdb.execution.series::collegamento-worker-serie-writer-lease link))
               (is (= 1 calls)) (is (eq original caught))
               (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
               (is (eq :faulted (arcdocdb.execution.series:stato-worker-serie link)))
               (is (eq original (arcdocdb.execution:errore-worker-writer context)))
               (is (eq original (arcdocdb.execution.series:errore-worker-serie link)))
               (is (eq writer (arcdocdb.execution:writer-worker-writer context)))
               (is (plusp writer-lease))
               (is (= writer-lease (arcdocdb.execution::contesto-worker-writer-lease context)))
               (is (plusp (arcdocdb.execution.series::collegamento-worker-serie-generation link)))
               (is (zerop (arcdocdb.execution.series::collegamento-worker-serie-series-lease link)))
               (is (eq :running (arcdocdb.execution::writer-programmabile-state writer)))
               (is (= 1 (arcdocdb.execution::coda-writer-count queue)))
               (is (zerop (arcdocdb.execution::coda-writer-extracted queue)))
               (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
               (is (equal '(1 1 nil) (lifecycle-words port)))
               (pool-begin-refusal dispatcher port table writers 'resource-exhausted :worker-state)
               (is (eq original (arcdocdb.execution:errore-worker-writer context)))))
        ;; Cleanup soltanto della lease reale della fixture; C1 e bridge restano FAULTED.
        (when writer-lease
          (is (eq :schedule (arcdocdb.execution:termina-tratto-writer writer writer-lease))))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-begin-invalid-dispatcher-type-preserves-fixture
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable dispatcher context ready controllers))
    (let ((before (pool-dispatch-image port table writers)))
      (signals type-error
        (funcall (fdefinition 'arcdocdb.scheduler.dispatch:inizia-obbligo-pool) :invalid))
      (is (equalp before (pool-dispatch-image port table writers))))))
")
  (:PATH #A((29) BASE-CHAR . "tools/measure-pool-begin.lisp") :BYTES 18722 :SHA256
   "f572b29c9566c9ab282ef804c8136367beb574c7b57bee4a570bae961cb5c732" :GIT-BLOB
   "e3094d9f35efdaa647751f19a7acda00c36d515a" :TEXT
   ";;;; C4: begin composto ACTIVE con doppia lease e protocollo C1 esplicito di ripetizione.
;;;; Cinque fixture: 4096 cicli +128 warmup; un payload simbolico conservato senza pop nel clock.
;;;; Factory/claim iniziale/GC/drain finale fuori clock; nessun reset privato o consumo finto.
;;;; Il costo comprende end bridge, recycle room, claim C1 e oracoli scalari.
;;;; --self-test | --bench directory-nuova/. Feature: :arcdocdb-pool-begin-measure-library.
;;; REQ: REQ-CON-005 REQ-AFF-008 REQ-THR-001 REQ-BEN-001 REQ-BEN-002
;;; OWNER: dispatcher, contesto, link e sensore allo stesso thread C4.
;;; SHARED: ready/controller autentici privati alla fixture; nessun altro owner nel clock.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require :asdf)
  (unless (find-package \"ARCDOCDB.POOL-LIFECYCLE.MEASURE\")
    (let ((*features* (cons :arcdocdb-pool-lifecycle-measure-library *features*)))
      (load \"tools/measure-pool-lifecycle.lisp\"))))
(defpackage #:arcdocdb.pool-begin.measure
  (:use #:cl)
  (:import-from #:arcdocdb.pool-lifecycle.measure
                #:lookup-function #:sample #:sample-record #:acquire-directory #:write-report
                #:load-product #:+iterations+ #:+warmup+ #:+replicas+))
(in-package #:arcdocdb.pool-begin.measure)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

(defun fingerprints ()
  \"Stabilita: biblioteca, questo sensore e tutti i sorgenti/test prodotto.\"
  (append (arcdocdb.pool-lifecycle.measure::fingerprints)
          (list (list :file \"tools/measure-pool-begin.lisp\"
                      :md5 (format nil \"~(~{~2,'0X~}~)\"
                                   (coerce (sb-md5:md5sum-file \"tools/measure-pool-begin.lisp\") 'list))))))
(defun api (name &optional (package \"ARCDOCDB.SCHEDULER.DISPATCH\"))
  \"Risolve API pubbliche prima del clock, senza ricerca nomi nel tratto misurato.\"
  (multiple-value-bind (symbol visibility) (find-symbol name package)
    (unless (and symbol (eq :external visibility) (fboundp symbol))
      (error \"COD-60: API pubblica ~A/~A assente.\" package name))
    (symbol-function symbol)))
(defun make-series ()
  \"Backend pubblico C4 locale, nessun I/O nel protocollo C1 della campagna.\"
  (let* ((backend (funcall (api \"MAKE-BACKEND\" \"ARCDOCDB.IO\")
                           (lambda (path mode) (declare (ignore path mode)) 813)
                           (lambda (&rest arguments) (declare (ignore arguments))
                             (error \"COD-60: lettura I/O inattesa nella fixture recycle.\"))
                           (lambda (fd bytes start count) (declare (ignore fd bytes start)) count)
                           (lambda (fd) (declare (ignore fd)) 0)
                           (lambda (fd) (declare (ignore fd)) 0)
                           (lambda (fd) (declare (ignore fd)) 0)))
         (file (funcall (api \"CREA-TEMPORANEO\" \"ARCDOCDB.IO\") \"pool-begin-C4.tmp\" :backend backend))
         (log (funcall (api \"CREA-LOG-IO\" \"ARCDOCDB.WAL\") file :segment 813)))
    (values (funcall (api \"CREA-CONTROLLORE-SERIE\" \"ARCDOCDB.SERIES\")
                     (funcall (api \"CREA-REGISTRO-CSN\" \"ARCDOCDB.CSN\") :capacity 4) log :capacity 2)
            file)))
(defun make-fixture ()
  \"Un payload reale persistente, writer/Serie singoli e ready capacity1; claim fuori clock.\"
  (multiple-value-bind (controller file) (make-series)
    (let* ((ready (funcall (api \"CREA-LISTA-WRITER-PRONTI\" \"ARCDOCDB.EXECUTION\") :shards 1 :capacity 1))
           (context (funcall (api \"CREA-CONTESTO-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\") ready))
           (port (funcall (api \"CREA-PORTA-WORKER-POOL\" \"ARCDOCDB.SCHEDULER\") context))
           (writer (funcall (api \"CREA-WRITER-PROGRAMMABILE\" \"ARCDOCDB.EXECUTION\")
                            :capacity 1 :quantum 1 :routing-index 0))
           (registry (funcall (api \"CREA-REGISTRO-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\")
                              (vector writer) (vector controller)))
           (table (funcall (api \"CREA-TABELLA-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\") context registry))
           (links (funcall (lookup-function \"TABELLA-WORKER-SERIE-LINKS\" \"ARCDOCDB.EXECUTION.SERIES\") table))
           (dispatcher (funcall (api \"CREA-DISPATCHER-WRITER-POOL\") port table)))
      (multiple-value-bind (count action)
          (funcall (api \"ACCODA-LAVORO-WRITER\" \"ARCDOCDB.EXECUTION\") writer :begin-C4)
        (unless (and (= 1 count) (eq :schedule action)) (error \"COD-60: preload iniziale difforme.\")))
      (unless (= 1 (funcall (api \"PUBBLICA-WRITER-PRONTO\" \"ARCDOCDB.EXECUTION\") ready 0 writer))
        (error \"COD-60: pubblicazione iniziale difforme.\"))
      (multiple-value-bind (actual status cursor)
          (funcall (api \"PRENDI-WRITER-WORKER\" \"ARCDOCDB.EXECUTION\") context)
        (unless (and (eq writer actual) (eq :claimed status) (zerop cursor))
          (error \"COD-60: claim iniziale difforme.\")))
      (values dispatcher context writer (svref links 0) file))))
(defun verify-begin (begin dispatcher expected token status reason)
  \"Oracolo scalare indipendente dei quattro risultati; il token verificato viene usato per end.\"
  (multiple-value-bind (link actual-token actual-status actual-reason) (funcall begin dispatcher)
    (unless (and (eq expected link) (eql token actual-token)
                 (eq status actual-status) (eq reason actual-reason))
      (error \"COD-60: begin ~S/~S/~S/~S invece di ~S/~S/~S/~S.\"
             link actual-token actual-status actual-reason expected token status reason))
    actual-token))
(defun drain-fixture (dispatcher context writer link file expected-token)
  \"Fuori clock: begin/pop/ack/end del bridge drena l'unico payload, senza abbandonare lease.\"
  (unwind-protect
       (let* ((target (vector nil))
              (token (verify-begin (api \"INIZIA-OBBLIGO-POOL\") dispatcher link expected-token :active nil)))
         (multiple-value-bind (count status batch)
             (funcall (api \"PRELEVA-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\") link token target 0 1)
           (unless (and (= 1 count) (eq :messages status) (plusp batch) (eq :begin-C4 (svref target 0)))
             (error \"COD-60: drain perde payload/count/token.\"))
           (funcall (api \"CONFERMA-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\") link token batch))
         (unless (and (eq writer (funcall (api \"WRITER-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\") context))
                      (eq :idle (funcall (api \"TERMINA-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\") link token))
                      (eq :idle (funcall (api \"STATO-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\") context))
                      (eq :idle (funcall (api \"STATO-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\") link)))
           (error \"COD-60: drain non conclude IDLE con entrambe le lease rilasciate.\")))
    (funcall (api \"CHIUDI\" \"ARCDOCDB.IO\") file)))
(defun create-active-cycle ()
  \"ACTIVE con due lease, end senza pop, pubblicazione room e claim espliciti; token47.\"
  (multiple-value-bind (dispatcher context writer link file) (make-fixture)
    (let ((begin (api \"INIZIA-OBBLIGO-POOL\"))
          (end (api \"TERMINA-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\"))
          (recycle (api \"RICIRCOLA-WORKER\" \"ARCDOCDB.EXECUTION\"))
          (claim (api \"PRENDI-WRITER-WORKER\" \"ARCDOCDB.EXECUTION\"))
          (state (api \"STATO-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\"))
          (read-writer (api \"WRITER-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\"))
          (link-state (api \"STATO-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\"))
          (series-lease (api \"LEASE-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\"))
          (worker-lease (lookup-function \"CONTESTO-WORKER-WRITER-LEASE\" \"ARCDOCDB.EXECUTION\"))
          (cursor (lookup-function \"CONTESTO-WORKER-WRITER-CURSOR\" \"ARCDOCDB.EXECUTION\"))
          (generation 0))
      (values
       (lambda ()
         (declare (type fixnum generation))
         (let ((token (verify-begin begin dispatcher link (incf generation) :active nil)))
           (unless (and (eq :active (funcall link-state link))
                        (eq :running (funcall state context))
                        (eq writer (funcall read-writer context))
                        (plusp (funcall worker-lease context))
                        (plusp (funcall series-lease link token))
                        (zerop (funcall cursor context)))
             (error \"COD-60: ACTIVE senza doppia lease o binding/cursore coerente.\"))
           (unless (and (eq :schedule (funcall end link token))
                        (eq :idle (funcall link-state link))
                        (eq :reschedule (funcall state context)))
             (error \"COD-60: end senza pop perde l'obbligo reale.\")))
         (multiple-value-bind (actual action count) (funcall recycle context)
           (unless (and (null actual) (eq :published action) (= 1 count))
             (error \"COD-60: ricircolo room del ciclo difforme.\")))
         (multiple-value-bind (actual status next) (funcall claim context)
           (unless (and (eq writer actual) (eq :claimed status) (zerop next)
                        (eq :claimed (funcall state context))
                        (eq :idle (funcall link-state link)))
             (error \"COD-60: claim esplicito non ripristina il ciclo.\")))
         47)
       47 (lambda () (drain-fixture dispatcher context writer link file (1+ generation)))))))
(defun campaign-group (name maker report checkpoint)
  \"Nuova fixture per ciascuna replica: generation indipendente e cleanup sempre fuori clock.\"
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
  \"Un costo composto preregistrato: begin doppia lease e protocollo esplicito C1.\"
  (campaign-group :active #'create-active-cycle report checkpoint)
  (setf (getf report :current-replica) nil) report)
(defun make-report ()
  \"Raw e limiti: nessun payload applicato nel clock, un reale payload drenato a fine fixture.\"
  (list :schema-version 1 :kind :pool-begin-benchmark :status :running :stage :pending
        :diagnostic nil :process-argv sb-ext:*posix-argv* :tool-arguments (uiop:command-line-arguments)
        :source-fingerprints-before (fingerprints) :source-fingerprints-after nil
        :source-consistency :pending :recorded-at (get-universal-time) :self-test nil
        :samples nil :current-replica nil :sbcl (lisp-implementation-version)
        :machine (machine-type) :os (software-type) :os-version (software-version) :safety 3
        :iterations +iterations+ :warmup +warmup+ :replicas +replicas+
        :timer-units-per-second internal-time-units-per-second
        :campaigns '((:active :shards 1 :ring-capacity 1 :writers 1 :writer-capacity 1
                     :payloads-per-writer 1 :quantum 1 :begin-api-per-cycle 1 :end-bridge-per-cycle 1
                     :recycle-c1-per-cycle 1 :claim-c1-per-cycle 1 :pop-in-clock 0
                     :monotone-expected-token t :double-lease-positive-oracle t :token 47))
        :token-formula \"sample=N*cycle-token+N*(N-1)/2; ACTIVE=47\"
        :limits '(:fresh-fixture-per-replica :preallocated-product-and-inputs
                  :startup-claim-gc-and-final-drain-excluded :public-bounded-bridge-drain-after-clock
                  :c1-protocol-and-scalar-oracles-in-clock :not-isolated-wrapper-throughput
                  :one-real-payload-preserved-in-clock :end-without-pop-is-legal-no-batch-debt
                  :counter-not-absolute-nonallocation-proof :external-load-uncontrolled
                  :clock-zero-is-below-resolution :no-time-threshold-no-tuning-claim
                  :no-io-pop-ack-or-payload-application-in-clock
                  :active-only-not-closing-or-refusal-latency :no-concurrent-coordinator
                  :no-physical-worker-lifecycle-qualification)))
(defun run-driver (args &key (product-loader #'load-product) (tester #'self-test) (runner #'campaign))
  \"Driver begin compatto; riusa I/O esclusivo e sensore qualificati, preserva raw del fallimento.\"
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
  \"Tutti e quattro i risultati difformi rifiutati; anche CLOSING ha un oracolo positivo.\"
  (dolist (row '((:wrong 1 :active nil) (:link 2 :active nil)
                 (:link 1 :closing nil) (:link 1 :active :serie-busy)))
    (unless (handler-case
                (progn (verify-begin (lambda (dispatcher) (declare (ignore dispatcher)) (values-list row))
                                     nil :link 1 :active nil) nil)
              (error () t))
      (error \"COD-60: risultato begin difforme non respinto: ~S.\" row)))
  (unless (= 7 (verify-begin (lambda (dispatcher) (declare (ignore dispatcher))
                              (values :link 7 :closing :serie-busy))
                            nil :link 7 :closing :serie-busy))
    (error \"COD-60: oracolo CLOSING perde il token originale.\"))
  :passed)
(defun self-test ()
  \"Sensore condiviso heap/sink/clock/partial, quattro risultati e doppia lease reale con drain.\"
  (list :status :ok :shared-sensor (arcdocdb.pool-lifecycle.measure::self-test)
        :begin-oracles (self-test-oracle) :begin-cli-and-partial-raw (self-test-reporter)
        :active (arcdocdb.pool-lifecycle.measure::self-test-composed #'create-active-cycle)))
(defun main ()
  \"Rapporto leggibile; errore nonzero anche per fonte cambiata o heap osservato positivo.\"
  (let ((report (run-driver (uiop:command-line-arguments))))
    (let ((*print-readably* t)) (write report :pretty t) (terpri))
    (unless (eq :ok (getf report :status))
      (format *error-output* \"~&tools/measure-pool-begin.lisp: ~A~%\" (getf report :diagnostic))
      (uiop:quit 1))))
(unless (member :arcdocdb-pool-begin-measure-library *features*) (main))
")
  (:PATH #A((34) BASE-CHAR . "docs/implementazione/pool-begin.md") :BYTES 3144 :SHA256
   "c3ca973e76cea42038adc378fcedb61c7688d50228eaac38821c245b7ed60b5e" :GIT-BLOB
   "e0e62896ea19af459f528060672729864f27133a" :TEXT "# Avvio dell'obbligo pool sulla Serie

`arcdocdb.scheduler.dispatch:inizia-obbligo-pool` avvia esplicitamente un
obbligo CLAIMED gia acquisito dal [dispatcher](pool-dispatch.md), dal
[ricircolo full](pool-recycle.md) o dalle API execution. Incremento C3 di
REQ-THR-001, REQ-CON-001/002/004/005 e REQ-AFF-008; non modifica sorgenti C1.
Il [metodo preregistrato](pool-begin-metodo.md) delimita le verifiche.

## Contratto

Owner corrente, assenza di rientranza, worker CLAIMED e link associato IDLE.
L'API verifica porta, owner, tabella e contesto come gli altri ingressi;
seleziona il link del writer attuale tramite il routing verificato e chiama
una sola volta `inizia-worker-serie`. Restituisce quattro valori:

| Valore | Significato |
|---|---|
| link | Collegamento preallocato selezionato sul CLAIMED corrente. |
| token | Token del nuovo tratto, valido soltanto con quel link. |
| fase | `:active` oppure `:closing`, originale del bridge. |
| ragione | NIL, `:serie-busy` o `:serie-lease-generation`, originale del bridge. |

Con ACTIVE il caller puo usare il bridge per lease, pop, conferma e fine.
Con CLOSING conserva link e token e chiama esplicitamente
`termina-worker-serie`: non puo fare pop o ritentare l'acquisizione della
Serie. L'esaurimento della generazione richiede gestione della risorsa,
senza riprogrammazione indefinita. Nessun cleanup viene aggiunto.

Writer-busy segnala la condizione originale, lascia il worker CLAIMED e
il link IDLE e non consuma un token del bridge; il caller conserva l'obbligo
e decide un successivo tentativo. Fasi errate, fault e guasti inattesi
mantengono le classificazioni e le capacita delle barriere C1. Un routing
fallito precede il begin; un errore durante begin non annulla acquisizioni
gia riuscite. La medesima condizione viene propagata senza handler C3.
Su un errore inatteso dopo acquisizione non sono restituiti i quattro
valori: riferimenti, capacita e diagnosi restano nel contesto e nel link C1,
per il coordinamento dell'Archivio. Il caller conserva i link gia ottenuti
da claim/recycle; dopo adozione puo selezionarli prima con
`collega-obbligo-pool`. Non viene promessa una nuova via di chiusura dopo
un fault terminale.

La nuova API ricalcola il link ad ogni ingresso: dopo full usa il nuovo
writer, senza accettare dal caller un link del tratto precedente. Non crea
un'obbligazione, non chiama claim o recycle, non legge comandi pool e non
conferma il ritiro. Inattivazione, ritiro pendente o parole lifecycle
incoerenti non impediscono il completamento di un obbligo esistente.

## Costo e ambito

Il passo e O(1): binding EQ, routing per ordinale e un tentativo di doppia
lease della sola Serie. Nessuna nuova allocazione intenzionale, scansione,
scrittura condivisa tra Serie, callback, I/O, thread o attesa. Il costo delle
barriere C1 resta incluso; non si rivendicano prestazioni del solo adapter.

Nuova presa, ricircolo e avvio restano ingressi distinti. Non sono introdotti
loop server, applicazione dei payload, admission, sensori, park/wake,
avvio/arresto fisico o coordinamento Archivio. I protocolli durevoli e i
gate del motore completo restano invariati.
")
  (:PATH #A((41) BASE-CHAR . "docs/implementazione/pool-begin-metodo.md") :BYTES 2922 :SHA256
   "70308477c656e8fa44334e14aac68458f9345c38feb988be939e5d61c042b7ac" :GIT-BLOB
   "0a74eac283903d32bb75e108e95a06462a7f91bd" :TEXT "# Metodo dell'avvio pool/Serie

Preregistrazione del 2026-10-14, base
`ad829a40f6ce72837b59982d2e4f83e8c9ca9f3e`, prima delle campagne formali.
Scope C3: tutti i sei file di `src/dispatch/`, inclusi `begin.lisp` e i cinque
gia qualificati. Nessuna modifica C1; [contratto](pool-begin.md).

## Prove funzionali e revisione

- Avvio reale: link/token/fase/ragione, doppia lease, pop/ack/end espliciti.
- Scambio full A→B: begin del link B corrente, mai del precedente A.
- CLAIMED con porta inattiva, ritiro pendente o comandi incoerenti: nessun
  accesso al gate, ACK, seconda presa o ricircolo.
- Writer busy reale: CLAIMED, IDLE e generazione del bridge conservati.
- Serie busy e generazione esaurita: CLOSING con token, nessun pop o
  riacquisizione; fine esplicita attraverso il bridge originale.
- Generazione del token bridge esaurita: rifiuto prima del begin, distinto
  dall'esaurimento della lease Serie successivo alla presa del writer.
- Owner estraneo e binding incoerente prima di routing e acquisizione.
- Fasi non ammesse, debito, lease e prima causa conservati; routing
  invalido e guasti di begin propagano la condizione C1 originale.
- Una lettura indipendente C3 con lista di controllo; compilazione strict,
  safety 3, lint, tracciabilita e regressione completa.

## Copertura, misura e conservazione

Gate C3 almeno 95% di espressioni e rami sull'intero package, senza
esclusioni manuali. Conservare SB-COVER nativo, HTML e audit concordante,
con denominatori e tutti i missing; nessuna deduzione MC/DC o qualifica C1.
Il reader C4 verificato viene riusato con adattamento esplicito di scope.

Sensore locale con cinque repliche di 4096 cicli e 128 warmup. Fixture,
factory, lookup API e GC fuori clock. Un ciclo comprende l'avvio del bridge
e la fine esplicita, ricircolo e nuova presa execution necessari per
ripetere il tratto; i quattro risultati e le identita entrano nell'oracolo.
Nessun reset privato, callback o applicazione dei payload. Il protocollo C1
fa parte del costo: nessuna attribuzione al solo adapter o conclusione sul
throughput del motore. Conservare cicli completati, sink, tick e heap;
heap zero osservato non dimostra non allocazione universale.

Unica campagna ACTIVE: un payload simbolico reale rimane accodato, senza
pop nel clock. Il drain finale fuori clock lo consuma e conferma attraverso
il bridge, poi termina entrambe le lease. CLOSING e i rifiuti busy sono
coperti dalle prove funzionali e non vengono misurati dal sensore.

Self-test positivi e negativi del sensore: ritorni errati, sink, clock sotto
risoluzione, allocazione deliberata, CLI, raw parziali e destinazione
preesistente. Carico esterno incontrollato; nessuna soglia o taratura.
Campagne su copia congelata con `record-command.lisp` e cache dedicate:
argv, output, exit e identita iniziali/finali. Conservare anche fallimenti
e versioni preliminari, copie byte per byte e nuovi manifesti esclusivi.
")
  (:PATH #A((44) BASE-CHAR . "docs/implementazione/pool-begin-revisione.md") :BYTES 11803 :SHA256
   "1b58c2b2bc903dfc9035a356e54cde82fed2f3855a326bf561835af771e215fb" :GIT-BLOB
   "10b9ab81741576c65c7862093f0cdc88d1c61de8" :TEXT "# Revisione indipendente dell'avvio pool/Serie

Lettura statica del 2026-10-14, base
`ad829a40f6ce72837b59982d2e4f83e8c9ca9f3e`, eseguita da un agente diverso
dall'autore. Esito: **positivo per lo scope C3 letto**, senza rilievi aperti
sul prodotto. Il revisore ha modificato soltanto questo documento e non ha
eseguito le campagne: la lettura non attesta compilazione, test, copertura
o allocazioni.

Il quadro applicato comprende [ADR-0031](../adr/0031-software-critico-criteri-e-priorita.md),
[ADR-0034](../adr/0034-policy-di-compilazione-e-standard-di-codifica.md),
[ADR-0045](../adr/0045-modello-di-esecuzione.md) e lo
[standard di codifica](../affidabilita/standard-di-codifica.md).
Sono stati letti il [contratto](pool-begin.md), il
[metodo preregistrato](pool-begin-metodo.md), tutti i sei sorgenti dispatch,
l'ordine ASDF, le quattordici nuove prove e il sensore C4. La lettura delle
barriere C1 di routing, worker e bridge completa quella del componente C3;
non ne sostituisce le revisioni o le verifiche di classe.

## Identità dello scope

Il denominatore di qualificazione comprende tutti i sei file dispatch,
senza esclusioni manuali e senza limitarsi alle righe nuove. I risultati
devono conservare anche i conteggi per file e i missing del nuovo ingresso.
Le sonde dei delegati C1 non entrano nel denominatore C3; nessuna copertura
o equivalenza MC/DC è dedotta dai tipi o dalla lettura.

| Fonte letta | SHA-256 |
|---|---|
| `src/dispatch/package.lisp` | `34ecf62cd625f8af0a884d713563338c88635afd88fd0eaa0ab8ba43d5f19486` |
| `src/dispatch/types.lisp` | `cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720` |
| `src/dispatch/build.lisp` | `c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5` |
| `src/dispatch/claim.lisp` | `224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682` |
| `src/dispatch/recycle.lisp` | `9fa3294cd28d1904cfb8db5153f93188b02f1bfbaf1800dad788731007c29ad0` |
| `src/dispatch/begin.lisp` | `4ae4bf8f6b7afe53af099a4b37ad75d253c05077f0cc7fbe39f4f1cab9f89a8d` |
| `arcdocdb.asd` | `c9f2d60f0e73f1d951504da145b192584300a161cfd4df90984536fa9a34ec53` |
| `tests/scheduler/pool-begin.lisp` | `ecb295cc76e3308f6e12e7a28b0fb46d517043709bffdac565ef8cbfd866b044` |
| `tools/measure-pool-begin.lisp` | `f572b29c9566c9ab282ef804c8136367beb574c7b57bee4a570bae961cb5c732` |
| `docs/implementazione/pool-begin.md` | `c3ca973e76cea42038adc378fcedb61c7688d50228eaac38821c245b7ed60b5e` |
| `docs/implementazione/pool-begin-metodo.md` | `70308477c656e8fa44334e14aac68458f9345c38feb988be939e5d61c042b7ac` |

Le barriere delegate determinanti per il nuovo ingresso sono invariate:

| Fonte C1 | SHA-256 |
|---|---|
| `src/series/routing-select.lisp` | `796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a` |
| `src/series/worker-run.lisp` | `f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f` |
| `src/series/worker-boundary.lisp` | `793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73` |
| `src/series/worker-types.lisp` | `a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a` |
| `src/execution/worker-claim.lisp` | `62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e` |
| `src/execution/worker-boundary.lisp` | `4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a` |

Queste impronte identificano i byte letti. I record delle campagne devono
verificarne l'identità con la copia congelata; la tabella non è un risultato
di esecuzione.

## Avvio e conservazione delle capacità

`inizia-obbligo-pool` non accetta un link dal caller. Verifica prima il
binding immutabile porta/tabella con gli stessi controlli degli altri
ingressi: tipo porta, owner, tipo tabella e identità EQ dei contesti.
Il successivo routing richiede il CLAIMED completo e seleziona il link IDLE
del writer attuale, tramite ordinale e identità. Dopo scambio full o
adozione non può quindi selezionare il link del tratto precedente.

Il codice chiama una sola `inizia-worker-serie` e inoltra link, token,
fase e ragione. Non introduce decisioni, controlli o handler dopo il begin:
nessun nuovo rifiuto C3 può separare una normale acquisizione riuscita
dalla consegna del token. I tre risultati del bridge mantengono il loro
contratto C1; il caller gestisce ACTIVE e CLOSING con le API esplicite.
Gli oracoli negativi del sensore verificano il sensore, senza attribuire
al prodotto una nuova validazione dei ritorni C1 fuori contratto.

Writer busy conserva CLAIMED e link IDLE senza consumare la generazione
del bridge. Serie busy ed esaurimento della lease Serie restituiscono
CLOSING con token corrente: il caller chiude esplicitamente, senza pop o
nuova acquisizione. Il limite del token bridge è distinto e viene rifiutato
prima della lease writer. Nessuna ragione permanente autorizza retry
indefiniti, reset delle generazioni o wrap.

Un routing invalido precede il begin. Gli errori successivi conservano
la stessa condizione e le capacità secondo le barriere C1, senza rollback
o nuovo fault marking C3. Un errore inatteso dopo l'acquisizione non
restituisce i quattro valori: contesto e link preallocato conservano la
diagnosi e gli eventuali riferimenti/lease per il coordinamento Archivio.
Il caller mantiene i link già ottenuti; dopo adozione può selezionarli prima
con `collega-obbligo-pool`. Non viene introdotta una chiusura del fault.

Il nuovo ingresso non legge request/ack/active e non chiama gate, claim o
ricircolo. Porta inattiva, ritiro pendente o parole pool incoerenti non
revocano l'obbligo esistente. Il ritiro resta applicabile soltanto dalla
presa esplicita sul contesto IDLE, dopo aver concluso tutti gli obblighi.

## Lista di controllo

I dodici punti C1 sono impiegati come controllo aggiuntivo nel singolo
passaggio C3 previsto da ADR-0031.

| Punto | Valutazione statica e limite |
|---|---|
| 1. Requisiti e ADR | REQ-THR-001, REQ-CON-001/002/004/005 e REQ-AFF-008 indicati; avvio di un compito per Serie senza thread dedicato o attesa, coerente con ADR-0045 §6/8. Il pool completo resta aperto. |
| 2. Invarianti | Binding prima di routing e acquisizione; CLAIMED corrente e link IDLE verificati dal C1; un solo begin, tutti i quattro risultati inoltrati. Le capacità non vengono duplicate né abbandonate da cleanup impliciti. |
| 3. Errori | Ragioni binding/owner riusate; fase, busy e generazioni delegate senza riclassificazione. La condizione originale attraversa C3 senza handler o sostituzione della prima causa. |
| 4. Limiti | Nessun ciclo, ricorsione, retry o attesa nuovo. Controlli EQ, routing e tentativo di doppia lease sono O(1); nessuna scansione ready, Serie o callback. |
| 5. Allocazione | Nessun costruttore, lista, closure, hash o nuovo stato sul percorso caldo. Zero heap richiede la misura separata e non deriva dalla sintassi del wrapper. |
| 6. Risultati | Token, fase e ragione vengono inoltrati integralmente con il link selezionato; CLOSING non perde il token. Nessun risultato di errore viene ignorato o trasformato in successo. |
| 7. Decisioni | Nuova funzione: 14 righe di defun, complessità 1. Binding 5, factory 2, claim 5, lookup 1 e ricircolo 5 con guardia 2 restano entro i limiti; nessuna nuova decisione composta C1. |
| 8. Proprietà | Dispatcher, contesto, tabella e link del thread creatore, non rientranti; riferimenti del dispatcher read-only. Nessuna struttura condivisa o variabile globale mutabile nuova. |
| 9. Tracciabilità | REQ su definizione e quattordici prove; export e caricamento ASDF dopo recycle e routing corretti. Build strict, lint, trace e regressione completa restano verifiche di processo separate. |
| 10. Standard | Safety 3, ftype, docstring, OWNER e SHARED espliciti. Nessun handler generico, ignore-errors, macro nuova, controllo C1 rimosso o deviazione individuata nel prodotto. |
| 11. Parallelismo | Si acquisiscono soltanto il writer e la propria Serie per tratto, senza lock o scrittura globale fra Serie per messaggio. La lettura non dimostra scalabilità o assenza di starvation. |
| 12. Durabilità | Il nuovo codice non modifica payload, CSN, file o protocolli durevoli. Le lease sono capacità in memoria; nessuna nuova atomicità persistente o eliminazione. |

## Lettura delle prove

Le quattordici nuove prove sono state lette senza eseguirle. I casi di
contesa usano le vere primitive; le FI sono quiescenti, dichiarate e
ripristinate, distinte dagli interleaving concorrenti.

| Gruppo | Evidenza prevista dalle fixture e limite |
|---|---|
| ACTIVE reale | Quattro valori, una chiamata al begin e doppia lease; payload ancora accodato, nessun pop/chiusura implicito. Il caller esegue pop, ACK ed end e dimostra il rilascio della Serie. |
| Full A→B | Scambio C1 reale, avvio di B, A nel ring e relativo link/controller intatti; A e B vengono poi conclusi esplicitamente. |
| Adozione e pool | Obbligo adottato con porta inattiva, parole corrotte o ritiro pendente; sentinelle su gate, ACK, claim, ricircolo, pop ed end. Ritiro confermato solo alla successiva presa IDLE. |
| Writer busy | Vera guardia occupata: immagini complete uguali, CLAIMED/link IDLE e generazione conservati; retry successivo del caller. Non è uno stress di contesa casuale. |
| Serie busy | Controller realmente posseduto, un solo tentativo, CLOSING/token senza pop; end non libera la lease altrui. Ricircolo e nuovo avvio avvengono soltanto dopo chiusura esplicita. |
| Generazioni | Limite lease Serie iniettato produce CLOSING/token; limite token bridge iniettato rifiuta prima delle acquisizioni. I reset ripristinano soltanto le FI della fixture. |
| Binding e owner | Contesti diversi e thread proprietario reale distinto rifiutati prima di routing/begin; immagini e sentinelle verificano l'ordine. Dispatcher di tipo invalido ha una prova distinta. |
| Fasi e causa | IDLE, RUNNING, BATCH, FINISHING e RESCHEDULE ottenuti da passi reali; FAULTED diagnostico iniettato separatamente. Capacità, debito e prima causa EQ conservati. |
| Routing e not-ready | Writer estraneo rifiutato prima del begin; bypass pubblico deliberato rende un altro writer not-ready e prova la propagazione EQ nei fault C1. Il bypass non è un uso nominale consentito. |
| Errore dopo lease writer | FI nel secondo acquire, prima di acquisire la Serie: errore originale, writer lease e riferimento conservati, bridge/worker FAULTED e controller intatti. Cleanup C4 della lease reale non ripristina i contesti né qualifica una recovery del prodotto. |

## Sensore e limiti della qualifica

Il sensore letto prevede una sola campagna ACTIVE e cinque repliche,
ciascuna con una fixture nuova, 4096 cicli e 128 warmup. Un vero payload simbolico resta
accodato: il clock non include pop, ACK o applicazione di payload. Ogni
ciclo comprende il nuovo avvio con oracolo dei quattro valori e doppia
lease, end del bridge, ricircolo room C1 e presa C1 esplicita. Token atteso
monotono, identità e stati sono controllati senza reset privati.

Factory, lookup API, GC e drain finale rimangono fuori clock. Il drain
pubblico consuma e conferma l'unico payload e conclude IDLE prima della
chiusura del backend. Non si misura il costo isolato del wrapper, CLOSING,
busy, un coordinatore concorrente o il throughput del motore.

I self-test prevedono quattro risultati difformi, un oracolo CLOSING con
token, heap positivo deliberato, sink errato, clock sotto risoluzione,
CLI/destinazioni rifiutate e raw parziali conservati. La lettura di questi
controlli non ne attesta l'esecuzione. Servono record separati per gate C3,
confronto native/HTML, conteggi per file, heap, repliche e originali.
Non sono qualificati applicazione dei payload, admission, sensori reali,
park/wake, worker morti, avvio/arresto fisici o coordinamento Archivio;
nessun requisito del motore completo viene chiuso da questa revisione.
")
  (:PATH #A((44) BASE-CHAR . "docs/implementazione/pool-begin-risultati.md") :BYTES 8442 :SHA256
   "f46f09fc000dcf4d641bfdbe3bc2a8810e067987108d6f351bb5ab21b35bde1b" :GIT-BLOB
   "d16baa7861d275df6cae21ddeaf4591617d5c2fc" :TEXT "# Verifica dell'avvio pool/Serie

La qualifica segue il [contratto](pool-begin.md), il
[metodo preregistrato](pool-begin-metodo.md) e la
[revisione indipendente C3](pool-begin-revisione.md). Base congelata
`ad829a40f6ce72837b59982d2e4f83e8c9ca9f3e`: quindici fonti e quattordici
helper copiati byte per byte; diciassette impronte della revisione coincidono
in checkout e clone. Originali nel
[catalogo della campagna](../../spikes/results/2026-10-14-pool-worker-begin/).

## Processi e prove

| Processo | Record originale | Esito |
|---|---|---|
| Adattatore di pubblicazione e self-test | [4000996071-command-39309-0](../../spikes/results/2026-10-14-pool-worker-begin/processes/publisher-selftest/report.lisp) | OK, STABLE, exit 0 |
| Reader native/HTML strict | [4000996086-command-40256-0](../../spikes/results/2026-10-14-pool-worker-begin/processes/coverage-reader/report.lisp) | OK, STABLE, exit 0 |
| Sensore strict e self-test | [4000996086-command-40255-0](../../spikes/results/2026-10-14-pool-worker-begin/processes/selftest/report.lisp) | OK, STABLE, exit 0 |
| Copertura e scheduler completo | [4000996086-command-40257-0](../../spikes/results/2026-10-14-pool-worker-begin/processes/coverage/report.lisp) | OK, STABLE, exit 0 |
| Campagna ACTIVE | [4000996125-command-41073-0](../../spikes/results/2026-10-14-pool-worker-begin/processes/benchmark/report.lisp) | OK, STABLE, exit 0 |
| Controllo completo congelato | [4000996069-command-39211-0](../../spikes/results/2026-10-14-pool-worker-begin/processes/check-core/report.lisp) | OK, STABLE, exit 0 |

Passano **14 nuove prove** e lo scheduler completo **94/94**. Verificano
l'avvio reale con doppia lease e tutti e quattro i valori, un solo begin,
pop/ACK/fine espliciti, e lo scambio full A→B che avvia B mentre A rimane
nel ring. Un CLAIMED con porta inattiva, comandi incoerenti o ritiro pendente
rimane completabile senza gate, ACK lifecycle, claim o recycle impliciti.

La contesa reale del writer conserva CLAIMED, link IDLE e generazione;
la contesa della Serie e l'esaurimento della sua lease restituiscono
CLOSING e token da chiudere esplicitamente. Il limite della generazione
del bridge viene invece rifiutato prima di acquisire il writer.
Owner su thread distinto, binding incoerente e fasi non ammesse precedono
l'acquisizione; debito, lease e prima causa rimangono conservati.

Routing invalido, writer realmente non pronto ed errore iniettato durante
la seconda acquisizione verificano causa C1 originale EQ e capacità
residue. Un errore inatteso non restituisce i quattro valori e non promette
cleanup: il caller conserva i riferimenti e coordina l'Archivio. Il cleanup
delle sole fixture C4 non viene presentato come recovery del prodotto.

Il controllo completo passa **1420 prove nominate del prodotto, due smoke
e quattro fixture del linter**, oltre a lint, trace, link, self-test C4,
conservazione e dieci spike. I 1426 marker `ok` comprendono le fixture,
che non vengono chiamate test del prodotto. Lint su 213 file senza
violazioni; trace su 120 requisiti, 65 invarianti, 13 scenari FI e 52 ADR,
senza errori. Il processo dura 269,513968 secondi con 891 sorgenti stabili.
Compilazione senza warning/style-warning; stderr conserva 861956 caratteri
di note del compilatore, equivalenti a 861966 byte UTF-8.

Nessuno dei sei processi formali è fallito. Il controllo dell'archivio
preesistente vede 106 cataloghi, 3241 riferimenti, 37401 file e 961373366
byte conservati: questi conteggi precedono il nuovo namespace begin.

## Copertura

SB-COVER nativo e sette HTML originali concordano sull'intero package di
sei file: **176/184 espressioni (95,652%) e 10/10 rami nativi (100%)**,
senza esclusioni. Il nuovo ingresso copre 21/21 espressioni. Il nativo
originale occupa 2769774 byte. L'[audit della biblioteca](../../spikes/results/2026-10-14-pool-worker-begin/data/coverage-audit/coverage-audit.lisp)
e l'[audit del componente](../../spikes/results/2026-10-14-pool-worker-begin/data/begin-coverage-audit/coverage-dispatch-audit.lisp)
conservano denominatori, confronto native/HTML e tutti i missing.

| File | Espressioni | Rami nativi | Missing |
|---|---:|---:|---:|
| `package.lisp` | 1/1 | 0/0 | 0 |
| `types.lisp` | 40/40 | 8/8 | 0 |
| `build.lisp` | 24/24 | 2/2 | 0 |
| `claim.lisp` | 45/49 | 0/0 | 4 |
| `recycle.lisp` | 45/49 | 0/0 | 4 |
| `begin.lisp` | 21/21 | 0/0 | 0 |

Gli otto missing sono uguali, nei dati e nei percorsi, alla campagna di
ricircolo precedente: gli otherwise finali di claim e recycle, mantenuti
nel denominatore. Claim: indici 31–34, percorsi `(1 4 3 3 4 3)`,
`(1 1 4 3 3 4 3)`, `(2 1 4 3 3 4 3)`, `(3 1 4 3 3 4 3)`.
Recycle: indici 39–42, percorsi `(1 4 2 3 3 4 6)`,
`(1 1 4 2 3 3 4 6)`, `(2 1 4 2 3 3 4 6)`, `(3 1 4 2 3 3 4 6)`.
Nel primo caso il dominio dichiarato del gate consente la rimozione del
ramo; nel secondo la guardia precedente valida lo status. Nessuna nuova
lacuna in begin, nessuna inferenza MC/DC e nessun denominatore C1 ereditato.
Zero sonde native di ramo non equivale ad assenza di decisioni nel sorgente.

## Misura locale ACTIVE

Il [rapporto originale](../../spikes/results/2026-10-14-pool-worker-begin/data/benchmark/report.lisp)
conserva cinque repliche, ciascuna con una fixture nuova: **4096 cicli e
128 warmup**, 20480 cicli misurati complessivi. Un payload simbolico reale
rimane in coda. Nel clock: avvio del bridge con oracolo dei quattro valori,
token monotono e doppia lease, fine senza pop, ricircolo room C1 e presa C1
esplicita. Nessun reset privato. Factory, lookup API, GC e drain pubblico
finale con pop/ACK/end restano fuori clock.

| Replica | Tick | Cicli completati | Heap osservato | Sink |
|---|---:|---:|---:|---:|
| 0 | 4930 | 4096 | 0 | 8579072 |
| 1 | 4863 | 4096 | 0 | 8579072 |
| 2 | 4886 | 4096 | 0 | 8579072 |
| 3 | 4866 | 4096 | 0 | 8579072 |
| 4 | 4878 | 4096 | 0 | 8579072 |

SBCL 2.6.9, ARM64, Darwin 27.0.0, clock 1000000 unità/s e safety 3;
il protocollo C1 e gli oracoli scalari
sono parte del costo. Non si attribuisce il tempo al solo adapter. Carico
esterno incontrollato, nessuna soglia o taratura; heap zero osservato non
prova non allocazione universale. Non vengono misurati CLOSING, busy,
coordinamento concorrente o throughput del motore.

Il self-test rileva 16777472 byte deliberati, sink errato, quattro valori
difformi e clock sotto risoluzione; verifica anche l'oracolo CLOSING,
CLI, destinazioni preesistenti e raw parziali conservati. Il reader C4
verifica sei file e denominatori/missing inattesi. La pubblicazione verifica
una fixture positiva e sette negative: ogni sorgente runtime mancante e
un'impronta alterata. Nessun risultato fuori contratto viene attribuito a
un ritorno nominale C1.

## Integrazione e conservazione

Il commit del prodotto `5b3673f407777ebeeefa7caa6320f387a14c85db`
contiene gli stessi byte qualificati. Il nuovo ingresso inoltra direttamente
i tre valori del bridge: nessuna guardia C3 dopo acquisizione separa il
token dal caller. Non cambia alcun sorgente C1.

Le evidenze preliminari rimangono separate: quattordici prove e scheduler
passati al primo tentativo; sensore con due self-test di sviluppo passati
(il secondo con cache privata), reader passato e compilazione strict del
prodotto senza avvisi. Solo i FASL intermedi sono esclusi dai bundle.
I processi formali mantengono argv, output originali, exit e impronte,
con fonti stabili. Writer C4 e formati generici legacy sono riusati senza
ampliare lo scope del nuovo manifesto specifico.

La [pubblicazione originale](../../spikes/results/2026-10-14-pool-worker-begin/processes/publication/report.lisp)
passa in 306,647160 secondi e la successiva
[verifica di link e archivio](../../spikes/results/2026-10-14-pool-worker-begin/processes/final-verification/report.lisp)
in 221,384083 secondi. Entrambi i processi mantengono OK, STABLE ed exit 0,
892 sorgenti stabili e stderr vuoto. La verifica controlla 431 file e 3007
link, nessuno rotto; 107 cataloghi, 3252 riferimenti, 37444 file e 965767686
byte conservati. I conteggi precedono le copie di chiusura e i due link
aggiunti in questo paragrafo. Il manifesto di chiusura conserva i due
processi originali, il documento finale e le fonti; le prove precedenti
non vengono riscritte.

Non sono realizzati loop server, applicazione dei payload, admission,
sensori reali, park/wake, avvio/arresto fisico o coordinamento dell'Archivio.
Protocolli durevoli e gate del motore completo restano aperti.
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
")))
