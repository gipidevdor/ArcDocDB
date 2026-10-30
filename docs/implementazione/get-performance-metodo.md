<a id="metodo-preregistrato-del-benchmark-get-corrente"></a>

# Preregistered method for the current GET benchmark

Implementation complementary to the GET functional suite, with independent package
`arcdocdb.get-performance.bench` and fixture built only through APIs of
system `arcdocdb`. It loads neither `arcdocdb/tests` nor depends on suite
`tests/get-performance`. Tool: [get-performance-bench.lisp](../../tools/get-performance-bench.lisp).
This document and tool are delivered to the parent without running tests,
compilation, or benchmarks. Every result requires recorded execution after
freeze; no observed performance is reported here.

<a id="preregistrazione-prima-delle-misure"></a>

## Preregistration, before measurements

| Parameter | Fixed value |
|---|---|
| COUNT | 20,000 GETs per worker per window |
| Warmup | 1,000 GETs per worker before every window |
| Replicates | 5, identified 0 through 4 |
| Keys | 16 bytes; 8 present and 8 absent |
| Values | 16, 256, 4096 bytes |
| CSN | 7 and `#xffffffffffffffff`, in all cases |
| Serial | main, 1 context, without thread creation |
| Parallel | separate threads, 1/2/4 workers |
| XXH64 seed | high `#x01234567`, low `#x89abcdef` |
| Segment | v2, ID 17, compaction origin, non-prepared PUT, flags 0 |
| Index | capacity 16, 128 B arena, depth 0 |
| Cache | 1 set, 8 slots; class 1024 B or 8192 B |

No CLI argument changes COUNT. There is no automatic calibration,
post-timing count inflation, GET retry, or replicate selection.
Maximum CSN traverses the current path through the specialized
u64 slot and verifier receiving high/low u32: the driver does not read CSN into
a generic object inside the loop. Its cold allocations are outside
windows. Heap observations remain global without attributing any
bytes to boxing or a particular component.

The matrix contains 18 cells (3 sizes × 2 CSNs × 3 cases), 90 serial
windows and 270 threaded windows. There are 14,400,000 measured GETs and 720,000 warmup
GETs, with identical per-worker load in serial and parallel. The single
report keeps `:serial` and `:parallel` distinct and checks the exact matrix,
including counts, missing configurations, and duplicates. The self-test's 72 bounded
windows use 8 GETs per worker and 8 warmup GETs: they are tool self-verification,
not performance results or an alternative COUNT. Every self-test window
is persisted before validation: even failure preserves partial
metrics and a diagnostic with `:failed` status.

<a id="percorsi-inclusi"></a>

## Included paths

1. **Cache hit**: current `avvia-get`, EBR entry, key XXH64,
   index lookup, synthetic resolver, `sonda-cache-get`, cache-to-scratch
   copy with seqlock and CRC32C/key/CSN/flag verification,
   `copia-valore-get` to private output, `concludi-get` with fresh time,
   EBR release, and external cleanup. Every probe must be `:hit`: a miss
   invalidates the window and does not become a segment read.
2. **Segment, cache disabled**: same start/EBR/XXH64/index;
   `sonda-cache-get` must be `:disabled`, then `leggi-record-get` must
   return source `:segment`, cache `:disabled`, insertion
   `:not-attempted`, no eviction/scan. Includes exact native `pread`,
   complete PUT verification, private copy, and completion.
3. **Current absent**: start, EBR, XXH64, confirmed absent lookup, and
   `:absent` completion with zero bytes. No cache probe, CRC, or I/O;
   every output byte must retain the sentinel.

These are actual calls to the current GET module. The fixture resolver binds
an already verified segment and an immutable frontier calculated at construction;
it does not measure manifest lookup, queues, writer forwarding, inter-pool migration,
network, or response serialization. It performs no snapshot, history, prepared-record,
or recovery work. Frontier is not inferred from stat/file size. Cache and segment
views share index, scope, and FD; each segment capability is
bound to its view, as required by the GET contract.

<a id="fixture-ownership-e-verifica-nel-ciclo"></a>

## Fixtures, ownership, and per-loop verification

Six fixtures (size × CSN) are built and kept live before
windows. Construction writes header and eight PUTs to exclusive `.tmp` files,
publishes eight slots, and populates all eight cache slots, checking
returns. The append file is closed and reopened read-only; the header is
read and verified on the same FD used by GETs. No flush is called:
the fixture represents committed data under a local contract and does not demonstrate
publication or durability of an actual commit.

Both opens use `max-transfer = max(64, record-size)`: the record
for a 16 B value occupies 56 B, but header append and read require
64 B. The file limit remains calculated frontier `64 + 8 × record-size`;
the correction adds no bytes to fixtures or GET windows.

Every fixture has one canonical scope, a four-worker EBR registry, and
an empty snapshot registry. Four GET contexts, with worker-id 0/1/2/3,
have separate scratch, output, and EBR announcements. Index, keys, expected values,
frontier, and read-only capability are stable; hits write only cache-permitted
warmth/reread bytes. No concurrent writers,
window insertions, epoch/root changes, or evictions. Workers start in
different orders and cycle through all eight keys in the same cache
set. Contexts are reused only after join and quiescence.

Warmup runs on main, with exclusive ownership of each context,
before handing it to a thread. It warms the same path and page cache,
but not the new thread's runtime. Page cache is not emptied: the segment
case measures reads of a small already-read set without certifying that
every syscall avoids physical I/O under external memory pressure.

Every iteration fills output with sentinels, requires correct outcomes and sizes,
copies only on a hit, completes with new time, and checks IDLE
state, free EBR announcement, and two output guards. It checks every byte,
not merely a replicate's last result. An `unwind-protect` abandons
GET even on error. Completion and checksum increase only
after these checks and cleanup. For found, contribution is `1 + sum of bytes`; for absent, `2 + 215 × size`. The oracle is calculated from
cold-generated values; COUNT and warmup are divisible by eight, so every
worker must obtain the same expected checksum. Bytewise verification
prevents a sum collision from accepting a wrong value.

Time and heap also include sentinels, bytewise oracle, checksum,
fresh clock per GET, EBR/state observations, cleanup, and driver
counters. These measurements describe that complete cycle with its checking
cost; they are not isolated primitive costs.

<a id="finestre-contatori-e-ambiente"></a>

## Windows, counters, and environment

Time uses `get-internal-real-time`, SBCL's monotonic base in units recorded
in the report, not calendar time. The tool records original ticks, seconds,
time quality, and completed operations per second. Zero ticks remains
`:below-resolution`, zero seconds, and NIL rate; no rate is invented. Calendar time
is used only for metadata and run names.

`sb-ext:get-bytes-consed` is read once before and once after the
window on main. It is a whole-process counter, including worker
allocations and runtime activity; it is neither live heap, RSS, nor reserved
memory. Per-thread heap measurements are neither read nor summed. Timer
and heap counter have a small misalignment from read order:
tick-start, heap-start, heap-end, tick-end. Record construction,
formatting, persistence, and explicit GC are outside windows. Automatic GC
during a window is included.

Main performs full GC before each window; fixtures, closures,
thread names, raw data, semaphores, and outputs are already allocated. **Serially**, main
runs only the loop and diagnostic boundary. **In parallel**, including
the one-worker case, time and heap start before `make-thread`: they include
thread creation/initialization, ready, gate opening, start wait,
loops, joins, and quiescence check. The same global window covers all
workers; rate aggregates COUNT × workers. This is not throughput of a
persistent pool with startup excluded. Campaign order is fixed:
all serial, all parallel; increasing values, CSN 7 then maximum,
cache/segment/absent, replicates 0..4, workers 1/2/4.

The report records Lisp implementation/version, machine, OS/version,
directory, driver policy, and timer units. The parent retains argv,
complete host environment, commit, working tree, and source blobs before/after
through `record-command.lisp`. CPU/frequency, external load, CPU cache,
scheduler, and memory pressure are uncontrolled. No P99,
client latency, sustained I/O, NVMe, durability, or overall DB throughput is claimed.

<a id="diagnostiche-sensore-e-limiti"></a>

## Diagnostics, sensor, and limits

`--self-test` loads only the product system; compilation warnings are
`COD-01` failures, excluding normal SBCL redefinition-warnings. Driver diagnostics
include file and rule; GET errors stop the loop and
are preserved with partial completion/checksum. They are not retried.
Failed windows remain in the report and the process exits with code 1.

Sensor self-verification runs 20,000 empty cycles with correct checksum/completion
and zero heap. It then allocates four 1 MiB u8 arrays, retains them, and
requires at least 4 MiB observed by the global counter. It saves and rereads
`self-test-sensor.lisp`. Empty control is not subtracted from GETs and is not
applied as a zero-heap gate to GET performance.

Diagnostic self-verification rejects missing fields, negative counters, incorrect worker
outcomes, completion, or checksums, and inconsistent times/rates; it checks
zero ticks, metric copying through aliases, and conversion of an error to
failed status/exit 1. A positive report may have heap above zero.
`self-test-metrics.lisp` retains 72 independent cases and diagnostics.
`--negative-fixture` deliberately omits `:completed` from a metric:
the parent must observe failed report and exit-code 1 without loading the product.
`--negative-self-test` instead removes `:completed` from the first real
self-test window: it requires exit 1 and `self-test-metrics.lisp` with failed status,
a partial window, and missing-field diagnostic. This test
checks preservation of self-test failure before the campaign.

Preregistered budgets: 600 s for load/fixtures/self-verification/campaigns, 30 s per
window; ready/start/join share the window's absolute deadline.
Watchdog is installed before counter reads. Cleanup terminates
only owned threads and waits at most 2 s per thread, up to four;
a nonquiescent worker prevents consuming raw data and closing the FD. The
process fails without reducing COUNT or declaring a partial campaign
successful. Deadlines are not performance thresholds.

The six fixture files total 72,192 B and are removed
after quiescence, including on failure. Only three plain files are published:
`report.lisp`, `self-test-metrics.lisp`, `self-test-sensor.lisp`, each
strictly below 1 MiB UTF-8. Maximum live size of the owned directory
stays below 4 MiB. The sensor retains 4 MiB payload only in memory;
cache has local payload bounded to 70,000 B per fixture. Budget
excludes system FASL cache or external record-command, managed by the parent.
Report checkpoints occur after every fixture/campaign, outside clocks;
no per-replicate file is created. Persistence and rereading require
data equality, using evidence-storage with READ-EVAL NIL.

<a id="esecuzione-registrata-e-conservazione"></a>

## Recorded execution and preservation

The parent freezes the write set, records blobs, and uses new directories with
prefix `get-performance-bench*` or `get-performance-self-test*`. The
collector must include both prefixes and the three leaves above. A positive
outcome also requires `:source-consistency :stable` in the external record;
the benchmark writes no sources and does not itself certify freeze.

Fixed commands, to be run only by the parent after freeze in the checkout:

```sh
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- sbcl --noinform --no-userinit --no-sysinit --script tools/get-performance-bench.lisp --self-test spikes/out/get-performance-self-test-frozen/
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- sbcl --noinform --no-userinit --no-sysinit --script tools/get-performance-bench.lisp --negative-fixture spikes/out/get-performance-self-test-negative-frozen/
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- sbcl --noinform --no-userinit --no-sysinit --script tools/get-performance-bench.lisp --bench spikes/out/get-performance-bench-frozen/
```

A fourth preregistered command uses `--negative-self-test` with new directory
`spikes/out/get-performance-self-test-partial-frozen/` through the same
external recorder. Both negative commands must fail: this tests detection and must be preserved
with stdout/stderr and actual code. `--bench` includes the same self-verification
before campaigns. The process exits with 0 only after a complete matrix
and a persisted/reread report; no quantitative claim precedes
this evidence.

All published leaves, including both self-tests, declare
`:schema-version 1`, `:kind`, and `:status`. Writing requires this header
before persistence; the report validator also checks version.
Diagnostic self-test explicitly rejects missing or non-1 version
for both self-test leaf types; rereading rechecks schema.
