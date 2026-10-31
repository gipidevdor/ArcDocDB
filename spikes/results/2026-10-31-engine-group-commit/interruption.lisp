(:kind :intentional-qualification-interruption
 :reason :merge-concurrently-published-offline-verifier-before-final-qualification
 :superseded-base "9518cbb" :combined-source "4f2f500"
 :check-record "interrupted-pre-merge-check/report.lisp"
 :strict-record "interrupted-pre-merge-2.6.10/report.lisp"
 :signals ((:pid 23117 :signal :SIGTERM) (:pid 23119 :signal :SIGTERM) (:pid 23113 :signal :SIGTERM))
 :qualification :incomplete-not-counted
 :note "SBCL 2.6.10 exited zero on SIGTERM, so the generic recorder reports :OK. The build completion marker is absent. Neither interrupted campaign qualifies the implementation; both original records are retained unchanged, with this explicit exclusion.")
