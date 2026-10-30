<a id="spk-08--confronto-delle-bitmap"></a>

# SPK-08 — Bitmap comparison

> **Proposed** — Extension preregistered before compilation and measurements of
> `bitmap.lisp`. No engine or ADR changes.

<a id="domanda-e-correttezza"></a>

## Question and correctness

What does counting common bits in two bitmaps stored in specialized byte or u64
arrays cost? Both kernels return the same count; they neither produce a bitmap
nor represent a database query. U64 layout prepared outside measurements,
explicitly little-endian. Oracle checks each bit separately, without LOGAND/LOGCOUNT.

Simple arrays, equal lengths, zero to 65,536 bytes in multiples of eight;
equivalent word arrays with at most 8192 elements. Bounds/type/length checks,
unchanged inputs; zero, all-one, alternating, deterministic mixed fixtures,
including set u64 high bit. Safety 3, fatal warning/style-warning.
CHECK must pass before benchmark.

<a id="misure-preregistrate"></a>

## Preregistered measurements

Three sizes: 128, 8192, 65,536 bytes per bitmap. Three datasets:
`:mixed`, `:zero`, `:ones`. Two kernels, five replications alternating order:
**90 samples**. Each sample traverses 16 MiB total over both inputs;
passes = 16 MiB / (2 × bytes per bitmap), from 128 to 65,536.
Eight warmup passes per kernel outside measurement. No deadline used as guarantee.
Work is finite, fixed parameters precede execution.

Preparation, packing, oracles, reports excluded. Each result feeds a fixnum sink
checked against expected count × passes. Monotonic time and `get-bytes-consed`
delta delimit controller loop only; GC before every sample, no load workers.
Retain empty-call cost with same loop, without subtracting from samples.
Positive control allocates an array and makes it observable: a counter missing
it fails test. Zero delta is no guarantee.

> **Proposed** — Positive-control revision after first benchmark attempt, stopped
> before samples: 64 KiB array fails sensor check. Before next run, control payload
> fixed at 1 MiB, errors include observed delta. Kernels/matrix unchanged;
> first failure retained.

Disassembly of both kernels and actual loop recorded as report text.
Distinguish SIMD instruction for one LOGCOUNT from a loop processing multiple
elements simultaneously. Contrib diagnostics record availability/APIs without
inferring support for unexported operations or other-architecture performance.

<a id="riproduzione-e-limiti"></a>

## Reproduction and limits

```sh
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- sbcl --noinform --no-userinit --no-sysinit --script spikes/SPK-08-generated-code/run-bitmap.lisp --check
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- sbcl --noinform --no-userinit --no-sysinit --script spikes/SPK-08-generated-code/run-bitmap.lisp --bench
```

Runner/sources separate from existing fingerprint/SIMD modules.
Per-process FASLs under `out/`. Output: one outcome plist; recorder retains
command, environment, before/after sources, stdout/stderr, including failures.
Cited records retained in `spikes/results/`.

First local platform: Apple M4 ARM64, SBCL 2.6.9; actual environment in report.
Small heap-resident arrays, uncontrolled cache/external load. No x86-64,
beyond-RAM, I/O, or concurrency measurement. Packing excluded: u64-layout
advantage applies only when layout already available.
No experimental-code promotion or optimization without engine profiling,
under INV-X1 and ADR-0012.
