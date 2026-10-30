<a id="metodo-preregistrato-c4-directory-get-closed"></a>

# C4 preregistered method: CLOSED GET directory

Driver [get-directory-bench.lisp](../../tools/get-directory-bench.lisp) measures
two current-GET cycles through `arcdocdb.get.directory`. This delivery was
prepared through static reads and edits to the two assigned files only:
no compilation, Lisp load, suite, benchmark, mutation,
or check was run. Executions and result recording belong
to the parent after source freeze. `6eeb501` is the agreed ancestor;
main integration `644e53f` will be recorded by the parent before freeze.
There are no observed performance results in this document.

The driver handles its own CLI, sensors, validation, deadlines, and persistence.
It loads `arcdocdb/tests` through `asdf:load-system` without invoking `test-op`
and uses shared support `tests/get-directory/support.lisp`. If support
is not already included in the system, it loads it explicitly. Both operations,
including any ASDF compilations, occur outside windows. **This
campaign loads the test system and does not claim a prod-only process.**

<a id="conteggi-fissati-prima-delle-esecuzioni"></a>

## Counts fixed before execution

| Parameter | Preregistration |
|---|---|
| N: CLOSED segments / present keys | 1, 8, 32, 64 |
| V: bytes per value | 16, 256 |
| Format | v2, ordinary compaction PUT, flags 0, NIL proof |
| CSN | `#xffffffffffffffff`, in all profiles |
| Keys | 16 bytes; one key and one PUT per segment |
| Cases | `:resolve`, `:cache-hit` |
| COUNT | 20,000 cycles per worker per window |
| WARMUP | 1,000 cycles per worker before every window |
| Replicates | 5, ID 0..4 |
| Serial | main, one context, no thread created |
| Parallel | new threads every window, 1/2/4 workers |
| Self-test | T=8, warmup=8, one replicate, all cells |
| Cache per fixture | one 1024 B class, 256 sets, 8 slots/set, stripes=1 |
| Time budget | run 600 s; window 30 s; cleanup joins 2 s overall |

There are 16 N × V × case profiles, 80 serial and 240 parallel windows: **12,800,000
measured cycles**, with 640,000 warmup cycles. `:resolve` includes start and
abandonment; `:cache-hit` includes private response and completion. The self-test
has 64 windows, 1,024 measured cycles, and 1,024 warmup cycles. Before campaigns,
each campaign also performs 210 native GETs to warm all
keys in eight fixtures and 210 directory hits to check their
retention after the last insertion. `--self-test` builds eight fixtures
in succession; `--bench` builds sixteen, eight for self-test and eight
new benchmark fixtures, for 420 native GETs and 420 initial checks. These
operations are outside windows and do not enter campaign counts
or per-window warmup counts.

Order is fixed: increasing N, increasing V, serial then parallel within each
N/V profile, resolve then cache-hit, increasing replicate, workers 1/2/4.
The complete small campaign precedes the benchmark campaign. COUNT, WARMUP, replicates,
profiles, and cache sizing are not CLI-configurable. No adaptive
calibration, timer-derived counts, retries, or selection of successful
replicates. Final validation requires each cell exactly
once and rejects duplicates or partial campaigns.

<a id="fixture-e-routing-della-cache"></a>

## Fixtures and cache routing

The consumed signature is `make-directory-fixture :count N :value-bytes V :workers 4
:version 2 :csn MAX-u64 :cache-p t`; release uses
`close-directory-fixture`. The driver reads agreed accessors view,
directory, maps, keys, values, contexts, outputs, epochs, and public oracles
ids, ends, images, files, cache. It modifies neither support, directory, nor
maps and creates no public cells, CAS, or maintenance threads.

Every fixture owns an exclusive temporary namespace, N open read-only FDs,
one canonical view, an EBR registry with four slots, and four contexts
with private scratch/output. Support builds images and manifests with
reference encoding and CRC; PUTs are at offset 64. The last ID is
`#xffffffff`, others `17 + 2*i`, strictly increasing. The authorized
frontier is `104 + V`; eleven subsequent invalid bytes demonstrate that
END is manifest data rather than file size. The ACTIVE required
by the manifest format has an ID outside the u32 CLOSED domain and is neither
inserted in the directory nor queried by the campaign.

Only one N/V fixture is live at a time: setup, warmup, serial and parallel
windows, joins, and closure precede the next profile. Maximum is
64 read-only fixture FDs, beyond process/checkpoint FDs; construction
does not retain the 210 FDs of all configurations. A later
campaign rebuilds data in new namespaces while keeping identical
contents, oracles, configuration, and counts.

Cache capacity is fixed even for N=1. API-declared payload must
be exactly 2,156,816 B: `8 + 256*8*(1024+29) + 256 + 8`, excluding Lisp
headers and mutex objects. Only one fixture's cache payload is live, 2,156,816 B;
closed-fixture objects may remain on heap until GC. The
1024 B class holds both 56/296 B records;
class size and partition do not change across profiles.

Static reading of `src/cache/core.lisp` establishes that cache routing
uses segment high/low and offset, distinct from the key XXH64 digest
in the primary index. The driver's cold oracle reproduces the u32 mix and calculates
`mix(mix(0) xor mix(ID xor #x9e3779b9) xor mix(64 xor #x85ebca6b)) and 255`.
Before measurements it compares every result with `insieme-cache`, checks
the actual configuration, and records maximum per-set occupancy;
no set may require more than eight slots. This check is a
recorded-execution precondition, not an already obtained result.
Internal cache accessors and map→segment accessor are read-only
for configuration/oracles outside windows; the GET path uses public APIs
resolved before the clock.

Initial warmup uses core `avvia-get` and `leggi-record-get` with the
fixture's known segment/END for every key. It requires five returns
`:segment :miss :inserted NIL NIL`, or `:cache :hit :not-attempted NIL NIL`
if already warm, copies, verifies value, and completes. After warming all
keys, a complete N-pass through the directory requires a hit on each. Subsequent cache
samples require a hit every iteration, including self-test
and warmup. An unexpected miss, eviction, or scan causes FAILED;
no file read replaces a failed probe inside the window.

<a id="operazioni-e-oracoli-nel-ciclo"></a>

## Operations and oracles in the loop

Every cycle installs cleanup before startup and calls
`avvia-get(ctx, view, key[i], NIL, 0, 0)`. It requires CANDIDATE return/state and
active EBR. It copies the candidate's five words into an already allocated private
u64 array; compares CSN as two maximum u32 words, ID, offset 64, and record-size
`40 + V`. Only then does it read the directory through the fixture
accessor, representing controller acquisition under the same epoch.
The physical reference stays within the task and is not forwarded between pools.

1. **Resolve.** `trova-mappa-directory-get` must return by EQ the fixture
   oracle's map. `risolvi-candidato-directory-get` must return the
   same map's segment, fixture END, flags 0, and NIL proof,
   leaving the context CANDIDATE. The CLOSED resolver rechecks CSN, size,
   owner, and FD lifetime. Abandonment and IDLE/free-EBR verification follow;
   output must retain every sentinel. This cycle includes
   **two directory selections**: explicit selection and selection inside
   the resolution API. It neither authorizes nor delivers a value.
2. **Cache-hit.** `sonda-cache-directory-get` must return `:hit`. The driver
   copies with `copia-valore-get` into private output from offset 3, requires end
   `3 + V`, then `concludi-get(ctx, 1)` must return `:found,V`. NOW=1 is the
   fixture's fresh logical time, after startup NOW=0;
   the measurement timer is independent. It checks all V oracle bytes
   and all six sentinels, IDLE state, and free EBR announcement.
   Idempotent cleanup follows regardless. This is one directory selection.

Expected values, CSN, ID, and END come from independent images/arrays
created by support; the driver does not derive the oracle from the resolver
returns it measures. Image/value correspondence is checked cold.
Counters and checksum increase only after checks and cleanup. For
resolve the contribution is `1 + END + ID + 2*#xffffffff + sum(expected value)`;
for cache-hit it is `1 + sum(bytes actually copied)`. The resolve checksum is
a validated-operation counter using oracle metadata: acceptance
comes from explicit per-cycle comparisons, not a result sum.
Full comparison prevents a sum collision from accepting a wrong cache response.

The cursor starts at `worker-id mod N` and advances modulo N. The warmup
closure differs from the measured closure, which restarts at the prescribed cursor.
COUNT=20,000 is not divisible by N=64: the checksum oracle also calculates
each worker's remainder without assuming complete passes. CSN
is checked high/low without returning a generic u64 in the loop;
hot sums stay in the SBCL64 fixnum domain. Observed heap may still
include product, thread, and driver allocations.

<a id="finestre-e-sensori"></a>

## Windows and sensors

Fixtures, oracles, contexts, outputs, candidate buffer, closures, raw data, expected
checksums, thread names, and semaphores are allocated before the window. Warmup
and full GC follow. Main reads `get-internal-real-time` and
`sb-ext:get-bytes-consed` before/after the entire group: order tick-start,
heap-start, heap-end, tick-end. The report retains original ticks and units,
seconds, and time quality. Zero ticks gives `:below-resolution`, zero seconds,
and NIL rate. Rate exists only for a successfully completed window.

The heap counter concerns the entire process, including new-thread
allocations; per-worker counters are not summed. It is cumulative allocated memory,
not live heap, RSS, or reservation. Automatic GCs are included; explicit full GC,
formatting, record construction, and checkpoints are excluded. The two sensors'
order causes a small boundary misalignment.

Serially, main executes the loop and final quiescence check.
In parallel, including the one-worker case, the window starts before
`make-thread` and includes startup, ready/gate, loops, deadline-bound joins, and
checks of all involved contexts. Main hands contexts to threads
only after warmup, reacquires them after joins, and reads no raw data of
still-live threads. Startup/join are neither subtracted nor estimated. Threads are
new every window: this measurement does not describe a persistent pool.

Clocks include sentinel filling, candidate copy/verification,
enum comparisons, full output verification, checksum,
state/EBR observations, GET cleanup, and counters. The final support
check also verifies private residuals under main ownership after
join. These are complete cycles with correctness checks inside the window,
not estimates of isolated binary-search cost.

The sensor has two separate windows: eight empty operations and allocation of
four retained 1 MiB u8 arrays. Each raw record is written before the gate.
Positive control requires at least 4,194,304 B observed, completion and
correct checksum, live arrays of expected size, and boundary sentinels.
The empty control records noise and does not require zero heap. No sensor
value is subtracted from GET measurements. Driver diagnostic tests
have REQ in their names and detect missing `:completed`, including in workers,
missing schema, false partial completion, and NIL rate at zero ticks.

<a id="deadline-errori-e-conservazione"></a>

## Deadlines, errors, and preservation

The run has an absolute 600 s deadline including load, setup, sensors,
self-test, and campaigns. Each window has a watchdog installed before
sensors and uses the earlier of run deadline and local 30 s. Ready, start, and all
joins share this same deadline; every wait is bounded. Failure
does not change COUNT. Cleanup terminates only owned threads and has
one overall 2 s deadline for the four joins; later calls
add no time. Failed-group cleanup occurs after closing
sensors and is declared outside the window. That group's data are
diagnostic, with NIL rate.

Sensor `unwind-protect` preserves ticks/heap even on error. After
cleanup, the driver builds the partial record, copies it into checkpoint,
and persists it **before validation**. A live worker makes its raw data
unobservable: completed/checksum NIL and explicit FAILED state; no completion
is invented. A dead worker has actual partial counters,
even if it fails before the first cycle. No FD is closed beneath a
still-live thread; then the run fails and process-level OS
release is the final boundary. Previous records remain preserved.

Driver conditions are typed (`bench-failure`, `bench-timeout`);
diagnostics are limited to 2,048 characters and cite
`tools/get-directory-bench.lisp COD-61`. Product errors are
preserved in worker/group diagnostics and cause exit 1. A missing-segment
location is not transformed into an `:absent` document.

The run acquires a new 0700 directory with exclusive `mkdir`; EEXIST
fails without reuse. Prefixes are `get-directory-bench*` and
`get-directory-self-test*`, including for the negative test. The only three published
leaves are `report.lisp`, `self-test-metrics.lisp`,
`self-test-sensor.lisp`; each is a plain UTF-8 plist below 1 MiB.
Every checkpoint uses an exclusively acquired temporary file and rename
within its directory; it rereads one form with READ-EVAL NIL and requires
equality. The live report-directory limit, including staging of
one leaf, is 4 MiB. No per-replicate file is created.

All leaves declare `:schema-version 1`, `:kind`, `:status`, `:source`,
and `:limits`. Windows, workers, sensor metrics, routing, and summaries
also declare schema 1/kind/status. State starts RUNNING and ends OK or
FAILED. Self-test and sensor have dedicated checkpoints; the report keeps
serial/parallel campaigns distinct. `--negative-fixture` builds a
**synthetic** record with deliberately absent `:completed`, preserves it
in `self-test-metrics.lisp`, then requires a diagnosed rejection and exit 1.
It does not load the product or pass off its zero ticks/heap as real measurements.

Each campaign's eight fixtures sequentially build 210 files
for 52,710 B of images (`sum_N N * ((115+16)+(115+256))`). Maximum
simultaneous count is 64 files, 23,744 B, at N=64/V=256; `--bench`, including
self-test, builds 420 files overall for 105,420 B. Files are
outside the report directory, in support-owned roots, and are
removed after each profile becomes quiescent. Maximum live directory payload
768 B and maximum live resolver-row payload 1,536 B are distinct from
cache, FDs, Lisp headers, construction temporaries, and retained sensor.
Report budget excludes FASL cache and the parent's external recording.

<a id="esecuzioni-che-il-padre-deve-registrare"></a>

## Executions the parent must record

The parent freezes and records argv, commit/base, working tree, and source blobs
before and after each command. The driver records application argv and external
freeze responsibility; it does not itself certify source
stability. Acceptable performance evidence also requires
`:source-consistency :stable` in the external record. Prefixes and all three leaves
must be included by the collector. The following commands are preregistered
and **were not run for this delivery**:

```sh
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- sbcl --noinform --no-userinit --no-sysinit --script tools/get-directory-bench.lisp --self-test spikes/out/get-directory-self-test-frozen/
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- sbcl --noinform --no-userinit --no-sysinit --script tools/get-directory-bench.lisp --negative-fixture spikes/out/get-directory-self-test-negative-frozen/
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- sbcl --noinform --no-userinit --no-sysinit --script tools/get-directory-bench.lisp --bench spikes/out/get-directory-bench-frozen/
```

The negative test must preserve exit-code 1, stderr COD-61, and FAILED leaves;
exit 0 would be a detection defect. `--bench` first runs sensor,
diagnostics, and all small cells, then the 320-window matrix. Exit 0
requires a complete matrix, correctness of every cycle, quiescence,
fixture cleanup, and successful final report persistence/rereading.

The product directory supports up to 65,536 maps, bounded search in
17 steps, with at most two numeric comparisons per pivot, and array payload
`12*N` B on SBCL64. These are product contracts,
distinct from performance profiles through N=64: the driver neither
counts steps/comparisons nor infers maximum domain from timings. Publication,
EBR reclamation, ACTIVE, prepared records, snapshots/history, recovery, queues, and migration
between pools are outside workload. CPU/frequency, external load, scheduler,
CPU cache, and memory pressure are uncontrolled. P99,
durability, sustained I/O costs, or overall database throughput cannot be derived
from these validated-cycle rates.
