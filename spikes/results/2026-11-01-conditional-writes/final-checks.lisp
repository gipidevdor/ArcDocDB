;;;; C4 final result links and whitespace; product qualification is already frozen and complete.
(require :asdf)
(uiop:run-program '("/opt/homebrew/bin/sbcl" "--script" "tools/check-links.lisp" ".") :output t :error-output t)
(uiop:run-program '("git" "diff" "--check") :output t :error-output t)
(format t "~S~%" '(:kind :conditional-final-artifact-check :status :passed))
