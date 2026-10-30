<a id="metodo-del-pianificatore-di-inventario"></a>

# Inventory planner method

Registered before tests on 2026-10-09. C1 scope limited to the
reconciliation table in [ADR-0040§3](../adr/0040-manifest-a-record-unico.md#3-riconciliazione-al-riavvio),
without filesystem access. EDIT fixtures are bytewise, with independent
CRC; the inventory oracle uses logical lists rather than product
helpers. No claim of real crashes, content verification,
durability, or completed engine recovery.

<a id="casi-e-oracolo"></a>

## Cases and oracle

Compare all combinations of absent, temporary,
final, and both presence for ACTIVE, CLOSED, REMOVED, and unknown. The model
includes missing CLOSED segments, excludes absent REMOVED segments, and gives
FAULTED priority for missing or conflicting ACTIVE. Vector permutations
must give the same entries sorted by unsigned u64 ID. Check
ID zero, high words, maximum u64, same IDs in both forms, exact
duplicates, exact/exceeded physical budgets, live-segment budgets, and
arguments/queries outside contract. No partial result on error.

Plans must stay unchanged after vector and EDIT buffer
reuse. One test uses four SBCL threads with private inputs and a common
plan read after input reuse: worker error or a join exceeding
its finite limit fails the test. Parallelism is correctness
verification; it measures neither throughput nor latency.

<a id="strumenti-ed-evidenze"></a>

## Tools and evidence

Mutation-tool scope `inventory` selects only dedicated
tests after an intact baseline. Copies, caches, and logs
are private; four processes may run in parallel. No
compilation error, OS signal, or nonzero exit after test completion
counts as runtime detection. The campaign uses known mutations
preserving loop bounds without automatic process timeout.
The self-test checks classification, ASDF copying, errors, and parallelism.

`tools/foundation-coverage.lisp` records the raw recovery
denominator, original `sb-cover` state, and HTML. Summary separates three
inventory files without subtracting defensive guards. Two C1 readings
check invariants, errors, loops, ownership, and decision table;
unobserved forms become neither approved exceptions nor demonstrated MC/DC.

Each execution is recorded with `tools/record-command.lisp`: argv,
environment, revision, hashes before/after, exit, and original outputs.
Sources, tests, tools, and documentation are frozen during tests.
Distinct failures and preliminary attempts are preserved too.
