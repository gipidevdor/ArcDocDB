;;;; Fixed publication selection; complete mirrors remain in the verified local backup.
(require :asdf)
(let* ((base "spikes/out/cbor-tag-write-20261014/")
       (args (uiop:command-line-arguments))
       (argv (list "sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
                   (concatenate 'string base "collection/build-manifest.lisp")
                   "--write" (concatenate 'string base "collection/manifest.lisp")))
       (processes '(("freeze-sources" "4000996626-command-59906-0")
                    ("initial-build-lint-trace-links" "4000996656-command-60753-0")
                    ("bench-self-test" "4000996819-command-64474-0")
                    ("audit-self-test" "4000996819-command-64475-0")
                    ("coverage-self-test" "4000996819-command-64481-0")
                    ("collection-self-test" "4000996819-command-64491-0")
                    ("bench" "4000996908-command-74250-0")
                    ("bench-data-audit" "4000996957-command-77330-0")
                    ("coverage-tag" "4000996908-command-74254-0")
                    ("mutation-self-test-invalid-options" "4000996908-command-74262-0")
                    ("mutation-self-test" "4000996994-command-78660-0")
                    ("integrated-check" "4000996821-command-64571-0")
                    ("mutation-campaign" "4000997059-command-81284-0")
                    ("coverage-compression" "4000997503-command-96971-0")))
       (trees '(("frozen" "frozen/" "all")
                ("drivers" "drivers/" "all")
                ("coverage" "coverage/" "all")
                ("coverage-self-test" "coverage-self-test/" "all")
                ("collection-self-test" "collection/self-test/" "all"))))
  (assert (and (= 2 (length args)) (equal "--integration-report" (first args))))
  ;; A live review tree must never be collected before these explicit completion notes.
  (dolist (note '("initial-runtime-reading.md" "integrated-runtime-reading.md"
                  "coverage-reading.md" "mutation-reading.md" "final-integration-reading.md"
                  "archive-selection-reading.md"))
    (assert (probe-file (concatenate 'string base "review/" note))))
  (labels ((add-file (label source)
             (assert (probe-file source))
             (setf argv (append argv (list "--file" label source))))
           (add-tree (label source mode)
             (assert (probe-file source))
             (setf argv (append argv (list "--tree" label source mode)))))
    (dolist (entry processes)
      (destructuring-bind (label stem) entry
        (let ((path (concatenate 'string "spikes/out/" stem "/report.lisp")))
          (assert (probe-file path))
          (setf argv (append argv (list "--process" label path))))))
    (assert (probe-file (second args)))
    (setf argv (append argv (list "--process" "final-integration-build-lint-trace-links"
                                  (second args))))
    (dolist (entry trees)
      (destructuring-bind (label relative mode) entry
        (add-tree label (concatenate 'string base relative) mode)))
    (dolist (entry '(("integrated-spikes" "4000997101-check-82864-0/" "lisp-and-log")
                     ("snapshot-self-test" "4000996874-snapshot-self-test-69641-0/" "all")
                     ("reader-self-test" "4000996874-reader-self-test-69697-0/" "all")))
      (destructuring-bind (label relative mode) entry
        (add-tree label (concatenate 'string "spikes/out/" relative) mode)))
    (dolist (relative '("review/" "precompile/"))
      (dolist (path (sort (uiop:directory-files (concatenate 'string base relative))
                         #'string< :key #'namestring))
        (assert (not (string-equal "fasl" (or (pathname-type path) ""))))
        (add-file (concatenate 'string relative (file-namestring path)) (namestring path))))
    (dolist (relative '("freeze-sources.lisp" "clone-support.lisp" "clone-support-corrected.lisp"
                        "results-draft.md.txt"
                        "collection/closed-check-4000996827-64670-0.log"
                        "collection/collection-observation-4000996823-64670-0.lisp"
                        "collection/collection-observation-4000996831-64670-0.lisp"
                        "collection/collection-observation-4000996834-64670-0.lisp"
                        "collection/collection-observation-4000996834-64670-1.lisp"
                        "collection/collect.lisp" "collection/append.lisp"
                        "collection/preflight-archive.lisp" "collection/read-collection.lisp"
                        "collection/build-manifest.lisp" "collection/prepare-archive.lisp"
                        "collection/preserve-originals.lisp"))
      (add-file relative (concatenate 'string base relative)))
    (add-file "mutations/report.lisp" (concatenate 'string base "mutations/report.lisp"))
    (dolist (copy '("baseline" "0" "1" "2" "3" "4" "5" "6" "7"))
      (dolist (relative '("test.log" "arcdocdb.asd" "tools/build.lisp"
                          "tools/cbor-tag-write-isolated-build.lisp"
                          "src/codec/cbor-tag-input.lisp" "src/codec/cbor-tag-write.lisp"
                          "tests/codec/cbor-tag-write-support.lisp"
                          "tests/codec/cbor-tag-write.lisp" "tests/codec/cbor-tag-write-threads.lisp"))
        (let ((label (concatenate 'string "mutations/" copy "/" relative)))
          (add-file label (concatenate 'string base label)))))
    (uiop:run-program argv :output t :error-output t)))
