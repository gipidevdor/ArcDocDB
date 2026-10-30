<a id="control-metodo-preregistrato-della-verifica-di-transizione-c4"></a>

# CONTROL: preregistered method for C4 transition verification

Draft for the 2026-10-14 freeze. This document records the method,
without results. The subtask writes only this file and
`tools/control-transition-bench.lisp` in worktree
`/Users/gpicchiarelli/.codex/worktrees/control-transizione/ArcDocDB`.
Compilation, self-test, and benchmark belong to the coordinator after freeze,
in processes recorded by `tools/record-command.lisp`. The first error,
stdout/stderr, and actual exit must be preserved even for failed attempts.

<a id="domanda-e-campione-fissato"></a>

## Question and fixed sample

Measure `arcdocdb.recovery.manifest:verifica-transizione-recovery` on valid
pairs of complete, immutable manifests owned by a single worker.
Previous-manifest sizes are CLOSED C = 0, 16, 256 and outcomes
per CLOSED O = 0, 4. REMOVED R is deterministic: 0 if C=0, 4 otherwise.
Regimes are `:fixnum` and `:high-u64`; decoding versions 1 and 2;
workers W = 1, 2, 4; three replicates per cell.

The matrix is thus `2 × 3 × 2 × 2 × 3 × 3 = 216` windows, with 504
worker records overall. Order is version, CLOSED, outcomes, derived
REMOVED, regime, workers, replicate. Windows run serially.
C=0 makes O irrelevant to traversal: both cells remain in the fixed
sample. No calibration or window selection based on results.

<a id="manifest-reali-e-oracoli-indipendenti"></a>

## Real manifests and independent oracles

Initial loading uses ASDF `load-system "arcdocdb/tests" :force t`, with
private FASL cache under the new root. It registers test definitions and
fixtures; it invokes neither `test-op` nor any `run`. The only test helper
called by the driver is `manifest-log-fixture`, from
`tests/recovery/manifest-support.lisp`, only during build, before the
clock. Its bytewise packing and bitwise CRC build complete EDIT and
SEAL in memory. Reconstruction directly calls public API
`ricostruisci-manifest`, with explicit version, EOF, and budgets: it requires
exact prefix consumption and `:complete` state. It constructs neither private
product structures nor guard mocks.

Oracle facts are lists declared by the driver, without queries used to
derive expected values. For each logical Serie identity S, unique across all
windows and workers, `base = 1024*S`, adding `2^63` in the high regime.
CLOSED IDs are `base+1 … base+C`, valid-bytes cycling 64/128/192/256;
REMOVED, when present, has IDs `base+513 … base+516`. Previous ACTIVE
is `base+768`, next-id ACTIVE+1. New ACTIVE is exactly old+1;
new next-id is previous ACTIVE+2. All previous CLOSED and REMOVED segments
are retained, and old ACTIVE becomes CLOSED with 64 bytes and four
declared outcomes. Sections are disjoint, without ID reuse.

Small outcomes are `(0,0), (1,17), (2,0), (3,23)`. In the high regime they are
`(0,0), (2^64-1,2^64-1), (2^63,0), (1,2^63)`. TXID/CSN zero and the full
u64 word are therefore explicit. With O=0, previous CLOSED outcomes
are empty; those of the newly closed old ACTIVE remain four and are
checked by the oracle but not traversed by the preservation guard.
The small regime uses only fixnum integers on the 64-bit SBCL runtime;
the high regime exercises bignum IDs and outcomes. Valid-bytes remain small.

Each pair is decoded separately; objects are not shared
across workers, replicates, or windows. Serie here means a logical ownership
context identified by S: the guard receives no Serie controller object.
No product workers are started. Main builds and warms inputs,
then transfers them read-only to the worker; it resumes raw-data ownership
only after quiescence. No shared counter across workers.

Before and after measurement, public queries compare ACTIVE, next-id, counts,
states, and every outcome with declared lists. Also check absent
TXID 42, distinguishing it from present CSN zero, and unknown segment 0.
The list oracle checks cardinality, preservation, and ACTIVE+1. The new snapshot's
maximum payload is 21,644 bytes; with EDIT and SEAL the fixture is
21,724 bytes, within the 65,536 budget. Fixtures remain in memory.

<a id="conteggi-e-formule-preregistrate"></a>

## Preregistered counts and formulas

For a valid call, the frozen guard version performs two
shape checks, each with an old ACTIVE lookup; it visits C
CLOSED, C*O outcomes, and R REMOVED. Public logical lookup units are:

```text
L = 2 + C*(1+O) + R
n = ceil(10000 / (W*L))                 repetitions per worker
N = W*n                               guards required in the window
10000 <= N*L < 10000 + W*L
```

Maximum repetitions per worker is 5,000. n is not adapted to
observed duration. `attempted` increases immediately before the call;
`completed` only after return. `verify0` counts NIL returns,
`nonempty` non-NIL returns. The sink sums completed-call ordinals:
with K returns it is `K*(K+1)/2`, positive for K>0.

For every window, counts derive from actually completed loops,
with `K = sum(completed over workers)`: guard K, shape checks 2K,
CLOSED C*K, REMOVED R*K, segment lookups `(2+C+R)*K`, outcome lookups `C*O*K`,
total logical lookups L*K. These are not instrumented counters of internal GETHASHes.
Attempts raising an error may have executed a traversal prefix:
that work is not charged to completed-return units.
An error, non-NIL return, or mismatching oracle invalidates the window.

For valid windows, aggregate guard throughput = K/(wall-ns/1e9), and
logical-unit throughput = K*L/(wall-ns/1e9). Internal cost of worker
i = cpu-ns_i/completed_i or wall-ns_i/completed_i. The three replicates
remain raw: any summaries must keep each cell distinct.

<a id="clock-scope-e-budget"></a>

## Clocks, scope, and budgets

Each worker has 32 warmup calls on main before measurement,
excluded from attempted/completed. A full GC precedes each window.
Build, decoding, warmup, GC, oracles, hashes, and persistence are excluded from
the measured clock. Inside the loop: only guard, counters, sink, and cooperative
checks every 32 steps, plus the final deadline check.

`clock_gettime(CLOCK_MONOTONIC)` supplies wall nanoseconds; the worker
loop separately uses `CLOCK_THREAD_CPUTIME_ID`. The driver declares a
64-bit timespec ABI and Darwin clock IDs 6/16, Linux 1/3; other runtimes are
rejected. The internal window includes loop and check overhead.
CPU is that of the current thread, not the entire process, and worker CPUs
must not be summed as wall duration. The two record versions affect
only decoding excluded from the clock: the guard receives no version.

With W=1, main executes the worker directly. With W>1, aggregate wall time
includes thread creation, ready/start gate, calls, and joins. Gates,
stop semaphores, and entry points are prepared before the clock; the worker's
internal measurement excludes startup and join. `sb-ext:get-bytes-consed` records
the whole-process difference in the aggregate window, including
coordination and any errors. It is not live heap, RSS, or per-thread
allocation. No conclusion of zero allocation or guaranteed allocation.

The cooperative deadline is 30 seconds per window from setup,
bounded by the 180-second campaign deadline. The latter includes
loading, build, warmup, oracles, hashes, joins, and finalization. Gate
waits and joins use remaining time on the same deadline; no
cleanup extension. A failure stops the campaign and preserves the
completed prefix. No terminate-thread, asynchronous timeout, or workload
retry. Reads, compiler, and SHA processes may block beyond a
checkpoint: the coordinator must supervise the process externally;
the cooperative budget is not a hard OS limit.

If all threads are quiescent, main may read raw data and finalize
the report. Otherwise it preserves only observations it already owns, without
reading live raw data or releasing fixtures. It emits main status and diagnostics
on stdout, with `:unavailable` counters, without persisting a concurrent
snapshot. An error already observed by main retains `:failed` and exit 1;
a timeout without known error retains `:incomplete` and exit 2. Evidence
remains in the external recorder. In a quiescent group, a worker error also
takes precedence over timeouts. Only a complete, consistent campaign has
`:ok` status and exit 0.

<a id="evidenza-helper-congelato-e-dimensione"></a>

## Evidence, frozen helper, and size

The CLI accepts exactly `--self-test`, or
`--bench --output spikes/out/control-transition-bench-X/`, with X of 1…64
ASCII alphanumeric, hyphen, or underscore characters. Checkout is derived
from driver location, without inherited cwd. LSTAT verifies ancestors;
root mkdir 0700 is exclusive, EEXIST fails. No automatic
deletion. Namespace ownership requires no external replacement
of ancestors during the run.

Before compiling the helper, the driver copies bytes of
`tools/evidence-storage.lisp` to `evidence-storage-source.lisp` in the private
root, with verified EOF and size. It loads only this copy once under a handler: SBCL
compiles definitions during LOAD. This avoids double macro definitions
caused by COMPILE-FILE followed by LOAD in the same process; product FASLs
remain in private cache. After loading, it uses the same canonical
`arcdocdb.evidence:file-sha256` to certify the copy SHA equals
the original SHA in the snapshot before ASDF load. After the campaign,
it again compares copy and original in the final snapshot, and copy SHA
before/after. No new hash algorithm or reader. The helper's first snapshot
is thus the copy made before compilation; its SHA
identification occurs after loading. The external recorder's normal blob
snapshot precedes the entire command, including this copy and
driver load. The two levels have different, declared scopes.

Canonical snapshots include all `.lisp` files in src and tests, ASDF,
driver, method, and helper. The cold walk rejects depth beyond 32, more than
4,096 files (including four explicit ones and any non-Lisp files
encountered), or more than 4,096 directories. SHAs do not continuously monitor reads.
Bootstrap rereads the driver once under a handler (at most two
LOADs total), so warnings from definitions compiled by the loader
are also fatal before MAIN. Stop polling uses TRY-SEMAPHORE without
a zero timeout disallowed by SBCL's contract. Warnings and style-warnings are fatal; the sole exception during ASDF load
is `SB-KERNEL:REDEFINITION-WARNING`, recorded with total count and first
16 diagnostics in the report, all on stderr. The helper has no such exception.
No external Lisp dependencies are added; the existing canonical reader
invokes `shasum` outside the clock, retaining its operational limits.

`report.lisp` is a schema 1 PLIST of data only, written without pretty printing,
with at most 1,048,576 UTF-8 bytes, renamed and reread by the common reader
with read-eval disabled. `report.sha256` identifies the canonical file.
Each window retains cell, repetitions, clocks, bytes-consed, operation
counts, status, oracle, and worker summaries; no per-call list,
payload, or fixture dataset on the filesystem. Partial raw data are not valid measurements
of a complete window. If the helper is uncertified or persistence
fails, the recorder's stderr/stdout and actual exit are
necessary. Late budget exhaustion invalidates even a report just
written as `:ok`; file and digest are updated to `:incomplete`.

Static checkout evaluation during drafting counts 360 src/tests Lisp paths
and 10,345 bytes in their newline-separated list, plus four explicit
files. For the reduced matrix, reserve 640 bytes for each of
504 worker records without diagnostics, 512 bytes for each of 216
windows beyond workers, 96 KiB for two source snapshots, 40 KiB for warnings,
16 KiB for diagnostics of the single terminal attempt, and 8 KiB for the
root: less than 608 KiB overall. Diagnostics are bounded to
512 characters; reservation considers escaping and UTF-8 up to four bytes
per character. This is static sizing, not executed
serialization; actual limit checking remains binding after freeze.

<a id="suite-pura-e-invocazioni-dopo-freeze"></a>

## Pure suite and invocations after freeze

`--self-test` loads neither product, ASDF/tests, nor helper, creates no workers,
filesystem fixtures, or benchmark. It uses only its own data for exact
matrix 216, target and formulas, list oracle, mutations of CSN zero and
REMOVED, counters/sinks, partial samples, errors before timeouts,
nonquiescence with known main error, duplicate workers/Serie, missing fields,
argv and literal namespace, and in-memory PLIST roundtrip. It emits one
PLIST on stdout. SB-POSIX is a runtime module, not the product.

Planned commands from the frozen checkout, each in a separate process:

```sh
sbcl --no-userinit --no-sysinit --script tools/record-command.lisp -- \
  sbcl --no-userinit --no-sysinit --script tools/control-transition-bench.lisp --self-test
sbcl --no-userinit --no-sysinit --script tools/record-command.lisp -- \
  sbcl --no-userinit --no-sysinit --script tools/control-transition-bench.lisp \
  --bench --output spikes/out/control-transition-bench-FROZEN-A/
```

No compilations, Lisp, self-tests, or benchmarks were run during
drafting. Central qualification still owns any first compiler
error, fixture arity/load, native clock and SHA reader availability,
serialized size, and completion within budgets.
The sample does not cover REMOVED=4 with CLOSED=0 or REMOVED=0 with CLOSED>0,
invalid transitions/ID exhaustion, mutable concurrent manifests, more than
four workers, latency distributions, p99, storage pipeline, or crash
recovery. Cache and external load are uncontrolled. No performance
threshold and no promotion of partial prefixes to complete campaigns.
