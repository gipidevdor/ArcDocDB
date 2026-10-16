(:schema-version 1 :kind :ci-design-verification :date "2026-10-16"
 :source "f1c4f4704233aeafcaf01c10430775ce85c8cc58"
 :status :ok :scope :documentation
 :checks (:record "processes/documentation/report.lisp" :command ("make" "links" "trace") :status :ok)
 :review (:reviewers 2 :findings-addressed 7 :followup :coordinator-static-reread)
 :constraints (:github-hosted-only :results-in-main :performance-exploratory)
 :workflow-activated nil :product-tests-run nil :benchmark-run nil
 :limits (:design-not-implementation :no-github-run-qualification :budgets-proposed))
