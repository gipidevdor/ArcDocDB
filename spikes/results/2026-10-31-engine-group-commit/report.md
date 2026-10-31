# Bounded strong group commit in M1

The integrated M1 engine commits up to eight independent operations with one
covering strong WAL flush. The Unix service groups complete requests already
ready in the same turn, with no fill timer. Every operation retains its own CSN
and SEAL; reads are barriers and an admitted uncertain outcome never retries.
Automatic RAM/paged storage uses the same API and cumulative admission rules.
See [ADR-0080](../../../docs/adr/0080-group-commit-m1.md).

On this Mac, explicit groups of eight achieved **5.43–8.46×** the single-write
throughput. Eight ordinary Unix clients achieved **2.41–2.81×** the throughput
of the same service restricted to individual admissions. Observed Unix P99
fell from **31–33 ms to 12–14 ms**. These are local measurements at fixed
concurrency, not production tail-latency or device qualification.

## Frozen qualification

The group integration was combined with the concurrently published offline M1
verifier before final qualification. All five final campaigns have the same
**1,630 source/tool/document blobs**, independently checked by the
[identity validator](validate.lisp) and retained in
[source identity](source-identity.lisp).

| Campaign | Retained original record | Outcome |
|---|---|---|
| Full `make check-core`, SBCL 2.6.9 | [full check](full-check-2.6.9/report.lisp) | Passed; build and all required gates, including 11 spike correctness checks and CI self-tests |
| Warning-as-error build and full product tests, SBCL 2.6.10 | [strict build](strict-2.6.10/report.lisp) | Passed; no warning or style warning |
| Complete manual, runtime contracts and public Unix example | [documentation](documentation/report.lisp) | Passed; 555 documents, 1,123 HTML pages, 85,594 local links/anchors |
| Serial engine measurement | [engine benchmark](engine-benchmark/report.lisp) | Passed; 48 configurations, 240 repetitions, 30,720 measured writes |
| Serial real Unix measurement | [Unix benchmark](unix-benchmark/report.lisp) | Passed; 8 configurations, 40 repetitions, 5,120 measured writes |

Each runtime passed all **175 engine test methods** and the complete existing
product suite. The new crash matrix alone covers 36 format/profile/stage
combinations, 108 child lifetimes and 72 deliberate SIGKILLs **per runtime**:
prepared tokens, three complete appends, a fourth partial SEAL, strong flush,
three memory publications, and completed commit before response. Every case
includes recovery, another write/kill and a third opening. The native Unix
case additionally verifies eight acknowledged writes after SIGKILL and exact
next CSN in both formats. SIGKILL does not qualify physical power loss.

The [independent SPK-07 reservation variant](reservation-model.lisp) loaded no
product code and enumerated 6,561 initial layouts and 2,624,400 two-operation
sequences at reduced geometry. Both damaged credits and naive independent
initial-slot checks were rejected: [final record](finite-model-final/report.lisp).
This supplements the general slot-selection argument; it is not a full-width
proof or a weak-memory claim. [Two readings and decisions](review.md) identify
ownership, errors, cumulative bounds and the residual assurance scope.

Documentation originals preserve upstream dependency/reference-renderer warnings.
Product warning-as-error qualification is separate and passed unchanged.

## Engine measurements

The [preregistered method](method.md) fixes both formats, legacy resident and
automatic RAM/paged profiles, 2,048/60,000-byte values, eight immutable hot keys,
group sizes 1/2/4/8 and five 128-operation repetitions per configuration. Width
1 uses the existing single-write API. Startup, seed writes, GC, value checks,
fresh recovery and reporting are outside timing. No canonical rotation occurs
in timed windows; normal derived-index maintenance remains part of the API.

Values below are medians of five per-repetition rates. P50 describes the **group
API call**, never an individual request latency divided by eight. Exact CSNs,
values, following writes, recovery and canonical strong-flush counts are checked.
Width 1/2/4/8 performs respectively 128/64/32/16 canonical strong flushes for
the same 128 operations. Full vectors and allocations remain in the original
records; all widths are summarized in [metrics](metrics.lisp).

| Profile | Format | Value bytes | Single op/s | Group 8 op/s | Gain | Group-call P50 ms |
|---|---:|---:|---:|---:|---:|---:|
| Legacy RAM | 1 | 2,048 | 270.3 | 2,097.2 | 7.76× | 3.969 |
| Legacy RAM | 1 | 60,000 | 273.9 | 1,790.5 | 6.54× | 4.903 |
| Automatic RAM | 1 | 2,048 | 269.6 | 2,111.0 | 7.83× | 3.962 |
| Automatic RAM | 1 | 60,000 | 274.9 | 1,753.9 | 6.38× | 4.924 |
| Automatic paged | 1 | 2,048 | 252.2 | 2,133.8 | 8.46× | 3.937 |
| Automatic paged | 1 | 60,000 | 273.4 | 1,714.7 | 6.27× | 4.947 |
| Legacy RAM | 2 | 2,048 | 276.8 | 2,155.9 | 7.79× | 3.976 |
| Legacy RAM | 2 | 60,000 | 284.2 | 1,678.5 | 5.91× | 4.959 |
| Automatic RAM | 2 | 2,048 | 263.1 | 2,152.2 | 8.18× | 3.941 |
| Automatic RAM | 2 | 60,000 | 272.9 | 1,482.5 | 5.43× | 4.972 |
| Automatic paged | 2 | 2,048 | 266.6 | 2,125.3 | 7.97× | 3.936 |
| Automatic paged | 2 | 60,000 | 248.3 | 1,704.8 | 6.87× | 4.910 |

The measured loop allocates approximately **512 bytes per operation** in every
configuration. Inputs, result arrays and timing arrays are prepared beforehand;
this is an observed allocation counter, not zero-allocation or RSS qualification.
Groups add seven batch payloads per ACTIVE, separate from index/cache grants.
The existing M1 heap/GC qualification gate remains open.

## Unix measurements

Eight independent owner-thread clients each issue one synchronous request at a
time. Every configuration has five 128-write repetitions with 2,048-byte CBOR
values, fresh recovery and exact contiguous ACK CSN sets. Limit 1 and limit 8
use the **same final code and observer wrapper**. The wrapper emits one stderr
line per flush; this observability overhead is included, not subtracted.
The benchmark uses ordinary scheduling without the SIGSTOP test barrier.

| Primary profile | Format | Limit 1 op/s | Limit 8 op/s | Gain | P99 ms, limit 1 | P99 ms, limit 8 | Mean actual group |
|---|---:|---:|---:|---:|---:|---:|---:|
| Automatic RAM | 1 | 293.1 | 748.3 | 2.55× | 31.101 | 12.079 | 2.81 |
| Automatic paged | 1 | 266.9 | 706.3 | 2.65× | 32.199 | 13.880 | 2.87 |
| Automatic RAM | 2 | 261.9 | 736.1 | 2.81× | 32.663 | 12.120 | 2.87 |
| Automatic paged | 2 | 294.4 | 710.7 | 2.41× | 31.034 | 12.269 | 2.87 |

P99 is the median of the five empirical per-repetition request percentiles,
128 observations each. It is descriptive at fixed concurrency, not loaded-tail
or P99.9 evidence. Actual groups average about 2.8 writes because the service
never waits to fill eight. Complete histograms, request samples and ACKs are
retained in the [raw record](unix-benchmark/report.lisp), with the exact
[server stdout/stderr](unix-logs/) copied before fixture cleanup.

## Reproduction and retention

The final serial commands, after functional campaigns completed, were:

```sh
SBCL=/Users/gpicchiarelli/.local/sbcl/2.6.10/bin/sbcl
PATH=/Users/gpicchiarelli/.local/sbcl/2.6.10/bin:$PATH
$SBCL --script tools/record-command.lisp -- "$SBCL" --noinform --no-userinit --no-sysinit --script spikes/results/2026-10-31-engine-group-commit/bench.lisp --run
$SBCL --script tools/record-command.lisp -- "$SBCL" --noinform --no-userinit --no-sysinit --script spikes/results/2026-10-31-engine-group-commit/local-bench.lisp --run
```

Each record retains exact argv, environment, load average, source blobs and raw
stdout/stderr. External desktop load is uncontrolled; there is no physical device,
power-loss, general concurrency or RSS claim. Driver hashes are printed inside
the benchmark output and checked by the identity validator. The
[summarizer](summarize.lisp) independently checks sample cardinality, CSN sets,
flush counts and source equality before producing the tables.

Development failures are retained, including initial parentheses, a paging
fixture that had not forced paging, a case-mismatched negative parser fixture,
and a support fixture initially mistaken for a command-record root. The latter
two changed only C4 postprocessing; no measured sample was replaced.

Two earlier campaigns were deliberately stopped to merge the offline verifier.
They are excluded from qualification. SBCL 2.6.10 returned zero on SIGTERM, so
its generic record says `:OK` although the completion marker is absent. The
[explicit exclusion](interruption.lisp) and validator negative control preserve
this distinction. Original diagnostics are never rewritten or whitespace-normalized.

[Initial archive](initial-archive.lisp) and [final archive](final-archive.lisp)
retain byte-copy receipts. Large raw reports use verified lossless gzip descriptors;
use `tools/read-evidence.lisp` or the evidence reader to recover the original
bytes and hashes. Only this worktree's regenerable output and compiler-cache
prefixes are eligible for cleanup; other chats and the primary checkout are
outside this cleanup.

The [closed archive audit](closure.lisp) verifies 177 command/support copy
hashes, resolving lossless descriptors where necessary. The final
[lint/trace/link/evidence check](final-checks/report.lisp) passed, and the
[current-source comparison](current-source-command/report.lisp) confirms the
same 1,630 qualified blobs. The [cleanup receipt](cleanup.lisp) records 19
owned regenerable paths and **202,567,775 regular-file bytes** removed
(193.18 MiB of file contents; not a physical free-space measurement).
