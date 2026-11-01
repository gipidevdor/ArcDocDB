;;;; C4: final artifact links, whitespace and qualified source identity; reusable after owned cleanup.
(require :asdf)
(uiop:run-program '("/opt/homebrew/bin/sbcl" "--script" "tools/check-links.lisp" ".") :output t :error-output t)
(uiop:run-program '("git" "diff" "--check") :output t :error-output t)
(uiop:run-program '("/opt/homebrew/bin/sbcl" "--script" "spikes/results/2026-11-01-unix-service-latency/verify.lisp" "--current")
                  :output t :error-output t)
(format t "~S~%" '(:kind :unix-buffer-final-artifact-check :status :passed))
