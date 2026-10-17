(:SCHEMA-VERSION 1 :KIND :RETENTION-AUDIT :STATUS :OK :METHOD
 :LENGTH-AND-SHA256 :COPIES
 ((:SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/final-links/report.lisp")
   :COPY "final-links-processo.lisp" :FINGERPRINT
   (:BYTES 257507 :SHA256
    "c8be0970b947c8093556309b3494447d6c8ce87998cab0686c58bb80d772c399"))
  (:SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/final-links/conservazione.lisp")
   :COPY "final-links-conservazione.lisp" :FINGERPRINT
   (:BYTES 1174 :SHA256
    "d9ac2fee813df925954ab90b193d589154e402ed0a94e8bc65f2e33b2b930c1a"))
  (:SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/final-catalog/report.lisp")
   :COPY "final-catalog-processo.lisp" :FINGERPRINT
   (:BYTES 257854 :SHA256
    "462616a830c099084f59d5c8c112be6a89e4a399236091ebfa45f1fb43c0d60a"))
  (:SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/final-catalog/conservazione.lisp")
   :COPY "final-catalog-conservazione.lisp" :FINGERPRINT
   (:BYTES 1177 :SHA256
    "79f5398bb8f3a80430b1331c7d8ab82117f6a78763d033aaaf6ce78b5c0a8e05")))
 :HELPER-SOURCE "(require :asdf)
(let* ((root (truename \"./\"))
       (base (merge-pathnames \"spikes/results/2026-10-17-serie-semantic/\" root))
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
