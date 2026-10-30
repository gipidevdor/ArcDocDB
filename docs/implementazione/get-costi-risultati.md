<a id="get-costi-dei-byte-e-insieme-di-lavoro-misurati"></a>

# GET: measured byte costs and working set

C4 campaign of 2026-10-23 under
[preregistered method](get-costi-metodo.md), on Apple M4 ARM64, 16 GiB,
Darwin 27.0.0, SBCL 2.6.9, safety 3. Base `93a24872`, new uncommitted tool
and method included in before/after hashes. External load,
scheduler, CPU caches uncontrolled; no concurrent writer.
No change to product GET path or integrity checks.

<a id="risposta-alla-diagnosi-iniziale"></a>

## Response to initial diagnosis

Starting figures are from
[GET campaign of October 11](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-get-performance/risultati.md):
throughput includes bytewise comparison, sentinels, clock, cleanup.
[Product CRC](../../src/foundation/crc32c.lisp) already slicing-by-8;
[cache copies](../../src/cache/read.lisp) use specialized u8 arrays.
“Byte-at-a-time CRC or generic copy” diagnosis does not describe code.
Isolated measurement nevertheless confirms CRC as first optimization candidate.

Medians of five replicates, microseconds per operation:

| Value | Body CRC | PUT verification | Two copies | Oracle | Copy/verify/copy | Pipeline with oracle |
|---:|---:|---:|---:|---:|---:|---:|
| 16 B | 0.050 | 0.206 | 0.021 | 0.032 | 0.217 | 0.253 |
| 256 B | 0.378 | 0.549 | 0.046 | 0.319 | 0.582 | 0.876 |
| 4096 B | 5.798 | 5.976 | 0.402 | 4.279 | 6.358 | 10.611 |

For 4096 B value, CRC actually processes 4112 B, about **709 MB/s**
decimal. Both copies cost about fourteen times less than CRC alone
in this hot fixture. Full-verification pipeline reaches about
157 thousand operations/s; including oracle lowers to about 94 thousand.
Microbenchmarks, not new full-GET performance: exclude
EBR, index, resolver, cache seqlock, syscalls, per-request clock.
Times neither subtracted from historical measurements nor used to predict
database acceleration factor from their ratio.

Operational conclusion: next experiment must compare faster CRC32C
with current one, retaining safety, incremental checksum,
ranges, CSN, corruption detection. Copy is not first intervention
justified by these measurements. An ISA-specific native/SBCL backend
requires availability verification, fallback, disassembly, new ADR
before entering product. Not implemented in this campaign.

<a id="leffetto-della-cardinalità-è-osservabile"></a>

## Cardinality effect is observable

Medians of five replicates. Nanoseconds per complete lookup attempt,
including cursor selection, status check, CSN/location on
hits; not latency of an individual DRAM access.

| Keys | Index payload | Directory | Eight hot keys | Uniform hit | Uniform miss | Hash + uniform hit |
|---:|---:|---:|---:|---:|---:|---:|---:|
| 1,024 | 114.01 KiB | 8 B | 97.4 ns | 113.9 ns | 86.9 ns | 155.4 ns |
| 65,536 | 7.125 MiB | 128 B | 97.8 ns | 154.7 ns | 110.8 ns | 193.5 ns |
| 1,048,576 | 114.002 MiB | 2 KiB | 102.4 ns | 361.0 ns | 143.7 ns | 438.4 ns |
| 4,194,304 | 456.008 MiB | 8 KiB | 101.6 ns | 437.0 ns | 232.3 ns | 589.1 ns |

At maximum cardinality, uniform hit costs **4.30 times** eight-key
case in same index. Ratio between medians, not a confidence
interval. Uniform hit reaches 2.288 million attempts/s;
including XXH64, 1.697 million. Miss reads no live-slot payload/key
when fingerprint differs: same cost as hit
not expected.

Corpus has real digests and directory with 1024 distinct fragments;
not fake table directly indexed by ordinal. Every uniform
window visits all keys. Average load 50%, arena reserved
for C keys: not measurements at 7/8 saturation, during split or compaction.
Driver checks every key and five fields before/after windows.

Maximum index + fixture payload **679,485,440 B**, about 648 MiB;
whole-process peak RSS **1,386,151,936 B**, about 1.291 GiB,
observed by `/usr/bin/time -l`. Peak includes startup, runtime,
garbage; not RSS per cardinality. Index process
takes 46.85 s; byte process 14.77 s. Overall times outside
window definition. Beyond-RAM working set not measured.

Observed growth consistent with memory-hierarchy cost,
but does not identify LLC misses, TLB misses, DRAM access count, or DRAM latency:
hardware counters and environmental control required. One hundred million
keys, Zipf distribution, more readers, concurrent writer, paged cache,
RAM pressure, cold storage remain distinct campaigns. Data does not
yet qualify c0rvus capacity.

<a id="verifiche-e-provenienza"></a>

## Verification and provenance

- 90 byte windows, 5,898,240 operations; 80 index windows,
  115,343,360 attempts. All complete, no discarded replicate.
- **170/170 performance windows with zero Lisp heap delta** and no
  `:retry-limit` outcome. Does not mean universal absence of allocation,
  absence of internal attempts, or GC/OS guarantee.
- Both campaigns pass 23 preliminary bounded windows and internal
  negatives; sensor detects at least 4 MiB live.
- CLI negative: altered expected checksum, window preserved with zero
  completions, failed report and exit 1, stable sources. Expected
  failure, separate from performance data.
- Separate C4 compilation without warnings/style-warnings; no C1 change.
  First and second author static readings: record shape, digest
  domain, budgets, cursor period, ownership, sink, clock separation.
  Not independent review.

First self-check precedes addition of explicit miss-output-immutability
check; final version self-checked in both
campaigns. Additional self-check launched without external record
preserved as ancillary data, not basis of quantitative conclusions.
Records, both source versions, raw data, median derivation,
static checks preserved in
[campaign catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-23-get-costs/catalogo.lisp).

Writer-free readings and historical scaling do not demonstrate lock-freedom.
Distinction among resident lookup, safe page acquisition,
and I/O still applies: no progress property promoted by
benchmarks. Automatic resident/paged selection remains
[automatic-index design](indice-automatico.md), separate from diagnosis.
