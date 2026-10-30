<a id="seconda-lettura-del-verificatore-cbor-con-testate-minime"></a>

# Second reading of the CBOR verifier with minimal headers

Local static reading completed on October 9, 2026, after freezing the three independent test files. No concrete defects emerged in the new diff. This reading constitutes neither human approval nor campaign outcome: strict compilation, lint, execution, coverage, mutations, heap measurement, and integrated verification remain to be acquired.

The reviewer wrote the current corpus without reading the new product and previously contributed to the already-integrated CBOR and UTF-8 kernels. The second reading concerns the new export, reuse of the common loop, and minimal-reader selection; it is not a new blind reading of previous components.

<a id="provenienza"></a>

## Provenance

The blind corpus comprises 22 named tests, with already-frozen cold oracles, integer/rational header arithmetic, a bounded structural model, 768 initial-header comparisons, 512 generated trees, and 4096 preregistered fuzz cases with seed `#x53434d31`. The two concurrent tasks use private buffers and workspaces, 15/20-second wait limits, and local time intervals; no evidence of distinct cores or speedup is inferred. No supplement was added after reading the product.

| Test file frozen before reading | Git blob |
| --- | --- |
| `tests/codec/cbor-minimal-scan-support.lisp` | `c2af64af4e5f8b5f669819fd56a00f416b3aaf0d` |
| `tests/codec/cbor-minimal-scan.lisp` | `1742189ff6845197ba76996c09c1097d59216fcb` |
| `tests/codec/cbor-minimal-scan-threads.lisp` | `56318b1632a7a0ae11f2987cdf0d4bec68e465cb` |

| Source read after that freeze | Git blob |
| --- | --- |
| `src/codec/cbor-package.lisp` | `9c9edc4775c24188cd38e4620da77b8bad349344` |
| `src/codec/cbor-scan.lisp` | `e3d7d77407046338d23e26eb0b8a2e8fdc3d699d` |
| `src/codec/cbor-scan-minimal.lisp` | `f1afe79c7a4d49abd6a6e5f6975dec830ef7b1f6` |

Syntactic reading of tests alone as Common Lisp data, with `*read-eval* NIL` and EOF checking, counted 20/22/2 forms and 0/21/1 tests. It neither loaded nor executed product or tests. The reader and two logs are outside the repository: `/tmp/cbor-minimal-scan-source-read.lisp`, `/tmp/cbor-minimal-scan-source-read-first.log`, and `/tmp/cbor-minimal-scan-source-read-final.log`.

<a id="checklist-c1"></a>

## C1 checklist

| # | Check | Static finding and limit |
| --- | --- | --- |
| 1 | Requirements and ADRs | REQ-LIM-001/002 and REQ-AFF-004/008 are linked to local structure, UTF-8, and minimal-header checking. ADR-0014/0048 are not extended to map order, duplicates, or tag semantics. |
| 2 | Invariants and cases | INV-A8/P6, preflight, reset, budgets, precedence, and results have independent named cases. Their execution remains to be acquired. |
| 3 | Typed conditions | Minimal reader precedes context, nodes, depth, and payload. Syntactic and UTF-8 conditions propagate; `:cbor-trailing` precedes tail reading. FAULTED boundary remains outside codec. |
| 4 | Loops and recursion | Common loop remains span-bounded and draining bounded by workspace capacity 102. No new recursion or second scan is introduced. |
| 5 | Allocations | New path uses arguments and local state, without closures or materialization of floats/u64. No allocation on success requires measurement. |
| 6 | Verified results | Shared postcondition checks cursor/end, count/peak, and final state before three values. Tests require exactly three values. |
| 7 | Compound decisions | D01, D02, and D03 from the dedicated table are preserved. Boolean selector is a simple decision; no branch is excluded from coverage denominator. |
| 8 | Data ownership | Immutable caller buffer, exclusive workspace, and no retained buffer reference. T/NIL selector is call-local, not a shared field. |
| 9 | Integration | ASDF order compatible with product dependencies and frozen oracles; dedicated suite added after structural suite. Build, trace, lint, and full check remain to be acquired. |
| 10 | Source standard | Complete FTYPEs, safety 3, bounded functions, and meaningful guards in nontrivial functions. Both public APIs are thin delegations to common loop. No C1 status promotion inferred. |
| 11 | Concurrency | No global write or new synchronization. Two workers with private workspaces and buffers are planned; REQ-CON-005 covered only for local callability. Outcome and overlap remain to be measured. |
| 12 | Durability and atomicity | Not applicable to this kernel without I/O, WAL, or data publication. No engine guarantees claimed. |

The three compound decisions are: D01, positive step advancement and cursor within end; D02, nodes within limit and peak within max-depth; D03, top and depth zero with no pending tag. False guard outcomes remain part of full coverage; this reading does not demonstrate MC/DC.

The generic wrapper retains signature, defaults, and NIL selection. The minimal wrapper passes T to the same loop/preflight/reset/result. Minimal validation applies only to headers actually reached: payloads remain opaque, while nested keys, values, and tags are visited. A container's declared minimum capacity may cause a truncation error before reaching a child. No open static findings; dynamic outcomes will be preserved separately according to the [preregistered method](cbor-minimo-struttura-metodo.md).
