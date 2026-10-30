<a id="production-engine-bootstrap--metodo-m1"></a>

# Production Engine Bootstrap — M1 method

Preregistered on 2026-10-22 on base `eebd5685`. Author's direction
focuses development on Serie startup → recovery → admission cycle,
reusing existing vertical path. New functionality, including
further full text unnecessary for bootstrap, suspended in this work.

<a id="perimetro"></a>

## Scope

One Serie, one serial owner in I/O process, append-only, canonical
v1/v2 formats, CRC32C, PUT/GET/tombstone, strong commit, reopen, two real SIGKILLs.
Archivio/Serie identities explicitly configured and checked in headers.
No new authority inferred from directory name. Multiseries
catalog, 2PC, compaction, historical MVCC, optimizations excluded.
No alternative format, append to old segments, or truncation.

Production entry owns FDs, recovery set, writer through close.
Acquires nonblocking directory exclusion before observing or
modifying storage. Opening/recovery keep admission closed;
only after complete CONTROL, sources, durable new ACTIVE, CSN gate, index, and GET
root does engine become READY. Failures propagate typed condition
and close admission; no partially ready capability returned.

<a id="ordine"></a>

## Order

1. Strengthen/qualify existing vertical campaign, preserving
   output even on timeout/errors. Fixed expected values, 18 scenarios/71 processes,
   26 SIGKILLs and two negative checks; no attribution to C1 qualification.
2. Transfer coordination into production layer: explicit creation
   in empty directory or authoritative opening; canonical gates before
   effects, ID choice from complete inventory, checkpoint through existing
   publisher, old read-only segments, newly owned capabilities.
3. Rebuild private index from verified committed prefixes only;
   tombstones considered in maximum CSN, same register for writer/GET,
   no request admitted before complete root.
4. Use production APIs in test processes without manual bootstrap/replay
   in test. Two crashes, restart, new writes, separate-process
   verification; independent oracles on data, CSNs, existing bytes.
5. Connect existing Unix client/server to same entry, respecting
   ADR-0055/0056. Transport neither opens admission nor rebuilds state.

<a id="decisioni-e-verifiche"></a>

## Decisions and verification

| ID | Boundary and oracle |
|---|---|
| M1-D01 | Wrong configuration/identity; no data mutated |
| M1-D02 | Second owner/process rejected by lock before effects |
| M1-D03 | Explicit init only on empty storage, open does not initialize missing files |
| M1-D04 | Complete recovery and CRC; unsealed tail retained, corruption reported |
| M1-D05 | Fresh new ID, existing atomic checkpoint, completed names before READY |
| M1-D06 | Maximum CSN includes tombstones; strictly later restart, no reset |
| M1-D07 | Admission rejected in startup/recovery/fault/closed and from foreign owner |
| M1-D08 | Acknowledgment only after write+flush+index/root publication; error without acknowledgment |
| M1-D09 | Short I/O/errors: canonical primitives, faulted state, no implicit retry/rollback |
| M1-D10 | Two SIGKILLs and reopen from distinct processes; every acknowledged strong write recoverable |
| M1-D11 | Cleanup attempts all capabilities, preserves primary cause and secondary faults |
| M1-D12 | Real interface reuses same path, without harness in server process |

Sources committed/frozen, two readings and independent review before
executions. Deterministic tests, negatives, FI authorized by author;
every command through recorder, failures included. Compact lossless
evidence in repository, source hashes, common collector with parallel
workers. No benchmark this milestone and no claim of power-loss,
permanently failed file-system, unexecuted Linux, or MC/DC qualification
without corresponding campaigns. Milestone remains open until real scenario
and criteria demonstrated; static checks do not close it.

<a id="integrazione-preregistrata-capienza-dellindice"></a>

## Preregistered integration: index capacity

After full verification of variant `b5f09b96`, an additional
M1-D08/D09 boundary closed: load, key arena, slot credit, and revision must
be checked before CSN/append with same canonical mutator checks.
No concurrent reservation: M1 owner remains sole owner through application.

Both v1/v2 regressions saturate load 28/32 and 64-byte arena
with four 16-byte keys respectively. Additional request must produce
RESOURCE-EXHAUSTED leaving READY, CSN, all bytes unchanged. Checks
include allowed update, DELETE, reopening with same budgets, arena not
implicitly reclaimed by tombstone. Isolated negative process loads
only previous writer from immutable commit `b5f09b96` and must detect
exactly FAULTED in place of READY. No mutated-process result
qualifies product; replaced source and negative storage preserved.

Final full verification may run independent checks in parallel:
product tests; lint/trace and self-checks/experiments; historical preservation.
Link check follows closure of all producers and collection.
Union must cover exactly twelve `check-core` targets without benchmarks;
each group has original record and terminal outcome, without inferring a pass
from another group. Previous variant's serial `make check` also preserved,
distinguishing commit/scope from final parallel check.
