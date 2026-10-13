(:SCHEMA-VERSION 1 :KIND :POOL-WORKER-LIFECYCLE-PUBLICATION-SOURCES :VERSION
 "c4bbb037b779d33ee9e8c01b4a33aac875ccf96f" :PART 1 :PARTS 1 :SOURCES
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
  (:PATH #A((46) BASE-CHAR . "spikes/out/lifecycle-publication-selftest.lisp") :BYTES 28255 :SHA256
   "7168bad315b46326cac275c75d2a8c0478da6877591189516b50ceaceb93dbc0" :GIT-BLOB
   "f965a7dd926a35834985aabd04fe2384dd867ee9" :TEXT
   ";;;; Fixture C4 di conservazione: SOLO definizioni al LOAD in modalità library.
;;;; Esecuzione esplicita: --script .../lifecycle-publication-selftest.lisp [--self-test].
;;;; Scratch /tmp e stage ignorato del writer; nessun namespace canonico o Git mutato.
;;;; Questo script è preparato prima del congelamento e NON è ancora eseguito.
(require :asdf)
(require :sb-posix)
(let ((*features* (adjoin :pool-worker-lifecycle-publication-library *features*)))
  (load \"spikes/out/lifecycle-publication.lisp\"))
(in-package #:cl-user)

(defun lifecycle-publication-self-test ()
  \"Fixture indipendenti, originali e diagnostica preservati anche al fallimento.\"
  (let* ((scratch (uiop:ensure-directory-pathname
                   (sb-posix:mkdtemp \"/tmp/lifecycle-publication-fixture-XXXXXX\")))
         (report-path (merge-pathnames \"selftest-report.lisp\" scratch))
         (checks nil))
    (labels
        ((check (truth name &optional detail)
           (push (append (list :name name :status (if truth :ok :failed))
                         (when detail (list :detail detail))) checks)
           (unless truth (error \"Lifecycle publication fixture failed: ~A\" name))
           t)
         (rejects (thunk name)
           ;; Le condizioni attese restano nel report; nessun rifiuto viene occultato.
           (let ((diagnostic
                   (handler-case (progn (funcall thunk) nil)
                     (error (condition) (princ-to-string condition)))))
             (check (and diagnostic (plusp (length diagnostic))) name diagnostic)))
         (subdir (name)
           (let ((path (merge-pathnames name scratch)))
             (ensure-directories-exist (merge-pathnames \"placeholder\" path))
             path))
         (write-text (path text &optional (if-exists :error))
           (with-open-file (stream path :direction :output :if-exists if-exists
                                       :if-does-not-exist :create :external-format :utf-8)
             (write-string text stream))
           path)
         (write-octets (path octets)
           (with-open-stream (stream (worker-exclusive-output path))
             (write-sequence octets stream))
           path)
         (paths-contain-p (paths path)
           (find (truename path) paths :test #'equal))
         (same-record-p (record path)
           (worker-byte-records-equal-p record (worker-byte-record path)))
         (save-report (status &optional diagnostic)
           (worker-save-data
            (append
             (list :schema-version 1 :kind :pool-worker-lifecycle-publication-selftest
                   :status status :scratch (namestring scratch)
                   :check-count (length checks) :checks (reverse checks)
                   :limits '(:fixture-data-only :no-canonical-publication
                             :no-git-mutation :original-fixtures-retained
                             :large-stage-outside-inventoried-roots
                             :not-engine-qualification))
             (when diagnostic (list :diagnostic diagnostic)))
            report-path)))
      (handler-case
          (progn
            ;; Byte-evidence e nomi #: freschi: la prova riguarda bytes, non EQ dei dati.
            (let* ((directory (subdir \"byte-copy/\"))
                   (source (merge-pathnames \"original.lisp\" directory))
                   (copy (merge-pathnames \"copy.lisp\" directory))
                   (linked (merge-pathnames \"linked.lisp\" directory)))
              (worker-save-data
               (list :schema-version 1 :kind :lifecycle-selftest-fixture
                     :value 23 :token (make-symbol \"FRESH-FIXTURE\") :text \"è λ π\")
               source)
              (worker-copy-evidence source copy)
              (check (worker-evidence-proofs-equal-p
                      (worker-evidence-byte-proof source)
                      (worker-evidence-byte-proof copy))
                     :plain-copy-byte-proof)
              (let ((before (worker-byte-record copy)))
                (rejects (lambda () (worker-copy-evidence source copy))
                         :plain-copy-existing-destination-rejected)
                (check (same-record-p before copy) :plain-copy-existing-bytes-unchanged))
              (sb-posix:symlink (namestring source) (namestring linked))
              (rejects (lambda () (worker-evidence-byte-proof linked))
                       :evidence-source-symlink-rejected)
              (let ((before (worker-byte-record source)))
                (rejects (lambda () (worker-copy-evidence source linked))
                         :evidence-destination-symlink-rejected)
                (check (same-record-p before source) :symlink-target-bytes-unchanged)))

            ;; Tutto il testo UTF-8 è incluso, qualunque sia l'estensione; solo FASL esclusi.
            (let* ((directory (subdir \"inventory/\"))
                   (source (write-text (merge-pathnames \"source.lisp\" directory)
                                       \"; fixture UTF-8: è λ π\"))
                   (python (write-text (merge-pathnames \"measure.py\" directory)
                                       \"# fixture Python: è λ π\"))
                   (unusual (write-text (merge-pathnames \"native.unusual\" directory)
                                        (concatenate 'string \"fixture è\" (string #\\Return)
                                                     (string #\\Newline) \"λ\")))
                   (no-extension (write-text (merge-pathnames \"Makefile\" directory)
                                             \"# fixture senza estensione\"))
                   (extra (write-text (merge-pathnames \"extra.native-format\" scratch)
                                      \"fixture extra UTF-8 λ\"))
                   (fasl (write-octets (merge-pathnames \"cache.fasl\" directory)
                                       (make-array 3 :element-type '(unsigned-byte 8)
                                                     :initial-contents '(255 0 254)))))
              (multiple-value-bind (included excluded)
                  (lifecycle-development-files :roots (list directory)
                                               :required (list source python)
                                               :extra (list extra))
                (check (= 5 (length included)) :utf8-inventory-complete)
                (check (every (lambda (path) (paths-contain-p included path))
                              (list source python unusual no-extension extra))
                       :python-unusual-extensionless-and-extra-included)
                (check (and (= 1 (length excluded))
                            (equal (truename fasl)
                                   (truename (getf (first excluded) :path)))
                            (eq :compiler-intermediate (getf (first excluded) :reason)))
                       :binary-fasl-explicitly-excluded)
                (dolist (path included)
                  (let ((record (worker-source-record path)))
                    (check (and (same-record-p record path)
                                (worker-octets-match-file-p
                                 (sb-ext:string-to-octets (getf record :text)
                                                         :external-format :utf-8)
                                 path))
                           (format nil \"inventory-roundtrip-~A\" (file-namestring path))))))
              (rejects (lambda ()
                         (lifecycle-development-files :roots (list directory)
                                                      :required (list fasl)))
                       :excluded-fasl-cannot-satisfy-required)
              (rejects (lambda ()
                         (lifecycle-development-files
                          :roots (list directory)
                          :required (list (merge-pathnames \"missing.raw\" directory))))
                       :missing-required-rejected))

            ;; Non regolari e UTF-8 invalido sono verificati prima di leggerli come sorgenti.
            (let* ((directory (subdir \"bad-symlink/\"))
                   (outside (write-text (merge-pathnames \"outside.txt\" scratch) \"outside\"))
                   (link (merge-pathnames \"source.py\" directory)))
              (write-text (merge-pathnames \"sentinel.txt\" directory) \"sentinel UTF-8\")
              (sb-posix:symlink (namestring outside) (namestring link))
              (rejects (lambda () (lifecycle-development-files :roots (list directory)
                                                            :required nil))
                       :inventory-file-symlink-rejected))
            (let* ((directory (subdir \"bad-directory-symlink/\"))
                   (outside (subdir \"outside-directory/\"))
                   (link (merge-pathnames \"linked-directory\" directory)))
              (write-text (merge-pathnames \"sentinel.txt\" directory) \"sentinel UTF-8\")
              (write-text (merge-pathnames \"outside.py\" outside) \"outside directory\")
              (sb-posix:symlink (namestring outside) (namestring link))
              (rejects (lambda () (lifecycle-development-files :roots (list directory)
                                                            :required nil))
                       :inventory-directory-symlink-rejected))
            (let ((directory (subdir \"bad-fifo/\")))
              (write-text (merge-pathnames \"sentinel.txt\" directory) \"sentinel UTF-8\")
              (sb-posix:mkfifo (namestring (merge-pathnames \"pipe.log\" directory)) #o600)
              (rejects (lambda () (lifecycle-development-files :roots (list directory)
                                                            :required nil))
                       :inventory-fifo-rejected-without-opening))
            (let ((directory (subdir \"bad-utf8/\")))
              (write-text (merge-pathnames \"sentinel.txt\" directory) \"sentinel UTF-8\")
              (write-octets (merge-pathnames \"invalid.py\" directory)
                            (make-array 2 :element-type '(unsigned-byte 8)
                                          :initial-contents '(195 40)))
              (rejects (lambda () (lifecycle-development-plan :roots (list directory)
                                                           :required nil))
                       :invalid-utf8-plan-rejected))
            (rejects (lambda ()
                       (lifecycle-development-files
                        :roots (list (merge-pathnames \"missing-root/\" scratch)) :required nil))
                     :missing-development-root-rejected)

            ;; Un cambiamento successivo al piano impedisce persino la prima copia.
            (let* ((directory (subdir \"changed-after-plan/\"))
                   (source (write-text (merge-pathnames \"source.py\" directory) \"before\"))
                   (destination (merge-pathnames \"must-not-create-after-change/\" scratch))
                   (plan (lifecycle-development-plan :roots (list directory)
                                                     :required (list source))))
              (write-text source \"after, differente\" :supersede)
              (rejects (lambda () (pool-development-write plan destination))
                       :changed-source-after-plan-rejected)
              (check (null (probe-file destination))
                     :changed-source-plan-created-no-output))

            ;; Sorgente singola oltre un MiB: non spezzata né troncata; gzip originale copiato.
            (let* ((directory (subdir \"large-native/\"))
                   (destination (subdir \"large-published/\"))
                   (large-text (concatenate 'string
                                            (make-string (+ 1048576 513) :initial-element #\\x)
                                            \"è λ π fine\" (string #\\Newline)))
                   (source (write-text (merge-pathnames \"raw-native.py\" directory) large-text))
                   (small (write-text (merge-pathnames \"small.note\" directory) \"small è λ\"))
                   ;; macOS /tmp aliasa /private/tmp: il piano usa il pathname canonico.
                   ;; Canonicalizziamo solo il lookup; bytes, SHA, blob e testo restano esatti.
                   (before (worker-source-record (truename source)))
                   (plan (lifecycle-development-plan :roots (list directory)
                                                     :required (list source small)))
                   (large-plans (remove-if-not (lambda (entry) (getf entry :large))
                                              (getf plan :plans))))
              (check (> (getf before :bytes) 1048576) :native-text-exceeds-one-mib)
              (check (= 1 (length large-plans)) :single-large-source-classified)
              (let ((only-large (lifecycle-development-plan :roots nil :required (list source)
                                                           :extra (list source))))
                (check (and (= 1 (length (getf only-large :plans)))
                            (getf (first (getf only-large :plans)) :large))
                       :large-only-plan-without-small-source))
              (let* ((entry (first large-plans))
                     (sources (getf (getf entry :data) :sources)))
                (check (and (= 1 (length sources))
                            (string= (getf (first sources) :text) large-text)
                            (worker-byte-records-equal-p (first sources) before))
                       :large-plan-preserves-complete-native-source)
                (check (> (length (worker-data-octets (getf entry :data))) 1048576)
                       :large-serialized-bundle-exceeds-plain-budget))
              (check (pool-development-write plan destination) :large-write-and-compaction)
              (let* ((entry (first large-plans))
                     (copy (merge-pathnames (getf entry :leaf) destination))
                     (descriptor (worker-read-raw-data copy))
                     (manifest (arcdocdb.evidence:read-evidence
                                (merge-pathnames \"development-manifest.lisp\" destination)))
                     (stage (getf manifest :large-stage)))
                (check (eq :compressed-evidence (getf descriptor :kind))
                       :large-output-is-gzip-descriptor)
                (check (and stage
                            (not (uiop:subpathp (pathname stage) directory))
                            (uiop:subpathp (truename stage) (truename #p\"spikes/out/\")))
                       :large-stage-ignored-and-outside-inventory)
                (multiple-value-bind (proof decoded) (worker-evidence-byte-proof copy)
                  (let* ((sources (getf decoded :sources))
                         (record (find (getf before :path) sources
                                       :key (lambda (item) (getf item :path)) :test #'string=)))
                    (check (and (= 1 (length sources)) record
                                (string= (getf record :text) large-text)
                                (worker-byte-records-equal-p record before)
                                (worker-octets-match-file-p
                                 (sb-ext:string-to-octets (getf record :text)
                                                         :external-format :utf-8)
                                 source))
                           :gzip-roundtrip-native-bytes-without-loss)
                    (check (and (getf proof :payload-record)
                                (<= (getf (getf proof :payload-record) :bytes) 8388608)
                                (> (getf (getf proof :expanded) :bytes) 1048576))
                           :gzip-under-eight-mib-and-expanded-source-large))
                  (check (worker-evidence-proofs-equal-p
                          proof
                          (worker-evidence-byte-proof
                           (merge-pathnames (getf entry :leaf) (pathname stage))))
                         :descriptor-and-original-gzip-copied-identically))
                (check (same-record-p before source) :large-original-source-unchanged)
                (let ((copy-before (worker-byte-record copy))
                      (payload-before (worker-byte-record
                                       (merge-pathnames (getf descriptor :payload) destination))))
                  (rejects (lambda ()
                             (worker-copy-evidence
                              (merge-pathnames (getf entry :leaf) (pathname stage)) copy))
                           :gzip-existing-destination-rejected)
                  (check (and (same-record-p copy-before copy)
                              (same-record-p
                               payload-before
                               (merge-pathnames (getf descriptor :payload) destination)))
                         :gzip-existing-descriptor-and-payload-unchanged))
                (let* ((conflict (subdir \"gzip-payload-conflict/\"))
                       (existing-payload (merge-pathnames (getf descriptor :payload) conflict))
                       (missing-descriptor (merge-pathnames (getf entry :leaf) conflict)))
                  (worker-copy-exclusive (merge-pathnames (getf descriptor :payload) destination)
                                         existing-payload)
                  (let ((before-payload (worker-byte-record existing-payload)))
                    (rejects (lambda () (worker-copy-evidence copy missing-descriptor))
                             :gzip-payload-only-conflict-rejected)
                    (check (and (null (probe-file missing-descriptor))
                                (same-record-p before-payload existing-payload))
                           :gzip-payload-only-conflict-created-no-descriptor)))

                ;; La copia ricorsiva conserva basename gzip e gerarchia originale.
                (let* ((nested (merge-pathnames \"nested/\" destination))
                       (campaign-target (subdir \"campaign-copy/\")))
                  (ensure-directories-exist (merge-pathnames \"placeholder\" nested))
                  (worker-save-data '(:schema-version 1 :kind :nested-selftest-fixture)
                                    (merge-pathnames \"record.lisp\" nested))
                  (let* ((campaign-plan
                           (lifecycle-evidence-directory-plan
                            (list :name \"large-native\" :source (namestring destination))
                            scratch campaign-target))
                         (copied (lifecycle-copy-evidence-directory campaign-plan))
                         (files (getf copied :files)))
                    (check (= (length files) (length (getf campaign-plan :files)))
                           :recursive-campaign-file-count)
                    (check
                     (every (lambda (record)
                              (let ((source-file (merge-pathnames (getf record :relative-path)
                                                                  destination)))
                                (and (same-record-p record source-file)
                                     (same-record-p record (getf record :path)))))
                            files)
                     :recursive-campaign-real-bytes-sha256-and-git-blobs)
                    (check
                     (worker-evidence-proofs-equal-p
                      (worker-evidence-byte-proof copy)
                      (worker-evidence-byte-proof
                       (merge-pathnames (getf entry :leaf) (getf campaign-plan :target))))
                     :recursive-campaign-descriptor-and-gzip-identical)
                    (check (probe-file (merge-pathnames \"nested/record.lisp\"
                                                       (getf campaign-plan :target)))
                           :recursive-campaign-nested-hierarchy-preserved)
                    (let ((before-files (mapcar (lambda (record)
                                                 (worker-byte-record (getf record :path)))
                                               files)))
                      (rejects (lambda () (lifecycle-copy-evidence-directory campaign-plan))
                               :recursive-campaign-existing-target-rejected)
                      (check (every (lambda (record) (same-record-p record (getf record :path)))
                                    before-files)
                             :recursive-campaign-existing-bytes-unchanged))))))

            (let* ((directory (subdir \"campaign-changed/\"))
                   (source (merge-pathnames \"record.lisp\" directory))
                   (destination (merge-pathnames \"must-not-create-campaign-change/\" scratch)))
              (worker-save-data '(:schema-version 1 :kind :campaign-fixture :value 1) source)
              (let ((plan (lifecycle-evidence-directory-plan
                           (list :name \"changed\" :source (namestring directory))
                           scratch destination)))
                (write-text source \"(:schema-version 1 :kind :campaign-fixture :value 2)\"
                            :supersede)
                (rejects (lambda () (lifecycle-copy-evidence-directory plan))
                         :recursive-campaign-source-changed-after-plan-rejected)
                (check (null (probe-file destination))
                       :recursive-campaign-change-created-no-output)))
            (rejects
             (lambda ()
               (lifecycle-evidence-directory-plan
                (list :name \"symlink\" :source (namestring (merge-pathnames \"bad-symlink/\" scratch)))
                scratch (merge-pathnames \"must-not-create-campaign-symlink/\" scratch)))
             :recursive-campaign-source-symlink-rejected)
            (rejects
             (lambda ()
               (lifecycle-evidence-directory-plan
                (list :name \"directory-symlink\"
                      :source (namestring (merge-pathnames \"bad-directory-symlink/\" scratch)))
                scratch (merge-pathnames \"must-not-create-campaign-dir-symlink/\" scratch)))
             :recursive-campaign-directory-symlink-rejected)

            ;; Manifest verificato rispetto ai file reali, non soltanto alla sua forma.
            (let* ((directory (subdir \"manifest-fixture/\"))
                   (plain (merge-pathnames \"record.lisp\" directory))
                   (raw (write-text (merge-pathnames \"raw.log\" directory) \"raw è λ π\"))
                   (base (make-string 40 :initial-element #\\0))
                   (manifest-path (merge-pathnames \"manifesto-selftest.lisp\" directory)))
              (worker-save-data '(:schema-version 1 :kind :lifecycle-selftest-manifest-fixture)
                                plain)
              (lifecycle-publication-refresh-manifest base :stem \"manifesto-selftest\"
                                                            :directory directory)
              (let* ((manifest (arcdocdb.evidence:read-evidence manifest-path))
                     (files (getf manifest :files)))
                (check (= 2 (length files)) :manifest-inventories-every-original-file)
                (check (and (= (length files)
                               (length (remove-duplicates files :test #'string=
                                                                :key (lambda (entry)
                                                                       (getf entry :relative-path)))))
                            (every (lambda (entry)
                                     (let ((path (merge-pathnames (getf entry :relative-path)
                                                                 directory)))
                                       (and (uiop:subpathp (truename path) (truename directory))
                                            (same-record-p entry path))))
                                   files))
                       :manifest-real-bytes-sha256-and-git-blobs)
                (check (and (find (file-namestring plain) files :test #'string=
                                 :key (lambda (entry) (getf entry :relative-path)))
                            (find (file-namestring raw) files :test #'string=
                                  :key (lambda (entry) (getf entry :relative-path)))
                            (not (find \"catalogo.lisp\" files :test #'string=
                                       :key (lambda (entry) (getf entry :relative-path))))
                            (not (find \"manifesto-selftest.lisp\" files :test #'string=
                                       :key (lambda (entry) (getf entry :relative-path)))))
                       :manifest-catalog-excluded-and-not-self-referential))
              (let ((before (worker-byte-record manifest-path)))
                (rejects (lambda ()
                           (lifecycle-publication-refresh-manifest base :stem \"manifesto-selftest\"
                                                                         :directory directory))
                         :manifest-existing-destination-rejected)
                (check (same-record-p before manifest-path) :manifest-existing-bytes-unchanged)))

            ;; Il manifest non deve seguire una directory symlink, anche con slash finale.
            (let* ((directory (subdir \"manifest-bad-directory-symlink/\"))
                   (outside (subdir \"manifest-outside/\"))
                   (link (merge-pathnames \"linked-directory\" directory))
                   (manifest-path (merge-pathnames \"must-not-create.lisp\" directory)))
              (worker-save-data '(:schema-version 1 :kind :manifest-sentinel)
                                (merge-pathnames \"sentinel.lisp\" directory))
              (worker-save-data '(:schema-version 1 :kind :manifest-outside-fixture)
                                (merge-pathnames \"outside.lisp\" outside))
              (sb-posix:symlink (namestring outside) (namestring link))
              (rejects (lambda ()
                         (lifecycle-publication-refresh-manifest
                          (make-string 40 :initial-element #\\0)
                          :stem \"must-not-create\" :directory directory))
                       :manifest-directory-symlink-rejected)
              (check (null (probe-file manifest-path))
                     :manifest-directory-symlink-created-no-output))

            ;; Invalid config non deve creare neppure una directory di pubblicazione.
            (let* ((destination (merge-pathnames \"must-stay-absent/\" scratch))
                   (input (merge-pathnames \"invalid-config.lisp\" scratch))
                   (config (list :base \"bad\" :snapshot (namestring scratch)
                                 :paths nil :records nil)))
              (worker-save-data config input)
              (let ((*lifecycle-publication-directory* destination))
                (rejects (lambda () (lifecycle-publication-run config input))
                         :invalid-config-rejected))
              (check (null (probe-file destination)) :invalid-config-created-no-output))

            (save-report :ok)
            (format t \"Lifecycle publication preservation fixtures PASS: ~D checks; report ~A.~%\"
                    (length checks) report-path)
            report-path)
        (error (condition)
          (let ((diagnostic (princ-to-string condition)))
            (save-report :failed diagnostic)
            (format *error-output* \"Lifecycle fixture failed; originals and report preserved in ~A.~%\"
                    scratch)
            (error condition)))))))

(defun lifecycle-publication-selftest-direct-script-p ()
  \"SBCL distingue script diretto da LOAD annidato e da --load ordinario.
La feature library è il primo guard: mai eseguire fixture quando è presente.\"
  (and (not (member :lifecycle-publication-selftest-library *features*))
       (= sb-fasl::*load-depth* 1)
       (eq *standard-input* sb-sys:*stdin*)
       (eq *standard-output* sb-sys:*stdout*)))

(when (lifecycle-publication-selftest-direct-script-p)
  (let ((args (uiop:command-line-arguments)))
    (unless (or (null args) (equal args '(\"--self-test\")))
      (error \"Uso: sbcl --script spikes/out/lifecycle-publication-selftest.lisp [--self-test]\"))
    (lifecycle-publication-self-test)))
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
")
  (:PATH #A((43) BASE-CHAR . "spikes/out/lifecycle-publication-input.lisp") :BYTES 3805 :SHA256
   "f1cd8250a34e7a872f682b04dee315cbd49a72ffe225dee9446be8e63615c899" :GIT-BLOB
   "f166a1014fdbb9523cadd7e487f62f9d2f2c0814" :TEXT
   "(:base \"c4bbb037b779d33ee9e8c01b4a33aac875ccf96f\" :snapshot \"/tmp/arcdocdb-pool-lifecycle-qualification-1791921785\" :paths (\"arcdocdb.asd\" \"docs/implementazione/README.md\" \"src/scheduler/package.lisp\" \"tests/scheduler/support.lisp\" \"src/scheduler/lifecycle-build.lisp\" \"src/scheduler/lifecycle-read.lisp\" \"src/scheduler/lifecycle-types.lisp\" \"src/scheduler/lifecycle-update.lisp\" \"src/scheduler/lifecycle-worker.lisp\" \"tests/scheduler/lifecycle.lisp\" \"tools/measure-pool-lifecycle.lisp\" \"docs/implementazione/pool-worker-lifecycle.md\" \"docs/implementazione/pool-worker-lifecycle-metodo.md\") :final-paths (\"arcdocdb.asd\" \"docs/implementazione/README.md\" \"src/scheduler/package.lisp\" \"tests/scheduler/support.lisp\" \"src/scheduler/lifecycle-build.lisp\" \"src/scheduler/lifecycle-read.lisp\" \"src/scheduler/lifecycle-types.lisp\" \"src/scheduler/lifecycle-update.lisp\" \"src/scheduler/lifecycle-worker.lisp\" \"tests/scheduler/lifecycle.lisp\" \"tools/measure-pool-lifecycle.lisp\" \"docs/implementazione/pool-worker-lifecycle.md\" \"docs/implementazione/pool-worker-lifecycle-metodo.md\" \"CHANGELOG.md\" \"docs/implementazione/controllore-pool.md\" \"docs/implementazione/pool-worker-lifecycle-revisione.md\" \"docs/implementazione/pool-worker-lifecycle-risultati.md\") :records ((:name \"selftest\" :id \"4000910603-command-11895-0\") (:name \"benchmark\" :id \"4000910621-command-11962-0\") (:name \"coverage\" :id \"4000910644-command-12377-0\") (:name \"check-core\" :id \"4000910703-command-13310-0\") (:name \"check-core-attempt-1\" :id \"4000910605-command-11912-0\") (:name \"check-core-attempt-2\" :id \"4000910632-command-12130-0\") (:name \"integrated-build\" :id \"4000911049-command-19367-0\" :root \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\") (:name \"publication-selftest-attempt-1\" :id \"4000911325-command-22225-0\" :root \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\") (:name \"publication-selftest\" :id \"4000911543-command-23689-0\" :root \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\")) :benchmark-report \"/tmp/arcdocdb-pool-lifecycle-qualification-1791921785/spikes/out/lifecycle-measure/bench-attempt-01/report.lisp\" :evidence ((:name \"coverage-audit\" :source \"/tmp/arcdocdb-pool-lifecycle-qualification-1791921785/spikes/out/lifecycle-measure/coverage-attempt-01/coverage-audit.lisp\") (:name \"publication-selftest-attempt-1\" :source \"/tmp/lifecycle-publication-fixture-ZxpZN6/selftest-report.lisp\") (:name \"publication-selftest\" :source \"/tmp/lifecycle-publication-fixture-l7tyL8/selftest-report.lisp\")) :evidence-directories ((:name \"check-core-spikes\" :source \"/tmp/arcdocdb-pool-lifecycle-qualification-1791921785/spikes/out/4000910872-check-16097-0\") (:name \"publication-fixture-attempt-1-large\" :source \"/tmp/lifecycle-publication-fixture-ZxpZN6/large-published/\")) :extra-development-sources (\"/tmp/arcdocdb-pool-lifecycle-qualification-1791921785/spikes/out/lifecycle-fullcheck-attempt-01.log\" \"/tmp/arcdocdb-pool-lifecycle-qualification-1791921785/spikes/out/lifecycle-fullcheck-attempt-02.log\" \"/tmp/arcdocdb-pool-lifecycle-qualification-1791921785/spikes/out/lifecycle-fullcheck-attempt-03.log\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/lifecycle-integrated-attempt-01.log\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/lifecycle-publication-selftest-attempt-01.log\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/lifecycle-publication-selftest-attempt-02.log\" \"/tmp/lifecycle-publication-fixture-ZxpZN6/large-native/raw-native.py\" \"/tmp/lifecycle-publication-fixture-ZxpZN6/large-native/small.note\") :extra-sources (\"/tmp/arcdocdb-lifecycle-state.json\" \"/tmp/arcdocdb-pool-lifecycle-qualification-1791921785/spikes/out/lifecycle-integrated-build.lisp\" \"spikes/out/pool-command-summary.lisp\"))
")
  (:PATH #A((34) BASE-CHAR . "/tmp/arcdocdb-lifecycle-state.json") :BYTES 4135 :SHA256
   "6c929a96d71b8b704f0d3e2f32ef97049ac2c3ab91bf2b8be07a0fdfb484bd91" :GIT-BLOB
   "c488ce4fe596ae3b491df9d7af2cd021695351ca" :TEXT
   "{\"backup\": \"/tmp/arcdocdb-lifecycle-integration-1791921681\", \"old_head\": \"105ae0dd28a6ae3e7ee60ab1477815a49b1b350b\", \"base\": \"c4bbb037b779d33ee9e8c01b4a33aac875ccf96f\", \"patch_paths\": [\"arcdocdb.asd\", \"docs/implementazione/README.md\", \"src/scheduler/package.lisp\", \"tests/scheduler/support.lisp\"], \"snapshot\": \"/tmp/arcdocdb-pool-lifecycle-qualification-1791921785\", \"paths\": [\"arcdocdb.asd\", \"docs/implementazione/README.md\", \"src/scheduler/package.lisp\", \"tests/scheduler/support.lisp\", \"src/scheduler/lifecycle-build.lisp\", \"src/scheduler/lifecycle-read.lisp\", \"src/scheduler/lifecycle-types.lisp\", \"src/scheduler/lifecycle-update.lisp\", \"src/scheduler/lifecycle-worker.lisp\", \"tests/scheduler/lifecycle.lisp\", \"tools/measure-pool-lifecycle.lisp\", \"docs/implementazione/pool-worker-lifecycle.md\", \"docs/implementazione/pool-worker-lifecycle-metodo.md\"], \"source_sha256\": {\"arcdocdb.asd\": \"a81c523ececccd4f1f5deaea037cfa419738c881ef37a89f7869f18f6becc7db\", \"docs/implementazione/README.md\": \"b863d42ce333caa19e9e87c9b67d8b12472aba47d2586d0681ff56df445a7aba\", \"src/scheduler/package.lisp\": \"5a139172de1648b30e09fdc6fc068141299c2034702f8d5b5f44bb0de14a3112\", \"tests/scheduler/support.lisp\": \"300234f9ac7931f8c8b9bf305498a2742a3b8868dd9158dbab8c7fdceed5a1e4\", \"src/scheduler/lifecycle-build.lisp\": \"d6d67faf8721f26e7fcd228d6ab9a7dfdc36ff5ec56c67ed9e5fb6d914006a9e\", \"src/scheduler/lifecycle-read.lisp\": \"c60e1d5f67eeafb216b374fa001d27f87d1a734c5d066fc092902c0301069200\", \"src/scheduler/lifecycle-types.lisp\": \"4fe980e00f1d273e9b8278cd2daace6b4a9e4ab948ddfac83b79f4b0c537cb7c\", \"src/scheduler/lifecycle-update.lisp\": \"2020e46809e9fe8fa74e061a420b8085679d5f461eabd8b044f3975c1024800e\", \"src/scheduler/lifecycle-worker.lisp\": \"ec8b462ff3f5f7a6435f0f0c01b62034d8de2a784a9e354d469a0adfec9cf837\", \"tests/scheduler/lifecycle.lisp\": \"eff59c0cf6d9c6c1ddec57a4efa26a8fcaeedc850b77764b818bc1c22eb73e38\", \"tools/measure-pool-lifecycle.lisp\": \"87c4985bc50445ab77c2196de535b83e42e107ff7a9b2ac8bd5d7f04b7f90fc0\", \"docs/implementazione/pool-worker-lifecycle.md\": \"39c95f21b87752208b77844bca26092a4cd9f4f45900a04ead6c3ed42b10dba4\", \"docs/implementazione/pool-worker-lifecycle-metodo.md\": \"e529f3c3959b8143b099febef773ebc880aeae0424c01e3ddec89583d2d3615b\"}, \"final_paths\": [\"arcdocdb.asd\", \"docs/implementazione/README.md\", \"src/scheduler/package.lisp\", \"tests/scheduler/support.lisp\", \"src/scheduler/lifecycle-build.lisp\", \"src/scheduler/lifecycle-read.lisp\", \"src/scheduler/lifecycle-types.lisp\", \"src/scheduler/lifecycle-update.lisp\", \"src/scheduler/lifecycle-worker.lisp\", \"tests/scheduler/lifecycle.lisp\", \"tools/measure-pool-lifecycle.lisp\", \"docs/implementazione/pool-worker-lifecycle.md\", \"docs/implementazione/pool-worker-lifecycle-metodo.md\", \"CHANGELOG.md\", \"docs/implementazione/controllore-pool.md\", \"docs/implementazione/pool-worker-lifecycle-revisione.md\", \"docs/implementazione/pool-worker-lifecycle-risultati.md\"], \"implementation_commit\": \"0714638e56a4a058b74839064a2b00dd583c5384\", \"integrated_commit\": \"a95dab36f40560157a6631557e4774a8b320fde5\", \"integrated_parent\": \"ba78d8272a475af25e89b7df8c5033ff50e30b3b\", \"integrated_record\": \"4000911049-command-19367-0\", \"records\": [{\"name\": \"selftest\", \"id\": \"4000910603-command-11895-0\"}, {\"name\": \"benchmark\", \"id\": \"4000910621-command-11962-0\"}, {\"name\": \"coverage\", \"id\": \"4000910644-command-12377-0\"}, {\"name\": \"check-core\", \"id\": \"4000910703-command-13310-0\"}, {\"name\": \"check-core-attempt-1\", \"id\": \"4000910605-command-11912-0\"}, {\"name\": \"check-core-attempt-2\", \"id\": \"4000910632-command-12130-0\"}, {\"name\": \"integrated-build\", \"id\": \"4000911049-command-19367-0\", \"root\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\"}, {\"name\": \"publication-selftest-attempt-1\", \"id\": \"4000911325-command-22225-0\", \"root\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\"}, {\"name\": \"publication-selftest\", \"id\": \"4000911543-command-23689-0\", \"root\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\"}], \"publication_fixture_failure\": \"/tmp/lifecycle-publication-fixture-ZxpZN6\", \"publication_fixture_success\": \"/tmp/lifecycle-publication-fixture-l7tyL8\"}
")
  (:PATH
   #A((96) BASE-CHAR
      . "/tmp/arcdocdb-pool-lifecycle-qualification-1791921785/spikes/out/lifecycle-integrated-build.lisp")
   :BYTES 275 :SHA256 "efa40f25d7731f0943c084207231cfba7a6fdcb1f433c9595e869c2a18548e4d" :GIT-BLOB
   "df35b0fd713838696f110d5377c0457d3735026e" :TEXT "(require :asdf)
(asdf:initialize-output-translations
 `(:output-translations
   (,(merge-pathnames \"**/*.*\" (truename \"./\"))
    ,(merge-pathnames \"spikes/out/lifecycle-integrated-cache/**/*.*\" (truename \"./\")))
   :ignore-inherited-configuration))
(load \"tools/build.lisp\")
")
  (:PATH #A((36) BASE-CHAR . "spikes/out/pool-command-summary.lisp") :BYTES 673 :SHA256
   "661002f74bdf665d3b248f9f1a13e8cad0756769f15f5cbf7acf45b8d8db0711" :GIT-BLOB
   "e6e55047190a014e1184077a70ad5ca6964da624" :TEXT "(require :asdf)
(load \"tools/evidence-storage.lisp\")
(dolist (arg (uiop:command-line-arguments))
 (let* ((r (arcdocdb.evidence:read-evidence arg)) (out (getf r :stdout)))
  (write (list :path arg :status (getf r :status) :consistency (getf r :source-consistency)
   :exit (getf r :exit-code) :seconds (getf r :wall-seconds)
   :sources (length (getf r :source-blobs-before))
   :named-tests (when out (loop for line in (uiop:split-string out :separator '(#\\Newline)) count (uiop:string-prefix-p \"ok    \" line)))
   :stdout-tail (when out (subseq out (max 0 (- (length out) 400))))
   :stderr-bytes (when (getf r :stderr) (length (getf r :stderr)))) :pretty t)
  (terpri)))
")))
