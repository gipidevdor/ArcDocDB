(require :asdf)
(let* ((root (merge-pathnames (format nil "spikes/out/auto-completion/heap-fixture-~D/" (get-universal-time)) (truename "./")))
       (complete nil))
  (ensure-directories-exist (merge-pathnames ".parent" root))
  (unwind-protect
       (progn
         (dotimes (batch 11)
           (let ((mode (if (= batch 10) "verify" "write")))
             (uiop:run-program (list (namestring sb-ext:*runtime-pathname*) "--dynamic-space-size" "96" "--noinform"
               "--no-userinit" "--no-sysinit" "--script" "spikes/out/auto-completion/heap-worker.lisp"
               mode (namestring root) (write-to-string batch)) :output t :error-output t)))
         (setf complete t) (format t "~&BEYOND-HEAP-PASS 4096 keys / 128 MiB key bytes / 96 MiB child heap~%"))
    (if complete (uiop:delete-directory-tree root :validate t) (format *error-output* "RETAINED ~A~%" root))))
