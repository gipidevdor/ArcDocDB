(:SCHEMA-VERSION 1 :KIND :RETENTION-AUDIT :STATUS :OK :METHOD
 :LENGTH-AND-SHA256 :COPIES
 ((:SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/archive-bootstrap/collection/report.lisp")
   :COPY "raccolta-processo.lisp" :FINGERPRINT
   (:BYTES 268869 :SHA256
    "d02f9b713c4b69231624d243c07823c3ec578a7cfdbbd138e0e62238f9662b08"))
  (:SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/archive-bootstrap/collection/conservazione.lisp")
   :COPY "raccolta-conservazione.lisp" :FINGERPRINT
   (:BYTES 1178 :SHA256
    "c811472d18e9a230b820a75ae1ce58d970d763a8c8f1e9863250c7422af53e6a"))
  (:SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/results/2026-10-17-archive-bootstrap/collection/report.lisp")
   :COPY "raccolta.lisp" :FINGERPRINT
   (:BYTES 11868 :SHA256
    "816e6bfea0ad6c0be18331f2ed8c5ea3b43801da8bcf51601c818470f348b9d3"))
  (:SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/results/2026-10-17-archive-bootstrap/collection/closed-check.log")
   :COPY "archivio-verifica.lisp" :FINGERPRINT
   (:BYTES 2335 :SHA256
    "b05437356918d7d090123fac4f7f516aa2f99ace840737f96424d19eeb24028b")))
 :HELPER-SOURCE "(require :asdf)
(let* ((root (truename \"./\"))
       (base (merge-pathnames \"spikes/results/2026-10-17-archive-bootstrap/\" root))
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
