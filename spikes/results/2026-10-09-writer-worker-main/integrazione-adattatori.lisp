(:SCHEMA-VERSION 1 :KIND :WORKER-UPSTREAM-INTEGRATION-ADAPTERS :VERSION 1 :SOURCES
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
  (:PATH #A((31) BASE-CHAR . "spikes/out/worker-main-scope.py") :BYTES 3002 :SHA256
   "e96218110fbcd485378ae54b4ec5a98144ca88d2e7fb3a7ca5efec18228e5008" :GIT-BLOB
   "218ee97ddb59248313cc2cc7701fb2475e231c87" :TEXT "from pathlib import Path
import subprocess, json, hashlib
root=Path.cwd()
def git(*args):return subprocess.check_output(['git',*args],cwd=root).decode().strip()
def tree(rev):
 raw=subprocess.check_output(['git','ls-tree','-r','-z',rev],cwd=root)
 d={}
 for record in raw.split(b'\\0'):
  if record:
   meta,path=record.split(b'\\t',1);mode,kind,blob=meta.decode().split()
   d[path.decode()]={'mode':mode,'kind':kind,'blob':blob}
 return d,hashlib.sha256(raw).hexdigest()
worker='9f9f6bd3b7a219211c8f08fe9e5f2b669b849796'
upstream='edb043b1234479cadab0f39b7adf1918786fa91e'
merge='a185aee95b2e40f267df26ec41024dafc0fb9b7a'
assert git('rev-parse','HEAD')==merge and git('status','--porcelain')==''
assert git('rev-parse','HEAD^1')==worker and git('rev-parse','HEAD^2')==upstream
w,wh=tree(worker);u,uh=tree(upstream);m,mh=tree(merge)
assert set(u)<=set(m)
different=[p for p in u if u[p]!=m[p]]
expected={'arcdocdb.asd','docs/implementazione/README.md','src/execution/package.lisp','docs/affidabilita/copertura-eccezioni.md'}
assert set(different)==expected
same_worker=[]
for p in w:
 if p.startswith(('src/execution/','tests/execution/')) or p in ('tools/writer-worker-bench.lisp','tools/writer-worker-mutation.lisp'):
  assert w[p]==m[p],p
  same_worker.append({'path':p,'git_blob':m[p]['blob']})
extra=sorted(set(m)-set(u))
for p in extra: assert p in w and w[p]==m[p],p
assert m['src/execution/package.lisp']==w['src/execution/package.lisp']
assert m['docs/affidabilita/copertura-eccezioni.md']==w['docs/affidabilita/copertura-eccezioni.md']
asd=(root/'arcdocdb.asd').read_text();readme=(root/'docs/implementazione/README.md').read_text()
for name in ('worker-types','worker-boundary','worker-claim','worker-run','worker','series','index','mvcc','epochs','read'):
 assert '\"'+name+'\"' in asd,name
for name in ('writer-worker.md','controller-serie.md','indice-primario.md','snapshot-csn.md','compiti-lettura.md'):
 assert name in readme,name
report={'schema_version':1,'kind':'worker-upstream-integration-scope','status':'passed','merge':merge,'worker_parent':worker,'upstream_parent':upstream,'parents_verified':True,'upstream_paths':len(u),'upstream_identical_paths':len(u)-len(different),'removed_upstream_paths':[],'tree_exports_sha256':{'worker':wh,'upstream':uh,'merge':mh},'common_changed':[{'path':p,'upstream':u[p],'merged':m[p]} for p in sorted(different)],'unchanged_worker_execution_tests_tools':same_worker,'extra_paths_identical_to_published_worker':[{'path':p,'git_blob':m[p]['blob']} for p in extra],'limits':['tree-and-build-assembly-scope','no-new-worker-Series-dispatch-protocol','worker-campaigns-retain-original-scoped-records','full-check-registered-separately','no-new-MCDC-or-runtime-scalability-claim']}
p=root/'spikes/out/worker-main-scope.json'
with p.open('x') as f:json.dump(report,f,indent=2);f.write('\\n')
print('SCOPE PASS:',len(u),'upstream paths preserved;',len(same_worker),'worker sources/tests/tools unchanged;',len(extra),'published worker additions retained.')
")
  (:PATH #A((33) BASE-CHAR . "spikes/out/worker-main-scope.json") :BYTES 28091 :SHA256
   "b3c92c0c1c2612962093539b962606f071d569c7a01b1dfb0ce765e16b9a1dc9" :GIT-BLOB
   "72c8d8eeb0a31d72aa6ca3188fcc1ee7c87e684a" :TEXT "{
  \"schema_version\": 1,
  \"kind\": \"worker-upstream-integration-scope\",
  \"status\": \"passed\",
  \"merge\": \"a185aee95b2e40f267df26ec41024dafc0fb9b7a\",
  \"worker_parent\": \"9f9f6bd3b7a219211c8f08fe9e5f2b669b849796\",
  \"upstream_parent\": \"edb043b1234479cadab0f39b7adf1918786fa91e\",
  \"parents_verified\": true,
  \"upstream_paths\": 4100,
  \"upstream_identical_paths\": 4096,
  \"removed_upstream_paths\": [],
  \"tree_exports_sha256\": {
    \"worker\": \"2092af456a25859b68aa90243ab841a8edfa79ccbad8434fd1babda64ec58875\",
    \"upstream\": \"5b8400ce610ae8c4330ca87603733fb305d047dc20fea4e070bde8ea057ebb42\",
    \"merge\": \"4f37787b0cf09001f38f4f633406746b600e78249ecb619cc2fc6ae28fb039d6\"
  },
  \"common_changed\": [
    {
      \"path\": \"arcdocdb.asd\",
      \"upstream\": {
        \"mode\": \"100644\",
        \"kind\": \"blob\",
        \"blob\": \"36e6b47112aef8508c0d5e3f5872251f706ce317\"
      },
      \"merged\": {
        \"mode\": \"100644\",
        \"kind\": \"blob\",
        \"blob\": \"6c1d300217db738905041b5ca2d05de44654776e\"
      }
    },
    {
      \"path\": \"docs/affidabilita/copertura-eccezioni.md\",
      \"upstream\": {
        \"mode\": \"100644\",
        \"kind\": \"blob\",
        \"blob\": \"a45aa9409b85e2e3bf5df01b158432b948116648\"
      },
      \"merged\": {
        \"mode\": \"100644\",
        \"kind\": \"blob\",
        \"blob\": \"fdb928d6caf051a0341c162d537ca5d6351acfd9\"
      }
    },
    {
      \"path\": \"docs/implementazione/README.md\",
      \"upstream\": {
        \"mode\": \"100644\",
        \"kind\": \"blob\",
        \"blob\": \"06f431abe3343d40436ad3ee7f30594925430af8\"
      },
      \"merged\": {
        \"mode\": \"100644\",
        \"kind\": \"blob\",
        \"blob\": \"1eb1d8fdab3378ac38931c1bada444cf5f819d60\"
      }
    },
    {
      \"path\": \"src/execution/package.lisp\",
      \"upstream\": {
        \"mode\": \"100644\",
        \"kind\": \"blob\",
        \"blob\": \"f140cee3f2f661c99fb7d860e4a642a66175c484\"
      },
      \"merged\": {
        \"mode\": \"100644\",
        \"kind\": \"blob\",
        \"blob\": \"cdc776ff97c2b500b3b8a802a3b1e0e69fc19cee\"
      }
    }
  ],
  \"unchanged_worker_execution_tests_tools\": [
    {
      \"path\": \"src/execution/handoff.lisp\",
      \"git_blob\": \"a030e7af1afd6db760088f74615fe2396d928b64\"
    },
    {
      \"path\": \"src/execution/package.lisp\",
      \"git_blob\": \"cdc776ff97c2b500b3b8a802a3b1e0e69fc19cee\"
    },
    {
      \"path\": \"src/execution/queue.lisp\",
      \"git_blob\": \"bb4d4d6f222aa360ec64ef2f45ee6ba0524dd2f0\"
    },
    {
      \"path\": \"src/execution/ready-recycle.lisp\",
      \"git_blob\": \"58981c7e41ce2694dbfcaed99010a3a53e3c1dea\"
    },
    {
      \"path\": \"src/execution/ready-types.lisp\",
      \"git_blob\": \"5b3c26f78d5c4aa53ca200abdd3e0f753f926b54\"
    },
    {
      \"path\": \"src/execution/ready.lisp\",
      \"git_blob\": \"4119f86231b7d8698fc3558868ff8a5bcbdf3090\"
    },
    {
      \"path\": \"src/execution/worker-boundary.lisp\",
      \"git_blob\": \"720f16e96203f00e308727b430b66b28689dc7bb\"
    },
    {
      \"path\": \"src/execution/worker-claim.lisp\",
      \"git_blob\": \"4f34d18152d77fbf63bf708ebd0aabac178c3ac1\"
    },
    {
      \"path\": \"src/execution/worker-run.lisp\",
      \"git_blob\": \"65a3f3c9e84c83b900c1dd8c9cc2fc21cec36c52\"
    },
    {
      \"path\": \"src/execution/worker-types.lisp\",
      \"git_blob\": \"6d36e1f64d79f24c95209fd70551953e40c62335\"
    },
    {
      \"path\": \"src/execution/writer.lisp\",
      \"git_blob\": \"8e5102497f628796fa8faffa2085a165496af230\"
    },
    {
      \"path\": \"tests/execution/handoff.lisp\",
      \"git_blob\": \"ba702352ee63241b9ac993b0aca8f162c3deef1b\"
    },
    {
      \"path\": \"tests/execution/queue.lisp\",
      \"git_blob\": \"546d4215f9f63007f632c522f0f8c1e75ac4bbeb\"
    },
    {
      \"path\": \"tests/execution/ready-recycle.lisp\",
      \"git_blob\": \"1dff8707436ca52f20f62e9946621ca1037f33d2\"
    },
    {
      \"path\": \"tests/execution/ready.lisp\",
      \"git_blob\": \"9f81552333f86fe0b20f2d5e8ba48b20634f5a09\"
    },
    {
      \"path\": \"tests/execution/support.lisp\",
      \"git_blob\": \"b8bac07926727a644f0246f6b57d600332288310\"
    },
    {
      \"path\": \"tests/execution/threads.lisp\",
      \"git_blob\": \"4212f8cc4be686e923cdbec9ded24f42f1da74ba\"
    },
    {
      \"path\": \"tests/execution/worker.lisp\",
      \"git_blob\": \"2a14573906b94b254712a1e9322058ec1081f6f8\"
    },
    {
      \"path\": \"tools/writer-worker-bench.lisp\",
      \"git_blob\": \"1208ddc9971179fc3fcb9300a9ba3c22fcd4a8b9\"
    },
    {
      \"path\": \"tools/writer-worker-mutation.lisp\",
      \"git_blob\": \"568bccdb1229b124e43e5c1b756cf726ead6fcbc\"
    }
  ],
  \"extra_paths_identical_to_published_worker\": [
    {
      \"path\": \"docs/implementazione/writer-worker-decisioni.md\",
      \"git_blob\": \"01109f06ce875665dffb11263b80f68a2d3c07ba\"
    },
    {
      \"path\": \"docs/implementazione/writer-worker-metodo.md\",
      \"git_blob\": \"a12ac9c53969f6755c8cb0de21212f06e7e03e4b\"
    },
    {
      \"path\": \"docs/implementazione/writer-worker-revisione.md\",
      \"git_blob\": \"f500b01def047de7973851144c8196036abf36bb\"
    },
    {
      \"path\": \"docs/implementazione/writer-worker-risultati.md\",
      \"git_blob\": \"dc6dd361bd87f9fcaeb48270088887b37d58cff6\"
    },
    {
      \"path\": \"docs/implementazione/writer-worker.md\",
      \"git_blob\": \"f134e4c3c3cfda195b324e7bb362948b67aa1fd5\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker-final-integration/catalogo.lisp\",
      \"git_blob\": \"20b2c4eaabe638fd943d6befdaff37b9f5fff4f6\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker-final-integration/report.lisp.gz\",
      \"git_blob\": \"d9c0ede58a6d44fbd7200aaf7c056723c66ba096\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker-final-integration/spikes-finali-conservazione.lisp\",
      \"git_blob\": \"1ac6f80ff4cbbdf78bf1a3a4d053b6532ea4ea56\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker-final-integration/spikes-finali.lisp\",
      \"git_blob\": \"edff3805a52e1c0e237a17c83c09fdf92b385623\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker-integration/catalogo.lisp\",
      \"git_blob\": \"f7a3dfb2af5ce61c3ba3b721cb289c691ca77dd9\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker-integration/report.lisp.gz\",
      \"git_blob\": \"a195b4028dd3d4f7956893942c28d023e3ca95b8\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker-integration/spikes-finali-conservazione.lisp\",
      \"git_blob\": \"dd9cb804d034ca7915b71e518d09f390560ccb92\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker-integration/spikes-finali.lisp\",
      \"git_blob\": \"a9ee8ea70d4801db21830983fe38e9ae58d9f7a7\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker-review/catalogo.lisp\",
      \"git_blob\": \"372929b14757a3cd3f08bf62117574f87435e305\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker-review/report.lisp.gz\",
      \"git_blob\": \"a8bf0ebe6bcafb234441527ab33a8dfedee29344\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker-review/revisione-risultati-processo-conservazione.lisp\",
      \"git_blob\": \"bdb5de16b07210bc5e3e62b7377b25626ca71b68\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker-review/revisione-risultati-processo.lisp\",
      \"git_blob\": \"e7542ed0b63540880aafe1e8494feb97b3732373\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/allocazioni-dati.lisp\",
      \"git_blob\": \"9f2b6e5b81e7a459c3e742e0eb45408884c9119f\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/allocazioni-processo-conservazione.lisp\",
      \"git_blob\": \"ba4dd3a3b98e81d04f67232a953ecd11412aa25d\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/allocazioni-processo.lisp\",
      \"git_blob\": \"f2f60fc1f69bbdb486be0b8f1bd3ebafb2c8a1af\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/bench-self-test-processo-conservazione.lisp\",
      \"git_blob\": \"6f8e918e47cfb23f2d8854cdc78d44b1aabcc9ff\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/bench-self-test-processo.lisp\",
      \"git_blob\": \"d0863ee917fd9c1dac4679c4d202b05d9c6d1174\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/catalogo.lisp\",
      \"git_blob\": \"d442803b29585ea5abae1655262444820620de6e\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/check-consegna-processo-conservazione.lisp\",
      \"git_blob\": \"bc1fee86c768e31b2b3b1348f5b644d36eab4c9c\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/check-consegna-processo.lisp\",
      \"git_blob\": \"355a9057aeedcbec832676204c35a809a7b06ee7\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/check-finale-processo-conservazione.lisp\",
      \"git_blob\": \"0371a03cee55719d9ab950fd1205e10647ef294d\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/check-finale-processo.lisp\",
      \"git_blob\": \"9335b2dc1529f9634eb53f89a8f4857b98589f15\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/check-integrazione-processo-conservazione.lisp\",
      \"git_blob\": \"f08e718e0841bea766342b37ba27317c15552abd\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/check-integrazione-processo.lisp\",
      \"git_blob\": \"0b0425f1137b90c6c2a2a1e30537e024146623df\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/chiusura-copia-adattatori.lisp\",
      \"git_blob\": \"06c5d0c5e662990ee74a8505c51d8dd0c99fc9b9\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-adattatori.lisp\",
      \"git_blob\": \"bc0b48d5e049cd94a20771dacf377bca5519e8b3\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-c1-addendum.lisp\",
      \"git_blob\": \"755279c173ec4c117eb65e0c5b46e0bb9d2f9966\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-c1-reader-fallito-1-processo-conservazione.lisp\",
      \"git_blob\": \"f989758e92a8aa020baa31aeedd26b0457a6db19\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-c1-reader-fallito-1-processo.lisp\",
      \"git_blob\": \"258045cc5060e6ad57edf4a6d17d528e84dd677b\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-c1-reader-fallito-2-processo-conservazione.lisp\",
      \"git_blob\": \"8916e5c043a3c629c956bf9857c1a607dd40489d\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-c1-reader-fallito-2-processo.lisp\",
      \"git_blob\": \"2c57628c14bfd76db6b3b9551792abc531949407\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-c1-reader-fallito-3-processo-conservazione.lisp\",
      \"git_blob\": \"07370156f125e563cc8717e55d5cbae1d05368f3\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-c1-reader-fallito-3-processo.lisp\",
      \"git_blob\": \"46fec25869e8e8804c02480352650cadb0ec5d14\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-c1-reader-processo-conservazione.lisp\",
      \"git_blob\": \"efe8bd44765682285cb0cefb3a2ddf3c9a0f75c6\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-c1-reader-processo.lisp\",
      \"git_blob\": \"9d7825cb8d7c80057940f140e300a88b2bd87516\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-chiusura-adattatori.lisp\",
      \"git_blob\": \"2850da68e52f47bfc279e242667f4d9c56f88f1d\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-chiusura-dati.lisp\",
      \"git_blob\": \"411a8afaa8a2d147dcd22492502ed4122142ee17\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-conservazione-processo-conservazione.lisp\",
      \"git_blob\": \"ee6502cb4f2cd044b4ce4aba26dbab7b3780ca28\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-conservazione-processo.lisp\",
      \"git_blob\": \"d56e5b4c10c66b06312fb724884102462575cc22\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-eof-normalizzazione-adattatori.lisp\",
      \"git_blob\": \"9e5dbaf78834266ff07a568d2e1d2a260329f882\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-eof-normalizzazione-dati.lisp\",
      \"git_blob\": \"95bbd851c6a12e42b539466be40396336e459da3\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-eof-normalizzazione-processo-conservazione.lisp\",
      \"git_blob\": \"d668291f7326c74346b0a8528e8df22a79a9c942\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-eof-normalizzazione-processo.lisp\",
      \"git_blob\": \"900451a379c0a99a311de41d324ba21dbaa656ac\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-link-evidenze-processo-conservazione.lisp\",
      \"git_blob\": \"33ed6dd2aac3da40e7cbf1cabd87784ed8574a46\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-link-evidenze-processo.lisp\",
      \"git_blob\": \"90883127d265ce95f24ff3d5e7830fffe4eae69c\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-preparazione-processo-conservazione.lisp\",
      \"git_blob\": \"2a6fefd5af1fb041d50060b44128c33fca3f1b74\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-preparazione-processo.lisp\",
      \"git_blob\": \"c67ad467757341b301bc986af166157a17d01b69\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-pubblicazione-fallita-processo-conservazione.lisp\",
      \"git_blob\": \"bd97431db838b74d621de8bfc5f6c42843e6743f\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-pubblicazione-fallita-processo.lisp\",
      \"git_blob\": \"dce468621d2a3e9983b4f5f51ac0d038408316b3\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-summary-dati.lisp\",
      \"git_blob\": \"4c5b61036adc4eeb3442d05726157d1d76bdc235\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-summary-fallito-processo-conservazione.lisp\",
      \"git_blob\": \"926a61c6edd1b21327007494838dc82047ef25b7\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-summary-fallito-processo.lisp\",
      \"git_blob\": \"da6dd4be8527640aa9fd6dc0ea419bb24dc75751\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-summary-processo-conservazione.lisp\",
      \"git_blob\": \"c093312432b87b6564b19af2ddeecb17ac62d0f7\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/consegna-summary-processo.lisp\",
      \"git_blob\": \"7f3a4cbb0b2e49ef20a79947e042173cca5cb52f\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/copertura-export-processo-conservazione.lisp\",
      \"git_blob\": \"13ee16afe5c34cb41c7a04e69109f0f2d741a260\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/copertura-export-processo.lisp\",
      \"git_blob\": \"d907efdabf582c1de4f6ccfa7c7f39f132fcfa5b\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/copertura-grezza.lisp\",
      \"git_blob\": \"e1f836609b9696821e96044313ead2e96d42a96f\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/copertura-html.lisp\",
      \"git_blob\": \"9aa16585e42f80676c464715a98842c27b60e6c2\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/copertura-native.lisp\",
      \"git_blob\": \"516587a31e92ea09013eb0f53bb5f404399e5a57\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/copertura-processo-conservazione.lisp\",
      \"git_blob\": \"c7fc163e0f5564e6ddd9b418e24bc2a93ecd8f39\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/copertura-processo.lisp\",
      \"git_blob\": \"40cba148d1620981c584c16ab833b091b140c532\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/integrazione-addendum-copia-processo-conservazione.lisp\",
      \"git_blob\": \"b951edd9d1b5949b1909e9e244e564635309e18e\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/integrazione-addendum-copia-processo.lisp\",
      \"git_blob\": \"5ee481483ed12bcd9ee8c9de38abee138f93b54e\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/integrazione-copia-processo-conservazione.lisp\",
      \"git_blob\": \"0f7da20a8de16d449b412fe7261a4b19102e905f\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/integrazione-copia-processo.lisp\",
      \"git_blob\": \"2ce1bbbecac22347ff66483ac65e86f82d7cc559\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/integrazione-summary-processo-conservazione.lisp\",
      \"git_blob\": \"70030b4447ca60aa026d64e0f74b96368dfe3272\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/integrazione-summary-processo.lisp\",
      \"git_blob\": \"bfce8b37b46526da4306a09891bbcbe9bde1ef01\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/mutazioni-dati.lisp\",
      \"git_blob\": \"d3699e252dd7b986e6af93f1c35802556d9a7979\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/mutazioni-log.lisp\",
      \"git_blob\": \"c58d32c27eeb65a3434eb6b574ca6dd880abd611\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/mutazioni-processo-conservazione.lisp\",
      \"git_blob\": \"42f5589b00529d8e1b6ab6e8e225d9f1ca1d0182\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/mutazioni-processo.lisp\",
      \"git_blob\": \"ba9998c1e431d6630bb3e8177457df2f85bb9cec\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/mutazioni-self-test-processo-conservazione.lisp\",
      \"git_blob\": \"24661cb3f1a383e7039901463c10d9ac725b91a1\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/mutazioni-self-test-processo.lisp\",
      \"git_blob\": \"4f65cea2059a0f1ac0faf5ce24aa389f1d6daa71\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/probe-root-processo-conservazione.lisp\",
      \"git_blob\": \"ee0ef8464bf67c61bd5caa02c08f2572c33684b2\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/probe-root-processo.lisp\",
      \"git_blob\": \"f9cb9cf423e93060db410188eae1f497c8b2d40f\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/pubblicazione-chiusura-adattatori.lisp\",
      \"git_blob\": \"f4d48192d43a867a4a7ae3b051c8e430d9dde364\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/pubblicazione-chiusura-processo-conservazione.lisp\",
      \"git_blob\": \"85d0ed24fec733fa8116003197705015754569e7\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/pubblicazione-chiusura-processo.lisp\",
      \"git_blob\": \"ec4b73285cc6b69e63341ada4f40efa5fa36f885\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/pubblicazione-chiusura-registrazione-processo-conservazione.lisp\",
      \"git_blob\": \"a592935583224c9438366082c4f797292a412dc8\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/pubblicazione-chiusura-registrazione-processo.lisp\",
      \"git_blob\": \"e283a99bf020ae7d06306923572d62f335d2fa02\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/pubblicazione-fallita-processo-conservazione.lisp\",
      \"git_blob\": \"c52c154365ccb4e5ecf36ea45376aaa201e82353\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/pubblicazione-fallita-processo.lisp\",
      \"git_blob\": \"8ce5f9159c8a62795c099950bdcd1b952177e042\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/pubblicazione-fix-audit-dati.lisp\",
      \"git_blob\": \"3de02fee1fe2c8713ac9d0216d2f2954e9cb2960\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/pubblicazione-fix-audit-fallito-processo-conservazione.lisp\",
      \"git_blob\": \"392efde3ed0ac0cdc5fb376919f2756f30c29c30\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/pubblicazione-fix-audit-fallito-processo.lisp\",
      \"git_blob\": \"9afeb9724a0844a3544f3ffe0063ce8bd28d00e8\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/pubblicazione-fix-audit-processo-conservazione.lisp\",
      \"git_blob\": \"6b867265cfce516d64da9118e7c583401464924a\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/pubblicazione-fix-audit-processo.lisp\",
      \"git_blob\": \"7dcf14129edae06e610521c3657d828be33a1e0f\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/pubblicazione-fix-audit-summary-processo-conservazione.lisp\",
      \"git_blob\": \"9e48bf2b73feab0fc39213cd3670d06a1b278b57\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/pubblicazione-fix-audit-summary-processo.lisp\",
      \"git_blob\": \"47f98a406f357dfb49726e9e653f60549400a0a4\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/pubblicazione-piano-processo-conservazione.lisp\",
      \"git_blob\": \"d26f07208b768cb3a1c6b256b55e982ed9a08e3a\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/pubblicazione-piano-processo.lisp\",
      \"git_blob\": \"3ec3bcc4c0654059a82979d5714e60997809f7c6\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/pubblicazione-piano-tentativo-non-registrato.lisp\",
      \"git_blob\": \"86fcf4b9e85eb1e99b0d482c61fa38940a14759a\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/pubblicazione-ripresa-heap-fallita-processo-conservazione.lisp\",
      \"git_blob\": \"b6041f9ae4c53bbc5ea827ef71998ec6b3aefaf1\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/pubblicazione-ripresa-heap-fallita-processo.lisp\",
      \"git_blob\": \"9ba58863a348c7395fc250bdf5c8eccdec12c71a\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/pubblicazione-ripresa-load-processo-conservazione.lisp\",
      \"git_blob\": \"c4a8109f173e2192c7d02af2a927e88021021091\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/pubblicazione-ripresa-load-processo.lisp\",
      \"git_blob\": \"386f7824cd17ff9744a4438867f801907237a6e1\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/report.lisp.gz\",
      \"git_blob\": \"eea380a0e6e14b1fc21d30fe71221328287f6552\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/revisione-autore-processo-conservazione.lisp\",
      \"git_blob\": \"18d4ae8deb54f8091bac1cf79d55021ac6d3454f\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/revisione-autore-processo.lisp\",
      \"git_blob\": \"ec7de55e8698876ad565bee56dbea9720df80f91\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/revisione-autore.lisp\",
      \"git_blob\": \"019bc84e8a7b614aa9dca1953839d19b21cc6eac\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/revisione-copertura-dati.lisp\",
      \"git_blob\": \"bb9630da829079949ea48379bfa283fc615c9425\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/revisione-copertura-processo-conservazione.lisp\",
      \"git_blob\": \"336076c6e8e06d37b61a52736296e01a1a89ef9c\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/revisione-copertura-processo.lisp\",
      \"git_blob\": \"49878673c052438433fe745c53b70ef583366087\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/revisione-indipendente-finale.lisp\",
      \"git_blob\": \"eb4d5c69abfeb155f33568a715e577cdb8122f29\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/revisione-indipendente-iniziale-chiusa.lisp\",
      \"git_blob\": \"2087bd4f4af30077832e53479c6ee4c2e7d1a829\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/revisione-indipendente-iniziale.lisp\",
      \"git_blob\": \"820386137d860f9e93d86390a42d98c55324bc2f\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/revisione-indipendente-integrazione-processo-conservazione.lisp\",
      \"git_blob\": \"2320ff9cfdc2c45ac9effd4f645be85e5db9607b\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/revisione-indipendente-integrazione-processo.lisp\",
      \"git_blob\": \"6f90579b5fb708f8b8fb4deefacb41e4ea2a5115\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/revisione-indipendente-integrazione.lisp\",
      \"git_blob\": \"a0c86191ffd7abf26b396afdf85649233223dbf4\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/revisione-mappa-sorgenti-dati.lisp\",
      \"git_blob\": \"f6b337767b11dadbf5b6c080a82db952d105c997\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/revisione-mappa-sorgenti-processo-conservazione.lisp\",
      \"git_blob\": \"f626d2199ba8b7a80751de782d5b1b6772a9229f\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/revisione-mappa-sorgenti-processo.lisp\",
      \"git_blob\": \"d5efbac2c9f22e5899f026cab2a109e2f54279c7\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/revisione-risultati-integrale.lisp\",
      \"git_blob\": \"7546158be898656079c6e19681eb9795bdb73b28\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/revisione-risultati-sommario.lisp\",
      \"git_blob\": \"70c135411a555e36cdad94cf09e2535976ae00b7\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/revisione-summary-fallito-processo-conservazione.lisp\",
      \"git_blob\": \"133a30e0cc529d009abce4a9c4a3dd7336bd4b4e\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/revisione-summary-fallito-processo.lisp\",
      \"git_blob\": \"6b82505633ec27a32353dc96b0661dbe6ed42636\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/revisione-summary-processo-conservazione.lisp\",
      \"git_blob\": \"d0089a6c6a0602f7a4ca26ced28c77ab419f1649\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/revisione-summary-processo.lisp\",
      \"git_blob\": \"f480b6a9e82ecba71ee62da0a71f2704cef65bcc\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/scope-integrazione-processo-conservazione.lisp\",
      \"git_blob\": \"1c638ed919ef18e3644e68b7235a153fc4b59547\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/scope-integrazione-processo.lisp\",
      \"git_blob\": \"c477aa0608e168f5d1a1af35293fbfb6539d82e6\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/segnale-os-dati.lisp\",
      \"git_blob\": \"c160de039f733f3c052880771b791ba1384ee732\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/segnale-os-originali.lisp\",
      \"git_blob\": \"04960aabd9e7db3be634f90c9e8422982035ad50\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/sorgenti-adattatori.lisp\",
      \"git_blob\": \"e7ad1a7bc94408cb1021896c3fb3532d7ec2dd88\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/spikes-finali-conservazione.lisp\",
      \"git_blob\": \"6fa6f9d476a0ea6a55453754a4c7344bf1b7b87a\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/spikes-finali.lisp\",
      \"git_blob\": \"29383131e606556c4f5c96d439ea05a94e20ce32\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/strict-iniziale-storico-processo-conservazione.lisp\",
      \"git_blob\": \"49328ad9cb6b08ccde2fde5a012393c29ce20d70\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/strict-iniziale-storico-processo.lisp\",
      \"git_blob\": \"ce9bb89f3302b2b3c8c09d708a8a51a6a3e38a96\"
    },
    {
      \"path\": \"spikes/results/2026-10-09-writer-worker/worker-review-results-data.lisp.gz\",
      \"git_blob\": \"5ebc710c50f10ea8526d1341036703ce693b7973\"
    },
    {
      \"path\": \"src/execution/worker-boundary.lisp\",
      \"git_blob\": \"720f16e96203f00e308727b430b66b28689dc7bb\"
    },
    {
      \"path\": \"src/execution/worker-claim.lisp\",
      \"git_blob\": \"4f34d18152d77fbf63bf708ebd0aabac178c3ac1\"
    },
    {
      \"path\": \"src/execution/worker-run.lisp\",
      \"git_blob\": \"65a3f3c9e84c83b900c1dd8c9cc2fc21cec36c52\"
    },
    {
      \"path\": \"src/execution/worker-types.lisp\",
      \"git_blob\": \"6d36e1f64d79f24c95209fd70551953e40c62335\"
    },
    {
      \"path\": \"tests/execution/worker.lisp\",
      \"git_blob\": \"2a14573906b94b254712a1e9322058ec1081f6f8\"
    },
    {
      \"path\": \"tools/writer-worker-bench.lisp\",
      \"git_blob\": \"1208ddc9971179fc3fcb9300a9ba3c22fcd4a8b9\"
    },
    {
      \"path\": \"tools/writer-worker-mutation.lisp\",
      \"git_blob\": \"568bccdb1229b124e43e5c1b756cf726ead6fcbc\"
    }
  ],
  \"limits\": [
    \"tree-and-build-assembly-scope\",
    \"no-new-worker-Series-dispatch-protocol\",
    \"worker-campaigns-retain-original-scoped-records\",
    \"full-check-registered-separately\",
    \"no-new-MCDC-or-runtime-scalability-claim\"
  ]
}
")
  (:PATH #A((39) BASE-CHAR . "spikes/out/worker-main-preparation.json") :BYTES 514 :SHA256
   "bf2183e5050ab4fd30d266eb62fe3565fb7b2ef6c53900b90993a01ba1816879" :GIT-BLOB
   "48455c631fcc1368b9e60729e6790365787268e7" :TEXT "{
  \"schema_version\": 1,
  \"source\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\",
  \"snapshot\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-main-bixfp9ek/ArcDocDB\",
  \"merge\": \"a185aee95b2e40f267df26ec41024dafc0fb9b7a\",
  \"worker_parent\": \"9f9f6bd3b7a219211c8f08fe9e5f2b669b849796\",
  \"upstream_parent\": \"edb043b1234479cadab0f39b7adf1918786fa91e\",
  \"status\": \"frozen-candidate\",
  \"canonical_dir\": \"spikes/results/2026-10-09-writer-worker-main\",
  \"check_process\": null
}
")
  (:PATH #A((35) BASE-CHAR . "spikes/out/worker-main-publish.lisp") :BYTES 1177 :SHA256
   "02a3405709601f5cd0992180aaaf314105b7a6c8e6e7dd1e72e4712726654c6c" :GIT-BLOB
   "e0b537adc7ffd632a29a0f33732bb5440a8a38c4" :TEXT
   ";;;; Conservazione degli originali del merge qualificato; nessun test ripetuto.
(load \"spikes/out/worker-publication-functions.lisp\")
(setf *worker-publication-directory*
      #p\"spikes/results/2026-10-09-writer-worker-main/\")
(sb-posix:mkdir (namestring *worker-publication-directory*) #o755)
(worker-copy-process \"4000553376-command-98240-0\" \"check-integrazione-processo\")
(worker-copy-process \"4000553502-command-11495-0\" \"scope-integrazione-processo\")
(worker-copy-process \"4000553486-check-9838-0\" \"spikes-integrazione\")
(worker-save-source-bundle
 '(\"spikes/out/worker-publication-functions.lisp\"
   \"spikes/out/worker-main-scope.py\" \"spikes/out/worker-main-scope.json\"
   \"spikes/out/worker-main-preparation.json\" \"spikes/out/worker-main-publish.lisp\")
 (merge-pathnames \"integrazione-adattatori.lisp\" *worker-publication-directory*)
 :worker-upstream-integration-adapters :version 1)
(worker-refresh-catalog
 \"a185aee95b2e40f267df26ec41024dafc0fb9b7a\"
 :historical-bases '(\"9f9f6bd3b7a219211c8f08fe9e5f2b669b849796\"
                     \"edb043b1234479cadab0f39b7adf1918786fa91e\"))
(format t \"Originali check, scope e master conservati; copie lossless verificate.~%\")
")))
