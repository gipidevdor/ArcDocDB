# Negotiated Unix read groups — qualification and measurements

[Method](method.md) · [Contract](../../../docs/adr/0084-explicit-unix-read-groups.md)

One synchronous client can now read 1..8 keys with one negotiated request,
using the existing canonical GET, verified record cache and automatic primary
storage. Complete validation, order/duplicates/absence and actual frame budgets
precede result delivery. The serial actor drains prior writes; no data CSN or
flush is introduced. Default and write-only wire bytes remain unchanged.

## Qualification

macOS ARM64, matching SBCL 2.6.9 and 2.6.10 runtimes/cores. The
[complete source identity](source-identity.lisp) matches 1,658 non-result files
across focused/model/documentation/full-test/final-benchmark records. The
baseline matches the parent's complete 1,650-file qualified inventory.

- [2.6.9 check-core](full-check-2.6.9/report.lisp) and
  [strict 2.6.10 build/tests](strict-2.6.10/report.lisp) passed without warnings.
  Lint, traceability, links, evidence/self-tests, CI self-tests and all 11 spikes
  passed. [Author review](review.md) states the local review scope.
- Twenty-one new permanent methods cover all capability combinations and
  malformed flags, complete key/result validation, absence/CBOR null/duplicates,
  exact and one-over request/result budgets, no copy for invalid last members,
  barriers/deadlines, cache fallback, client ownership and handshake unwinding.
- The [independent byte model](codec-model/report.lisp) checks 1,728 configurations:
  1,572 valid complete request/result pairs and 156 oversized-frame refusals.
  It varies count 1..8, ID widths through u64 maximum, key sizes 1/24/1,024,
  document sizes 1/24/256/2,048/4,096/60,000, presence patterns and invalid
  unselected input tails. Returned document copies survive input-buffer reuse.
- Integration includes both formats and all primary profiles, actual compaction
  with a positive maintenance counter, reopen, cache corruption/fallback and
  unchanged data frontiers. Real Unix processes check mixed read/write
  capabilities, a small negotiated frame, aggregate overflow with a usable
  engine/client afterward, SIGKILL/reopen, lost response, partial peers and
  coalesced frames.
- The [full-suite summary](qualification.lisp) records 12 local methods,
  135 child processes, 30 scenarios and 16 local SIGKILLs per runtime. Each
  runtime also executes the existing 36-scenario group crash matrix with
  108 children and 72 SIGKILLs. No new durability format is introduced.
- Documentation passed: 559 source documents, 1,139 HTML pages, 86,799 local
  links/anchors, 690 exported bindings and 627 runtime-matched prose contracts;
  the public Unix Lisp example passed.

## Serial single-client measurements

The [unchanged-code baseline](baseline/report.lisp) uses parent
`d9d7b04307dc13d1156f388063d3720d3da9d172`: 80 samples. The
[final campaign](benchmark/report.lisp) has 320 samples across 64 cases.
Together they verify 51,200 timed logical reads. The exact driver/server hashes
match before/after; every returned byte and the counter deltas are checked.
[Machine-readable metrics](metrics.lisp) retain every width and latency/allocation
observation.

Relative to individual reads on the same final server, the median of the 16
case ratios is **1.35x / 1.50x / 1.79x** at widths 2/4/8. Width eight spans
**1.38x–2.33x**, with **87.5% fewer RPCs**: 16 instead of 128 per sample.
Every sample still performs exactly 128 canonical engine GETs, with zero strong
flushes. With the 1 MiB cache enabled, all 128 timed GETs are verified hits.

| Format | Primary | Cache MiB | Document bytes | Baseline reads/s | Final single reads/s | Group 8 reads/s | Group/single | Group RPC p99 (us) |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| v1 | resident | 0 | 2048 | 26930 | 26891 | 61687 | 2.29x | 271 |
| v1 | resident | 0 | 6144 | 23730 | 22743 | 33746 | 1.48x | 438 |
| v1 | resident | 1 | 2048 | 28250 | 28546 | 65473 | 2.29x | 258 |
| v1 | resident | 1 | 6144 | 24192 | 24663 | 34830 | 1.41x | 383 |
| v1 | paged | 0 | 2048 | 25838 | 26672 | 55920 | 2.10x | 267 |
| v1 | paged | 0 | 6144 | 22393 | 22627 | 31793 | 1.41x | 399 |
| v1 | paged | 1 | 2048 | 26600 | 26874 | 58474 | 2.18x | 250 |
| v1 | paged | 1 | 6144 | 23405 | 23699 | 33325 | 1.41x | 378 |
| v2 | resident | 0 | 2048 | 26851 | 27568 | 62409 | 2.26x | 246 |
| v2 | resident | 0 | 6144 | 23396 | 23739 | 34024 | 1.43x | 371 |
| v2 | resident | 1 | 2048 | 27905 | 28350 | 66150 | 2.33x | 238 |
| v2 | resident | 1 | 6144 | 24065 | 24587 | 35418 | 1.44x | 357 |
| v2 | paged | 0 | 2048 | 26006 | 26203 | 56190 | 2.14x | 275 |
| v2 | paged | 0 | 6144 | 22504 | 22772 | 32072 | 1.41x | 413 |
| v2 | paged | 1 | 2048 | 26750 | 27090 | 58770 | 2.17x | 245 |
| v2 | paged | 1 | 6144 | 23159 | 23854 | 32990 | 1.38x | 391 |

Width-eight throughput versus the earlier baseline spans 1.42x–2.37x.
Unbatched final/baseline throughput spans 0.958–1.032; this does not establish
an individual-GET improvement. Observed group RPC p99 ranges from 238 to 438 us.
RPC latency describes the complete vector, not latency divided by group width.
Cached and uncached width-eight median ratios are 1.80x and 1.79x respectively.

Both formats, resident/forced-paged automatic primary storage, cache 0/1 MiB,
2,048/6,144-byte documents and eight hot present keys are measured. Each case
uses five 128-read samples, widths in fixed order 1/2/4/8 on one live engine.
Seed/warmup, full GC, counter PINGs and reopen/new-CSN checks are outside timing;
returned-byte comparison is inside timing. Cold C4 wrappers select the paged
quota after actual startup and before listen. Counters add bounded per-GET/RPC
work but print only on untimed PINGs. No per-request diagnostic logging is timed.

The metric self-test rejects 11 damaged samples; the qualification self-test
rejects five incomplete/changed records. No performance inference is drawn
from functional runs.

## Retained development evidence and limits

[Initial archive](initial-archive.lisp) preserves the rejected little-endian
response-prefix implementation and its real-client failure, reader-helper and
test-fixture corrections, raw diagnostics and original variants. The prefix
writer is now shared with existing encoders and independently checked as u32
big endian. Failed child diagnostics remain in the fixture archive. All final
qualification uses the corrected, frozen sources.

External load is uncontrolled; baseline/final occur at different times and
fixed width order can affect comparisons. Client managed-allocation counters
are quantized and exclude server allocation, RSS and physical RAM. The client
adds 64 payload bytes of fixed spans, excluding headers; server value/output
and group workspace are reused. Request and returned-document copies remain
bounded allocations. Serial current views add no historical MVCC or broader
concurrency guarantee. Unexecuted Linux, physical power loss, physical-RAM scale,
full C1/MC/DC and whole-engine completion remain outside this campaign.

The [closed byte inventory](closure.lisp) verifies 203 retained files against
their original hashes and records 62 lossless compactions. Raw diagnostics and
selected source variants retain their original bytes. The
[cleanup receipt](cleanup.lisp) records removal of 201,777,582 logical regular-file
bytes across 17 owned regenerable paths, including build/site output,
worktree-specific SBCL caches, spike output and exact failed fixtures. This is
a file-byte inventory, not physical free-space measurement. Other worktrees,
shared Git history and global caches were untouched.
