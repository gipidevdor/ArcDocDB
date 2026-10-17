;;; Preparazione registrata dei soli originali chiusi di questa integrazione.
(require :asdf)
(require :sb-posix)
(defpackage :arcdocdb.ci (:use :cl))
(in-package :arcdocdb.ci)
(defparameter *ci-root* (truename "./"))
(load "tools/evidence-storage.lisp")
(dolist (module '("data" "support" "archive"))
  (load (format nil "tools/ci/~A.lisp" module)))
(let ((stage (ci-mkdir "spikes/out/ci/archive-stage/")) (entries nil) (processes nil))
  (labels ((copy (source relative)
             (dolist (entry (ci-packet-file source stage relative))
               (push (list :source (namestring (merge-pathnames (getf entry :path) stage))
                           :path (getf entry :path)) entries)))
           (tree (source prefix)
             (dolist (file (ci-files source :limit 100000 :max-depth 32))
               (let ((relative (enough-namestring file (ci-directory source))))
                 (unless (ci-cache-path-p relative)
                   (copy file (concatenate 'string prefix relative)))))))
    (loop for dir in '("4001217858-command-88017-0" "4001217879-command-88520-0"
                      "4001217896-command-89022-0" "4001217925-command-89922-0"
                      "4001217960-command-91046-0" "4001217980-command-91827-0"
                      "4001217989-command-92203-0" "4001218024-command-93624-0"
                      "4001218024-command-93625-0" "4001218070-command-95787-0"
                      "4001218070-command-95788-0" "4001218119-command-98254-0"
                      "4001218308-command-3703-0" "4001218557-command-8917-0"
                      "4001218995-command-15668-0" "4001218995-command-15669-0"
                      "4001219108-command-17187-0" "4001219206-command-19398-0"
                      "4001219267-command-21132-0")
          for n from 1 for label = (format nil "command-~2,'0D" n)
          for source = (ci-directory (format nil "spikes/out/~A/" dir))
          do (tree source (format nil "processes/~A/" label))
             (push (list :label label :record-path (format nil "processes/~A/report.lisp" label)) processes))
    (dolist (n '(5 6 7 8))
      (loop for name in '("report" "data" "tests" "measure" "workflow" "boundaries")
            do (copy (merge-pathnames (format nil "spikes/out/ci/integration-selftest-~2,'0D/~A.lisp" n name) *ci-root*)
                     (format nil "self-tests/~2,'0D/~A.lisp" n name))))
    (tree (ci-directory "spikes/out/ci/plan-integration-03/packet/") "plan/")
    (tree (ci-directory "spikes/out/ci/verify-integration-01/packet/") "verify/")
    (tree (ci-directory "spikes/out/ci/bench-integration-01/packet/") "bench/")
    (copy (merge-pathnames "spikes/out/ci/worker-integration-01.lisp" *ci-root*) "measure/replica-01.lisp")
    (dolist (name '("report.lisp" "race-report.lisp" "fixture.bundle"))
      (copy (merge-pathnames (concatenate 'string "spikes/out/ci/publisher-fixture/" name) *ci-root*)
            (concatenate 'string "publisher/" name)))
    (dolist (file (ci-files (ci-directory "spikes/out/ci/publisher-fixture/repo/spikes/out/ci/")
                          :limit 10000 :max-depth 24))
      (when (member (file-namestring file) '("publication.lisp" "push-failure.lisp") :test #'equal)
        (copy file (concatenate 'string "publisher/rounds/"
                    (enough-namestring file (ci-directory "spikes/out/ci/publisher-fixture/repo/spikes/out/ci/"))))))
    (dolist (name '("publisher-fixture.lisp" "publisher-race-fixture.lisp" "prepare-integration-archive.lisp"))
      (copy (merge-pathnames (concatenate 'string "spikes/out/ci/" name) *ci-root*)
            (concatenate 'string "methods/" name)))
    (copy (merge-pathnames "spikes/out/ci/report.md" *ci-root*) "report.md")
    (copy (merge-pathnames "spikes/out/ci/static-review.lisp" *ci-root*) "review.lisp")
    (ci-save (merge-pathnames "spikes/out/ci/archive-manifest.lisp" *ci-root*)
             (list :schema-version 1 :kind :command-archive-manifest :date "2026-10-17"
                   :files (nreverse entries) :processes (nreverse processes)))
    (format t "~&(:kind :ci-archive-preparation :status :passed :files ~D :processes ~D)~%"
            (length entries) (length processes))))
