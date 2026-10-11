(:schema-version 1 :kind :development-scope :status :defined
 :base "65972a4e6e84bd4c31d1d654c9a9a29bf6c44eb0"
 :scope :get-performance
 :parallel-agents (:fixture-and-oracles :benchmark :mutation-runner :independent-review)
 :scope-adjustment (:reason :separate-functional-get-suite-already-in-progress
                    :observed-worktree "get-verification" :observed-commit "13878b0"
                    :own-tests "tests/get-performance/"
                    :own-evidence "spikes/results/2026-10-11-get-performance/")
 :limits (:no-runtime-results-in-this-record :no-duplicate-functional-suite-claimed))
