# Scope, method and limits

The increment exposes current CSNs and single-operation optimistic conditional
writes through the serial engine and negotiated Unix capability 6. Existing
formats, writer durability, RAM/paged policy and legacy API value counts remain
the reference. No new package dependency, transaction write set or retry loop.

Qualification freezes product, tests, tools and documentation before the final
focused campaign, full `check-core` on SBCL 2.6.9, strict build/test on 2.6.10 and
manual publication checks. Command records must have stable equal complete source
inventories, exit zero and the expected terminal marker; exit zero alone is
insufficient. Development runs affected by source edits remain development
evidence. Test fixtures that fail are retained rather than silently removed.

The independent engine model runs 95 transitions across each of two record
formats and three index profiles. Permanent tests also check ABA, absent DELETE,
invalid tokens, full u64 carry, effects at capacity/rotation limits, admitted
faults, recovery and nonreentrant observers. Independent CBOR fixtures exercise
all eight capability combinations, four request IDs, eleven token boundaries
and all three version operations (132 complete request configurations).
Real service processes cover stale-token competition between distinct clients,
SIGKILL after strong confirmation, reopening and one dropped response after a
conditional commit. A later conflict does not identify the writer of a value.

Run performance separately, after functional campaigns finish. `bench.lisp`
compares the same final engine's ordinary and versioned GET, ordinary and
matching conditional PUT, and rejected conditional PUT. It crosses both formats,
legacy/resident/paged primary storage and 128/4096-byte documents (12 cases),
plus four actual Unix cases using 128-byte documents and resident/paged storage.
Run the same hashed drivers serially on SBCL 2.6.9 and 2.6.10. Five windows alternate operation order; reads/conflicts have 256 operations per
window and successful write types have 16 each. Engine samples independently
count durable flushes: one per successful write, zero for reads/conflicts. Check
every result/token and final canonical frontiers. Record allocation deltas and
wall time without disabling durability or GC. Unix allocations belong to the
client, and engine flush instrumentation does not count server-process flushes.

This is a local repeated-window cost comparison, not a comparison against an
older revision, a per-request tail-latency measurement, a full-database capacity
study, or power-loss qualification. The direct engine clock is fixed only for
deterministic request admission; timing uses the real monotonic runtime clock.
No benchmark runs concurrently with compilation or qualification.
