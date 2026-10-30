<a id="spk-08--metodo-del-confronto-simd-a-16-byte"></a>

# SPK-08 — 16-byte SIMD comparison method

> **Proposed** — Microexperiment preregistered on 2026-10-08. Common Lisp/SBCL only,
> `safety 3`. REQ-SIM-001, REQ-SIM-002, REQ-VAL-001; no engine-index or requirement changes.

<a id="domanda-e-contratto"></a>

## Question and contract

Does SIMD comparison of 16 control bytes, followed by reduction to u16 mask,
preserve every exact position and reduce cost against scalar loop?
Queries 0..127; control bytes 0..255 including empty/deleted. Kernel checks full
range before load and reads only a simple u8 array.

NEON: u8.16 load, query broadcast, equality comparison, u64.2 reinterpretation,
high-bit compression. SSE2: same comparison with movemask. Bit order must match
16 bytes, including unaligned loads. SSE2 branch unmeasured on local ARM64 machine.

APIs from [SBCL 2.6.9 manual, §17.11](https://www.sbcl.org/manual/#sb_002dsimd)
and installed contrib sources, consulted before execution. SIMD intermediates
stay inside typed functions; check retains disassembly. Instruction presence
alone does not attest correctness.

<a id="correttezza"></a>

## Correctness

Scalar oracle independent of reduction. Exhaust all 65,536 masks on fixed query
and 128 × 256 × 16 query/control/position combinations. Offsets 8..23 exercise
all alignments modulo 16. Check unchanged input, short buffers, negative/out-of-range
offsets, disallowed queries. Ceiling: 600,000 comparison cases; exhaustion or
unsupported status is not interpreted as successful hardware test.

<a id="misure"></a>

## Measurements

Three preallocated 16,384-group datasets: deterministic mixed bytes, all matching,
and only special controls without hits. Each method reads same bytes with query 42:
256 traversals, 4,194,304 groups per sample. Five replications alternating order,
separate warmup, GC before each sample. Result feeds verified u32 accumulator.

Record raw samples, monotonic duration, operations, ns/group, and `get-bytes-consed`
delta for loop only. Preparation, verification, report collection excluded.
Positive counter control allocates array and makes it observable. No promised
timing threshold; serial benchmarks, uncontrolled external load. Not database GETs;
measure neither seqlock, cache, weak memory, concurrency, nor beyond-RAM data.

<a id="riproduzione"></a>

## Reproduction

```sh
sbcl --script tools/run-spikes.lisp --check SPK-08
sbcl --script tools/run-spikes.lisp --bench SPK-08
```

For module only, use `run.lisp --simd-check` or `--simd-bench` through
`tools/record-command.lisp`. Recorder retains argv, environment, revision,
before/after hashes, result, original output, including failures.
Absent contrib/backend recorded as `:unsupported`.

<a id="primo-controllo-osservato"></a>

## First observed check

The [initial record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/native-simd-check-initial.lisp)
reports SBCL 2.6.9, NEON backend, `:status :ok`: 589,824 comparisons,
16 unchanged-input checks, 4 parameter rejections, warning-free compilation.
Disassembly shows `LDR Q` and `CMEQ`. Later integrated check will verify same
kernels alongside other variants.
