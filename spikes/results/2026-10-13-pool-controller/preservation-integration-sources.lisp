(:SCHEMA-VERSION 1 :KIND :POOL-CONTROLLER-PRESERVATION-INTEGRATION-SOURCES :VERSION "6aca985"
 :SOURCES
 ((:PATH #A((41) BASE-CHAR . "spikes/out/pool-publication-selftest.lisp") :BYTES 2315 :SHA256
   "c2163075a65221fe66dbe7567b54164ffcd55c50f3172c8efab17855a6005b09" :GIT-BLOB
   "b92dc353287c8b9d817b07279252831ed8d3f6f3" :TEXT "(require :asdf)
(require :sb-posix)
(pushnew :pool-controller-publication-library *features*)
(load \"spikes/out/pool-controller/publish.lisp\")
(let* ((root (uiop:ensure-directory-pathname (sb-posix:mkdtemp \"/tmp/pool-publication-fixture-XXXXXX\")))
       (input (merge-pathnames \"input.lisp\" root))
       (target (merge-pathnames \"copy.lisp\" root))
       (checks 0))
 (labels ((check (ok text) (unless ok (error \"publication fixture: ~A\" text)) (incf checks))
          (rejected (thunk) (handler-case (progn (funcall thunk) nil) (error () t))))
  (unwind-protect
   (progn
    (worker-save-data '(:schema-version 1 :kind :pool-publication-fixture :value 23) input)
    (worker-copy-evidence input target)
    (check (worker-evidence-proofs-equal-p (worker-evidence-byte-proof input)
                                          (worker-evidence-byte-proof target)) \"positive copy\")
    (let ((before (worker-byte-record target)))
     (check (rejected (lambda () (worker-copy-evidence input target))) \"existing destination rejected\")
     (check (worker-byte-records-equal-p before (worker-byte-record target)) \"existing bytes untouched\"))
    (let ((*pool-development-roots* (list root))
          (*pool-development-required* (list input)))
     (with-open-file (out (merge-pathnames \"cache.fasl\" root) :direction :output :if-exists :error)
      (write-line \"fixture compiler intermediate\" out))
     (multiple-value-bind (included excluded) (pool-development-files)
      (check (= 2 (length included)) \"raw files inventoried\")
      (check (= 1 (length excluded)) \"compiler intermediate explicitly excluded\"))
     (with-open-file (out (merge-pathnames \"unexpected.bad\" root) :direction :output :if-exists :error)
      (write-line \"unrecognized input\" out))
     (check (rejected #'pool-development-files) \"unknown raw extension rejected\"))
    (let ((*pool-publication-directory* (merge-pathnames \"must-stay-absent/\" root)))
     (check (rejected (lambda () (pool-publication-run (list :base \"bad\" :snapshot (namestring root) :paths nil :records nil) input))) \"invalid plan rejected\")
     (check (null (probe-file *pool-publication-directory*)) \"no output from invalid plan\"))
    (format t \"Publication preservation fixtures PASS: ~D checks.~%\" checks))
   (uiop:delete-directory-tree root :validate t))))
")
  (:PATH #A((37) BASE-CHAR . "spikes/out/pool-integrated-build.lisp") :BYTES 270 :SHA256
   "b30b271fb39688f8707a3cedf7c7e7cb8af749faf1af77b34d2c3acb7476cdd6" :GIT-BLOB
   "01c1306082e3af15b22e91ba27a9c7686141fd3e" :TEXT "(require :asdf)
(asdf:initialize-output-translations
 `(:output-translations
   (,(merge-pathnames \"**/*.*\" (truename \"./\"))
    ,(merge-pathnames \"spikes/out/pool-integrated-cache/**/*.*\" (truename \"./\")))
   :ignore-inherited-configuration))
(load \"tools/build.lisp\")
")
  (:PATH #A((33) BASE-CHAR . "spikes/out/pool-seal-initial.lisp") :BYTES 1012 :SHA256
   "bd2906e2af69e6fc901c6e42c74f9f20736991a51ce145b3c7200b4dd78d26e2" :GIT-BLOB
   "e525baca9c7f120dd2a3d668302522a95e7cdd4e" :TEXT
   "(pushnew :pool-controller-publication-library *features*)
(load \"spikes/out/pool-controller/publish.lisp\")
(dolist (record '((:name \"publication\" :id \"4000906724-command-45635-0\")
                 (:name \"preservation-selftest\" :id \"4000907085-command-56510-0\")
                 (:name \"integrated-lint\" :id \"4000907488-command-66477-0\")
                 (:name \"integrated-trace\" :id \"4000907488-command-66478-0\")
                 (:name \"integrated-links\" :id \"4000907488-command-66479-0\")))
 (pool-publication-copy-record (pool-publication-record-plan record (truename \"./\") *pool-publication-directory*)))
(worker-save-source-bundle
 '(\"spikes/out/pool-publication-selftest.lisp\" \"spikes/out/pool-integrated-build.lisp\"
   \"spikes/out/pool-seal-initial.lisp\")
 (merge-pathnames \"preservation-integration-sources.lisp\" *pool-publication-directory*)
 :pool-controller-preservation-integration-sources :version \"6aca985\")
(format t \"Five original process records and preservation sources copied losslessly.~%\")
")))
