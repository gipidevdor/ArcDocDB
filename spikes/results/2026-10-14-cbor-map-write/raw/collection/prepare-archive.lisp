;;;; Fixed selection for the map campaign; archive duplicate sources via their Git baseline.
(require :asdf)
(let* ((base "spikes/out/cbor-map-write-20261014/")
       (argv (list "sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
                   (concatenate 'string base "collection/build-manifest.lisp")
                   "--write" (concatenate 'string base "collection/manifest.lisp")))
       (processes '(("freeze-sources" "4000985634-command-58574-0")
                    ("initial-build-lint-trace-links" "4000985658-command-59509-0")
                    ("bench-self-test" "4000985856-command-64059-0")
                    ("audit-self-test" "4000985856-command-64056-0")
                    ("coverage-self-test" "4000985856-command-64058-0")
                    ("collection-self-test" "4000985856-command-64061-0")
                    ("bench" "4000985967-command-68300-0")
                    ("bench-data-audit" "4000986074-command-71953-0")
                    ("coverage-map" "4000986074-command-71952-0")
                    ("mutation-self-test" "4000986246-command-76796-0")
                    ("mutation-campaign" "4000986535-command-85304-0")
                    ("integrated-check" "4000986074-command-71976-0")
                    ("coverage-compression" "4000986883-command-89136-0")
                    ("final-integration-build-lint-trace-links" "4000987886-command-16580-0")))
       (trees '(("frozen" "frozen/" "all")
                ("drivers" "drivers/" "all")
                ("coverage" "coverage/" "all")
                ("coverage-self-test" "coverage-self-test/" "all")
                ("collection-self-test" "collection/self-test/" "all"))))
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
    (dolist (entry trees)
      (destructuring-bind (label relative mode) entry
        (add-tree label (concatenate 'string base relative) mode)))
    (dolist (entry '(("integrated-spikes" "4000986301-check-78781-0/" "lisp-and-log")
                     ("snapshot-self-test" "4000986108-snapshot-self-test-72655-0/" "all")
                     ("reader-self-test" "4000986108-reader-self-test-72670-0/" "all")))
      (destructuring-bind (label relative mode) entry
        (add-tree label (concatenate 'string "spikes/out/" relative) mode)))
    ;; Frozen readers, outputs, preparatory failures and notes; Markdown copies become .txt.
    (dolist (relative '("review/" "precompile/"))
      (dolist (path (sort (uiop:directory-files (concatenate 'string base relative))
                         #'string< :key #'namestring))
        (assert (not (string-equal "fasl" (or (pathname-type path) ""))))
        (add-file (concatenate 'string relative (file-namestring path)) (namestring path))))
    (dolist (relative '("freeze-sources.lisp" "results-draft.md.txt"
                        "collection/closed-check-4000985865-64200-0.log"
                        "collection/collection-observation-4000985860-64200-0.lisp"
                        "collection/collection-observation-4000985869-64200-0.lisp"
                        "collection/collection-observation-4000985873-64200-0.lisp"
                        "collection/collection-observation-4000985873-64200-1.lisp"
                        "collection/collect.lisp" "collection/append.lisp"
                        "collection/preflight-archive.lisp" "collection/read-collection.lisp"
                        "collection/build-manifest.lisp" "collection/prepare-archive.lisp"))
      (add-file relative (concatenate 'string base relative)))
    ;; All originals remain local. These are enough to inspect the exact changed code and logs.
    (add-file "mutations/report.lisp" (concatenate 'string base "mutations/report.lisp"))
    (dolist (copy '("baseline" "0" "1" "2" "3" "4" "5" "6" "7"))
      (dolist (relative '("test.log" "arcdocdb.asd" "tools/build.lisp"
                          "tools/cbor-map-write-isolated-build.lisp"
                          "src/codec/cbor-map-input.lisp" "src/codec/cbor-map-write.lisp"
                          "tests/codec/cbor-map-write-support.lisp"
                          "tests/codec/cbor-map-write.lisp" "tests/codec/cbor-map-write-threads.lisp"))
        (let ((label (concatenate 'string "mutations/" copy "/" relative)))
          (add-file label (concatenate 'string base label)))))
    (assert (probe-file (concatenate 'string base "review/integrated-runtime-reading.md")))
    (assert (probe-file (concatenate 'string base "review/final-integration-reading.md")))
    (assert (probe-file (concatenate 'string base "review/mutation-reading.md")))
    (assert (probe-file (concatenate 'string base "review/coverage-reading.md")))
    (uiop:run-program argv :output t :error-output t)))
