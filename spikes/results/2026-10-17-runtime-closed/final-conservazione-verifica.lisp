(:SCHEMA-VERSION 1 :KIND :RETENTION-AUDIT :STATUS :OK :METHOD
 :LENGTH-AND-SHA256 :COPIES
 ((:SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/spikes/out/4001217331-command-78593-0/report.lisp")
   :COPY "final-links-processo.lisp" :FINGERPRINT
   (:BYTES 244596 :SHA256
    "9848bd252defd9475fe27d727be0041176c65e419a0f0769f36bae0785868672"))
  (:SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/spikes/out/4001217331-command-78593-0/conservazione.lisp")
   :COPY "final-links-conservazione.lisp" :FINGERPRINT
   (:BYTES 1181 :SHA256
    "606471bb829998221232b3ef1a9367089333738982b8f51732d1e25fe5f22292"))
  (:SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/spikes/out/4001217386-command-79226-0/report.lisp")
   :COPY "final-catalog-processo.lisp" :FINGERPRINT
   (:BYTES 244943 :SHA256
    "25747b88e57ebe83cc1df74783f6e94c74d3cef6f4ba3e6079fe141c2e00d0a5"))
  (:SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/spikes/out/4001217386-command-79226-0/conservazione.lisp")
   :COPY "final-catalog-conservazione.lisp" :FINGERPRINT
   (:BYTES 1181 :SHA256
    "d8ed3235214aa0def64ce445e4052431cd30aff8c66a13991daf2898e2ae32e3")))
 :HELPER-SOURCE "(require :asdf)
(let* ((root (truename \"./\"))
       (base (merge-pathnames \"spikes/results/2026-10-17-runtime-closed/\" root))
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
