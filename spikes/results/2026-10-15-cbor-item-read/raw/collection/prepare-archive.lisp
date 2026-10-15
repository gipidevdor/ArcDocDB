;;;; Fixed C4 publication selection; complete mutation mirrors stay in the verified local backup.
(require :asdf)
(let* ((base "spikes/out/cbor-item-read-20261015/") (args (uiop:command-line-arguments))
       (argv (list "sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
                   (concatenate 'string base "collection/build-manifest.lisp")
                   "--write" (concatenate 'string base "collection/manifest.lisp")))
       (processes '(("freeze-sources" "freeze")
                    ("initial-build-lint-trace-links" "initial-build")
                    ("bench-self-test" "bench-self") ("audit-self-test" "audit-self")
                    ("mutation-self-test" "mutation-self")
                    ("coverage-self-test" "coverage-self") ("collection-self-test" "collector-self")
                    ("bench" "bench") ("bench-data-audit" "bench-audit")
                    ("coverage-item" "coverage") ("integrated-check" "full-check")
                    ("mutation-campaign" "mutation") ("coverage-compression" "coverage-compression")))
       (trees '(("frozen" "frozen/" "all") ("drivers" "drivers/" "all")
                ("coverage" "coverage/" "all") ("coverage-self-test" "coverage-self-test/" "all")
                ("collection-self-test" "collection/self-test/" "all"))))
  (assert (and (= 2 (length args)) (equal "--integration-report" (first args))))
  (dolist (note '("initial-runtime-reading.md" "integrated-runtime-reading.md"
                  "coverage-reading.md" "benchmark-reading.md" "mutation-reading.md"
                  "final-integration-reading.md" "archive-selection-reading.md"))
    (assert (probe-file (concatenate 'string base "review/" note))))
  (labels ((add-file (label source)
             (assert (probe-file source))
             (setf argv (append argv (list "--file" label source))))
           (add-tree (label source mode)
             (assert (probe-file source))
             (setf argv (append argv (list "--tree" label source mode)))))
    (dolist (entry processes)
      (destructuring-bind (label marker) entry
        (let* ((marker-path (concatenate 'string base "collection/record-" marker ".txt"))
               (path (string-trim (list (code-char 10) (code-char 13))
                                  (uiop:read-file-string marker-path))))
          (assert (probe-file path))
          (setf argv (append argv (list "--process" label path)))
          (add-file (concatenate 'string "collection/record-" marker ".txt") marker-path))))
    (assert (probe-file (second args)))
    (setf argv (append argv (list "--process" "final-integration-build-lint-trace-links"
                                  (second args))))
    (dolist (entry trees)
      (destructuring-bind (label relative mode) entry
        (add-tree label (concatenate 'string base relative) mode)))
    (dolist (entry '(("integrated-spikes" "4001074204-check-12420-0/" "lisp-and-log")
                     ("snapshot-self-test" "4001073853-snapshot-self-test-90652-0/" "all")
                     ("reader-self-test" "4001073853-reader-self-test-90682-0/" "all")))
      (destructuring-bind (label relative mode) entry
        (add-tree label (concatenate 'string "spikes/out/" relative) mode)))
    (dolist (relative '("review/" "precompile/"))
      (dolist (path (sort (uiop:directory-files (concatenate 'string base relative))
                         #'string< :key #'namestring))
        (assert (not (string-equal "fasl" (or (pathname-type path) ""))))
        (add-file (concatenate 'string relative (file-namestring path)) (namestring path))))
    (dolist (relative '("freeze-sources.lisp" "freeze-sources-before-character-fix.lisp"
                        "results-draft.md.txt" "collection/collect.lisp" "collection/append.lisp"
                        "collection/collect-before-date-fix.lisp"
                        "collection/preflight-before-date-fix.lisp"
                        "collection/preflight-archive.lisp" "collection/read-collection.lisp"
                        "collection/build-manifest.lisp" "collection/prepare-archive.lisp"
                        "collection/preserve-originals.lisp"))
      (add-file relative (concatenate 'string base relative)))
    ;; Only the five finalized self-test sidecars, never future collection outputs.
    (dolist (relative '("closed-check-4001073788-87417-0.log"
                        "collection-observation-4001073784-87417-0.lisp"
                        "collection-observation-4001073794-87417-0.lisp"
                        "collection-observation-4001073799-87417-0.lisp"
                        "collection-observation-4001073799-87417-1.lisp"))
      (add-file (concatenate 'string "collection/" relative)
                (concatenate 'string base "collection/" relative)))
    (add-file "mutations/report.lisp" (concatenate 'string base "mutations/report.lisp"))
    (dolist (copy '("baseline" "0" "1" "2" "3" "4" "5" "6" "7"))
      (dolist (relative '("test.log" "arcdocdb.asd" "tools/build.lisp"
                          "tools/cbor-item-read-isolated-build.lisp"
                          "src/codec/cbor-item-read.lisp"
                          "tests/codec/cbor-item-read-support.lisp"
                          "tests/codec/cbor-item-read.lisp" "tests/codec/cbor-item-read-threads.lisp"))
        (let ((label (concatenate 'string "mutations/" copy "/" relative)))
          (add-file label (concatenate 'string base label)))))
    (uiop:run-program argv :output t :error-output t)))

