<a id="revisione-della-lista-dei-writer-pronti"></a>

# Ready writer list review

C1 scope: the ready list's two sources, API/ASDF, and composition with
handoff. No persistent change or qualification of the whole scheduler.

<a id="lettura-dellautore"></a>

## Author's reading

| C1 point | Outcome and scope |
|---|---|
| 1. Requirements/ADR | REQ-CON-001/002/004/005 and REQ-AFF-008; ADR-0045 §§6/8, ADR-0005. The shared ready list is touched per slice, without a common queue per request. |
| 2. Invariants | Local FIFO, exclusive guard, finite capacity, and ownership of the obligation. The writer state machine remains in the previous handoff; no second membership to synchronize. Oracles and concurrent tests are checked in the separate campaign. |
| 3. Errors | Invalid input/full/busy precede mutation. Scan busy is a result without conditions; the worker retains the reference taken during start busy. Invariants signaled to the owner for fail-stop, without rollback or implicit controller. |
| 4. Bounds | Factory <=64 partitions; scan <=64 acquisitions, <=128 CAS including releases. No retry, spin, recursion, or wait in the product; ring <=65536 slots. |
| 5. Allocations | Structures/rings at startup; no explicit allocation on the normal path. The campaign measures handoff/list composition, not startup or error conditions; observed heap is reported without a universal promise. |
| 6. Data | The list carries references to the verified writer type; it does not interpret payloads or persistent data and does not read writer state. No callbacks, I/O, or engine responses. |
| 7. Decisions | Separate scalar checks, CASE/default, and cleanup inventoried. No new compound and/or; raw expressions and outcomes remain in the full denominator without approved exclusions or implied MC/DC. |
| 8. Ownership | Partitions/slots/capacity private and read-only where applicable, no copiers. Indices and contents under guard, worker-local cursor. Caller→ring→worker obligation; exactly one publication is a caller precondition. |
| 9. Check | `make check` at 33aa224: 294 tests plus smoke, lint on 52 files without violations, trace/link/evidence, and ten spikes passed; record 4000522904-command-41347-0 OK/STABLE/exit0. Engine gates remain open. |
| 10. Standards | Safety 3, typed ftypes/slots, docstrings, functions <=60 lines and complexity <=7. C4 tools with self-tests and retention of partial reports; no deviation introduced. |
| 11. Parallelism | Independent guards per partition, no global guard/counter, no shared write per message. Writer work occurs outside ready list guards. No promise of lock-freedom, balancing, or time-bounded freedom from starvation. |
| 12. Atomicity | No durable change or deletion. FIFO publication and take occur under the local guard; no scheduler cleanup can erase a subsequent writer wave. |

The first independent reading requested two docstring clarifications,
closed in the sources: cleanup after verified acquisition; allocations on
the normal path only. The [inventory](writer-ready-decisioni.md) retains
initial and final hashes and the reading's boundaries.

Wakeups, parking after empty, worker shutdown, controller, and adaptive
pool require integration. The list does not guarantee progress if the
caller duplicates or abandons the obligation. This limitation is not hidden
by the positive result of an isolated FIFO fixture.

<a id="chiusura-della-verifica-integrata"></a>

## Integrated verification closure

The initial independent reading retains the twelve points and the two closed
findings. Appendices verify integration with `fd96fb3`, `201562d`, and finally `33aa224`, the corrected
C4 runner, and the full check, with the same ready sources and tests.
The runner distinguishes OS signals and failures after actual completion from detected
mutants: actual SIGKILL is `:worker-error`; the repeated campaign detects
12/12 mutants with signal NIL and no worker error. Both campaigns and the
tool versions remain in the
[catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-ready/catalogo.lisp), together
with original readings, probes, and process reports. No approved exclusions,
complete MC/DC, or pool qualification is inferred from the results.
