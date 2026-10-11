(:schema-version 1 :kind :setup-observation :origin :tool-response-transcription
 :command ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script" "tools/check-trace.lisp" "--write")
 :exit-code 1 :phase :requirement-added-before-test-files
 :stdout "ERRORE  REQ-CBR-001 è implementato ma non è citato nei test (tests/)
scritto docs/tracciabilita/matrice.md
115 requisiti, 65 invarianti, 13 scenari FI, 52 ADR: 1 errori
"
 :limits (:not-a-command-verification-record :setup-only :no-product-execution))
