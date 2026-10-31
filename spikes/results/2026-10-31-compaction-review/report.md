# Compaction refinement and review — 2026-10-31

Reviews the production compaction path, framing/selection, canonical CONTROL
publication, RAM/paged location relocation, source/FD retirement, inode-bound
reclamation, recovery, admission, finite resource counters and performance.
The serial current-only scope and its concurrency/power-loss limitations remain.

## Findings and corrections

1. Compaction reserved segment count but could consume the last representable
   u32 ACTIVE ID. Its mandatory recovery would then require an unrepresentable
   fresh ID. Reject before output creation unless one unused u32 ID remains.
2. Two CONTROL publications fit at revision MAX-2, but normal completion leaves
   MAX and cannot checkpoint on restart. A crash after replacement instead needs
   both recovery checkpoint and pruning. Reserve three revisions before outputs.
3. A deterministic mixed overwrite/delete/RAM-paged/reopen model exposed ordinary
   rotation consuming the last segment slot. The following startup could publish
   a checkpoint exceeding its own configured live-segment budget, then refuse.
   Writes now trigger pressure compaction before consuming recovery headroom;
   startup rejects insufficient room before checkpoint or reclamation effects.
   Raising the configured budget can recover unchanged canonical files.
4. Planning separately traversed sources after the strict order/validator pass.
   A bounded readonly observer now gathers geometry/selection within that existing
   pass. Default callers have no observer. Producer validation and independent
   output/original-byte, membership, count, order/high-water and publication
   checks remain; no per-key table/cache or relaxed CRC guard is introduced.

## Regression method

Counter fixtures independently encode full EDIT/SEAL frames using the existing
bitwise-reference test codec, retaining the real CONTROL header. Both formats
and legacy/resident/paged run exhausted counter rejection with exact file/name
invariance and successful recovery/next CSN. Last-valid reservations run both
normal maintenance and interruption immediately after durable replacement,
then real reopen/value/CSN checks. The mixed deterministic model performs 512
PUT/DELETE operations per format, alternates RAM/paged every sixteen operations,
checks sixteen current values and CSNs after every operation, and spans four
engine sessions plus a final reopen. The startup-capacity case checks that a
refused opening changes neither bytes nor namespace and a larger budget reopens
and continues with the next CSN.

Existing compaction and live-rotation crash, corruption, no-gain, borrowed reader/
snapshot, unlink-failure and real Unix service tests remain in the complete suite.
The unchanged benchmark driver permits comparison with the previous integration;
measurements must run after qualification and sequentially, reporting pauses
separately from hot GET timing. Raw attempts, source inventories and failed
regressions are retained without normalizing stdout/stderr.

## Recorded regression results

The [baseline counter regression](baseline-counter-regression/report.lisp) fails
against the previous product implementation as intended. The first
[counter-fix campaign](counter-fix-targeted/report.lisp) passes. The expanded
[mixed-model run](mixed-model-capacity-regression/report.lisp) then exposes the
startup segment-budget failure; the [corrected targeted campaign](targeted-after-capacity-fix/report.lisp)
passes. The fourth regression (startup rejection before effects and reopening
with an increased budget) is included in the final complete suites.

The [SBCL 2.6.10 warning-strict complete product build/test](strict-2.6.10/report.lisp)
passes with exit code zero. Product sources are forcibly recompiled, without
suppressing warnings or style warnings. [Two-reading review and decision table](review.md)
record the invariant/error/bounds/admission checks and limits.

## Final qualification and comparison

The [complete SBCL 2.6.9 gate](full-2.6.9/report.lisp) passes: warning-strict
product build/tests, lint, runner checks, traceability, links, full-text fixtures,
evidence tooling/storage/publication/normalization/collection and validation,
SPK-01–11 correctness and CI self-tests. Both complete product suites include
all four new regression methods and the existing real crash/service campaigns.
[Source identity](source-identity.lisp) checks the same 1583 inventoried files
before/after both qualifications and all eight final benchmarks, and against
the final working sources. No qualified source changed during measurement.

[Exact metrics](metrics.lisp) and the [comparison table](comparison.md) retain the
raw-record paths. The unchanged [benchmark driver](../2026-10-31-engine-compaction/bench.lisp)
uses 4096 strong overwrites, 128 live keys, 4096-byte values, one compaction per
configuration, five hot GET samples per side and an independent fresh-reopen
oracle. The eight final processes run sequentially after qualification.

Input/output sizes are unchanged: 17170560 bytes become 529472 bytes plus a
64-byte ACTIVE, reclaiming 96.92%. RAM reads fall from 71342860 to 54172388 bytes
(24.1%); paged reads from 155426316 to 138255844 bytes (11.0%). Counted read calls
fall by one per configuration; append bytes/calls and fifteen flushes are
unchanged. Counted API bytes are not physical storage-device traffic.

RAM compaction is 63.549–65.950 ms in these final samples, versus
67.872–72.944 ms previously. Paged timing is 116.978–128.393 ms versus
114.943–125.088 ms: some configurations improve and some regress. This does not
demonstrate a uniform paged latency improvement. Each configuration has only one
maintenance sample, so timing differences are not a statistical latency claim.
Post-maintenance hot GET P99 medians are 3–4 µs RAM and 13–14 µs paged, with zero
allocated bytes in all timed GET samples. Maintenance allocates about 590 KB;
no key-count-sized resident table is added.

The reproducible optimization is less canonical read traffic with the same
integrity proofs. Synchronous pauses, paged repeated membership probes,
background/concurrent compaction, historical snapshots, multiseries and power
loss remain explicit limits; this iteration does not claim whole-engine or
C1/MC/DC qualification.

The [first final documentation attempt](docs-setup-needed/report.lisp) passes
lint/trace/links, then stops because generated documentation dependencies had
been removed during the previous cleanup. This is a build prerequisite issue,
not a product failure. The final command includes `docs-setup` through the normal
`docs` target; no product source or warning policy changes for that retry.

[Final lint, traceability, links, documentation bootstrap and rendering checks](final-checks/report.lisp)
pass. The final source-identity receipt includes this command as well as both
qualifications and the eight timed benchmarks. Generated artifacts and this
worktree's compiled caches are removed only after unique raw reports have been
retained and byte-verified; other worktrees are untouched.
