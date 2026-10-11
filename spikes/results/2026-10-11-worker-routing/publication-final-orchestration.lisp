(:SCHEMA-VERSION 1 :KIND :WORKER-ROUTING-ORCHESTRATION-BUNDLE :VERSION
 "final-seal-source-and-state" :SOURCES
 ((:PATH
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-publication-functions.lisp")
   :BYTES 24521 :SHA256 "01ce7104faa1905afa2f6b48a03bee04c176ee4c9f68e16ddb1ff435d70a028b"
   :GIT-BLOB "0f07134b815897b8bd75ee04e9f7e9a1b3eab49f" :TEXT
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
  (:PATH
   #A((97) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-full-publish.lisp")
   :BYTES 7875 :SHA256 "6b635d2f441a74cbbd8d8de60bb60c36bbfbebd0093bf594ccd64a378e9af659" :GIT-BLOB
   "50cd19c27dd681d27f28340f2603f3777e6a0190" :TEXT "(require :asdf)
(load \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-publication-functions.lisp\")
(defparameter *routing-canonical* \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing/\")
(uiop:with-current-directory (\"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/\") (worker-copy-process \"4000712542-command-86913-0\" \"full-check\" :directory *routing-canonical*))
(uiop:with-current-directory (\"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/\") (worker-copy-process \"4000712842-command-93594-0\" \"fullcheck-selftests-integrity-process\" :directory *routing-canonical*))
(uiop:with-current-directory (\"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/\") (worker-copy-process \"4000712876-command-94086-0\" \"fullcheck-auxiliary-failed-replay\" :directory *routing-canonical*))
(uiop:with-current-directory (\"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/\") (worker-copy-process \"4000712554-command-87125-0\" \"publication-byte-gate\" :directory *routing-canonical*))
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712744-routing-fullcheck-projection-92144/summary.lisp\" (merge-pathnames \"fullcheck-summary.lisp\" *routing-canonical*))
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712744-routing-fullcheck-projection-92144/auxiliary-bundle.lisp\" (merge-pathnames \"fullcheck-selftests.lisp\" *routing-canonical*))
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712744-routing-fullcheck-projection-92144/integrity.lisp\" (merge-pathnames \"fullcheck-selftests-integrity.lisp\" *routing-canonical*))
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712744-routing-fullcheck-projection-92144/conservazione.lisp\" (merge-pathnames \"fullcheck-selftests-conservazione.lisp\" *routing-canonical*))
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712691-check-90489-0/SPK-01.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/SPK-01.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712691-check-90489-0/SPK-02.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/SPK-02.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712691-check-90489-0/SPK-03.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/SPK-03.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712691-check-90489-0/SPK-04.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/SPK-04.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712691-check-90489-0/SPK-05.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/SPK-05.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712691-check-90489-0/SPK-06.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/SPK-06.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712691-check-90489-0/SPK-07.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/SPK-07.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712691-check-90489-0/SPK-08.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/SPK-08.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712691-check-90489-0/SPK-09.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/SPK-09.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712691-check-90489-0/SPK-10.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/SPK-10.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712691-check-90489-0/conservazione.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/conservazione.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712691-check-90489-0/report.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/report.lisp\")
(worker-refresh-catalog \"d155db3f977677fa95280f59c23fbe46a5e116d2\" :directory \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/\")
(worker-save-source-bundle (list \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-byte-gate.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/routing-fullcheck-integrity-failed-v1.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/routing-fullcheck-integrity.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/routing-fullcheck-runner.sh\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/routing-fullcheck-summary.lisp\") (merge-pathnames \"fullcheck-orchestration.lisp\" *routing-canonical*) :worker-routing-orchestration-bundle :version \"full-check-and-auxiliary-probes\")
(worker-save-source-bundle (list \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/README.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/CHANGELOG.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker-metodo.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker-decisioni.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker-revisione.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker-risultati.md\") (merge-pathnames \"documentation-final.lisp\" *routing-canonical*) :worker-routing-documentation-bundle :version \"after-full-check\")
(worker-refresh-catalog \"d155db3f977677fa95280f59c23fbe46a5e116d2\" :historical-bases (list \"92decf4265554cd4959e32a1c881cf00758bb6a1\") :directory *routing-canonical*)
(format t \"~&Full-check routing evidence bytes verified.~%\")
")
  (:PATH
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-integration-publish.lisp")
   :BYTES 4594 :SHA256 "5bc67b028952cf18a8efb9f599c352e92e106b25b731e2aca98b446a409aabed" :GIT-BLOB
   "86ab3de94a3428274f5d8e229d5d7735667da889" :TEXT "(require :asdf)
(load \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-publication-functions.lisp\")
(defparameter *routing-canonical* \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing/\")
(worker-copy-process \"4000713251-command-579-0\" \"publication-full-check\" :directory *routing-canonical*)
(worker-copy-process \"4000713454-command-5744-0\" \"documentation-gate-d155\" :directory *routing-canonical*)
(worker-save-source-bundle (list \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/src/execution/package.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/src/execution/handoff.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/src/series/worker-package.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/src/series/routing-types.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/src/series/routing-build.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/src/series/routing-select.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/arcdocdb.asd\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/tests/series/worker-routing.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/tools/worker-routing-bench.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/docs/implementazione/README.md\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/CHANGELOG.md\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/docs/implementazione/routing-worker.md\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/docs/implementazione/routing-worker-metodo.md\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/docs/implementazione/routing-worker-decisioni.md\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/docs/implementazione/routing-worker-revisione.md\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/docs/implementazione/routing-worker-risultati.md\") (merge-pathnames \"source-latest-integrated.lisp\" *routing-canonical*) :worker-routing-source-bundle :version \"latest-main-freeze-6eeb501\")
(worker-save-source-bundle (list \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-integration-latest-preimages/0-base.txt\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-integration-latest-preimages/0-local.txt\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-integration-latest-preimages/0-merged.txt\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-integration-latest-preimages/0-upstream.txt\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-integration-latest-preimages/1-base.txt\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-integration-latest-preimages/1-local.txt\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-integration-latest-preimages/1-merged.txt\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-integration-latest-preimages/1-upstream.txt\") (merge-pathnames \"integration-latest-preimages.lisp\" *routing-canonical*) :worker-routing-integration-bundle :version \"ASDF-readme-three-way-6eeb501\")
(worker-save-source-bundle (list \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-full-publish.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/routing-latest-check-runner.sh\" \"/tmp/arcdocdb-routing-state.json\") (merge-pathnames \"publication-and-latest-orchestration.lisp\" *routing-canonical*) :worker-routing-orchestration-bundle :version \"before-latest-fullcheck\")
(worker-refresh-catalog \"6eeb501d2eace49fad8e2ec333ed0c6c1386dd6c\" :historical-bases (list \"92decf4265554cd4959e32a1c881cf00758bb6a1\" \"d155db3f977677fa95280f59c23fbe46a5e116d2\") :directory *routing-canonical*)
(format t \"~&Latest integration sources and historical gates conserved.~%\")
")
  (:PATH
   #A((99) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-latest-publish.lisp")
   :BYTES 8047 :SHA256 "167dc085e981272b46b0373c45633c2f8d5f6d63d9da8ad787bf252841c0d0dd" :GIT-BLOB
   "bfbf8ff34215267ce78c8c51c182f75576d6238a" :TEXT "(require :asdf)
(load \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-publication-functions.lisp\")
(defparameter *routing-canonical* \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing/\")
(uiop:with-current-directory (\"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/\") (worker-copy-process \"4000713646-command-11645-0\" \"full-check-latest\" :directory *routing-canonical*))
(uiop:with-current-directory (\"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/\") (worker-copy-process \"4000713862-command-21871-0\" \"fullcheck-latest-integrity-process\" :directory *routing-canonical*))
(worker-copy-process \"4000713674-command-12282-0\" \"publication-latest-integration\" :directory *routing-canonical*)
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713838-routing-latest-projection-20354/summary.lisp\" (merge-pathnames \"fullcheck-latest-summary.lisp\" *routing-canonical*))
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713838-routing-latest-projection-20354/auxiliary-bundle.lisp\" (merge-pathnames \"fullcheck-latest-selftests.lisp\" *routing-canonical*))
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713838-routing-latest-projection-20354/conservazione.lisp\" (merge-pathnames \"fullcheck-latest-selftests-conservazione.lisp\" *routing-canonical*))
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713838-routing-latest-projection-20354/integrity.lisp\" (merge-pathnames \"fullcheck-latest-integrity.lisp\" *routing-canonical*))
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713838-routing-latest-projection-20354/spike-leaf-proof.lisp\" (merge-pathnames \"fullcheck-latest-spike-leaf-proof.lisp\" *routing-canonical*))
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713800-check-18712-0/SPK-01.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/latest/SPK-01.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713800-check-18712-0/SPK-02.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/latest/SPK-02.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713800-check-18712-0/SPK-03.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/latest/SPK-03.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713800-check-18712-0/SPK-04.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/latest/SPK-04.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713800-check-18712-0/SPK-05.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/latest/SPK-05.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713800-check-18712-0/SPK-06.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/latest/SPK-06.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713800-check-18712-0/SPK-07.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/latest/SPK-07.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713800-check-18712-0/SPK-08.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/latest/SPK-08.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713800-check-18712-0/SPK-09.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/latest/SPK-09.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713800-check-18712-0/SPK-10.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/latest/SPK-10.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713800-check-18712-0/conservazione.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/latest/conservazione.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/4000713800-check-18712-0/report.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/latest/report.lisp\")
(worker-refresh-catalog \"6eeb501d2eace49fad8e2ec333ed0c6c1386dd6c\" :directory \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/latest/\")
(worker-save-source-bundle (list \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/routing-latest-check-runner.sh\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/routing-latest-summary.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/routing-fullcheck-summary.preimage.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/routing-latest-integrity.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/routing-fullcheck-integrity.preimage.lisp\") (merge-pathnames \"fullcheck-latest-orchestration.lisp\" *routing-canonical*) :worker-routing-orchestration-bundle :version \"latest-main-general-check\")
(worker-save-source-bundle (list \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/README.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/CHANGELOG.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker-metodo.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker-decisioni.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker-revisione.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker-risultati.md\") (merge-pathnames \"documentation-latest.lisp\" *routing-canonical*) :worker-routing-documentation-bundle :version \"after-latest-full-check\")
(worker-refresh-catalog \"6eeb501d2eace49fad8e2ec333ed0c6c1386dd6c\" :historical-bases (list \"92decf4265554cd4959e32a1c881cf00758bb6a1\" \"d155db3f977677fa95280f59c23fbe46a5e116d2\") :directory *routing-canonical*)
(format t \"~&Latest fullcheck and all original byte proofs conserved.~%\")
")
  (:PATH
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-final-seal.lisp")
   :BYTES 5310 :SHA256 "874e28cf9cd62eb81cca5b9d3550b310989f1357943797f5d61199b102e1fe99" :GIT-BLOB
   "3a021ab6466d3d0360d97fbe38a4bb5dd93cdc4e" :TEXT "(require :asdf)
(load \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-publication-functions.lisp\")
(defparameter *routing-canonical* \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing/\")
(defparameter *routing-expected-sources* (list (list :path \"src/execution/package.lisp\" :sha256 \"833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30\") (list :path \"src/execution/handoff.lisp\" :sha256 \"3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a\") (list :path \"src/series/worker-package.lisp\" :sha256 \"dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7\") (list :path \"src/series/routing-types.lisp\" :sha256 \"31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1\") (list :path \"src/series/routing-build.lisp\" :sha256 \"70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d\") (list :path \"src/series/routing-select.lisp\" :sha256 \"796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a\") (list :path \"arcdocdb.asd\" :sha256 \"3b3ce29d4b370c82d2a4f6e05d3650f9217cbe9e4d9e63c10b94c9cb7c2d4ea8\") (list :path \"tests/series/worker-routing.lisp\" :sha256 \"f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9\") (list :path \"tools/worker-routing-bench.lisp\" :sha256 \"9a9055374bcf3d845e3878a1c3250feb1c98aebd243692b076cc0f262ad7f7ec\")))
(let* ((args (uiop:command-line-arguments)) (record (first args)))
  (unless (and (= (length args) 1) (worker-leaf-p record)) (error \"Expected one completed documentation gate record.\"))
  (let ((gate (arcdocdb.evidence:read-evidence (format nil \"spikes/out/~A/report.lisp\" record))))
    (unless (and (eq (getf gate :status) :ok) (eql (getf gate :exit-code) 0) (eq (getf gate :source-consistency) :stable)) (error \"Documentation gate is not OK/STABLE/exit0.\"))
    (dolist (expected *routing-expected-sources*)
      (unless (string= (getf expected :sha256) (arcdocdb.evidence:file-sha256 (getf expected :path))) (error \"Product source differs from the passing frozen snapshot: ~A\" (getf expected :path))))
    (worker-copy-process \"4000713991-command-28617-0\" \"publication-latest-fullcheck\" :directory *routing-canonical*)
    (worker-copy-process record \"documentation-gate-final\" :directory *routing-canonical*)
    (worker-save-source-bundle (list \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/README.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/CHANGELOG.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker-metodo.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker-decisioni.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker-revisione.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker-risultati.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing/README.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/README.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/latest/README.md\") (merge-pathnames \"documentation-publication.lisp\" *routing-canonical*) :worker-routing-documentation-bundle :version \"final-reviewed-publication\")
    (worker-save-source-bundle (list \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-publication-functions.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-full-publish.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-integration-publish.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-latest-publish.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-final-seal.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-commit-message.txt\" \"/tmp/arcdocdb-routing-state.json\") (merge-pathnames \"publication-final-orchestration.lisp\" *routing-canonical*) :worker-routing-orchestration-bundle :version \"final-seal-source-and-state\")
    (worker-save-data (list :schema-version 1 :kind :worker-routing-publication-proof :status :ok :latest-base \"6eeb501d2eace49fad8e2ec333ed0c6c1386dd6c\" :product-source-sha256 *routing-expected-sources* :documentation-gate-record record :documentation-gate-status (getf gate :status) :documentation-gate-exit-code (getf gate :exit-code) :documentation-gate-source-consistency (getf gate :source-consistency) :scope :source-identity-and-evidence-conservation-only :requirements-promoted nil) (merge-pathnames \"publication-final-proof.lisp\" *routing-canonical*))
    (worker-refresh-catalog \"6eeb501d2eace49fad8e2ec333ed0c6c1386dd6c\" :historical-bases (list \"92decf4265554cd4959e32a1c881cf00758bb6a1\" \"d155db3f977677fa95280f59c23fbe46a5e116d2\") :directory *routing-canonical*)
    (format t \"~&Final routing seal complete: code matches latest passing snapshot; raw archives conserved.~%\")))
")
  (:PATH
   #A((98) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-commit-message.txt")
   :BYTES 526 :SHA256 "56e5e2a4100a45b898c70faf0f0fd62ffb2ec4ffcac7d6ec4b085997ed3c339a" :GIT-BLOB
   "5b7edd262176eeb986b8552786d1211d88911e7c" :TEXT
   "Instrada in O(1) i writer pronti ai collegamenti Serie

Assegna ordinali immutabili all'avvio, valida il registro condiviso e
prealloca una tabella per worker. Il lookup controlla identita e fase,
conservando obbligo e condizione originale su guasti di routing.

Include 18 regressioni, due letture C1, copertura nativa/HTML senza
esclusioni e cinque misure locali senza allocazioni osservate.
Verifica integrata: 854 test, due smoke e dieci esperimenti riusciti.
Pool adattivo e coordinatore Archivio rimangono da integrare.
")
  (:PATH #A((32) BASE-CHAR . "/tmp/arcdocdb-routing-state.json") :BYTES 14831 :SHA256
   "418d99907d47a930e362254e158c056321549ab239acf2816cc08932806a50c8" :GIT-BLOB
   "e09d687067008aed2e560acf1dc4d808b3f94e50" :TEXT "{
  \"worktree\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\",
  \"base\": \"92decf4265554cd4959e32a1c881cf00758bb6a1\",
  \"owned\": [
    \"src/execution/package.lisp\",
    \"src/execution/handoff.lisp\",
    \"src/series/worker-package.lisp\",
    \"src/series/routing-types.lisp\",
    \"src/series/routing-build.lisp\",
    \"src/series/routing-select.lisp\",
    \"arcdocdb.asd\",
    \"tests/series/worker-routing.lisp\",
    \"tools/worker-routing-bench.lisp\",
    \"docs/implementazione/README.md\",
    \"CHANGELOG.md\",
    \"docs/implementazione/routing-worker.md\",
    \"docs/implementazione/routing-worker-metodo.md\",
    \"docs/implementazione/routing-worker-decisioni.md\",
    \"docs/implementazione/routing-worker-revisione.md\",
    \"docs/implementazione/routing-worker-risultati.md\"
  ],
  \"campaigns\": [
    {
      \"snapshot\": \"v1\",
      \"kind\": \"target\",
      \"record\": \"4000711896-command-71058-0\",
      \"status\": \"failed-fixture-stack\"
    },
    {
      \"snapshot\": \"v1\",
      \"kind\": \"strict-c4\",
      \"record\": \"4000711978-command-74703-0\",
      \"status\": \"ok\"
    },
    {
      \"snapshot\": \"v2\",
      \"kind\": \"target\",
      \"record\": \"4000712082-command-76603-0\",
      \"status\": \"ok\"
    },
    {
      \"snapshot\": \"v2\",
      \"kind\": \"coverage\",
      \"record\": \"4000712082-command-76602-0\",
      \"status\": \"ok\"
    },
    {
      \"snapshot\": \"v2\",
      \"kind\": \"benchmark\",
      \"record\": \"4000712105-command-77187-0\",
      \"status\": \"ok\"
    },
    {
      \"snapshot\": \"v2\",
      \"kind\": \"coverage-audit\",
      \"record\": \"4000712247-command-79840-0\",
      \"status\": \"ok\"
    },
    {
      \"snapshot\": \"worktree\",
      \"kind\": \"publication-initial\",
      \"record\": \"4000712318-command-81618-0\",
      \"status\": \"source-changed-documentation\"
    },
    {
      \"snapshot\": \"worktree\",
      \"kind\": \"byte-gate\",
      \"record\": \"4000712554-command-87125-0\",
      \"status\": \"ok\"
    }
  ],
  \"snapshots\": [
    {
      \"version\": \"v1\",
      \"path\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-v1-qinoyy62/ArcDocDB\",
      \"hashes\": {
        \"src/execution/package.lisp\": \"833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30\",
        \"src/execution/handoff.lisp\": \"3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a\",
        \"src/series/worker-package.lisp\": \"dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7\",
        \"src/series/routing-types.lisp\": \"31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1\",
        \"src/series/routing-build.lisp\": \"70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d\",
        \"src/series/routing-select.lisp\": \"796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a\",
        \"arcdocdb.asd\": \"a4852ba400f91c52af42df0143b921fbcb1895479d4e250f16d57ad8d65f7fb9\",
        \"tests/series/worker-routing.lisp\": \"f2b9b0cf5cc0400732864c12fb0483431a7d2ea1f1dfdafe5b1f3dbb4d4fe151\",
        \"tools/worker-routing-bench.lisp\": \"9a9055374bcf3d845e3878a1c3250feb1c98aebd243692b076cc0f262ad7f7ec\",
        \"docs/implementazione/README.md\": \"992c370f55c979a7a5e5179cd993052640de7863230b37f9754c33b938661571\",
        \"CHANGELOG.md\": \"e0fdb669469b9578adbe3700de2d229e27f3fb8e1ba9c8790320f046520bccc0\",
        \"docs/implementazione/routing-worker.md\": \"7c1e8a5ef5fdddab0f5175a964d205d69a96823e239c733b59165c1d3e99d03e\",
        \"docs/implementazione/routing-worker-metodo.md\": \"ef5a5c090db1723dad999943456f6d18d71e0a3c85d9bff3505f213765bb9e01\",
        \"docs/implementazione/routing-worker-revisione.md\": \"c740088bf5b9781c0840505b83fd10e4fcde825ec2d985576809dad1840f095d\"
      },
      \"paths\": [
        \"src/execution/package.lisp\",
        \"src/execution/handoff.lisp\",
        \"src/series/worker-package.lisp\",
        \"src/series/routing-types.lisp\",
        \"src/series/routing-build.lisp\",
        \"src/series/routing-select.lisp\",
        \"arcdocdb.asd\",
        \"tests/series/worker-routing.lisp\",
        \"tools/worker-routing-bench.lisp\",
        \"docs/implementazione/README.md\",
        \"CHANGELOG.md\",
        \"docs/implementazione/routing-worker.md\",
        \"docs/implementazione/routing-worker-metodo.md\",
        \"docs/implementazione/routing-worker-revisione.md\"
      ]
    },
    {
      \"version\": \"v2\",
      \"path\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-v2-skkktsa6/ArcDocDB\",
      \"hashes\": {
        \"src/execution/package.lisp\": \"833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30\",
        \"src/execution/handoff.lisp\": \"3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a\",
        \"src/series/worker-package.lisp\": \"dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7\",
        \"src/series/routing-types.lisp\": \"31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1\",
        \"src/series/routing-build.lisp\": \"70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d\",
        \"src/series/routing-select.lisp\": \"796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a\",
        \"arcdocdb.asd\": \"a4852ba400f91c52af42df0143b921fbcb1895479d4e250f16d57ad8d65f7fb9\",
        \"tests/series/worker-routing.lisp\": \"f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9\",
        \"tools/worker-routing-bench.lisp\": \"9a9055374bcf3d845e3878a1c3250feb1c98aebd243692b076cc0f262ad7f7ec\",
        \"docs/implementazione/README.md\": \"992c370f55c979a7a5e5179cd993052640de7863230b37f9754c33b938661571\",
        \"CHANGELOG.md\": \"e0fdb669469b9578adbe3700de2d229e27f3fb8e1ba9c8790320f046520bccc0\",
        \"docs/implementazione/routing-worker.md\": \"7c1e8a5ef5fdddab0f5175a964d205d69a96823e239c733b59165c1d3e99d03e\",
        \"docs/implementazione/routing-worker-metodo.md\": \"9d4fe6ac9ef16ec4496bd14fb0e01f5a31d9639056b4dd94edb895d1d899e25f\",
        \"docs/implementazione/routing-worker-decisioni.md\": \"ef9e0d614d0b40596a879272b5fee407ce867e465d9fbe53301752560323700e\",
        \"docs/implementazione/routing-worker-revisione.md\": \"3dd4debcc4191b7384d2669b8a7e96500761b77b5d90bf68c20e42f867e70b34\"
      },
      \"paths\": [
        \"src/execution/package.lisp\",
        \"src/execution/handoff.lisp\",
        \"src/series/worker-package.lisp\",
        \"src/series/routing-types.lisp\",
        \"src/series/routing-build.lisp\",
        \"src/series/routing-select.lisp\",
        \"arcdocdb.asd\",
        \"tests/series/worker-routing.lisp\",
        \"tools/worker-routing-bench.lisp\",
        \"docs/implementazione/README.md\",
        \"CHANGELOG.md\",
        \"docs/implementazione/routing-worker.md\",
        \"docs/implementazione/routing-worker-metodo.md\",
        \"docs/implementazione/routing-worker-decisioni.md\",
        \"docs/implementazione/routing-worker-revisione.md\"
      ]
    },
    {
      \"version\": \"final\",
      \"path\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB\",
      \"hashes\": {
        \"src/execution/package.lisp\": \"833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30\",
        \"src/execution/handoff.lisp\": \"3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a\",
        \"src/series/worker-package.lisp\": \"dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7\",
        \"src/series/routing-types.lisp\": \"31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1\",
        \"src/series/routing-build.lisp\": \"70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d\",
        \"src/series/routing-select.lisp\": \"796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a\",
        \"arcdocdb.asd\": \"30eca55034b83b652bb98fa501efee833e1b90e59cec068e54de59ae72f9e23e\",
        \"tests/series/worker-routing.lisp\": \"f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9\",
        \"tools/worker-routing-bench.lisp\": \"9a9055374bcf3d845e3878a1c3250feb1c98aebd243692b076cc0f262ad7f7ec\",
        \"docs/implementazione/README.md\": \"c48a17916d1bae0d2045dccbda23f24b9a6fbe44bdbe05c5e5fe3e526efec574\",
        \"CHANGELOG.md\": \"e9bdfa636364a576b513005d4cf1fa58465161e50775decc8eafb194a0025523\",
        \"docs/implementazione/routing-worker.md\": \"9ac1584adaa0099ca71e39699f6cfea94d8e4637a8e7bd6a674e29faffa2586b\",
        \"docs/implementazione/routing-worker-metodo.md\": \"9d4fe6ac9ef16ec4496bd14fb0e01f5a31d9639056b4dd94edb895d1d899e25f\",
        \"docs/implementazione/routing-worker-decisioni.md\": \"949a9e8013207ab5d81290fb7cf703b5ccb45d831636fccadb36a1d4d9b0dad2\",
        \"docs/implementazione/routing-worker-revisione.md\": \"2f7b1ed1c8ce6948c3f0c055847be601eb7570a4dfdfda20989ca652b398f1d4\",
        \"docs/implementazione/routing-worker-risultati.md\": \"06debfa9e74343b66640adeb3e3829f39ce094d362748fe9ad716769888c2d02\"
      },
      \"paths\": [
        \"src/execution/package.lisp\",
        \"src/execution/handoff.lisp\",
        \"src/series/worker-package.lisp\",
        \"src/series/routing-types.lisp\",
        \"src/series/routing-build.lisp\",
        \"src/series/routing-select.lisp\",
        \"arcdocdb.asd\",
        \"tests/series/worker-routing.lisp\",
        \"tools/worker-routing-bench.lisp\",
        \"docs/implementazione/README.md\",
        \"CHANGELOG.md\",
        \"docs/implementazione/routing-worker.md\",
        \"docs/implementazione/routing-worker-metodo.md\",
        \"docs/implementazione/routing-worker-decisioni.md\",
        \"docs/implementazione/routing-worker-revisione.md\",
        \"docs/implementazione/routing-worker-risultati.md\"
      ]
    },
    {
      \"version\": \"latest\",
      \"path\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB\",
      \"hashes\": {
        \"src/execution/package.lisp\": \"833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30\",
        \"src/execution/handoff.lisp\": \"3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a\",
        \"src/series/worker-package.lisp\": \"dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7\",
        \"src/series/routing-types.lisp\": \"31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1\",
        \"src/series/routing-build.lisp\": \"70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d\",
        \"src/series/routing-select.lisp\": \"796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a\",
        \"arcdocdb.asd\": \"3b3ce29d4b370c82d2a4f6e05d3650f9217cbe9e4d9e63c10b94c9cb7c2d4ea8\",
        \"tests/series/worker-routing.lisp\": \"f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9\",
        \"tools/worker-routing-bench.lisp\": \"9a9055374bcf3d845e3878a1c3250feb1c98aebd243692b076cc0f262ad7f7ec\",
        \"docs/implementazione/README.md\": \"d85cbea154f0ffc15069de954ce4f08c0620833bed11dad189bb0013d28e4928\",
        \"CHANGELOG.md\": \"5ba1abe1a33d17fca86a3541edeb398eb1f99b1618b3ab83023efa036f49d9f0\",
        \"docs/implementazione/routing-worker.md\": \"9ac1584adaa0099ca71e39699f6cfea94d8e4637a8e7bd6a674e29faffa2586b\",
        \"docs/implementazione/routing-worker-metodo.md\": \"9d4fe6ac9ef16ec4496bd14fb0e01f5a31d9639056b4dd94edb895d1d899e25f\",
        \"docs/implementazione/routing-worker-decisioni.md\": \"f2f909eef13f7ee89509b4079b50ca43588b61c0ace945226601afd638a509d6\",
        \"docs/implementazione/routing-worker-revisione.md\": \"397ea2adeb96801788ed01e5e8bfce874a065fc898ff7e0a3e094a9371040fda\",
        \"docs/implementazione/routing-worker-risultati.md\": \"3b6fb82a6eebe22a1517b325177c225137afed434e6172a1d7137f23d60b558b\"
      },
      \"paths\": [
        \"src/execution/package.lisp\",
        \"src/execution/handoff.lisp\",
        \"src/series/worker-package.lisp\",
        \"src/series/routing-types.lisp\",
        \"src/series/routing-build.lisp\",
        \"src/series/routing-select.lisp\",
        \"arcdocdb.asd\",
        \"tests/series/worker-routing.lisp\",
        \"tools/worker-routing-bench.lisp\",
        \"docs/implementazione/README.md\",
        \"CHANGELOG.md\",
        \"docs/implementazione/routing-worker.md\",
        \"docs/implementazione/routing-worker-metodo.md\",
        \"docs/implementazione/routing-worker-decisioni.md\",
        \"docs/implementazione/routing-worker-revisione.md\",
        \"docs/implementazione/routing-worker-risultati.md\"
      ]
    }
  ],
  \"integrationbase\": \"d155db3f977677fa95280f59c23fbe46a5e116d2\",
  \"integrationpreimages\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-integration-preimages\",
  \"canonical\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing\",
  \"qualification\": {
    \"target-tests\": 18,
    \"coverage-files\": 26,
    \"union-total\": [
      3250,
      3766,
      436,
      526
    ],
    \"routing-total\": [
      267,
      291,
      40,
      42
    ],
    \"handoff-total\": [
      189,
      206,
      18,
      20
    ],
    \"heap\": [
      0,
      0,
      0,
      0,
      0
    ],
    \"raw-ticks\": [
      6792,
      6802,
      6814,
      6820,
      6815
    ],
    \"sink\": 8972288,
    \"positive-heap\": 16777472
  },
  \"fullcheck\": {
    \"record\": \"4000712542-command-86913-0\",
    \"status\": \"ok\",
    \"source-consistency\": \"stable\",
    \"source-files\": 673,
    \"tests\": 835,
    \"smoke\": 2,
    \"suites\": 21,
    \"spikes-master\": \"4000712691-check-90489-0\",
    \"spikes\": 10,
    \"wall-seconds\": 182.076021,
    \"projection\": \"spikes/out/4000712744-routing-fullcheck-projection-92144\"
  },
  \"spikescanonical\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check\",
  \"auxiliary\": {
    \"integrity-record\": \"4000712842-command-93594-0\",
    \"failed-replay-record\": \"4000712876-command-94086-0\",
    \"original-failed-raw\": \"not-recorded\"
  },
  \"publication\": {
    \"record\": \"4000713251-command-579-0\",
    \"status\": \"ok\",
    \"gate-record\": \"4000713454-command-5744-0\",
    \"gate-status\": \"ok\",
    \"latest-integration-record\": \"4000713674-command-12282-0\",
    \"latest-fullcheck-record\": \"4000713991-command-28617-0\",
    \"final-documentation-gate\": \"4000714129-command-33773-0\",
    \"final-documentation-status\": \"ok-stable\"
  },
  \"latestbase\": \"6eeb501d2eace49fad8e2ec333ed0c6c1386dd6c\",
  \"latestintegrationpreimages\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-integration-latest-preimages\",
  \"latestfullcheck\": {
    \"record\": \"4000713646-command-11645-0\",
    \"status\": \"ok\",
    \"source-consistency\": \"stable\",
    \"source-files\": 683,
    \"tests\": 854,
    \"smoke\": 2,
    \"suites\": 22,
    \"spikes-master\": \"4000713800-check-18712-0\",
    \"spikes\": 10,
    \"wall-seconds\": 185.668746,
    \"projection\": \"spikes/out/4000713838-routing-latest-projection-20354\",
    \"spikescanonical\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/latest\",
    \"integrity-record\": \"4000713862-command-21871-0\"
  }
}
")))
