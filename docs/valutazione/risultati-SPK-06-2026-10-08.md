<a id="spk-06--prima-campagna-locale-2026-10-08"></a>

# SPK-06 — first local campaign, 2026-10-08

[Evaluation](README.md) · [Method and code](../../spikes/SPK-06-compaction-load/README.md)

> **Proposal** — Finite load policy model and comparison of buffered copies
> concurrent with reads. The two tests are separate; they do not attest to
> compaction, durability, or meeting database P99 objectives.

<a id="ambiente-ed-evidenze"></a>

## Environment and evidence

SBCL 2.6.9, `safety 3`, process heap 4 GiB, Apple M4 ARM64,
16 GiB RAM, Darwin 27.0.0. Reference commit `62267c9`, explicit local changes,
uncontrolled external load and page cache. Reports identify before/after
the five spike sources, two public SPK-05 dependencies, and harness.
Final check and benchmark have positive outcomes and stable sources.

- [Integrated checks](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk06-check.lisp).
- [Benchmark and raw samples](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk06-bench.lisp).
- [Derived comparison](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk06-comparison.lisp):
  minimum, median, and maximum of three replicas, grouped by workers and mode.
- [Complete check](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk06-full-check.lisp):
  successful `make check`, stable sources, nine spikes, warning-free compilation,
  foundation, storage, and recovery scan tests, linter, and traceability.
- [Initial I/O compilation error](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk06-io-compilation-failed.lisp)
  and [corrected compilation](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk06-io-compilation.lisp).

The first error was a missing parenthesis, detected as a style-warning;
it remains retained. The final runner compiles and loads with all warnings
fatal. Intermediate compilation precedes the last report layout change:
integrated checks identify the final variant.

<a id="correttezza-osservata"></a>

## Observed correctness

| Scope | Check |
|---|---|
| Load | Eight threshold cases, exact rational EWMA, low after 10 continuous s, timer reset and restart |
| MERGE | Immediate suspension at high, abandonment after 30 continuous s, resumption at normal; joint conditions and inclusive 50 s stability, including after recovery |
| CLEAN and quotas | Priority and selection without changing inputs, urgent CLEAN with one worker, credit cap, and arithmetic token conservation |
| Invalid inputs | Twelve invalid samples, five trace rejections, inclusive 256-sample limit; no partial mutation observed |
| Real I/O | Four modes over 12 records with two readers and 96 aggregate reads per case; CRC, key, stamp, and value consumption checked |
| Worker failures | Two injected errors, in reader and copy, propagated after join; source verified and resources released |
| Copies | Target reopened after close, size and every byte compared with source; source verified before and after matrix |

The model uses samples every 500 ms and EWMA `alpha=1/2`: experimental
parameters, not product tuning. Clock is injected, without real waits or
device signals. Model quotas and I/O worker quotas are distinct tests.
No new shared write per record: fd, buffer, plans, and samples belong to
the individual worker; the common gate is at the case boundary and the
report reads fields only after join.

<a id="confronto-locale"></a>

## Local comparison

Immutable synthetic 16 MiB file, 8192 records of 2048 bytes; body without
CBOR. Three replicas, 1/2 readers, 32,768 aggregate random reads per case,
alternating order of four modes. The **24 cases** complete **786,432 verified
reads** (1536 MiB) and **18 copies of 16 MiB** (288 MiB).
Process lasts **21.415561 s**, including compilation, checks, preparation,
verification, and sample serialization.

Each row reports the median of three replicas and, in parentheses,
minimum–maximum. P99 includes pread, record verification, and clock sampling;
it is not client latency. Ratio uses the same replica's baseline and reader
count. Observed bandwidth includes CRC and pacing and is distinct from quota.

| Readers | Copy | P99 during overlap, µs | P99/baseline ratio | Observed copy, MiB/s | Covered reads, min–max |
|---|---|---:|---:|---:|---:|
| 1 | unrestricted | 14 (14–19) | 0.93 (0.88–1.19) | 158.30 (157.51–160.57) | 7696–7974 |
| 1 | quota 16 MiB/s | 15 (15–18) | 1.00 (0.94–1.13) | 11.26 (11.11–11.43) | 32767–32768 |
| 1 | quota 64 MiB/s | 16 (15–16) | 1.00 (0.94–1.07) | 49.16 (48.80–49.21) | 24350–25317 |
| 2 | unrestricted | 15 (14–16) | 1.00 (0.94–1.00) | 159.82 (152.10–161.39) | 15091–16146 |
| 2 | quota 16 MiB/s | 16 (15–16) | 1.00 (1.00–1.07) | 11.41 (11.35–11.45) | 32766–32767 |
| 2 | quota 64 MiB/s | 16 (16–19) | 1.00 (1.00–1.36) | 49.24 (49.22–49.29) | 32767–32768 |

Baseline P99 is median 16 µs, 15–16 µs with one reader and 14–16 µs
with two. All 18 copy cases have samples in the overlap; unrestricted copy
covers only part of reads. The observed window includes token bucket waits:
it does not prove active I/O at every instant. Raw samples retain starts
and latencies in ticks; ends are reconstructed as start plus latency,
in declared worker order.

> **Proposal** — These samples do not justify changing ADR-0023. Ratios
> below or above one are local comparisons with uncontrolled external load.
> Quotas slow copying; they guarantee neither minimum throughput nor a
> bound on read latency.

<a id="conseguenze-e-limiti"></a>

## Consequences and limits

RSK-08 remains accepted: MERGE may not start under sustained load and
no emergency threshold is introduced. RSK-12 receives evidence on model
boundaries, without attesting to real feedback stability or pool AIMD.

The file was just written, is small relative to RAM, and has uncontrolled
cache. Linux x86-64/NVMe, beyond-RAM dataset, concurrent WAL, cold cache,
MVCC selection, relocations, reclaim, and durable CLEAN/MERGE are missing.
No fsync: buffered copy does not measure sustained device bandwidth.
Syscalls block in workers; timeouts are diagnostic and can be exceeded by
a blocked syscall. A still-live worker prevents close and removal until
exit. Fixtures from completed cases have been removed.
