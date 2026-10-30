<a id="crc32c-accelerato-e-get-metodo-della-qualifica"></a>

# Accelerated CRC32C and GET: qualification method

Preregistration of 2026-10-23, after the
[CRC spike](../../spikes/SPK-08-generated-code/metodo-crc32c.md) and before
product measurements. [ADR-0059](../adr/0059-crc32c-arm64-sbcl.md).
All code remains Lisp/SBCL, safety 3, no integrity check removed.

<a id="prodotto"></a>

## Product

The foundation suite compares public API, fallback, and bitwise oracle:
0..128, 255/256/257, 4095/4096/4097, 65535/65536/65537 B; offsets 0..15,
zero/maximum/arbitrary seeds, incremental operation and small splits, ranges,
immutability, bytes excluded from range, and corruption included in range.
Record, GET, cache, WAL, and recovery suites remain mandatory.
Build must have no warnings/style-warnings, and full verification must
pass. The author's two readings are distinct from an independent review.

OS/CPU selection is cold; fallback is also verified through standalone
loader. Disassembly must preserve load bounds checks, CRC32C
on registers, and no foreign calls/boxing in loop. Opcodes
have no mnemonic in installed SBCL disassembler and must be read from bytes.

<a id="get-confronto-ab-sullo-stesso-prodotto"></a>

## GET: A/B comparison on the same product

[get-throughput-bench.lisp](../../tools/get-throughput-bench.lisp) reuses
public fixtures of the [GET benchmark](get-performance-metodo.md) through
C4 loading as a library, without executing its main. Same index, EBR,
resolver, cache, and FD; eight keys, hot data. This is not the cardinality benchmark.

Two CRC kernels, selected product kernel and software, with private binding
to main thread only and automatic restoration after each window.
No change to global function or format; both kernels must
return identical checksums. Selected kernel is recorded.

For each size 16/256/4096 B, CSN 7/maximum u64, and scenario
cache-hit/segment with cache disabled/absent: two driver paths,
five replicates, and two kernels in alternating order per replicate. These are
360 windows of 20,000 GETs, 1000 warmup, **14.4 million GETs** measured.

- `:exact`: original loop, verifies every byte/sentinel/state in timing.
- `:throughput`: GET, outcome/range checks, fresh clock for start/end,
  and cleanup in timing. No driver fill or bytewise comparison.
  Before and after every window, eight GETs with original oracle verify
  all keys, guards, contents, and EBR release. Functional tests and
  `:exact` qualify outputs; this path does not claim independent
  comparison of every byte of every measured response.

Interval is a continuous loop, not a sum of individual timings;
no baseline subtraction. Full GC, fixtures, closures, persistence,
and before/after oracle remain outside timing. Global heap, monotonic ticks,
completions, and sinks are saved even on failure. No thread
created within window. No P99, server/network, commit, or cold I/O.

Bounded self-check: matrix with 8 GETs and 8 warmup, both paths and
kernels, same real-file fixtures. Positive sensor >=4 MiB live,
zero baseline with exact completion/sink. CLI negative forces a wrong
expected value and must preserve failed window and exit 1. Process timeout 900 s,
window timeout 60 s. CLI `--self-test`, `--bench`, `--negative-fixture`, new directory
required. Benchmark first runs self-check; negative
is not a performance measurement. Report written/reread with READ-EVAL NIL.

Command recorded after source freeze:

```sh
sbcl --script tools/record-command.lisp -- sbcl --dynamic-space-size 4096 --noinform --no-userinit --no-sysinit --script tools/get-throughput-bench.lisp --bench spikes/out/crc32c-get-bench-01/
```

Median 4 KiB cache-hit GET must be compared directly with the
2-microsecond objective. A slower result remains published; it is not
deduced from CRC microbenchmark ratios. Measurements and originals are
archived with stable sources, including failed attempts.

<a id="diagnostica-dopo-la-prima-campagna"></a>

## Diagnostics after the first campaign

First full campaign remains preserved: host load rose above 18
on 10 logical CPUs, with strong variability even for absent keys, which do not run
CRC. This variability is not attributed to checksum. Before a second
campaign, process CPU time is added outside wall/heap timer
boundaries. CPU time is diagnostic, not a substitute for wall time or P99.
Second campaign retains all the same cells and replicates; no
selection of results across campaigns. A separate SB-SPROF CPU profile may
identify remaining work but produces no qualified throughput numbers.
