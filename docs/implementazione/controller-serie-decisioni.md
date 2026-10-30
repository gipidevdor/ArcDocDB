<a id="decisioni-e-obblighi-del-controller-di-serie"></a>

# Serie controller decisions and obligations

Date: 2026-10-09. Scope: `arcdocdb.series`, bounded controller for
publication of one Serie and only new WAL-bridge preflights. Declared base:
`cf6091367853ec311fed7b05961a2812fd05a8f1`.

Contract matrix prepared before `src/series/` appeared.
Actual inventory below derives from complete reading, updated with
ring geometry, P2 fixes, and I/O retirement without delivery (phase D, 42 functions). File identities and
local counts in [review](controller-serie-revisione.md).
Attests neither runs, MC/DC, human review, nor absence of heap allocation.

<a id="fonti-e-confini"></a>

## Sources and boundaries

- [ADR-0037](../adr/0037-lotto-sigillato.md): batch as publication unit,
  separate coverage by level, one I/O task per log, buffer protected until flush.
- [ADR-0046](../adr/0046-orizzonte-con-registro-limitato.md): bounded-registry
  token, resolution separate from durability, no CSN wrap.
- [ADR-0033](../adr/0033-fail-stop-e-integrita-end-to-end.md): terminal fault,
  no I/O retry, distinct Serie and Archivio responsibility.
- [Coding standard](../affidabilita/standard-di-codifica.md): C1,
  COD-10/13/21/24/40/43/45/46/54.
- [WAL–CSN bridge](wal-csn.md): association with original registry and log,
  retained token and existing-resolver preconditions.
- [Controller contract](controller-serie.md), written by parent:
  effect ownership, distinct progress, and integration boundaries.

Hash index, snapshots, scheduler, pool, client-acknowledgment protocol, and full
recovery remain outside review scope. Related engine requirements
do not become controller-demonstrated results.

<a id="precondizioni-da-mantenere-esplicite"></a>

## Preconditions to keep explicit

| ID | Precondition | Authority and local-verification limit |
|---|---|---|
| P01 | Root opaque, immutable, prepared by writer outside controller after WAL closure. Even `nil` valid root. | Controller checks `eq` and order, not index structure or transitive immutability. |
| P02 | One controller owns Serie registry/log; log exclusive segment. | Identity is source objects, not file-id/version pair. Factory does not independently prove wrapper uniqueness. |
| P03 | Closure uses `sigilla-lotto-con-csn`; `:sealed` batch adoption precedes every I/O dispatch. | Full, busy, and other rejections leave batch/token with caller. Prepared SEAL alone is not durable commit. |
| P04 | Caller supplies trustworthy synchronized handoff of I/O-task completion. | `:written` or progress message does not prove completion. `:durable`/`:faulted` acceptable for retirement only with final handoff. |
| P05 | Writer governs lease and own thread; transfer requires release and new acquisition. | No implicit numeric-lease migration or simultaneous mutation sharing. |
| P06 | Nonlocal interruption in uncertain root/stage or registry/token window requires Archivio fail-stop by caller boundary. | Unsafe to automatically cancel or retry publication in uncertain state. Retained lease alone does not demonstrate fail-stop. |
| P07 | Caller releases group owner with `riusa-gruppo` before `riusa-commit-serie`. | Reuse allowed only for durable batch, resolved token, retired consumer. No faulty-buffer reuse. |
| P08 | For `ritira-io-commit-serie`, caller owns definitive synchronized proof that task with captured event/generation was retired or never accepted by scheduler. First cancels never-written group and releases owner. | Sealed batch and null owner necessary local guards; do not alone prove no worker. Scheduler rejection does not authorize abandoning active obligation. API does not revoke tasks. |

<a id="quattro-progressi-distinti"></a>

## Four distinct kinds of progress

| Progress | Transition | Observable point | Does not imply |
|---|---|---|---|
| Root publication | `:preparato` → `:pubblicato` | CAS `expected-root` → `new-root` after all preflights. | Resolved token, completed flush, or free buffer. |
| Token resolution | `:pubblicato` → `:risolto` | WAL resolver with registry and slot/high/low captured in event. | I/O-consumer retirement or batch reuse. |
| I/O retirement | `:idle` → `:active` → `:retired` | Registration before dispatch; completion after end handoff. | Publication, token resolution, or null group owner. |
| FIFO | Unresolved cursor separate from retirement head | First unresolved resolution/cancellation; ring-head reuse. | Occupied head prevents later async resolutions. |

Registry busy after CAS preserves `:pubblicato`, event, and token. Return
`:pendente, 0, 0` is not H measurement. Next attempt performs only
resolution. H returned as two words only on resolver success.

<a id="autorità-identità-e-generazioni"></a>

## Authority, identity, and generations

| Object | Required identity | Rejection to demonstrate |
|---|---|---|
| Lease | Current controller + owner thread + current positive generation. | Old lease, other-thread lease, busy controller; rejection before mutation. |
| Event | Same preallocated object belonging to controller ring + generation captured at registration. | Other-controller event even with same numbers; old generation after same-object reuse. |
| Token | Original registry `eq`, original log `eq`, captured slot/high/low. | Equal numeric values from distinct registries/logs transfer no authority. |
| Root | `expected-root eq planned-root` on adoption; `expected-root eq published-root` at CAS. | Different planned chain rejected before adoption; internal CAS mismatch requires Archivio scope. |
| Review sources | File, base revision, and read-content fingerprint. | Reading during integration does not certify later revision or campaign on different sources. |

Lease/event generations fixnums without wrap. Free event retains
current generation: not zeroed on release. Caller must retain
number with event reference; rereading only current
generation after reuse would eliminate ABA protection.

<a id="matrice-del-contratto-da-confrontare-con-il-prodotto"></a>

## Contract matrix to compare with product

| ID | Expected API/decision | Atomic conditions or order | Static obligation and future structured verification |
|---|---|---|---|
| C01 | Factory | capacity 1 to 1024, default 64; segment log; valid offset; log health. | Every invalid configuration rejected before construction; root `nil` passes. |
| C02 | Lease acquisition | Single CAS; thread and new generation; budget before increment. | Busy without retry; maximum generation rejected without wrap or retaining new lease. |
| C03 | Lease verification | Correct thread AND current generation AND acquired ownership. | Each false separately; no controller/event mutation. |
| C04 | Event verification | Current-ring object AND equal generation. | Cross-controller and stale generation distinct; same numbers insufficient. |
| C05 | Adoption | Healthy controller; sealed batch; token/log/registry; next-offset; increasing CSN; planned root; capacity; generation budget. | All guards before references/cursors/count; no new CSN acquisition. |
| C06 | Increasing CSN | previous high < new high OR (equal highs AND previous low < new low). | Different high, low comparison, equality, and regression; never u64 reconstruction. |
| C07 | Dispatch | Healthy; valid event; idle consumer; active-io budget. | Double dispatch rejected; active marking and increment before worker delivery. |
| C08 | I/O completion | Active consumer; durable OR faulted batch; final handoff precondition. | Written alone rejected before decrement; draining permitted after fault. |
| C09 | Pre-CAS | FIFO unresolved; `:preparato` state; log health; source token; level coverage. | Invalid/insufficient coverage rejected without CAS; known I/O fault Serie, internal inconsistency Archivio. |
| C10 | Root CAS | Observed root `eq expected-root`. | CAS once per batch; root `nil` legal; mismatch → Archivio faulted. |
| C11 | Resolution | Published state; captured token; existing resolver. | Only `resource-exhausted` with reason `:csn-busy` becomes pending; other errors not normalized to busy. |
| C12 | Unresolved FIFO | Event = publication cursor, not necessarily retirement head. | Resolved but still-active async A does not prevent covered B resolution; B does not skip unresolved A. |
| C13 | Reuse | Retirement FIFO; resolved; retired consumer; WAL durable/pending false/null owner. | Premature error before zeroing references or count; generation preserved. |
| C14 | Fault | Serie OR Archivio scope; terminal transition; upgrade without downgrade. | Entries/dispatch/publication blocked; completions remain possible; no file mutation. |
| C15 | Cancellation | Faulted Serie; active-io zero across entire Serie; first unresolved; faulted log. | Quiescence checked before log marking and resolver; Archivio scope rejects automatic cancellation. |
| C16 | Reads | Root barrier; healthy state; valid event/generation; nonfree CSN. | Parallel root read; free CSN rejected; counts only with current lease. |
| C17 | WAL token preflight | Pending token + registry `eq` + log `eq` + equal slot/high/low. | Guard without I/O/mutation; distinct log with same file-id/version rejected. |
| C18 | WAL publication preflight | C17, open log, async/group/strong coverage. | Everything before root CAS; resolver preserves post-CAS recheck. |
| C19 | I/O retirement without execution, addendum D | Faulted; prepared/active event; captured token; sealed batch/null owner; positive active count; external proof P08. | Permits draining retired/never-accepted dispatch without write/flush; token remains pending, single decrement; does not independently revoke or cancel. |

Table is contract plan,
not product-coverage declaration. Actual compound conditions
must receive separate identifiers once sources available.

<a id="metodo-c1-per-linventario-effettivo"></a>

## C1 method for actual inventory

For each new function, records name, file, and static McCabe
complexity: base 1, selections, loops, dispatch/handler alternatives, and each
short-circuit continuation (`and`/`or` with n operands adds n−1).
COD-13 obligation **maximum 10 per function**, including short circuits.
Delegated helpers and macros identified; extraction does not replace
guard coverage. Counting uncertainty explicit instead of automatically
declaring compliance.

Each actual compound decision lists atomic predicates and short circuit.
For AND: all true and each false with previous true. For OR: all false and each
true with previous false. Combinations unreachable in valid
protocol documented; API input distinguished from internal corruption. Cases
are obligations for test agent; no tests or drivers produced here.

<a id="rischi-da-chiudere-o-conservare-come-precondizioni"></a>

## Risks to close or preserve as preconditions

| ID | Risk | Severity if incorrectly implemented | Required control |
|---|---|---|---|
| R01 | Root CAS followed by error/interruption before retaining `:pubblicato`. | P1: visible effect with uncertain token/state, double publication or improper cancellation. | Guards before CAS, stage retention, Archivio fail-stop for uncertain state; precondition P06. |
| R02 | Stale event authorized by numbers alone. | P1: mutation or resolution of new batch. | Controller-ring object + captured generation; captured token, not rebuilt from current batch. |
| R03 | `:written` interpreted as I/O completion. | P1: reuse during flush or cancellation with active worker. | Separate consumer state, final handoff, durable/faulted before retirement. |
| R04 | Single head for resolution and release. | P2: async blocks other commits until flush or frees buffer still in use. | Separate unresolved cursor and retirement FIFO. |
| R05 | Cancellation checks only current event. | P1: other Serie consumers may still use log/token. | Controller-wide active-io zero; mark-log-faulted only after quiescence. |
| R06 | Indiscriminate resource-exhausted normalization. | P1/P2 depending on window: masks budgets/invariants as reschedulable pending. | Exact reason `:csn-busy` comparison; obligation preserved on other errors. |
| R07 | Event mutation before ordinary rejection. | P1/P2: lost obligation or partial slot on full/stale/premature reuse. | Complete preflight before count/cursors/refs and reset. |
| R08 | Claim extended to engine or allocations. | Documentary P2: result unsupported by evidence. | Explicit scope/sources; runtime and heap unmeasured by review. |
| R09 | Active retained after rejected dispatch, then fault, without durable/faulted completion possibility. | Integration P2: undrainable I/O obligation if abandoned. | New `ritira-io-commit-serie`, only after P08 proof; pending token preserved, single decrement, separate quiescent cancellation. |

<a id="inventario-composto-effettivo--aggiornato-alla-lettura-d"></a>

## Actual compound inventory — updated through reading D

Version tied to review D blobs and fingerprints. Eight Series files,
WAL preflights, exports, and ASDF read. Compound predicates
appearing in phase A unchanged; rest of module adds no compound
`and/or` in source text. Cases below are test obligations, not execution
results. Multiargument relational calls remain atomic source
predicates, without expanding runtime implementations.

| ID | Function | Actual predicate and atomics | Per-condition obligation |
|---|---|---|---|
| D01 | `crea-controllore-serie` | A AND B AND C: capacity index type; 1 ≤ capacity ≤ 1024; next-offset index type. | Each false separately rejects `:serie-budget` before allocation. For false A, B not evaluated. Root nil not in predicate. |
| D02 | `%check-ring` | A AND B AND C AND D: valid capacity; head < capacity; tail < capacity; publish-head < capacity. | Each false signals `:serie-ring` invariant and Archivio fault before indexing. Nonnegative ranges come from slot types. |
| D03 | `%check-ring` | A AND B AND C: count ≤ capacity; unresolved ≤ count; active-io ≤ count. | Each false separately causes Archivio fault `:serie-count`. Does not alone prove precise event cardinality. |
| D04 | `%check-owner` | A AND B AND C AND D: lease index; positive lease; lease = lease-generation; owner eq current-thread. | Invalid type, zero, stale generation, and foreign thread separately reject `:serie-lease` before `%check-ring` or mutation. |
| D05 | `%check-event` | A AND B AND C AND D: event.controller eq controller; generation index; positive; equal event.generation. | Same number on other controller rejected by A; stale same-object by D. Position range and ring-object identity follow. |
| D06 | `%csn-after-p` | A OR (B AND C): high > previous-high; equal highs; low > previous-low. | Greater high passes without C; lower high rejects; equal high selects low comparison; total equality rejects. B and A cannot both be true. |

New WAL preflights introduce no compound decisions of their own: delegate
identity to `esigi-identita-csn-lotto` and coverage to `coperto-p`. Compound
decisions of existing helpers are D07/D08/E07 of
[WAL–CSN](wal-csn-decisioni.md) inventory; new log guard uses `eq` on object.

<a id="selezioni-guardie-e-rifiuti-effettivi--c-con-addendum-d"></a>

## Actual selections, guards, and rejections — C with D addendum

| ID | Functions and actual decision | Outcomes and obligations to verify |
|---|---|---|
| S01 | Factory, `verifica-log-segmento` | Before allocation: kind other than segment → `invalid-argument :log-segment-kind`; non-open log → `io-fault :log-faulted`. Default capacity 64, maximum 1024, root nil. |
| S02 | `%position-after`, `%check-geometry` | After D02/D03 limits: `tail = (head+count) mod capacity` and `tail = (publish-head+unresolved) mod capacity`, separately checked. Each disagreement → Archivio fault `:serie-ring-geometry`. Sum ≤ 2047; capacity 1 and full/empty ring included. |
| S03 | Owner acquisition/release | CAS nil→current-thread once; busy → `:serie-busy`; maximum generation → `:serie-lease-generation`, owner released. Release checks owner before and CAS result after; error → `:serie-owner` invariant. |
| S04 | `%check-admission`, `%check-new-slot` | Full → `:serie-full`; maximum generation → `:serie-event-generation`; level → `:serie-level`; planned root → `:serie-root-order`; sealed → `:serie-lotto-state`; contiguity/sum → `:serie-offset`; nonincreasing CSN → `:serie-csn-order`. All before `%begin-effect` and event/count/cursor mutations. |
| S05 | `%check-event`, `%live-event` | After D05: position within range and object eq slot; inconsistency → `:serie-event-slot` Archivio. Free → `invalid-argument :serie-event-state`; lost batch reference → `:serie-event-lotto` Archivio. |
| S06 | `%check-publish-head` | Event eq publish-head slot; prepared/published phase; positive unresolved. Out of FIFO → `:serie-publish-order`, finished phase → `:serie-event-state`; inconsistent counter → `:serie-count` Archivio. |
| S07 | `inizia-io-commit-serie` | Healthy; prepared; io idle; exact captured token. Wrong phase → `:serie-event-state`; double entry → `:serie-io-state`. After success active/count preserved even if scheduler rejects task: caller reschedules same obligation without new entry. |
| S08 | `completa-io-commit-serie` | Io active; durable or faulted batch; positive active-io. Written/sealed alone → `:serie-io-in-flight` without decrement; double completion → `:serie-io-state`. Known faulted log marks Serie scope, preserving previous Archivio; retirement and decrement once. |
| S09 | `%check-publication` | Exact token; io active/retired; WAL preflight; current root eq expected-root if prepared, eq new root if published. Io idle → `:serie-io-not-started`; insufficient coverage → `:lotto-not-covered` before CAS; health → Serie fault; token/root/invariant → Archivio. |
| S10 | `%publish-root` | `case`: prepared marks publishing, performs CAS, marks published; published does not repeat CAS; otherwise → `:serie-event-state` Archivio. Post-phase and root checked; CAS mismatch → `:serie-root-cas` Archivio. Interruption in intermediate phase remains uncertain. |
| S11 | `%resolve-publication` | Published phase; resolver success → resolved and advance. Only resource-exhausted handler with reason eq csn-busy → pending/0/0 and unchanged cursor. Other resource-exhausted propagated; incomplete cleanup marks Archivio. |
| S12 | `%advance-publication` | Positive unresolved and resolved/canceled phase before decrement; cursor advances to successor, retirement head unchanged. Inconsistencies → `:serie-count`/`:serie-event-state` Archivio. |
| S13 | `riusa-commit-serie` | Healthy; FIFO head; resolved; io retired; positive count; WAL preflight before effect through `%check-lotto-release :riuso`. Out of FIFO → `:serie-retire-order`; unretired io → `:serie-io-in-flight`; premature WAL → lotto-state/csn-pending/owned. Preflight invariant marks Archivio: CS-REV-01 closed in reading D. |
| S14 | `%mark-fault`, health/scope getters | Archivio scope assigns archive-faulted; Serie scope CAS healthy→faulted, preserving both faulted states. Scope getter case healthy/faulted/archive-faulted → none/Serie/Archivio; otherwise invariant. Two separate getter calls are not paired snapshot. |
| S15 | `%require-quiescent`, `annulla-commit-serie` | Scope eq Serie; FIFO unresolved; active-io zero, then each slot non-active, then exact token. Healthy/Archivio scope → `:serie-fault-scope`; nonzero active-io → `:serie-io-active`; active slot with zero counter → `:serie-io-count` Archivio. Only afterward: mark log faulted, cancel captured token. Busy preserves stage/token/count and returns unmeasured 0/0. |
| S16 | `%begin-effect`, `%end-effect`, lease release | Effect-active true on entry or lease release → `:serie-effect` Archivio. Complete-true cleanup releases ownership; complete-false marks Archivio and releases ownership retaining cause/references. COD-26 justified in review; no invented deviation or human approval. |
| S17 | `leggi-radice-serie`, event/CSN/count queries | Root with read barrier and faulted-health/log rejection; event/generation checked; free token rejected; count with lease. Event-state case over five contractual values; publishing/other → `invariant-violation :serie-event-uncertain` and Archivio. CS-REV-02 closed in reading D. |
| S18 | `%capture-token`, adoption | Reads token from sealed batch and checks registry/log/slot/words before adoption. Only invariant-violation handler → Archivio fault and same-condition propagation. Invalid-argument remains pre-mutation rejection; no resolution or new CSN acquisition. |
| S19 | `%check-lotto-release` | Case `:riuso` → durable/resolved-token/null-owner preflight; `:ritiro` → sealed/null-owner preflight; otherwise → `:serie-release-kind` Archivio. Invariant-violation handler marks Archivio and repropagates; ordinary rejections remain pre-mutation. No new compound and/or. |
| S20 | `ritira-io-commit-serie` | Valid lease and event; faulted Serie or Archivio health; prepared phase; active io; captured token; retirement preflight; positive active-io. Healthy → `:serie-not-faulted`; wrong phase/io → `:serie-event-state`/`:serie-io-state`; nonsealed batch/non-null owner → `:lotto-state`/`:lotto-owned`. Only after all guards: retired and exact decrement, post-guards and effect cleanup. Slot/token/root/cursor/count/unresolved preserved; no I/O or CSN cancellation. |

<a id="addendum-d--obblighi-discriminanti-per-i-fix-e-il-ritiro-io"></a>

## Addendum D — discriminating obligations for fixes and I/O retirement

| ID | State and action | Expected outcome to verify in parent's campaign |
|---|---|---|
| D-S01 | Sealed batch with internally incomplete token at adoption. | Original WAL invariant propagated; Archivio controller faulted; no adopted event or released token. |
| D-S02 | Same adoption with foreign registry/log token or nonpending token. | Ordinary rejection without adoption/mutation, distinct from internal invariant. |
| D-S03 | Resolved/retired event reuse with WAL-preflight invariant error. | Archivio faulted before reopening batch or releasing slot; ordinary premature error does not reset event. |
| D-S04 | Publishing phase after nonlocal exit, valid event/generation. | Getter signals serie-event-uncertain and Archivio; no uncertain public state or reinterpreted root. |
| D-S05 | Never-accepted dispatch, active retained, Serie later faulted, canceled group, and P08 proof. | Active→retired retirement and one decrement; prepared token and phase preserved. Only after whole-Serie quiescence may caller request cancellation. |
| D-S06 | Retirement request while healthy, idle/retired io, stale/foreign event, written/durable/faulted batch, or group owner present. | Each guard rejects before decrement; no lost obligation. New call after success rejects retired io. |
| D-S07 | Valid retirement while scope already Archivio. | Local draining allowed without downgrade; later automatic cancellation remains rejected for Archivio scope. |
| D-S08 | Sealed batch without owner but external retirement proof absent. | Outside API preconditions: do not attribute scheduler-quiescence proof to guard success alone. |

These are test and interpretation obligations, not tests written/run by
reviewer. I/O retirement event-local and does not require FIFO: may drain
out-of-order tasks; subsequent resolution/cancellation retains unresolved
FIFO, normal reuse retains head FIFO. Retirement does not enable faulty-buffer
reuse. New effect cleanup falls within COD-26 justification
already given in review, with seven paths releasing that ownership.

Preflights and ordinary resolution prove neither root immutability,
actual worker completion, nor global Archivio fail-stop. P01/P04/P06 remain.
Publication preflight guard delegates `verifica-log-segmento(log)`; existing
resolver guard on `lotto-csn-log` unchanged and present once:
previous WAL-mutator anchor not duplicated. No mutator run.

Reading outcome and P1/P2 observations in
[review document](controller-serie-revisione.md).
