# Explicit Unix write groups — qualification and measurements

Method and implementation: [preregistered method](method.md),
[ADR-0083](../../../docs/adr/0083-explicit-unix-write-groups.md).
The integrated API lets one synchronous client share a canonical strong flush
across up to eight independent writes. Default handshake/commands retain their
old bytes. Opt-in capability, complete member validation, cumulative admission,
deadline checks and internal result validation precede result exposure.
Each operation keeps its CSN/SEAL; interrupted groups are not transactions.

## Qualification

macOS ARM64; strict builds use the matching SBCL 2.6.9 and 2.6.10 runtimes/cores.
The complete non-result source inventory is frozen; result artifacts alone
change while recorded commands run. [Author review](review.md) distinguishes
local review from independent or formal qualification.

- [Strict 2.6.10 build/tests](strict-2.6.10/report.lisp) and complete
  [2.6.9 check-core](full-check-2.6.9/report.lisp) passed without warnings,
  including lint, traceability, links, evidence/self-tests and all 11 spikes.
  The [identity check](source-identity.lisp) matches all 1,650 current source
  files to the focused, model, documentation, full-test and benchmark records.
- Eighteen new permanent methods cover independent handshake literals and
  capability errors, whole-group validation, exact budgets, u64 CSNs, mixed keys,
  one-flush dispatch, cumulative refusal without splitting, barriers, final
  deadlines, partial I/O, unknown outcomes, nonlocal exits and cleanup.
- An independently encoded byte model checks 1,152 configurations: 1,020 exact
  encode/decode matches and 132 frame-capacity refusals before output mutation.
  Counts 1..8, canonical ID widths through u64 maximum, mixed PUT/DELETE,
  key sizes 1/24/1,024, document sizes 1/24/256/2,048/4,096/60,000 and an
  invalid unselected tail are covered.
- Existing engine tests exercise both formats and all primary profiles,
  cumulative reservation, rotation, compaction, migration and recovery.
  Each full runtime suite executes the 36-scenario group crash matrix:
  108 children and 72 actual SIGKILLs. New real Unix cases check negotiated
  groups after acknowledged SIGKILL and response loss after strong completion,
  including recovered data and the next CSN.
  The [structured qualification summary](qualification.lisp) records 128 local
  child processes, 26 scenarios and 14 local SIGKILLs in each full runtime suite.
- Documentation passed: 558 Markdown documents, 1,135 HTML pages, 86,495 local
  links, 1,907 source docstrings; 689 exported bindings and 626 prose contracts
  match the runtime. The public Unix Lisp example also passed.

## Measurements

The unchanged-driver baseline uses parent `e404b897f4cb984421ef86661eae82f55765a7e4`.
The [baseline](baseline/report.lisp) contains 40 samples; the
[final campaign](benchmark/report.lisp) contains 160. Together they check
25,600 timed logical writes. [Machine-readable metrics](metrics.lisp) retain
all 32 final cases, RPC p50/p99 and client counters.

Relative to individual writes on the same final server, the median of the eight
case ratios is **2.01x / 4.04x / 8.51x** at widths 2/4/8. Width eight spans
**7.55x–8.91x**. Exactly 16 rather than 128 strong flushes serve each 128-write
sample at width eight: **87.5% fewer flushes**, with unchanged strong completion.

| Format | Primary | Document bytes | Baseline writes/s | Final single writes/s | Group 8 writes/s | Group/single | Group RPC p99 (ms) |
|---|---|---:|---:|---:|---:|---:|---:|
| v1 | resident | 2048 | 275 | 274 | 2443 | 8.91x | 4.559 |
| v1 | resident | 6144 | 304 | 262 | 1978 | 7.55x | 11.142 |
| v1 | paged | 2048 | 267 | 276 | 2417 | 8.77x | 4.233 |
| v1 | paged | 6144 | 265 | 251 | 1988 | 7.91x | 5.007 |
| v2 | resident | 2048 | 267 | 282 | 2427 | 8.61x | 4.600 |
| v2 | resident | 6144 | 303 | 269 | 2241 | 8.32x | 4.727 |
| v2 | paged | 2048 | 263 | 281 | 2439 | 8.68x | 4.618 |
| v2 | paged | 6144 | 257 | 250 | 2107 | 8.42x | 10.758 |

Width-eight throughput versus the earlier baseline spans 6.50x–9.26x.
Unbatched final/baseline throughput spans 0.861–1.067; this campaign therefore
does not establish an improvement for individual writes. Group RPC tail samples
reach 11.142 ms; amortized throughput is not a per-operation latency guarantee.
Reported zero client counters in grouped windows are not a zero-allocation claim.

The preregistered serial comparison uses both formats, resident/forced-paged
automatic primary storage, documents of 2,048/6,144 bytes, eight hot keys and
five 128-write samples per case. Inputs/results are prepared outside timing;
full GET comparisons and reopen/new-CSN checks occur outside samples. A cold C4
wrapper fixes the paged quota after actual startup and before listen.
Driver hashes, exact CSNs and strong-flush histograms are checked.
The analysis self-test rejects eight damaged metric shapes; the qualification
self-test rejects five incomplete/changed command records. No performance
conclusion is drawn from the functional runs.

## Retained development evidence

[Initial archive](initial-archive.lisp) retains the first absolute-child-path
driver refusal, a small-run log-name collision after successful width-1/8
samples, test-fixture reader/preflight corrections, and their raw diagnostics.
Original variants are in `development-drivers/`, `development-test-parentheses/`
and `development-response-boundary/`; failed child logs are retained separately.

Author review narrowed the capacity handler to the engine call. The new injected
post-commit encoder failure propagates unchanged, produces no busy response,
retains the committed frontier and clears workspace. Two earlier full campaigns
were deliberately stopped before this correction; neither qualifies the final
sources. One interrupted SBCL process exited zero, so qualification also requires
the terminal completed-test marker and the complete stable source inventory.
A small output-formatting helper initially omitted ASDF initialization; its
failure and original variant are retained. The benchmark and numerical analysis
had already passed and were unchanged.

## Limits

The [closed byte inventory](closure.lisp) verifies 220 retained files against
their original hashes, expanding compressed evidence when necessary. Raw
diagnostics and selected source variants are retained without whitespace edits.
The [cleanup receipt](cleanup.lisp) records removal of 203,197,203 logical
regular-file bytes across 19 owned regenerable paths: build/site output,
worktree-specific SBCL caches, spike output and exact failed development fixtures.
This is a file-byte inventory, not a physical free-space measurement. Other
worktrees, shared Git history and global caches were untouched.

Widths run in the fixed order 1/2/4/8 on the same live engine per case; baseline
and final campaigns occur at different times, and external load is uncontrolled.
RPC latency describes the whole group response. Client managed-allocation
counters are quantized and do not measure server allocation, RSS or physical RAM.
The new fixed server workspace is 288 payload bytes per connection and client
scratch is 64 payload bytes, excluding object headers. Bounded request copies
remain allocations. These local checks do not qualify arbitrary concurrency,
unexecuted Linux, physical power loss, full C1/MC/DC or whole-engine completion.
