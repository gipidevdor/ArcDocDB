# Engine performance refinement — 2026-10-31

Targets repeated historical membership probes in compaction and unnecessary
memory writes in the shared paged-index cache. Reviews GET/PUT, recovery, source
resolution, maintenance, memory and descriptor ownership. The existing serial
current-only profile, durability, automatic RAM/paged semantics and all format
proofs remain unchanged.

## Changes

- For overwrite-heavy history, a bounded traversal of the frozen current index
  computes the minimum live CSN and independently checks count/range. Older
  canonical frames cannot be current, so selection avoids their index probes.
  The traversal also fills a fixed 512-byte CSN signature: absent bits exclude
  historical versions while collisions only cause exact lookups. This remains
  useful when a cold live key keeps the global minimum low.
  Empty indexes retain the maximum-CSN witness. Append-heavy inputs disable the
  shortcut. Cold keys remain valid even if their CSN predates all hot updates.
- Original-byte verification caches the exact original segment ID with its
  already validated read-ahead span, avoiding repeated source-directory searches
  within that span. Standard bounded vector mismatch retains exact byte equality.
- The common disk page cache clears only the unused tail of partial reads; a
  complete read overwrites its entire frame. Tag publication still follows exact
  successful IO. Invalid/staged/cross-frontier checks and append invalidation stay.
  This reduces memory writes on paged GET/PUT, migration, replay and compaction.

No cardinality-sized resident map/cache is added. Existing index traversal uses
private bounded paths and borrowed key spans. A scalar threshold cannot authorize
publication: independent output membership/count/order/CSN/original-byte checks
remain. Cache frames remain opaque; failed reads cannot publish stale bytes.
Synchronous maintenance and cold CLOSED-map rebuilding remain limits. This is
not concurrent/background compaction or whole-engine/power-loss qualification.

## Verification method

Eight focused methods cover all formats and legacy/resident/paged where applicable:
512 overwrites of sixteen keys with a bounded probe count and exact reopened
values/CSNs; an ancient cold key plus 511 hot updates; CRC-correct output payload
substitution rejected by original-byte comparison; injected wrong derived minimum
rejected by independent output coverage before CONTROL; complete/partial/failing
cache loads with one and three frames, checking bytes, zero tail, unpublished
failed tags and complete replacement on retry; an incorrectly empty controller
count cannot hide a live paged tree or authorize deleting its records; CSN
signature collisions at 1/4097 and 2/4098 preserve exact fallback and reopened
values; an injected damaged signature is rejected by output coverage before
CONTROL. The collision workload writes 4098 CSNs across source boundaries.

Existing randomized disk, collision, bounds, compaction, counter/capacity, mixed
RAM/paged/reopen, fault-injection, real SIGKILL and Unix service tests remain in
the complete qualification. New benchmark comparisons use the unchanged earlier
compaction/GET driver; a separate extended driver measures strong PUT latency/
allocation and warm-cache recovery after compaction as new baselines. Timed
processes must run sequentially after qualification; raw measurements and source
identities are retained.

## Final qualification and measurements

[Final complete SBCL 2.6.9 gate](full-2.6.9/report.lisp) and
[final warning-strict SBCL 2.6.10 product build/test](strict-2.6.10/report.lisp)
pass. The complete gate includes lint, runner checks, traceability, links,
full-text fixtures, evidence tooling/validation, SPK-01–11 correctness and CI
self-tests. [Source identity](source-identity.lisp) verifies all 1583 inventoried
files identical before/after both final gates, all twelve measurements and the
qualified working tree. Eight [focused regression methods](focused-eight/report.lisp)
pass; earlier development stages remain separately recorded. The earlier full
2.6.9 run was deliberately interrupted to add the fixed signature and repeat
qualification. The earlier 2.6.10 stage completed successfully but is not used
as final-source qualification.

[Comparison with the previous iteration](comparison.md) and [exact metrics](metrics.lisp)
use the unchanged original compaction/GET driver: 4096 strong updates, 128 live
keys, 4096-byte values, five hot GET samples per side, both formats and runtimes,
RAM/paged storage, then fresh-reopen value/CSN checks. All eight final processes
pass. Each maintenance timing is one sample, not a statistical tail guarantee.

RAM compaction takes 51.732–58.710 ms, versus 63.549–65.950 ms previously
(7.6–21.6% lower in the paired configurations). Paged takes 59.939–65.631 ms,
versus 116.978–128.393 ms (43.9–52.3% lower). Paged read bytes fall from
138255844 to 63606244 (54.0%), and counted read calls from 22377 to 3117 (86.1%).
RAM canonical read bytes remain 54172388. Append counts/bytes and fifteen flush
calls are unchanged. These are counted API calls/bytes, not physical device reads.

Every standard configuration still reclaims 16641024 of 17170560 canonical input
bytes (96.92%). Post-maintenance paged hot GET P99 medians are 11 µs; RAM is
3 µs in three configurations and 6 µs in one. All timed GET samples allocate
zero bytes; maintenance allocation remains about 590 KB, with a bounded 512-byte
signature rather than a key-count-sized mirror. Timing is local macOS ARM64;
loaded socket latency, dedicated reference hardware and physical RSS are not
measured by this campaign.

[Additional measurements](additional-metrics.lisp) include one ancient key plus
127 hot keys, preserving the same 4096 writes and 128 current values. Both modes
pass reopen checks. That workload takes 85.062 ms RAM and 66.220 ms paged in
these single samples, with read totals 54430340 and 64080388 bytes respectively.
No historical cold-workload timing baseline exists here, so no comparative speed
claim follows. The signature may saturate with many distinct live CSNs; collisions
fall back to exact lookups and can remove the filtering benefit without changing
correctness. Sparse/cold CLOSED-map rebuilding and background scheduling remain
separate optimization targets.

[Extended strong-PUT/recovery baselines](extended-metrics.lisp) use a separate
[extended driver](extended-bench.lisp), whose self-test is
[retained](extended-driver-selftest/report.lisp). At SBCL 2.6.10/v2, 4096 durable
PUTs measure 293.7/s RAM and 255.5/s paged; per-call P50/P99 are 3.059/4.382 ms
and 3.988/4.958 ms. Allocations total 3075024 and 3140736 bytes. Wall throughput
includes preparing the repeated value; per-call percentiles include the API and
CSN oracle. Each operation retains its own strong flush; durability was not
weakened and batching was not introduced.

Warm-cache recovery after compaction takes 11.489 and 13.025 ms, using the
normal automatic index policy on reopen. Its roughly 67.5 MB allocation includes
the configured 64-MiB engine scratch and startup resources; it is not RSS or an
index-only memory measure. These are new PUT/recovery baselines without matching
pre-change measurements. [Cold-driver self-test](cold-driver-selftest/report.lisp)
and raw latency vectors are retained. All twelve final processes ran sequentially
after the qualification commands finished.

The source-English/code-reference update arriving on main is integrated after
this frozen campaign. Its integration and executable-form comparison are recorded
separately; the original byte-level qualification receipt is preserved.

## Integration with the source-reference edition

The qualified optimization revision is `4c50ebcaf08d101c8f59546cbd3270e94209411b`.
Main advanced independently to `31e438bb67f4db0a35f81363d5cb78dcf97ba05a` with
English source contracts and the code reference. The branches are merged without
rewriting the other checkout. The ADR conflict preserves the revised English
sentence and the complete optimization decision.

[Documentation-phase static comparison](documentation-integration-identity.lisp), reproduced at that integration revision by
[integration-proof.lisp](integration-proof.lisp), checks all 494 runtime source
files with both reader-conditional branches retained. Only recognized declared
documentation and comments are excluded; executable tokens/data are unchanged.
418 files have prose-only changes. All 288 Lisp test files, ASDF and the three
measurement drivers are byte-identical to the qualified revision. Positive and
negative controls detect body arithmetic, return-string, conditional-branch,
initializer-string and condition-report changes; an empty file inventory fails.
Documentation reflection is intentionally changed by the English edition.
The original byte-level qualification receipt remains attached to its original
snapshot, rather than being relabelled as a measurement of translated text.

The [recorded integration comparison](integration-check/report.lisp) and
[final merged-tree lint/trace/links/docs checks](final-docs/report.lisp) pass.
The updated documentation gate also recompiles the product/local systems in its
isolated runtime cache with warnings treated as errors, verifies loaded exports
and source contracts against the generated reference, and runs the public Unix
example. The qualified executable forms and byte-identical tests are preserved;
the English contracts and source-reference tooling remain integrated.


Main then advanced through `12684cc` and `deb33f8` to retain distribution notices
and original legal-review evidence. The final integration preserves those commits.
[Final static comparison](integration-identity.lisp) again covers all 494 runtime
files and 288 unchanged tests. ASDF component/executable forms remain identical;
the only allowed ASDF metadata change is the explicitly checked license string
from `BSD-2-Clause` to `BSD-2-Clause AND Unicode-3.0` in all three systems. Unicode
numeric data are unchanged; its source notice and generator prose are aligned.
The three measurement drivers remain byte-identical.

[Final recorded comparison](final-integration-check/report.lisp) and
[final integrated checks](final-integrated-checks/report.lisp) pass. The latter
includes lint, traceability, links, complete full-text fixture/generator checks,
notice checks/self-tests, documentation bootstrap/rendering/coverage, fresh
warning-strict runtime interface/contract verification and the Unix example.
No new storage behavior is introduced by the incoming metadata/tooling work.
