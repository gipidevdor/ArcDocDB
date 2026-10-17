(:SCHEMA-VERSION 1 :KIND :RETENTION-AUDIT :STATUS :OK :METHOD
 :LENGTH-AND-SHA256 :COPIES
 ((:SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-name-stabilization/collection/report.lisp")
   :COPY "raccolta-processo.lisp" :FINGERPRINT
   (:BYTES 275558 :SHA256
    "233074eaa56f4b1f9dd00e5119b325fb63b90706d20f75c8cb0775ed6e91f903"))
  (:SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-name-stabilization/collection/conservazione.lisp")
   :COPY "raccolta-conservazione.lisp" :FINGERPRINT
   (:BYTES 1198 :SHA256
    "626fe6bf808a1e6be6dbcb917031de47b6d3c8335b2da06aaf1f41f5da739986"))
  (:SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/results/2026-10-17-recovery-name-stabilization/collection/report.lisp")
   :COPY "raccolta.lisp" :FINGERPRINT
   (:BYTES 13071 :SHA256
    "bb1da31db28ce41a197119209723224e2e1019ded248f4061feea9d17a16b770"))
  (:SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/results/2026-10-17-recovery-name-stabilization/collection/closed-check.log")
   :COPY "archivio-verifica.lisp" :FINGERPRINT
   (:BYTES 2488 :SHA256
    "d95017ea7f04ad9e3f2eba70b902b4a8bf25d9045aaeb7dbfb3369377e10183a")))
 :HELPER-SOURCE "(require :asdf)
(let* ((root (truename \"./\"))
       (base (merge-pathnames \"spikes/results/2026-10-17-recovery-name-stabilization/\" root))
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
