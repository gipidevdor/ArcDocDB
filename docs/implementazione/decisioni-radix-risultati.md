<a id="ordinamento-misurato-e-letture-concorrenti-delle-decisioni"></a>

# Measured sorting and concurrent decision reads

> **Measured proposal, 2026-10-09** — recovery uses stable LSD radix from
> 1,024 ID16 values per decision and from 256 physical DECISIONs; below the respective
> thresholds it retains bottom-up merge. Both choices precede coalescing
> and change neither API, persistent format, nor corruption classification.

The [registered method](decisioni-radix-metodo.md) requires a radix median
at most 90% of merge for every measured pattern and cardinality
at or above the threshold. The second matrix meets the criterion separately
for both paths. This comparison concerns only local macOS/ARM64
sorting with SBCL and safety 3, without I/O or prepared-record application.

<a id="risultati-e-scelta-delle-soglie"></a>

## Results and threshold selection

The table reports the **worst radix/merge ratio across patterns** for
each cardinality. A value below one indicates less radix time.
Complete data retain three replicates, ticks, iterations, allocations,
calibrations, oracles, and quality status of each sample.

| N | ID16: worst ratio | TXID: worst ratio |
|---:|---:|---:|
| 16 | 5.043 | unusable for threshold |
| 64 | 1.951 | 1.928 |
| 256 | 1.160 | 0.760 |
| 1,024 | 0.858 | 0.636 |
| 4,096 | 0.732 | 0.526 |
| 16,384 | 0.623 | 0.478 |
| 65,535 | 0.555 | 0.431 |

At adopted cardinalities, measured time decreases by 14.2–86.9%
for ID16 and 24.0–85.6% for TXID, depending on pattern. Percentages
do not describe complete recovery or query throughput. ID16
values with all variable bytes have correlated halves; external load
is uncontrolled. Measurements do not extend to unmeasured distributions or
cardinalities, Linux/x86-64, P99, or engine performance.

The first matrix with 50 ms calibration did not authorize a TXID threshold:
some samples fell below the minimum. It is preserved, including that
negative selection. A full repetition was registered in advance
with 100 ms calibration target and unchanged 50 ms sample minimum.
In the second matrix, five TXID scenarios with N=16 reach the ceiling
before target and remain unusable; they are below both adopted
thresholds. The matrix is not presented as 63 fully qualified scenarios.

The 64 MiB limit concerns harness-copy payload. Product scratch,
u64 histograms, headers, and output are outside that limit.
Sorting allocations and any GC are included in the clock;
zero heap is not claimed. Product workspace follows actual measurement,
with a scratch vector and 256 counters, without depending on unused budgets.

<a id="correttezza-e-parallelismo"></a>

## Correctness and parallelism

Radix sorts ID16 from byte 15 to byte 0 and unsigned TXIDs from least
significant to most significant digit. Scatter visits elements in physical
order and retains duplicate stability. A pass is skipped
only after a complete count finds a single occupied class; scratch
is not swapped when the pass is skipped. Final module checks
continue to detect duplicate participants and inconsistent ordering.

Concurrent queries read the same table completed before workers
start. Six real threads use exclusive buffers, output, and error state,
compared in full with a declarative oracle. The log buffer
is reused before queries. Joins have timeouts, and worker
errors are not promoted to success. The test exercises the read-only
and ownership contract; it neither measures parallel speedup nor implements
a new product execution pool. Table sorting occurs
before concurrent queries and remains serial.

<a id="prove-conservate"></a>

## Preserved evidence

[Campaign catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-radix/catalogo.lisp),
[second-matrix selection](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-radix/selezione-100ms.lisp),
[decision inventory](decisioni-radix-decisioni.md), and
[C1 readings](decisioni-radix-revisione.md). Data also retain failed
drivers, self-tests rejecting wrong algorithm, existing destination,
partial report, and zero time. Warning-free compilation, mutants, and
raw coverage remain evidence distinct from performance measurements.

The suite contains 43 dedicated DECISION tests and 62 with the scanner.
The targeted campaign detects 14 mutants out of 14 after tests start,
without survivors, compilation errors, or pre-test failures. Across six
`decisions-*` files, raw coverage is 1,332/1,530 expressions and 138/176
branch alternatives. The new radix file observes 384/409 expressions and
53/54 alternatives: the missing branch checks an array length outside
u64, impossible on the examined runtime with a narrower fixnum `index`.
Missing top-level forms and defensive postconditions remain in totals,
as explained in the inventory; no exclusion is approved.

```sh
sbcl --noinform --no-userinit --no-sysinit --script tools/decisions-sort-bench.lisp --self-test
sbcl --noinform --no-userinit --no-sysinit --script tools/decisions-sort-bench.lisp --bench spikes/out/decision-sort-new/
sbcl --noinform --no-userinit --no-sysinit --script tools/decisions-radix-mutation.lisp --self-test
sbcl --noinform --no-userinit --no-sysinit --script tools/decisions-radix-mutation.lisp --run spikes/out/decision-radix-mutants-new/
make check
```

Every destination must be new. Defensive guards remain in
coverage denominators: this comparison introduces no approved
exclusion or MC/DC qualification.
