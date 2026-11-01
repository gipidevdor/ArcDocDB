;;;; C4: reuse static/error fixtures after combining the independently qualified components.
(require :asdf)
(uiop:run-program '("make" "legal-check" "lint" "lint-selftest" "trace" "links" "SBCL=/opt/homebrew/bin/sbcl")
                  :output t :error-output t)
(format t "~S~%" '(:kind :unix-integrated-audits :status :passed))
