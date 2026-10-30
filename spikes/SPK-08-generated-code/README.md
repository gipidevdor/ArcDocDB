<a id="spk-08--impronte-e-codice-generato"></a>

# SPK-08 — Fingerprints and generated code

> **Proposed** — Local Common Lisp/SBCL evaluation, `safety 3`.
> Variants are experiments: none is introduced into the engine index.

<a id="domanda-e-metodo"></a>

## Question and method

What code does SBCL generate to compare 16 control bytes with a 7-bit fingerprint,
and what cost remains after range checks? Experiment separates scalar comparison,
two u64 words with SWAR, and local SIMD backend. Every result is an exact mask:
one bit per position, without false positives from interbyte borrow.
Empty/deleted control bytes are comparison data; spike implements no probing,
insertion, or seqlock.

Methods recorded before checks and measurements:

- [Scalar and SWAR](metodo-impronte.md), with scalar oracle and borrow mutant.
- [SIMD](metodo-simd.md), NEON on ARM64 and SSE2 branch on x86-64.

The two campaigns' datasets are distinct and declared in methods.
Timing comparisons apply only between methods on the same dataset in the same
campaign. A single-kernel advantage is not a database-throughput advantage.

<a id="riproduzione-e-registrazione"></a>

## Reproduction and recording

```sh
sbcl --noinform --no-userinit --no-sysinit --script tools/run-spikes.lisp --check SPK-08
sbcl --noinform --no-userinit --no-sysinit --script tools/run-spikes.lisp --bench SPK-08
```

`run.lisp` compiles into fresh FASLs per process; warning/style-warning and
`compile-file` warnings/failure values are fatal. Harness retains command,
environment, revision, before/after sources, decoded results, original stdout/stderr,
and failures. Reports remain in `spikes/out/`; cited ones retained in `spikes/results/`.

Native module alone can run with `run.lisp --simd-check` or `--simd-bench`,
using `tools/record-command.lisp`. Missing contrib/backend produces
`:unsupported`, without pretending SIMD verification succeeded.

<a id="ambiente-e-limiti"></a>

## Environment and limits

First platform: Apple M4, macOS ARM64, SBCL 2.6.9, 16 GiB RAM.
Measurements run serially with uncontrolled external load.
No measurements of Linux x86-64, beyond-RAM data, concurrent accesses, index
directory, seqlock, durability, or commit frontier. Two-architecture SIMD gate
remains open until real checks.

<a id="primo-controllo-locale"></a>

## First local check

NEON kernel passes 589,824 comparisons: all 65,536 masks and 128 × 256 × 16
query/control/position cases. Also passes 16 unchanged-input cases and 4 parameter
rejections. Retained disassembly shows SIMD load/comparison.
The [initial record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/native-simd-check-initial.lisp)
retains environment, sources, and original output.

<a id="campagna-integrata-e-benchmark"></a>

## Integrated campaign and benchmark

Scalar/SWAR CHECK passes 3,035,203 groups, 12,140,812 comparisons,
77 negative controls, and 28 mutant witnesses. The
[integrated CHECK](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/integrated-check.lisp)
also reads SIMD result without loading module packages.

The [benchmark](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/spk08-benchmark.lisp)
completes 70 samples, five replications/cell, with zero bytes consed observed in
measured loops. NEON medians: 2.164 ns/group on mixed, 2.168 on all-hit, 2.165
on special bytes without hits. SWAR on prepared u64s measures 4.745/4.791 ns/group
on its own datasets; packing included: 17.319/17.288.
SWAR and NEON matrices use different data: these numbers do not compare the
techniques against each other. Full results, dispersion, allocation sensor,
and recommendation are in the
[report](../../docs/valutazione/risultati-SPK-07-08-2026-10-08.md).

Recommendation: measure all variants in the same index layout, with variable
queries and concurrent accesses, before selecting a kernel.

<a id="estensione-sulle-bitmap"></a>

## Bitmap extension

The [CRC32C method](metodo-crc32c.md) compares software with ARM64 instructions
generated in Common Lisp. [Product integration and results](../../docs/implementazione/crc32c-arm64.md)
remain separate from spike; slower unrolled kernel was not selected.

The later [16/32 B comparison](metodo-crc32c-unroll32.md) also measures 64 B and
actual 4112 B body, with byte or 4/1 B tail.
[Results and complete GET](../../docs/implementazione/crc32c-unroll32.md) confirm
16 B kernel selection. Reproduce through recorder with
`run-crc32c-unroll32.lisp --bench DIRECTORY-NUOVA`; `--self-test` and
`--negative-fixture` verify driver, with unsupported outcome distinct.

The [bitmap method](metodo-bitmap.md) compares common-bit counting in equivalent
byte and u64 arrays. [Results and limits](../../docs/valutazione/risultati-SPK-08-bitmap-2026-10-08.md):
24 fixtures, 30 rejections, 90 local samples with verified sink and unchanged inputs.
Disassembly distinguishes single-element hardware popcount from a vectorized loop.
Integrated harness also runs these checks; `run-bitmap.lisp` permits separate
execution through command recorder.

<a id="confronto-sullo-stesso-buffer-e-sulla-stessa-query"></a>

## Comparison on the same buffer and query

`comparison.lisp` adds a separate campaign: `scalar16`, `packedmask16`, and,
when available, `maschera-simd` receive **the same byte arrays, offsets, and query**.
Little-endian packing remains inside SWAR kernel. Variants on already prepared
u64s are excluded from direct comparison. Earlier historical tests and measurements
remain separate.

```sh
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- sbcl --noinform --no-userinit --no-sysinit --script spikes/SPK-08-generated-code/run.lisp --compare-check
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- sbcl --noinform --no-userinit --no-sysinit --script spikes/SPK-08-generated-code/run.lisp --compare-bench
```

Normal `--check` and `--bench` also include the new campaign. Benchmark requires
an explicit request: `--check` does not run it. Kernels remain Common Lisp/SBCL,
`safety 3`, without custom VOPs/assembly, product changes, or reduced checks.

CHECK plans 20,560 shared windows: all queries 0..127 and offsets 0..15 over eight
patterns; every control value allowed by product (0..127, DELETED=254, EMPTY=255)
in sixteen positions for queries 0/127; final groups ending exactly at array boundary.
Independent oracle sums one power of two per byte matching query.
Entire input compared before/after every window. All buffers of length 0..15 and
all final windows shifted by one byte are rejected: no incomplete tail loaded as vector.

Also planned: 56 negative cases for windows, nonsimple buffers, types, offsets,
and queries, through compiler-opaque calls with verified immutability.
Rejection categories are existing API categories: scalar/SWAR kernels declare H7,
SIMD kernel declares u8 then rejects 128..255. Identical error contracts are not
assumed; any promotion must specify them. Nine negative fixtures verify detection
of deliberately incorrect kernel, deadline, and row, pass, warmup, seconds,
payload, and operation limits.

CHECK limits: 100,000 groups, default 120 seconds (maximum 300), cooperative deadline
also checked after disassembly collection. Actual kernel code and shared loop retained.
Module does not read SIMD packages at reader time. Without contrib/backend,
verifies scalar and SWAR, reporting `:scalar-swar-status :ok` and
`:native-status :unsupported`, overall `:unsupported`. No unsupported instruction
is invoked; gate uses SPK-08's existing backend check.

BENCH uses three datasets (`:mixed`, `:all-hit`, `:special`) of 2,048 default rows:
all 128 queries and 16 offsets, with oracles prepared before measurements.
Five replications per method/dataset, deterministically rotated order;
32 measured passes and two warmup passes. Same loop and indirect call for every
method: **call overhead is included**. Cost of any product dispatcher is not measured.
Records order, verified u32 checksum, raw ticks, operations, ns/group, and bytes-consed
delta; reports, oracles, CHECK, disassembly, explicit GC, and preparation are outside
each sample interval. Observable allocation sensor kept live for whole measurement.
Global SBCL counter delta may include delayed accounting: zero means no observed
increase, not proven absence of allocations. Positive sensor checks a large
allocation, not small-allocation precision.

BENCH limits: 2,048..8,192 rows in multiples of 2,048, 1..1,024 passes,
1..64 warmups, five replications, at most 200 million measured/warmup calls total,
default 120 seconds (maximum 300), maximum payload 4 MiB.
Preflight calculates 72 bytes/row for matrix and copies plus 1 MiB for sensor;
three matrices prepared one at a time. Headers, report structures, runtime, and
memory awaiting GC excluded: limit is not RSS. Deadline is cooperative, at most
8,192 calls between checks during a loop. Unresolved timer, checksum mismatch,
mutation, or exhausted budget fails.

With three methods, default plans 45 samples and 2,985,984 warmup/measurement calls;
without SIMD backend, 30 samples and 1,990,656 calls.
Campaign does not qualify concurrent lookup, control-byte publication order,
barriers, seqlock, or database throughput. No advantage claimed before real
measurements on each intended platform.

The [local campaign of 2026-10-22](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-22-simd-comparison/README.md)
retains comparisons, measurements, failed attempts, and sources. Linux x86-64 check
runs through normal CI `--check`; execution and measurements on that platform remain
to be acquired in this campaign.
