(:SCHEMA-VERSION 1 :KIND :RETENTION-AUDIT :STATUS :OK :METHOD
 :LENGTH-AND-SHA256 :COPIES
 ((:SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/spikes/out/4001217268-command-76912-0/report.lisp")
   :COPY "raccolta-processo.lisp" :FINGERPRINT
   (:BYTES 256084 :SHA256
    "ae33b57e45af93f96b29c36809ecc9ff273ffc44a9767c960c4794b3dc4c99da"))
  (:SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/spikes/out/4001217268-command-76912-0/conservazione.lisp")
   :COPY "raccolta-conservazione.lisp" :FINGERPRINT
   (:BYTES 1181 :SHA256
    "b238326c7b3ee646bfd463b708a7c62a25b7fa2a1899f298abde7c57d2df9a08"))
  (:SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/spikes/results/2026-10-17-runtime-closed/collection/report.lisp")
   :COPY "raccolta.lisp" :FINGERPRINT
   (:BYTES 13336 :SHA256
    "993fcf3ca8450c4123fd6c5c8180f11bc1e754d7df3bd874463bf9d8c2b14301"))
  (:SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/spikes/results/2026-10-17-runtime-closed/collection/closed-check.log")
   :COPY "archivio-verifica.lisp" :FINGERPRINT
   (:BYTES 2586 :SHA256
    "a65abe273724c17281616a4b184aa4e42af30795f3648c4486389c7027a921d8")))
 :HELPER-SOURCE "(require :asdf)
(let* ((root (truename \"./\"))
       (base (merge-pathnames \"spikes/results/2026-10-17-runtime-closed/\" root))
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
              '(:schema-version 1 :kind :evidence-catalog :date \"2026-10-17\"
                :entries ((:kind :command-archive-collection :artifact \"raccolta.lisp\"
                           :original \"raccolta-processo.lisp\" :process-artifact \"raccolta-conservazione.lisp\")
                          (:kind :closed-archive-audit :artifact \"archivio-verifica.lisp\")
                          (:kind :retention-audit :artifact \"conservazione-verifica.lisp\"))))
    (write (list :status :ok :copies (length entries)))))
"
 :LIMITS (:NO-LITERAL-BYTE-COMPARISON :NO-FUNCTIONAL-QUALIFICATION))
