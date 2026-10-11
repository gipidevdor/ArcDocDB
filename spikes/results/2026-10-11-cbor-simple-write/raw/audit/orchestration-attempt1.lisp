(:schema-version 1 :kind :orchestration-failure-observation :exit-code 1
 :phase "falsification" :helper-version "campaign-original.lisp"
 :reason :ambiguous-directory-difference
 :diagnostic "Record ambiguo per mutation-self-test: due registrazioni indipendenti create in parallelo; il comando figlio mutation-self-test è riuscito."
 :observed-terminal-output-truncated t
 :child-records ("/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000713828-command-19939-0/report.lisp"
                 "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000713828-command-19963-0/report.lisp")
 :fix :select-own-wrapper-stdout-record-marker-and-validate-command
 :limits (:observation-not-raw-complete-terminal-transcript :no-product-or-corpus-change))
