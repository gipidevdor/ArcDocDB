<a id="spk-01--indice-primario-a-frammenti"></a>

# SPK-01 — fragmented primary index

> **Proposed** — Phase-0 experiment, authorized by the author; not production code.
> Question, method, and limits are recorded before execution.

**Scope: ADR-0043 v1 layout.** This spike neither implements nor verifies
the v2 format adopted by [ADR-0048](../../docs/adr/0048-limiti-documentali-e-formato-v2.md).
The five-word variant here adds an end CSN: it is not the five-word v2 primary
slot, which distributes fields differently. Sixteen-byte keys and 24-bit lengths
do not verify v2 document limits. `check` and `benchmark` declare
`:layout :adr-0043-v1 :verifies-format-v2 nil`.

<a id="domanda-e-criterio"></a>

## Question and criterion

Does ADR-0043's extendible directory, with fixed-capacity fragments, control bytes,
four-u64-word slots, and local 16-byte keys, allow consistent concurrent lookups
and reclaim space during splits and key churn? Measure memory, insert/get,
allocation, split duration, and retries; author-confirmed ADR-0028 targets remain
to be evaluated on reference hardware. Local verification requires differential
comparisons and no inconsistencies in executed scenarios.

References: ADR-0001, 0028, 0030, 0031, 0032, 0036, 0043, 0050; REQ-IDX-001,
REQ-IDX-003, REQ-IDX-005, REQ-IDX-007, REQ-BEN-001. The spike changes neither
requirements nor shared documents.

<a id="lettura-nel-buffer-del-chiamante"></a>

## Reading into the caller's buffer

> **Proposed** — Experimental v1 variant. The
> [integration method](metodo-integrazione-lettura-buffer.md) records order,
> criteria, and limits before measurements.

`arcdocdb.spk01.lettura-buffer:leggi` uses a private four-word u64 simple-array,
`[CSN, location, length, end-CSN]`, and returns only status and discarded-attempt count.
It writes after seqlock and root recheck; misses, retry-limit, and synchronous errors
preserve output. Direct and callback paths derive from the same local macro, with
`safety 3`. The destination is not atomic publication to concurrent readers.

Launcher CHECK includes the [independent history](metodo-check-lettura-buffer.md),
core comparisons, u64 boundaries, collisions, split/rebuild, root/seqlock witnesses,
and mutants. The [paired matrix](metodo-bench-lettura-buffer.md) runs explicitly;
the original benchmark remains available as `baseline`:

```sh
sbcl --noinform --no-userinit --no-sysinit --script tools/run-spikes.lisp --check SPK-01
sbcl --noinform --no-userinit --no-sysinit --script tools/run-spikes.lisp --bench SPK-01 -- --variant buffer
```

Both widths remain ADR-0043 v1; five words add end CSN and do not verify v2.
Neither engine core nor requirements are changed. All tests are retained in the
[read catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-lettura/catalogo.lisp).
The [final campaign](../../docs/valutazione/risultati-SPK-01-lettura-2026-10-08.md)
completes 80 samples and observes zero bytes consed in the buffer's 40, including
maximum u64 values. Generic-validator residual is measured separately and removed
from the buffer using literal type `(integer 1 8)`, retaining rejections.
Local v1 measurements, without qualifying engine targets.

<a id="metodo"></a>

## Method

- Package `arcdocdb.spk01`; APIs `(check)` and `(benchmark &key ...)`, both returning
  plists. Common Lisp/SBCL only, `safety 3`, no dependencies.
- Immutable directory and generation, CAS-published; high hash bits select fragment.
  Scalar probing in groups of eight control bytes, no SIMD. Four words: CSN,
  segment/offset, key-off/key-len/length/flag, seqlock. Five-word variant adds end CSN
  with the same seqlock.
- One writer per index. Each maintenance pass reads at most C slots from one fragment;
  splits create two fragments, rebuilds one. Directory copying separately costs
  O(2^G), including rebuilds and splits without doubling: every publication copies
  the entire immutable vector. Report counts copied references and distinguishes
  directory time, fragment copying, and total maintenance. `payload-indice` is O(1),
  using writer counters; `indice-statistiche` scans the directory outside measured
  phases. Total maintenance cost is not bounded by C. Depth is configured and checked;
  saturation and extreme collisions cause errors.
- Fixed local C×16-byte arena in this prototype: append-only to limit, then rebuild
  only live keys. ADR-0043's separate arena growth is not implemented. Control:
  empty → occupied → deleted → occupied; no return to empty in the same fragment.
  No fragment merging.
- Reader: at most eight attempts, barriers, and seqlock. `leggi` returns `:retry-limit`
  without blocking. Only the harness uses a mutex to serialize writer and fallback;
  no mutex in reader fast path. Does not simulate the production logical-writer queue.
  Retry counters local to each reader.
- Deterministic keys and golden hashes, explicit 64-bit masks. Multiplicative mixing
  compiles inline with u64 intermediates; standalone function and u64 result transport
  between functions may need boxing. No zero-allocation promise. Measurements separate
  process allocation from structural index payload.
- Verification: golden hash/output, collisions, split, deletion/reinsertion, reclaim,
  limits, seeded sequences against `hash-table`, root recheck with injected interleaving,
  update during seqlock, and concurrent readers with writer. Worker errors returned and
  reraised by coordinator after join; thread cleanup also on error.

> **Decided (2026-10-08 → ADR-0050)** — A retired fragment's frozen state alone does not
> justify the linearization point claimed at reference-read time. The prototype rereads
> root/generation after probing (including misses), discards a result if changed,
> and retries. This experiment replaces neither SPK-07's model nor a memory-model proof
> on both architectures.

<a id="witness-deterministico-per-adr-0043-3"></a>

### Deterministic witness for ADR-0043 §3

`check` returns the witness in `:retired-root`; the fixture uses callback
`leggi :after-fragment` independently of the scheduler:

1. Writer: key K present with CSN 1; reader: acquires root R and fragment F.
2. Writer: updates K to CSN 2 in the same still-active F.
3. Writer: splits F, copies CSN 2 into children, CAS-publishes R′. F is retired.
4. Writer: updates K to CSN 3 in current child.
5. Reader: probes retired F and reads a consistent hit with CSN 2. Without recheck
   it would return 2; R/generation check discards the attempt, rereads R′, and returns
   3 with one retry. The fixture also reads F directly and verifies that the
   unrechecked result is exactly 2.

Hit 2 is incorrect relative to the **declared point** of acquiring R, where K was 1.
This witness falsifies that linearization point; it does not demonstrate a general
linearizability error, since 2 existed during the operation.
Output explicitly states `:general-linearizability-counterexample nil`.
A second sequence verifies that a miss on retired F is also discarded after swap
and insertion into current fragment. Linearization point and O(2^G) cost are qualified
in [ADR-0050](../../docs/adr/0050-pubblicazione-e-costi-della-directory.md), REQ-IDX-007;
swap/reader modeling in SPK-07 remains pending. Frozen-fragment consistency alone
does not fix ADR-0043's previously declared point.

<a id="comandi"></a>

## Commands

From any directory, `run.lisp` resolves `core.lisp` relative to `*load-truename*`,
compiles to `out/core.fasl`, and promotes warnings and style-warnings to errors.
Prints one s-expression plist; failure has nonzero exit status.

```sh
sbcl --script /Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-01-primary-index/run.lisp --check
sbcl --script /Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-01-primary-index/run.lisp --bench
sbcl --script /Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-01-primary-index/run.lisp --bench --documents 1000 --seconds 1 --capacity 64 --readers 2
sbcl --script /Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-01-primary-index/run.lisp --bench --words 5
```

Default uses 100,000 documents, capacity 8,192, four words, two readers, and a
12-second budget for measured phases: approximately 15 seconds total as a goal,
not a timing guarantee. Time is checked in blocks; actual counts, incomplete phase,
and actual duration are always reported. Structural budget 512 MiB (default);
runtime heap limit is set separately. For the serial campaign:

```sh
sbcl --dynamic-space-size 1024 --script /Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-01-primary-index/run.lisp --bench --documents 1000000 --seconds 12
```

10^7 scale is optional, requiring explicit larger budgets and heap and enough time:
`--documents 10000000 --seconds 120 --memory-mib 2048`, with
`--dynamic-space-size 4096` before `--script`. Run campaigns serially.
Memory checking covers current structures and expected transient allocations,
not RSS, uncollected garbage, or objects retained by suspended readers.
No absolute RSS limit is claimed.

<a id="ambiente-misure-e-limiti"></a>

## Environment, measurements, and limits

Output records implementation/version, machine, operating system, parameters,
seed, units, and actual counts. `byte/doc` is exact live-array payload plus directory
references, excluding headers, Lisp structures, runtime heap, or retired fragments.
Allocation comes from `sb-ext:get-bytes-consed`, cumulative for the process,
including bignums and harness; it is not RSS. Throughput includes hashing and key
generation in reused buffer. Split duration includes directory copy and allocation;
rebuild duration is separate. Insufficient timing resolution produces `nil` for
ratios that cannot be calculated.

Separate warmup (256 inserts and 1,024 gets), excluded from phase timings. Each phase
has a sink returned in the report and verifies the read-data pattern.
Seconds are wall time (`get-internal-real-time`), not CPU. Concurrent-phase allocation
includes harness readers and writer: allocation per lookup describes the whole load,
not just a reader function.
Runtime reference: [SBCL manual, barriers and CAS](https://www.sbcl.org/manual/#Memory-Barriers).

The five-word variant checks end-CSN layout and transport, not multiple versions per
key or snapshot selection. WAL, persistence, MVCC, compaction, writer queue, GC pauses,
and machine-code verification of atomic slot access on both architectures are not
covered. Disassembly of the ARM64 hash kernel alone is described below.
Concurrent stress and seeded tests are evidence for executed scenarios, not a
universal linearizability proof.

<a id="risultato"></a>

## Result

`--check` passed on SBCL 2.6.9, ARM64 Apple M4, Darwin 27.0.0:
golden output, 3,000 seeded operations per width 4/5, collisions with explicit
limit rejection, reclaim, root witness, seqlock and forced fallback, limits,
worker-error propagation, and cleanup; two readers × 1,200 operations with
writer × 600 iterations, for both widths. Warning/style-warning-free compilation
through launcher. Stress retry counts vary with scheduler, while assertions
and witness are deterministic.

Short diagnostic, run from cwd `/tmp` on 2026-10-08:

```sh
sbcl --script /Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-01-primary-index/run.lisp --bench --documents 1000 --seconds 1 --capacity 64 --readers 2 --words 5
```

Local report in `out/diagnostic-5.sexp` (Git-ignored). In this sample:
1,000 actual documents; payload 106,048 bytes before and 116,992 after churn;
31 splits and 35 rebuilds after churn. GET: 1,179,552 bytes allocated over 8,000
operations, or 147.444 bytes/operation for measured load. The result rules out
any zero-allocation claim; attribution to bignums, boxing, and other sources
requires profiling. These diagnostics close neither targets nor the 10^7–10^8
gate: report throughputs are not a representative campaign. No long benchmark
ran in this diagnostic; full measurements run serially. Directory growth and
lack of merging require longer churn measurements; an explicit memory limit
implies no maintenance cost independent of Serie size.

<a id="esperimento-successivo-kernel-hash-senza-boxing-evitabile"></a>

### Next experiment: hash kernel without avoidable boxing

> **Proposed** — Recorded before execution: keep SplitMix64, keys, golden values,
> and seed identical; add INLINE to `mix64`, `parola-chiave`, and `hash-chiave`,
> with explicit types on u64 arguments and intermediates, `safety 3`.
> Hypothesis to measure: reduce boxing at internal hash-kernel calls, without
> internal VOPs or algorithm changes. No zero-allocation promise: u64 payloads
> returned by the API may still require boxing.

Local baseline measured at 100,000 documents (report in `spikes/out/4000472823-bench/`):
GET 2.915 M/s and 151.95 bytes/op; INSERT 1.657 M/s and 551.75 bytes/op.
Single diagnostic comparison after warmup, same scale and default parameters
except short `--seconds 1` budget:

```sh
sbcl --script /Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-01-primary-index/run.lisp --bench --documents 100000 --seconds 1
```

Compare primarily bytes/op; duration, actual counts, and sink remain in the
report. Different budgets limit throughput comparability. Before and after:
golden/seed and check; inspect disassembly of compiled wrappers reading/writing
u64 arrays to distinguish kernel from Lisp-return boxing. Verification of high
locations and CSNs also covers u64 above `most-positive-fixnum`.

**Measured diagnostic outcome** — single execution, 100,000 inserts and 800,000
gets completed, `out/inline-hash-100k.sexp`; no warning/style-warning.

| Measurement | Local baseline | INLINE, single diagnostic |
|---|---:|---:|
| GET allocated bytes/op | 151.94986 | 71.94406 |
| INSERT allocated bytes/op | 551.74592 | 219.95536 |
| GET operations/s | 2,915,048 | 3,328,355 |
| INSERT operations/s | 1,657,275 | 1,714,296 |
| Maximum split wall time, ms | 1.613 | 17.171 |

Observed allocation decreases; throughputs describe this sample only.
Maximum split duration increased in the sample: the cause is unprofiled and
remains evidence to retain in replications.
Baseline ran with 4,096 MiB heap, while diagnostic uses runtime default and a
different time budget; this limits GC and latency comparison. No improvement
in maximum cost is concluded.
Live payload before and after churn: 6,422,656 bytes, 64.22656 bytes/doc excluding
headers; 15 splits, 16 rebuilds, 426 directory references copied overall.

Golden hashes fixed by preoptimization FASL for IDs 0, 1, 424,242, and 2^64−1;
same values after INLINE. `check` also verifies CSN, location, and end CSN of
2^64−1, length 2^24−1, and the five-word variant.

Local disassembly: `out/hash-kernel-disassembly.txt`, generated by
`out/disassemble-kernel.lisp` and `out/kernel-probe.lisp`. With `safety 3`, wrappers
read/write u64 arrays and return NIL, excluding Lisp-return boxing from kernel.
In both observed functions: 64-bit `LDR`/`STR`, `ADD`, `MUL`, `LSR`, `EOR`;
no generic-arithmetic call or allocation on the shown code's normal path,
array bounds checks present. Inspection is limited to SBCL 2.6.9 ARM64;
it proves neither zero GET allocation nor whole-protocol atomicity.
Reproducible wrappers, to compile after loading `out/core.fasl`:

```lisp
(in-package #:arcdocdb.spk01)
(declaim (optimize (safety 3) (speed 2) (debug 1)))
(defun probe-mix64 (input output)
  (declare (type parole input output))
  (setf (aref output 0) (mix64 (aref input 0)))
  nil)
(defun probe-hash (chiave output)
  (declare (type ottetti chiave) (type parole output))
  (setf (aref output 0) (hash-chiave chiave 0))
  nil)
```

Comparisons and replications run serially. The 10^7–10^8 gate, O(2^G)
publication cost, and profiling of residual API allocation remain open;
no trie or index-format change.

<a id="microfix-successivo-trasporto-degli-helper"></a>

### Subsequent microfix: helper transport

> **Proposed** — Recorded before verification: INLINE `scegli-frammento`,
> `sonda-reader`, `leggi-slot`, `posizione-sonda`, `impronta`, and `scrivi-chiave`,
> with explicit types on u64 arguments and locals; key-generation `alto` declared
> u64. Hypothesis: eliminate further boxing in hash/key transport.
> Standalone `leggi` API, same v1 layout and `safety 3`.

Planned verification: `--check` and ARM64 disassembly; no further benchmark in
this diagnostic. `inline-hash-100k.sexp` numbers describe the hash kernel before
this microfix. Replications use 4 GiB heap at 100,000 and 10^7 documents,
reporting actual residual allocation.

**Verification outcome** — `--check` passed with warning/style-warning-free
compilation, including widths 4/5, previous-FASL golden values, high u64
CSN/locations, root hit/miss, forced fallback, and threads with cleanup.
Disassembly in `out/reader-after-microfix-disassembly.txt`: `leggi` remains
standalone; hash kernel and listed helpers are incorporated without bridge
function calls. u64 arithmetic and access are visible; three 32-byte boxing
branches remain for CSN/location/end-CSN when not representable as fixnums,
at the returned-value boundary. ARM64 barriers and array checks remain.
No post-microfix allocation measurement ran in this diagnostic.

Previous `scrivi-chiave` disassembly, retained in
`out/key-before-microfix-disassembly.txt`, already showed XOR and byte stores
without valid-path allocation; therefore no 32-byte/op saving is attributed
solely to the `alto` declaration. INLINE's effect on reader allocations must
be measured in replications.

<a id="ambito-del-formato"></a>

## Format scope

<a id="repliche-con-heap-4-gib"></a>

### Replications with 4 GiB heap

> **Proposed (subsequent profiling)** — isolate key generation, hash returning
> into u64 array, and `leggi` API on fixed key. After warmup, one million calls
> per case, dedicated process: process clock and allocated bytes.
> Compare `speed 2` and `speed 3` in reader, retaining `safety 3`; no format or
> check changes. This diagnostic attributes residual cost; it does not measure
> the database.

The [published campaign](../../docs/valutazione/risultati-2026-10-08.md) also retains
results after the complete microfix: GET 3.557 M/s and 47.99 B/op at 100,000
documents; 2.098 M/s and 48.00 B/op at 10 million, with 75,400,960 actual GETs.
At larger scale: 82.21 B/doc payload and maximum split 98.827 ms, cause unprofiled.
No zero-allocation or size-independent pause guarantee. Raw data identify
sources and commands.

This experiment exercises v1 layout. ADR-0048's five-word v2 layout and extended keys require a separate campaign: these results do not verify them.
