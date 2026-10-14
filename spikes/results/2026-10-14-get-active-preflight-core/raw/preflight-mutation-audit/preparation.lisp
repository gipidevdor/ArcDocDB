(:kind :auditor-preparation :status :source-ready
 :source "spikes/out/preflight-mutation-audit/audit.lisp"
 :source-sha256 "5d8dfe78d2cff8f6aaff38d1d284e5e79597f86433eaff81afbe72993968178b"
 :syntax (:status :ok :read-eval nil :forms 46 :stdout "syntax-R4.stdout.log" :stderr "syntax-R4.stderr.log")
 :attempts ((:name :first-interactive-reader :same-source-as "audit-before-syntax-repair-R1.lisp.txt"
             :outcome :reader-parenthesis-error :output-location :conversation-tool-output)
            (:name :syntax-r1 :source "audit-before-syntax-repair-R1.lisp.txt" :status :failed)
            (:name :syntax-r2 :source "audit-at-syntax-R2.lisp.txt" :status :failed
             :cause :reader-invocation-did-not-require-sb-posix)
            (:name :syntax-r3 :source "audit-before-syntax-repair-R3.lisp.txt" :status :failed)
            (:name :syntax-r4 :status :ok))
 :unused-draft (:name "bytes.py" :executed nil :removed t)
 :qualification-code :common-lisp
 :hashing :same-python-c-string-as-frozen-driver
 :product-executions-by-reviewer 0)
