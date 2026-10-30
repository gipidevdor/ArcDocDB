<a id="metodo-del-benchmark-di-ricostruzione-dellindice-v2"></a>

# v2 index-rebuild benchmark method

C4 preregistration of 2026-10-09 for
[index-rebuild-bench.lisp](../../tools/index-rebuild-bench.lisp), under
[coding standard](../affidabilita/standard-di-codifica.md), COD-60/61.
Scope: [primary-index](indice-primario.md)/
[v2-payload](slot-indice-v2.md) primitives; REQ-IDX-003/005/007, REQ-BEN-001/002,
REQ-VAL-001. Method describes tests after parent freeze.
Writing driver is not experimental result.

<a id="caricamento-e-modi"></a>

## Loading and modes

Driver loads `arcdocdb` through `asdf:load-asd`/`asdf:load-system`,
forced compilation, product warnings treated as errors.
ASDF definition must already include `rebuild*.lisp` modules/
`ricostruisci-frammento-indice` export. Driver resolves functions
before windows, uses real implementations.

| Mode | Work |
|---|---|
| `--self-test` | Heap sensor, persistence/aliases, bounded functional/negative fixtures. |
| `--bench` | Self-check, serial lookup, rebuild/split with separate costs. |
| `--parallel` | Self-check, lookup on 1/2/4 independent indexes. |
| `--negative-fixture` | Deliberately incomplete metric: `:failed` report, exit 1. |

Every mode accepts optional new directory. `--bench`/
`--parallel` then accept `20000`/`100000`; default 20,000,
five replicates in both campaigns. Without explicit directory,
driver creates new timestamp/PID path under `spikes/out/`.
Existing path rejected. No test starts without CLI mode.

<a id="fixture-e-associazione-dei-digest"></a>

## Fixtures and digest association

Every index, context, key, expected payload, five-u64 output
private. Binary keys inserted in reverse order. First
key gets upsert with strictly greater CSN/new location;
last deleted, retaining source-arena space.
Oracle checks hits, deleted-key miss, five v2 fields,
arena bytes before/after phases. Local key offset may
change with compaction; length/flags/reserved fields must match.

For lookup every distinct key has distinct H2 (maximum 96 keys).
Low u32 also selects aligned groups of 16, avoiding stable hit
consuming eight-candidate budget due to fixture collisions.
Favorable intentional distribution. Digests trusted caller
data, equal for lookup/mutations/rebuild; qualify neither
hash function nor hostile-input resistance.

`source-digests` creates two specialized u32 arrays length **C**.
For each live key, invokes `sonda-writer` on current source, checks
found/range/uniqueness, writes high/low at **original found slot**.
Fixture requires at least one slot/key-ordinal difference.
EMPTY/DELETED positions zero; not keys to copy.
No local slot reused after plan publication.

To measure larger directories, setup performs at most four empty
splits along zero prefix. Each compacts empty arena to one
byte: afterward `estendi-arena-indice` grows current-source
arena to `count × key-size` before inserts/outside measurement.
Key high bits belong to current zero prefix, divide
future children by next bit. Indexes share fragments
within own directory only.

<a id="lookup-seriale-e-gate-dello-heap"></a>

## Serial lookup and heap gate

Four cases: hit/miss × low/high CSN. Fixture C=128, 96 16-byte
keys before deletion. Initial CSNs 17/`#xfffffffffffffff0`;
high-range location `#xfedcba9800000040`. Upsert increments
CSN by one, offset by 64. High u64s created before measurement.

Each replicate has 256 warmup lookups, full GC, then 20,000/
100,000 lookups. Window contains one lookup per iteration, cursor
selection, status check, updates to preallocated fixnum counters.
No upsert, rebuild, hashing, u64-field verification,
report writing, explicit GC inside window. Payload/
last measured-output checks afterward.
Miss output must retain u64 sentinel.

`get-bytes-consed` process-wide counter. All serial hit/miss
windows in both CSN ranges must have zero
difference. Experimental gate of success path/sensor;
not absolute nonallocation proof in every interleaving.
No baseline subtracted from heap/time.

Report retains requested/completed iterations, sink, heap,
original ticks, seconds, time quality, operations/s.
Sink/completion must equal iterations. Zero ticks
`:below-resolution`, zero seconds/NIL rate; no invented
speed or minimum performance threshold.

<a id="ricostruzione-e-pubblicazione"></a>

## Rebuilding and publication

Five replicates, rebuild/split per configuration:

| C | Initial keys | Bytes per key | Initial depth |
|---:|---:|---:|---:|
| 16 | 12 | 16 | 0 |
| 128 | 96 | 16 | 2 |
| 1024 | 96 | 1024 | 4 |
| 128 | 96 | 65535 | 0 |

Each replicate uses fresh high-CSN fixture. Preparation measures
only `ricostruisci-frammento-indice(index, source, highs, lows, budget,
:split-p …)` with 32 MiB transient budget. Five returns: plan,
C, live key bytes copied, new directory references, transient
payload. Before publication, driver checks plan
PREPARED, root still original, four counters
matching arithmetic fixture oracle.

`pubblica-directory-indice(plan)` called/timed separately.
Driver checks PUBLISHED state, new-directory size,
all-lookup fidelity. Preparation time/
`:publication-raw-ticks` distinct; report also retains observed
preparation heap, without zero gate for maintenance.

`:source-slots = C` denotes distinct source capacity.
`:full-source-passes = 3` indicates complete measurement/copy/
verification scans; `:probe-bound-per-call = C` bounds each writer probe.
Does not claim actual total visits C: add probes/key
comparisons whose cost depends on distribution.
Visits not instrumented inside primitives.

Transient oracle sums old directory, distinct current fragments
(41×C plus arena), candidates (41×C each plus live keys), new directory
(8×references). Excludes object headers, fixed buffers, digest
arrays, roots held by others, garbage, runtime. Counters
describe local payload, not RSS estimate/global controller ceiling.

<a id="parallelismo-e-completamento"></a>

## Parallelism and completion

1, 2, 4 workers for both CSN ranges/five replicates. Each
hits own v2 index/context/output. Main checks all
fixtures before start, waits for warmup through semaphore, performs
one GC before gate opening. Absolute 30-second deadline
bounds ready/join; worker start wait also 30 seconds.
Cleanup terminates only still-live driver threads, two-second
join per thread, at most four threads.

Each worker must complete intended count, return correct status,
pass last-output/fixture oracle. All collected errors/
incomplete outcomes stay in report; error fails run.
Main reads worker counters only after thread
terminated. Process window includes gate opening/join.
Workers' `get-bytes-consed` windows overlap: observational,
not summed, no serial zero-heap gate.

<a id="autoverifica-persistenza-e-registrazione"></a>

## Self-check, persistence, recording

Sensor runs 20,000 empty cycles requiring zero heap, then allocates four
one-MiB arrays, retains them, checks counter observes at least
four MiB. Rejects missing metrics, wrong completion/sink,
inconsistent ticks/seconds/rate, positive heap at zero gate. Driver
boundary exercised with metric missing `:completed`: requires
`:failed` status/exit 1. `--negative-fixture` lets parent
also check actual process state for same regression.

Real bounded fixtures exercise both CSNs with rebuild/split,
wrong-length digest arrays, insufficient budget, wrong fingerprint
on genuinely live slot, reuse of published plan.
Preflight rejections must preserve root/health. C4
verification does not replace C1 suite, interruptions, decision coverage.

`:metrics` exists from report creation. Every metric published
as list/sublist copy; producer does not modify already
published diagnostic strings. Alias check retains
second report-head reference, modifies original metric after
copy, checks published data intact.
Reports/`self-test-sensor.lisp` reread through
[evidence-storage.lisp](../../tools/evidence-storage.lisp), without evaluating
Lisp from data; required equality includes every metric.

After freeze, parent records every command with
[record-command.lisp](../../tools/record-command.lisp), distinct explicit
paths per run. Preregistered examples, run from worktree:

```sh
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- sbcl --noinform --no-userinit --no-sysinit --script tools/index-rebuild-bench.lisp --self-test spikes/out/frozen-index-self-test/
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- sbcl --noinform --no-userinit --no-sysinit --script tools/index-rebuild-bench.lisp --negative-fixture spikes/out/frozen-index-negative/
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- sbcl --noinform --no-userinit --no-sysinit --script tools/index-rebuild-bench.lisp --bench spikes/out/frozen-index-bench/ 20000
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- sbcl --noinform --no-userinit --no-sysinit --script tools/index-rebuild-bench.lisp --parallel spikes/out/frozen-index-parallel/ 20000
```

Negative command must produce failed record exit-code 1:
expected fixture detection preserved with stdout/stderr.
Collector must read explicit `report.lisp`/
`self-test-sensor.lisp` paths through evidence-storage even after
external compaction. Record-command records retain environment,
sources before/after, actual process state.

Measurements concern in-memory primitives. Establish neither integrated GET,
snapshot/retention, WAL, commit, recovery, client latency, database
throughput, I/O, nor NVMe. External load uncontrolled, campaigns
sequential. No result executed during this
implementation; every quantitative claim requires parent records.
