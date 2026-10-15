(:SCHEMA-VERSION 1 :KIND :POOL-START-PUBLICATION-SOURCES :PART 1 :PARTS 1 :SOURCES
 ((:PATH #A((38) BASE-CHAR . "spikes/out/pool-start-publication.lisp") :BYTES 4322 :SHA256
   "187fe46718a1fd56d9291d176ce77bdf60afdcd8c93b68bdf6f34936a87eb73d" :GIT-BLOB
   "489d7f01b2d56f3f565992190de2d9bcc4d45faa" :TEXT
   ";;;; C4 orchestration: unchanged byte-preserving writers; originals and all UTF-8 dev files.
(require :asdf)
(let ((*features* (cons :pool-worker-lifecycle-publication-library *features*)))
  (load \"spikes/out/lifecycle-publication.lisp\"))
(let* ((base \"7f1cc54477483039bd98bd8c3f6508416f5c0ced\")
       (destination #p\"spikes/results/2026-10-15-pool-prepara/\")
       (root (truename \"./\")) (args (uiop:command-line-arguments))
       (valid-args (unless (= (length args) 1) (error \"One data config required.\")))
       (config (worker-read-raw-data (pathname (first args))))
       (records (getf config :records))
       (paths (getf config :final-paths)))
  (declare (ignore valid-args))
  (when (probe-file destination) (error \"Canonical destination already present.\"))
  (let* ((sources (worker-plan-source-bundles paths \"sources-final\" :pool-start-final-sources))
         (development (lifecycle-development-plan
                       :roots '(#p\"spikes/out/pool-start/\")
                       :required '(#p\"spikes/out/pool-start/full-attempt-01.log\"
                                   #p\"spikes/out/pool-start/coverage-attempt-01/coverage-state.lisp\"
                                   #p\"spikes/out/pool-start/bench-attempt-01/report.lisp\")
                       :extra '(#p\"/tmp/arcdocdb-pool-start-freeze.json\")))
         (orchestration (worker-plan-source-bundles
                         '(#p\"spikes/out/pool-start-publication.lisp\"
                           #p\"spikes/out/pool-start-publication-input.lisp\"
                           #p\"spikes/out/worker-publication-functions.lisp\"
                           #p\"spikes/out/pool-controller/publish.lisp\"
                           #p\"spikes/out/pool-controller/dev-evidence.lisp\"
                           #p\"spikes/out/lifecycle-publication.lisp\"
                           #p\"tools/measure-pool-step.lisp\" #p\"tools/measure-pool-lifecycle.lisp\"
                           #p\"spikes/out/lifecycle-measure/lifecycle-coverage-reader.lisp\"
                           #p\"tools/evidence-storage.lisp\" #p\"tools/finish-evidence.lisp\"
                           #p\"tools/compact-evidence.lisp\")
                         \"publication-sources\" :pool-start-publication-sources))
         (plans (mapcar (lambda (record) (pool-publication-record-plan record root destination)) records))
         (campaign (lifecycle-evidence-directory-plan
                    (list :name \"check-core-spikes\" :source (getf config :spike-directory)) root destination)))
    (ensure-directories-exist (merge-pathnames \"placeholder\" destination))
    (pool-publication-write-plans sources destination)
    (pool-publication-write-plans orchestration destination)
    (pool-development-write development destination)
    (worker-save-data
     (list :schema-version 1 :kind :pool-start-evidence :base base
           :processes (mapcar #'pool-publication-copy-record plans)
           :campaign (lifecycle-copy-evidence-directory campaign)
           :data (mapcar (lambda (entry) (pool-publication-copy-data entry root destination))
                         '((:name \"benchmark\" :source \"spikes/out/pool-start/bench-attempt-01/report.lisp\")
                           (:name \"coverage\" :source \"spikes/out/pool-start/coverage-attempt-01/coverage-dispatch-audit.lisp\")
                           (:name \"coverage-library\" :source \"spikes/out/pool-start/coverage-attempt-01/coverage-audit.lisp\")))
           :development-files (length (getf development :paths))
           :excluded-fasl (getf development :excluded)
           :compatibility '(:catalog-component :writer-worker
                            :development-bundle-kind :pool-worker-lifecycle-development
                            :large-bundle-kind :pool-worker-lifecycle-development-large)
           :limits '(:original-process-and-conservation-bytes :all-development-utf8
                     :native-coverage-and-html-preserved-as-source-text
                     :only-fasl-excluded :frozen-copies-with-txt-suffix
                     :no-status-promotion :no-performance-comparison))
     (merge-pathnames \"manifesto.lisp\" destination))
    (lifecycle-publication-refresh-manifest base :directory destination)
    (format t \"Pool prepare: original processes, development sources and spike files verified.~%\")))
")
  (:PATH #A((44) BASE-CHAR . "spikes/out/pool-start-publication-input.lisp") :BYTES 1283 :SHA256
   "d6d6dc1bbd2c73ec17a753648275f5045d38ad281bac7e524a98b42d1ee4abaa" :GIT-BLOB
   "488942c470f6a6aef0e94d66e7bb518a514d85b0" :TEXT
   "(:base \"7f1cc54477483039bd98bd8c3f6508416f5c0ced\" :records ((:name \"development-01\" :id \"4001077803-command-50513-0\") (:name \"sensor-development\" :id \"4001077961-command-55299-0\") (:name \"reader-development\" :id \"4001078036-command-57183-0\") (:name \"development-02\" :id \"4001078088-command-58434-0\") (:name \"check-core\" :id \"4001078210-command-63054-0\") (:name \"coverage\" :id \"4001078210-command-63055-0\") (:name \"benchmark\" :id \"4001078210-command-63056-0\") (:name \"integrated\" :id \"4001078597-command-72887-0\")) :final-paths (\"src/dispatch/begin.lisp\" \"src/dispatch/build.lisp\" \"src/dispatch/claim.lisp\" \"src/dispatch/package.lisp\" \"src/dispatch/recycle.lisp\" \"src/dispatch/start.lisp\" \"src/dispatch/step.lisp\" \"src/dispatch/types.lisp\" \"arcdocdb.asd\" \"tests/scheduler/pool-start.lisp\" \"tools/measure-pool-start.lisp\" \"spikes/out/pool-start/coverage-run.lisp\" \"spikes/out/pool-start/dispatch-coverage-reader.lisp\" \"spikes/out/pool-start/reader-run.lisp\" \"spikes/out/pool-start/tool-run.lisp\" \"docs/implementazione/pool-prepara.md\" \"docs/implementazione/pool-prepara-metodo.md\" \"docs/implementazione/pool-prepara-revisione.md\" \"CHANGELOG.md\" \"docs/implementazione/README.md\" \"docs/implementazione/pool-prepara-risultati.md\") :spike-directory \"spikes/out/4001078480-check-70936-0/\")
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
  (:PATH #A((33) BASE-CHAR . "tools/measure-pool-lifecycle.lisp") :BYTES 26190 :SHA256
   "87c4985bc50445ab77c2196de535b83e42e107ff7a9b2ac8bd5d7f04b7f90fc0" :GIT-BLOB
   "3a229eecc3c158cec9af8fad6abd5fc2d980e2dd" :TEXT
   ";;;; C4: attuazione logica worker; APPLY e REGISTRY separati dalle barriere della fixture.
;;;; Preregistrato: cinque repliche di 4096 cicli, 128 warmup, GC completa prima del sensore.
;;;; APPLY usa richiesta privata quiescente; REGISTRY usa due owner reali preavviati.
;;;; Nessun clock, thread o attesa in prodotto; questo file contiene soltanto il sensore C4.
;;;; --self-test oppure --bench directory-nuova/; startup/errori esclusi dal percorso caldo.
;;;; Feature biblioteca: :arcdocdb-pool-lifecycle-measure-library.
;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008 REQ-BEN-001 REQ-BEN-002
;;; OWNER: sensore/registri al coordinatore; ogni contesto al suo worker di startup.
;;; SHARED: solo pubblicazione iniziale C4 e porte del protocollo, senza messaggi nel clock.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require :asdf) (require :sb-md5) (require :sb-posix))
(defpackage #:arcdocdb.pool-lifecycle.measure (:use #:cl))
(in-package #:arcdocdb.pool-lifecycle.measure)
(declaim (optimize (safety 3) (speed 2) (debug 2)))
(defconstant +iterations+ 4096)
(defconstant +warmup+ 128)
(defconstant +replicas+ 5)

(defun fingerprints ()
  \"ASD, controller, test e sensore: confronto di stabilita, non autenticita.\"
  (loop for path in (append '(#p\"arcdocdb.asd\" #p\"tools/measure-pool-lifecycle.lisp\")
                            (sort (append (directory \"src/**/*.lisp\") (directory \"tests/**/*.lisp\"))
                                  #'string< :key #'namestring))
        collect (list :file (enough-namestring path)
                      :md5 (format nil \"~(~{~2,'0X~}~)\" (coerce (sb-md5:md5sum-file path) 'list)))))

(defun load-product ()
  \"Compila prima della misura; warning/style-warning fatali salvo ridefinizione runtime ASDF.\"
  (setf asdf:*compile-file-failure-behaviour* :error asdf:*compile-file-warnings-behaviour* :error)
  (let ((*standard-output* *error-output*))
    (handler-bind ((warning (lambda (c)
                             (unless (typep c 'sb-kernel:redefinition-warning)
                               (error \"COD-01 tools/measure-pool-lifecycle.lisp: ~A.\" c)))))
      (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
      (asdf:load-system \"arcdocdb/tests\" :force t))))

(defun api (name)
  \"Risolve soltanto API pubbliche prima del clock; un nome mancante e difetto C4.\"
  (multiple-value-bind (symbol visibility) (find-symbol name \"ARCDOCDB.SCHEDULER\")
    (unless (and symbol (eq :external visibility) (fboundp symbol))
      (error \"COD-60 tools/measure-pool-lifecycle.lisp: API ~A assente.\" name))
    (symbol-function symbol)))

(defun lookup-function (name package &optional setter)
  \"API e accessor C4 risolti prima del clock; niente simboli o closure nel percorso caldo.\"
  (let ((symbol (find-symbol name package)))
    (unless symbol (error \"COD-60: simbolo ~A/~A assente.\" package name))
    (fdefinition (if setter (list 'setf symbol) symbol))))

(defun verify-apply (apply port active status)
  \"Oracolo scalare indipendente per ciascun risultato applicato o ripetuto.\"
  (multiple-value-bind (actual action) (funcall apply port)
    (unless (and (eq active actual) (eq status action))
      (error \"COD-60: applica restituisce ~S/~S invece di ~S/~S.\" actual action active status))))

(defun verify-registry (read registry actual target pending)
  \"Tre risultati pubblici distinti; un comando non vale una conferma.\"
  (multiple-value-bind (a b c) (funcall read registry)
    (unless (and (eql a actual) (eql b target) (eq c pending))
      (error \"COD-60: registro diverso dall'oracolo ~S/~S/~S.\" actual target pending))))

(defun make-context ()
  \"Contesto C1 autentico e IDLE, creato fuori dalla misura sul suo owner.\"
  (let ((ready (lookup-function \"CREA-LISTA-WRITER-PRONTI\" \"ARCDOCDB.EXECUTION\"))
        (context (lookup-function \"CREA-CONTESTO-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\")))
    (funcall context (funcall ready :shards 1 :capacity 1))))

(defun create-apply-cycle ()
  \"Fixture C4 privata: un thread svolge serialmente ruoli owner/coordinator.
Scrive REQUEST soltanto dopo la conferma precedente; nessun lease, reset o wrap.
Quattro applicazioni/ciclo: retired, unchanged, activated, unchanged; token fisso78.\"
  (let* ((port (funcall (api \"CREA-PORTA-WORKER-POOL\") (make-context)))
         (apply (api \"APPLICA-STATO-WORKER-POOL\"))
         (set-request (lookup-function \"PORTA-WORKER-POOL-REQUEST\" \"ARCDOCDB.SCHEDULER\" t))
         (read-ack (lookup-function \"PORTA-WORKER-POOL-ACK\" \"ARCDOCDB.SCHEDULER\"))
         (generation 0))
    (values
     (lambda ()
       (declare (type fixnum generation))
       (let ((retired (* 2 (incf generation))))
         (funcall set-request retired port)
         (verify-apply apply port nil :retired)
         (verify-apply apply port nil :unchanged)
         (unless (= retired (the fixnum (funcall read-ack port)))
           (error \"COD-60: conferma ritiro diversa dalla generazione richiesta.\")))
       (let ((activated (1+ (* 2 (incf generation)))))
         (funcall set-request activated port)
         (verify-apply apply port t :activated)
         (verify-apply apply port t :unchanged)
         (unless (= activated (the fixnum (funcall read-ack port)))
           (error \"COD-60: conferma attivazione diversa dalla generazione richiesta.\")))
       78)
     78 (constantly nil))))

(defun fixture-worker (index ports failures coordinator ready stop)
  \"Solo startup C4: due contesti del worker, pubblicazione e attesa bounded fuori clock.\"
  (handler-case
      (progn
        (dolist (offset '(0 2))
          (setf (svref ports (+ index offset))
                (funcall (api \"CREA-PORTA-WORKER-POOL\") (make-context)
                         :coordinator coordinator :active (zerop index))))
        (sb-thread:signal-semaphore ready)
        (loop repeat 120 when (sb-thread:wait-on-semaphore stop :timeout 1d0) return t))
    (error (condition)
      (setf (svref failures index) condition)
      (sb-thread:signal-semaphore ready))))

(defun fixture-cleanup (threads stop)
  \"Termina soltanto i thread della fixture, con timeout esplicito; niente kill.\"
  (dolist (thread threads) (declare (ignore thread)) (sb-thread:signal-semaphore stop))
  (dolist (thread threads)
    (when (eq :join-timeout (sb-thread:join-thread thread :timeout 5d0 :default :join-timeout))
      (error \"COD-60: owner fixture non terminato entro il budget.\")))
  nil)

(defun create-registry-cycle ()
  \"Due registri distinti su due owner reali; attese e startup fuori dal sensore.
HOLD target1 CPU900, PENDING target2 actual1 pubblicato da un vero grow iniziale.
Ogni ciclo contiene due update e due letture; nessuna conferma finta; token34.\"
  (let* ((ports (make-array 4 :initial-element nil)) (failures (make-array 2 :initial-element nil))
         (ready (sb-thread:make-semaphore)) (stop (sb-thread:make-semaphore))
         (coordinator sb-thread:*current-thread*) (threads nil) (complete nil))
    (unwind-protect
         (progn
           (dotimes (index 2)
             (let ((i index))
               (push (sb-thread:make-thread
                      (lambda () (fixture-worker i ports failures coordinator ready stop))
                      :name \"pool-lifecycle-C4-startup\") threads)))
           (dotimes (index 2)
             (unless (sb-thread:wait-on-semaphore ready :timeout 5d0)
               (error \"COD-60: owner fixture non avviato entro il budget.\")))
           (dotimes (index 2) (when (svref failures index) (error (svref failures index))))
           (let* ((create (api \"CREA-CONTROLLORE-POOL\")) (register (api \"CREA-REGISTRO-POOL\"))
                  (update (api \"AGGIORNA-REGISTRO-POOL\")) (read (api \"LEGGI-REGISTRO-POOL\"))
                  (hold (funcall register (funcall create 1 :maximum 2 :initial 1 :period 1 :dwell 1)
                                 (vector (svref ports 0) (svref ports 1))))
                  (pending (funcall register (funcall create 1 :maximum 2 :initial 1 :period 1 :dwell 1)
                                    (vector (svref ports 2) (svref ports 3)))) (tick 1))
             (funcall update hold 1 128 900 900)
             (funcall update pending 0 128 100 900)
             (multiple-value-bind (target action actual outstanding) (funcall update pending 1 128 100 900)
               (unless (and (= 2 target) (eq :grow action) (= 1 actual) outstanding)
                 (error \"COD-60: grow iniziale non ha prodotto comando pendente.\")))
             (verify-registry read hold 1 1 nil) (verify-registry read pending 1 2 t)
             (setf complete t)
             (values
              (lambda ()
                (declare (type fixnum tick))
                (incf tick)
                (multiple-value-bind (target action actual outstanding) (funcall update hold tick 128 900 900)
                  (unless (and (= 1 target) (eq :hold action) (= 1 actual) (null outstanding))
                    (error \"COD-60: wrapper hold diverso dall'oracolo.\")))
                (verify-registry read hold 1 1 nil)
                (multiple-value-bind (target action actual outstanding) (funcall update pending tick 128 100 900)
                  (unless (and (= 2 target) (eq :pending action) (= 1 actual) outstanding)
                    (error \"COD-60: wrapper pending diverso dall'oracolo.\")))
                (verify-registry read pending 1 2 t)
                34)
              34 (lambda () (fixture-cleanup threads stop)))))
      (unless complete (fixture-cleanup threads stop)))))

(defun sample-record (replica iterations warmup token)
  \"Tutti i campi esistono prima di warmup, heap e clock; oracolo calcolato indipendentemente.\"
  (list :replica replica :status :running :stage :warmup :iterations iterations
        :warmup-iterations warmup :completed-iterations 0 :heap-bytes nil :raw-ticks nil
        :seconds nil :time-quality :pending :sink nil :diagnostic nil
        :expected-sink (logand most-positive-fixnum
                              (+ (* iterations token) (/ (* iterations (1- iterations)) 2)))))

(defun sample (function iterations token progress &key (warmup +warmup+) (clock #'get-internal-real-time))
  \"Misura bounded, GC prima del clock; anche l'errore conserva cicli e raw parziali.\"
  (unless (and (<= 1 iterations +iterations+) (<= 0 warmup +warmup+)
               (typep token '(integer 0 #.most-positive-fixnum)))
    (error \"COD-60: parametri fuori dal budget preregistrato.\"))
  (dotimes (i warmup) (funcall function))
  (sb-ext:gc :full t)
  (setf (getf progress :stage) :measured)
  (let ((before (funcall clock)) (heap-before (sb-ext:get-bytes-consed)) (sink 0) (failure nil))
    (declare (type fixnum sink))
    (handler-case
        (dotimes (i iterations)
          (setf sink (logand most-positive-fixnum (+ sink i (the fixnum (funcall function))))
                (getf progress :completed-iterations) (1+ i)))
      (error (condition) (setf failure condition)))
    (let ((heap (- (sb-ext:get-bytes-consed) heap-before)) (ticks (- (funcall clock) before)))
      (setf (getf progress :heap-bytes) heap (getf progress :raw-ticks) ticks
            (getf progress :sink) sink (getf progress :time-quality)
            (if (zerop ticks) :below-resolution :measured)
            (getf progress :seconds) (when (plusp ticks) (/ ticks (float internal-time-units-per-second 1d0))))
      (when failure (error failure))
      (unless (and (>= heap 0) (>= ticks 0) (= sink (getf progress :expected-sink)))
        (error \"COD-60: heap/clock negativo o sink ~D diverso da ~D.\" sink (getf progress :expected-sink)))
      (setf (getf progress :status) :ok (getf progress :stage) :complete)))
  progress)

(defun campaign-group (name maker report checkpoint)
  \"Una fixture startup e cinque repliche; gli errori mantengono anche il raw parziale.\"
  (multiple-value-bind (function token cleanup) (funcall maker)
    (unwind-protect
         (dotimes (replica +replicas+)
           (let ((progress (sample-record replica +iterations+ +warmup+ token)))
             (setf (getf progress :campaign) name (getf report :current-replica) replica
                   (getf report :samples) (append (getf report :samples) (list progress)))
             (funcall checkpoint)
             (sample function +iterations+ token progress)
             (funcall checkpoint)
             (unless (zerop (getf progress :heap-bytes))
               (setf (getf progress :status) :failed (getf progress :diagnostic) \"COD-30: heap osservato positivo.\")
               (error \"COD-30: heap positivo nella campagna ~S replica ~D.\" name replica))))
      (funcall cleanup)))
  report)

(defun campaign (report checkpoint)
  \"APPLY e REGISTRY misurati separatamente; nessuna sincronizzazione nel tratto caldo.\"
  (campaign-group :owner-apply #'create-apply-cycle report checkpoint)
  (campaign-group :coordinator-registry #'create-registry-cycle report checkpoint)
  (setf (getf report :current-replica) nil)
  report)

(defun make-report ()
  \"Confini espliciti: conferme logiche e fixture C4, nessuna misura park/wake o motore vivo.\"
  (list :schema-version 1 :kind :pool-lifecycle-benchmark :status :running :stage :pending
        :diagnostic nil :process-argv sb-ext:*posix-argv* :tool-arguments (uiop:command-line-arguments)
        :source-fingerprints-before (fingerprints) :source-fingerprints-after nil
        :source-consistency :pending :recorded-at (get-universal-time) :self-test nil
        :samples nil :current-replica nil :sbcl (lisp-implementation-version)
        :machine (machine-type) :os (software-type) :os-version (software-version) :safety 3
        :iterations +iterations+ :warmup +warmup+ :replicas +replicas+
        :timer-units-per-second internal-time-units-per-second
        :campaigns '((:owner-apply :real-context t :roles-serialized t :private-request-fixture t
                     :apply-per-cycle 4 :generation-increments-per-cycle 2 :token 78)
                    (:coordinator-registry :registries 2 :workers 2 :contexts 4 :ports 4
                     :updates-per-cycle 2 :reads-per-cycle 2 :token 34))
        :token-formula \"sample=N*cycle-token+N*(N-1)/2; APPLY=78; REGISTRY=34\"
        :limits '(:preallocated-product-and-inputs :startup-and-gc-excluded
                  :fixture-thread-barriers-outside-clock :no-thread-harness-heap-attribution
                  :counter-not-absolute-nonallocation-proof :external-load-uncontrolled
                  :clock-zero-is-below-resolution :no-time-threshold-no-tuning-claim
                  :no-physical-start-retire-park-wake-shutdown-io-durability-qualification)))

(defun acquire-directory (path)
  \"Directory esclusiva 0700; rifiuta una destinazione precedente senza scriverla.\"
  (let ((directory (uiop:ensure-directory-pathname (merge-pathnames path (uiop:getcwd)))))
    (ensure-directories-exist
     (merge-pathnames \"parent-placeholder\" (uiop:pathname-parent-directory-pathname directory)))
    (sb-posix:mkdir (namestring directory) #o700)
    directory))

(defun write-report (report directory)
  \"Checkpoint esclusivo nella directory reclamata; ultimo rapporto leggibile conservato.\"
  (with-open-file (stream (merge-pathnames \"report.next.lisp\" directory)
                          :direction :output :if-exists :supersede)
    (let ((*print-readably* t)) (write report :stream stream :pretty t) (terpri stream)))
  (uiop:rename-file-overwriting-target (merge-pathnames \"report.next.lisp\" directory)
                                     (merge-pathnames \"report.lisp\" directory)))

(defun run-driver (args &key (product-loader #'load-product) (tester #'self-test) (runner #'campaign))
  \"CLI, load e sensori conservati; fallimenti mantengono replica e contatori già raccolti.\"
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

(defun fresh-self-test-directory ()
  \"Fixture temporanea esclusiva; limite esplicito di mille collisioni.\"
  (loop for attempt below 1000
        for directory = (merge-pathnames
                         (format nil \"arcdocdb-pool-lifecycle-measure-~D-~D-~D/\"
                                 (get-universal-time) (sb-posix:getpid) attempt)
                         (uiop:temporary-directory))
        do (handler-case (progn (sb-posix:mkdir (namestring directory) #o700)
                                (return-from fresh-self-test-directory directory))
             (sb-posix:syscall-error (condition)
               (unless (= sb-posix:eexist (sb-posix:syscall-errno condition)) (error condition)))))
  (error \"COD-60: impossibile acquisire directory della fixture.\"))

(defun read-self-test-report (directory)
  \"Legge soltanto la fixture prodotta dal sensore; nessuna valutazione del dato.\"
  (let ((*read-eval* nil))
    (with-open-file (stream (merge-pathnames \"report.lisp\" directory)) (read stream))))

(defun self-test-reporter ()
  \"Destinazione precedente intatta; campione completo e raw parziale sopravvivono all'errore.\"
  (let ((root (fresh-self-test-directory)))
    (unwind-protect
         (let* ((existing (acquire-directory (merge-pathnames \"existing/\" root)))
                (failed (merge-pathnames \"failed/\" root)))
           (write-report '(:sentinel :unchanged) existing)
           (unless (and (eq :failed (getf (run-driver (list \"--bench\" (namestring existing))
                                                    :product-loader (constantly nil)
                                                    :tester (constantly :passed)) :status))
                        (equal (read-self-test-report existing) '(:sentinel :unchanged)))
             (error \"COD-60: report precedente non conservato.\"))
           (run-driver (list \"--bench\" (namestring failed))
                       :product-loader (constantly nil) :tester (constantly :passed)
                       :runner (lambda (report checkpoint)
                                 (setf (getf report :current-replica) 1 (getf report :samples)
                                       (list (list :status :ok :raw-ticks 3 :heap-bytes 0)
                                             (list :status :running :raw-ticks 7 :heap-bytes 11
                                                   :diagnostic nil)))
                                 (funcall checkpoint)
                                 (error \"fixture: replica interrotta\")))
           (let* ((saved (read-self-test-report failed)) (samples (getf saved :samples)))
             (unless (and (eq :failed (getf saved :status)) (= 1 (getf saved :current-replica))
                          (= 2 (length samples)) (eq :ok (getf (first samples) :status))
                          (eq :failed (getf (second samples) :status))
                          (= 7 (getf (second samples) :raw-ticks))
                          (= 11 (getf (second samples) :heap-bytes)))
               (error \"COD-60: campione precedente o raw del fallimento persi.\"))))
      ;; La cancellazione C4 riguarda soltanto la directory acquisita da questa fixture.
      (uiop:delete-directory-tree root :validate t)))
  :passed)

(defun self-test-partial-sample ()
  \"Errore del ciclo misurato: clock/heap/sink e numero completato sono preservati.\"
  (let ((progress (sample-record 0 4 0 0)) (calls 0) (clock 0))
    (unless (handler-case
                (progn (sample (lambda ()
                                 (incf calls)
                                 (when (= calls 2) (error \"fixture: misura interrotta\"))
                                 0)
                               4 0 progress :warmup 0 :clock (lambda () (incf clock 7)))
                       nil)
              (error (condition)
                (setf (getf progress :status) :expected-rejection
                      (getf progress :diagnostic) (princ-to-string condition)) t))
      (error \"COD-60: ciclo difettoso non interrotto.\"))
    (unless (and (= calls 2) (= 1 (getf progress :completed-iterations))
                 (= 0 (getf progress :sink)) (= 7 (getf progress :raw-ticks))
                 (>= (getf progress :heap-bytes) 0) (eq :measured (getf progress :stage)))
      (error \"COD-60: raw parziale della misura non conservato.\"))
    progress))

(defun self-test-invalid-input ()
  \"Rifiuto tipizzato fuori misura; il campione invalido non applica un prefisso.\"
  (let* ((controller (funcall (api \"CREA-CONTROLLORE-POOL\") 4))
         (update (api \"AGGIORNA-CONTROLLORE-POOL\")) (read (api \"LEGGI-CONTROLLORE-POOL\")))
    (funcall update controller 0 128 100 900 1)
    (let ((before (multiple-value-list (funcall read controller))))
      (unless (handler-case
                  (progn (funcall update controller 500 128 1001 900 1) nil)
                (error (condition)
                  (typep condition (find-symbol \"INVALID-ARGUMENT\" \"ARCDOCDB.CONDITIONS\"))))
        (error \"COD-60 tools/measure-pool-lifecycle.lisp: campione invalido accettato o errore non tipizzato.\"))
      (unless (equal before (multiple-value-list (funcall read controller)))
        (error \"COD-60 tools/measure-pool-lifecycle.lisp: campione invalido muta il controller.\"))))
  :passed)

(defun self-test-composed (maker)
  \"Fixture positive API prima della campagna; cleanup bounded anche dopo l'errore.\"
  (multiple-value-bind (function token cleanup) (funcall maker)
    (let ((progress (sample-record 0 4 0 token)))
      (unwind-protect (sample function 4 token progress :warmup 0)
        (funcall cleanup))
      progress)))

(defun self-test ()
  \"Fixture positiva/negativa: sensore heap, sink, clock, oracolo API, output e CLI.\"
  (let* ((baseline (sample-record 0 +iterations+ +warmup+ 0))
         (positive (sample-record 0 16 0 1048576)) (probe nil)
         (wrong (sample-record 0 2 0 0)) (zero (sample-record 0 2 0 0)) (composed nil))
    (sample (lambda () 0) +iterations+ 0 baseline)
    (unless (zerop (getf baseline :heap-bytes)) (error \"COD-60: baseline heap non nullo.\"))
    (sample (lambda () (setf probe (make-array 1048576 :element-type '(unsigned-byte 8) :initial-element 0))
              (length probe)) 16 1048576 positive :warmup 0)
    (unless (and (= 1048576 (length probe)) (>= (getf positive :heap-bytes) (* 16 1048576)))
      (error \"COD-60: allocazione deliberata non rilevata.\"))
    (unless (handler-case (progn (sample (lambda () 1) 2 0 wrong :warmup 0) nil)
              (error (condition) (setf (getf wrong :status) :expected-rejection
                                      (getf wrong :diagnostic) (princ-to-string condition)) t))
      (error \"COD-60: sink errato non respinto.\"))
    (sample (lambda () 0) 2 0 zero :warmup 0 :clock (constantly 0))
    (unless (and (eq :below-resolution (getf zero :time-quality)) (null (getf zero :seconds)))
      (error \"COD-60: clock nullo convertito in durata.\"))
    (setf composed (self-test-composed #'create-apply-cycle))
    (unless (handler-case
                (progn (verify-apply (lambda (port) (declare (ignore port)) (values nil :retired))
                                     nil t :activated) nil)
              (error () t))
      (error \"COD-60: risultato owner difforme non respinto.\"))
    (unless (handler-case
                (progn (verify-registry (lambda (registry) (declare (ignore registry)) (values 1 1 nil))
                                        nil 1 2 t) nil)
              (error () t))
      (error \"COD-60: risultato registro difforme non respinto.\"))
    (let ((called nil))
      (dolist (args '(nil (\"--bench\") (\"--bad\") (\"--bench\" \"directory\" \"extra\")))
        (unless (and (eq :failed (getf (run-driver args :product-loader (lambda () (setf called t))) :status))
                     (null called))
          (error \"COD-60: CLI invalida eseguita.\"))))
    (list :status :ok :baseline baseline :positive-control positive :wrong-sink-probe wrong
          :zero-clock-probe zero :composed-api-probe composed
          :composed-registry-probe (self-test-composed #'create-registry-cycle) :invalid-cli :rejected
          :owner-and-registry-oracle-positive-negative :passed :invalid-non-hot (self-test-invalid-input)
          :existing-destination-and-partial-raw (self-test-reporter)
          :measured-partial-raw (self-test-partial-sample))))

(defun main ()
  \"Rapporto leggibile; ogni errore esce nonzero con diagnosi C4.\"
  (let ((report (run-driver (uiop:command-line-arguments))))
    (let ((*print-readably* t)) (write report :pretty t) (terpri))
    (unless (eq :ok (getf report :status))
      (format *error-output* \"~&tools/measure-pool-lifecycle.lisp: ~A~%\" (getf report :diagnostic))
      (uiop:quit 1))))
(unless (member :arcdocdb-pool-lifecycle-measure-library *features*) (main))
")
  (:PATH #A((59) BASE-CHAR . "spikes/out/lifecycle-measure/lifecycle-coverage-reader.lisp") :BYTES
   15177 :SHA256 "4696348d1a4cb37c1d135e2df29309f4f7abc58b9da3220214612109fd5bfb2c" :GIT-BLOB
   "9a9e4d9182c5913c4f26037312a7edf59a323956" :TEXT
   ";;;; C4: native/HTML concordance for whole Scheduler, no exclusions or missing-path removal.
;;;; Preserves every missing native index/path; no inference of MC/DC.
;;;; --self-test | --audit native-state.lisp cover-index.html new-report.lisp
;;;; Library feature: :lifecycle-coverage-reader-library. All inputs are trusted recorder data.
(eval-when (:compile-toplevel :load-toplevel :execute) (require :asdf))
(defpackage #:arcdocdb.lifecycle.coverage.reader (:use #:cl))
(in-package #:arcdocdb.lifecycle.coverage.reader)
(declaim (optimize (safety 3) (debug 3)))

(defparameter +scope-files+
  '(\"src/scheduler/package.lisp\" \"src/scheduler/lifecycle-types.lisp\"
    \"src/scheduler/lifecycle-build.lisp\" \"src/scheduler/lifecycle-read.lisp\"
    \"src/scheduler/lifecycle-worker.lisp\" \"src/scheduler/lifecycle-update.lisp\"))

(defun reader-require (predicate detail)
  \"A malformed sensor input is a COD-60 failure, never a discarded native row.\"
  (unless predicate (error \"COD-60 lifecycle-coverage-reader.lisp: ~A.\" detail)))

(defun source-identity (path)
  \"Keeps module namespaces; NIL means outside the explicit whole-module scope.\"
  (reader-require (stringp path) \"source path is not a string\")
  (let ((start (if (uiop:string-prefix-p \"src/\" path) 0
                   (let ((position (search \"/src/\" path :from-end t)))
                     (when position (1+ position))))))
    (when start
      (let ((identity (subseq path start)))
        (when (or (string= \"src/scheduler/\" identity)
                  (or (string= \"src/scheduler/package.lisp\" identity)
                      (uiop:string-prefix-p \"src/scheduler/lifecycle-\" identity)))
          identity)))))

(defun native-row (entry)
  \"Counts every native datum and preserves unhit expression/branch identities, with positions.\"
  (reader-require (and (consp entry) (consp (cdr entry))) \"native entry shape\")
  (reader-require (and (vectorp (cadr entry)) (vectorp (cddr entry))) \"native arrays missing\")
  (reader-require (= (length (cadr entry)) (length (cddr entry))) \"native path/bit length mismatch\")
  (let ((eh 0) (et 0) (bh 0) (bt 0) (missing nil))
    (loop for path across (cadr entry) for bit across (cddr entry) for index from 0
          do (reader-require (listp path) \"native path is not a list\")
             (reader-require (member bit '(0 1)) \"native coverage value is not a bit\")
             (if (member (car path) '(:then :else))
                 (progn (incf bt) (incf bh bit))
                 (progn (incf et) (incf eh bit)))
             (when (= bit 0)
               (push (list :native-index index
                           :kind (if (member (car path) '(:then :else)) :branch :expression)
                           :path path) missing)))
    (list :file (or (source-identity (car entry)) (car entry))
          :expressions-hit eh :expressions-total et :branches-hit bh :branches-total bt
          :missing (nreverse missing))))

(defun row-counts (row)
  \"A row retains its full source identity plus hit/total counts, without rounding.\"
  (list (getf row :file) (getf row :expressions-hit) (getf row :expressions-total)
        (getf row :branches-hit) (getf row :branches-total)))

(defun read-native (path)
  \"One trusted native datum only; reader evaluation is always disabled.\"
  (let ((*read-eval* nil) (eof (gensym \"EOF\")))
    (with-open-file (stream path :external-format :utf-8)
      (let ((value (read stream nil eof)))
        (reader-require (and (not (eq value eof)) (listp value)) \"native top-level list missing\")
        (reader-require (eq eof (read stream nil eof)) \"trailing native datum\")
        value))))

(defun scope-native-rows (raw)
  \"Every file in either scope is included; duplicate canonical identities are rejected.\"
  (let ((rows nil) (seen (make-hash-table :test 'equal)))
    (dolist (entry raw)
      (reader-require (and (consp entry) (stringp (car entry))) \"native source identity missing\")
      (let ((identity (source-identity (car entry))))
        (when identity
          (reader-require (not (gethash identity seen)) \"duplicate native source identity\")
          (setf (gethash identity seen) t)
          (push (native-row entry) rows))))
    (sort rows #'string< :key (lambda (row) (getf row :file)))))

(defun html-cells (row)
  \"Strict extraction of bounded TD cells from one trusted SB-COVER TR fragment.\"
  (let ((cursor 0) (cells nil))
    (loop for start = (search \"<td\" row :start2 cursor) while start
          do (let ((body (position #\\> row :start start))
                   (close (search \"</td>\" row :start2 start)))
               (reader-require (and body close (< body close)) \"HTML TD delimiters missing\")
               (push (subseq row (1+ body) close) cells)
               (setf cursor (+ close 5))))
    (nreverse cells)))

(defun html-source-name (cell)
  \"Requires exactly one source link; returns its undecorated basename.\"
  (let* ((start (search \"<a \" cell))
         (body (when start (position #\\> cell :start start)))
         (close (when body (search \"</a>\" cell :start2 body))))
    (reader-require (and start body close (< body close)) \"HTML source link missing\")
    (reader-require (not (search \"<a \" cell :start2 (+ close 4))) \"duplicate HTML source link\")
    (let ((name (subseq cell (1+ body) close)))
      (reader-require (and (plusp (length name)) (not (find #\\/ name))
                           (not (find #\\< name)) (not (find #\\> name))) \"HTML source basename invalid\")
      name)))

(defun html-count (cell)
  \"Only a nonnegative decimal integer is a coverage count; percentages are not read.\"
  (let ((clean (string-trim '(#\\Space #\\Tab #\\Return #\\Newline) cell)))
    (reader-require (and (plusp (length clean)) (every (lambda (c) (digit-char-p c 10)) clean))
                    \"HTML count is not a decimal integer\")
    (parse-integer clean :radix 10)))

(defun html-data-counts (row directory)
  \"SB-COVER summary schema: source, expression covered/total/percent, branch covered/total/percent.\"
  (let ((cells (html-cells row)))
    (reader-require (= 7 (length cells)) \"HTML summary row does not have seven cells\")
    (let ((result (list (concatenate 'string directory (html-source-name (first cells)))
                        (html-count (second cells)) (html-count (third cells))
                        (html-count (fifth cells)) (html-count (sixth cells)))))
      (reader-require (and (<= (second result) (third result)) (<= (fourth result) (fifth result)))
                      \"HTML covered count exceeds denominator\")
      result)))

(defun html-count-rows (html)
  \"Reads actual HTML counts by module heading; equal basenames in two scopes stay distinct.\"
  (let ((cursor 0) (directory nil) (rows nil) (seen (make-hash-table :test 'equal)))
    (loop for start = (search \"<tr\" html :start2 cursor) while start
          do (let ((close (search \"</tr>\" html :start2 start)))
               (reader-require close \"HTML TR delimiter missing\")
               (let ((row (subseq html start (+ close 5))))
                 (cond
                   ((search \"class='subheading'\" row)
                    (let* ((cells (html-cells row))
                           (identity (and (= 1 (length cells)) (source-identity (first cells)))))
                      (setf directory (when (member identity '(\"src/scheduler/\")
                                                    :test #'equal) identity))))
                   ((and directory (or (search \"class='odd'\" row) (search \"class='even'\" row)))
                    (let* ((counts (html-data-counts row directory)) (identity (first counts)))
                      (reader-require (not (gethash identity seen)) \"duplicate HTML source identity\")
                      (setf (gethash identity seen) t)
                      (when (source-identity identity) (push counts rows))))
                   (t nil)))
               (setf cursor (+ close 5))))
    (sort rows #'string< :key #'first)))

(defun count-total (counts)
  \"Sums all four exact integer columns; no approved exclusion or estimated denominator.\"
  (loop for column from 1 to 4 collect (loop for row in counts sum (nth column row))))

(defun select-counts (counts prefix)
  \"Selects a named entire module/subset after the full inventory has been validated.\"
  (remove-if-not (lambda (row) (uiop:string-prefix-p prefix (first row))) counts))

(defun c3-pass-p (totals)
  \"Gate senza arrotondamenti: denominatori nonzero, percentuale inclusiva95.\"
  (and (plusp (second totals)) (plusp (fourth totals))
       (>= (* 100 (first totals)) (* 95 (second totals)))
       (>= (* 100 (third totals)) (* 95 (fourth totals)))))

(defun audit-coverage (native-path html-path output-path)
  \"Intero package: concordanza nativo/HTML, gate95% esatto, mancanti conservati.\"
  (let* ((raw (read-native native-path)) (rows (scope-native-rows raw))
         (counts (mapcar #'row-counts rows))
         (html-counts (html-count-rows (uiop:read-file-string html-path :external-format :utf-8)))
         (files (mapcar #'first counts)) (expected (sort (copy-list +scope-files+) #'string<))
         (totals (count-total counts)))
    (reader-require (equal files expected) \"native full-scope file inventory differs\")
    (reader-require (equal counts html-counts) \"native/HTML file identity or counts differ\")
    (reader-require (and (plusp (second totals)) (plusp (fourth totals))) \"zero denominator\")
    (let* ((passed (c3-pass-p totals))
           (report (list :schema-version 1 :kind :pool-lifecycle-coverage-audit
                         :status (if passed :ok :failed) :scope :entire-new-lifecycle-plus-package
                         :native-path (namestring (pathname native-path))
                         :html-path (namestring (pathname html-path))
                         :files rows :lifecycle-total totals :minimum-percent 95
                         :html-counts html-counts :html-counts-origin :parsed-sb-cover-index
                         :self-test :passed :exclusions nil :mcdc-inferred nil)))
      (with-open-file (stream output-path :direction :output :if-exists :error :external-format :utf-8)
        (let ((*print-readably* t)) (write report :stream stream :pretty t) (terpri stream)))
      (reader-require passed \"C3 expressions or branches below 95%; exact missing paths in report\")
      (format t \"~&Coverage audit PASS: ~D files; lifecycle ~S~%\" (length files) totals)
      report)))

(defun expect-rejection (thunk)
  \"A negative fixture must signal; silent acceptance is a sensor defect.\"
  (reader-require (handler-case (progn (funcall thunk) nil) (error () t)) \"negative fixture accepted\"))

(defun native-self-test ()
  \"Independent hit/denominator/missing-path oracle plus malformed length/bit fixtures.\"
  (let ((row (native-row (list* \"/fixture/src/scheduler/lifecycle-types.lisp\"
                               #((0) (1) (:then 2) (:else 2)) #*1010))))
    (reader-require (equal (row-counts row) '(\"src/scheduler/lifecycle-types.lisp\" 1 2 1 2)) \"native count oracle\")
    (reader-require (equal (getf row :missing)
                           '((:native-index 1 :kind :expression :path (1))
                             (:native-index 3 :kind :branch :path (:else 2)))) \"native missing-path oracle\"))
  (dolist (entry (list (list* \"bad-length\" #((0)) #*00)
                      (list* \"bad-bit\" #((0) (1)) #(0 2))
                      (list* \"bad-path\" #(1) #*0)))
    (expect-rejection (lambda () (native-row entry))))
  (expect-rejection
   (lambda () (scope-native-rows (list (list* \"/a/src/scheduler/lifecycle-types.lisp\" #((0)) #*0)
                                      (list* \"/b/src/scheduler/lifecycle-types.lisp\" #((1)) #*1)))))
  :passed)

(defun html-self-test ()
  \"Conteggi precisi nel modulo intero; input duplicato o difforme rifiutato.\"
  (let* ((heading \"<tr class='subheading'><td colspan='7'>/fixture/src/scheduler/</td></tr>\")
         (row \"<tr class='odd'><td class='text-cell'><a href='fixture.html'>lifecycle-types.lisp</a></td><td>1</td><td>2</td><td>50.0</td><td>3</td><td>4</td><td>75.0</td></tr>\")
         (expected '((\"src/scheduler/lifecycle-types.lisp\" 1 2 3 4))))
    (reader-require (equal (html-count-rows (concatenate 'string heading row)) expected)
                    \"HTML count/namespace oracle\")
    (expect-rejection (lambda () (html-count-rows (concatenate 'string heading row row))))
    (expect-rejection (lambda () (html-count-rows \"<tr class='subheading'>\")))
    (expect-rejection (lambda () (html-data-counts \"<td>missing</td>\" \"src/scheduler/\")))
    (expect-rejection (lambda () (html-count \"-1\")))
    (expect-rejection (lambda () (html-count \"1.5\")))
    (expect-rejection (lambda () (html-source-name \"<a href='f'>nested/file.lisp</a>\"))))
  :passed)

(defun scope-self-test ()
  \"Scope explicito: package e tutti i lifecycle, inclusi inattesi; vecchio codice escluso.\"
  (reader-require (equal (source-identity \"/fixture/src/scheduler/lifecycle-types.lisp\")
                         \"src/scheduler/lifecycle-types.lisp\") \"scope positive path\")
  (reader-require (null (source-identity \"/fixture/src/scheduler/types.lisp\")) \"old source entered new scope\")
  (reader-require (equal (source-identity \"/fixture/src/scheduler/lifecycle-unexpected.lisp\")
                         \"src/scheduler/lifecycle-unexpected.lisp\") \"unexpected lifecycle silently filtered\")
  (reader-require (equal (mapcar (lambda (row) (getf row :file))
                                (scope-native-rows (list (list* \"/fixture/src/scheduler/types.lisp\" #((0)) #*1)
                                                         (list* \"/fixture/src/scheduler/lifecycle-types.lisp\" #((0)) #*1))))
                         '(\"src/scheduler/lifecycle-types.lisp\")) \"scope fixture identity oracle\")
  :passed)

(defun coverage-reader-self-test ()
  \"All fixtures must detect malformed input before any campaign report is written.\"
  (native-self-test) (html-self-test) (scope-self-test)
  (reader-require (and (c3-pass-p '(95 100 95 100)) (c3-pass-p '(19 20 19 20))
                       (not (c3-pass-p '(94 100 100 100)))
                       (not (c3-pass-p '(100 100 94 100)))
                       (not (c3-pass-p '(0 0 0 0)))) \"C3 gate positive/negative exact oracle\")
  (reader-require (equal (count-total '((\"one\" 1 2 3 4) (\"two\" 5 6 7 8))) '(6 8 10 12))
                  \"aggregate count oracle\")
  :passed)

(defun coverage-reader-main ()
  \"CLI C4: explicit diagnostics and nonzero exit for every failed verification.\"
  (handler-case
      (let ((args (uiop:command-line-arguments)))
        (coverage-reader-self-test)
        (cond ((equal args '(\"--self-test\")) (format t \"~&Coverage reader self-test PASS~%\"))
              ((and (= 4 (length args)) (string= \"--audit\" (first args)))
               (audit-coverage (second args) (third args) (fourth args)))
              (t (error \"COD-61 lifecycle-coverage-reader.lisp: use --self-test or --audit native html new-report.\"))))
    (error (condition)
      (format *error-output* \"~&lifecycle-coverage-reader.lisp: ~A~%\" condition)
      (uiop:quit 1))))

(unless (member :lifecycle-coverage-reader-library *features*) (coverage-reader-main))
")
  (:PATH #A((27) BASE-CHAR . "tools/evidence-storage.lisp") :BYTES 21261 :SHA256
   "8f287772a41b1ebe0e7b3ecc3826a4148082efed428a9749655977e62a9c15a6" :GIT-BLOB
   "fa2b5d36dca0837e2ed5e49b282887b2e110b2b7" :TEXT
   ";;;; Prove conservate come bytes: dati Lisp plain o descriptor gzip verificato.
;;; REQ: REQ-VAL-001 REQ-AFF-012
;;; SB-POSIX e SB-ALIEN sono componenti di SBCL; nessuna libreria esterna.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require :sb-posix))

(defpackage #:arcdocdb.evidence
  (:use #:cl)
  (:export #:read-evidence #:call-with-evidence-bytes
           #:file-bytes #:file-sha256 #:invalid-evidence))

(in-package #:arcdocdb.evidence)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

(define-condition invalid-evidence (error)
  ((path :initarg :path :reader evidence-path)
   (diagnostic :initarg :diagnostic :reader evidence-diagnostic))
  (:report (lambda (condition stream)
             (format stream \"Evidenza non valida ~A: ~A\"
                     (evidence-path condition) (evidence-diagnostic condition)))))

(defun %invalid (path control &rest arguments)
  (error 'invalid-evidence :path path
         :diagnostic (apply #'format nil control arguments)))

(defmacro %with-evidence-errors ((path) &body body)
  `(handler-case (progn ,@body)
     (invalid-evidence (condition) (error condition))
     (error (condition) (%invalid ,path \"~A\" condition))))

(defun %check-limit (path limit)
  (unless (and (integerp limit) (not (minusp limit)))
    (%invalid path \"MAX-EXPANDED-BYTES deve essere un intero non negativo.\")))

(defun %directory-pathname (path)
  (make-pathname :name nil :type nil :version nil :defaults path))

;; OPENAT mantiene il payload nella directory posseduta, anche se il nome
;; della directory viene rinominato durante la verifica. NOFOLLOW impedisce
;; che una sostituzione del leaf con un symlink cambi il file aperto.
(sb-alien:define-alien-routine (\"openat\" %openat) sb-alien:int
  (directory-fd sb-alien:int) (name sb-alien:c-string) (flags sb-alien:int))

(defun %open-regular-at (directory-fd leaf path)
  (let ((fd (%openat directory-fd leaf
                    (logior sb-posix:o-rdonly sb-posix:o-nofollow
                            sb-posix:o-nonblock))))
    (when (minusp fd)
      (error 'sb-posix:syscall-error :name 'openat :errno (sb-alien:get-errno)))
    (unwind-protect
         (progn
           (unless (sb-posix:s-isreg (sb-posix:stat-mode (sb-posix:fstat fd)))
             (%invalid path \"Il file deve essere un file regolare.\"))
           (prog1 (sb-sys:make-fd-stream fd :input t
                                       :element-type '(unsigned-byte 8)
                                       :auto-close t)
             (setf fd nil)))
      (when fd (ignore-errors (sb-posix:close fd))))))

(defun %call-with-source (path function)
  (let* ((real (truename path))
         (base (%directory-pathname real))
         (directory-fd (sb-posix:open
                        (namestring base)
                        (logior sb-posix:o-rdonly sb-posix:o-directory
                                sb-posix:o-nofollow sb-posix:o-nonblock))))
    (unwind-protect
         (with-open-stream (stream (%open-regular-at directory-fd
                                                   (file-namestring real) path))
           (funcall function stream real directory-fd))
      (ignore-errors (sb-posix:close directory-fd)))))

(defun %stream-bytes (stream)
  (sb-posix:stat-size (sb-posix:fstat (sb-sys:fd-stream-fd stream))))

(defun file-bytes (path)
  \"Numero di bytes del file regolare, indipendente dalla codifica del testo.\"
  (%with-evidence-errors (path)
    (%call-with-source path
                       (lambda (stream real directory-fd)
                         (declare (ignore real directory-fd))
                         (%stream-bytes stream)))))

(defun %cleanup-process (process)
  (when process
    (unwind-protect
         (progn
           (when (member (sb-ext:process-status process) '(:running :stopped))
             (sb-ext:process-kill process sb-posix:sigkill))
           (sb-ext:process-wait process))
      (sb-ext:process-close process))))

(defun %check-process (process program path)
  (sb-ext:process-wait process)
  (unless (and (eq :exited (sb-ext:process-status process))
               (eql 0 (sb-ext:process-exit-code process)))
    (%invalid path \"~A: stato ~S, exit/signal ~S.\"
              program (sb-ext:process-status process)
              (sb-ext:process-exit-code process))))

(defun %hex64-p (value)
  (and (stringp value) (= 64 (length value))
       (every (lambda (character)
                (or (char<= #\\0 character #\\9)
                    (char<= #\\a character #\\f)
                    (char<= #\\A character #\\F)))
              value)))

(defun %stream-sha256 (stream path)
  ;; Un FD regolare evita la copia implicita in tempfile di RUN-PROGRAM.
  ;; stdin evita anche l'escaping di nomi contenenti newline in shasum.
  (file-position stream 0)
  (let ((process nil)
        (output (make-array 69 :element-type '(unsigned-byte 8))))
    (unwind-protect
         (progn
           (setf process (sb-ext:run-program \"shasum\" '(\"-a\" \"256\")
                                            :search t :wait nil :input stream
                                            :output :stream :error nil))
           (unless process (%invalid path \"Impossibile avviare shasum -a 256.\"))
           (let ((count (read-sequence output (sb-ext:process-output process))))
             (unless (and (= count 68)
                          (= (aref output 64) 32) (= (aref output 65) 32)
                          (= (aref output 66) 45) (= (aref output 67) 10))
               (%invalid path \"Output SHA256 di shasum non valido.\"))
             (%check-process process \"shasum -a 256\" path)
             (let ((hash (map 'string #'code-char (subseq output 0 64))))
               (unless (%hex64-p hash)
                 (%invalid path \"shasum non ha restituito 64 cifre esadecimali.\"))
               (string-downcase hash))))
      (unwind-protect (%cleanup-process process)
        (file-position stream 0)))))

(defun file-sha256 (path)
  \"SHA256 dei bytes originali: esattamente 64 cifre esadecimali lowercase.\"
  (%with-evidence-errors (path)
    (%call-with-source path
                       (lambda (stream real directory-fd)
                         (declare (ignore real directory-fd))
                         (%stream-sha256 stream path)))))

(defun %read-limited-octets (stream path limit)
  (let ((size (%stream-bytes stream)))
    (when (> size limit)
      (%invalid path \"~D bytes superano MAX-EXPANDED-BYTES (~D).\" size limit))
    (when (>= size array-dimension-limit)
      (%invalid path \"~D bytes superano il limite degli array SBCL.\" size))
    (file-position stream 0)
    (let ((octets (make-array size :element-type '(unsigned-byte 8))))
      (unless (= size (read-sequence octets stream))
        (%invalid path \"Il file si è accorciato durante la lettura (~D bytes).\" size))
      (unless (eq :eof (read-byte stream nil :eof))
        (%invalid path \"Il file è cresciuto durante la lettura limitata.\"))
      octets)))

(defun %descriptor-candidate-p (octets)
  \"Riconosce il marker al primo livello senza interpretare simboli o dati.
Stringhe, commenti e valori annidati non sono marker. Il parser Lisp completo
viene usato soltanto per un candidato descriptor, mai per un report plain.\"
  (let ((position 0) (size (length octets)) (depth 0) (kind-p nil))
    (labels ((take () (when (< position size)
                       (prog1 (aref octets position) (incf position))))
             (peek () (when (< position size) (aref octets position)))
             (space-p (byte) (member byte '(9 10 12 13 32)))
             (delimiter-p (byte)
               (or (null byte) (space-p byte) (member byte '(40 41 34 59 39 96 44))))
             (skip-string ()
               (loop for byte = (take) while byte
                     do (cond ((= byte 92) (take))
                              ((= byte 34) (return)))))
             (skip-comment ()
               (loop with nesting = 1 for byte = (take) while byte
                     do (cond ((and (= byte 35) (eql (peek) 124))
                               (take) (incf nesting))
                              ((and (= byte 124) (eql (peek) 35))
                               (take) (when (zerop (decf nesting)) (return))))))
             (atom-token (first-byte)
               ;; Se il token supera 32 caratteri non può essere il marker.
               (let ((token (make-string 32)) (count 0) (quoted nil)
                     (escaped nil) (byte first-byte))
                 (loop
                   (cond
                     (escaped
                      (when (< count 32) (setf (char token count) (code-char byte)))
                      (incf count) (setf escaped nil))
                     ((= byte 92) (setf escaped t))
                     ((= byte 124) (setf quoted (not quoted)))
                     (t
                      (when (< count 32)
                        (setf (char token count)
                              (code-char (if (and (not quoted) (<= 97 byte 122))
                                             (- byte 32) byte))))
                      (incf count)))
                   (when (or (null (peek))
                             (and (not quoted) (not escaped) (delimiter-p (peek))))
                     (return (and (<= count 32) (subseq token 0 count))))
                   (setf byte (take)))))
             (next-token ()
               (loop for byte = (take)
                     do (cond
                          ((null byte) (return (values :eof nil)))
                          ((space-p byte))
                          ((= byte 59)
                           (loop for c = (take) while (and c (/= c 10))))
                          ((and (= byte 35) (eql (peek) 124))
                           (take) (skip-comment))
                          ((and (= byte 35) (eql (peek) 92))
                           (take) (take)
                           (loop until (delimiter-p (peek)) do (take))
                           (return (values :other nil)))
                          ((= byte 34) (skip-string) (return (values :other nil)))
                          ((= byte 40) (return (values :open nil)))
                          ((= byte 41) (return (values :close nil)))
                          ((member byte '(39 96 44))
                           (return (values :prefix nil)))
                          (t (return (values :atom (atom-token byte))))))))
      (loop
        (multiple-value-bind (type token) (next-token)
          (case type
            (:eof (return nil))
            (:open (incf depth) (setf kind-p nil))
            (:close
             (decf depth) (setf kind-p nil)
             (when (<= depth 0) (return nil)))
            (:prefix (setf kind-p nil))
            (otherwise
             (when (= depth 1)
               (when (and kind-p (equal token \":COMPRESSED-EVIDENCE\"))
                 (return t))
               (setf kind-p (equal token \":KIND\"))))))))))

(defun %read-plist-stream (stream path)
  (let ((*read-eval* nil) (*readtable* (copy-readtable nil)) (*read-base* 10)
        (*read-suppress* nil) (eof (gensym \"EOF\")))
    (let* ((data (read stream nil eof))
           (length (and (consp data) (list-length data))))
      (unless (and length (evenp length)
                   (loop for key in data by #'cddr always (keywordp key)))
        (%invalid path \"È richiesta una plist non vuota, propria e aciclica con chiavi keyword.\"))
      (unless (eq eof (read stream nil eof))
        (%invalid path \"Il file contiene più di una forma Lisp.\"))
      data)))

(defun %read-plist (octets path)
  ;; Solo descriptor piccoli; i report grandi si leggono direttamente dal file.
  (with-input-from-string (stream (sb-ext:octets-to-string octets :external-format :default))
    (%read-plist-stream stream path)))

(defun %descriptor-p (data)
  (loop for (key value) on data by #'cddr
        thereis (and (eq key :kind) (eq value :compressed-evidence))))

(defun %leaf-p (value)
  (and (stringp value) (plusp (length value))
       (not (member value '(\".\" \"..\") :test #'string=))
       (not (find-if (lambda (character)
                       (or (zerop (char-code character))
                           (find character \"/\\\\*?[]\")))
                     value))))

(defun %validate-descriptor (data path limit)
  (let ((fields '(:schema-version :kind :codec :payload :uncompressed-bytes
                  :uncompressed-sha256 :compressed-bytes :compressed-sha256))
        (seen nil))
    (loop for (key value) on data by #'cddr
          do (unless (member key fields)
              (%invalid path \"Campo descriptor sconosciuto: ~S.\" key))
             (when (member key seen)
               (%invalid path \"Campo descriptor duplicato: ~S.\" key))
             (push key seen))
    (unless (= (length fields) (length seen))
      (%invalid path \"Campi descriptor mancanti: ~S.\" (set-difference fields seen)))
    (unless (and (eql 1 (getf data :schema-version))
                 (eq :compressed-evidence (getf data :kind))
                 (eq :gzip (getf data :codec)))
      (%invalid path \"Descriptor richiesto: schema-version 1, kind :compressed-evidence, codec :gzip.\"))
    (unless (%leaf-p (getf data :payload))
      (%invalid path \"PAYLOAD deve essere un nome leaf non vuoto, senza NUL o wildcard.\"))
    (dolist (key '(:uncompressed-bytes :compressed-bytes))
      (unless (and (integerp (getf data key)) (not (minusp (getf data key))))
        (%invalid path \"~S deve essere un intero non negativo.\" key)))
    (dolist (key '(:uncompressed-sha256 :compressed-sha256))
      (unless (%hex64-p (getf data key))
        (%invalid path \"~S deve contenere esattamente 64 cifre esadecimali.\" key)))
    (when (> (getf data :uncompressed-bytes) limit)
      (%invalid path \"UNCOMPRESSED-BYTES (~D) supera MAX-EXPANDED-BYTES (~D).\"
                (getf data :uncompressed-bytes) limit))
    data))

(defun %make-temporary ()
  (let ((directory (or (sb-ext:posix-getenv \"TMPDIR\") \"/tmp\")))
    (sb-posix:mkstemp (concatenate 'string (string-right-trim \"/\" directory)
                                  \"/arcdocdb-evidence-XXXXXX\"))))

(defun %expand-to-temporary (input descriptor path limit)
  (multiple-value-bind (fd name) (%make-temporary)
    (let ((temporary (pathname name)) (stream nil) (process nil) (completed nil))
      (unwind-protect
           (progn
             (setf stream (sb-sys:make-fd-stream fd :input t :output t
                                               :element-type '(unsigned-byte 8)
                                               :auto-close t)
                   fd nil)
             (file-position input 0)
             (setf process (sb-ext:run-program \"gzip\" '(\"-dc\")
                                              :search t :wait nil :input input
                                              :output :stream :error nil))
             (unless process (%invalid path \"Impossibile avviare gzip -dc.\"))
             (let ((buffer (make-array 65536 :element-type '(unsigned-byte 8)))
                   (expected (getf descriptor :uncompressed-bytes)) (total 0))
               (loop for count = (read-sequence
                                  buffer (sb-ext:process-output process)
                                  :end (min (length buffer) (1+ (- expected total))))
                     until (zerop count)
                     do (when (or (> (+ total count) expected)
                                  (> (+ total count) limit))
                          (%invalid path \"gzip supera la dimensione dichiarata (~D) o il limite (~D).\"
                                    expected limit))
                        ;; Il controllo precede ogni write: mai un tempfile oltre N.
                        (write-sequence buffer stream :end count)
                        (incf total count))
               (%check-process process \"gzip -dc\" path)
               (unless (= total expected)
                 (%invalid path \"Dimensione espansa ~D, attesa ~D.\" total expected)))
             (finish-output stream)
             (unless (string-equal (getf descriptor :uncompressed-sha256)
                                   (%stream-sha256 stream path))
               (%invalid path \"SHA256 dei bytes espansi diverso da UNCOMPRESSED-SHA256.\"))
             (close stream) (setf stream nil)
             (setf completed t)
             temporary)
        (unwind-protect (%cleanup-process process)
          (unwind-protect
               (if stream (close stream :abort t)
                   (when fd (sb-posix:close fd)))
            (unless completed (delete-file temporary))))))))

(defun %prepare-evidence-bytes (path limit)
  (%call-with-source
   path
   (lambda (source real directory-fd)
     ;; Il budget dei byte espansi non include il piccolo descriptor. Anche un
     ;; record di pochi byte deve poter usare un descriptor con due SHA-256.
     (let ((octets (%read-limited-octets source path (max limit 1048576))))
       (unless (%descriptor-candidate-p octets)
         (when (> (length octets) limit)
           (%invalid path \"~D bytes plain superano MAX-EXPANDED-BYTES (~D).\"
                     (length octets) limit))
         (return-from %prepare-evidence-bytes (values (pathname path) nil)))
       (let ((descriptor (%read-plist octets path)))
         (unless (%descriptor-p descriptor)
           (when (> (length octets) limit)
             (%invalid path \"~D bytes plain superano MAX-EXPANDED-BYTES (~D).\"
                       (length octets) limit))
           (return-from %prepare-evidence-bytes (values (pathname path) nil)))
         (%validate-descriptor descriptor path limit)
         (let* ((base (%directory-pathname real))
                (candidate (make-pathname :name (getf descriptor :payload)
                                          :type nil :version nil :defaults base))
                (payload (truename candidate)))
           (unless (equal (%directory-pathname payload) base)
             (%invalid path \"PAYLOAD ~S esce dalla directory reale ~A (risolto: ~A).\"
                       (getf descriptor :payload) base payload))
           (with-open-stream (input (%open-regular-at directory-fd
                                                     (file-namestring payload) path))
             (unless (= (%stream-bytes input) (getf descriptor :compressed-bytes))
               (%invalid path \"Dimensione PAYLOAD ~D, COMPRESSED-BYTES ~D.\"
                         (%stream-bytes input) (getf descriptor :compressed-bytes)))
             (unless (string-equal (getf descriptor :compressed-sha256)
                                   (%stream-sha256 input path))
               (%invalid path \"SHA256 del PAYLOAD diverso da COMPRESSED-SHA256.\"))
             (let ((temporary (%expand-to-temporary input descriptor path limit)))
               (values temporary temporary)))))))))

(defun call-with-evidence-bytes (path function &key (max-expanded-bytes 134217728))
  \"Chiama FUNCTION con un pathname plain e restituisce tutti i suoi valori.
Plain: limite sui bytes e pathname originale. Descriptor: campi, directory,
bytes/hash gzip, espansione limitata e hash espanso verificati prima del callback.
Il contenuto espanso NON viene letto come Lisp. Il pathname temporaneo è valido
solo durante il callback e viene eliminato anche se FUNCTION genera un errore.\"
  (%check-limit path max-expanded-bytes)
  (let ((temporary nil))
    (unwind-protect
         (multiple-value-bind (plain owned-temporary)
             (%with-evidence-errors (path)
               (%prepare-evidence-bytes path max-expanded-bytes))
           (setf temporary owned-temporary)
           (funcall function plain))
      (when temporary (delete-file temporary)))))

(defun read-evidence (path &key (max-expanded-bytes 134217728))
  \"Una sola plist con chiavi keyword, READ-EVAL NIL, nessun LOAD dei dati.
Supporta plain e un solo livello di descriptor; un payload descriptor è vietato.\"
  (call-with-evidence-bytes
   path
   (lambda (plain)
     (%with-evidence-errors (path)
       (%call-with-source
        plain
        (lambda (stream real directory-fd)
          (declare (ignore real directory-fd))
          (let ((size (%stream-bytes stream)))
            (when (> size max-expanded-bytes)
              (%invalid path \"~D bytes superano MAX-EXPANDED-BYTES (~D).\"
                        size max-expanded-bytes))
            (file-position stream 0)
            ;; DUP mantiene il file regolare già aperto e verificato. Il lettore
            ;; testuale evita la copia integrale UTF-8 in una stringa a 4 byte/char.
            (with-open-stream
                (text (sb-sys:make-fd-stream (sb-posix:dup (sb-sys:fd-stream-fd stream))
                                             :input t :element-type 'character
                                             :external-format :default :auto-close t))
              (let ((data (%read-plist-stream text path)))
                (unless (= size (%stream-bytes stream))
                  (%invalid path \"Il file è cambiato durante la lettura dei dati.\"))
                (when (%descriptor-p data)
                  (%invalid path \"Un payload descriptor annidato non è consentito.\"))
                data)))))))
   :max-expanded-bytes max-expanded-bytes))
")
  (:PATH #A((26) BASE-CHAR . "tools/finish-evidence.lisp") :BYTES 1918 :SHA256
   "edf55b633c98a494b0c2f2f0c7a037ee89c65b3b415ce792662f5c151a46f69b" :GIT-BLOB
   "c8ebe7bbe4c99a3c712033d0f58e97610914f87f" :TEXT
   ";;;; Compattazione fuori dalla finestra di misura, dopo l'ultima scrittura del run.
;;; REQ: REQ-VAL-001 REQ-AFF-012
(require :asdf)
(defparameter *evidence-compactor*
  (namestring (merge-pathnames \"compact-evidence.lisp\" *load-truename*)))

(defun compact-finished-directory (directory)
  \"Il chiamante possiede il run e ha terminato tutte le scritture ai suoi record.\"
  (let* ((argv (list (namestring sb-ext:*runtime-pathname*)
                     \"--dynamic-space-size\" \"2048\" \"--noinform\" \"--no-userinit\"
                     \"--no-sysinit\" \"--script\" *evidence-compactor*
                     \"--root\" (namestring directory) \"--jobs\" \"4\"
                     \"--finished-owner-pid\" (write-to-string (sb-posix:getpid))))
         (record (list :schema-version 1 :kind :evidence-finalization :command argv
                       :started-at-universal-time (get-universal-time)))
         (ok nil))
    (handler-case
        (multiple-value-bind (stdout stderr code)
            (uiop:run-program argv :output :string :error-output :string
                                   :ignore-error-status t)
          (setf ok (zerop code)
                (getf record :exit-code) code (getf record :stdout) stdout
                (getf record :stderr) stderr))
      (error (c) (setf (getf record :diagnostic) (princ-to-string c))))
    (setf (getf record :status) (if ok :ok :failed)
          (getf record :finished-at-universal-time) (get-universal-time))
    (with-open-file (stream (merge-pathnames \"conservazione.lisp\" directory)
                            :direction :output :if-exists :error
                            :if-does-not-exist :create :external-format :utf-8)
      (let ((*print-readably* t)) (write record :stream stream :pretty t) (terpri stream)))
    (unless ok
      (format *error-output* \"Compattazione fallita; originali e diagnostica conservati in ~A.~%\"
              directory))
    ok))
")
  (:PATH #A((27) BASE-CHAR . "tools/compact-evidence.lisp") :BYTES 9243 :SHA256
   "7f70f251fc3a5188eb09a32645a410e9f1b0d7b9c334df88a74232f8535d5e3e" :GIT-BLOB
   "72a1c32b1efcb7fd89ff798a669a558ceffb0aa0" :TEXT
   ";;;; Conservazione gzip senza perdita; file indipendenti compattati in parallelo.
;;; REQ: REQ-VAL-001 REQ-AFF-012
(require :asdf)
(require :sb-posix)
(load (merge-pathnames \"evidence-storage.lisp\" *load-truename*))
(declaim (optimize (safety 3) (debug 3)))

(defun compact-one (path)
  \"Pubblica il descriptor solo dopo la verifica dei byte originali e compatti.\"
  (let* ((source (namestring path))
         (payload (concatenate 'string source \".gz\"))
         (lock (concatenate 'string source \".compact-lock\"))
         (temporary (concatenate 'string source \".compact-descriptor\"))
         (owned-lock nil) (owned-payload nil) (owned-temporary nil) (published nil))
    (unwind-protect
         (progn
           (with-open-file (stream lock :direction :output :if-exists :error
                                       :if-does-not-exist :create)
             (setf owned-lock t)
             (write (list :pid (sb-posix:getpid)) :stream stream))
           (let ((bytes (arcdocdb.evidence:file-bytes path))
                 (hash (arcdocdb.evidence:file-sha256 path)))
             ;; Creazione esclusiva: nessun payload o descriptor preesistente viene perso.
             (with-open-file (stream payload :element-type '(unsigned-byte 8)
                                            :direction :output :if-exists :error
                                            :if-does-not-exist :create)
               (setf owned-payload t)
               (uiop:run-program (list \"gzip\" \"-n\" \"-9\" \"-c\" \"--\" source)
                                 :output stream :error-output :string))
             (let* ((descriptor
                      (list :schema-version 1 :kind :compressed-evidence :codec :gzip
                            :payload (file-namestring payload)
                            :uncompressed-bytes bytes :uncompressed-sha256 hash
                            :compressed-bytes (arcdocdb.evidence:file-bytes payload)
                            :compressed-sha256 (arcdocdb.evidence:file-sha256 payload))))
               (with-open-file (stream temporary :direction :output :if-exists :error
                                                 :if-does-not-exist :create
                                                 :external-format :utf-8)
                 (setf owned-temporary t)
                 (let ((*print-readably* t))
                   (write descriptor :stream stream :pretty t) (terpri stream)))
               (arcdocdb.evidence:call-with-evidence-bytes
                temporary
                (lambda (expanded)
                  (unless (and (= bytes (arcdocdb.evidence:file-bytes expanded))
                               (string= hash (arcdocdb.evidence:file-sha256 expanded)))
                    (error \"I byte ricostruiti non coincidono: ~A.\" source))))
               (unless (and (= bytes (arcdocdb.evidence:file-bytes path))
                            (string= hash (arcdocdb.evidence:file-sha256 path)))
                 (error \"Il registro è cambiato durante la compattazione: ~A.\" source))
               ;; rename nella medesima directory: i lettori vedono originale o descriptor completo.
               (sb-posix:rename temporary source)
               (setf published t)
               (list :path source :status :ok :original-bytes bytes
                     :stored-bytes (+ (arcdocdb.evidence:file-bytes path)
                                      (getf descriptor :compressed-bytes))
                     :descriptor descriptor))))
      (when (and owned-temporary (probe-file temporary)) (delete-file temporary))
      (when (and owned-payload (not published) (probe-file payload)) (delete-file payload))
      (when (and owned-lock (probe-file lock)) (delete-file lock)))))

(defun active-run-p (path)
  \"Non tocca directory del registratore il cui PID esiste ancora.\"
  (let* ((directory (car (last (pathname-directory path))))
         (parts (and (stringp directory) (uiop:split-string directory :separator '(#\\-)))))
    (when (and (= (length parts) 4)
               (member (second parts) '(\"command\" \"check\" \"bench\" \"profile\") :test #'string=))
      (let ((pid (ignore-errors (parse-integer (third parts)))))
        (when (and pid (plusp pid))
          (handler-case (progn (sb-posix:kill pid 0) t)
            (sb-posix:syscall-error (c)
              ;; In dubbio non compatta; ESRCH è l'unico caso di PID assente.
              (/= (sb-posix:syscall-errno c) sb-posix:esrch))))))))

(defun candidates (root minimum-age &optional finished-owner)
  \"Solo file .lisp grandi; il limite di età protegge le campagne recenti.\"
  (let ((paths nil) (now (get-universal-time)))
    (labels ((walk (directory)
               (dolist (path (uiop:directory-files directory))
                 (when (and (equal (pathname-type path) \"lisp\")
                            (> (arcdocdb.evidence:file-bytes path) (* 1024 1024))
                            (>= (- now (file-write-date path)) minimum-age)
                            (or (and finished-owner
                                     (eql finished-owner
                                          (ignore-errors
                                            (parse-integer
                                             (third (uiop:split-string
                                                     (car (last (pathname-directory path)))
                                                     :separator '(#\\-)))))))
                                (not (active-run-p path))))
                   (push path paths)))
               (dolist (directory (uiop:subdirectories directory)) (walk directory))))
      (walk root))
    (sort paths #'string< :key #'namestring)))

(defun compact-many (paths jobs)
  \"Coda corta protetta; gzip e verifica di ogni file restano indipendenti.\"
  (let* ((queue (copy-list paths)) (mutex (sb-thread:make-mutex :name \"evidence queue\"))
         (results nil) (threads nil))
    (labels ((worker ()
               (loop for path = (sb-thread:with-mutex (mutex) (pop queue))
                     while path
                     for result = (handler-case (compact-one path)
                                    (error (c) (list :path (namestring path) :status :failed
                                                     :diagnostic (princ-to-string c))))
                     do (sb-thread:with-mutex (mutex) (push result results)))))
      (unwind-protect
           (progn
             (dotimes (i (min jobs (length paths)))
               (push (sb-thread:make-thread #'worker :name \"evidence compressor\") threads))
             (dolist (thread threads) (sb-thread:join-thread thread)))
        ;; Se la creazione di un worker fallisce, gli altri terminano prima di restituire.
        (dolist (thread threads)
          (when (sb-thread:thread-alive-p thread) (sb-thread:join-thread thread)))))
    (sort results #'string< :key (lambda (r) (getf r :path)))))

(defun main ()
  (let ((root \"spikes/results/\") (jobs 4) (minimum-age 0) (finished-owner nil)
        (args (uiop:command-line-arguments)))
    (loop while args for option = (pop args) for value = (pop args)
          do (unless value (error \"Valore mancante per ~A.\" option))
             (cond ((string= option \"--root\") (setf root value))
                   ((string= option \"--jobs\") (setf jobs (parse-integer value)))
                   ((string= option \"--minimum-age-seconds\")
                    (setf minimum-age (parse-integer value)))
                   ((string= option \"--finished-owner-pid\")
                    (setf finished-owner (parse-integer value)))
                   (t (error \"Opzione sconosciuta: ~A.\" option))))
    (unless (and (typep jobs '(integer 1 8)) (typep minimum-age '(integer 0))
                 (or (null finished-owner)
                     (and (typep finished-owner '(integer 1))
                          (eql finished-owner (sb-posix:getppid)))))
      (error \"Workers: 1..8; età minima: secondi non negativi.\"))
    (let* ((root (uiop:ensure-directory-pathname (truename root)))
           (paths (candidates root minimum-age finished-owner))
           (ticks (get-internal-real-time))
           (results (compact-many paths jobs))
           (ok (every (lambda (r) (eq (getf r :status) :ok)) results)))
      (let ((*print-readably* t))
        (write (list :schema-version 1 :kind :evidence-compaction
                     :status (if ok :ok :failed) :root (namestring root) :jobs jobs
                     :minimum-age-seconds minimum-age :files (length results)
                     :wall-seconds (/ (- (get-internal-real-time) ticks)
                                      (coerce internal-time-units-per-second 'double-float))
                     :clock-units-per-second internal-time-units-per-second
                     :original-bytes (loop for r in results sum (getf r :original-bytes 0))
                     :stored-bytes (loop for r in results sum (getf r :stored-bytes 0))
                     :results results
                     :limits '(:lossless-byte-verification :no-git-history-rewrite
                               :requires-immutable-input-files :no-power-loss-durability-claim))
               :pretty t)
        (terpri))
      (unless ok (sb-ext:exit :code 1)))))

(main)
")))
