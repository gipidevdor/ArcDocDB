<a id="primo-incremento-dellindice-automatico--risultati"></a>

# First automatic-index increment — Results

Date: 2026-10-22. Contract and limits in [automatic index](indice-automatico.md).
SBCL 2.6.9 on macOS ARM64. External load is uncontrolled; no
engine performance benchmark is run or inferred from these data.

The [closed archive](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-22-index-auto-targeted/catalogo.lisp)
preserves increment sources, suite driver, and records of
two processes, both with OK status, exit 0, and stable sources before/after.
Git base and complete hash inventory are in original records.

<a id="selettore-c1"></a>

## C1 selector

Strict compilation of system and test definitions, followed by
only the new suite: 8 tests passed. Checks cover resident startup at exact quota,
growth requiring paging, sufficient/insufficient transient capacity, return
with hysteresis, changing quotas, Serie independence, domains, and
integer-boundary rounding. The serial 10,000-decision window
observes zero Lisp bytes allocated with expected sink 3994.

This result does not establish sufficiency of future runtime estimates:
the selector receives trusted samples, not RSS or GC measurements. Persistent backend
and migration are absent; the overall requirement remains designed.

<a id="lifetime-c4"></a>

## C4 lifetime

The [preregistered method](../../spikes/SPK-07-protocols/metodo-page-lifetime.md)
and model are preserved in the archive with complete counterexamples.

| Readers | Reuses | States visited | Edges | Violations |
|---:|---:|---:|---:|---:|
| 1 | 1 | 65 | 95 | 0 |
| 1 | 2 | 153 | 233 | 0 |
| 2 | 1 | 745 | 1574 | 0 |
| 2 | 2 | 2316 | 4984 | 0 |

Calculated total: 3279 states and 6886 edges across four correct configurations.
Every configuration reaches success, copying during RETIRING, reuse blocked
by protection, and late announcement. The hard 200,000-state limit is not reached.

| Negative control | Expected and observed outcome |
|---|---|
| Without READY/token revalidation | Copy of a different incarnation; counterexample preserved. |
| Release between two copies | Second field reused; counterexample preserved. |
| Reclaimer ignores hazard | Frame overwritten during protection; counterexample preserved. |
| Token recycled after two reuses | ABA accepted by comparison, rejected by incarnation oracle. |

These are finite enumerations under SC and terminating abstract primitives. Model
safety and the six-own-step bound per attempt are not proof
of lock-freedom for complete lookup or GET. Real CPU, SBCL atomics,
directory, snapshots, finite cache, and I/O misses remain open gates.

<a id="revisione-e-integrazione"></a>

## Review and integration

Contract and interleaving readings check scope,
budgets, validation, and ABA; they are reviews by the same author, not independent
C1 review. Suite and model are registered in the CI catalog
and SPK-07 respectively. Global repository checks remain verification
separate from the two initial executions preserved here.
