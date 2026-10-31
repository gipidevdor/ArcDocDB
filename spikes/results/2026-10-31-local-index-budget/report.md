# Local automatic-index quota integration — 2026-10-31

Connects the existing automatic M1 engine policy to `serve-local` and the real
server CLI. No durable format, wire opcode or requirement change.

Validation covers bounded decimal parsing, duplicate/missing/invalid arguments,
default automatic mode, legacy discovery exclusivity, and invalid library policy
before clock/resource callbacks. Product-process checks cover v1/v2, 1200 distinct
255-byte keys under a 3400000-byte quota, actual derived disk index creation,
strong CSNs, all acknowledged values before and after SIGKILL/replay, continued
PUT/DELETE, graceful derived-file retirement and reopening under default quota.

[Targeted checks on SBCL 2.6.9](targeted-2.6.9/report.lisp) pass: seven cases,
including the existing discovery regression cases and both real-process formats.
Initial attempts retain the syntax correction and fixture calibration failures:
insufficient initial quota, pathname instead of client string input, and v1's
255-byte key bound. No product format or budget check was relaxed.

[Strict all-suite SBCL 2.6.10 build](strict-2.6.10/report.lisp) passes with
stable sources. The [SBCL 2.6.9 full attempt](full-attempt-runtime-path/report.lisp)
also passes product compilation/tests, then stops in the snapshot tool self-test:
its literal `sbcl` child resolves to 2.6.10 while inheriting 2.6.9's `SBCL_HOME`.
The [child diagnostic](runtime-path-diagnostic/signal/stderr.log) identifies the
runtime/core build-ID mismatch. This is environment selection, not a product
or snapshot assertion failure. The gate is rerun with `/opt/homebrew/bin` first in PATH. The outer invocation
requests `make check -o test`, but the recorded child does not inherit that skip
and runs the complete `check-core`, including product tests again. No source
change follows the earlier builds. This is local macOS ARM64 qualification; no new throughput,
power-loss, Linux or whole-engine gate claim.

Cleanup removed 519756143 bytes of regenerable ArcDocDB compilation caches
and self-test fixtures, 35540379 bytes of exact duplicates from primary output,
and 13704020 bytes of exact temporary-file duplicates. Unique retained evidence,
other projects and Git history were preserved. The active worktree remains
needed for this integration. Cache payload will be removed again after validation.

## Final result

The [complete 2.6.9 gate](full-2.6.9/report.lisp) passes with exit code zero
and stable source identities: strict product compilation/tests, lint, links,
traceability, mutation-runner self-tests, evidence checks and self-tests,
SPK-01–11 correctness and CI self-tests. The independent strict 2.6.10
all-suite build also passes. No warning suppression, product-source change,
format relaxation or retry was used to resolve the runtime-path issue.

Final cleanup removed 70973441 bytes of regenerated/retired project compilation
cache and 43556308 bytes of temporary test output after retaining the unique
verification records above. These are gross cleanup counts: test execution
regenerated some files, so the counts must not be summed as net disk recovery.
