;;;; C4: compare the complete current product/tool/doc inventory with the eight final qualified campaigns.
(require :asdf)
(load "tools/evidence-storage.lisp")
(let* ((*read-eval* nil)
       (identity (arcdocdb.evidence:call-with-evidence-bytes
                    (merge-pathnames "source-identity.lisp" *load-truename*)
                   (lambda (path) (with-open-file (stream path) (read stream)))))
       (paths (sort (remove-if (lambda (p) (or (zerop (length p)) (uiop:string-prefix-p "spikes/results/" p)))
                      (uiop:split-string (uiop:run-program '("git" "ls-files" "-z" "--cached" "--others" "--exclude-standard")
                                                           :output :string) :separator '(#\Null))) #'string<))
       (hashes (uiop:split-string
                 (string-trim '(#\Newline #\Return) (uiop:run-program (append '("git" "hash-object" "--") paths) :output :string))
                 :separator '(#\Newline)))
       (actual (loop for path in paths for hash in hashes collect (list :path path :git-blob hash))))
  (unless (and (= (length paths) (length hashes) 1640) (equal actual (getf identity :sources)))
    (error "Current source inventory differs from the frozen qualified implementation"))
  (format t "~S~%" (list :kind :group-append-current-source :status :passed :qualified-source-files (length actual)
      :head (string-trim '(#\Newline #\Return) (uiop:run-program '("git" "rev-parse" "HEAD") :output :string)))))
