(:SCHEMA-VERSION 1 :KIND :WORKER-LATEST-INTEGRATION-ADAPTERS :VERSION 1 :SOURCES
 ((:PATH #A((44) BASE-CHAR . "spikes/out/worker-publication-functions.lisp") :BYTES 24521 :SHA256
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
  (:PATH #A((37) BASE-CHAR . "spikes/out/worker-latest-publish.lisp") :BYTES 1240 :SHA256
   "d743714adb5912499faa3ec042b98e898def83f3b6421602c6810c11f80880a2" :GIT-BLOB
   "f9fd698aea67456d8b585ecd278cb0b0f6db5278" :TEXT
   ";;;; Conservazione esclusiva degli originali del merge; nessuna nuova campagna.
(load \"spikes/out/worker-publication-functions.lisp\")
(setf *worker-publication-directory*
      #p\"spikes/results/2026-10-11-writer-worker-latest/\")
(sb-posix:mkdir (namestring *worker-publication-directory*) #o755)
(let ((args (uiop:command-line-arguments)))
  (worker-copy-process (first args) \"check-completo-processo\")
  (worker-copy-process (second args) \"spikes-completi\")
  (worker-copy-process (third args) \"identita-worker-processo\"))
(worker-save-source-bundle
 '(\"spikes/out/worker-publication-functions.lisp\"
   \"spikes/out/worker-latest-publish.lisp\" \"spikes/out/worker-latest-finish.lisp\"
   \"spikes/out/worker-latest-preparation.json\" \"spikes/out/worker-latest-audit.txt\"
   \"docs/implementazione/writer-worker-integrazione.md\")
 (merge-pathnames \"integrazione-adattatori.lisp\" *worker-publication-directory*)
 :worker-latest-integration-adapters :version 1)
(worker-refresh-catalog
 \"68890dea18f1b010b582be338fbbfaf0361a39fd\"
 :historical-bases '(\"e96f99b8b6a882caddd7956d1acd5f308b703c45\"
                     \"f16e978ad026e9307fde67425c35b2a8dbd1e731\"))
(format t \"Originali check, spike e identita worker conservati con copie lossless.~%\")
")
  (:PATH #A((36) BASE-CHAR . "spikes/out/worker-latest-finish.lisp") :BYTES 677 :SHA256
   "8712f61953337654da12de11ad83c5955eb24fd2a5ed6d6c13f225f1337a1f02" :GIT-BLOB
   "fd9a01557783e5b972b60af727512aa1e9f2940a" :TEXT
   ";;;; Conserva processi conclusi; nessuna ricorsione dei gate o nuovo test.
(load \"spikes/out/worker-publication-functions.lisp\")
(setf *worker-publication-directory*
      #p\"spikes/results/2026-10-11-writer-worker-latest/\")
(let ((args (uiop:command-line-arguments)))
  (worker-copy-process (first args) \"conservazione-processo\")
  (worker-copy-process (second args) \"links-evidence-processo\"))
(worker-refresh-catalog
 \"68890dea18f1b010b582be338fbbfaf0361a39fd\"
 :historical-bases '(\"e96f99b8b6a882caddd7956d1acd5f308b703c45\"
                     \"f16e978ad026e9307fde67425c35b2a8dbd1e731\"))
(format t \"Processi conclusi originali conservati; catalogo finale aggiornato.~%\")
")
  (:PATH #A((41) BASE-CHAR . "spikes/out/worker-latest-preparation.json") :BYTES 493 :SHA256
   "1670889cb91039b607236ba96daa224b6376acc9c79a0e1ea3edd8a658b15791" :GIT-BLOB
   "5706d302cb1706bb6af8481176be8a34361d12bb" :TEXT "{
  \"schema_version\": 1,
  \"source\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\",
  \"snapshot\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-latest-ajszidm2/ArcDocDB\",
  \"merge\": \"68890dea18f1b010b582be338fbbfaf0361a39fd\",
  \"worker_parent\": \"e96f99b8b6a882caddd7956d1acd5f308b703c45\",
  \"upstream_parent\": \"f16e978ad026e9307fde67425c35b2a8dbd1e731\",
  \"canonical_dir\": \"spikes/results/2026-10-11-writer-worker-latest\",
  \"status\": \"frozen-candidate\"
}
")
  (:PATH #A((34) BASE-CHAR . "spikes/out/worker-latest-audit.txt") :BYTES 899 :SHA256
   "4c87d559b3a5a3a1b358abe3eca2e24a12639b89813a135d185b1d3817656938" :GIT-BLOB
   "a91bde93d4c4584f77cfbc5a47939f0d07b09320" :TEXT
   "Revisione indipendente upstream_compatibility, esclusivamente statica.

Nessun difetto materiale di interferenza rilevato.

- Delta edb043b→f16e978: 527 file; 9 sorgenti, 10 test, 7 strumenti, 16 documenti, ASDF e 484 evidenze.
- Nessuna modifica upstream a foundation, execution, Serie, WAL, I/O o Makefile.
- Nel merge 68890dea, worker e relativi test restano identici a e96f99b; CBOR, indice e strumenti upstream restano identici a f16e978.
- ASDF registra correttamente entrambe le aggiunte. I nuovi runner raggiungono 141 dichiarazioni di test: CBOR 22, slot 64, indice primario/rebuild 55.
- Scanner generico: firma pubblica conservata; nuova modalità minima separata. Rebuild: piano privato prima della pubblicazione, budget locale e nessuna dipendenza dal worker.

Verifica esclusivamente statica, senza modifiche o campagne. Il protocollo operativo worker–Serie resta da implementare.
")
  (:PATH #A((50) BASE-CHAR . "docs/implementazione/writer-worker-integrazione.md") :BYTES 4911
   :SHA256 "ee5d02e81272fe72737271bd10621031a3e243f0cacf8e88a1ede4be4f0579f6" :GIT-BLOB
   "3249fbcd44f2f2e76a14195461a3a4e43b3031ec" :TEXT "# Integrazione dei worker nella base comune

Il merge `a185aee95b2e40f267df26ec41024dafc0fb9b7a` unisce il worker
pubblicato `9f9f6bd3b7a219211c8f08fe9e5f2b669b849796` alla base
`edb043b1234479cadab0f39b7adf1918786fa91e`. Questa è la versione del
codice verificata dal controllo completo del 9 ottobre 2026.

Il [controllo dello scope](../../spikes/results/2026-10-09-writer-worker-main/scope-integrazione-processo.lisp)
conserva l'esportazione dei tre alberi Git e i confronti dei blob. Tutti i
4.100 path della base sono presenti: 4.096 hanno gli stessi byte. I quattro
file comuni modificati sono ASDF, indice della documentazione, package
execution e inventario delle eccezioni di copertura. I venti file execution,
test e tool worker sono identici alla versione pubblicata; anche i 140 path
aggiunti rispetto alla base coincidono con quella versione. Il
[bundle degli adattatori](../../spikes/results/2026-10-09-writer-worker-main/integrazione-adattatori.lisp)
conserva il confronto completo, i sorgenti degli adattatori e i relativi hash.

Il [record completo](../../spikes/results/2026-10-09-writer-worker-main/check-integrazione-processo.lisp)
è OK/STABLE, exit 0: 459 test in dodici suite più smoke, compilazione senza
avvisi, lint su 111 file senza errori, tracciabilità senza errori e 2.173 link
verificati. Il checker delle evidenze usa il valore Makefile predefinito di
2.048 MiB; i 4.096 MiB del processo esterno di registrazione non sostituiscono
quel valore. Il [master degli spike](../../spikes/results/2026-10-09-writer-worker-main/spikes-integrazione.lisp)
è COMPLETE: dieci spike completati con exit 0 e sorgenti stabili. Il catalogo
[delle copie originali](../../spikes/results/2026-10-09-writer-worker-main/catalogo.lisp)
conserva anche i registri di conservazione e il payload gzip originale.

Le letture statiche indipendenti dello scope e dei contratti confermano la
coesistenza dei worker con Serie, WAL, indice, snapshot, epoche e letture
nell'assemblaggio ASDF. Il controllo completo qualifica quell'assemblaggio.
La qualificazione specifica del worker resta quella dei
[risultati originali](writer-worker-risultati.md): 23 test dedicati,
12 mutanti rilevati e venti campioni locali senza allocazioni heap misurate.
Le campagne dedicate non sono state ripetute per questa integrazione; i loro
limiti e denominatori di copertura restano invariati.

Rimane aperto il collegamento operativo fra lease del worker e lease della
Serie. Il prossimo incremento deve acquisire entrambi prima del primo pop,
rilasciare la Serie prima di chiudere il writer e conservare gli obblighi
quando la seconda acquisizione o la chiusura restituisce busy. L'assemblaggio
verificato non prova quel protocollo, throughput o scalabilità del motore,
né chiude il gate C1 complessivo o dimostra MC/DC.

Alla ripresa dell'11 ottobre la primaria contiene ulteriori modifiche dello
scanner CBOR. La pubblicazione mantiene quindi esplicita la base qualificata
`edb043b`: l'esito qui conservato non qualifica automaticamente quei nuovi
sorgenti.

## Verifica dell'insieme aggiornato

Il merge `68890dea18f1b010b582be338fbbfaf0361a39fd` unisce la precedente
consegna `e96f99b` alla primaria `f16e978ad026e9307fde67425c35b2a8dbd1e731`.
Include scanner CBOR minimo, ricostruzione dell'indice e tutti i relativi
runner. Il [confronto nativo Git registrato](../../spikes/results/2026-10-11-writer-worker-latest/identita-worker-processo.lisp)
conferma l'identità dei file execution, test e tool worker rispetto alla
consegna precedente. La lettura indipendente, conservata nel
[bundle integrale](../../spikes/results/2026-10-11-writer-worker-latest/integrazione-adattatori.lisp),
conferma anche l'identità dei sorgenti CBOR e indice rispetto a `f16e978`
e la registrazione congiunta in ASDF. Non sono emersi conflitti di contratto.

Il [controllo completo dell'11 ottobre](../../spikes/results/2026-10-11-writer-worker-latest/check-completo-processo.lisp)
è OK/STABLE, exit 0, su una copia congelata del merge: 600 test in quindici
suite più smoke, compilazione senza avvisi, lint su 116 file senza errori,
tracciabilità senza errori e 2.230 link verificati. Il checker delle evidenze
ha passato il controllo con il budget Makefile predefinito di 2.048 MiB.
Il [master degli spike](../../spikes/results/2026-10-11-writer-worker-latest/spikes-completi.lisp)
conserva i dieci esperimenti e il payload gzip originale; il
[catalogo](../../spikes/results/2026-10-11-writer-worker-latest/catalogo.lisp)
registra le copie integre e i processi conclusi.

Questa verifica qualifica l'assemblaggio con CBOR e ricostruzione indice
sulla base `f16e978`; supera il limite della precedente consegna relativo
a quei sorgenti. Restano aperti il protocollo operativo worker–Serie e i
gate complessivi del motore descritti sopra. Le campagne dedicate worker
mantengono il proprio ambito originale e non sono state ripetute.
")))
