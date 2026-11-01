;;;; C4 lossless final self-record and post-compaction streams; own result root only.
(require :asdf)
(let ((args (uiop:command-line-arguments)))
  (unless (and (= 4 (length args)) (equal (first args) "--root") (equal (nthcdr 2 args) '("--jobs" "1"))
               (equal (truename (second args)) (uiop:pathname-directory-pathname *load-truename*)))
    (error "Final compaction must name its own result root")))
(load "tools/compact-evidence.lisp")
(let* ((root (uiop:pathname-directory-pathname *load-truename*))
       (rows (mapcar (lambda (name) (compact-one (merge-pathnames name root)))
                     '("closure-command/report.lisp" "post-compaction-analysis.stdout"
                       "post-compaction-get-analysis.stdout" "post-compaction-get-repeat-analysis.stdout"))))
  (with-open-file (out (merge-pathnames "tail-compaction.lisp" root) :direction :output :if-exists :error)
    (write (list :kind :conditional-group-tail-compaction :status :passed :results rows) :stream out :pretty t) (terpri out))
  (format t "~S~%" '(:kind :conditional-group-tail-compaction :status :passed :files 4)))
