(:SCHEMA-VERSION 1 :KIND :RETENTION-AUDIT :STATUS :OK :METHOD
 :LENGTH-AND-SHA256 :COPIES
 ((:SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001085061-command-32768-0/report.lisp")
   :COPY "raccolta-processo.lisp" :FINGERPRINT
   (:BYTES 233833 :SHA256
    "1c77be8c05f096a5a5c44368f225c4fc24f73a028d7b906b1463c50b4e2c5151"))
  (:SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001085061-command-32768-0/conservazione.lisp")
   :COPY "raccolta-conservazione.lisp" :FINGERPRINT
   (:BYTES 1139 :SHA256
    "50f17023a36b8f0f82374c63912d164bd72e9f3b7f2ceafcae1fe7f6f9d684cc"))
  (:SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/results/2026-10-15-recovery-csn/collection/report.lisp")
   :COPY "raccolta.lisp" :FINGERPRINT
   (:BYTES 28485 :SHA256
    "0947b22a6ae6ae683ac9785780812cd2b15f56f767c5bd1edc16f8fa140ea3a7"))
  (:SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/results/2026-10-15-recovery-csn/collection/closed-check.log")
   :COPY "archivio-verifica.lisp" :FINGERPRINT
   (:BYTES 5350 :SHA256
    "586d2bd5225d9c70691f4127c728d7dc13a67cb34cfca815151d1e186f9e936e")))
 :HELPER-SOURCE "(require :asdf)
(let* ((root (truename \"./\"))
       (base (merge-pathnames \"spikes/results/2026-10-15-recovery-csn/\" root))
       (record (merge-pathnames (first (uiop:command-line-arguments)) root))
       (entries nil))
  (labels ((data (path) (let ((*read-eval* nil)) (with-open-file (s path) (read s))))
           (fingerprint (path)
             (list :bytes (with-open-file (s path :element-type '(unsigned-byte 8)) (file-length s))
                   :sha256 (subseq (uiop:run-program (list \"shasum\" \"-a\" \"256\" (namestring path))
                                                    :output :string) 0 64)))
           (copy-original (source name)
             (let* ((target (merge-pathnames name base)) (before (fingerprint source)))
               (when (probe-file target) (error \"Destination exists: ~A\" target))
               (uiop:copy-file source target)
               (unless (and (equal before (fingerprint source)) (equal before (fingerprint target)))
                 (error \"Retention mismatch: ~A\" source))
               (push (list :source (namestring source) :copy name :fingerprint before) entries)))
           (copy-data (source name)
             (copy-original source name)
             (let ((raw (data source)))
               (when (eq (getf raw :kind) :compressed-evidence)
                 (copy-original (merge-pathnames (getf raw :payload) source) (getf raw :payload)))))
           (save-new (name datum)
             (with-open-file (s (merge-pathnames name base) :direction :output :if-exists :error)
               (write datum :stream s :readably t :pretty t) (terpri s))))
    (copy-data record \"raccolta-processo.lisp\")
    (copy-data (merge-pathnames \"conservazione.lisp\" record) \"raccolta-conservazione.lisp\")
    (copy-data (merge-pathnames \"collection/report.lisp\" base) \"raccolta.lisp\")
    (copy-data (merge-pathnames \"collection/closed-check.log\" base) \"archivio-verifica.lisp\")
    (save-new \"conservazione-verifica.lisp\"
              (list :schema-version 1 :kind :retention-audit :status :ok
                    :method :length-and-sha256 :copies (nreverse entries)
                    :helper-source (uiop:read-file-string *load-truename*)
                    :limits '(:no-literal-byte-comparison :no-functional-qualification)))
    (save-new \"catalogo.lisp\"
              '(:schema-version 1 :kind :evidence-catalog :date \"2026-10-15\"
                :entries ((:kind :command-archive-collection :artifact \"raccolta.lisp\"
                           :original \"raccolta-processo.lisp\" :process-artifact \"raccolta-conservazione.lisp\")
                          (:kind :closed-archive-audit :artifact \"archivio-verifica.lisp\")
                          (:kind :retention-audit :artifact \"conservazione-verifica.lisp\"))))
    (write (list :status :ok :copies (length entries)))))
"
 :LIMITS (:NO-LITERAL-BYTE-COMPARISON :NO-FUNCTIONAL-QUALIFICATION))
