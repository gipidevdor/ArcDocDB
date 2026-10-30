<a id="metodo-c4-recovery-readonly-del-vecchio-active"></a>

# C4 method: read-only recovery of the old ACTIVE

The `tools/recovery-active-bench.lisp` driver prepares a small benchmark of
the public `leggi-active-recuperato` path, using the in-memory backend in
`tests/recovery-active/support.lisp`. It measures logical opens/recovery with
allocations: every call recreates segment capabilities, workspace, hash table,
and outcome arrays. Fixture bytes and decisions are already resident.
This is not a measurement of DB throughput, disk I/O, zero heap allocation, P99, or a
conclusion about scalability. Qualification remains COD-60; this method does not
attest runs, compilations, or numerical results.

<a id="invocazioni-dopo-il-freeze-del-coordinatore"></a>

## Invocations after the coordinator's freeze

From the frozen checkout, with SBCL without user/system initialization:

```sh
sbcl --noinform --disable-debugger --no-sysinit --no-userinit \
  --script tools/recovery-active-bench.lisp --self-test
sbcl --noinform --disable-debugger --no-sysinit --no-userinit \
  --script tools/recovery-active-bench.lisp --bench \
  --output spikes/out/active-verifica-bench-R1/
```

The final directory must be new: exclusive `mkdir`, no reuse or
overwrite of a previous attempt. Suffixes of 1–64 ASCII
letters, digits, hyphens, and underscores are allowed, with a trailing slash. Main derives
the root from the driver's location. The coordinator runs the command
through `tools/record-command.lisp` for argv, environment, output, actual exit,
and global source snapshots; the existing capture wrapper,
`tools/get-series-capture.lisp`, with `--raw-root`, also binds explicitly
invoked helpers. The driver introduces no alternative hash reader or
evidence helper. Outputs are under `spikes/out/`, excluded from the source snapshot;
stability must be read in the completed producer's record. Capture and recorder provide no process timeout.

`--self-test` uses only pure helpers: CLI parser, matrix, count
arithmetic, oracle formulation, sink, and classification with negative cases.
It does not load ASDF, product, or test support; create files, fixtures, or workers; or
measure performance. Bootstrap follows
`tools/control-transition-bench.lisp`: a second LOAD under a handler also makes
warning/style-warning in driver definitions fatal. The benchmark
path loads ASD and `arcdocdb/tests` once, without `test-op` or `run`.
ASDF output translations are private, under `<output>/fasl/`, ignoring
inherited configuration. During ASDF loading only,
`redefinition-warning` warnings are recorded with a count and up to 16 messages,
then muffled: compiling and loading a macro in the same process can
redefine it. All other warnings remain fatal. The policy has negative
cases in self-tests; actual warnings also remain in stderr.

<a id="caso-fisso-e-oracolo"></a>

## Fixed case and oracle

**24 records**, all in one sealed batch, are chosen instead of 32/36:

| Class | Records | Distinct TXIDs | Outcome source |
|---|---:|---:|---|
| Ordinary PUT | 8 | — | stamp CSN 17, no prepared |
| Local prepared PUT | 4 | 4 | OUTCOME in segment |
| OUTCOME | 4 | the same 4 local TXIDs | explicit CSN |
| Derived prepared PUT | 4 | 4 | authoritative DECISION |
| Presumed-abort prepared PUT | 4 | 4 | absence from the fixture's complete table |

PUTs have a 1-byte key and 1-byte value; each PUT frame occupies
26 bytes, each OUTCOME 32. The file is exactly
`64 + 20×26 + 4×32 + 56 = 768` bytes, below the 4096 limit.
Header and SEAL are excluded from the 24 records. Origin is writer, ACTIVE ID is
9, and there are no tails, corruption, or short reads. Formats v1 and v2 have the
same logical case and size. Data size does not vary.

Local: TXID `0`, `1`, `#x8000000000000000`, `#xffffffffffffffff`.
Derived: `2`, `3`, `#x8000000000000001`, `#xfffffffffffffffe`.
Abort: `4`, `5`, `#x8000000000000002`, `#xfffffffffffffffd`.
The four CSNs, both local and derived, are `0`, `7`,
`#x8000000000000000`, `#xffffffffffffffff`. Decisions contain only
the four derived transactions and name the Serie and a second participant: this is the
complete table of the declared synthetic Archivio, not general authorization
to infer abort from a real partial table.

Every call verifies, through public queries, frontiers
`(768 768 :complete versione)` and statistics `(1 24 12 4 4 4)`:
batches, records, prepared, local, derived, abort. It then executes **13 closure
queries**: the four derived transactions present with exact CSNs; the four local,
four abort, and TXID 42 absent with `nil/0`. Presence with zero CSN remains
distinct from absence. Expectations come from declared facts, never from the
decoder or product result. The token consumes returned frontiers,
statistics, and CSNs; the expected sink is `completed × token(versione)`.
Full comparison precedes accumulation: the sink does not replace the oracle.

Support checks byte immutability, identity, FDs still read-only and
open, absence of writes/flushes/renames/closes. The driver also verifies two
reads per recovery (header and body). It empties the event recorder before
every call, keeping its consumption bounded. These checks and harness
allocations are included in window time and heap allocation.

<a id="matrice-e-confini-della-misura"></a>

## Matrix and measurement boundaries

The ordered matrix is **v1/v2 × 1/2/4 workers × 3 replicates = 18 windows**.
Each worker performs exactly **200 verified calls**, including the first
before the gate; this is 8400 recoveries and 201600 records in the complete
campaign. Before measurement, main prepares a distinct fixture per
worker and performs **8 verified warmups** on it, excluded from measured counts.
Byte construction, recovered CONTROL, decision-table reconstruction,
fixtures, warmup, ASDF loading, and report persistence are excluded.

Each fixture owns backend, sources, CONTROL, immutable decisions,
scratch, and capabilities/FDs. Virtual numbers 301/302 recur only inside separate
backends: they do not designate a shared FD. No global function
replacement. Workers share only code, gate, and condition channel.

Even the one-worker cell creates a thread. Aggregate wall time starts before
thread startup and gate management, ends after joins, and includes
checks, scheduling, and synchronization. It uses `get-internal-real-time`;
the report retains ticks and `internal-time-units-per-second`, without imposing
nanosecond resolution. Heap allocation is the difference in
`sb-ext:get-bytes-consed` for the entire process in the same window, not a
per-worker counter or resident memory. Worker CPU is not collected.
No percentiles, speedup, or DB throughput are calculated.

Each worker signals READY **after its first verified recovery**;
main waits for all READY signals before opening GO for the remaining 199. This is a
bounded rendezvous, without sleep or concurrency inferred from timing.
It does not demonstrate parallel execution on distinct cores. Counts include
only recoveries that completed the entire oracle; attempted may
exceed completed by one per worker in a failed attempt.

<a id="errori-quiescenza-e-report"></a>

## Errors, quiescence, and report

Every window has a cooperative **5-second** deadline, checked at
every iteration and gate wait; joins have one additional common
deadline of **30 seconds**, not 30 per worker. An operation already
started is not interrupted. `terminate-thread` is not used. The coordinator
must supervise the process externally if an absolute limit is needed,
including for bootstrap, setup, warmup, and saving outside the window.

A mutex channel communicates the first original condition and first non-deadline
error without consulting concurrent RAW data. A known error takes precedence over
`:incomplete`; later timeouts and joins do not replace the error cause.
Counters are read only after all joins and the quiescence check.
Fixtures close when returning from support wrappers after
this barrier. If a worker remains alive, main saves only its own
data and communicated conditions, marks counts/sink `:unavailable`, and exits
with `sb-ext:exit :abort t`, without running fixture unwind-protect cleanup.
Any supervisor preserves stdout/stderr and the actual exit. A
failed window stops the campaign: partial samples are not promoted.

`report.lisp` is a readable PLIST, `:schema-version 1`,
`:kind :recovery-active-benchmark`, written initially as incomplete,
after every window, and on handled error. It includes parameters, limits,
clock, heap scope, windows, per-worker counters, aggregate counts,
sink, wall time, heap allocation, status, and cause/first-condition. The temporary file is
renamed in the exclusive directory. Exit 0 indicates a complete campaign,
1 error, 2 incomplete. Errors before acquiring output, in
bootstrap, or in persistence require evidence from the external recorder;
they cannot guarantee a final local report. No report proves
the freeze: the coordinator binds helpers and sources through recorder/capture.

This C4 covers one small, healthy synthetic file. It does not cover tails,
corruption, I/O faults, persistence, checkpoint publication, DB
traffic, disk cache, realistic documents, or dataset growth. Three attempts
per cell and wall time with harness do not authorize general conclusions about
latency or scalability. All execution remains subsequent to the freeze.
