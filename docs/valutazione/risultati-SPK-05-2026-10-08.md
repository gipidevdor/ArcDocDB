<a id="spk-05--prima-campagna-locale-2026-10-08"></a>

# SPK-05 — first local campaign, 2026-10-08

[Assessment](README.md) · [Method and code](../../spikes/SPK-05-segment-read/README.md)

> **Proposal** — Experimental comparison of reads from synthetic immutable files,
> with CRC32C, key, and stamp validated. Does not attest to commit, visibility,
> CBOR validity, durability, or database targets.

<a id="ambiente-e-prove"></a>

## Environment and tests

SBCL 2.6.9, `safety 3`, process heaps 4 GiB, Apple M4 ARM64,
16 GiB RAM; SBCL reports Darwin 27.0.0. Reference commit is `eca1ab5`,
with explicit local changes. Hardware, uncontrolled external load,
command, and source blobs are in reports. Four spike sources
and harness are identified before/after: final check and benchmark report
`:source-consistency :stable`.

- [Final checks](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk05-check.lisp).
- [Final benchmark](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk05-bench.lisp).
- [Full verification](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk05-full-check.lisp):
  successful `make check`, stable sources, eight spikes, and repository checks.
- [First variant](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk05-bench-initial.lisp) and
  [its check](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk05-check-initial.lisp).
- [Second variant](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk05-bench-inline-shared-sap.lisp) and
  [its check](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk05-check-inline-shared-sap.lisp).
- [First I/O injections](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk05-io-first-check.lisp),
  [extended injections](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk05-io-check.lisp), and
  [record fixture](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk05-record-check.lisp).
- [Initial record compilation error](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk05-record-compilation-failed.lisp).
- [Initial controller error](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk05-check-compilation-failed.lisp)
  and [process diagnostics](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk05-check-compilation-failed-process.lisp).

Both initial errors were extra parentheses. Failures remain
preserved; final compilation and loading produce no warnings.

<a id="correttezza-osservata"></a>

## Observed correctness

| Scope | Check and outcome |
|---|---|
| I/O primitives | 14 injection groups: short read/write, increasing offset and SAP, EINTR reset and ceiling, EOF including partial, invalid returns, EIO, and bounds before syscall |
| Actual file | 5 cases: exclusive open on existing file rejected, write on read-only fd rejected, read beyond EOF, overly long mapping, closed fd checked with EBADF |
| Synthetic record | 49 cases, golden CRC32C `123456789`, separate bitwise oracle, 12.096 payload bytes checked with independent recurrence, numbers through maximum u32, offsets, truncations, and corruptions |
| Valid CRCs and incorrect data | Layout, key, and stamp altered with recalculated CRCs still rejected |
| Worker | Two actual errors, pread EOF and incomplete mmap range, propagated after join; entire file checked after errors |
| Concurrent reads | 4 actual cases on 12-record file: 2 workers, random/sequential, pread/mmap; consistent counts and ranges |

The fixture uses PUT v2, zero flags, u64 key, and stamp derived from record
number. Body is not CBOR. The validator checks header before
interpreting lengths, then body, key, and stamp before returning range.
CRC neither makes corruption impossible nor covers errors with consistent CRCs.

<a id="confronto-locale"></a>

## Local comparison

File of **8192 records of 2048 bytes, 16 MiB**. Three replicas, 1/2/4 workers,
deterministic random access and disjoint sequential scans, alternating
method order. **36 cases** complete **294.912 validated reads**,
576 MiB of records read; process lasts **3,897763 s**, including compilation,
checks, preparation, and output. Individual case times delimit only reading,
validation, and sampling between first worker start and last completion.

Median throughput of three replicas, with minimum–maximum range:

| Access | Workers | pread, k records/s | mmap, k records/s |
|---|---:|---:|---:|
| Sequential | 1 | 81,3 (77,8–81,7) | 92,2 (88,3–95,3) |
| Sequential | 2 | 159,0 (156,0–160,8) | 188,7 (182,6–191,1) |
| Sequential | 4 | 307,0 (297,9–324,0) | 365,8 (349,3–369,0) |
| Random | 1 | 82,6 (80,7–84,1) | 89,5 (87,9–94,9) |
| Random | 2 | 158,6 (150,4–160,4) | 181,7 (179,6–190,2) |
| Random | 4 | 300,9 (272,6–305,9) | 367,4 (335,5–402,0) |

Per-read sample P99 ranges from 13 to 20 µs in these final cases;
it includes syscall or mapping access, CRC, and two clock reads.
Times are in seconds, with raw samples in SBCL ticks. This is neither client latency nor service P99
under load. The second campaign has greater variability
(one local P99 reaches 345 µs), preserved without selecting only the fastest
variant. External load is uncontrolled.

<a id="allocazioni-e-varianti"></a>

## Allocations and variants

Separate measurement uses only the controller thread, buffer and plan already
prepared, full warmup, and no per-operation timing sample. The
`get-bytes-consed` delta is read before creating the report.

| Variant | pread, bytes over 8192 reads | mmap, bytes over 8192 reads |
|---|---:|---:|
| Native callback in common loop | 131.072 | 0 |
| Inline native call, shared intermediate SAP | 131.072 | 0 |
| Inline native call, SAP formed in used branch | 0 | 0 |

The second variant does not resolve allocation. Generated code shows
a 16-byte SAP object materialized before choosing native or
callback branch. Forming it separately in the used branch eliminates observed delta
in the final sample. Short reads, EINTR, budgets, return checks, and
injections remain in the same loop, with `safety 3`.

Zero delta concerns this kernel and this SBCL sample; it is not an
engine or error-path guarantee. Matrix allocations include
thread startup, warmup, controller, and join, and are reported separately.

<a id="conseguenze-e-limiti"></a>

## Consequences and limitations

> **Proposal** — Required primitives are reachable from Common Lisp,
> and the pread loop with validation shows no allocations in the isolated sample.
> The product choice remains pread into reused buffers (ADR-0017): local
> mapping advantage on a small file does not justify an ADR change.

The file is newly generated and reread; dataset and page cache remain small,
without eviction control. Measurements do not cover cold-cache NVMe GETs,
beyond-RAM datasets, own cache, loss of cache warmth after CLEAN/MERGE,
memory retained by epochs, or injected page faults. RSK-10 remains open;
RSK-16 receives this limited primitive evidence without closing other
primitives or Linux x86-64 verification.

Each worker owns fd, buffer, plan, and samples. There are no shared
writes per read; read-only mappings and controller ports concern only
the experiment. Syscalls are blocking, exclusively in this I/O test's
workers. Timeout and attempt limit are diagnostic:
a blocked syscall can exceed them. A still-live worker prevents munmap,
close, and fixture removal until process exit. `MAP_PRIVATE`
does not protect against external mutations or `SIGBUS`; the file remains immutable
throughout the test. Normal fixtures were removed at completion.
