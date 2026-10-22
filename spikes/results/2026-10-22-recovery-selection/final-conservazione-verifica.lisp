(:SCHEMA-VERSION 1 :KIND :RETENTION-AUDIT :STATUS :OK :METHOD
 :LENGTH-AND-SHA256 :COPIES
 ((:SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-selection-20261022/final-links/report.lisp")
   :COPY "final-links-processo.lisp" :FINGERPRINT
   (:BYTES 266148 :SHA256
    "1d4288f593b08a35707d277e6d33f2eb9708ffc06552a68cfb437456d7bbbe11"))
  (:SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-selection-20261022/final-links/conservazione.lisp")
   :COPY "final-links-conservazione.lisp" :FINGERPRINT
   (:BYTES 1200 :SHA256
    "e66b405a58f2c32041e0247689da6da96c6139a31b8ee375303ded358be7e9de"))
  (:SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-selection-20261022/final-catalog/report.lisp")
   :COPY "final-catalog-processo.lisp" :FINGERPRINT
   (:BYTES 266514 :SHA256
    "f0447cbf5741fc4e23a7ea66f747dac79624fc30f5c1784e1f774f6aee068802"))
  (:SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-selection-20261022/final-catalog/conservazione.lisp")
   :COPY "final-catalog-conservazione.lisp" :FINGERPRINT
   (:BYTES 1204 :SHA256
    "3b47bacbd6bf29286a5703d77654e034baa4dac88efb4d6b8c2aff42bae19937")))
 :HELPER-SOURCE "(require :asdf)
(let* ((root (truename \"./\"))
       (base (merge-pathnames \"spikes/results/2026-10-22-recovery-selection/\" root))
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
