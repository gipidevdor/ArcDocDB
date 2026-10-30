<a id="ricerca-delle-chiavi-e-directory-dellindice-primario"></a>

# Key lookup and primary-index directory

<a id="ambito--2026-10-09"></a>

## Scope — 2026-10-09

`arcdocdb.index.primary` connects [v2 banks](slot-indice-v2.md) to Swiss
controls, local keys, and an extensible directory: in-memory current-version
lookup, writer upsert/removal/relocation, explicit arena growth, and
publication of an already built rebuild/split.

It follows [ADR-0015](../adr/0015-primary-index-swiss-table-swmr.md),
[ADR-0043](../adr/0043-primary-index-a-frammenti.md),
[ADR-0048](../adr/0048-limiti-documentali-e-formato-v2.md), and
[ADR-0050](../adr/0050-pubblicazione-e-costi-della-directory.md).
Persistent formats and architectural decisions are unchanged.

Class C1: REQ-IDX-001, REQ-IDX-003, REQ-IDX-004, REQ-IDX-005, REQ-IDX-006,
REQ-IDX-007, REQ-LIM-001, REQ-LIM-003, REQ-CON-004, REQ-AFF-004,
REQ-AFF-008. Invariants INV-I1, INV-I3, INV-V3, INV-A8, INV-P6.
Requirements and qualification remain designed.

<a id="confine-fidato-e-proprietà"></a>

## Trusted boundary and ownership

One index per Serie; only the token-holding writer modifies fragments,
revisions, and roots. Each worker and the writer have private preallocated
five-u64 scratch. No per-entry object, mutex, thread, callback, or I/O.
On success, the reader writes only scratch/output; on fault it may
publish terminal health.

The API receives an **already calculated digest**, in two u32 words: high half
for directory, low half for group/fingerprint. Trusted caller uses
same Serie function/seed for lookup, mutations, rebuilding;
digest does not come from client. [XXH64 kernel](hash-chiavi.md) now calculates
key digest with immutable seed configured in index;
controller still must integrate seed generation/lifecycle.
The v1 kernel limited to 16-byte `_id` does not
qualify v2. Inconsistent digest violates contract and may cause
duplicates/misses. Final comparison always bytewise.

Canonical domain fragments: BUILDING outside directory, current
PUBLISHED, terminal RETIRED. Retired bank freezes before CAS.
Arrays internal; bank primitives must not bypass revision/
checks. Roots/fragments reclaimed by GC; EBR governs external
resources without heap-release timing promise.

Compound fault => index FAULTED, no rollback/reset/reopening.
Serie boundary stops admission/result delivery and calls
`invalida-indice-primario` on bank errors too. Subsequent fragment
check recognizes faulted bank. Domain recovery remains to integrate.

<a id="lookup-e-budget-comune"></a>

## Lookup and shared budget

| Step | Protocol |
|---|---|
| Entry | Health; binary span 1..65,535; free context; output distinct from scratch. |
| Directory | Acquired root; G high bits select fragment. |
| Controls | Aligned groups of 16, scalar; 7 H2 bits filter candidates. |
| Payload | One seqlock attempt per candidate within shared budget. |
| Key | Arena acquired **after** payload; already published bytes immutable. |
| Confirmation | Root identity/generation rechecked after barrier, including miss. |
| Exit | `:live` copies five u64 words; `:absent`/`:retry-limit` leave output untouched. |

At most **eight credits for slot samples and root-change restarts**: each sample,
including stable collision, consumes one; root-change restart
consumes another. Final confirmation, successful or failed, is not a new
probe: at zero credit failed confirmation ends `:retry-limit`,
without restart/output. Successful confirmation consumes no credit. No nested retries,
waits, or lookup growth. At limit, discard location/scratch, forward original
request to writer. Queue connection external.

Each attempt visits at most C/16 groups; miss decided after all
candidates of group containing EMPTY, or C slots without EMPTY.
DELETED does not stop search. Comparison bounded to 65,535 bytes per
candidate; hostile collisions may cause writer fallback.
Worst case not O(1); allocation/hash distribution/P99 to measure.

Occupied fingerprint with empty payload possible transient reader state
during removal; fault under exclusive writer.
Consistent payload/key comparison also govern reuse.
Reserved controls or stable key range outside arena are faults.
On error/nonlocal exit, do not deliver private output, even already
copied. Cleanup releases context. Reentry rejected before
cleanup without releasing active call's context.

Not a complete GET: [read context](compiti-lettura.md) needed
for EBR/final snapshot checks, plus storage/cache and delivery after
cleanup. Snapshots earlier than current CSN need retained versions,
not yet searchable in this block.

<a id="api-e-mutazioni-del-writer"></a>

## API and writer mutations

| API | Contract |
|---|---|
| `crea-indice-primario` | Root G=0, generation 0, one empty fragment. |
| `crea-frammento-indice` | BUILDING candidate with prefix/depth/own arena. |
| `crea-contesto-indice` | Exclusive scratch preallocated before pool. |
| `frammento-corrente-indice` | Writer selection; does not authorize reader pin. |
| `leggi-indice-primario` | Lookup into private output with root confirmation/shared budget. |
| `pubblica-chiave-indice` | In-memory upsert; internal key offset; increasing CSN on update. |
| `rimuovi-chiave-indice` | T removed, NIL absent; zero payload then DELETED. |
| `riloca-chiave-indice` | Current key lookup; T applicable, NIL superseded version/location. |
| `estendi-arena-indice` | Larger array, same bytes at same offsets. |
| `prepara-directory-indice` | Single-use plan replacing one fragment with one/two candidates. |
| `pubblica-directory-indice` | Source freeze/CAS; stale plan rejected beforehand. |
| `invalida-indice-primario` | Terminal health; no resources reclaimed. |

Upsert preflight: key-len matches span, distinct source/scratch,
correct domain/prefix, slot available, live load below 7/8 for
insert, sufficient arena, increasing CSN, seqlock/revision credit.
Then key, payload, control, count. Update reuses key bytes;
delete does not clear them. Absence consumes no sequence/revision.
Controls: EMPTY → occupied → DELETED → occupied, never EMPTY again.

Expected-version, retention, tombstones, WAL, committed decision,
durability, **reservations for all pending batches** are upper
writer's preconditions. These checks before in-memory mutation
are not engine transactional preflight. Return does not
authorize client acknowledgment. No postcommit auto-split.

Relocation: key lookup in current root, comparison of original
CSN/location/length/end, arena offset reconstructed by lookup.
Message predating rebuild carries no slot/local offset
into new bank. Only location may change; mismatch/absence does not mutate,
already identical location is no-op without credit. Durable identical copy,
manifest/reclaim external; no newer version overwritten.
Retained versions/relocation remain to connect.

<a id="directory-memoria-e-costi"></a>

## Directory, memory, costs

Rebuild: candidate with current source's depth/prefix.
Split: two ordered children, d+1 and 2p/2p+1. Directory doubles if d=G,
otherwise G unchanged. Always new array, immutable root, generation +1.
Generation/revision stay below 2^60 without wrapping.

Upper builder must copy/verify all live keys and
payloads with same hash. API checks domain, geometry, total
live count: **count does not prove faithful copying**.
Automatic rebuild/split construction/verification to implement.
Every mutation after preparation, including candidates, makes
plan stale via revision. Consumed plans not reused.

Publication freezes source only, marks candidates published,
barrier/CAS. Shared fragments remain writable. Interruption
from phase start => index/plan faulted even after successful CAS.
Plan retains previous root until plan released.

Preliminary configuration, tunable before qualification:

| Parameter | Default | Range |
|---|---|---|
| C | 8,192 | Powers of two 16..65,536 |
| Initial arena | 64 KiB | 1..2^32 bytes, within budget |
| Maximum fragment payload | 8 MiB | Positive, fixnum |
| Maximum G depth | 20 | 0..30, within directory budget |
| Maximum directory payload | 8 MiB | At least 8 bytes, fixnum |

Current representation limits, not guaranteed product capacities.
No C × 65,535 preallocation. Before fragment allocation: 41*C +
arena. Before directory: 8*2^G and transient current root
(including distinct fragments), candidates, new directory. Arena growth:
current root, any BUILDING, new array before allocation.
Controller reserves **before candidate construction**, adds
other retained plans/roots/arenas, garbage, headers, runtime. Not RSS or
global ceiling. Catalog/memory controller to connect.

Directory cost O(2^G) even without doubling. C source slots, key bytes,
transient memory, duration measured separately. No promise
of pause independent of Serie size.

<a id="decisioni-da-coprire--cod-54"></a>

## Decisions to cover — COD-54

| ID | Decision | Independent conditions |
|---|---|---|
| PRIM-D01 | Configuration | Capacity/range/power of two; G; budgets; arena. |
| PRIM-D02 | Context/span | Range/key-len; free; input/output aliases. |
| PRIM-D03 | Control | H2; EMPTY; DELETED; reserved; no reset to EMPTY. |
| PRIM-D04 | Candidate | Budget; live/empty/retry; length; bytes; arena range. |
| PRIM-D05 | Confirmation | Root identity/generation; health; hit/miss. |
| PRIM-D06 | Writer preflight | New/existing; load; arena; CSN; credits. |
| PRIM-D07 | Arena growth | State; size; u32; fragment/transient budgets. |
| PRIM-D08 | Source | Owner; published; depth; current identity. |
| PRIM-D09 | Candidates | Building; geometry; identity; count; depth/budget/generation. |
| PRIM-D10 | Publication | Prepared; expected root/revision; freeze; CAS; interruption. |
| PRIM-D11 | Relocation | Valid source/copy; identical CSN/length/end/key-len; current lookup; expected identity; no-op/credit. |

To exercise: collisions/groups without EMPTY, reuse with new H2, maximum
keys/beyond-fixnum CSNs, arena growth/rebuild during hit/miss, double
plan, mutation after preparation, exhaustion, concurrent fault,
interruptions of all publications. No coverage claimed.

<a id="metodo-delle-evidenze-e-qualifica"></a>

## Evidence method and qualification

Method fixed before checks: product-only compilation with
warnings as errors; lint, traceability, links, catalogs; ARM64
disassembly for static inspection without new-API calls. Original outputs,
sources before/after, rejections preserved in
[campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-primary-lookup/README.md).

Two separate local readings of payload/controls and directory/costs
preserved as data; not independent reviews. ARM64 disassembly
shows native payload loads/stores, `DMB ISHLD`/`DMB ISHST`,
root `CASAL`; proves neither concurrent correctness nor zero heap.
First link check rejected campaign return path;
original report preserved, path corrected/check repeated.

No functional/concurrent tests, fault injection, models, benchmarks,
or tool self-checks added/run locally. Remaining:
C1 qualification, independent reviews, ARM64/x86-64 memory, allocations/P99,
hashing, split/rebuild builder, retention, reservations, recovery,
cache/integrated GET. v1 code/existing suite do not qualify v2.

<a id="prove-successive--indice-v2"></a>

## Later tests — v2 index

[Rebuild campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-index-rebuild/risultati.md)
adds 27 lookup/writer/directory tests, 28 rebuild/split tests,
64 slot tests. Includes concurrency, targeted fault injection, four
concrete mutants, SB-Cover, in-memory primitive benchmarks.
[Verified builder](indice-ricostruzione.md) now prepares rebuild/
split with separate root publication. Previous note describes
initial campaign scope; residual limits/measured revisions
declared in new report. GET/whole engine remain open.
