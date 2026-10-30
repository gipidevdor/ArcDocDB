<a id="revisione-della-consegna-locale-dei-writer"></a>

# Local writer handoff review

Author's reading of the final code and the frozen copy's data;
independent reading and integrated verification retained in the
[catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-handoff/catalogo.lisp).
The two findings from the first reading are retained in the
[decision table](writer-handoff-decisioni.md#prima-lettura-indipendente-e-correzioni):
retry contract and state-check complexity, both corrected.

| Source | SHA-256 |
|---|---|
| `queue.lisp` | `244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90` |
| `handoff.lisp` | `ee90c809ef51134efa21e08b819e5530304efaf9f9e26b63c7e4afbf6d48e607` |
| `tests/execution/handoff.lisp` | `7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e` |

<a id="lettura-dellautore"></a>

## Author's reading

| C1 point | Outcome and scope |
|---|---|
| 1. Requirements/ADR | REQ-CON-001/002/004/005 and REQ-AFF-008; ADR-0045 §§6/8. No requirement or format change. |
| 2. Invariants | INV-P1/P2: FIFO, lease, and cumulative quantum; INV-P5/P6: local guard only, no blocking or state across Serie. INV-A8/V4: explicit budgets and owners. 7200-step oracle and real-thread tests; no qualification of the whole engine. |
| 3. Errors | Full/busy precede acceptance; busy at end retains the lease and does not require reprocessing. Old/foreign tokens and invalid targets rejected. Permanent generation, not-ready ineligible/duplicate. Private FI on guards and seven inconsistent states; invariants to the controller for fail-stop. |
| 4. Bounds | No new loop/recursion/wait in the product; one CAS attempt per guard. Pop delegated, bounded by quantum and span. Timeouts and waits with leases in fixtures force interleavings, and are not product tasks. |
| 5. Allocations | Objects and rings at startup; no explicit allocation on the normal path. Ten preallocated samples observe zero heap; positive control detects 16,777,472 bytes. Local serial measurement, excluding startup, errors, and controller; no universal proof. |
| 6. Verified data | Opaque internal payload, ownership transferred on successful count; FIFO/span/lease delegated to primitives. No persistent data decoded or returned by this component. |
| 7. Decisions | Complete scalar/CASE/cleanup inventory; no new compound and/or in handoff. Raw 173/190 expressions and 16/16 outcomes; 17 unmarked forms included, no exclusions or complete MC/DC. All 16 mutants compile and are detected. |
| 8. Ownership | Wrappers and rings private to a Serie. Ring guard also protects state/count; lease ties owner/generation to the thread. Internal queue not exposed, no copier; no second guard. |
| 9. Traceability/check | Consistent REQ annotations; forced build without warnings, execution suite passes. Final `make check` passes at base `4215fca`, with stable sources; record and output in the catalog. No requirement promoted. |
| 10. Standards | Safety 3, complete ftypes, typed slots, pre/post/error docstrings, functions under 60 lines. State helpers with eight and four paths, within COD-13; no deviation approved or introduced. |
| 11. Parallelism | Messages modify only their own Serie. Future shared obligation only at slice start/requeue. B progresses while A holds guard and lease in the fixture; no measurement of database throughput, fairness, or latency. |
| 12. Atomicity | No durable change or deletion. Count and ready/idle decision coordinated within the same local section; owner release precedes final state and guard release. |

No remaining functional findings within the local contract. The caller must
retain and execute exactly once the task returned by `:schedule`;
the wrapper does not implement a ready list, wakeups, shutdown, or an adaptive pool.
It does not guarantee progress if the caller abandons the obligation or lease.

<a id="lettura-indipendente"></a>

## Independent reading

The [original reading](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-handoff/lettura-indipendente.lisp)
retains the twelve points verbatim and the appendix closing the check at
base `4215fca`. The [author's reading](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-handoff/lettura-autore.lisp)
retains the document and its Git blob separately, before final editorial
additions. The [reviewer probes](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-handoff/probe-revisore.lisp)
retain both the inspection adapter error and the corrected reading;
missing metadata is declared without reconstruction.

The subsequent integration of UTF-8 validation at `7f8ca93` adds
the codec module to ASDF and its row to the index. Execution code,
its tests, and the two campaign tools remain unchanged; ASDF and
the index retain both contributions. The [full integration check](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-handoff-main/check-integrato.lisp)
passes with exit 0 and stable sources: 220 module tests plus smoke,
40 files in the linter without violations, and ten spikes. The new ASDF SHA-256 is
`189c9601616e7b4f013d68954fa0a249b76f9416096b19950b841a4c63621b7e`.
The [independent appendix](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-handoff-main/lettura-indipendente.lisp)
checks this integration separately, retaining the previous reading.

<a id="strumenti-e-tentativi-conservati"></a>

## Tools and retained attempts

C4 tools are compiled in full with fatal warning/style-warning.
Self-tests check authentic markers, missing/ambiguous targets, wrong sink,
zero clock, existing destination, and persistence of partial reports.
Baseline, logs for all sixteen mutants, and measurements are retained in full.

The compilation adapter's first two attempts failed before
the campaigns: contrib `sb-md5` not preloaded during `compile-file`,
then SBCL argv not set for the FASL main. The corrected adapter
preloads contribs and sets both argv values. The first coverage
exporter looked for `index.html` instead of `cover-index.html`: the path was corrected,
without changing or repeating the coverage campaign. Output and sources for
these attempts are retained; they are not counted as detected mutants.
