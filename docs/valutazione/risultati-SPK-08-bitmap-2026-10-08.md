<a id="spk-08--bitmap-e-codice-generato-2026-10-08"></a>

# SPK-08 — bitmaps and generated code, 2026-10-08

[Assessment](README.md) · [Preregistered method](../../spikes/SPK-08-generated-code/metodo-bitmap.md)

> **Proposal** — Extension of SPK-08 tests: counting common bits
> in two bitmaps with identical content, by byte or by u64 words.
> No optimization introduced into the engine.

<a id="evidenze-e-correttezza"></a>

## Evidence and correctness

Apple M4 ARM64, SBCL 2.6.9, Darwin 27.0.0, `safety 3`, external load
and cache uncontrolled. Environment, command, revision, and before/after sources
are in the [original records](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-bitmap/catalogo.lisp).
The [final benchmark](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-bitmap/benchmark.lisp)
includes CHECK, disassembly, and 90 samples; sources are stable.

Checks compare kernels with an independent bit-by-bit oracle:
24 fixtures, sizes 0/8/16/128/8192/65.536 bytes, zero, all ones, mixed,
alternating, and high bits. Passed 30 type, length, and parameter rejections.
Byte/u64 layouts match byte for byte in little endian and inputs
remain unchanged, including after rejections and each matrix cell.
Final compilation and loading without warnings or style-warnings.

Two failed attempts remain in the catalog. The first failed during
disassembly collection because `*print-readably*` prevented printing
internal compiler objects; text is now collected with that
variable disabled. The second stopped the benchmark before samples:
the 64 KiB positive-control array did not pass the counter
check. Before repeating the test, payload was set to 1 MiB.
The final sensor observes 1.048.592 consed bytes for that observable payload;
kernels, inputs, and matrix were not changed to select a measurement.

<a id="misure-locali"></a>

## Local measurements

Five replicas per size/dataset/kernel; alternating order. Every
sample traverses 16 logical MiB of the two inputs, with fixed pass counts from
128 to 65.536. Packing, oracles, warmup, GC, and reports are outside the loop.
Each count feeds a checked sink. The empty call in the same
loop measures 262 ticks for 65.536 passes, about 4,00 ns/pass; its
cost is retained and not subtracted from kernel timings.

Medians of five replicas; ratio is the median of comparisons
paired by replica. MiB/s denotes logical bytes of both processed arrays;
spread and raw samples are in the
[derived comparison](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-bitmap/comparison.lisp).

| Bytes per bitmap | Dataset | Per byte, MiB/s | Per u64, MiB/s | u64/byte ratio |
|---:|---|---:|---:|---:|
| 128 | mixed | 1618,61 | 10012,52 | 6,17 |
| 128 | zero | 1644,40 | 10389,61 | 6,32 |
| 128 | all ones | 1650,85 | 10050,25 | 6,11 |
| 8192 | mixed | 1891,25 | 14773,78 | 7,80 |
| 8192 | zero | 1897,53 | 15094,34 | 7,98 |
| 8192 | all ones | 1888,80 | 14773,78 | 7,81 |
| 65536 | mixed | 1852,28 | 14571,95 | 7,87 |
| 65536 | zero | 1889,91 | 15122,87 | 8,01 |
| 65536 | all ones | 1890,36 | 14678,90 | 7,75 |

All 90 loops record zero delta for `get-bytes-consed`, like the
baseline. This is an SBCL sensor observation in these samples; the positive
control does not demonstrate sensitivity to every individual small allocation.
Minimum u64 sample duration exceeds 1 ms; recorded clock resolution
is one microsecond. No percentiles or timing guarantees are deduced.

<a id="codice-generato-e-raccomandazione"></a>

## Generated code and recommendation

The byte kernel has two `LDRB` loads; the u64 kernel has two 64-bit
word loads. Both use `AND` and sequence `FMOV`, `CNT .8B`,
`UADDLV` for single-element popcount. The latter handles eight bytes
per iteration and reduces loads, counts, and iterations.
No loop vectorized across multiple words or `LDR Q` loads is observed.
Type, range, and overflow checks remain present; on the kernels' normal
path u64 values stay in registers without visible bignum boxing.

[Contrib diagnostics](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-bitmap/simd-availability.lisp)
confirm NEON available in installed SBCL; inventory finds
no public popcount API in `SB-SIMD-NEON`. This does not prevent the compiler
from internally using `CNT` for scalar `LOGCOUNT`.

> **Proposal** — For bitmaps already represented as u64 words, the typed
> scalar kernel is a candidate to profile in the engine before introducing
> explicit SIMD. Measured advantage excludes layout conversion.
> ADR-0012 and INV-X1 still apply: microbenchmarks do not demonstrate that
> the operation is a database hot path.

x86-64, datasets beyond RAM, concurrent access, engine cache,
queries, and conversion costs are missing. Fingerprint and mask tests
remain in the [separate result](risultati-SPK-07-08-2026-10-08.md).
