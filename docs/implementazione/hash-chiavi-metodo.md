<a id="hash-delle-chiavi-contratto-e-metodo-c4"></a>

# Key hashing: contract and C4 method

Preregistration on 2026-10-11 for
[key-hash-bench.lisp](../../tools/key-hash-bench.lisp), under COD-60/61
of the [coding standards](../affidabilita/standard-di-codifica.md).
This document fixes tests to run only on the parent's instruction,
after source freeze. Driver implementation and compilation
are not performance results. The parent owns `src/hash` and
ASDF integration; this work concerns only the driver and method.

<a id="algoritmo-e-api-fissata"></a>

## Algorithm and fixed API

The normative source is **XXH64 Algorithm Description** in the
[official xxHash v0.8.3 specification](https://raw.githubusercontent.com/Cyan4973/xxHash/v0.8.3/doc/xxhash_spec.md).
Use original XXH64: arithmetic modulo 2^64, little-endian lanes,
32-byte stripes with four accumulators, convergence, length
addition, 8/4/1-byte tails, and final avalanche. The complete canonical
value is big-endian; the API returns the two words separately.

```lisp
(arcdocdb.hash64:xxh64 buffer start end seed-high seed-low)
;; => EXACTLY two values: high u32, low u32
(ftype (function (t t t t t)
                 (values (unsigned-byte 32) (unsigned-byte 32) &optional))
       arcdocdb.hash64:xxh64)
```

`buffer` is a simple specialized u8 vector. `start` and `end` are
nonnegative fixnum integers. Span is `[start,end)`, **0..65535 bytes**,
both extremes included: the hash primitive permits empty input. Seeds
are two explicit u32s; mathematically `seed = seed-high × 2^32 + seed-low`.
Likewise digest is `high × 2^32 + low`. All returned u32s are
immediate fixnums on SBCL64. No boxed u64, list,
result object, or additional values are returned, even NIL.

The success path retains no state and modifies no buffer
byte. Expected heap inside serial windows: **zero**, without subtracting a
baseline. Rejections precede the kernel in this order:

| Check | Condition and reason |
|---|---|
| Buffer type, index type/sign/fixnum, u32 seeds | `INVALID-ARGUMENT :hash-arguments` |
| `check-range`: `0 <= start <= end <= length(buffer)` | `INVALID-ARGUMENT :buffer-range` |
| `end - start > 65535`, after valid range | `INVALID-ARGUMENT :hash-span-limit` |

Public FTYPE accepts five `t` arguments: wrong arguments reach
explicit checks and the expected condition. The driver checks FTYPE
registered by SBCL after ASDF and uses generic calls in negative fixtures.

XXH64 is [noncryptographic](https://raw.githubusercontent.com/Cyan4973/xxHash/v0.8.3/doc/xxhash_spec.md):
it promises no protection against intentional collisions or hostile inputs. Explicit
seed allows repeatability and caller isolation; generation,
persistence, distribution, and rotation of database seeds remain future
work. These tests do not qualify database integration, key comparison
after collisions, DB throughput, or storage/NVMe performance.

<a id="caricamento-cli-e-budget-finiti"></a>

## Loading, CLI, and finite budgets

Before **any clock**, including sensor clocks, the driver loads
RUN system `arcdocdb` with `asdf:load-asd` and `asdf:load-system :force t`.
Product compilation warnings and failures cause an error. The
process must be SBCL64 without SB-COVER; coverage collection is disabled.
Product symbols are resolved with `find-symbol` only after load.
The ASDF test suite is not loaded.

| Invocation | Work |
|---|---|
| `--self-test DIR/` | Sensor, negative metrics, alias/freeze/rereading and cold functional fixtures |
| `--negative-fixture DIR/` | Metric without `:completed`; `:failed` report, exit **1** |
| `--bench DIR/ [--parallel] [count]` | Self-verification and serial matrix; with flag, 1/2/4-worker matrix too |

`DIR/` is mandatory and must end in `/`. A relative path is
resolved from the driver's worktree root. `mkdir` creates an exclusive
0700 directory; an existing path, even empty, is rejected.
`count` is a decimal integer **20000..100000**, default **20000**.
The two optional benchmark arguments may appear in either
order, once only. No campaign starts without a CLI mode.

The matrix includes **0, 1, 7, 8, 16, 31, 32, 33, 64, 256, 1024, 65535**
bytes, with zero seed and maximum u64 seed (`#xffffffff`, `#xffffffff`). Every
configuration has five replicates. Counts are determined by
length, never observed times:

| Lengths | Divisor | Iterations with count=20000 | maxIters with count=100000 |
|---|---:|---:|---:|
| 0..64 in matrix | 1 | 20000 | 100000 |
| 256 | 4 | 5000 | 25000 |
| 1024 | 16 | 1250 | 6250 |
| 65535 | 1024 | 20 | 98 |

Formula: `ceiling(count/divisore)`; warmup per replicate and worker:
`min(256, iterazioni)`. The report retains these counts and preregistered
maximums. Serial benchmark produces **120** metrics; parallel
adds **360** group metrics with **840** nested worker results.
Iterations are not automatically increased when clock resolution is low.

<a id="fixture-oracolo-e-finestre-seriali"></a>

## Fixtures, oracle, and serial windows

Every replicate prepares a simple buffer of length `lunghezza+8`, with three
prefix bytes and five suffix bytes: the main span starts at offset 3.
Byte at index `i` is `(131*i + floor(i/251) + 17*worker) mod 256`.
A copy of the entire buffer, including padding, is retained.

The cold oracle is an independent specification translation using generic
CL integers with modulo 2^64 masks. It uses neither product helpers nor results.
It may allocate bignums **outside measurement**. Three static zero-seed anchors
also check the oracle: empty `EF46DB3751D8E999`, `a`
`D24EC4F1A98C6E5B`, `abc` `44BC2CF5AD770999`.

Self-verification checks 24 main fixtures, retries them in reverse
order to detect residual state, exercises 24 spans with offsets 0/1/8 on
lengths 0/32/33/65535, and two truly empty vectors. It checks exact
return-value count with `multiple-value-call`, without MV-LIST.
The 26 rejection fixtures cover non-simple/non-u8 buffers,
negative/fractional/float/bignum indices, invalid seeds, reversed or out-of-buffer
ranges, span limit, and check precedence.

For every replicate the driver verifies the fixture, runs warmup, rechecks
digest and buffer, performs full GC, then opens the window. One actual hash
per iteration returns two u32s, compared with expected words and
retained in sinks; completion updates with fixnum counters.
Time includes call, API validation, comparison, and counter
updates. No multiple-value lists, boxed u64 digests,
fixtures, or reports are created inside the clock; neither oracle nor explicit GC runs.

After the clock, the driver recalculates the independent digest on the copy,
rechecks the call, and compares every byte. Serial gate requires
whole-process heap **exactly zero** in all 120 windows.
Every kernel return is compared: errors cannot cancel out
in an XOR sink over an even iteration count.

<a id="parallelismo-e-metriche"></a>

## Parallelism and metrics

Each worker owns separate buffer, copy, seed, raw data, and sinks. For
worker `w`, starting from base word zero or `#xffffffff`, seeds are:
`high = base XOR ((w * #x9e3779b1) mod 2^32)` and
`low = base XOR ((w * #x85ebca77) mod 2^32)`. Worker zero matches
the serial fixture; others have different bytes and seeds.

Main verifies fixtures before creating threads. Every worker
runs warmup and cold verification, signals ready, and waits for start for at most
30 seconds. One absolute 30-second deadline bounds ready/join
for the replicate. Only one GC precedes gate opening. Cleanup terminates
only still-live driver threads and limits every join to two seconds
(at most four threads). Errors, readiness, and joins are captured in the
report; main reads raw data only after quiescence. Timeout remains a
failure even if cleanup succeeds.

Counter `get-bytes-consed` is **process-global**. In parallel,
only main reads it, from before start until after joins: it includes
orchestration. No per-worker heap measurements are summed. Local worker
ticks are diagnostic; group rates use global time,
sum of completed calls, and sum of bytes hashed. Parallel work
does not receive the serial zero-heap gate.

Schema 1 metrics retain kind, workload, status, length, seed,
replicate, worker, requested/completed iterations, bytes, heap, original ticks,
seconds, time quality, sinks/expected values, immutability, and diagnostics.
`ns/call = secondi * 1e9 / chiamate`; `byte/sec = byte / secondi`.
For an empty span bytes are zero. With zero ticks: `:below-resolution`,
zero seconds, and **both rates NIL**, present in schema.
No invented speed, baseline subtraction, or performance,
scaling, or p99 thresholds. External load remains uncontrolled.

<a id="sensore-freeze-e-persistenza"></a>

## Sensor, freeze, and persistence

The sensor requires zero heap on 20000 empty cycles. Positive control
allocates **four 1 MiB u8 vectors**, retains them until verification, and
requires at least 4194304 observed bytes. No sensor data is hash
performance. Tool fixtures remove every mandatory
field, inject 12 negative metrics, reject positive heap at the zero
gate, and check failed status/code 1 for missing completion.

`:metrics` exists from the start. Publication copies conses and strings:
aliases to the report head see new records, but subsequent producer
changes to sublists/strings do not alter copies.
A successful report must have all replicate identities in
order, no duplicates, and exact counts. A failed run retains
collected metrics, including the deliberately incomplete metric.

Before RUN compilation, the driver snapshots SHA-256 of ASDF sources,
ASD, driver, evidence reader, and this method; it checks
the same snapshot after load and at run end. The snapshot is
in the report. The parent freezes these sources before the campaign and
records commands through [record-command.lisp](../../tools/record-command.lisp).

`self-test-sensor.lisp` and `report.lisp` are snapshots written **once
only**, with `:if-exists :error`, in the exclusive directory. Both are
reread through [evidence-storage.lisp](../../tools/evidence-storage.lisp),
without evaluating Lisp from data, compared in full, and validated again.
Every error gives a file/rule diagnostic and nonzero exit;
a persistence/rereading error remains process failure.
Abrupt interruption may leave a directory without a final report:
existence alone does not prove success.

Preregistered commands, **to run only on the parent's instruction**,
from the worktree root, each with a new directory:

```sh
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- sbcl --noinform --no-userinit --no-sysinit --script tools/key-hash-bench.lisp --self-test spikes/out/key-hash-self-test/
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- sbcl --noinform --no-userinit --no-sysinit --script tools/key-hash-bench.lisp --negative-fixture spikes/out/key-hash-bench-negative/
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- sbcl --noinform --no-userinit --no-sysinit --script tools/key-hash-bench.lisp --bench spikes/out/key-hash-bench-serial/ 20000
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- sbcl --noinform --no-userinit --no-sysinit --script tools/key-hash-bench.lisp --bench spikes/out/key-hash-bench-parallel/ --parallel 20000
```
