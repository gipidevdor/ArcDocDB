(:SCHEMA-VERSION 1 :KIND :RETENTION-AUDIT :STATUS :OK :METHOD
 :LENGTH-AND-SHA256 :COPIES
 ((:SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/out/4001154555-command-89907-0/report.lisp")
   :COPY "raccolta-processo.lisp" :FINGERPRINT
   (:BYTES 228059 :SHA256
    "545436bda24b93cc3d04829b618956bcaab0533ad749bd7bf791d8195a727a83"))
  (:SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/out/4001154555-command-89907-0/conservazione.lisp")
   :COPY "raccolta-conservazione.lisp" :FINGERPRINT
   (:BYTES 1153 :SHA256
    "442ef23a5a8f3c8171e5a7eca68f1bb31f39cb89d26095886c1e2dc9a55c0eb6"))
  (:SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/results/2026-10-16-archive-csn-plan/collection/report.lisp")
   :COPY "raccolta.lisp" :FINGERPRINT
   (:BYTES 12960 :SHA256
    "654ebf3fca1e87870026d401e4734040c017d333bd8b4d9a0c2e02d170dbc962"))
  (:SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/results/2026-10-16-archive-csn-plan/collection/closed-check.log")
   :COPY "archivio-verifica.lisp" :FINGERPRINT
   (:BYTES 2521 :SHA256
    "a900af5daec3292f6f182121093850e734a994729e9c84fee3a949e740a31cde")))
 :HELPER-SOURCE "(require :asdf)
(let* ((root (truename \"./\"))
       (base (merge-pathnames \"spikes/results/2026-10-16-archive-csn-plan/\" root))
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
                    :method :length-and-sha256 :copies (reverse entries)
                    :helper-source (uiop:read-file-string *load-truename*)
                    :limits '(:no-literal-byte-comparison :no-functional-qualification)))
    (save-new \"catalogo.lisp\"
              '(:schema-version 1 :kind :evidence-catalog :date \"2026-10-16\"
                :entries ((:kind :command-archive-collection :artifact \"raccolta.lisp\"
                           :original \"raccolta-processo.lisp\" :process-artifact \"raccolta-conservazione.lisp\")
                          (:kind :closed-archive-audit :artifact \"archivio-verifica.lisp\")
                          (:kind :retention-audit :artifact \"conservazione-verifica.lisp\"))))
    (write (list :status :ok :copies (length entries)))))
"
 :LIMITS (:NO-LITERAL-BYTE-COMPARISON :NO-FUNCTIONAL-QUALIFICATION))
