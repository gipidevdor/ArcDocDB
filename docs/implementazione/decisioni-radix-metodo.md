<a id="metodo-ordinamento-delle-decisioni-e-consultazioni-parallele"></a>

# Method: decision sorting and parallel queries

Registered before measurements of 2026-10-09. Scope: in-memory
recovery sorting without I/O, prepared application, or persistent-format
changes. Public table remains owned/immutable.

<a id="candidati-e-criterio"></a>

## Candidates and criterion

Baseline: already verified stable bottom-up merge. Candidate: stable
base-256 LSD radix, eight digits per u64 TXID and sixteen per ID16. Passes
with only one occupied class preserve order and may be skipped.
Workspace remains bounded by actual data plus 256 counters, without
allocation proportional to unused budgets.

For fixed width `w`, radix requires `O(w × (N + 256))` work;
merge requires `O(N log N)` comparisons. Stable distribution of each
digit preserves physical order of equal TXIDs and hence first-conflict
provenance. Primary reference: [Sedgewick and Wayne, LSD](https://algs4.cs.princeton.edu/code/edu/princeton/cs/algs4/LSD.java.html).
Adaptation uses **unsigned** u64 integers, without sign reordering
required by reference Java integers.

No adoption on asymptotic complexity alone. Measure small,
medium, large cardinalities, ID16 with common prefix and all bytes variable
(both halves correlated), ordered, reversed, scattered, duplicate,
and uniform TXIDs. Choose separate ID16/TXID thresholds. For every scenario
with `N >= soglia`, radix median must be at most 90% of merge
median. Threshold itself must be measured cardinality. With conflicting results,
retain merge on respective path; candidate not left
as unused product code.

<a id="correttezza-e-concorrenza"></a>

## Correctness and concurrency

Independent `stable-sort` oracle in tests comparing all bytes
and entry identities, including duplicates. Extreme u64 values,
odd cardinalities and digit boundaries; uniform passes, already
sorted/reversed input, IDs differing in each of 128 bits.
Repeat public contracts: idempotent/conflicting duplicates,
first physical conflict, budgets, ownership, no partial results.

Real workers query same table published before
start in parallel: each owns inputs, outputs, error state. No
table write, global counter, or query-path lock.
Test compares outputs with serial oracle and waits for
threads with timeout. Workers belong to harness; do not introduce
per-request engine threads or new global pool.

<a id="misure-e-conservazione"></a>

## Measurements and preservation

Sorting only inside measurement windows; fixtures, copies to restore,
compilation, warmup, oracle comparison outside window.
Internal algorithm allocations and any GC remain included.
Alternating merge/radix replicates, fixed seed, raw heap/tick counters,
resolution and actual duration preserved. Three replicates per algorithm,
separately calibrated iterations, alternating execution order.
Samples below resolution or shorter than 50 ms target, even after
reaching cap, make selection inconclusive for that cardinality
suffix: no ratios usable for adoption.
Calibration bounded in attempts, iterations, copy bytes.
64 MiB limit concerns copy payload (eight bytes per
entry reference); excludes headers, outputs, oracle, scratch.

Driver self-test: deterministic fixture/oracle, wrong algorithm
detected, correct zero-time classification. Two readings, lint,
targeted mutants, raw coverage, `make check`; commands, hashes, failed
attempts preserved in catalog. Local macOS/ARM64 measurement
qualifies neither Linux/x86-64 performance, P99, zero heap, nor whole engine.

<a id="ripetizione-per-durata-insufficiente"></a>

## Repeat for insufficient duration

First full matrix retained samples below 50 ms minimum,
even after initially sufficient calibration. Does not authorize
TXID threshold; preserved in full. Before second matrix,
calibration target raised to 100 ms to leave margin for variation
between windows. Minimum each sample still 50 ms; 10%
criterion unchanged. Entire matrix repeated with same seed, without selecting
favorable cases alone. Calibration reaching cap before
100 ms remains insufficient, even with longer later samples.
