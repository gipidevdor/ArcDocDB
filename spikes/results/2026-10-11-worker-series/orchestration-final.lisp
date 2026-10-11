(:SCHEMA-VERSION 1 :KIND :WORKER-SERIES-ORCHESTRATION-BUNDLE :VERSION "final-audit-and-publication"
 :SOURCES
 ((:PATH
   #A((141) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/spikes/out/worker-series-coverage-reader-02.lisp")
   :BYTES 3909 :SHA256 "4a99a4097ec014fc0b0a84ca7c13f1f601daafa7e2159563519526f84e70a140" :GIT-BLOB
   "3d3e1b5a11a88c01234ffac5916fe2bc0b8ca20a" :TEXT
   ";;;; C4: inventario nativo, nessuna esclusione entro lo scope Series.
(eval-when (:compile-toplevel :load-toplevel :execute) (require :asdf))
(declaim (optimize (safety 3) (debug 3)))
(defun review-native-row (entry)
  (let ((eh 0) (et 0) (bh 0) (bt 0) (missing nil))
    (assert (= (length (cadr entry)) (length (cddr entry))))
    (loop for path across (cadr entry) for bit across (cddr entry)
          do (assert (member bit '(0 1)))
             (if (member (car path) '(:then :else))
                 (progn (incf bt) (incf bh bit))
                 (progn (incf et) (incf eh bit)))
             (when (= bit 0)
               (push (list :kind (if (member (car path) '(:then :else)) :branch :expression)
                           :path path) missing)))
    (list :file (file-namestring (car entry)) :expressions-hit eh :expressions-total et
          :branches-hit bh :branches-total bt :missing (nreverse missing))))
(defun coverage-reader-self-test ()
  (let ((row (review-native-row (list* \"fixture\" #((0) (1) (:then 2) (:else 2)) #*1010))))
    (assert (= 1 (getf row :expressions-hit) (getf row :branches-hit)))
    (assert (= 2 (getf row :expressions-total) (getf row :branches-total)))
    (assert (equal (getf row :missing) '((:kind :expression :path (1)) (:kind :branch :path (:else 2))))))
  (dolist (entry (list (list* \"bad-length\" #((0)) #*00)
                      (list* \"bad-bit\" #((0) (1)) #(0 2))))
    (assert (handler-case (progn (review-native-row entry) nil) (error () t))))
  :passed)
(defun coverage-reader-main ()
  (coverage-reader-self-test)
  (let* ((*read-eval* nil)
         (native \"spikes/out/worker-series-coverage-01/coverage-state.lisp\")
         (raw (with-open-file (input native :external-format :utf-8) (read input)))
         (rows (sort (loop for entry in raw when (search \"/src/series/\" (car entry))
                          collect (review-native-row entry)) #'string< :key (lambda (r) (getf r :file))))
         (expected '((\"events.lisp\" 288 335 38 46) (\"io-events.lisp\" 185 220 23 32)
                     (\"ownership.lisp\" 223 279 42 52) (\"package.lisp\" 0 1 0 0)
                     (\"publication.lisp\" 156 203 16 22) (\"query.lisp\" 65 79 5 6)
                     (\"retirement.lisp\" 166 182 14 18) (\"types.lisp\" 75 84 4 10)
                     (\"worker-boundary.lisp\" 74 86 18 20) (\"worker-package.lisp\" 0 1 0 0)
                     (\"worker-run.lisp\" 145 161 12 14) (\"worker-types.lisp\" 124 168 19 30)))
         (counts (mapcar (lambda (r) (list (getf r :file) (getf r :expressions-hit)
                                         (getf r :expressions-total) (getf r :branches-hit)
                                         (getf r :branches-total))) rows))
         (total (loop for col from 1 to 4 collect (loop for r in counts sum (nth col r))))
         (bridge-total (loop for col from 1 to 4 collect
                        (loop for r in counts when (uiop:string-prefix-p \"worker-\" (first r)) sum (nth col r)))))
    (assert (equal counts expected))
    (assert (equal total '(1501 1799 191 250)))
    (assert (equal bridge-total '(343 416 49 64)))
    (let ((report (list :schema-version 1 :kind :worker-series-coverage-audit :status :ok
                        :native-path native :files rows :total total :bridge-total bridge-total
                        :html-counts expected :html-counts-origin :manual-read-cover-index
                        :self-test :passed :exclusions nil :mcdc-inferred nil)))
      (with-open-file (output \"spikes/out/worker-series-coverage-audit-02.lisp\" :direction :output
                              :if-exists :error :external-format :utf-8)
        (let ((*print-readably* t)) (write report :stream output :pretty t) (terpri output)))
      (format t \"~&Coverage audit PASS: 12 files, ~S; bridge ~S~%\" total bridge-total))))
(unless (member :worker-serie-coverage-library *features*) (coverage-reader-main))
")
  (:PATH
   #A((98) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-series-publish.lisp")
   :BYTES 9698 :SHA256 "06038aa0679312f22bb9e2bbda3aab18e6116a7bcd68caefcacc18418cdb0e35" :GIT-BLOB
   "13eff6795bd1f998688451c9569516988f1dbcb0" :TEXT "(require :asdf)
(load \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-publication-functions.lisp\")
(defparameter *bridge-canonical* \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-series/\")
(uiop:with-current-directory (\"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/\") (worker-copy-process \"4000707404-command-27430-0\" \"tool-probe-01\" :directory *bridge-canonical*))
(uiop:with-current-directory (\"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/\") (worker-copy-process \"4000707421-command-27947-0\" \"tool-probe-02\" :directory *bridge-canonical*))
(uiop:with-current-directory (\"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/\") (worker-copy-process \"4000707509-command-29682-0\" \"tool-probe-03\" :directory *bridge-canonical*))
(uiop:with-current-directory (\"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/\") (worker-copy-process \"4000707539-command-30277-0\" \"tool-probe-04\" :directory *bridge-canonical*))
(uiop:with-current-directory (\"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-m1eqa0hk/ArcDocDB/\") (worker-copy-process \"4000707711-command-33137-0\" \"target-01\" :directory *bridge-canonical*))
(uiop:with-current-directory (\"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-m1eqa0hk/ArcDocDB/\") (worker-copy-process \"4000707756-command-33862-0\" \"selftest-01\" :directory *bridge-canonical*))
(uiop:with-current-directory (\"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v2-jck4hkpm/ArcDocDB/\") (worker-copy-process \"4000707803-command-34920-0\" \"target-02\" :directory *bridge-canonical*))
(uiop:with-current-directory (\"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/\") (worker-copy-process \"4000708313-command-79577-0\" \"target-final\" :directory *bridge-canonical*))
(uiop:with-current-directory (\"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/\") (worker-copy-process \"4000708333-command-80909-0\" \"coverage-process\" :directory *bridge-canonical*))
(uiop:with-current-directory (\"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/\") (worker-copy-process \"4000708336-command-81274-0\" \"c4-argv-probe\" :directory *bridge-canonical*))
(uiop:with-current-directory (\"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/\") (worker-copy-process \"4000708361-command-83427-0\" \"c4-final\" :directory *bridge-canonical*))
(uiop:with-current-directory (\"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/\") (worker-copy-process \"4000708391-command-85710-0\" \"benchmark-process\" :directory *bridge-canonical*))
(uiop:with-current-directory (\"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/\") (worker-copy-process \"4000708506-command-97108-0\" \"coverage-audit-process\" :directory *bridge-canonical*))
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/spikes/out/worker-series-bench-01/report.lisp\" (merge-pathnames \"benchmark-data.lisp\" *bridge-canonical*))
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/spikes/out/worker-series-coverage-audit.lisp\" (merge-pathnames \"coverage-audit.lisp\" *bridge-canonical*))
(worker-save-source-bundle (list \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-m1eqa0hk/ArcDocDB/docs/implementazione/worker-serie-metodo.md\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-m1eqa0hk/ArcDocDB/docs/implementazione/worker-serie.md\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-m1eqa0hk/ArcDocDB/src/series/worker-boundary.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-m1eqa0hk/ArcDocDB/src/series/worker-package.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-m1eqa0hk/ArcDocDB/src/series/worker-run.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-m1eqa0hk/ArcDocDB/src/series/worker-types.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-m1eqa0hk/ArcDocDB/tests/series/worker-bridge.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-m1eqa0hk/ArcDocDB/tools/worker-series-bench.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-m1eqa0hk/ArcDocDB/arcdocdb.asd\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-m1eqa0hk/ArcDocDB/docs/implementazione/README.md\") (merge-pathnames \"source-preliminary-01.lisp\" *bridge-canonical*) :worker-series-source-bundle :version \"preliminary-01\")
(worker-save-source-bundle (list \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v2-jck4hkpm/ArcDocDB/docs/implementazione/worker-serie-decisioni.md\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v2-jck4hkpm/ArcDocDB/docs/implementazione/worker-serie-metodo.md\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v2-jck4hkpm/ArcDocDB/docs/implementazione/worker-serie.md\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v2-jck4hkpm/ArcDocDB/src/series/worker-boundary.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v2-jck4hkpm/ArcDocDB/src/series/worker-package.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v2-jck4hkpm/ArcDocDB/src/series/worker-run.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v2-jck4hkpm/ArcDocDB/src/series/worker-types.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v2-jck4hkpm/ArcDocDB/tests/series/worker-bridge.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v2-jck4hkpm/ArcDocDB/tools/worker-series-bench.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v2-jck4hkpm/ArcDocDB/arcdocdb.asd\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v2-jck4hkpm/ArcDocDB/docs/implementazione/README.md\") (merge-pathnames \"source-preliminary-02.lisp\" *bridge-canonical*) :worker-series-source-bundle :version \"preliminary-02\")
(worker-save-source-bundle (list \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/docs/implementazione/worker-serie-decisioni.md\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/docs/implementazione/worker-serie-metodo.md\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/docs/implementazione/worker-serie.md\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/src/series/worker-boundary.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/src/series/worker-package.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/src/series/worker-run.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/src/series/worker-types.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/tests/series/worker-bridge.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/tools/worker-series-bench.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/arcdocdb.asd\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/docs/implementazione/README.md\") (merge-pathnames \"source-final.lisp\" *bridge-canonical*) :worker-series-source-bundle :version \"qualified-v3\")
(worker-save-source-bundle (list \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/spikes/out/worker-series-targeted.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/spikes/out/worker-series-coverage-reader.lisp\") (merge-pathnames \"orchestration.lisp\" *bridge-canonical*) :worker-series-orchestration-bundle)
(uiop:with-current-directory (\"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/\") (load \"tools/finish-evidence.lisp\") (let ((stage \"spikes/out/worker-series-coverage-bundle/\")) (ensure-directories-exist stage) (let ((data (list :schema-version 1 :kind :worker-series-coverage-bundle :sources (mapcar #'worker-source-record (cons \"spikes/out/worker-series-coverage-01/coverage-state.lisp\" (sort (directory \"spikes/out/worker-series-coverage-01/*.html\") #'string< :key #'namestring)))))) (with-open-file (out (merge-pathnames \"coverage-bundle.lisp\" stage) :direction :output :if-exists :error :external-format :utf-8) (let ((*print-readably* t)) (write data :stream out :pretty t) (terpri out)))) (unless (compact-finished-directory stage) (error \"Coverage compaction failed\")) (worker-copy-evidence (merge-pathnames \"coverage-bundle.lisp\" stage) (merge-pathnames \"coverage-bundle.lisp\" *bridge-canonical*)) (worker-copy-evidence (merge-pathnames \"conservazione.lisp\" stage) (merge-pathnames \"coverage-bundle-conservazione.lisp\" *bridge-canonical*))))
(worker-refresh-catalog \"8101eb856cbe9d7540682babb53afb00fde30f70\" :historical-bases (list \"2a0011f9d2bef104b22f7ad1eb86d7e5d60d5e11\") :directory *bridge-canonical*)
(format t \"~&Publication bytes validated.~%\")
")
  (:PATH
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-series-publication-output.txt")
   :BYTES 549 :SHA256 "3583a4172bd838434e0ae145f677725ed52536d32a6ffb2dd1ba9359e38607d1" :GIT-BLOB
   "14859005f0eb3e32d97f618bb567a5365988ac12" :TEXT "
; file: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-series-publish.lisp
; in:
;      UIOP/FILESYSTEM:WITH-CURRENT-DIRECTORY (\"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/\")
;     (COMPACT-FINISHED-DIRECTORY STAGE)
; 
; caught STYLE-WARNING:
;   undefined function: COMMON-LISP-USER::COMPACT-FINISHED-DIRECTORY
; 
; compilation unit finished
;   Undefined function:
;     COMPACT-FINISHED-DIRECTORY
;   caught 1 STYLE-WARNING condition
Publication bytes validated.
")
  (:PATH
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
")))
