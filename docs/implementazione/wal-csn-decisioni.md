<a id="decisioni-composte-e-condizioni-del-ponte-walcsn"></a>

# Compound decisions and conditions of the WAL–CSN bridge

**Current update:** local guards and complexity after R1 static closure
are in the final addendum; the earlier compound inventory is preserved.
The subsequent preflight addendum adds delegated contract E08 and pre-CSN rejections.

Date: 2026-10-09. Static COD-54 inventory from the second independent reading.
Version, scope, complexity counts, and both readings' checklists are in
[wal-csn-revisione.md](wal-csn-revisione.md). The bridge read has fingerprint
`a592a370135b8b24b548c38588215ad7d26bf1b5`; the group has fingerprint
`8245bc10cedafbff8665489fbced6833f078a373`.

Tables describe actual code conditions and **future verification obligations**.
They attest no tests written/read/run, MC/DC coverage, benchmark, or measured allocations.
No human certification or claim of absence of heap.

<a id="inventario-cod-54-delle-funzioni-modificate-e-nuove"></a>

## COD-54 inventory of modified and new functions

Each letter denotes an atomic predicate. `AND` and `OR` evaluate left to right
with short-circuiting. For an AND of n independent predicates, the obligation is all true
and each false in turn with preceding predicates true; for an OR, all false and each true
alone. Any impossibility of a combination in valid state must be documented.
Internal corruption cases must be distinguished from valid API input.

| ID | Function and actual decision | Atomic predicates | Outcome and per-condition obligation |
|---|---|---|---|
| D01 | `aggiungi-record`: `A OR B` | A: count = offset length; B: record bytes + SEAL > remaining space. | Each limit alone rejects `:lotto-capacity`; both false allow passage. Rejection precedes byte writes. |
| D02 | `ristampa-record-parole`: `(A OR B OR C) AND NOT P` | A: PUT; B: TOMBSTONE; C: EDIT; P: prepared bit set. | Each ordinary type with P false is restamped; P true preserves TXID. OUTCOME/DECISION/other allowed type with A/B/C false preserves stamp. A/B/C mutually exclusive, not arbitrarily combinable. |
| D03 | `verifica-chiusura-lotto`: `A AND B` | A: durable ≤ file-start; B: file-start + used + SEAL ≤ most-positive-fixnum. | Each false rejects `:lotto-offset` before CSN claim. Equality boundary included; negative numbers outside declared type. |
| D04 | `verifica-chiusura-lotto`: `A AND B` | A: count ≤ offset length; B: used + SEAL ≤ buffer length. | Each false signals `:lotto-seal-space`; no CSN claimed. False A represents internal corruption, not normal D01 saturation. |
| D05 | `verifica-log-csn`: `A AND B` | A: batch of segment kind; B: count > 0. | Control and empty batch rejected separately with `:lotto-csn-content`; both true pass. |
| D06 | `verifica-log-csn`: `A AND B AND C` | A: log of segment kind; B: batch file-id = log file-id; C: equal versions. | Each mismatch rejects `:lotto-csn-log` before claim. Log identity first fixed here; Archivio membership is an external precondition. |
| D07 | `esigi-csn-pendente`: `A AND B AND (C OR D)` | A: registry present; B: log present; C: high > 0; D: low > 0. | With pending true, each missing association and high=low=0 signals `:lotto-csn-token`. High=0/low>0 and high>0/low=0 are both allowed nonzero tokens. No registry access in guard. |
| D08 | `esigi-identita-csn-lotto`: `A AND B AND C AND D` | A: `eq` between local and expected registry; B: equal slot; C: equal high; D: equal low. | Each of four false with others equal rejects `:lotto-csn-stale` before resolution. For A use two registry objects with identical numbers: numeric equality insufficient. |
| D09 | `verifica-identita-lotto`: `A AND B AND C` | A: equal batch/log kind; B: equal file-id; C: equal version. | Each difference rejects `:group-identity-or-order` before ownership acquisition. |
| D10 | `verifica-identita-lotto`: `A AND NOT B` | A: csn-log present; B: `eq csn-log (gruppo-log group)`. | A true/B false rejects `:lotto-csn-log` even with all D09 true. A true/B true passes. A false follows legacy contract and B not evaluated. |
| D11 | `verifica-identita-lotto`: `A OR B` | A: group count zero; B: batch-start = group-start + group-bytes. | First batch passes without using empty group's frontier; subsequent pass only if contiguous. Both false reject `:group-identity-or-order` before CAS. |
| D12 | `aggiungi-lotto`: `A OR B` | A: count = slot count; B: batch-used > max-bytes − bytes. | Each limit alone rejects `:group-capacity` before mutating owner or group. Both false do not exclude duplicates/wrong ownership: simple guards follow. |

D02 and D01 are predicates already present in modified functions; D09/D11 were
extracted from the previous group predicate. D10 and D08 are added identity
protections. A shorter decision is not confused with already achieved coverage.

<a id="decisioni-composte-delegate-o-invariate-nel-contesto-del-diff"></a>

## Delegated or unchanged compound decisions in diff context

These are not new bridge decisions, but they are needed for its preconditions.

| ID | Position in read context | Conditions and obligation |
|---|---|---|
| E01 | `encoding-size` | `eq buffer key OR eq buffer value`: each alias alone must reject before first write. |
| E02 | `encoding-size` | `key-length ≤ key-limit AND total ≤ record-limit`: each false limit produces `:format-limit`. |
| E03 | `encoding-size` | `kind = PUT AND value-length > document-limit`: document budget applied to PUT; other types follow their format checks. |
| E04 | `configurazione-log` | `kind = segment OR file-id = 0`: segment may have nonzero file-id, control requires zero. |
| E05 | `crea-lotto` | `SEAL ≤ capacity ≤ max-bytes AND 1 ≤ max-records ≤ max-records-limit`: each invalid budget rejected before initial allocation. |
| E06 | `crea-log-io` | `stato-file = open AND mode-file = append`: each false property rejected. Wrapper exclusivity is a precondition. |
| E07 | `coperto-p` | `level = async AND kind ≠ segment`: async on control rejected; async segment requires written/durable, group/strong require durable. Function does not check log health. |

<a id="guardie-semplici-ordine-e-rifiuto-prima-della-mutazione"></a>

## Simple guards, order, and rejection before mutation

| Guard | Actual order in diff | Observable obligation |
|---|---|---|
| Open, not already associated batch | `verifica-chiusura-lotto`, then registry guard of `verifica-log-csn`. | Second seal does not claim another CSN. After post-claim error with batch still open, `aggiungi-record` and legacy seal also reject existing association. |
| Health at closure | After D05/D06, before historical frontier and `prendi-csn`. | Already faulted log gives `io-fault`; no credit consumed. |
| Historical frontier | durable ≤ durable-position of associated file, beyond D03. | Future frontier rejected even below file-start. Equality with current frontier not required: data may be historical. |
| Pending before expected identity | `esigi-csn-pendente` precedes D08. | Free/already resolved gives `:lotto-csn-not-pending`; stale token on new pending gives `:lotto-csn-stale`. |
| Health at publication | D08 precedes original health, then `coperto-p`, then `risolvi-csn`. | Old durable batch with faulted log does not release token as published. True `coperto-p` result insufficient. |
| Health at cancellation | D08, then original log faulted, then `risolvi-csn`. | Healthy log rejects `:lotto-log-not-faulted`; old event rejects first even if new log faulted. |
| Group duplicate/owner | After identity/budget, bounded duplicate search and nil→group CAS. | Already present batch object gives `:group-duplicate`; another group's owner gives `:lotto-owned`; no count increase in either rejection. |
| Reuse | Durable state, pending false, null owner, then reset. | Resolution alone does not enable reuse. Group release alone does not release CSN credit. |

<a id="identità-dellevento-e-scenari-concreti-da-verificare-successivamente"></a>

## Event identity and concrete scenarios to verify later

The event retains in preallocated fields the **original registry** reference and
**original slot/high/low** numbers. At seal, registry and returned high/low are known;
`leggi-csn-lotto`, called by writer before event handoff, supplies slot/high/low.
Reading the current batch when an old event arrives would replace the expected token
and defeat reuse protection. This discipline belongs to controller.

| ID | State/action | Statically expected result and observations to verify |
|---|---|---|
| S01 | Seal A, retain token T, complete write and async publication, call resolution with T. | Exact token/healthy log/written: one resolution; pending false. External acknowledgment after publication. No dynamic test performed. |
| S02 | As S01 with group/strong and batch only written. | `:lotto-not-covered`, token still pending and no slot released; repeating after durable may succeed with same T. |
| S03 | Resolve T, call again with T before reuse. | `:lotto-csn-not-pending`; no second mutating registry call. |
| S04 | Resolve T, make durable, release owner, reuse A, seal again obtaining T2, deliver old event T. | If T ≠ T2, `:lotto-csn-stale`; T2 remains pending, bytes/owner/registry not mutated by bridge. Includes reused slot but different words. |
| S05 | A pending with registry R; supply distinct R2 registry with numerically equal slot/high/low. | `:lotto-csn-stale` for false `eq`; no resolution in R or R2. |
| S06 | A pending; separately alter expected slot, high, or low, keeping others equal. | Three separate `:lotto-csn-stale` rejections; no real token release. |
| S07 | After reuse A free, old event T arrives before new seal. | `:lotto-csn-not-pending`; not `:lotto-csn-stale`, because pending checked first. |
| S08 | A bound to log L; group G of distinct L2, with same kind/file-id/version and compatible offsets. | D09 passes, D10 rejects `:lotto-csn-log` before CAS; group owner/count/bytes/slot unchanged. A may then be added to L's group. |
| S09 | A written/durable and T pending; later fault makes L faulted. | Bridge publication with T gives `io-fault` even if `coperto-p` would be true. After FAULTED Serie and retired consumers, cancellation with T may resolve. |
| S10 | L faulted, but cancellation event contains old T while A retains T2. | D08 rejects `:lotto-csn-stale` before releasing T2 credit. |
| S11 | Registry full/busy/exhausted at closure. | Per registry contract: A remains open without token, bytes/count unchanged. U64 exhaustion does not wrap; busy/full need bounded parking, not spin. |
| S12 | External publication complete, resolution with T rejected busy. | Retain T and published-fact in preallocated state; retry resolution only. Do not repeat index changes. |
| S13 | Encoding failure after successful claim and complete association. | Pending T retained; record addition, new seal, and reuse rejected. Fail-stop, I/O quiescence, and cancellation with T. |
| S14 | Interruption between claim and full storage, or between slot release and pending reset. | Uncertain registry/batch outcome; ordinary retry forbidden. Explicit reconciliation or Archivio stop; do not attest local recoverability. |
| S15 | CSN with low=0 and high>0; or high=0 and low>0; ordinary and prepared stamp in encoding. | D07 does not reject nonzero tokens; consistent LE low/high order, ordinary stamp and CRC updated, prepared TXID preserved. No explicit u64 reconstruction in bridge. |

These scenarios later require observations of credit, `H`, bytes, pending, ownership,
and index. No test/benchmark files were read or created in this review: assigned
responsibility concerns only the two documents.

<a id="stati-preallocati-e-obblighi-non-blockingfail-stop"></a>

## Preallocated states and nonblocking/fail-stop obligations

| State | Fields and transition | External obligation |
|---|---|---|
| Free | registry/log nil, pending nil; slot/high/low initially zero. | Single writer; no current event authorized for resolution. |
| Partially open pending | Successful claim and complete association, seal failed before sealed. | Do not continue batch or claim another CSN. Serie/log faulted before cancellation; consumers completed/retired. |
| Pending sealed/written/durable | registry/log/token retained, pending true; bytes immutable after sealed. | I/O owns in-flight group; writer observes outcomes after handoff. Event retains original identity. |
| Published, resolution parked | Bridge still sees pending; controller separately retains published-fact and token. | Retry only on nonmutating busy rejection; bounded obligation list, bytes, and time. |
| Resolved | pending nil, registry/log/token retained until reuse. | Duplicates rejected; await durable and release of all references before reuse. |
| New incarnation after reuse | CSN fields reset; new claim may reuse slot but not CSN in same registry. | Old event still uses captured numbers; never replace them with new incarnation's numbers. |
| Inconsistency after interruption | Incomplete local token or pending true with slot already released. | Fail-stop and reconciliation state, not ordinary retryable pending. |

The bridge retains no published-fact bit, owns neither Serie state nor index,
and parks no requests. Cancellation checks only faulted log, besides token:
FAULTED Serie and consumer quiescence must already hold at call time.

Overall conformance still requires demonstrating: registry rejections before
mutation; internal slot/CSN identity; indivisible assignment and registration; monotonic `H`
under ADR-0046; try-lock without blocking wait; K-bounded scans; fail-stop boundaries
and real handoff ordering. Authorized diff contains only registry calls.

Using two u32s avoids explicit u64 CSN reconstruction in bridge; it does not prove
absence of heap/boxing/GC in delegated calls, multiple returns, u64 comparisons,
or error handling. COD-30 remains **unattested until measurements**.

<a id="addendum-finale--guardie-di-ristampa-dopo-r1"></a>

## Final addendum — restamp guards after R1

Final builder `5b4be8856be1e25f35f7a6e68f45ae727c18b168` reread; fingerprints of
previous reading and intermediate step remain in review document.
R1 resolved statically. **No new compound decision**: still 12 decisions
D01…D12 in modified functions and 7 E01…E07 delegated/unchanged. D02 preserves exactly
the type/prepared predicate; new selections are two simple `unless` forms.

| Guard added to kernel | Actual condition and order | Statically expected outcome |
|---|---|---|
| Delegated state/buffer bound | `esigi-lotto lotto :open` before restamping. | Wrong state: `:lotto-state`; used beyond buffer: `:lotto-length`. Kernel reads no header. |
| G-R1-count | count ≤ offset length, before loop and first array access. | False: `invariant-violation :lotto-record-count`; zero and equality at bound allowed. Outer bridge check may reject earlier with `:lotto-seal-space`. |
| G-R1-offset | pos + header-bytes ≤ used, per record before reading type/flags. | False: `invariant-violation :lotto-record-offset`; equality allowed. Guard does not require body re-verification: buffer comes from codec and remains exclusive. |

| Additional scenario to verify later | Required result |
|---|---|
| S16 — count beyond offset array at kernel boundary; then count equal to limit. | Beyond limit: typed error before access; at limit: loop bounded and visits only existing offsets. No execution performed. |
| S17 — valid count and pos + header = used; then pos + header = used + 1, even with pos still within buffer capacity. | Equality passes; beyond used rejects before reading corresponding header, without relying only on physical buffer bound. |
| S18 — first offset valid and second corrupt, sealing through bridge. | First record may already be restamped; second gives `:lotto-record-offset`. Already assigned CSN retained pending, no new CSN/reuse/ordinary retry; fail-stop O2 handling. |

Current kernel complexity: **1 + 4 selections/loops + 3 short-circuits = 8**;
increase of 2 over original 6. Maximum across modified functions
unchanged at **9**, within COD-13. Guards add no loops, waits, or allocated
structures; this finding is not a heap measurement.

Parent reported separate offset FI test in `csn-threads`; it was not read
or run by this review. Agreed O1/O2 remain controller conditions,
whose implementation was not examined. Parent's first reading still to attest;
no human certification, measured coverage, or heap-absence guarantee.

<a id="addendum--preflight-file-e-contratto-delegato-e08"></a>

## Addendum — file preflight and delegated E08 contract

Bridge reread: `9e1bcfc2dcc92908600dfced771869677b2e90b5`; previous fingerprint
`a592a370135b8b24b548c38588215ad7d26bf1b5` remains historical. In `verifica-log-csn`,
the original durable guard is now inside `verifica-file-csn`; log identity/health
precede helper, and the entire helper precedes `prendi-csn`.

| ID/guard | Predicate or contract actually observed | Outcome/limit |
|---|---|---|
| G-file-written | written ≤ file-start, before I/O validator call. | False: `invalid-argument :lotto-written-offset`; no credit claimed. Equality allowed, greater positive distance allowed. |
| E08 — delegated contract | `verifica-capienza-append(file, planned, size)`, with size = used + SEAL and planned = file-start − written + size. Referenced joint requirements: available/open file, append mode, allowed size transfer, allowed planned extension. | Not a new source `and` in bridge: delegated logical predicate of I/O contract. Body and internal check order not read; typed conditions/purity depend on that module. |
| G-file-durable | durable ≤ posizione-durevole(file), after E08. | False: `invalid-argument :lotto-future-durable`; no credit claimed. E08 rejection may precede this error. |

Still **12 source compound decisions D01…D12** and **7 delegated/unchanged source predicates
E01…E07** from previous reading; **1 delegated contract E08** added, without
attributing an unread `and`/`or` structure or internal complexity to it.
`verifica-file-csn`: **1 + 2 selections + 0 short-circuits = 3**.
`verifica-log-csn`: **1 + 4 selections + 3 short-circuits = 8**, previously 9.
Overall maximum **9 ≤ 10**; no loop or wait added locally.

If written=100, file-start=150, and size=40, planned/transfer arguments are
90/40 and planned end is 190: this distinguishes file limit from individual transfer.
Preflight reserves no distance and does not prove batch contiguity: writer
maintains plan and group checks order. File state must be observed
through synchronized handoff; availability may change before I/O.

| Additional scenario to verify later | Observable obligation before CSN claim |
|---|---|
| S19 — written greater than file-start; then equal and less. | Greater: `:lotto-written-offset`; equal/less: evaluate E08 with exact distance. No local mutation on rejection. |
| S20 — unavailable/nonopen file, log wrapper still open. | E08 must reject under I/O contract even if wrapper health alone passes. No token assigned. |
| S21 — open file with mode incompatible with append. | E08 must reject before token; exact type/reason depends on unread I/O module. |
| S22 — sealed batch size beyond transfer limit. | E08 must reject using third size argument even if total file budget would allow batch. |
| S23 — individual batch within transfer but planned end beyond file budget. | E08 must reject including file-start − written; at allowed boundary batch admissible. |
| S24 — valid E08 and durable beyond real frontier; then equal and below. | Beyond: `:lotto-future-durable`; equal/below allowed. Historical value must not be confused with file-start. |

For each rejection: open batch without new CSN association, buffer/count/used unchanged
by bridge, no publication/acknowledgment. Complete image, including registry
and file state, requires proof E08 is validation only. These six axes
describe contract obligations; they do not attest details of parent's six tests.
Parent reports budget/availability coverage and unchanged image; tests not
read or run here. R1 closed statically and O1/O2 agreed; no human certification,
heap measurement, or attestation of parent's first reading.
