(:SCHEMA-VERSION 1 :KIND :POOL-CONTROLLER-PUBLICATION-SOURCES :VERSION
 "4344d9e1f2ceb45e5fa3d5076b57d09505e69ac3" :PART 1 :PARTS 1 :SOURCES
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
  (:PATH #A((49) BASE-CHAR . "spikes/out/pool-controller/publication-input.lisp") :BYTES 3948
   :SHA256 "112a5816bdc6e60517ccc5213f293878739fef85622124a9f23eff8a340a3450" :GIT-BLOB
   "202be12b8cb98628d0f508a7852575b5dca04890" :TEXT
   "(:base \"4344d9e1f2ceb45e5fa3d5076b57d09505e69ac3\" :snapshot \"/tmp/arcdocdb-pool-controller-qualification-1791916367\" :paths (\"CHANGELOG.md\" \"arcdocdb.asd\" \"docs/implementazione/README.md\" \"docs/implementazione/controllore-pool-decisioni.md\" \"docs/implementazione/controllore-pool-metodo.md\" \"docs/implementazione/controllore-pool-revisione-2.md\" \"docs/implementazione/controllore-pool-revisione.md\" \"docs/implementazione/controllore-pool-risultati.md\" \"docs/implementazione/controllore-pool.md\" \"src/scheduler/build.lisp\" \"src/scheduler/package.lisp\" \"src/scheduler/policy.lisp\" \"src/scheduler/read.lisp\" \"src/scheduler/types.lisp\" \"src/scheduler/update.lisp\" \"tests/scheduler/controller.lisp\" \"tests/scheduler/support.lisp\" \"tools/pool-controller-bench.lisp\") :records ((:name \"tool-selftest\" :id \"4000906285-command-38487-0\" :root \"/tmp/arcdocdb-pool-controller-qualification-1791916367\") (:name \"core-cache-rejected\" :id \"4000906285-command-38488-0\" :root \"/tmp/arcdocdb-pool-controller-qualification-1791916367\") (:name \"coverage\" :id \"4000906285-command-38489-0\" :root \"/tmp/arcdocdb-pool-controller-qualification-1791916367\") (:name \"core\" :id \"4000906339-command-39039-0\" :root \"/tmp/arcdocdb-pool-controller-qualification-1791916367\") (:name \"benchmark\" :id \"4000906340-command-39064-0\" :root \"/tmp/arcdocdb-pool-controller-qualification-1791916367\")) :final-paths (\"CHANGELOG.md\" \"arcdocdb.asd\" \"docs/implementazione/README.md\" \"docs/implementazione/controllore-pool-decisioni.md\" \"docs/implementazione/controllore-pool-metodo.md\" \"docs/implementazione/controllore-pool-revisione-2.md\" \"docs/implementazione/controllore-pool-revisione.md\" \"docs/implementazione/controllore-pool-risultati.md\" \"docs/implementazione/controllore-pool.md\" \"src/scheduler/build.lisp\" \"src/scheduler/package.lisp\" \"src/scheduler/policy.lisp\" \"src/scheduler/read.lisp\" \"src/scheduler/types.lisp\" \"src/scheduler/update.lisp\" \"tests/scheduler/controller.lisp\" \"tests/scheduler/support.lisp\" \"tools/pool-controller-bench.lisp\") :benchmark-report \"spikes/out/pool-qualified-benchmark/report.lisp\" :evidence ((:name \"coverage-audit\" :source \"spikes/out/pool-qualified-coverage/coverage-audit.lisp\") (:name \"core-spikes-SPK-01\" :source \"/tmp/arcdocdb-pool-controller-qualification-1791916367/spikes/out/4000906505-check-41362-0/SPK-01.lisp\") (:name \"core-spikes-SPK-02\" :source \"/tmp/arcdocdb-pool-controller-qualification-1791916367/spikes/out/4000906505-check-41362-0/SPK-02.lisp\") (:name \"core-spikes-SPK-03\" :source \"/tmp/arcdocdb-pool-controller-qualification-1791916367/spikes/out/4000906505-check-41362-0/SPK-03.lisp\") (:name \"core-spikes-SPK-04\" :source \"/tmp/arcdocdb-pool-controller-qualification-1791916367/spikes/out/4000906505-check-41362-0/SPK-04.lisp\") (:name \"core-spikes-SPK-05\" :source \"/tmp/arcdocdb-pool-controller-qualification-1791916367/spikes/out/4000906505-check-41362-0/SPK-05.lisp\") (:name \"core-spikes-SPK-06\" :source \"/tmp/arcdocdb-pool-controller-qualification-1791916367/spikes/out/4000906505-check-41362-0/SPK-06.lisp\") (:name \"core-spikes-SPK-07\" :source \"/tmp/arcdocdb-pool-controller-qualification-1791916367/spikes/out/4000906505-check-41362-0/SPK-07.lisp\") (:name \"core-spikes-SPK-08\" :source \"/tmp/arcdocdb-pool-controller-qualification-1791916367/spikes/out/4000906505-check-41362-0/SPK-08.lisp\") (:name \"core-spikes-SPK-09\" :source \"/tmp/arcdocdb-pool-controller-qualification-1791916367/spikes/out/4000906505-check-41362-0/SPK-09.lisp\") (:name \"core-spikes-SPK-10\" :source \"/tmp/arcdocdb-pool-controller-qualification-1791916367/spikes/out/4000906505-check-41362-0/SPK-10.lisp\") (:name \"core-spikes-conservazione\" :source \"/tmp/arcdocdb-pool-controller-qualification-1791916367/spikes/out/4000906505-check-41362-0/conservazione.lisp\") (:name \"core-spikes-report\" :source \"/tmp/arcdocdb-pool-controller-qualification-1791916367/spikes/out/4000906505-check-41362-0/report.lisp\")) :extra-sources (\"/tmp/arcdocdb-pool-state.json\"))
")
  (:PATH #A((29) BASE-CHAR . "/tmp/arcdocdb-pool-state.json") :BYTES 6800 :SHA256
   "671c28bdca90d2fd0a41d5fb2b58cca3b623ca0789d92a5f9c7e300fcee62544" :GIT-BLOB
   "245c5e35c62da8d747cf2a1491484c70c3856061" :TEXT "{
  \"root\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\",
  \"snapshot\": \"/tmp/arcdocdb-pool-controller-qualification-1791916367\",
  \"paths\": [
    \"CHANGELOG.md\",
    \"arcdocdb.asd\",
    \"docs/implementazione/README.md\",
    \"docs/implementazione/controllore-pool-decisioni.md\",
    \"docs/implementazione/controllore-pool-metodo.md\",
    \"docs/implementazione/controllore-pool-revisione-2.md\",
    \"docs/implementazione/controllore-pool-revisione.md\",
    \"docs/implementazione/controllore-pool-risultati.md\",
    \"docs/implementazione/controllore-pool.md\",
    \"src/scheduler/build.lisp\",
    \"src/scheduler/package.lisp\",
    \"src/scheduler/policy.lisp\",
    \"src/scheduler/read.lisp\",
    \"src/scheduler/types.lisp\",
    \"src/scheduler/update.lisp\",
    \"tests/scheduler/controller.lisp\",
    \"tests/scheduler/support.lisp\",
    \"tools/pool-controller-bench.lisp\"
  ],
  \"base\": \"4344d9e1f2ceb45e5fa3d5076b57d09505e69ac3\",
  \"fingerprints\": {
    \"CHANGELOG.md\": \"92b505445fda88d76aff91f7709b603c63f77a5edb63035926aba2049ef9aded\",
    \"arcdocdb.asd\": \"3593d876c5096f55a472f742f1de5f74eb4518f561953e75518d2e6efe93a23e\",
    \"docs/implementazione/README.md\": \"c713c63c5627a88c325ecb05eab3ed2fda2b7d14491c476db4eb19ba5ec5d8aa\",
    \"docs/implementazione/controllore-pool-decisioni.md\": \"1deb86de4dd82c8152a9178d948ab4b883bd5e696b9e600f263b5fb393ef6109\",
    \"docs/implementazione/controllore-pool-metodo.md\": \"d0de0ed4012781b0c7acf16f74fa8dfdcf13a3e009c1f26b29cea7cb06cab6bc\",
    \"docs/implementazione/controllore-pool-revisione-2.md\": \"244d28ca1fcfe4795b31701fabe99ee253f9d3723e67a560af575af76946a012\",
    \"docs/implementazione/controllore-pool-revisione.md\": \"e9808608a7fa6f868c22fbf7c21429e60c0a9b9e77e9d336076faad163457663\",
    \"docs/implementazione/controllore-pool-risultati.md\": \"71056c8cc8560f91aee11cec01c8485dfb52824ebcd83ff02eff2d51d6c3d675\",
    \"docs/implementazione/controllore-pool.md\": \"f1b2fd4be201e59fea66259598b379c3e50ba14982b1ad3e9ce8bd44d7554758\",
    \"src/scheduler/build.lisp\": \"58baf595f221826c64e3fb38344242c3bdf403d65904193bf1a8e06e09d7c336\",
    \"src/scheduler/package.lisp\": \"1ae4001c0349d4e9f7d282e9c05129573149d50418880073789a46fa18b1968b\",
    \"src/scheduler/policy.lisp\": \"92b3ca3a81ae0b3ac342a63e5fe5c5d7524091a63065b0232c14c57ee80c4aac\",
    \"src/scheduler/read.lisp\": \"5cdc1e5b7ba97c9aab66a5acaf74336b0df33144e24104e0242b7fc2552a1ae2\",
    \"src/scheduler/types.lisp\": \"3b174be0919f8b27312ada4071d831c3753d62bb12be99d7e9394c48dcab474a\",
    \"src/scheduler/update.lisp\": \"e35a704ee0b9445c559a768de048169a8e39837a6df21843d8df58215c482472\",
    \"tests/scheduler/controller.lisp\": \"e986e3facc9d1b9b4eab0d135259a61d7e0f188a7f268cb2e5ee5f9c700c40be\",
    \"tests/scheduler/support.lisp\": \"d8aeec53062cccf036c693ff709baf1086e331f8a247a5693b82c0ff1c7a4401\",
    \"tools/pool-controller-bench.lisp\": \"8c23121bb53be3a63e0c7a911d60ef31321b9a66186df60433b81b96c2b86c66\"
  },
  \"records\": [
    {
      \"name\": \"tool-selftest\",
      \"id\": \"4000906285-command-38487-0\",
      \"root\": \"/tmp/arcdocdb-pool-controller-qualification-1791916367\"
    },
    {
      \"name\": \"core-cache-rejected\",
      \"id\": \"4000906285-command-38488-0\",
      \"root\": \"/tmp/arcdocdb-pool-controller-qualification-1791916367\"
    },
    {
      \"name\": \"coverage\",
      \"id\": \"4000906285-command-38489-0\",
      \"root\": \"/tmp/arcdocdb-pool-controller-qualification-1791916367\"
    },
    {
      \"name\": \"core\",
      \"id\": \"4000906339-command-39039-0\",
      \"root\": \"/tmp/arcdocdb-pool-controller-qualification-1791916367\"
    },
    {
      \"name\": \"benchmark\",
      \"id\": \"4000906340-command-39064-0\",
      \"root\": \"/tmp/arcdocdb-pool-controller-qualification-1791916367\"
    }
  ],
  \"benchmark_report\": \"spikes/out/pool-qualified-benchmark/report.lisp\",
  \"coverage_audit\": \"spikes/out/pool-qualified-coverage/coverage-audit.lisp\",
  \"final_paths\": [
    \"CHANGELOG.md\",
    \"arcdocdb.asd\",
    \"docs/implementazione/README.md\",
    \"docs/implementazione/controllore-pool-decisioni.md\",
    \"docs/implementazione/controllore-pool-metodo.md\",
    \"docs/implementazione/controllore-pool-revisione-2.md\",
    \"docs/implementazione/controllore-pool-revisione.md\",
    \"docs/implementazione/controllore-pool-risultati.md\",
    \"docs/implementazione/controllore-pool.md\",
    \"src/scheduler/build.lisp\",
    \"src/scheduler/package.lisp\",
    \"src/scheduler/policy.lisp\",
    \"src/scheduler/read.lisp\",
    \"src/scheduler/types.lisp\",
    \"src/scheduler/update.lisp\",
    \"tests/scheduler/controller.lisp\",
    \"tests/scheduler/support.lisp\",
    \"tools/pool-controller-bench.lisp\"
  ],
  \"evidence\": [
    {
      \"name\": \"coverage-audit\",
      \"source\": \"spikes/out/pool-qualified-coverage/coverage-audit.lisp\"
    },
    {
      \"name\": \"core-spikes-SPK-01\",
      \"source\": \"/tmp/arcdocdb-pool-controller-qualification-1791916367/spikes/out/4000906505-check-41362-0/SPK-01.lisp\"
    },
    {
      \"name\": \"core-spikes-SPK-02\",
      \"source\": \"/tmp/arcdocdb-pool-controller-qualification-1791916367/spikes/out/4000906505-check-41362-0/SPK-02.lisp\"
    },
    {
      \"name\": \"core-spikes-SPK-03\",
      \"source\": \"/tmp/arcdocdb-pool-controller-qualification-1791916367/spikes/out/4000906505-check-41362-0/SPK-03.lisp\"
    },
    {
      \"name\": \"core-spikes-SPK-04\",
      \"source\": \"/tmp/arcdocdb-pool-controller-qualification-1791916367/spikes/out/4000906505-check-41362-0/SPK-04.lisp\"
    },
    {
      \"name\": \"core-spikes-SPK-05\",
      \"source\": \"/tmp/arcdocdb-pool-controller-qualification-1791916367/spikes/out/4000906505-check-41362-0/SPK-05.lisp\"
    },
    {
      \"name\": \"core-spikes-SPK-06\",
      \"source\": \"/tmp/arcdocdb-pool-controller-qualification-1791916367/spikes/out/4000906505-check-41362-0/SPK-06.lisp\"
    },
    {
      \"name\": \"core-spikes-SPK-07\",
      \"source\": \"/tmp/arcdocdb-pool-controller-qualification-1791916367/spikes/out/4000906505-check-41362-0/SPK-07.lisp\"
    },
    {
      \"name\": \"core-spikes-SPK-08\",
      \"source\": \"/tmp/arcdocdb-pool-controller-qualification-1791916367/spikes/out/4000906505-check-41362-0/SPK-08.lisp\"
    },
    {
      \"name\": \"core-spikes-SPK-09\",
      \"source\": \"/tmp/arcdocdb-pool-controller-qualification-1791916367/spikes/out/4000906505-check-41362-0/SPK-09.lisp\"
    },
    {
      \"name\": \"core-spikes-SPK-10\",
      \"source\": \"/tmp/arcdocdb-pool-controller-qualification-1791916367/spikes/out/4000906505-check-41362-0/SPK-10.lisp\"
    },
    {
      \"name\": \"core-spikes-conservazione\",
      \"source\": \"/tmp/arcdocdb-pool-controller-qualification-1791916367/spikes/out/4000906505-check-41362-0/conservazione.lisp\"
    },
    {
      \"name\": \"core-spikes-report\",
      \"source\": \"/tmp/arcdocdb-pool-controller-qualification-1791916367/spikes/out/4000906505-check-41362-0/report.lisp\"
    }
  ]
}")))
