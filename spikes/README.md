<a id="spike"></a>

# Spikes

[Project](../README.md) · [Documentation](../docs/README.md) · [Spike plan](../docs/valutazione/piano-spike.md)

Evaluation-phase experiments. The [plan](../docs/valutazione/piano-spike.md)
defines questions, methods, and outcome criteria; the [evaluation](../docs/valutazione/README.md)
guides readers through campaigns and results. Historical raw data are in the
[external archive](evidence/README.md). V1 and v2 results remain separate.

<a id="regole"></a>

## Rules

- Every test and benchmark follows the [structured record](../docs/valutazione/registro-delle-prove.md), including failures and diagnostics.
- **Common Lisp only** on SBCL ([ADR-0001](../docs/adr/0001-common-lisp-sbcl.md)).
- A spike is disposable code: it is not promoted to production code; at most it informs
  the design.
- One directory per spike: `spikes/SPK-nn-nome/`, containing:
  - `README.md` — question, method, environment (hardware, operating system, SBCL version
    and parameters), exact command, results, recommendation;
  - code and a way to run it from the command line;
  - generated data and output in `data/` and `out/` (Git-ignored).
- On completion, update the [risk register](../docs/valutazione/registro-rischi.md),
  [estimates](../docs/valutazione/stime-ordine-di-grandezza.md), and related open question.

<a id="stato"></a>

## Status

`make spikes-check` compiles without warnings and checks correctness in isolated processes;
`make spikes-bench` runs measurements **serially** and records environment, commands,
and output in `spikes/out/`. Outcomes do not automatically promote engine requirements.

| Spike | Status |
|---|---|
| [SPK-01 Compact primary index](SPK-01-primary-index/README.md) | prototype and local verification; 10⁷–10⁸ scale and reference platform pending |
| [SPK-02 SBCL GC under load](SPK-02-gc/README.md) | local campaign; tens-of-GB heaps and reference platform pending |
| [SPK-03 WAL and group commit](SPK-03-group-commit/README.md) | real append/flush and local verification; reference hardware and power-cut tests pending |
| [SPK-04 Logical writer on thread pool](SPK-04-writer-pool/README.md) | pool and models locally verified; 54 benchmarks retained, live load and adaptive scheduler to verify |
| [SPK-05 Segment read path](SPK-05-segment-read/README.md) | pread and mmap with real files, checks, and local comparison; beyond-RAM dataset and reference platform to measure |
| [SPK-06 Compaction interference and controller](SPK-06-compaction-load/README.md) | finite load model verified, concurrent copies and reads locally measured; engine compaction, real feedback, and reference platform to verify |
| [SPK-07 Protocol models](SPK-07-protocols/README.md) | initial finite suite, counterexample corrected by ADR-0046; explicit remaining gaps |
| [SPK-08 SIMD and generated code](SPK-08-generated-code/README.md) | scalar/SWAR and NEON fingerprints with 70 samples; byte/u64 bitmap with another 90 samples at safety 3; x86-64 and concurrent engine to verify |
| [SPK-09 Reliability-check cost](SPK-09-integrity/README.md) | CRC/decoder verified and local benchmark; manifest resolver and engine to implement |
| [SPK-10 V2 limits](SPK-10-v2-limits/README.md) | four modules and in-memory integration verified; separate benchmarks, full gate open |
| [SPK-11 Local Unix socket](SPK-11-unix-socket/README.md) | local interprocess test passed, originals and failures retained; M16 contract proposed, engine qualification open |
