<a id="metodo-preregistrato-chiusura-wal-con-registro-csn"></a>

# Preregistered method: WAL closure with CSN registry

Registered on 2026-10-09 before any execution. C4 tool:
`tools/wal-csn-bench.lisp`; C1 product: bridge in package `arcdocdb.wal`.
REQ-WAL-002, REQ-WAL-005, REQ-WAL-006, REQ-MVC-005, REQ-MVC-008,
REQ-AFF-008, REQ-BEN-001, REQ-BEN-002, REQ-VAL-001.
Compilation uses safety 3 and treats warning/style-warning as errors.
The two C1 readings, negative tests, product coverage, and mutations are
the parent campaign's responsibility; this sensor does not replace them.

<a id="copertura-e-mutazioni-preregistrate"></a>

## Preregistered coverage and mutations

The parent runs the C4 self-check, instrumental coverage of `wal` and
`foundation`, and the full `make check` gate outside benchmark windows.
`tools/wal-csn-mutation.lisp` isolates four integration-test mutants:
omitting the high limb in the record stamp; reuse with a pending token;
publication accepted after log fault; token transfer to another log with
the same file-id. A baseline of the four tests precedes the mutant campaign.
A mutant counts as killed only if it compiles and fails a relevant integration
assertion: a compilation error makes the test invalid, not a kill. Self-check,
baseline, raw outputs, failures, and coverage remain separate evidence.

<a id="isolamento-delle-campagne-e-controlli-del-processo"></a>

## Campaign isolation and process controls

Coverage and mutants explicitly map `**/*.*` from checkout to their own
private cache after loading the ASD. A check verifies the destination before
compilation. The coverage self-check also checks the recursive path. Mapping
only the root directory did not guarantee isolation: the initial campaign
detected this and retains that failure. Subsequent campaigns use the verified
mapping. Mutants discover Lisp sources and tests from the integrated checkout;
each process receives a separate complete copy.

<a id="contratto-e-ciclo-osservato"></a>

## Contract and observed cycle

`sigilla-lotto-con-csn(lotto registro log file-start durable)` assigns a token
only after shape, offset, capacity, identity, and log health preflight.
Before the CSN it also checks an open append file, `written <= file-start`,
and transfer/file budget, including planned future bytes, through
`verifica-capienza-append`.
It applies to nonempty segments. It retains registry, log, slot, and two u32
limbs in the batch before sealing. Rejections before assignment preserve bytes
and CSN. An unexpected interruption after assignment requires fail-stop;
rollback is not assumed. The manual API and prepared stamps remain compatible.

The measured cycle adds an ordinary PUT, closes with the bridge, enqueues the
batch into the group, closes the group, performs simulated write and flush,
atomically publishes a reference to a preallocated index descriptor, resolves
with `risolvi-lotto-pubblicato` at `:group` level, releases the group, and reuses
the batch. Publication is modeled by CAS on a fixture slot: it is an external
resolution precondition, not a complete engine index. The callback uses the
strengthened signature
`risolvi-lotto-pubblicato(lotto registro slot high low :group)`: registry and
expected token are those captured at closure/reading, also retained in the
published descriptor. `annulla-csn-lotto(lotto registro slot high low)`
has the same identity check. An old event after reuse or a different registry
with an equal numeric token must be rejected with `:lotto-csn-stale`
before any mutation; double completion of a resolved token remains
`:lotto-csn-not-pending`. Associated negative tests belong to the parent.
The slot is retired before reuse. `annulla-csn-lotto` is not invoked on
the healthy path. Busy/full interrupt the sample and retain observations;
there are no retries in the cycle or implicit acknowledgments.

Always active cycle oracles: independent two-word successor, token readable
and pending after closure, CSN bytes in PUT and SEAL, durable coverage, H
equal to the just-resolved CSN, token resolved before reuse and free after
reuse. At the end, registry frontiers, released ownership, write/flush/publication
counts, and written/durable bytes are checked. No high u64 is reconstructed
in the cycle. The maximum u64 file-id is preboxed once per invocation,
before windows.

<a id="fixture-e-campagne-seriali"></a>

## Fixture and serial campaigns

Primary registry capacity 256; 512-byte batch with one record, a 16-byte
key, and an opaque 64-byte value. Format offsets are read from product
constants. Backend, simulated file, log, group, registry, batch, buffer,
and published descriptor are built before the clock. Warmup of 1024 cycles
on a separate fixture and full GC before the window. Each window uses a
new fixture: carry remains in measured work.

All serial campaigns run first, without overlap: five replicas with base
`(0, 0)`, then five with base `(#x80000000, #xfffffff0)`. In the second
case, the sixteenth measured cycle crosses the carry. File-id
`#xffffffffffffffff` in both campaigns. Every sample starts at 20000 cycles.
If it lasts less than 20 ticks, it doubles, at most five windows:
20000, 40000, 80000, 160000, 320000. All attempts are retained, including
below-resolution and failed attempts. No throughput threshold. Serial
regression: even one observed heap byte on success makes the invocation
fail with nonzero exit.

<a id="autoverifica-del-sensore-e-conservazione-delle-metriche"></a>

## Sensor self-check and metric retention

Before campaigns: empty window of 20000 calls, heap exactly zero;
positive control with 16 live 1 MiB arrays, at least 16 MiB observed.
These windows check the counter, do not estimate throughput, and may be
below resolution. Rejection of invalid clock, nonzero heap when zero is
required, and missing metric is also demonstrated.

All keys updated with `getf` exist before measurement: no addition can change
the head of an already shared plist. The self-check retains a record with
metrics set through an alias, rereads it with `*read-eval* nil`, and checks
in-memory identity and persisted values. Mandatory metrics for each success
include heap, ticks, time, sink, completed work, and, for campaigns, cycles/s
and bytes/s. Final delivery also rereads the complete report and rejects
missing/inconsistent fields.

<a id="campagna-parallela-limitata"></a>

## Bounded parallel campaign

After serial runs: 1, 2, and 4 real workers, three replicas per count, high
base with carry. Every worker owns independent registry, file, log, batch,
group, buffer, and published slot; no shared archive. Same 20000 cycles
and calibration bounded to five windows. Warmup, thread construction, and
GC precede barrier opening. Replica deadline 30 seconds, bounded start/ready
waits and joins; cleanup and final join within 2 seconds per thread.
Fields of threads still alive after cleanup are not read.

Actual busy/full attempts and retries are reported (always zero: fail-first),
per-worker outcomes, total work, and aggregate throughput calculated from
first worker start to last worker end. SBCL's heap counter is process-global:
worker windows overlap and cannot be summed or attributed to individual
workers. The global window includes start and join; its bytes may include
runtime coordination. Parallel heap is observational; the zero-heap gate
concerns successful serial windows. Missing metrics, wrong outcomes, and
time below 20 ticks at budget are rejected.

<a id="evidenza-e-limiti"></a>

## Evidence and limits

Schema 1 plist reports, environment metadata, source fingerprints before
and after, attempts, and diagnostics are retained even on failure. A source
change during the run prevents success. The directory is exclusive,
configurable as a direct child of `spikes/out/`; no output is overwritten
by a subsequent invocation. The parent uses `tools/record-command.lisp` for
argv, environment, stdout/stderr, exit code, and final evidence retention.

Maximum budget: 10 serial samples × 5 windows and 9 parallel replicas × 5
windows; up to 620000 cycles per worker/sample summing calibration.
Only aggregate data, no per-record trace. The sensor does not prove absolute
absence of allocation. External load is uncontrolled. The backend makes no
data syscalls: no conclusion about NVMe, client latency, real durability,
recovery, snapshots, or database performance.

No automatic execution until the parent freezes sources.
Usage from the frozen worktree (new directory names for every command):

```sh
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- \
  sbcl --noinform --no-userinit --no-sysinit --script tools/wal-csn-bench.lisp \
  --self-test --output-dir spikes/out/wal-csn-self-test-UNIQUE/
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- \
  sbcl --noinform --no-userinit --no-sysinit --script tools/wal-csn-bench.lisp \
  --bench --output-dir spikes/out/wal-csn-bench-UNIQUE/
```

Without `--output-dir`, the tool chooses an exclusive name with time/PID/attempt.
Output: `report.lisp` and `self-test-metrics.lisp` in the indicated directory;
the complete report is also emitted to stdout. The `--bench` campaign
automatically includes the sensor self-check.
