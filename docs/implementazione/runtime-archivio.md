<a id="bootstrap-del-runtime-dellarchivio"></a>

# Archivio runtime bootstrap

`arcdocdb.runtime` connects [complete CSN plan](csn-archivio-recovery.md)
to existing CSN, snapshot, and epoch registries. Implements ADR-0046 and
shared [Archivio](../architettura.md#archivio-coordinamento-minimo) entries.
Introduces no formats or new per-operation critical sections.

<a id="famiglia-unica-e-pubblicazione"></a>

## Single family and publication

Controller maintains one canonical `archivio-recovery` object per
physical Archivio, with catalog and sources frozen through bootstrap.
`crea-runtime-archivio` receives a complete plan from that object and
privately constructs CSN with latest=H=M, snapshot EQ-bound to that
CSN, EBR, and new GET scope. Checks bindings and frontiers before CAS.

One CAS changes private Archivio binding from NIL to capsule.
Write barrier precedes CAS; getter loads once and acquires
before interpreting reference. Two attempts, even with different plans
of same Archivio, return at most one published
capsule. Loser signals `:archive-runtime-bound`; its local
candidate becomes GC-reclaimable. Initial check avoids allocations
when binding already visible; CAS decides race.

Only return follows successful CAS. No reset, rollback, or
second publication. `trova-runtime-archivio` retrieves same capsule
if caller loses return through interruption. Errors before CAS
publish no intermediate states. In-memory publication without
durable atomicity. Capsule contains only CSN and new scope; retains no
plan, old scope, recovery result, table, or FD.

Uniqueness holds **per canonical Archivio object**. Canonical identity relative
to catalog, exclusion of other processes, and temporal plan validity
are controller obligations. Two objects with same UUID create no
physical exclusion. Lisp access to private internals outside
public contract. New private slot changes layout: must
recompile without reusing old instances.

<a id="api-e-limiti"></a>

## API and limits

| API | Contract |
|---|---|
| `crea-runtime-archivio(plan, lifetime-ticks, wait-ticks, :csn-capacity 256, :snapshot-capacity 256, :worker-capacity 64, :retirement-capacity 256)` | Construction and single binding, without CSN assignment |
| `trova-runtime-archivio(archive)` | NIL or published capsule by identity |
| `csn-runtime-archivio(runtime)` | Registry to pass to writers and decisions |
| `ambito-runtime-archivio(runtime)` | Scope for new GET views and contexts |
| `snapshot-runtime-archivio(runtime)` | Snapshots of same CSN and scope |
| `epoche-runtime-archivio(runtime)` | EBR of same scope, preallocated readers |

Capacities respectively 1..65536, 1..65536, 1..4096, and 1..65536:
existing registry limits. All types and limits, including
`1 <= wait-ticks <= lifetime-ticks <= max-u64`, checked before
allocating registries or binding. Durations required in same
monotonic unit as NOW later supplied to snapshot APIs. No clock, worker,
timer, or I/O task started.

Cost is preallocated capacities; Lisp objects and GC are not
RSS budget. Concurrent candidates may temporarily multiply
cost; controller keeps bootstrap exclusive. CAS protects
against double binding, does not authorize concurrent recoveries. Binding not
touched by assignment, resolution, snapshots, or GET.

<a id="collegamento-delle-serie-e-ammissione"></a>

## Serie connection and admission

First assignment returns M+1. u32 carry and u64 exhaustion
remain canonical registry's: maximum base representable,
further assignment fails without wrap.

Controller passes capsule CSN to Serie controllers and constructs
views, GET contexts, and segment capabilities in new scope. Old
views rejected by scope identity: even `segmento-get` objects retaining
them must not be reused. Old environment remains reserved for
bootstrap, not revoked. No EBR pin or retirement imported.

[Verified ACTIVE adoption](adozione-controller-runtime.md) now constructs
real controller with runtime CSN, exact scope, and single binding on
canonical log; catalog decision and admission remain coordinator's.

[CLOSED adoption](adozione-closed-runtime.md) also connects verified GET
maps to new scope, reusing immutable rows and same FDs.
Publishes neither primary nor sources and transfers no file ownership.

**H=M does not certify publication of recovered effects.** Before
operational use, authoritative catalog/inventories, physical
reconciliation, consistent indexes/roots, closure/publication of old ACTIVE, and
multiseries obligations remain. Recovery Manager and traffic gate remain
to implement; APIs do not qualify whole engine.

<a id="decisioni-e-metodo-preregistrato"></a>

## Decisions and preregistered method

| ID | Decision and planned test |
|---|---|
| RTA-D01 | Four valid capacities; each type and lower/upper limit |
| RTA-D02 | Valid lifetime AND valid wait AND wait <= lifetime; each condition |
| RTA-D03 | Positive Serie count AND segments >= Serie count; presence OR zero maximum |
| RTA-D04 | NIL binding or capsule; foreign slot through FI |
| RTA-D05 | Different scope AND snapshot EQ-bound to candidate CSN |
| RTA-D06 | High and low frontiers equal base; separate FI |
| RTA-D07 | Binding already present before construction; two plans, same authority |
| RTA-D08 | Successful/losing CAS; real workers with deadlines and joins |

Suite `tests/runtime/` uses public Archivio fixture results:
v1/v2, absent/present zero, DECISION/CLOSED, carry/exhaustion, no
additional I/O, and unchanged old scope. FI constructs deliberately inconsistent
internal states, separate from positives; foreign bindings always
restored. Workers with finite limits, cleanup after joins, owned cells.
No test callback introduced in product.

Agents write disjoint files; before runs, closed and
revision frozen and committed. Diagnostics and failures use
recorder. Coverage with separate cache, counters reset after load, and
runtime suite only: four non-package module files plus
`recovery-archive/types.lisp` for new slot. Scope-boundary
and missing-branch detection self-tests. SBCL forms/branches are not MC/DC;
no residue excluded from denominator.

Two static C1 readings separate from tests. Preservation with
[common collector](raccolta-comandi.md), manifest, four workers, hashes, and
independent inventory check. No new benchmark: command times
include compilation/fixtures and are not DB throughput.
C1/MC/DC, reference platform, and admission remain open.

<a id="esiti-conservati"></a>

## Preserved outcomes

[Dedicated campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-16-runtime-bootstrap/report.md)
preserves 27 passed compound tests, including two concurrent and three native,
full local check, and coverage: module 178/201 forms and 34/34 branches;
with Archivio context 190/230 forms and 35/40 branches. No residue excluded.
Losing CAS observed in run, without future-scheduling guarantee.
[Static review](runtime-archivio-revisione.md) remains distinct from
MC/DC, C1 qualification, and dynamic post-CAS interruption test.
