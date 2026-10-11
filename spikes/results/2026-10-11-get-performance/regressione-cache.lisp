(:schema-version 1 :kind :get-cache-regression :status :reproduced
 :source-freeze "a1b00e92214317381b0f717f614f9f48266c0700"
 :command ("make" "test") :exit-code 2 :wrapper-exit-code 1 :source-consistency :stable
 :record "spikes/out/4000711787-command-67875-0/report.lisp"
 :test "TEST-REQ-CCH-004-PERFORMANCE-CACHE-REPAIR-HIT"
 :failed-assertion (:cache :hit :not-attempted nil nil)
 :meaning :repaired-cache-copy-not-returned-as-hit
 :limits (:before-fix :expected-regression-failure :no-throughput-measurement))
