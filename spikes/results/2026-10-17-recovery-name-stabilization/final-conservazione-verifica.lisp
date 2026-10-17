(:SCHEMA-VERSION 1 :KIND :RETENTION-AUDIT :STATUS :OK :METHOD
 :LENGTH-AND-SHA256 :COPIES
 ((:SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-name-stabilization/final-links/report.lisp")
   :COPY "final-links-processo.lisp" :FINGERPRINT
   (:BYTES 264719 :SHA256
    "9646b9c4b7cb1ae052757a33e0e211ddd40204db10d86d18710e433c8e373bd1"))
  (:SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-name-stabilization/final-links/conservazione.lisp")
   :COPY "final-links-conservazione.lisp" :FINGERPRINT
   (:BYTES 1200 :SHA256
    "d99f1ba5870639642a4ea989ab2fc35e9ec855c018f3c0b842018af5f3039f42"))
  (:SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-name-stabilization/final-catalog/report.lisp")
   :COPY "final-catalog-processo.lisp" :FINGERPRINT
   (:BYTES 265103 :SHA256
    "9aadfa7f55252ee0978b54a2b18618afad6b8183c946bfbcc4c87fe69af522bf"))
  (:SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-name-stabilization/final-catalog/conservazione.lisp")
   :COPY "final-catalog-conservazione.lisp" :FINGERPRINT
   (:BYTES 1204 :SHA256
    "60dee1d3773c4af810741115ec4b794610e43308812f9fd4cc45f78b149132e0")))
 :HELPER-SOURCE "(require :asdf)
(let* ((root (truename \"./\"))
       (base (merge-pathnames \"spikes/results/2026-10-17-recovery-name-stabilization/\" root))
       (copies nil) (new-entries nil))
  (labels ((data (path) (let ((*read-eval* nil)) (with-open-file (s path) (read s))))
           (fingerprint (path)
             (list :bytes (with-open-file (s path :element-type '(unsigned-byte 8)) (file-length s))
                   :sha256 (subseq (uiop:run-program (list \"shasum\" \"-a\" \"256\" (namestring path))
                                                    :output :string) 0 64)))
           (retain (source name)
             (when (eq (getf (data source) :kind) :compressed-evidence)
               (error \"Compressed input requires explicit payload retention: ~A\" source))
             (let* ((target (merge-pathnames name base)) (before (fingerprint source)))
               (when (probe-file target) (error \"Destination exists: ~A\" target))
               (uiop:copy-file source target)
               (unless (and (equal before (fingerprint source)) (equal before (fingerprint target)))
                 (error \"Retention mismatch: ~A\" source))
               (push (list :source (namestring source) :copy name :fingerprint before) copies)))
           (save (name datum exists)
             (with-open-file (s (merge-pathnames name base) :direction :output :if-exists exists)
               (write datum :stream s :readably t :pretty t) (terpri s))))
    (loop for label in '(\"final-links\" \"final-catalog\")
          for relative in (uiop:command-line-arguments)
          do (let* ((record (merge-pathnames relative root))
                    (name (concatenate 'string label \"-processo.lisp\"))
                    (sidecar (concatenate 'string label \"-conservazione.lisp\")))
               (retain record name)
               (retain (merge-pathnames \"conservazione.lisp\" record) sidecar)
               (push (list :kind :command-verification :artifact name :process-artifact sidecar) new-entries)))
    (unless (= (length copies) 4) (error \"Expected four preserved files.\"))
    (save \"final-conservazione-verifica.lisp\"
          (list :schema-version 1 :kind :retention-audit :status :ok :method :length-and-sha256
                :copies (reverse copies) :helper-source (uiop:read-file-string *load-truename*)
                :limits '(:no-literal-byte-comparison :no-functional-qualification)) :error)
    (let ((catalog (data (merge-pathnames \"catalogo.lisp\" base))))
      (setf (getf catalog :entries)
            (append (getf catalog :entries) (reverse new-entries)
                    '((:kind :retention-audit :artifact \"final-conservazione-verifica.lisp\"))))
      (save \"catalogo.lisp\" catalog :supersede))
    (write (list :status :ok :copies (length copies)))))
"
 :LIMITS (:NO-LITERAL-BYTE-COMPARISON :NO-FUNCTIONAL-QUALIFICATION))
