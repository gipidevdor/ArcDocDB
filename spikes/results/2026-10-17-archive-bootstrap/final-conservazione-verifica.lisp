(:SCHEMA-VERSION 1 :KIND :RETENTION-AUDIT :STATUS :OK :METHOD
 :LENGTH-AND-SHA256 :COPIES
 ((:SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/archive-bootstrap/final-links/report.lisp")
   :COPY "final-links-processo.lisp" :FINGERPRINT
   (:BYTES 258564 :SHA256
    "0d2a0c2d4246ed5f51d8b5098cff5d84b748852816418fd6fe8407a45423dffa"))
  (:SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/archive-bootstrap/final-links/conservazione.lisp")
   :COPY "final-links-conservazione.lisp" :FINGERPRINT
   (:BYTES 1180 :SHA256
    "b164b38339ac76172368243fbe17088490c095819d6f5bf79e5078651b21086e"))
  (:SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/archive-bootstrap/final-catalog/report.lisp")
   :COPY "final-catalog-processo.lisp" :FINGERPRINT
   (:BYTES 258925 :SHA256
    "9bfc4f0a6ddf1d3d2a514a7cfee95433d8ca8cddf3816cba4efc8ef44c6f4115"))
  (:SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/archive-bootstrap/final-catalog/conservazione.lisp")
   :COPY "final-catalog-conservazione.lisp" :FINGERPRINT
   (:BYTES 1184 :SHA256
    "45351fdcde84372b853f85eb1e9827bfe0022cb0ea4826d0f618d4f7a663089b")))
 :HELPER-SOURCE "(require :asdf)
(let* ((root (truename \"./\"))
       (base (merge-pathnames \"spikes/results/2026-10-17-archive-bootstrap/\" root))
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
