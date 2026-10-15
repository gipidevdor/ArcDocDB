(:SCHEMA-VERSION 1 :KIND :POOL-WORKER-LIFECYCLE-CLOSURE-SOURCES :VERSION
 "5be241d8f295e3c82df06e75c9b12e0bf75eb202" :PART 1 :PARTS 1 :SOURCES
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
  (:PATH #A((43) BASE-CHAR . "spikes/out/pool-step-publication-input.lisp") :BYTES 3193 :SHA256
   "97c34b36b04fedbf46e967ec017404faca26189129aeee466099ab1e56b723b0" :GIT-BLOB
   "9d1ab60630b7499e473b441b2adb660cf162f79c" :TEXT
   "(:base \"5be241d8f295e3c82df06e75c9b12e0bf75eb202\" :snapshot \"/tmp/arcdocdb-pool-step-qualification-1792043614\" :paths (\"CHANGELOG.md\" \"arcdocdb.asd\" \"docs/implementazione/README.md\" \"docs/implementazione/pool-dispatch.md\" \"src/dispatch/begin.lisp\" \"src/dispatch/build.lisp\" \"src/dispatch/claim.lisp\" \"src/dispatch/package.lisp\" \"src/dispatch/recycle.lisp\" \"src/dispatch/step.lisp\" \"src/dispatch/types.lisp\" \"tests/scheduler/pool-step.lisp\" \"tools/measure-pool-step.lisp\" \"docs/implementazione/pool-step.md\" \"docs/implementazione/pool-step-metodo.md\" \"docs/implementazione/pool-step-revisione.md\") :final-paths (\"CHANGELOG.md\" \"arcdocdb.asd\" \"docs/implementazione/README.md\" \"docs/implementazione/pool-dispatch.md\" \"src/dispatch/begin.lisp\" \"src/dispatch/build.lisp\" \"src/dispatch/claim.lisp\" \"src/dispatch/package.lisp\" \"src/dispatch/recycle.lisp\" \"src/dispatch/step.lisp\" \"src/dispatch/types.lisp\" \"tests/scheduler/pool-step.lisp\" \"tools/measure-pool-step.lisp\" \"docs/implementazione/pool-step.md\" \"docs/implementazione/pool-step-metodo.md\" \"docs/implementazione/pool-step-revisione.md\" \"docs/implementazione/pool-step-risultati.md\") :records ((:name \"publisher-selftest\" :id \"4001073020-command-38578-0\") (:name \"coverage-reader\" :id \"4001073020-command-38579-0\") (:name \"selftest\" :id \"4001073020-command-38582-0\") (:name \"coverage\" :id \"4001073032-command-39128-0\") (:name \"benchmark\" :id \"4001073141-command-45181-0\") (:name \"check-core\" :id \"4001073020-command-38577-0\") (:name \"integrated-build\" :id \"4001073480-command-67324-0\" :root \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\")) :benchmark-report \"/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-measure/bench-attempt-01/report.lisp\" :evidence ((:name \"coverage-audit\" :source \"/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-measure/coverage-attempt-01/coverage-audit.lisp\") (:name \"step-coverage-audit\" :source \"/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-measure/coverage-attempt-01/coverage-dispatch-audit.lisp\")) :evidence-directories ((:name \"check-core-spikes\" :source \"/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/4001073416-check-63996-0\")) :extra-development-sources (\"/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-fullcheck-attempt-01.log\" \"/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-publication-selftest-attempt-01.log\" \"/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-reader-attempt-01.log\" \"/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-selftest-attempt-01.log\" \"/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-coverage-attempt-01.log\" \"/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/pool-step-benchmark-attempt-01.log\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-step-integrated-attempt-01.log\") :extra-sources (\"/tmp/arcdocdb-pool-step-state.json\" \"spikes/out/pool-command-summary.lisp\" \"tools/measure-pool-lifecycle.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/lifecycle-measure/lifecycle-coverage-reader.lisp\"))
")
  (:PATH #A((37) BASE-CHAR . "spikes/out/pool-step-publication.lisp") :BYTES 6657 :SHA256
   "20fa7e762828b2b926632de0ccbf06883ef26de29da5bb25e89963797879ec4c" :GIT-BLOB
   "d42c8a7875d6703ffc036a5b90a8c1079ee3bca4" :TEXT
   ";;;; Wrapper step: riusa byte per byte il publisher C4 lifecycle verificato.
;;;; Solo esecuzione esplicita dopo freeze; feature :pool-worker-step-publication-library.
(require :asdf)
(let ((*features* (cons :pool-worker-lifecycle-publication-library *features*)))
  (load \"spikes/out/lifecycle-publication.lisp\"))
(in-package #:cl-user)

(defparameter *pool-worker-step-publication-directory*
  #p\"spikes/results/2026-10-15-pool-worker-step/\")
(defparameter *pool-worker-step-development-roots*
  '(#p\"spikes/out/pool-step-dev/\" #p\"spikes/out/pool-step-tests/\"
    #p\"spikes/out/pool-step-measure/\"))
(defparameter *pool-worker-step-development-required*
  '(#p\"spikes/out/pool-step-dev/compile-product-attempt-01.log\"
    #p\"spikes/out/pool-step-dev/lint-trace-attempt-01.log\"))

(defun pool-worker-step-publication-input (config)
  \"Adatta solo i parametri del publisher generico; l'input originale resta conservato.\"
  (let* ((adapted (copy-list config))
         (snapshot (pool-publication-root (getf config :snapshot))))
    (unless (getf adapted :development-roots)
      (setf (getf adapted :development-roots)
            (append *pool-worker-step-development-roots*
                    (list (merge-pathnames \"spikes/out/pool-step-measure/\" snapshot)))))
    (unless (getf adapted :development-required)
      (setf (getf adapted :development-required) *pool-worker-step-development-required*))
    (setf (getf adapted :extra-sources)
          (remove-duplicates
           (append (getf config :extra-sources)
                   '(#p\"spikes/out/pool-step-publication.lisp\"
                     #p\"spikes/out/pool-step-closure-run.lisp\"
                     #p\"spikes/out/lifecycle-close-records.lisp\")) :test #'equal))
    adapted))

(defun pool-worker-step-component-manifest (config input-path)
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
                        \"src/dispatch/recycle.lisp\" \"src/dispatch/begin.lisp\" \"src/dispatch/step.lisp\"))
      (unless (find required sources :test #'string=
                    :key (lambda (source) (getf source :relative-path)))
        (error \"Il componente step richiede la fonte frozen ~A.\" required)))
    (list :schema-version 1 :kind :pool-worker-step-component-manifest
          :base (getf config :base) :qualified-snapshot (namestring snapshot)
          :public-api '(\"arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool\"
                         \"arcdocdb.scheduler.dispatch:prendi-collegamento-pool\"
                         \"arcdocdb.scheduler.dispatch:collega-obbligo-pool\"
                         \"arcdocdb.scheduler.dispatch:ricircola-collegamento-pool\"
                         \"arcdocdb.scheduler.dispatch:inizia-obbligo-pool\"
                         \"arcdocdb.scheduler.dispatch:passo-dispatcher-pool\")
          :runtime-sources '(\"src/dispatch/package.lisp\" \"src/dispatch/types.lisp\"
                            \"src/dispatch/build.lisp\" \"src/dispatch/claim.lisp\"
                            \"src/dispatch/recycle.lisp\" \"src/dispatch/begin.lisp\" \"src/dispatch/step.lisp\")
          :scope '(:single-operational-entry :idle-claimed-reschedule
                   :tagged-cursor-count :nil-current-metadata :notinline-untyped-phase
                   :no-fallthrough :no-implicit-begin-pop-end-or-retry)
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
          :limits '(:logical-dispatch-step-only :generic-family-does-not-expand-product-scope
                    :original-proof-and-status-preserved :no-native-park-wake))))

(defun pool-worker-step-validate-component (component)
  (dolist (source (append (getf component :qualified-source-inventory)
                         (list (getf component :original-input))))
    (unless (worker-byte-records-equal-p source (worker-byte-record (getf source :path)))
      (error \"Fonte/input del manifesto step mutato: ~A\" (getf source :path))))
  t)

(defun pool-worker-step-publication-run (config input-path)
  \"Namespace step nuovo; prove originali e writer esclusivo sono quelli C4 già verificati.\"
  (let* ((adapted (pool-worker-step-publication-input config))
         (component (pool-worker-step-component-manifest config input-path))
         (*lifecycle-publication-directory* *pool-worker-step-publication-directory*))
    (when (> (length (worker-data-octets component)) 1048576)
      (error \"Manifesto componente oltre il budget plain prima della pubblicazione.\"))
    (lifecycle-publication-run adapted input-path)
    (pool-worker-step-validate-component component)
    (worker-save-data component (merge-pathnames \"component-manifest.lisp\"
                                                *lifecycle-publication-directory*))
    (pool-worker-step-validate-component component)
    (lifecycle-publication-refresh-manifest
     (getf config :base) :stem \"manifesto-componente-file\"
     :directory *lifecycle-publication-directory*)
    (format t \"Pool worker step component: frozen sources and generic compatibility recorded.~%\")
    t))

(unless (member :pool-worker-step-publication-library *features*)
  (let ((args (uiop:command-line-arguments)))
    (unless (= (length args) 1)
      (error \"Uso: sbcl --script spikes/out/pool-step-publication.lisp input-plist.lisp\"))
    (let* ((path (pathname (first args))) (config (worker-read-raw-data path)))
      (pool-worker-step-publication-run config path))))
")
  (:PATH #A((37) BASE-CHAR . "spikes/out/pool-step-closure-run.lisp") :BYTES 1406 :SHA256
   "e6f08dd9d95d8862ecbcc7e7b86604e6b5199064ca657af0ab88a8e1c389296d" :GIT-BLOB
   "8fbb38f9f59a30bfa3bc4c801011734ca7b023e9" :TEXT
   ";;;; Chiusura step: stesso helper C4, con directory dinamica del namespace recycle.
;;;; Input/source extra e risultati finali sono copiati in bundle lossless nuovi.
(require :asdf)
(let ((*features* (cons :pool-worker-step-publication-library
                       (cons :pool-worker-lifecycle-closure-library *features*))))
  (load \"spikes/out/pool-step-publication.lisp\")
  (load \"spikes/out/lifecycle-close-records.lisp\"))
(in-package #:cl-user)

(defun pool-worker-step-close-records (input-path stem records &key extra-sources)
  (let ((*lifecycle-publication-directory* *pool-worker-step-publication-directory*))
    (lifecycle-close-records
     input-path stem records
     :extra-sources
     (remove-duplicates
      (append '(#p\"spikes/out/pool-step-publication.lisp\"
                #p\"spikes/out/pool-step-closure-run.lisp\"
                #p\"docs/implementazione/pool-step-risultati.md\")
              extra-sources) :test #'equal))))

(unless (member :pool-worker-step-closure-library *features*)
  (let ((args (uiop:command-line-arguments)))
    (unless (and (>= (length args) 4) (evenp (- (length args) 2)))
      (error \"Uso: sbcl --script spikes/out/pool-step-closure-run.lisp input-plist stem name id [name id ...]\"))
    (pool-worker-step-close-records
     (pathname (first args)) (second args)
     (loop for (name id) on (cddr args) by #'cddr collect (list :name name :id id)))))
")
  (:PATH #A((32) BASE-CHAR . "spikes/out/pool-step-finish.lisp") :BYTES 1279 :SHA256
   "c9eaff706441c8b37e2e3a0c861be32b92b16649b22054ada26f69445d7acfdb" :GIT-BLOB
   "eac1482f042e3b09f70b80bbcad613872cf4a6d5" :TEXT
   ";;;; Chiusura dei rapporti originali e delle fonti integrate del passo pool.
(let ((*features* (cons :pool-worker-step-closure-library *features*)))
  (load \"spikes/out/pool-step-closure-run.lisp\"))
(pool-worker-step-close-records
 #p\"spikes/out/pool-step-publication-input.lisp\" \"manifesto-chiusura-01\"
 '((:name \"publication\" :id \"4001073615-command-75221-0\")
   (:name \"final-verification\" :id \"4001074132-command-9068-0\"))
 :extra-sources '(
  #p\"spikes/out/pool-step-finish.lisp\"
  #p\"spikes/out/pool-step-publication-attempt-01.log\"
  #p\"spikes/out/pool-step-final-verification-attempt-01.log\"
  #p\"/tmp/arcdocdb-pool-step-state.json\"
  #p\"CHANGELOG.md\"
  #p\"arcdocdb.asd\"
  #p\"docs/implementazione/README.md\"
  #p\"docs/implementazione/pool-dispatch.md\"
  #p\"src/dispatch/begin.lisp\"
  #p\"src/dispatch/build.lisp\"
  #p\"src/dispatch/claim.lisp\"
  #p\"src/dispatch/package.lisp\"
  #p\"src/dispatch/recycle.lisp\"
  #p\"src/dispatch/step.lisp\"
  #p\"src/dispatch/types.lisp\"
  #p\"tests/scheduler/pool-step.lisp\"
  #p\"tools/measure-pool-step.lisp\"
  #p\"docs/implementazione/pool-step.md\"
  #p\"docs/implementazione/pool-step-metodo.md\"
  #p\"docs/implementazione/pool-step-revisione.md\"
  #p\"docs/implementazione/pool-step-risultati.md\"
  #p\"spikes/out/pool-command-summary.lisp\"
 ))
")
  (:PATH #A((47) BASE-CHAR . "spikes/out/pool-step-publication-attempt-01.log") :BYTES 285 :SHA256
   "b94037c0341ed4296d263073fc2885ab16206d52f54b563c683e42326b593020" :GIT-BLOB
   "665e59122f2f174d2b305d89f6c383e2e9f53719" :TEXT
   ":OK: sbcl --dynamic-space-size 2048 --noinform --no-userinit --no-sysinit --script spikes/out/pool-step-publication.lisp spikes/out/pool-step-publication-input.lisp; record: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001073615-command-75221-0/report.lisp
")
  (:PATH #A((54) BASE-CHAR . "spikes/out/pool-step-final-verification-attempt-01.log") :BYTES 144
   :SHA256 "92fc7c8aebb15f553d08f287aac479893ff12b063915497e0861abff166e6915" :GIT-BLOB
   "0ca2017b18514443b1d6fb6f1bbaf210c1f85068" :TEXT
   ":OK: make links evidence; record: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001074132-command-9068-0/report.lisp
")
  (:PATH #A((34) BASE-CHAR . "/tmp/arcdocdb-pool-step-state.json") :BYTES 8770 :SHA256
   "46328fe447eb506e65af7d7accd259df8df3406df7ad287c3c912d41cdf0895c" :GIT-BLOB
   "3418e1ccdb6930ea153fb488e5bd0265ea4b60b8" :TEXT "{
  \"base\": \"5be241d8f295e3c82df06e75c9b12e0bf75eb202\",
  \"root\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\",
  \"snapshot\": \"/tmp/arcdocdb-pool-step-qualification-1792043614\",
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
    \"src/dispatch/step.lisp\",
    \"src/dispatch/types.lisp\",
    \"tests/scheduler/pool-step.lisp\",
    \"tools/measure-pool-step.lisp\",
    \"docs/implementazione/pool-step.md\",
    \"docs/implementazione/pool-step-metodo.md\",
    \"docs/implementazione/pool-step-revisione.md\"
  ],
  \"helpers\": [
    \"spikes/out/pool-step-measure/coverage-run.lisp\",
    \"spikes/out/pool-step-measure/dispatch-coverage-reader.lisp\",
    \"spikes/out/pool-step-measure/reader-run.lisp\",
    \"spikes/out/pool-step-measure/tool-run.lisp\",
    \"spikes/out/lifecycle-measure/lifecycle-coverage-reader.lisp\",
    \"spikes/out/pool-step-publication.lisp\",
    \"spikes/out/pool-step-closure-run.lisp\",
    \"spikes/out/pool-step-dev/publication-selftest.lisp\",
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
      \"id\": \"4001073020-command-38578-0\"
    },
    {
      \"name\": \"coverage-reader\",
      \"id\": \"4001073020-command-38579-0\"
    },
    {
      \"name\": \"selftest\",
      \"id\": \"4001073020-command-38582-0\"
    },
    {
      \"name\": \"coverage\",
      \"id\": \"4001073032-command-39128-0\"
    },
    {
      \"name\": \"benchmark\",
      \"id\": \"4001073141-command-45181-0\"
    },
    {
      \"name\": \"check-core\",
      \"id\": \"4001073020-command-38577-0\"
    },
    {
      \"name\": \"integrated-build\",
      \"id\": \"4001073480-command-67324-0\",
      \"root\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\"
    },
    {
      \"name\": \"publication\",
      \"id\": \"4001073615-command-75221-0\",
      \"root\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\"
    },
    {
      \"name\": \"final-verification\",
      \"id\": \"4001074132-command-9068-0\",
      \"root\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\"
    }
  ],
  \"source_sha256\": {
    \"CHANGELOG.md\": \"7d7d5c0d386e4178fe735eef1781d24c80e810fd877c8c82cdb75e62f53a58d1\",
    \"arcdocdb.asd\": \"35df1308676510bde78858c31c756b3f976f8ee0aeb17d8e520d51f7f8506fd0\",
    \"docs/implementazione/README.md\": \"3b87337c4bfb7e44c8ca33ef57c0a5eec35b7c1d523feb8fcb42cdaa0bc0f428\",
    \"docs/implementazione/pool-dispatch.md\": \"5532aa81a4f3256146a85ef71a1e7375fbd9c7651fffe2392d9dcbbd9906d83b\",
    \"src/dispatch/begin.lisp\": \"4ae4bf8f6b7afe53af099a4b37ad75d253c05077f0cc7fbe39f4f1cab9f89a8d\",
    \"src/dispatch/build.lisp\": \"c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5\",
    \"src/dispatch/claim.lisp\": \"224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682\",
    \"src/dispatch/package.lisp\": \"98f56140a06f18597e125c13dfa9593f9594daf129bde17c26f75bf1f4252669\",
    \"src/dispatch/recycle.lisp\": \"9fa3294cd28d1904cfb8db5153f93188b02f1bfbaf1800dad788731007c29ad0\",
    \"src/dispatch/step.lisp\": \"0d7653e6cbc0d93295f2ee1f84d142602af795933bf3147de9fc462c476212de\",
    \"src/dispatch/types.lisp\": \"cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720\",
    \"tests/scheduler/pool-step.lisp\": \"d3e71761c6c27e3f90fb445eb1994e3c567812ea5e512acf10e36232ef26fc31\",
    \"tools/measure-pool-step.lisp\": \"91cc73d2d1550312c60b9ff5b3e74561ce38dbcd3960ff013613ff811b86862c\",
    \"docs/implementazione/pool-step.md\": \"d01df081f65cd39a2bbff0377bfc737a76e3e098aae4f99702d1575df3a5775c\",
    \"docs/implementazione/pool-step-metodo.md\": \"a4eca30aab6b238a4367cbacadee9a88e9b7c517315c29ead4a178ae25f232d2\",
    \"docs/implementazione/pool-step-revisione.md\": \"163c4e01d1601603b5814281792289fa0a896b57c973dd7186c6c00633d5c746\"
  },
  \"helper_sha256\": {
    \"spikes/out/pool-step-measure/coverage-run.lisp\": \"688398123588abdc7b247cc266dc01e7022c0d074e55658c1cd89e1f6f02958b\",
    \"spikes/out/pool-step-measure/dispatch-coverage-reader.lisp\": \"036c0698897871690552afdad5798fd44238151310523771a8ef15454e85ee10\",
    \"spikes/out/pool-step-measure/reader-run.lisp\": \"f2b73c3685800bb7138b35c5fa82d58e5d43ac05e0c1fdb33242d8fd52b5162b\",
    \"spikes/out/pool-step-measure/tool-run.lisp\": \"49f9d999cfa61531e8d4c32b3fa1c9d9a991bbbbb0945f175a260292ed2796d5\",
    \"spikes/out/lifecycle-measure/lifecycle-coverage-reader.lisp\": \"4696348d1a4cb37c1d135e2df29309f4f7abc58b9da3220214612109fd5bfb2c\",
    \"spikes/out/pool-step-publication.lisp\": \"20fa7e762828b2b926632de0ccbf06883ef26de29da5bb25e89963797879ec4c\",
    \"spikes/out/pool-step-closure-run.lisp\": \"e6f08dd9d95d8862ecbcc7e7b86604e6b5199064ca657af0ab88a8e1c389296d\",
    \"spikes/out/pool-step-dev/publication-selftest.lisp\": \"80e98f97858867463d382f4e5f39304daf9dd1f25a1019aa9b9f996d654db7f3\",
    \"spikes/out/lifecycle-publication.lisp\": \"2e127810d51f29c1bc5cd9ca2f0136c764158a77fc1962512537053de60e6754\",
    \"spikes/out/lifecycle-close-records.lisp\": \"d2955e271c7789a60d1c2ba25e0b39c42254770732655f59758ffede391af3b5\",
    \"spikes/out/lifecycle-publication-selftest.lisp\": \"7168bad315b46326cac275c75d2a8c0478da6877591189516b50ceaceb93dbc0\",
    \"spikes/out/worker-publication-functions.lisp\": \"01ce7104faa1905afa2f6b48a03bee04c176ee4c9f68e16ddb1ff435d70a028b\",
    \"spikes/out/pool-controller/publish.lisp\": \"0cc8bd2cd31501dee4e4c40a8a520ac2b779df100489543ae7dd37e6baf33ab5\",
    \"spikes/out/pool-controller/dev-evidence.lisp\": \"80d3a91387e7d7563dbd82137aaedd29cfba0a3773cc44e88694b6d4302e8712\"
  },
  \"reviewed_sha256\": {
    \"src/dispatch/package.lisp\": \"98f56140a06f18597e125c13dfa9593f9594daf129bde17c26f75bf1f4252669\",
    \"src/dispatch/types.lisp\": \"cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720\",
    \"src/dispatch/build.lisp\": \"c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5\",
    \"src/dispatch/claim.lisp\": \"224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682\",
    \"src/dispatch/recycle.lisp\": \"9fa3294cd28d1904cfb8db5153f93188b02f1bfbaf1800dad788731007c29ad0\",
    \"src/dispatch/begin.lisp\": \"4ae4bf8f6b7afe53af099a4b37ad75d253c05077f0cc7fbe39f4f1cab9f89a8d\",
    \"src/dispatch/step.lisp\": \"0d7653e6cbc0d93295f2ee1f84d142602af795933bf3147de9fc462c476212de\",
    \"arcdocdb.asd\": \"35df1308676510bde78858c31c756b3f976f8ee0aeb17d8e520d51f7f8506fd0\",
    \"tests/scheduler/pool-step.lisp\": \"d3e71761c6c27e3f90fb445eb1994e3c567812ea5e512acf10e36232ef26fc31\",
    \"tools/measure-pool-step.lisp\": \"91cc73d2d1550312c60b9ff5b3e74561ce38dbcd3960ff013613ff811b86862c\",
    \"docs/implementazione/pool-step.md\": \"d01df081f65cd39a2bbff0377bfc737a76e3e098aae4f99702d1575df3a5775c\",
    \"docs/implementazione/pool-step-metodo.md\": \"a4eca30aab6b238a4367cbacadee9a88e9b7c517315c29ead4a178ae25f232d2\",
    \"src/scheduler/pool-claim.lisp\": \"e384f6091a5fcb506e718e12e77b06ab8dd4233a41024bc57ca3b14425e10b14\",
    \"src/execution/worker-types.lisp\": \"62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317\",
    \"src/execution/worker-claim.lisp\": \"62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e\",
    \"src/execution/worker-boundary.lisp\": \"4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a\",
    \"src/execution/ready-recycle.lisp\": \"2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b\",
    \"src/series/routing-select.lisp\": \"796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a\"
  },
  \"implementation_commit\": \"c5550332911aaf1c2b7d36161d8997282a8b3974\",
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
    \"src/dispatch/step.lisp\",
    \"src/dispatch/types.lisp\",
    \"tests/scheduler/pool-step.lisp\",
    \"tools/measure-pool-step.lisp\",
    \"docs/implementazione/pool-step.md\",
    \"docs/implementazione/pool-step-metodo.md\",
    \"docs/implementazione/pool-step-revisione.md\",
    \"docs/implementazione/pool-step-risultati.md\"
  ],
  \"integrated_commit\": \"6ede7dbf6ab44660b7294047df45351275a71c48\",
  \"integrated_parent\": \"2cf3c38d297cf513df1d7c6312613099d79ad213\",
  \"spike_directory\": \"/tmp/arcdocdb-pool-step-qualification-1792043614/spikes/out/4001073416-check-63996-0\"
}
")
  (:PATH #A((12) BASE-CHAR . "CHANGELOG.md") :BYTES 23066 :SHA256
   "ef2713687e78987ce77104edb61fa1591b4f199f9944b6121712297e71996751" :GIT-BLOB
   "cd9530c81aa43887c71aaea5c10a3255d11c2d06" :TEXT "# Changelog

Formato basato su [Keep a Changelog](https://keepachangelog.com/it-IT/1.1.0/). Il progetto
non ha ancora rilasci; le versioni seguiranno la [roadmap](docs/roadmap.md).

## [Non rilasciato]

### Aggiunto

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
  (:PATH #A((12) BASE-CHAR . "arcdocdb.asd") :BYTES 17661 :SHA256
   "4c89cecec0251049a32a8e2a36b93c626d44ded463f59763eae6a7fd00b8ce48" :GIT-BLOB
   "b7ae7fb492649189639df51f24a9f71d74e6ff47" :TEXT
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
  (:PATH #A((30) BASE-CHAR . "docs/implementazione/README.md") :BYTES 11591 :SHA256
   "11fccaeb6078e9f6dca518f12b87b95d4e236661ba6bd93dab17db7c9045cc1e" :GIT-BLOB
   "12c05ca1f4d919d7bbc4e1629fdac3dafc3ab7c5" :TEXT "# Implementazione

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
| Confine I/O | [Append, pread e flush durevole](io.md) | [`src/io/`](../../src/io/) |
| Completamento I/O | [Cleanup, frontiere e capacità dopo short I/O](io-completamento.md) | [`src/io/flush.lisp`](../../src/io/flush.lisp), [`src/io/transfer.lisp`](../../src/io/transfer.lisp) |
| Rinomina nella directory | [FD parent, cambio atomico e fail-stop locale](io-rinomina.md) | [`src/io/rename.lisp`](../../src/io/rename.lisp) |
| Associazione dei file | [Device/inode e capacità readonly/append del medesimo ACTIVE](associazione-file.md) | [`src/io/identity.lisp`](../../src/io/identity.lisp) |
| Nuovo segmento writer | [Header durevole, rilettura, directory e sorgente certificata](inizializzazione-active.md) | [`src/active/`](../../src/active/) |
| ACTIVE vuoto | [Radice iniziale, CLOSED recuperati e primo lotto](get-active-vuoto.md) | [active-init.lisp](../../src/get-resolver/active-init.lisp) |
| Checkpoint del control log | [EDIT completo, piano privato e preparazione durevole a blocchi](checkpoint-control.md) | [`src/control/`](../../src/control/) |
| Pubblicazione del control log | [Rinomina ancorata, identità dei nomi e gettone unico](pubblicazione-control.md) | [`src/control/publication.lisp`](../../src/control/publication.lisp) |
| Control log recuperato | [Lettura readonly, manifest posseduto e transizione conservativa](control-recuperato.md); [metodo delle misure](control-transizione-metodo.md) | [`src/control/recovery-read.lisp`](../../src/control/recovery-read.lisp) |
| Vecchio ACTIVE recuperato | [Prefisso readonly, prepared risolti e chiusura verificata](active-recuperato.md) | [`src/recovery-active/`](../../src/recovery-active/) |
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
  (:PATH #A((37) BASE-CHAR . "docs/implementazione/pool-dispatch.md") :BYTES 5905 :SHA256
   "5532aa81a4f3256146a85ef71a1e7375fbd9c7651fffe2392d9dcbbd9906d83b" :GIT-BLOB
   "b539520e7efdfad99de69e1473170db427f27031" :TEXT "# Collegamento dal pool alla Serie

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
| `passo-dispatcher-pool dispatcher` | Un solo passo: sceglie claim, current o recycle dalla fase verificata; cinque valori con origine esplicita, senza begin o seconda presa. |

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

Il [passo coordinato](pool-step.md) seleziona uno solo degli ingressi di presa,
collegamento corrente o ricircolo, senza un secondo stato mutabile C3.
L'origine distingue cursore e count; una pubblicazione termina il passo e
il ritiro resta applicabile soltanto al successivo ingresso IDLE esplicito.

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
  (:PATH #A((25) BASE-CHAR . "src/dispatch/package.lisp") :BYTES 573 :SHA256
   "98f56140a06f18597e125c13dfa9593f9594daf129bde17c26f75bf1f4252669" :GIT-BLOB
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
  (:PATH #A((22) BASE-CHAR . "src/dispatch/step.lisp") :BYTES 3096 :SHA256
   "0d7653e6cbc0d93295f2ee1f84d142602af795933bf3147de9fc462c476212de" :GIT-BLOB
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
  (:PATH #A((30) BASE-CHAR . "tests/scheduler/pool-step.lisp") :BYTES 28210 :SHA256
   "d3e71761c6c27e3f90fb445eb1994e3c567812ea5e512acf10e36232ef26fc31" :GIT-BLOB
   "d0ff803608990744408749722210e812f6268782" :TEXT
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
  (:PATH #A((28) BASE-CHAR . "tools/measure-pool-step.lisp") :BYTES 19012 :SHA256
   "91cc73d2d1550312c60b9ff5b3e74561ce38dbcd3960ff013613ff811b86862c" :GIT-BLOB
   "cdcb410e27475282d157b0d64a4656ea6ad069a1" :TEXT
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
  (:PATH #A((33) BASE-CHAR . "docs/implementazione/pool-step.md") :BYTES 4151 :SHA256
   "d01df081f65cd39a2bbff0377bfc737a76e3e098aae4f99702d1575df3a5775c" :GIT-BLOB
   "fc764576920a560b0ec6cdac9800b876191b42f6" :TEXT "# Passo bounded del dispatcher pool/Serie

`arcdocdb.scheduler.dispatch:passo-dispatcher-pool` coordina un singolo passo
prima dell'avvio del bridge. Incremento C3 di REQ-THR-001,
REQ-CON-001/002/004/005 e REQ-AFF-008: riusa il [dispatcher](pool-dispatch.md)
e non introduce un secondo stato mutabile per lease, token o obblighi.
Il [metodo preregistrato](pool-step-metodo.md) delimita la qualifica.

## Contratto e risultati

Owner corrente, assenza di rientranza, bridge precedente chiuso e contesto
coerente. Binding porta/tabella e owner sono controllati prima della fase.
Il getter pubblico del contesto determina un solo ingresso operativo:

| Fase in ingresso | Operazione | Origine | Dettaglio | Azione lifecycle |
|---|---|---|---|---|
| IDLE | Nuova presa governata | `:claim` | Cursore originale | Originale del gate |
| CLAIMED | Collegamento dell'obbligo corrente | `:current` | NIL | NIL |
| RESCHEDULE | Un ricircolo | `:recycle` | Count della partizione | NIL |

Cinque valori: **link/NIL, status, origine, dettaglio, azione lifecycle**.
Lo status è `:claimed`, `:empty`, `:busy`, `:inactive` o `:published`,
originale dell'ingresso selezionato; current restituisce `:claimed`.
NIL negli ultimi due valori di current indica assenza di trasferimento e
di osservazione lifecycle. NIL per l'azione recycle non significa comando
immutato: il pool non è stato consultato.

Ogni chiamata esegue **un solo ingresso operativo e al più un trasferimento
ready**. Binding, getter e routing di sola lettura non sono trasferimenti.
EMPTY, BUSY e INACTIVE sono esiti della sola nuova presa; il cursore resta
quello restituito dal gate, senza essere reinterpretato come occupazione.
Non provano quiescenza globale, park o arresto sicuro.

CLAIMED non fa nuove prese, ricircoli o ACK del pool: seleziona il link
corrente IDLE e conserva l'obbligo, anche con pool inattivo, ritiro pendente
o comandi incoerenti. Ripetere current non produce avanzamento da solo.
Il caller usa separatamente l'[avvio esplicito](pool-begin.md), poi le API
del bridge per pop, conferma e fine.

RESCHEDULE riusa il [ricircolo](pool-recycle.md): room pubblica e termina
immediatamente IDLE, senza cadere in una seconda presa. Full restituisce
il nuovo CLAIMED e il suo link, mai il precedente. Non legge lifecycle né
conferma il ritiro: questo appartiene alla successiva chiamata IDLE.
Sotto saturazione permanente non si promette convergenza del ritiro.

## Rifiuti e guasti

RUNNING, BATCH, FINISHING e FAULTED segnalano `resource-exhausted
:worker-state` prima di qualsiasi ingresso operativo, conservando debiti,
lease, ring e prima causa. Non vengono validati nuovamente i campi di un
contesto attivo o terminale dal governo C3. Owner e binding mantengono
l'ordine e le diagnosi degli ingressi esistenti.

Una fase inattesa segnala `invariant-violation :pool-dispatcher-state`.
Il case è in un helper NOTINLINE con argomento T: anche una FI del getter
fuori dal suo ftype passa un controllo operativo, senza scambiare questa
prova di confine per un ritorno nominale C1.

BUSY della nuova presa è un ritorno con origine claim e cursore.
`resource-exhausted :ready-queue-busy` del ricircolo rimane invece la
condizione originale, con RESCHEDULE e obbligo conservati. Nessun retry,
handler, cleanup o rollback viene aggiunto. Un routing fallito dopo full
non annulla lo scambio riuscito: riferimento e home del nuovo writer
rimangono nel contesto FAULTED con la causa originale; il vecchio è già
nel ring. Il caller conserva i riferimenti e coordina la diagnosi Archivio.

## Costo e limiti

Scelta della fase O(1); lookup current e ricircolo home O(1). Solo il claim
può eseguire la scansione ready O(K), con K massimo 64. Nessun ciclo nuovo,
allocazione intenzionale, callback, thread, attesa, I/O o scrittura
condivisa tra Serie per messaggio. Il costo dei delegati C1 è incluso.

Il passo non inizia o chiude il bridge, non applica payload e non è il loop
del server. Admission dei messaggi, sensori, park/wake, avvio/arresto fisici
e coordinamento Archivio restano aperti. Nessun protocollo durevole cambia
e nessun gate del motore completo viene chiuso.
")
  (:PATH #A((40) BASE-CHAR . "docs/implementazione/pool-step-metodo.md") :BYTES 3551 :SHA256
   "a4eca30aab6b238a4367cbacadee9a88e9b7c517315c29ead4a178ae25f232d2" :GIT-BLOB
   "b86c360abb0cc4349e4831bf3ba91c1c7a72d386" :TEXT "# Metodo del passo pool/Serie

Preregistrazione del 2026-10-15, base
`5be241d8f295e3c82df06e75c9b12e0bf75eb202`, prima delle campagne formali.
Scope C3: tutti i sette file di `src/dispatch/`, inclusi `step.lisp` e i sei
precedenti. Nessuna modifica C1. Il [contratto](pool-step.md) specifica
origine, dettaglio e azione, con una sola operazione delegata per passo.

## Prove funzionali e revisione

- IDLE con attivazione, inattività, empty e busy: cinque risultati, cursore
  originale e azione lifecycle, un solo ingresso operativo.
- CLAIMED da presa, adozione o full: current senza gate, comandi o ACK;
  dettaglio e azione NIL, selezione del writer corrente senza begin.
- RESCHEDULE room termina IDLE senza seconda presa; full avvia soltanto il
  routing del nuovo CLAIMED. Count e cursore volutamente differenti.
- Ritiro pendente: gli obblighi precedono l'ammissione; ACK soltanto al
  successivo passo IDLE, mai dopo room nella stessa chiamata.
- Guard ready realmente occupata: ritorno BUSY del claim distinto dalla
  condizione busy del ricircolo; preimage e obbligo conservati.
- Binding e owner prima della lettura fase e di ogni ingresso operativo.
  RUNNING/BATCH/FINISHING/FAULTED rifiutati senza cambiare debiti o causa.
- Routing fallito dopo scambio: causa EQ, effetti già riusciti conservati,
  nessuna deduzione di rollback. Stato incoerente delegato alle barriere C1.
- Getter interposto fuori ftype: rifiuto effettivo della fase inattesa;
  FI quiescente ripristinata, distinta dal contratto nominale C1.
- Una revisione indipendente C3 con lista di controllo; compilazione strict
  safety 3, lint, tracciabilità e controllo completo con dieci spike.

Nessuna nuova prova positiva di concorrenza è richiesta dal passo owner-only.
L'owner estraneo usa un thread distinto come prova negativa. Non si deduce
overlap temporale o stress da una sola barriera di partenza.

## Copertura, misure e conservazione

Gate almeno 95% di espressioni e rami sull'intero package, senza esclusioni.
Conservare nativo SB-COVER, otto HTML e audit native/HTML con tutti i missing.
Il reader C4 verificato viene adattato allo scope esplicito di sette file;
nessuna copertura C1 o equivalenza MC/DC viene ereditata.

Due campagne: EMPTY attivo su quattro shard vuoti, quattro passi per ciclo
con rotazione del cursore; CURRENT su CLAIMED reale e porta inattiva,
quattro lookup stabili per ciclo. Cinque repliche da 4096 cicli e 128
warmup per campagna, fixture nuova per replica. Fixture, factory, claim
iniziale, lookup API, GC e drain pubblico finale restano fuori clock.
I cinque valori e le identità sono verificati nel clock; nessun reset
privato, begin o applicazione di payload nel tratto misurato.

INACTIVE/IDLE e i cinque valori del rifiuto sono coperti dai self-test;
RESCHEDULE, CLOSING e contese rimangono nelle prove funzionali, senza una
misura di latenza dedicata. Conservare heap, tick, sink e cicli completati:
heap zero osservato non dimostra non allocazione universale. Carico esterno
incontrollato, nessuna soglia, taratura o attribuzione al solo adapter;
i delegati C1 e gli oracoli scalari sono parte del costo.

Self-test positivi e negativi per cinque risultati difformi, sink, clock
sotto risoluzione, heap deliberato, CLI, destinazioni preesistenti e raw
parziali. Campagne formali su copia congelata, cache dedicate e
`record-command.lisp`: argv, output, exit e impronte iniziali/finali.
Conservare fallimenti e sviluppo separati; copie byte per byte e manifesti
nuovi esclusivi, senza riscrivere le prove originali.
")
  (:PATH #A((43) BASE-CHAR . "docs/implementazione/pool-step-revisione.md") :BYTES 12601 :SHA256
   "163c4e01d1601603b5814281792289fa0a896b57c973dd7186c6c00633d5c746" :GIT-BLOB
   "f16e3beb60d31637d25a07a6d585528bc1ecc6dc" :TEXT "# Revisione indipendente del passo pool/Serie

Lettura statica del 2026-10-15, base
`5be241d8f295e3c82df06e75c9b12e0bf75eb202`, eseguita da un agente diverso
dall'autore. Esito: **positivo per lo scope C3 letto**, senza rilievi aperti
sul prodotto. Il revisore ha modificato soltanto questo documento e non ha
eseguito campagne: la lettura non attesta compilazione, test, copertura
o allocazioni.

Il quadro applicato comprende [ADR-0031](../adr/0031-software-critico-criteri-e-priorita.md),
[ADR-0034](../adr/0034-policy-di-compilazione-e-standard-di-codifica.md),
[ADR-0045](../adr/0045-modello-di-esecuzione.md) e lo
[standard di codifica](../affidabilita/standard-di-codifica.md).
Sono stati letti il [contratto](pool-step.md), il
[metodo preregistrato](pool-step-metodo.md), tutti i sette sorgenti dispatch,
l'ordine ASDF, le sedici nuove prove e il sensore C4. Le barriere delegate
rimangono distinte dalla nuova politica C3; questa lettura non sostituisce
la revisione o la qualificazione dei componenti C1.

## Identità dello scope

Il denominatore di qualificazione comprende tutti i sette file dispatch,
senza esclusioni manuali o limitazione alle righe nuove. Devono essere
pubblicati anche i conteggi per file e tutti i missing del nuovo ingresso.
I delegati C1 non entrano nel denominatore C3; nessuna copertura o
equivalenza MC/DC viene dedotta dai tipi o dal sorgente.

| Fonte letta | SHA-256 |
|---|---|
| `src/dispatch/package.lisp` | `98f56140a06f18597e125c13dfa9593f9594daf129bde17c26f75bf1f4252669` |
| `src/dispatch/types.lisp` | `cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720` |
| `src/dispatch/build.lisp` | `c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5` |
| `src/dispatch/claim.lisp` | `224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682` |
| `src/dispatch/recycle.lisp` | `9fa3294cd28d1904cfb8db5153f93188b02f1bfbaf1800dad788731007c29ad0` |
| `src/dispatch/begin.lisp` | `4ae4bf8f6b7afe53af099a4b37ad75d253c05077f0cc7fbe39f4f1cab9f89a8d` |
| `src/dispatch/step.lisp` | `0d7653e6cbc0d93295f2ee1f84d142602af795933bf3147de9fc462c476212de` |
| `arcdocdb.asd` | `35df1308676510bde78858c31c756b3f976f8ee0aeb17d8e520d51f7f8506fd0` |
| `tests/scheduler/pool-step.lisp` | `d3e71761c6c27e3f90fb445eb1994e3c567812ea5e512acf10e36232ef26fc31` |
| `tools/measure-pool-step.lisp` | `91cc73d2d1550312c60b9ff5b3e74561ce38dbcd3960ff013613ff811b86862c` |
| `docs/implementazione/pool-step.md` | `d01df081f65cd39a2bbff0377bfc737a76e3e098aae4f99702d1575df3a5775c` |
| `docs/implementazione/pool-step-metodo.md` | `a4eca30aab6b238a4367cbacadee9a88e9b7c517315c29ead4a178ae25f232d2` |

Le fonti delegate determinanti per la scelta e il trasporto sono invariate:

| Fonte delegata | SHA-256 |
|---|---|
| `src/scheduler/pool-claim.lisp` | `e384f6091a5fcb506e718e12e77b06ab8dd4233a41024bc57ca3b14425e10b14` |
| `src/execution/worker-types.lisp` | `62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317` |
| `src/execution/worker-claim.lisp` | `62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e` |
| `src/execution/worker-boundary.lisp` | `4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a` |
| `src/execution/ready-recycle.lisp` | `2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b` |
| `src/series/routing-select.lisp` | `796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a` |

Le impronte identificano i byte letti. La qualifica successiva deve
confrontarli con quelli congelati, senza dedurre un PASS dalla tabella.

## Scelta esclusiva e metadati

Il nuovo ingresso coordina la scelta fra tre operazioni preesistenti,
senza aggiungere stato mutabile per obblighi, lease o token. Verifica tipo
della porta, owner, tipo della tabella e identità EQ dei contesti prima di
leggere la fase con il getter pubblico execution. La chiusura del bridge
precedente e l'assenza di rientranza rimangono precondizioni del caller:
non viene introdotta una scansione di tutti i link o una prova di quiescenza.

IDLE delega la nuova presa governata e restituisce il suo link/status,
origine `:claim`, cursore e azione originali. CLAIMED delega soltanto il
collegamento dell'obbligo corrente: `:claimed/:current` descrive il writer
già posseduto, senza affermare una nuova presa. Dettaglio e azione sono NIL.
RESCHEDULE delega un solo ricircolo e restituisce origine `:recycle`, count
della partizione e azione NIL. Quest'ultimo NIL significa che il pool non
è stato consultato, senza inventare un'osservazione `:unchanged`.

Ogni ramo invoca un solo ingresso operativo e al più un trasferimento ready.
Room termina il passo IDLE senza cadere in una presa successiva; full
restituisce il link del nuovo CLAIMED, senza iniziarlo. Un passo successivo
può quindi scegliere current, mentre il caller avvia e chiude il bridge
esplicitamente. Ripetere current non produce avanzamento da solo.

Il passo non legge lifecycle negli obblighi CLAIMED/RESCHEDULE e non
revoca quelli già assunti. Il ritiro pending è applicabile soltanto in
un successivo passo IDLE. Scambi full perpetui non garantiscono il ritorno
a IDLE; EMPTY e BUSY rimangono osservazioni locali senza autorità su park
o arresto. Count e cursore non sono intercambiabili né snapshot globali.

## Rifiuti, barriere e compilatore

RUNNING, BATCH, FINISHING e FAULTED sono rifiutati prima di qualsiasi
ingresso operativo con `resource-exhausted :worker-state`. Il getter
controlla owner e legge la fase, senza verificare lease o debito: il nuovo
rifiuto C3 non sostituisce la prima causa o rivalida i campi di un contesto
attivo/terminale. Le forme delle fasi accettate vengono invece controllate
dai delegati originali, con i loro confini C1.

`%passo-dispatcher-fase` è NOTINLINE e accetta la fase come T. Le quattro
fasi note non ammesse sono distinte dal finale che segnala
`invariant-violation :pool-dispatcher-state`. Una FI oltre il ftype del
getter esercita così una difesa operativa, senza attribuirla al contratto
nominale C1 o promuovere il compilatore a runtime qualificato.

BUSY del claim è un ritorno con cursore; busy della guard nel ricircolo
rimane una condizione con RESCHEDULE e obbligo conservati. Non esistono
handler, conversioni in successo, retry, cleanup o rollback nuovi.
Un routing fallito dopo full conserva lo scambio già riuscito; dopo claim
con attivazione conserva l'ACK precedente. Riferimento, home e causa
restano nel contesto secondo le barriere originali. C3 non scrive fault,
campi writer, ring o controller e non applica ulteriori controlli ai
risultati dopo il trasferimento.

## Lista di controllo

I dodici punti C1 sono usati come controllo aggiuntivo nel singolo
passaggio C3 previsto da ADR-0031.

| Punto | Valutazione statica e limite |
|---|---|
| 1. Requisiti e ADR | REQ-THR-001, REQ-CON-001/002/004/005 e REQ-AFF-008 tracciati; scelta bounded fra compiti e trasporto per tratto coerenti con ADR-0045 §6/8. Il motore completo resta aperto. |
| 2. Invarianti | Binding prima della fase; un ingresso esclusivo; nessuna nuova ammissione con obbligo corrente; published termina il passo. Il precedente bridge chiuso è precondizione, senza nuova prova globale. |
| 3. Errori | Owner/binding e condizioni delegate mantengono ragioni e ordine; fasi note e inattese hanno rifiuti distinti. Nessun nuovo fault marking o sostituzione della causa C1. |
| 4. Limiti | Nessun ciclo, ricorsione, retry, callback o attesa nuovo. Selezione O(1), current/recycle O(1); soltanto claim può scansionare al più 64 shard. |
| 5. Allocazione | Nessuna struttura, lista, closure, hash o stato nuovo nel percorso caldo. Zero heap richiede misura separata e non deriva dalla lettura del wrapper. |
| 6. Risultati | Cinque valori con origine esplicita: cursor/count/NIL e lifecycle/NIL mantengono significati distinti. Nessun risultato di errore ignorato, nessun token o capacità nuova. |
| 7. Decisioni | Helper nuovo: 17 righe di defun, complessità 5; ingresso pubblico: 11 righe, complessità 1. Le altre funzioni restano nei limiti di 60 righe e 10 percorsi; nessuna nuova decisione composta C1. |
| 8. Proprietà | Dispatcher e contesto del solo thread creatore, riferimenti immutabili; nessuna duplicazione dello stato execution o nuova condivisione. Owner execution ricontrollato dal getter/delegati. |
| 9. Tracciabilità | REQ sulle due definizioni e sedici prove; export e ordine ASDF dopo gli ingressi originali corretti. Build strict, lint, trace e controllo completo sono attestazioni di processo separate. |
| 10. Standard | Safety 3, ftype, docstring, OWNER/SHARED e finale case typed; NOTINLINE conserva il dominio T al confine. Nessun handler generico, macro nuova, controllo C1 rimosso o deviazione individuata. |
| 11. Parallelismo | Nessun lock, contatore globale o scrittura condivisa per messaggio nuovo; accessi ready delegati per tratto. La scelta owner-only non dimostra overlap, equità o scalabilità. |
| 12. Durabilità | Nessun payload, CSN, file o protocollo durevole modificato dal nuovo codice. Nessuna nuova atomicità persistente o eliminazione da qualificare. |

## Lettura delle sedici prove

Le prove sono state lette senza eseguirle. I contatori di chiamata inoltrano
alle vere API selezionate; le sentinelle e le FI sono quiescenti e
ripristinate. L'owner distinto è una prova negativa, senza rivendicare
nuovo lavoro positivo concorrente o overlap da una barriera di partenza.

| Gruppo | Evidenza prevista dalle fixture e limite |
|---|---|
| IDLE attivo | Attivazione/ACK precedono la presa reale; cinque valori, home distinta dal cursore, link IDLE senza lease. EMPTY e vera guard busy verificano una sola chiamata e rotazione originale. |
| IDLE inattivo/ritiro | Lavoro reale nel ring, sentinella sulla scansione e cursore conservato; ritiro confermato prima della ready. Nessuna quiescenza globale dedotta. |
| CURRENT | Adozione con porta inattiva, parole corrotte o ritiro pending; immagini uguali, un lookup, metadati NIL e nessun gate/begin. Completamento e ACK restano espliciti. |
| Room | Capacity 2 e tre shard distinguono count 2 da cursor 0; un ricircolo, FIFO B poi A e ACK pending conservato. Solo il successivo passo IDLE conferma il ritiro. |
| Full | Scambio reale A→B e link B IDLE, poi passo current senza nuove mutazioni; vecchio A resta nel ring ed è concluso dal caller. |
| Ricircolo busy | Guardia CAS realmente detenuta, condizione originale e immagini complete uguali; distinto dal ritorno BUSY del claim, senza retry interno. |
| Fasi e priorità dei controlli | RUNNING/BATCH/FINISHING reali e FAULTED diagnostico rifiutati con zero ingressi; binding e owner estraneo precedono getter e operazioni. Prima causa EQ e capacità conservate. |
| Fault dopo trasferimento | Full con writer estraneo conserva il vecchio A nel ring e il nuovo riferimento/home in FAULTED; claim con attivazione conserva ACK e causa. Controller e lease rimangono intatti. |
| Confine getter e tipo | Sei valori fuori ftype rifiutati con invariant e zero ingressi, anche con causa FAULTED preesistente; FI del getter distinta dallo stato nominale. Dispatcher di tipo invalido ha una prova separata. |

## Sensore e limiti della qualifica

Il sensore letto prevede due campagne, ciascuna di cinque repliche con
una fixture nuova, 4096 cicli e 128 warmup. Ogni ciclo EMPTY esegue quattro
passi su quattro shard vuoti e controlla cursori 1/2/3/0. CURRENT-INACTIVE
mantiene un CLAIMED reale con porta inattiva e verifica quattro lookup,
cinque valori, identità, cursore 1 e link IDLE, senza nuove lease.

Factory, risoluzione API, claim iniziale, GC e cleanup restano fuori clock.
Il drain pubblico finale CURRENT consuma e conferma il payload e conclude
il writer IDLE; non viene presentato come arresto del motore. Il clock
include i delegati e gli oracoli scalari, senza misura isolata del wrapper.
INACTIVE IDLE è soltanto nei self-test; RECYCLE ha un oracolo sintetico del
sensore e prove prodotto, senza latenza misurata. Begin, CLOSING, payload,
contese e coordinatore concorrente non vengono misurati dalle campagne.

I self-test prevedono cinque ritorni difformi, heap deliberato, sink errato,
clock sotto risoluzione, CLI/destinazioni rifiutate e raw parziali conservati.
La lettura non ne attesta l'esecuzione. Sono necessari record separati per
copertura native/HTML, conteggi per file, gate C3, heap, repliche e copie
degli originali. Nessuna nuova garanzia su admission dei messaggi, sensori,
park/wake, avvio/arresto fisici, worker morti o coordinamento Archivio;
nessun requisito del motore completo è chiuso da questa revisione.
")
  (:PATH #A((43) BASE-CHAR . "docs/implementazione/pool-step-risultati.md") :BYTES 10153 :SHA256
   "610b98eaf2755835216851be34567073831d8b47a79e703b5f638b987e15f5ab" :GIT-BLOB
   "8c41c836edf57e6dfca0a161bed55372c442e76d" :TEXT "# Verifica del passo pool/Serie

La qualifica segue il [contratto](pool-step.md), il
[metodo preregistrato](pool-step-metodo.md) e la
[revisione indipendente C3](pool-step-revisione.md). Base congelata
`5be241d8f295e3c82df06e75c9b12e0bf75eb202`: sedici fonti e quattordici
helper copiati byte per byte; diciotto impronte della revisione coincidono
in checkout e clone. Originali nel
[catalogo della campagna](../../spikes/results/2026-10-15-pool-worker-step/).

## Processi e prove

| Processo | Record originale | Esito |
|---|---|---|
| publisher-selftest | [4001073020-command-38578-0](../../spikes/results/2026-10-15-pool-worker-step/processes/publisher-selftest/report.lisp) | OK, STABLE, exit 0 |
| coverage-reader | [4001073020-command-38579-0](../../spikes/results/2026-10-15-pool-worker-step/processes/coverage-reader/report.lisp) | OK, STABLE, exit 0 |
| selftest | [4001073020-command-38582-0](../../spikes/results/2026-10-15-pool-worker-step/processes/selftest/report.lisp) | OK, STABLE, exit 0 |
| coverage | [4001073032-command-39128-0](../../spikes/results/2026-10-15-pool-worker-step/processes/coverage/report.lisp) | OK, STABLE, exit 0 |
| benchmark | [4001073141-command-45181-0](../../spikes/results/2026-10-15-pool-worker-step/processes/benchmark/report.lisp) | OK, STABLE, exit 0 |
| check-core congelato | [4001073020-command-38577-0](../../spikes/results/2026-10-15-pool-worker-step/processes/check-core/report.lisp) | OK, STABLE, exit 0 |
| Compilazione/test/lint/trace integrati | [4001073480-command-67324-0](../../spikes/results/2026-10-15-pool-worker-step/processes/integrated-build/report.lisp) | OK, STABLE, exit 0 |

Passano **16 nuove prove**, scheduler completo **110/110**. I contatori
inoltrano alle API reali e verificano un solo ingresso operativo: claim
IDLE, current CLAIMED o recycle RESCHEDULE. I cinque risultati distinguono
cursore, count e assenza di trasferimento; NIL per lifecycle fuori claim
non viene reinterpretato come osservazione di comando invariato.

Attivazione e ritiro precedono la nuova presa. CLAIMED reale da adozione,
presa o full rimane completabile anche con porta inattiva, ritiro pendente
o comandi incoerenti; nessun gate, ACK, begin, pop o end implicito.
Room conserva FIFO, distingue count 2 da cursore 0 e termina il passo senza
secondo claim. Full seleziona B, lascia A nel ring e permette poi current
senza altri trasferimenti. Soltanto il successivo passo IDLE applica il ritiro.

Una guard CAS realmente occupata distingue il ritorno BUSY del claim dalla
condizione `:ready-queue-busy` del ricircolo, conservando l'obbligo.
Owner su thread distinto e binding incoerente precedono getter e ingressi.
RUNNING/BATCH/FINISHING e FAULTED sono rifiutati con zero operazioni;
debiti, lease e prima causa rimangono intatti. Non si deduce overlap o
stress positivo dalla prova negativa dell'owner.

Routing fallito dopo full conserva lo scambio già avvenuto e la causa C1
originale EQ; dopo claim conserva l'ACK di attivazione già riuscito.
Le FI quiescenti del getter oltre il suo ftype sono rifiutate realmente dal
case T/NOTINLINE, anche con causa FAULTED preesistente. Sei valori fuori
dominio esercitano la difesa C3; non sono ritorni nominali C1. Nessun nuovo
handler, rollback, cleanup, campo di fault o secondo stato mutabile.

Il controllo completo congelato passa **1544 prove nominate del prodotto,
due smoke e quattro fixture del linter**, oltre a lint, trace, link,
self-test C4, conservazione e dieci spike. I 1550 marker `ok` includono le
fixture, che non vengono chiamate test del prodotto. Lint su 225 file senza
violazioni; trace su 121 requisiti, 65 invarianti, 13 scenari FI e 52 ADR,
senza errori. Il processo dura 435,846382 secondi con 928 sorgenti stabili.
Compilazione senza warning/style-warning; stderr conserva 1034758
caratteri di note del compilatore, equivalenti a 1034772 byte UTF-8.

L'archivio preesistente comprende 114 cataloghi, 3393 riferimenti, 40699 file
e 1072092045 byte conservati, prima del nuovo namespace step. I link del
congelamento sono 3075 su 451 file, nessuno rotto. Nessuno dei sette
processi formali nella tabella è fallito.

## Copertura

SB-COVER nativo e otto HTML originali concordano sull'intero package di
sette file: **227/235 espressioni (96,596%) e 10/10 rami nativi (100%)**,
senza esclusioni. Il nuovo `step.lisp` copre **51/51 espressioni**, nessun
missing. Il nativo originale occupa 2997008 byte. L'[audit della biblioteca](../../spikes/results/2026-10-15-pool-worker-step/data/coverage-audit/coverage-audit.lisp)
e l'[audit del componente](../../spikes/results/2026-10-15-pool-worker-step/data/step-coverage-audit/coverage-dispatch-audit.lisp)
conservano denominatori, confronto native/HTML e tutti i percorsi mancanti.

| File | Espressioni | Rami nativi | Missing |
|---|---:|---:|---:|
| `package.lisp` | 1/1 | 0/0 | 0 |
| `types.lisp` | 40/40 | 8/8 | 0 |
| `build.lisp` | 24/24 | 2/2 | 0 |
| `claim.lisp` | 45/49 | 0/0 | 4 |
| `recycle.lisp` | 45/49 | 0/0 | 4 |
| `begin.lisp` | 21/21 | 0/0 | 0 |
| `step.lisp` | 51/51 | 0/0 | 0 |

Restano gli otto missing dei due adapter precedenti, nel denominatore.
Claim: indici 31–34, percorsi `(1 4 3 3 4 3)`, `(1 1 4 3 3 4 3)`,
`(2 1 4 3 3 4 3)`, `(3 1 4 3 3 4 3)`. Recycle: indici 39–42,
percorsi `(1 4 2 3 3 4 6)`, `(1 1 4 2 3 3 4 6)`,
`(2 1 4 2 3 3 4 6)`, `(3 1 4 2 3 3 4 6)`.
Sono i finali otherwise eliminabili dal dominio del gate o dalla guardia
precedente; non vengono esclusi manualmente. Il finale inatteso del nuovo
passo viene invece esercitato realmente. Nessuna inferenza MC/DC e nessun
denominatore C1 ereditato; zero sonde native di ramo non equivale ad
assenza di decisioni nel sorgente.

## Misure locali

Il [rapporto originale](../../spikes/results/2026-10-15-pool-worker-step/data/benchmark/report.lisp)
conserva due campagne di cinque repliche: **4096 cicli e 128 warmup** per
replica, 20480 cicli per campagna e quattro chiamate per ciclo. Tutti i
dieci campioni completano i cicli previsti con heap osservato zero e sink
esatto: 8435712 EMPTY, 8501248 CURRENT-INACTIVE.

| Replica | Tick EMPTY | Tick CURRENT-INACTIVE | Heap per campagna |
|---|---:|---:|---:|
| 0 | 9224 | 3529 | 0 |
| 1 | 9866 | 3680 | 0 |
| 2 | 8655 | 5305 | 0 |
| 3 | 8957 | 6781 | 0 |
| 4 | 8282 | 4345 | 0 |

SBCL 2.6.9, ARM64, Darwin 27.0.0, safety 3 e clock 1000000 unità/s.

Ogni ciclo esegue quattro passi e verifica tutti e cinque i risultati.
EMPTY ruota il cursore 1/2/3/0 su quattro shard vuoti con pool attivo.
CURRENT-INACTIVE seleziona quattro volte un CLAIMED reale con porta
inattiva, controllando identità, fase e cursore 1. Ogni replica usa una
fixture nuova. Factory, lookup API, claim iniziale, GC e drain pubblico
finale del solo payload sentinel restano fuori clock; nessun reset privato,
begin o lease attiva nel tratto misurato.

Il tempo comprende i delegati e gli oracoli, senza attribuzione al solo
adapter. Carico esterno incontrollato, nessuna soglia o taratura; heap zero
osservato non prova non allocazione universale. Non sono misurati RECYCLE,
CLOSING, contese, claim IDLE con lavoro reale o coordinamento concorrente.
INACTIVE/IDLE è solo nel self-test, con un oracolo sintetico RECYCLE.

I self-test verificano cinque valori difformi, sink errato, clock sotto
risoluzione, 16777472 byte deliberati rilevati, CLI, destinazioni
preesistenti e raw parziali. Il reader verifica scope e denominatori di
sette file; la pubblicazione una fixture positiva e otto negative, per
ogni sorgente runtime mancante e impronta alterata.

## Integrazione e conservazione

Il commit prodotto `c5550332911aaf1c2b7d36161d8997282a8b3974` contiene gli stessi
byte qualificati. Nessun sorgente execution, series o scheduler è cambiato.
La nuova politica C3 delega senza aggiungere controlli dopo il trasferimento.
Il bridge precedente chiuso rimane precondizione del caller, senza scansione
globale dei link o prova di quiescenza.

Il prodotto è integrato con `2cf3c38d297cf513df1d7c6312613099d79ad213`, che
aggiunge il recovery readonly del log multiserie. Il merge
`6ede7dbf6ab44660b7294047df45351275a71c48` conserva byte per byte i sette
sorgenti dispatch, i test, il sensore e le barriere delegate del freeze;
ASDF, indice e changelog conservano entrambe le aggiunte.

La verifica integrata passa compilazione strict, 1544 prove nominate e
due smoke, lint su 231 file e trace senza errori: 44,130150 secondi con
936 sorgenti stabili. Non qualifica le nuove API recovery-archive C1,
né attribuisce retroattivamente copertura o dieci spike al nuovo modulo.

Le evidenze di sviluppo rimangono separate: sedici nuove prove e scheduler
passati al primo tentativo; compilazione prodotto strict e lint/trace
superati; reader e sensore verificati. La prima variante del sensore,
compilata senza eseguire le campagne, riusava la fixture; la seconda
applica cinque fixture per campagna, come nel preregistrato, ed è quella
qualificata. Snapshot e raw precedenti rimangono conservati. Solo i FASL
intermedi sono esclusi dalle fonti UTF-8 di sviluppo.

I processi formali conservano argv, output, exit e impronte iniziali/finali.
Writer C4 e formati generici legacy sono riusati con manifesto specifico,
senza ampliare lo scope. Nessun protocollo durevole cambia. Admission dei
messaggi, payload, sensori, park/wake, avvio/arresto fisici e coordinamento
Archivio restano aperti; non si chiude alcun gate del motore completo.

La [pubblicazione originale](../../spikes/results/2026-10-15-pool-worker-step/processes/publication/report.lisp)
passa in 491,607474 secondi e la successiva
[verifica di link e archivio](../../spikes/results/2026-10-15-pool-worker-step/processes/final-verification/report.lisp)
in 265,611008 secondi. Entrambi mantengono OK, STABLE ed exit 0, con 936
sorgenti stabili e stderr vuoto. La verifica controlla 454 file e 3102 link,
nessuno rotto; 116 cataloghi, 3429 riferimenti, 40772 file e 1078188211 byte
conservati. I conteggi precedono le copie di chiusura e i due link aggiunti
qui. Il manifesto di chiusura conserva questi due processi originali,
il documento finale e le fonti integrate; le prove precedenti non vengono
riscritte.
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
