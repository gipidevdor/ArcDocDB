<a id="hash-delle-chiavi--revisioni-del-candidato"></a>

# Key hashing — candidate reviews

<a id="prima-lettura-indipendente"></a>

## First independent reading

Herschel read the product at commit
`0460a6e723325ff925b8c678e81544fbad2a2684` without running build or tests.
Subsequent `68a4125` changed only documentation. Initial findings
preserved, including after correction:

| ID | Priority | Deduced finding, not executed by reviewer | Parent correction |
|---|---|---|---|
| HASH-R01 | P1 | Mismatching internal digest: INVALID-ARGUMENT left index OPEN | Internal-verifier mismatch causes FAULTED with `:primary-hash-source-digest`; bank failures retain cause and condition |
| HASH-R02 | P2 | Directly passed NIL root produced TYPE-ERROR | Use of `acquisisci-root`, terminal failure `:primary-index-missing-root` |
| HASH-R03 | Standard | Block/tail relationships guaranteed only by API | Always-active relational preflights and cursor postconditions; internal negations tested |

Static comparison of the formula with the
[XXH64 v0.8.3 specification](https://github.com/Cyan4973/xxHash/blob/v0.8.3/doc/xxhash_spec.md)
found no defects: constants, rotations, endianness, round, four merges,
length, tail, and avalanche. Bounds: 2,047 stripes, three eight-byte lanes,
one four-byte lane, and three remaining bytes. Read-only seed and full comparison
before scratch/maps. Heap and inlining still to be measured.

<a id="seconda-lettura-dellaritmetica"></a>

## Second arithmetic reading

Pauli separately read the four hash files from the same freeze,
tree `e1968e56faef339fd7b29b2b93f77e35e30c0eef`, after writing
the independent oracle. No static defect found in formulas,
the five public typep checks, high/low seed, or return order.
Seven u64 helpers declared inline; actual call and boxing
elimination is not inferred from declarations.

<a id="lettura-dellautore-sulle-correzioni"></a>

## Author reading of corrections

| C1 point | Argument and limit |
|---|---|
| 1. REQ/ADR | ADR-0014; REQ-IDX-001/003/005/007, LIM-003, AFF-004/008 |
| 2. Invariants | Span, progress, immutable seed, original slot, live count; R01/R02 regressions |
| 3. Errors | External rejection distinct from terminal internal mismatch; bank failures propagated |
| 4. Loops | Hash bounded by K<=65535; map C samples and up to C probes each |
| 5. Heap | Kernel without scratch; maintenance 80-byte payload. Measurements and disassembly pending |
| 6. Outputs | Two u32s; maps written only after verification; private and discardable if partial |
| 7. Decisions | HASH-D01..D12; guards included in coverage, no MC/DC inferred |
| 8. Owners | Private buffers and maps; exclusive writer, read-only seed |
| 9. Trace | REQs in definitions and test names; structured gates still to run |
| 10. Standard | safety3, specialized types, block/tail pre/postconditions; elementary pure arithmetic helpers |
| 11. Parallelism | No new locks, I/O, or shared state; test workers with bounded joins |
| 12. Durability | No durable write or format change; seed lifecycle belongs to controller |

This document preserves automated readings and bounded arguments.
It certifies neither C1, full coverage, MC/DC, Linux x86-64, nor the complete engine.
Agents' preliminary self-attested executions are separate from
repeatable records of the parent's campaign.

<a id="supplemento-dopo-il-freeze-fdde3a9"></a>

## Supplement after freeze fdde3a9

Pauli statically closed the cursor delta without findings; tree hash
`56810923096a086cc43429b0f3a5343e92e00b4a`.
Herschel closed R01/R02 and R03 local guards, identifying R04:
kernel assertions propagated without invalidating the calling index.
The parent adds `hash-con-seme-indice` to both APIs: it catches only
INVARIANT-VIOLATION, invalidates the owner, and reraises the same condition.
The regression injects a concrete condition and verifies identity,
FAULTED, and unchanged maps. External-argument rejections are not transformed.
Block/tail docstrings updated with classes and reasons (COD-50).

The first full check had exit 0 (622 tests plus two smokes), but the
recorder detected a late update only to output paths in the
method: SOURCE-CHANGED status, preserved and not accepted as a
stable freeze. The first mutation command is also preserved with that status.
Subsequent executions repeat checks on the final candidate.

Herschel reread delta `c9c7561`: no open static finding,
R01–R04 and COD-50 closed; examined files stable even after integration
`344e8fb`. [Structured report](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-key-hash/revisione-herschel-finale.lisp).
The [results](hash-chiavi-risultati.md) distinguish observed tests from
coverage, parallel heap, MC/DC, and still-open qualifications.
