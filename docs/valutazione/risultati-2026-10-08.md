<a id="prima-campagna-locale--2026-10-08"></a>

# First local campaign — 2026-10-08

[Assessment](README.md) · [Experiments](../../spikes/README.md) · [Roadmap](../roadmap.md)

Measurements from **v1** experiments and the subsequent **v2** campaign, kept distinct;
these are not complete-engine measurements. Format v2 follows
[ADR-0048](../adr/0048-limiti-documentali-e-formato-v2.md). Engine requirements
remain designed. No figure below confirms ADR-0028 minimums.

<a id="riproducibilità"></a>

## Reproducibility

Apple M4, ARM64, 10 logical CPUs, 16 GiB RAM, Darwin 27.0.0, SBCL 2.6.9 GENCGC.
Workspace filesystem APFS, internal disk. Wall clock: 1,000,000 ticks/s.
Child process heaps: 4,096 MiB. Every spike compiles without warnings or
style-warnings; `safety` 3 except separate CRC kernels at `safety` 2/3.

```sh
make check
make spikes-bench
sbcl --noinform --no-userinit --no-sysinit --script tools/run-spikes.lisp --bench SPK-09
```

The harness runs processes **serially**. The workspace is a development
machine: external load uncontrolled, `vm.loadavg` observed at startup
`{4.60 3.77 3.12}`, CPU frequency and temperature not recorded. An initial campaign,
not a distribution of replicas. Children disable user and
system initialization; commands, revision, and local changes
are in reports. New reports add source Git blobs.

Preserved raw data, readable with `*read-eval* nil`:

- [Initial campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/baseline.lisp), from
  local directory `4000472823-bench`, revision `7301991` with declared changes.
- [Inline verifier](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/crc-inline.lisp), from
  local directory `4000472979-bench`, same CRC parameters.
- [Inline index, 100,000 documents](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/index-inline-100k.lisp),
  directory `4000473749-bench`, default parameters and source blobs.
- [Inline index, 10 million](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/index-inline-10m.lisp),
  directory `4000473801-bench`, command below and source blobs.
- [Integrated v2 checks](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/v2-integration-check.lisp),
  directory `4000475177-check-53215-0`; decoded result and before/after blobs.
- [First v2 campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/v2-bench-initial.lisp),
  directory `4000475258-bench-54418-0`; three modules measured serially.

Reports predating the `:result` field have separate structured imports:
[baseline](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/baseline-structured.lisp),
[inline CRC](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/crc-inline-structured.lisp),
[100k index](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/index-inline-100k-structured.lisp),
[10M index](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/index-inline-10m-structured.lisp).
They preserve original environment and output; they do not invent missing metadata.

Every file preserves original stdout/stderr and commands. Revision predates
the optimizations described: modified tree is explicit, and the campaign
is not attributed to a clean checkout. Variants are documented in spike READMEs.

<a id="spk-01--indice-primario"></a>

## SPK-01 — primary index

First campaign: 100,000 documents, 16-byte keys, 8,192-slot fragments,
four words, two readers. Scalar grouped lookup; hash, key generation,
and response checking included. No segment read.

| Initial phase | Operations | Operations/s | Process allocated bytes/op |
|---|---:|---:|---:|
| INSERT | 100,000 | 1,657,275 | 551.75 |
| GET | 800,000 | 2,915,048 | 151.95 |
| Churn, DELETE + INSERT | 100,000 | 1,604,518 | 428.15 |
| Concurrent GETs on same key | 2,000,000 | 8,212,372 | 129.76 |

Live array payload is **6,422,656 bytes, 64.22656 bytes/document**,
before and after 50,000 key replacements. Excludes Lisp headers, runtime,
garbage, and fragments retained by readers. 15 splits, 16 rebuilds; maximum split
1.613 ms and rebuild 1.453 ms in sample. Directory copies 426 references
overall, at most 16 per maintenance. This small scale does not
verify its maximum cost, clarified by [ADR-0050](../adr/0050-pubblicazione-e-costi-della-directory.md).

Concurrent stress: 200,000 writer updates, 74,888 discarded attempts,
42 fallbacks to the harness-only mutex. This is not the production pool. A workload
on one hot key does not represent random lookups on a large archive.

> **Proposal** — Reduce boxing of internal transfers, retaining hash and
> fixtures. First inlining of hash alone reduces allocation in local
> diagnostics but does not eliminate it. Replicas with equivalent heap and larger scale
> must precede a throughput conclusion.

<a id="inlining-e-scala-10"></a>

### Inlining and 10⁷ scale

The next experiment also includes reader and key helpers,
with explicit u64 types. Hash and golden vectors remain the same; `safety 3` and standalone
API. Distinct samples, same 4 GiB heap:

| Phase | 100,000 documents, operations/s | Allocated bytes/op | 10 million, operations/s | Allocated bytes/op |
|---|---:|---:|---:|---:|
| INSERT | 2,817,616 | 171.09 | 1,650,123 | 225.83 |
| GET | 3,556,994 | 47.99 | 2,097,987 | 48.00 |

```sh
sbcl --noinform --no-userinit --no-sysinit --script tools/run-spikes.lisp \
  --bench SPK-01 -- --documents 10000000 --seconds 60 --memory-mib 2048
```

All 10 million INSERTs complete; GET: 75,400,960 operations, stopped
by phase budget before the 80-million ceiling. Campaign measures
42.214258 seconds. Live payload is **822,099,968 bytes, 82.2099968 B/doc**,
before and after 50,000 replacements. 2,048 fragments, depth 11, 2,047 splits,
no rebuild in this brief churn. 234,766,336 key bytes copied;
2,796,202 directory references copied, at most 2,048 per maintenance.

Maximum split **98.827 ms**, versus 1.030 ms in the inline 100,000-document
sample; maximum directory-copy time 0.025 ms. Fragment-copy time
includes allocation, scheduler, and possible GC. Cause of the
maximum was not profiled: it is **not** attributed to the collector by deduction.
Residual allocations include harness and boxing; zero is not promised.
The first local inline-hash sample also observed a
17.171 ms split with a different heap: it remains in its README.

> **Proposal** — GET allocation is reduced from about 152 to 48 B/op in
> the equivalent 100,000-document sample. Before the engine, reader
> allocations need further isolation and maintenance needs profiling.
> Local 10⁷ scale is now observed; 10⁸, ARM64/x86-64, weak memory,
> sustained churn, v2 index, and Linux platform remain open.

<a id="diagnostica-di-allocazione"></a>

### Allocation diagnostics

[Speed 2 profile](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/profile-speed2.lisp) and
[speed 3 profile](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/profile-speed3.lisp): three windows
of 1,000,000 operations, each preceded by 10,000 warmup and full GC outside
the window. Fixed key, reused buffer, 8,192-slot fragment.

| Window | Observed allocations, speed 2 | Observed allocations, speed 3 |
|---|---:|---:|
| Key generation in reused buffer | 0 bytes | 0 bytes |
| Hash and direct write to u64 array | 0 bytes | 0 bytes |
| `leggi` API, fixed key | 47,960,640 bytes | 47,960,640 bytes |

Residual allocation of about **47.96 B/lookup** is therefore observed even when calling
the API with a fixed key, without attributing it entirely to benchmark key
generation. The individual responsible instruction is not yet isolated.
The reader's `speed 3` variant did not reduce residual allocation and was withdrawn;
`safety 3` in both. One sample does not prove universal zero allocation.

The new profiling runner's first attempt had an extra parenthesis:
[failed campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/profile-compile-failed.lisp) and
[process diagnostics](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/profile-compile-failed-process.lisp)
are preserved. Correction and successful runs do not erase failure.

## SPK-02 — GC

48/48 cases completed in 6,953.525 ms: 128 MiB live, four layouts, workers
1/16/64, three requested allocation rates, and comparison with parked workers.
Three collection requests per type and case; automatic window of 80 ms.

Maximum **wall time of the `gc` call** across each row's profiles:

| Layout | Workers | Gen 0, ms | Full, ms |
|---|---:|---:|---:|
| Large array | 1 | 0.993 | 4.787 |
| Large array | 16 | 16.013 | 15.485 |
| Large array | 64 | 197.966 | 36.013 |
| Fragments | 1 | 1.050 | 5.122 |
| Fragments | 16 | 2.023 | 5.581 |
| Fragments | 64 | 61.359 | 52.297 |
| Replaced fragments | 1 | 1.190 | 5.403 |
| Replaced fragments | 16 | 4.666 | 28.302 |
| Replaced fragments | 64 | 32.340 | 13.040 |
| Foreign | 1 | 0.928 | 5.365 |
| Foreign | 16 | 2.507 | 7.361 |
| Foreign | 64 | 40.695 | 81.843 |

Time includes coordination and scheduling; it is **not** an exact measurement of
all-thread stop/resume. Runtime-counter deltas are separate in
reports. Automatic windows can aggregate multiple collections or
observe none: absent samples are not zero pauses. With 64 workers on 10
CPUs, compute-resource contention is also exercised.

> **Proposal** — Measure the real pool distinguishing active, parked,
> and I/O-blocked workers. Moving to foreign memory alone does not resolve
> observed costs. Heaps of tens of GB, more samples, and Linux remain necessary
> to assess the GC objective; this campaign does not certify P99 or P99.9.

<a id="spk-03--append-e-flush"></a>

## SPK-03 — append and flush

12/12 cases, 2,048-byte records, batches 1/32/128, files 1/4, 16 measured flushes
per file beyond warmup. Every octet checked after reopening; cleanup limited
to created files. No error or primitive fallback.

| Files | Records/batch | F_FULLFSYNC, median ms | Synchronized records/s |
|---|---:|---:|---:|
| 1 | 1 | 3.971 | 249.7 |
| 1 | 32 | 3.981 | 7,800.1 |
| 1 | 128 | 3.852 | 32,034.0 |
| 4 | 1 | 11.800 | 279.4 |
| 4 | 32 | 11.747 | 9,800.8 |
| 4 | 128 | 11.818 | 39,593.8 |

Throughput covers only the I/O interval, not batch formation, SEAL
protocol, network, or client latency. Ordinary `fsync` is reported separately: on
Mac it does not meet the required contract, so its throughput is not used
as durable throughput. For one file/batch of one record, median `fsync`
is 0.032 ms versus 3.971 ms for `F_FULLFSYNC`: the comparison changes the contract.

> **Proposal** — Retain group commit and serial append/flush per file;
> measure concurrency, batches formed during flush, and queues on the reference
> Linux device. Reopening and completed syscalls do not prove
> persistence after power loss. Sixteen samples do not describe P99.

<a id="spk-07--protocolli"></a>

## SPK-07 — protocols

Deterministic exploration of finite configurations with negative controls.
Correct models: horizon 43 states/72 transitions; multiseries 59/114;
EDIT/reclaim 19/28; seqlock 127/164; snapshot registration 28/34. Enumerations:
85 persistence combinations, two witnessed corruptions, 2,256 compaction/reconstruction
cases, 25 reconciliation/recovery cases.

The ring counterexample is corrected by ADR-0046; mutants for premature forget,
reclaim with references, unvalidated seqlock, and omitted snapshot threshold
are detected. Suite is now extended with publication, snapshot expiration,
compaction with ACTIVE writer, and observed barrier-order models. The
[module method and results](../../spikes/SPK-07-protocols/README.md#estensione-dei-modelli--2026-10-08)
preserve each enumeration's boundaries; the
[final integrated record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk07-final-spikes-check.lisp)
contains decoded results, source hashes, and original output.

Publication: 25 explorations, 64,316 states overall, 12 correct models and
6 negative controls. Expiration: 67,558 positive states, 14 coverage witnesses,
and 5 detected mutants. Compaction: 98 positive graphs, 7,994 states, 11,592
logical crash projections, and 8 detected mutants. Barriers: 280 correct orders
without violations; each of 4 mutants produces 54 violations in 840 orders.
Counts from different modules are not summed: units and domains differ.

Mutants without root rechecking violate the generation contract but
remain linearizable in explored histories. Complete weak memory
with multiple slots/readers and actual-byte crashes remain open. This is not FI-01…FI-13 coverage on
an existing engine or a performance benchmark. All attempts, including failures
or counts corrected later, are in the test catalog.

[Final verification of commit 8e4f98f](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk07-final-verification.lisp)
runs in a clean checkout: 26 foundation tests, compilation without
warnings, lint and its self-test, traceability and local links,
test catalog, and 7 spikes passed. Regenerating traceability
does not change preserved documents. This outcome does not close product gates.

<a id="spk-09--integrità-e-ottimizzazione"></a>

## SPK-09 — integrity and optimization

23,370 CRC comparisons; PUT and OUTCOME corruptions and truncations rejected in
declared cases. `verify-prepared-record` compares TXID and CSN against validated
OUTCOME under ADR-0047; provenance, SEAL, and manifest resolver remain
to implement.

CRC slicing-by-8 at `safety 3`, initial campaign:

| Covered bytes | ns/operation | Decimal MB/s |
|---|---:|---:|
| 20, header | 38.354 | 521.5 |
| 128 | 175.420 | 729.7 |
| 2,048 | 2,894.889 | 707.5 |
| 16,384 | 23,317.339 | 702.7 |

Inlining verifier and accumulator avoids passing CSN as an
intermediate Lisp object. Same bytes, fixtures, and checks, `safety 3`:

| Body / CSN | Before, ns/op | Inline, ns/op | Before, allocated bytes/op | Inline, allocated bytes/op |
|---|---:|---:|---:|---:|
| 20 / 17 | 127.121 | 116.410 | 0 observed | 0 observed |
| 20 / 2⁶⁴−1 | 132.790 | 116.245 | 32.054 | 0 observed |
| 2,048 / 17 | 4,954.069 | 4,942.166 | 0 observed | 0 observed |
| 2,048 / 2⁶⁴−1 | 5,102.767 | 4,946.888 | 31.864 | 0 observed |

This is one pair of runs with fixed case order. It does not imply
a zero-allocation guarantee for every API: the public parser returning
a u64 may still require boxing. The allocation counter has granularity
and measures the process; timings and comparisons are also subject to declared noise.

<a id="spk-10--limiti-v2-e-integrazione"></a>

## SPK-10 — v2 limits and integration

Strict compile without warnings/style-warnings, `safety 3`. Scope of
[integrated verification](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/v2-integration-check.lisp):

| Scope | Local outcome and quantity |
|---|---|
| v1/v2 codec | 416 cases; 16 MiB documents and maximum record 16,842,775 bytes |
| v2 index | 8 groups, 600 differential operations, 664 oracle comparisons; 7 budget-rejection snapshots |
| Iterative CBOR | 614 cases; depth 100/101, 16 MiB/+1, nodes and bytes; map keys/values traversed |
| Fileheader | 8 accepted and 2,393 rejected; parser not selected on invalid headers |
| Modeled migration | 208 crashes, 4,160 recovery interruptions, 208 reruns; 3/3 mutants detected; maximum 22/32 steps |
| Five-component connection | 16 positive combinations, 1 negative, 113 assertions; 1/255/256/65,535-byte keys, depth 100, and 16 MiB document |

The negative fixture has both CRCs valid but nonminimal CBOR: it passes the
codec and is rejected by the validator. Module data also include local
attempts: [codec](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/v2-codec-check.lisp),
[index](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/v2-indice-check.lisp),
[CBOR](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/v2-cbor-check.lisp),
[migration](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/v2-migrazione-check.lisp).

The [first v2 campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/v2-bench-initial.lisp)
ends in 6.127524 s, including compilation and checks. Codec: 283,430
validations of 41-byte records in a 0.25 s window; not the cost
of the maximum record. Index, distinct loads without splits:

| Key, bytes | Documents | Operations, including modifications | Window, ms | Final payload, bytes | Transient peak, bytes |
|---:|---:|---:|---:|---:|---:|
| 16 | 10,000 | 30,128 | 12.003 | 933,896 | 1,064,984 |
| 256 | 1,000 | 3,128 | 2.962 | 608,264 | 870,664 |
| 65,535 | 64 | 320 | 60.336 | 4,199,560 | 12,658,959 |

With maximum keys the load exercises a rebuild: 128 slots visited, 63 entries
copied, 4,325,310 bytes copied in maximum maintenance, maximum
preparation time 8.357 ms. Memory counted as array payload, excluding
headers, runtime, and retired roots; time budget is cooperative. No
throughput comparison between differently sized loads is deduced from the table.

The first CBOR validator allocates about **7,742 B/call** even on scalars:
it preallocates 100 stack frames. Text samples require UTF-8 validation:
1 KiB encoded text, 68,274 operations in 0.416670 s; 64 KiB, 1,425 in
0.416874 s. Bytestrings check length and skip payload: values
`:encoded-mib-per-second`, especially at 16 MiB, **are not read,
CRC, or scan bandwidth**. Stack allocation is the subject of a subsequent variant,
with results preserved separately.

<a id="cbor-con-pila-creata-su-richiesta"></a>

### CBOR with on-demand stack creation

The subsequent variant preserves all 614 cases and adds 15 fixtures for the number
of frames actually created: **629 cases**; [recorded checks](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/v2-cbor-allocation-check.lisp).
Scalars and empty containers create no stack; the first nonempty container
creates the vector bounded to 100 references and only necessary frames, reused
among siblings. No global state or shared pool, same API and `safety 3`.

[First variant measurement](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/v2-bench-lazy-stack.lisp)
and [replica](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/v2-bench-lazy-stack-replica.lisp), with
the same six loads and bounds; processes finished in 6.542664 and 5.431828 s,
integrated checks included, source blobs unchanged in both snapshots.

| Case | Before, allocated bytes/call | Variant, first measurement | Variant, replica |
|---|---:|---:|---:|
| 1 KiB encoded bytestring | 7,742.63 | 528.52 | 528.52 |
| 16 MiB encoded bytestring | 7,742.05 | 527.42 | 528.08 |
| 4,097 nodes, depth 1 | 7,743.63 | 1,416.05 | 1,416.04 |
| Depth 100 | 7,742.71 | 7,679.48 | 7,678.88 |

About **93% allocation reduction** in both binary loads, without
deducing zero allocation or a universal guarantee. Depth 100 requires
almost every frame and retains a similar cost; improvement depends on
the number of avoidable frames. The counter is process-wide and has granularity.

UTF-8 timings vary: 1 KiB text, initially 68,274 operations and
28,665/85,716 in both variant measurements, each in about 0.41667 s;
64 KiB text, initially 1,425 and 495/1,382 in replicas. External load
is uncontrolled (`vm.loadavg` at startup 10.08/11.16/10.56 in initial
campaign and 13.98/13.33/11.78 in first variant). The difference is not causally
attributed and no general throughput increase is claimed.
The replica also retains the slower measurement.

[Allocation quotients](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/v2-cbor-allocations.lisp)
are preserved as derived data: allocated bytes divided by operations,
with references and hashes for three originating reports. Calculation
adds no new measurement or extrapolation.

> **Proposal** — These checks provide evidence of representable boundaries and
> in-memory connection. The v2 gate remains open: CBOR subset without tags,
> floats, and other simple values; single-fragment index; migration model without
> byte conversion, filesystem, or real readers; hint-section CRCs and
> prepared records excluded. Complete decoder, directory/splits, weak memory,
> RSS budget, and interrupted actual conversion on the reference platform are required.

<a id="decisione-operativa"></a>

## Operational decision

[Complete local verification](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/full-verification.lisp)
ends with exit code 0 and unchanged sources in both snapshots: warning-free
build, two smoke tests, linter and negative linter checks, traceability,
links, evidence catalog, and [six spikes](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/full-spikes-check.lisp).
114 requirements, 65 invariants, 13 FI scenarios, 51 ADRs at verification time.
These are local checks; no execution of the new Linux/macOS CI is claimed.

> **Proposal** — Preserve experiments and measured optimizations;
> complete v2 gate, missing models, and Linux campaign before C1 engine.
> Next work: index scale and allocations, pool with realistic
> load, prepared resolver, and I/O with real pipeline. Reliability and
> verifiability retain priority over throughput under ADR-0031.
