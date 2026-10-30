<a id="spk-05--lettura-dei-segmenti"></a>

# SPK-05 — Segment reads

> **Proposed** — Evaluation experiment with synthetic immutable files.
> Product choice remains `pread` into reused buffers
> ([ADR-0017](../../docs/adr/0017-piattaforma-e-io.md)); `mmap` is a comparison.

<a id="domanda-e-criterio-dichiarati-prima-delle-misure"></a>

## Question and criterion declared before measurements

How do cost, observed allocations, and concurrency differ between positional reads
and direct mapped access when verifying the same records? A test is accepted only
if every read verifies header/body CRC32C, key, and stamp, and short reads, EOF,
interruptions, and corruption produce expected outcomes. Comparison closes neither
GET/scan targets nor cache granularity.

<a id="metodo"></a>

## Method

Common Lisp on 64-bit SBCL, `safety 3`, no warnings or style-warnings.
Modules separate I/O primitives, fixture/verifier, and campaign control.
POSIX calls use SBCL contrib modules and libc through `sb-alien`: no project C code.
Synthetic v2 frame is 2048 bytes: header 24, key 8, value 2016; value is a deterministic
pattern, without CBOR. Record verification attests neither commit, visibility, nor durability.

An exclusive file of 8192 records (16 MiB) is generated and verified before measurements.
Controller registers only its created file and removes it afterward with the exclusive
`out/data/` directory. Mapping is `PROT_READ` and `MAP_PRIVATE` over the whole file.
File is neither modified nor truncated while open: `MAP_PRIVATE` protects neither
against external writes nor `SIGBUS` after truncation. Those faults remain out of scope.

Matrix uses 1, 2, and 4 workers, deterministic random access and sequential scans,
three replications alternating method order. Each scan partitions file into disjoint
ranges and traverses once; random case reads the same record count and reuses the
same plan in both methods. Buffers, plans, and samples preallocated per worker.
After 32 warmup reads, a common gate starts work; no shared locks, counters, or writes
during reads. Each worker owns buffer, descriptor, and samples. Shared mapping is read-only.

`pread` path keeps buffer pinned throughout loop and completes partial reads with
increasing offsets. `mmap` path verifies SAP directly without copying record.
Both run the same SAP verifier; value range used only after checks. Measurements
include verification and timing samples; preparation, warmup, aggregation, and cleanup
are separate. Percentiles use upper rank over raw samples.
If observed interval is zero, report declares `:below-clock-resolution`:
throughput and GiB/s are `nil`, with original clock resolution and ticks retained.
No positive duration is forced. Deterministic REQ-BEN-002 fixture verifies zero
duration, one positive tick, negative interval, and incorrect counts; the last two
remain rejected. Dataset is small and freshly written: page cache affects reads,
without eviction control. Not an NVMe cold-cache test.

Matrix allocations cover whole process during startup, warmup, reads, and joins:
include controller and are not engine bytes/GET. A separate test runs only the
read loop on controller thread, with buffer, mapping, and plan ready, without
per-operation timing samples; reports observed `get-bytes-consed` delta.
Even zero delta concerns only that loop, SBCL version, and sample.

Every loop has finite steps. Consecutive syscall interruptions have a ceiling.
Gate waits and joins have 10-second timeouts; this budget cannot interrupt a stalled
syscall. If a worker remains alive, mapping, descriptors, and file are not released
while in use: execution fails and process terminates with resources still owned.

<a id="riproduzione-e-ambiente"></a>

## Reproduction and environment

From repository, with structured records and isolated processes:

```sh
sbcl --script tools/run-spikes.lisp --check SPK-05
sbcl --script tools/run-spikes.lisp --bench SPK-05
```

Default: 8192 records, 1/2/4 workers, two access patterns, two methods, three
replications, 36 cases. `--check` uses 12-record file and finite injections.
No numeric parameter is interpreted by Lisp reader. Runner retains one outcome
plist and nonzero exit on error; separate FASLs per process.
Hardware, OS, SBCL version, configured heap, sources, and observed load are recorded
by harness. macOS/ARM64 results are local; Linux x86-64 reference platform and
beyond-RAM dataset remain to measure.

<a id="risultati"></a>

## Results

The [first variant](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk05-bench-initial.lisp)
completes 36 cases and measures 131,072 bytes allocated in isolated `pread` loop
over 8192 records (16 B/op), versus observed zero in mapped loop. Initial result
remains retained. The [second variant](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk05-bench-inline-shared-sap.lisp)
introduces inline native branch but retains the intermediate SAP shared with injected
branch: delta remains 16 B/op. Generated-code inspection finds 16-byte materialization
before branch. Third variant forms SAP in separate branches; primitives remain
injectable for checks, with same checks, offsets, EINTR limit, and errors.
Repeat the same matrix to verify delta; assume no zero result before measurement.

The [third campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk05-bench.lisp)
passes 36 cases and observes zero delta in both isolated loops.
The [full result](../../docs/valutazione/risultati-SPK-05-2026-10-08.md) reports comparison,
retained failures, and limits. The [final check](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk05-check.lisp)
passes 14 I/O groups, 49 record cases, 5 filesystem cases, two worker errors,
and four real concurrent reads. `out/data/` is empty afterward.

Index, application cache, epochs, pool migration, prepared/OUTCOME, compaction,
injected page faults, and system crashes remain out of scope. RSK-10 and RSK-16
remain open in unexercised areas.
