<a id="revisione-statica-c1-delle-fonti-get-della-serie"></a>

# Static C1 review of Serie GET sources

Reviewer distinct from product author, 2026-10-13, in worktree
`get-controller/ArcDocDB`, base `4344d9e1f2ceb45e5fa3d5076b57d09505e69ac3`.
Exclusive write scope: this document and
[get-fonti-serie.md](get-fonti-serie.md). C1 scope read:
`src/get-directory/sources-types.lisp`,
`src/get-directory/sources-read.lisp`, and
`src/get-resolver/active-read.lisp`; dependent contracts read-only.
Applied standard: [standard-di-codifica.md](../affidabilita/standard-di-codifica.md).
The first reading followed contracts and data flow; the second
rechecked guards, cleanup, concurrency, and twelve C1 points on the product
declared complete by its author, after correcting GFS-REV-01 and
restoring legacy owner precedence. Only the GFS-REV-02 delta was then
reread, including writer lease/health guards, and
the checklist updated without executions.
These are two readings by the same reviewer independent of the author,
not two distinct reviewers.

No compilation, test, benchmark, mutation, or qualification command
run by this reviewer. Future runs after freeze belong to
the integrator through `tools/record-command.lisp`; their plan is in the
[preregistered README](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-get-fonti-serie/README.md).
This report claims no C1 qualification, measured absence of allocations,
or passed `make check`.

<a id="identità-dei-sorgenti-riletti"></a>

## Reread source identities

Final Git blob inventory identical in consecutive readings after the last
delta declared by author, without committing or writing sources:

| File | Previous blob from second reading | Final blob after GFS-REV-02 delta |
|---|---|---|
| `src/get-directory/sources-types.lisp` | `addb371196c98a7a165b9002c5b13e876683b60f` | `b9b9a00d607dcf36f3cac7db31fe4663eb0bcdb2` |
| `src/get-directory/sources-read.lisp` | `729e638230424b1a97465a40b3e2208034210646` | `ca171a29008377ec491dce07afd6cf24f12cd8fe` |
| `src/get-resolver/active-read.lisp` | `0a93acd78d9b8b341011531e23e5663ae1df4f72` | `0a93acd78d9b8b341011531e23e5663ae1df4f72` |

Abbreviated references `sources-types.lisp`, `sources-read.lisp`, and
`active-read.lisp` below correspond to these three paths. Historical
GFS-REV-01/02 line references explicitly identify the intermediate version;
other references correspond to final blobs.
Stability of this inventory is not a freeze of the entire campaign.

<a id="prima-lettura-contratti-e-selezione"></a>

## First reading: contracts and selection

`avvia-get` enters EBR before copying the primary candidate
(`src/get/lookup.lisp:46–58`). Lookup confirms index root before
copying payload (`src/index/primary-read.lisp:51–55`); this confirmation
does not bind the candidate to the future source root. The superset
requirement is therefore part of the protocol, even when the old FD remains
open. CLOSED directory declares publication before locations and
FD retention (`src/get-directory/types.lisp:15–20`).

The new container has two read-only references without copying opaque
contents (`sources-types.lisp:7–27`). Registration: EQ owner and duplicate
search precede delegation (`sources-types.lisp:63–71`), so wrapper
does not adopt batch/token on those rejections. Contents pass without replacement
to the root built by ACTIVE (`src/get-resolver/active-build.lisp:94–110`).

The bridge acquires `leggi-radice-serie` once and derives sources/ACTIVE
from the same variable (`sources-read.lisp:14–16`). Dispatch passes
`active` to the explicit resolver (`sources-read.lisp:48–52`), which searches for
the page only within `root` (`active-read.lisp:18–25`). No read
of `planned-root`, second CAS, lifetime registry, or FD closure appears
in this path. Controller retains acquire and health check
(`src/series/query.lisp:28–38`); publication remains the existing CAS
(`src/series/publication.lisp:29–45`).

The first reading found **GFS-REV-01**, blocking cache probe:
call with a keyword not supported by the GET core. Reported immediately
to integrator before waiting for runs.

<a id="findings-e-rischi-registrati"></a>

## Recorded findings and risks

| ID / priority | Concrete evidence | Effect and action |
|---|---|---|
| GFS-REV-01 / P1, **closed statically before runs** | Intermediate version `src/get-directory/sources-read.lisp:63–64` passed `:outcome-offset proof`; `src/get/target.lisp:68–71` declares and defines `sonda-cache-get` with four arguments, without keywords. Final reread version has `declare (ignore proof)` at `sources-read.lisp:65` and four-argument call at `:66`. | Intermediate version would fail every probe on arity after resolution, already complete at `sources-read.lisp:52` of that version, entrusting pin to outer cleanup. Author correction consistent with core: prepared already `:proof-required` from flags (`target.lisp:81–90`). No runtime outcome claimed. |
| GFS-REV-02 / P2, **closed statically before runs: COD-24** | In previous blob `addb371…`, `src/get-directory/sources-types.lisp:31–42` had no pre/postcondition assertions and ended with unconditional NIL. Final blob checks ID/map cardinalities and maximum at `sources-types.lisp:37–38`, convergence at `:45`; reader handler at `sources-read.lisp:29–31`, writer at `sources-types.lisp:65–70`, preceded by lease/health at `:61–62`. | Both meaningful guards always active; geometry and failure to converge become invariants with explicit reason. Reader FAULTED with same reason and EBR cleanup; writer with valid lease marks Archivio scope and rethrows same condition before adoption. Canonical directories still take 17 pivots. Correction considered consistent in delta review; test sensitivity and runtime outcomes still to demonstrate. |
| GFS-RISK-01 / writer obligation | `sources-types.lisp:53–71` checks lease/health, owner/duplicate without comparing contents with old sources; `sources-read.lisp:46–52` searches exclusively in newly acquired root. | A new directory omitting an old still-copyable/observable location causes FAULTED. Protocol requires superset of resolvable locations for admitted readers; no rotation/reclaim implementation attested. |
| GFS-RISK-02 / API precondition | `src/get-resolver/active-read.lisp:10–12` assigns caller proof of publication; body uses `root` value without rereading controller. | A prepared root has same type as a published root. Explicit adapter cannot prove authority; bridge derives it from actual acquisition. Do not present type as guard against prepared roots. |
| GFS-RISK-03 / borrowed lifetime | `sources-types.lisp:7–27` retains and returns `content` without copy; `src/get-resolver/active-types.lisp:48–50` excludes external lifetime attestations. | Mutating opaque graph or closing FDs early violates preconditions even with read-only slots. GC, currently open FD, and EBR alone do not certify future quiescence. |
| GFS-RISK-04 / rejection after CSN | `sources-types.lisp:63–71` rejects owner/duplicate before `registra-lotto-get-attivo`; this API requires SEALED/CSN (`src/get-resolver/active-build.lisp:95–98`). | Rejection without adoption does not cancel already assigned CSN. Batch/token remain caller-owned and must be resolved by WAL protocol. |
| GFS-RISK-05 / measurement and fault boundary | `src/get/lifecycle.lisp:8–12` marks GET FAULTED and delegates isolation to boundary; new reader paths do not directly mark controller. Writer now applies local marker at `sources-types.lisp:69`. | Campaign must check cleanup and cause; writer marker does not prove coordinated Archivio stop. Serie/Archivio isolation and COD-30 do not follow from static reading alone. |
| GFS-RISK-06 / lifecycle limit, next increment | `src/get-resolver/active-build.lisp:42–45` requires planned-root NIL/event count zero/header offset; `src/get-resolver/active-types.lisp:38` requires at least one page; `src/get-resolver/active-build.lisp:91–94` and `sources-types.lisp:49–51` allow previous NIL/ACTIVE root. Initial controller also retains root as planned-root (`src/series/types.lisp:53–54`). | ACTIVE+CLOSED available after first ACTIVE publication. CLOSED-only form readable but does not pass directly to ACTIVE builder. Empty ACTIVE bootstrap with recovered CLOSED before first batch remains separate; no fictitious startup commit or new CAS introduced. Does not block bridge APIs in allowed forms or attest full startup. |

<a id="seconda-lettura-e-checklist-c1"></a>

## Second reading and C1 checklist

Second reading **completed**, supplemented by GFS-REV-02 delta review
on final blobs above. Probe call is
compatible with its `ftype`; ignored `proof` is already verified metadata,
not an error outcome (COD-06). Record read instead retains
`:outcome-offset proof` because `leggi-record-get` declares that keyword
(`src/get/segment.lisp:90–99`), and prepared reads OUTCOME before cache
(`src/get/segment.lisp:108–116`). The five results are neither aggregated
nor discarded by wrapper (`sources-read.lisp:78–79`).

Guards: `risolvi-candidato-serie-get` requires CANDIDATE before
acquisition/cleanup (`sources-read.lisp:43–46`).
`acquisisci-fonti-serie-get` is internal and unexported; its caller
installs cleanup and checks state. In the legacy wrapper, owner
is again checked before controller health/root
(`active-read.lisp:39–41`); explicit adapter repeats the owner
check (`active-read.lisp:18–20`). A foreign view is therefore not
reinterpreted as a controller fault in the legacy wrapper.

Cleanup: `complete` becomes true only after returned resolution;
an error choosing ACTIVE/CLOSED leaves it false and calls `abbandona-get`
(`sources-read.lisp:44–55`). ACTIVE adapter and legacy wrapper have
the same pattern (`active-read.lisp:15–26`, `:36–47`). Nested cleanups
are compatible with the core's repeatable abandonment: references and
buffers are discarded and FAULTED remains terminal
(`src/get/lifecycle.lisp:28–42`). No generic catch or cause
suppression is introduced. Interruption of cleanup itself is the
core's already declared fail-stop limit, to verify centrally.

GFS-REV-02 delta: search rejects ID/map arrays of different lengths
or cardinality above 65,536 before pivot access; at the end of the
budget it requires `left = right` before NIL. Early returns on
pivot equality or empty interval remain consistent. The new guard
adds no scans, allocations, I/O, or waits.

In the reader, the handler catches only search `invariant-violation`
and passes `error-reason` to `guasto-get` (`sources-read.lisp:29–30`): it preserves
reason, creates the terminal GET condition, and leaves pin release to outer
resolver cleanup. Accessor is imported by package
(`src/get-directory/package.lisp:7`) and returns a keyword
(`src/foundation/conditions.lisp:6–8`). Condition object
identity is not retained in reader; the reason cause is retained.

In the writer, `controller` derives from `source`, so `%check-owner` and
`%require-healthy` precede owner/search and the effectful handler
(`sources-types.lisp:58–65`). Lease check rejects foreign generation,
type, or thread before ring checking
(`src/series/ownership.lisp:73–80`). Handler marks that controller
`:archive-faulted` and rethrows the same condition object
(`sources-types.lisp:68–70`; `src/series/ownership.lisp:8–18`). An ordinary duplicate
remains `invalid-argument` and is not caught as an invariant.
Delegation rechecks lease/health and occurs after guards (`:71`).
Fault branches do not adopt or cancel the token;
no new CAS is introduced by delta.

| C1 checklist point | First reading | Second reading and static outcome |
|---|---|---|
| 1. Consistent requirements and ADR | REQ-IDX-001/WAL-006/CMP-007/AFF and GET, WAL, controller contracts acquired before protocol. | REQ headers and docstrings present; CAS/SEAL and task model consistent with ADR-0033/0035/0036/0037/0045. No requirement promotion. |
| 2. Invariants and sensitive tests | Owner, frontier, superset, pin, immutability, and private response inventoried in protocol. | `series-read.lisp` contains owner/root/missing-candidate/single-capture scenarios; execution and sensitivity still to demonstrate. Resource retirement and closure outside increment. |
| 3. Errors, handling, and tests | Input invalid-argument, graph invariant-violation, and controller io-fault distinct; GFS-REV-01 found. | GFS-REV-01/02 closed statically before runs. Wrong-state precedes ownership; reader retains reason/FAULTED and cleanup, writer checks lease before marker and rethrows same condition. No tests/fault injection run. |
| 4. Bounded loops, waits, recursion | Only new loop: duplicate search with 17 pivots. | For N ≤ 65,536, interval halves each pivot; minimum may require all 17. Delta checks cardinality and convergence; no wait or new recursion. Pages/row retain existing 17/33 limits. |
| 5. Measured hot allocation | Container built outside lookup, with two owned references; no explicit lookup allocation. | Static reading does not measure heap/boxing or multiple-value cost. COD-30 open for centralized measurements. |
| 6. Data checked before exit | Resolver and GET retain CSN, size, flag, FD, proof, CRC, and key checks. | Bridge returns provisional capability/metadata, never an authorized value; copying and `concludi-get` with fresh time remain mandatory. Prepared retains OUTCOME. |
| 7. Compound decisions | GFS-D01…D03 inventoried. | GFS-D04 added for delta geometry/cardinality guard; all new path `and` forms listed below. No condition coverage or MC/DC claimed. |
| 8. Shared-state owners | Explicit OWNER/SHARED; writer prepares, worker reads under EBR. | Two typed read-only slots; borrowed opaque graph documented. No defvar/mutable registry, no FD copying/closing. |
| 9. Traceability and `make check` | Package/ASDF and matrix consulted read-only. | Import/export connect adapter and wrapper; ASDF orders both new files after directory read. Global matrix, build, and `make check` to check by integrator after freeze. |
| 10. Standards and deviations | Safety 3, ftypes, docstrings, and REQ present; wrong arity found. | New/modified functions under 60 lines; no prohibited construct added. Meaningful geometry/convergence guards and caller handlers close duplicate search COD-24 finding. Complexity/coverage remain in centralized verification plan; no deviation required by delta. |
| 11. INV-P6 parallelism | Access limited to individual Serie and owning context. | No new lock, wait, or common write per GET. Writer CAS/ring and EBR entry already exist; no scalability measured here. |
| 12. Durable atomicity and discard | Wrapper prepares/adopts; WAL SEAL point, in-memory CAS. | No new durable record, file deletion, or FD closure. SEALED/CSN rejections retain caller obligations, without implicit rollback. |

Outcome: C1 source review and delta review completed, with GFS-REV-01
and GFS-REV-02 closed statically before runs. GFS-RISK-01…06 obligations remain
documented as integration/test limits. No other correctness
blocker emerged in the three sources under declared preconditions.

The next lifecycle increment must define startup with empty
ACTIVE and recovered CLOSED before the first batch, retaining authority,
publication, and superset. GFS-RISK-06 records the existing builder's
limit; it is neither reopening bridge findings nor qualification
of startup, rotation, or reclaim.

C4 review of `tools/get-series-bench.lisp` is not complete: the gate
is still being updated by another agent according to the integrator's
communication. No outcome of that tool, collector, or its
self-tests is assumed to close this C1 reading.

<a id="decisioni-da-coprire-dopo-freeze"></a>

## Decisions to cover after freeze

| ID | Site | Required conditions and cases |
|---|---|---|
| GFS-D01 | `src/get-directory/sources-read.lisp:27` | High word zero/nonzero; low word positive/zero, separately |
| GFS-D02 | `src/get-directory/sources-read.lisp:48–50` | `active` NIL; ACTIVE present with equal ID; ACTIVE present with different ID; second operand not evaluated with NIL |
| GFS-D03 | `src/get-resolver/active-read.lisp:42` | Correct root type and EQ source; wrong type and root from different source separated |
| GFS-D04 | `src/get-directory/sources-types.lisp:37` | Equal/different ID/map lengths; cardinality ≤ 65,536/above, separately; valid empty directory |
| GFS-S01 | Root/sources and owner | CLOSED-only, ACTIVE.content=sources, impossible shape/contents, foreign controller/view, different ACTIVE owner |
| GFS-S02 | Bounded duplicate search | Empty directory; minimum/middle/maximum present IDs; absent IDs before/between/after; 65,536 entries; maximum u32; duplicate before adoption and published; impossible geometry/cardinality and forced nonconverging budget |
| GFS-S03 | Cleanup and precedence | Wrong-state without controller read and without removing pin; legacy wrong-owner before health; fault after entry releases EBR preserving FAULTED/cause |
| GFS-S04 | Captured root and publication | Prepared event not acquirable by bridge; B publication after A capture retains resolution in A; candidate copied before root change remains resolvable |
| GFS-S05 | Common GET and migration | Ordinary/prepared CLOSED, ordinary ACTIVE, five values retained, proof-required without I/O, new start in I/O pool; private response until copy/completion |
| GFS-S06 | Delta fault and writer ownership | Reader retains reason and GET FAULTED and releases pin; writer with valid lease marks Archivio scope and same condition; stale/foreign lease rejected before examining corrupt directory, without marking controller |

GFS-D01…D04 are the new COD-54 compound decisions within the scoped path;
GFS-S01…S06 are additional guard/protocol scenarios. Presence of a
source test does not prove condition coverage, MC/DC, or passing.
