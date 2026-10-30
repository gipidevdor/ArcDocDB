<a id="crc32c-scelta-del-kernel-e-conferma-del-get-da-4-kib"></a>

# CRC32C: kernel selection and confirmation of 4 KiB GET

Local campaign dated 2026-10-23: Apple M4, SBCL 2.6.9, safety 3,
[preregistered method](../../spikes/SPK-08-generated-code/metodo-crc32c-unroll32.md).
The **16-byte** product kernel from
[ADR-0059](../adr/0059-crc32c-arm64-sbcl.md) is retained, with portable loading
under [ADR-0060](../adr/0060-crc32c-caricamento-portabile.md).
32 B variants remain in spike: no change to `src/` or ASDF.

<a id="confronto-dei-kernel"></a>

## Kernel comparison

Two complete campaigns of 240 windows each, four methods, two offsets,
six sizes, five replicates. The second includes both explicit assertions
present in product; it is the basis of selection. First
is preserved in full, alongside preceding source. Mean unit times
per window, median of five replicates, without subtraction.

Second campaign, offset 24 as record body; nanoseconds per CRC:

| Bytes | Software | Product 16 B | 32 B, byte tail | 32 B, 4/1 B tail |
|---:|---:|---:|---:|---:|
| 16 | 23.36 | **11.91** | 20.29 | 44.99 |
| 64 | 78.01 | **14.76** | 15.33 | 15.88 |
| 256 | 347.87 | **34.49** | 35.37 | 34.59 |
| 4096 | 5762.41 | 734.12 | **724.26** | 726.02 |
| 4112 | 5786.15 | **738.96** | 746.52 | 770.40 |

A 4 KiB document body with a 16 B key is **4112 B** long.
At this size, both variants worsen; at 4096 B gain
is about 1%, below preregistered 15%. The 4/1 B tail candidate also worsens
at 64 B by more than 5%. Promotion or candidate GET
campaign does not proceed. Current kernel is already below one microsecond and is
simpler to verify. The hypothesis of reaching 0.45–0.5 µs through this
unrolling is not confirmed; these data do not demonstrate that all
remaining cost is due to loop control. PMULL is not introduced.

All **480 CRC windows** are complete, with correct sink and zero
heap delta. Raw data also preserves offset zero, 65536 B, individual
samples, CPU time, disassemblies, positive and empty sensors.

<a id="integrità-e-selezione"></a>

## Integrity and selection

Each complete run verifies **13,536 cases** of length/offset/seed,
with all small splits and 4/16/32 B boundaries, against software and
independent bitwise oracle. Literal ASCII vector `123456789`
returns `E3069283` for all kernels and oracle; it is also present
in already-integrated product tests. Negative changes expectation and ends
with exit 1. Ranges, immutability, corruption, and excluded bytes verified.

Driver reads candidate only after product backend has
been qualified and selected at runtime. In a fresh process with forced
software it is `:unsupported`, public CRC remains Lisp, and candidate or SIMD
package are not loaded. OS/CPU/version checks and product fallback
remain those already verified. No new ISA,
platform, SBCL, or concurrency qualification derives from spike.
[Product CI suites](https://github.com/gpicchiarelli/ArcDocDB/actions/runs/40010510208)
for commit `d8ac5c2f` passed on Linux x86-64 and macOS ARM64.

<a id="get-completo"></a>

## Complete GET

[A/B driver](../../tools/get-throughput-bench.lisp) remained unchanged:
same real GETs, fixtures, API, EBR, and counters. Five replicates, values
16/256/4096 B, cache hit/hot segment/absent, CSN 7/maximum u64,
software/selected kernel, and exact/throughput path.

4096 B cache hit, CSN 7; microseconds per GET:

| Path | Software | Current kernel |
|---|---:|---:|
| Original oracle inside timing (`:exact`) | 14.972 | **9.813** |
| Oracle before/after window (`:throughput`) | 6.716 | **1.647** |

Hot segment with cache disabled measures 2.334 µs on hardware
throughput path. All **360 windows**, 14.4 million GETs, are complete
and have zero heap delta; 72 bounded windows precede measurement. Every
response's integrity remains checked in exact path and suite;
throughput verifies all keys before and after each window. No P99
is inferred from means. Scope is engine backend with hot data;
ARTICLE measurement through protocol and socket remains separate.

<a id="verifica-e-conservazione"></a>

## Verification and preservation

Strict compilation of both new C4 files without warning/style-warning.
Two author readings, separate from independent review and
overall C1 qualification. First C4 driver could not read package
before loading product; corrected by separating bootstrap forms.
First compilation helper reloaded product VOPs twice;
corrected using one initialization in a fresh process. Both
failures and original sources are preserved. No warning suppressed.

[Complete archive: sources, disassemblies, failures, and raw data](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-23-crc32c-unroll32/catalogo.lisp).
