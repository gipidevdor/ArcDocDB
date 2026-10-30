<a id="item-cbor-con-testate-minime--prima-lettura-c1"></a>

# CBOR items with minimal headers — first C1 reading

Coordinator reading independent of the product author, on the diff
frozen before campaigns. Reference: package `9c9edc4`, scanner
`e3d7d77`, minimal wrapper `f1afe79`. Runtime results are separate.

| Checklist item | Finding and limit |
|---|---|
| 1. Requirements and ADRs | REQ-LIM-001/002, AFF-004/008, and ADR-0014/0048; local codec increment, without gate closure. |
| 2. Invariants | INV-F1/A8/P6: immutable input, budget before admission, exclusive scratch; kernel progress and postconditions preserved. |
| 3. Errors | Unchanged preflight before reset; reader selection before context/nodes; minimality precedes payload/depth. Drain before tail reading; empty fallback from base reader. No new handler. |
| 4. Limits | Repeat SPAN, drain102, and stack102 unchanged; no new loop, recursion, or wait. Every step advances at least one byte or signals an error. |
| 5. Heap | No new object, closure, callback, or dynamic keyword parameter; only positional boolean and direct calls. Local measurement and positive sensor still needed. |
| 6. Output | Three values from result function after cursor/nodes/depth/state postconditions; no payload view or copy. |
| 7. Decisions | Three compound decisions preserved and simple MINIMAL selection; table compared with actual lines. No MC/DC attestation or exclusion. |
| 8. Ownership | Caller buffer; one worker owns scratch. No global mutation, new sharing, or retained buffer. |
| 9. Integration | ASDF prepared for wrapper and dedicated suite; build awaits corpus freeze. Build/lint/trace/check remain to be recorded. |
| 10. Standard | safety3, FTYPE/docstrings/REQ; functions within 60 lines. Three nontrivial functions preserve at least two active checks; trivial delegating wrappers. |
| 11. Parallelism | No write, wait, or lock between Serie; independent buffer/scratch in two-worker tests. Temporal overlap does not prove scaling. |
| 12. Durability | No durable write, deletion, or publication by kernel; atomicity point not applicable. |

The generic scan body is moved without changing operation
order. The generic wrapper passes NIL; the minimal wrapper passes T. Input,
UTF-8, stack, item, and header readers are byte-identical to base.
No open static findings. Compilation, regressions, blind corpus,
coverage, mutations, and heap measurement must still confirm behavior.
