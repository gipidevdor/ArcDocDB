<a id="revisione-indipendente-del-controller-di-serie"></a>

# Independent review of the Serie controller

Date: 2026-10-09. Declared and observed base:
`cf6091367853ec311fed7b05961a2812fd05a8f1`. Shared worktree:
`/Users/gpicchiarelli/.codex/worktrees/controller-serie/ArcDocDB`.

<a id="stato-della-lettura"></a>

## Reading status

First phase: contract, risks, and inventory of expected decisions prepared.
`src/series/` and new WAL preflights were absent at the first inspection.
All eight `src/series/` files and new WAL preflights then appeared.
Complete static readings B/C and addendum D are done. In phase D the
parent declares the product frozen while tests/tools are still being
integrated. The update includes P2 fixes and I/O retirement without delivery:
42 Series functions and 6 WAL helpers, maximum complexity 8 including short
circuit, case, and handlers. Both B/C P2 findings are closed in rereading D; no
new P1/P2 identified under declared preconditions. C1 review of the
change with tests and two readings remains with the integration campaign.

Exclusively static activity; no test, build, benchmark, driver, heap
measurement, or mutation campaign run. No human certification, MC/DC, or complete-engine
guarantee. The parent performs its own first reading and integration; this
is the assigned independent reading.

<a id="ambito-e-proprietà-dei-file"></a>

## Scope and file ownership

Writes for this assignment are limited to:

- `docs/implementazione/controller-serie-decisioni.md`;
- `docs/implementazione/controller-serie-revisione.md`.

No changes to product, ASDF, tests, tools, or other agents' documents.
No branch, commit, or push created. Products, tests, or benchmarks from
parallel assignments are not duplicated.

In-scope sources read: **all** `src/series/` files, public
preflights `verifica-token-lotto`, `verifica-pubblicazione-lotto`, and
`marca-log-faulted`, with `verifica-log-segmento`, `verifica-riuso-lotto`,
`verifica-ritiro-lotto`, related exports, and context of the preserved WAL resolver.
ASDF is consulted for dependency boundaries without modification.

Context already read: `src/wal/csn.lisp`, `src/wal/types.lisp`,
`src/wal/group.lisp`, `src/wal/executor.lisp`, `src/wal/package.lisp`,
`src/csn/registry.lisp`, `src/csn/package.lisp`, foundation conditions,
ADR-0037/0046/0033, and coding standard.

<a id="criterio-per-lidentità-delle-evidenze"></a>

## Evidence identity criterion

The Git base identifies the starting point; in the shared worktree it does not
automatically identify current content. At every product reading, files and
fingerprints of content read are recorded, distinguishing an intermediate review
from a frozen review. A before/after fingerprint comparison documents only stability
during that observation; it does not replace the integration freeze
declaration. Source-stable runtime records belong to the parent's
campaign after freeze.

| Phase | Identity | Permitted conclusion |
|---|---|---|
| Preparation | Base `cf6091367853ec311fed7b05961a2812fd05a8f1`, controller absent. | Expected obligations/risks and WAL context. |
| Intermediate reading A | Four Series files: package/types/ownership/events; WAL builder/csn/executor/package. Fingerprints for CS-REV-01 path below. | Static observations only on content read; integration still open. |
| Addendum D before tests | Product freeze declared by parent in message; C1 blobs and SHA-256 below. Tests/tools still being written. | Static P2 closure and review of new retirement; no runtime outcome attributed to this review. |

SHA-256 fingerprints for intermediate reading A (not a campaign source-stable record):

| File | SHA-256 |
|---|---|
| `src/series/events.lisp` | `08f85caf9911a11d0564d320c05b236cbbca4edde5b5160df9e752950933e7d1` |
| `src/series/ownership.lisp` | `ce9292668f85d7cc5ba036c0ebd71a8910d67029d02eaab82d9bcf8650489c0c` |
| `src/wal/csn.lisp` | `7439be1ce198f9d894988108d5aa05ef2c692a2af732e94304f4b6393b172339` |

SHA-256 fingerprints for complete reading B, after announcement that the product
was written. This identifies the static reading, **neither a freeze nor a campaign
source-stable record**:

| File read | SHA-256 |
|---|---|
| `src/series/package.lisp` | `a13ff4b2a08ac287203575f99a04c4c23653d5ffeb86cf5290b44562e7ec8bcd` |
| `src/series/types.lisp` | `a225d83965f7a9e049a46a1a9c5715829e060284840527814904463e3bba8eed` |
| `src/series/ownership.lisp` | `e2622e71628cc78d0d940aac5673ef4817d08d7f3e826dd10a9d27bf9e591f7b` |
| `src/series/events.lisp` | `598b23b09c0c031524c1f72c113872e3f6ad263a2a2763187ceecc2806b70f54` |
| `src/series/io-events.lisp` | `d03cd08f9c291d79777f040e7b532d283effee5633dbe134d6d77b5000b39a87` |
| `src/series/publication.lisp` | `288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762` |
| `src/series/query.lisp` | `6848ee27967c8f4128d4026fbcc06727af9e30dfaac1a7695317c4827051de03` |
| `src/series/retirement.lisp` | `360a59f603306ca270446a23d998801c692e9451060736163c9d19fa41d13a32` |
| `src/wal/csn.lisp` | `7439be1ce198f9d894988108d5aa05ef2c692a2af732e94304f4b6393b172339` |
| `src/wal/builder.lisp` | `b105dbd8a704694fd061bca155692e8c394c3d2272b9f9f0a06285cf9849d22b` |
| `src/wal/executor.lisp` | `d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8` |
| `src/wal/package.lisp` | `ed438c9bad09752e8b898b8ad858a62e3129c4f723803e65cb9af67abbca43f8` |
| `arcdocdb.asd` | `61bad4cbfbb0defe8cc325beb5ddf7100b265829e06af40523f609a04e5697e3` |

<a id="aggiornamento-c-geometria-ring-log-segmento-e-contratto-parent"></a>

### Update C: ring geometry, segment log, and parent contract

Reading C replaces the following fingerprints in table B; fingerprints B
are unchanged for other files. The parent's contract is added as a
source. Still no freeze or campaign execution:

| File | Reading C SHA-256 |
|---|---|
| `src/series/types.lisp` | `f4421765dc166310ab2f1801052d2c4b8083be19cb0b32d84d2dcdfd41afb3e4` |
| `src/series/ownership.lisp` | `640368ff404af2c02f31ac2525a8a1887de5d1c0e62f645bc64a9ecbe708fb6d` |
| `src/series/io-events.lisp` | `f238e614e39c03e2564210bbc83907597a97bf89b1b05f43e42b13a2b1c64731` |
| `src/series/package.lisp` | `57c89fbf69170c6d05cee004bc294d16c63b53adb3dd7ace39591d95605ba630` |
| `src/wal/csn.lisp` | `2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810` |
| `src/wal/package.lisp` | `471a9f9da06d22db4b6cea4b7d0856515ddb879427dd682cf76757319f8c13c5` |
| `arcdocdb.asd` | `3863976de1b2b6ba63c8fafa42b1549f8e596d40a885992de41ffc5d2923da19` |
| `docs/implementazione/controller-serie.md` | `6a593ca77f1987f55221e5e901c957782597a35a373e283abb8decaa4bd78509` |

`%check-ring` calls `%check-geometry` after bounds: it checks both
modular identities `tail=head+count` and `tail=publish-head+unresolved`.
`%position-after` adds only position<capacity and amount≤capacity: maximum sum
2047, at most one subtraction, no fixnum wraparound. New helpers do not
scan or mutate the ring. Adoption, advance, and reuse post-guards
run after updating all cursors/counters.

The factory delegates `verifica-log-segmento` before allocations, with
invalid-argument `:log-segment-kind` for control/multiseries and io-fault for a
faulty log. Publication preflight delegates the same check; the resolver's
original `lotto-csn-log` guard is unchanged, with one occurrence
of the prior WAL mutator anchor. This is static textual comparison:
no test or mutator was started.

<a id="obblighi-prioritari-della-lettura"></a>

## Priority reading obligations

1. Separate root CAS, token resolution, I/O completion, and the two FIFOs;
   resolved `:async` can remain occupied/active until flush.
2. Check lease authority: single CAS, thread, current generation,
   fixnum budget without wraparound, and release/reacquisition for transfer.
3. Check event authority: controller ring object plus
   captured generation; never authorization by numeric slot/CSN alone.
4. Check `:sealed` adoption before dispatch, valid `nil` root,
   offset contiguity, increasing two-word CSN, capacity, and premutation budget.
5. Check log/token/coverage preflight before CAS; only `:csn-busy`
   becomes pending; `:pubblicato` retries resolver without another CAS.
6. Check I/O completion after final durable/faulted handoff, double dispatch
   rejected, exact decrement, and draining possible after fault.
7. Check terminal fault and Serie→Archivio upgrade; uncertain state or
   invariant requires Archivio, known I/O fault requires Serie.
8. Check FIFO abort only for faulted Serie with **all** I/O quiescent;
   captured token and faulted log; automatic rejection in Archivio scope.
9. Check FIFO reuse only when resolved/retired/durable/owner null;
   premature rejections before reset and generation preserved.
10. Inventory every function and compound decision, maximum complexity 10
    including short circuit, types/docstrings/pre-post, and scan bounds.

The predicate and risk matrix is in
[controller-serie-decisioni.md](controller-serie-decisioni.md).

<a id="precondizioni-che-la-review-non-può-dimostrare-dal-solo-controller"></a>

## Preconditions the review cannot prove from the controller alone

The root is immutable and prepared outside the controller. The caller performs a
reliable I/O completion handoff. Adoption precedes dispatch. A caller
boundary must apply Archivio fail-stop for nonlocal interruptions in the
uncertain root/stage or register/token window. Controller/log uniqueness and
group release before reuse are ownership disciplines. Static reading
can check that these preconditions are explicit and respected by local
paths; it does not certify engine scheduler, index, or recovery.

<a id="riscontri-sul-prodotto"></a>

## Product findings

| ID | Priority | File/function | Trigger and consequence | Status |
|---|---|---|---|---|
| CS-REV-01 | Original P2 | `src/series/events.lisp:83` and `src/series/retirement.lisp:21` in version B/C. | Token and reuse preflights could propagate an invariant before `%begin-effect`, leaving the controller healthy. | Statically closed in addendum D through `%capture-token` and `%check-lotto-release`. |
| CS-REV-02 | Original P2 | `src/series/query.lisp:48` in version B/C. | Getter could return internal phase `:pubblicando`, outside the five contractual outcomes. | Statically closed in addendum D: case over five states; otherwise serie-event-uncertain and Archivio. |
| CS-REV-03 | Standards observation | `src/series/ownership.lisp`, `%end-effect`; six original paths and new I/O retirement. | Conservative literal first reading proposed a deviation; acquired/released resource and parent contract reexamined. | Deviation request withdrawn: ownership cleanup with protective terminal marking, under the reasoned interpretation below. No human approval attributed. |

The following CS-REV-01/02 explanations preserve version B/C paths;
actual closure and D identities appear in the subsequent addendum.

**CS-REV-01 — Adoption preflight fail-stop (B/C history).** The lease/ring guard
has passed, but a direct call to `verifica-token-lotto` can propagate
a WAL bridge invariant without `%mark-fault`. One corrupt-state example
is `csn-pending=t` with `csn-high=csn-low=0` or absent log: the bridge signals
the invariant without mutating the register, while the controller remains healthy.
This is not ordinary stale/full rejection and must not be normalized to pending.
The same function already uses `%check-captured-token` to convert adopted-event
defects to Archivio fault, but initial adoption bypasses that boundary.
In reading B, the same problem exists in reuse: a durable batch with
`lotto-used > length(lotto-buffer)` passes event/retired/FIFO guards and
`verifica-riuso-lotto` signals `invariant-violation :lotto-length` through
`esigi-lotto`. The first preflight is outside the protected effect; event and batch
are not reused, but the Serie remains healthy. The second check inside
`riusa-lotto` is protected and does not compensate for the earlier one.

Request: guarantee faulted Archivio for these preflight invariants too,
while preserving ordinary pre-adoption invalid-argument rejections and leaving batch/token with the caller.
The reviewer made no product correction.

**CS-REV-02 — Public state outside contract (B/C history).** `%publish-root` assigns
`:pubblicando` before CAS and `:pubblicato` after. A nonlocal transfer
between these assignments leaves the intermediate phase; `%end-effect` makes the
controller archive-faulted. With object/generation still valid, the public
getter nevertheless returns `:pubblicando`. Retaining this internal marker
to recognize uncertain state is useful, but the caller cannot treat it as
one of five promised API outcomes. Align the getter with the contract by rejecting
the uncertain phase with a typed condition, or make the extension explicit in the
public specification and its verification obligations. Do not normalize an uncertain
state to `:preparato` or `:pubblicato`.

**CS-REV-03 — COD-26 and effect release, reassessment.** Wording read in the standard:
“`unwind-protect` only to release resources; never to hide an error.”
`effect-active` is local ownership: `%begin-effect` acquires it,
`%end-effect` releases it. If `complete=nil`, Archivio scope is also
marked before release. The code read respects the rule's second part:
no generic catch, rollback, or suppression of the original condition/transfer
in cleanup; `%mark-fault`'s Archivio path only sets the
state word and returns. The conservative first reading considered marking
an additional effect beyond release and proposed a deviation. After reading the
[parent contract](controller-serie.md) and complete protocol, the reviewer
withdraws that request: the effect has actual ownership acquired before
the body, checked for reentrancy, and released in every cleanup, including
success. Terminal marking is part of safely releasing this ownership
when the body has not finalized it, keeping a resource with an uncertain outcome
unavailable for continued operation. It is not merely a pretext for recovery in
cleanup.

The concrete reason is that `handler-case` for typed conditions does not
catch every nonlocal exit, while the uncertain CAS/stage or register/event window
must block new operations and automatic abort. Removing fault
from cleanup would leave that obligation without a local safeguard. The conclusion's
scope includes only terminal Archivio marking on incomplete exit
during effect release; references/tokens and original cause are
preserved. Rollback, token resolution, I/O, callbacks, and retries are not part of the
cleanup read and would require reassessment. Scope:
adoption, I/O start/completion/retirement, publication, reuse, and abort. Owner release
during lease acquisition is already a separate resource-release use.

This is the reviewer's reasoned interpretation, not C1 certification or
human approval. No approved deviation is recorded or invented.
`docs/affidabilita/deviazioni.md`, read and still without approved deviations,
is not modified by this assignment. Its “author approval” constraint
would apply to an actual deviation being recorded; it does not authorize
inventing an approving person/date.

<a id="percorsi-esaminati-nella-lettura-completa-b"></a>

## Paths examined in complete reading B

| Protocol | Static evidence and limitation |
|---|---|
| Health and scope | One enum word `:healthy/:faulted/:archive-faulted`. `%mark-fault :serie` uses CAS healthy→faulted; no downgrade from archive-faulted. Both getters each derive from a barrier-protected read of that word; two separate calls can naturally observe different times. |
| Adoption | Capacity/generation guards, level, planned-root `eq`, sealed, next-offset, and fixnum sum; registry/log token `eq`; lexicographically increasing CSN before effect. No new CSN allocated; nil root allowed. C1 exception CS-REV-01. |
| Event and lease | Lease bound to current-thread and generation; event with controller `eq`, generation, position range, and identity in slot. Reuse preserves event generation and advances controller generation on next entry. |
| Root/token | `%check-publication` precedes CAS; `:pubblicando` marks uncertain window. `%publish-root :pubblicato` does not repeat CAS. Resolver uses captured fields; only `:csn-busy` produces pending/zero/zero without advancing cursor. |
| I/O and async | Start idle→active before dispatch; completion accepts durable/faulted, never written alone. Publication accepts active for covered async, without decreasing count/active-io. Publish-head advances at resolution; retirement head advances only on reuse. |
| Fault and cancellation | Fault prevents new entries/dispatch/publications, but completa-io does not require healthy. Abort requires Serie scope and zero active-io, then a scan of all slots for none active, exact token, marca-log-faulted, and resolver. No reuse of aborted/faulty buffers. |
| Reuse | FIFO head, resolved phase, retired io, WAL preflight durable/CSN not pending/null owner before reset. References released after `riusa-lotto`; generation not zeroed. C1 exception CS-REV-01. |
| Parallelism and bounds | Owner CAS per segment, root CAS per batch, shared register at per-batch resolution. Fault scan ≤ 1024; factory ≤ 1024; no product thread, callback, I/O, or retry loop. |
| WAL and ASDF | New preflights and exports consistent; `verifica-riuso-lotto` extracted without mutation before guards. `marca-log-faulted` does not release active and requires quiescence or a call by the owning worker on its own fault. Existing resolver preserved; Series loaded after WAL. |

The controller does not own Archivio: archive-faulted encodes the coordinator's
obligation to stop all controllers in Archivio. It does not directly implement
that global fail-stop. The write handoff used for async during flush is not
the completion handoff: it must provide a reliable coverage reading while the
buffer remains unavailable for reuse.

A P1/P2 is reported as soon as reproducible as a static path, with function,
trigger, consequence, and requested correction. Finding closure requires
rereading modified code and a new source identity, not merely the author's
response. The reviewer introduces no reimplementation.

<a id="addendum-d--fix-p2-ritiro-io-e-identità-prima-delle-prove"></a>

## Addendum D — P2 fixes, I/O retirement, and identity before tests

Changed files, new preflights, exports, and parent contract reread.
Unchanged Series files are identified by the same content already read in C.
Freeze concerns the **product declared by the parent**, not the whole
shared checkout: tests, tools, and documents may still change. These
blobs identify review content; they are not a build/test/benchmark
result or source-stable certification of the future campaign.

| C1 file | Git blob of content read | SHA-256 |
|---|---|---|
| `src/series/package.lisp` | `0cccb1f1b9bb8f63a308352d64426a420bd1e283` | `7433162105df63d324141167e6dcf6bfee74611aa1cf7291cc6c92f41f3c7408` |
| `src/series/types.lisp` | `ab736479f4e40237a060cab4f16cff139ed176e7` | `f4421765dc166310ab2f1801052d2c4b8083be19cb0b32d84d2dcdfd41afb3e4` |
| `src/series/ownership.lisp` | `59ec27d62ce32576a837abc56bf6d31562c957d2` | `640368ff404af2c02f31ac2525a8a1887de5d1c0e62f645bc64a9ecbe708fb6d` |
| `src/series/events.lisp` | `63fb4a20faeedceb47b8cd550262f1bdca497c06` | `c4c551e27c6858fe521b7a8736a42539c639e2e78ab17599b39079511a8e77c7` |
| `src/series/io-events.lisp` | `128fe9650a741541b46d1ad0887b872cb2e85012` | `5695cd60f16eec8b6c5da0b1c3c559dfd84a2e7e3a19b69643b00b2048385546` |
| `src/series/publication.lisp` | `48a789494e731732ae0b378347e133d50daacfe4` | `288cb3fa41fad76a0e6919dfa0b2fce2beef15f5880129393bee35bc8795c762` |
| `src/series/query.lisp` | `7f91ca22b7f2f339b450db0f4c26c97f86906c58` | `21363e48cf5c76b771501e54d16b1a6b8627da003a0852db0aadcfbd45d55eb9` |
| `src/series/retirement.lisp` | `fc42b51a0f8606687881e239ba650a9f1bb58124` | `23f3ab39b4176917e86064dff0a11e389df47e0286778a870f718fdc6f3fa059` |
| `src/wal/builder.lisp` | `6d30698383477880c693954314bab03ca8affe24` | `186d481c39ed0a339a6c884ed3a8b6f82da6c17315d8649c8d749efee29682f0` |
| `src/wal/csn.lisp` | `f65662b4dea8ef04e4e59ce38b29a94fecea4f6c` | `2fc52ddc064a87c32c44d1a8a9756de65b75b25dd705fdf24be1da53ef5ab810` |
| `src/wal/executor.lisp` | `edc8ce7474365e0885925d557a378779655d2e70` | `d5fce79d73f6d5115602fabb822ba36ab4ec376dfba5025c5bf1426f6ec438d8` |
| `src/wal/package.lisp` | `ad1b1356eeb10248526f15ac31d2cc9b59811fc5` | `483c7fd8debf44765375cca8429dfc111bc4775a6db2eb5f0d7e6991f1e5ad89` |

Metadata consulted: ASDF blob `fdbafde57394cefb7965beaf65e4ac04c0d6fe95`,
SHA-256 `3863976de1b2b6ba63c8fafa42b1549f8e596d40a885992de41ffc5d2923da19`;
parent contract blob `fbd177aee0fe0d21532f9e7aaaa013b8755de10e`, SHA-256
`1d96cb0a16733a22020f09cfc4d089ca22e8dcbf01eb54610661ef86a5315d9b`.
This identity does not extend to test/tool files still being written.

<a id="chiusura-dei-riscontri-alla-rilettura"></a>

### Finding closure on rereading

| Finding | Correction read | Static outcome |
|---|---|---|
| CS-REV-01, adoption | `%capture-token` in `events.lisp:75`, called by registration before effect, protects WAL reading/preflight with invariant-violation handler. | Marks Archivio and repropagates original condition. Ordinary invalid-argument rejections are not converted to busy/fault; no event/credit mutation before success. Closed. |
| CS-REV-01, release | `%check-lotto-release` in `events.lisp:87`, called by reuse with `:riuso` and by I/O retirement with `:ritiro`. | Preflight invariants → Archivio before reset/decrement; ordinary premature rejections retain references/obligation. Closed on new path too. |
| CS-REV-02 | Getter in `query.lisp:44`: case allows only libero/preparato/pubblicato/risolto/annullato; otherwise `%serie-invariant :serie-event-uncertain`. | Uncertain state remains internal; getter signals invariant and Archivio without inventing an ordinary phase. Closed. |

No new P1/P2 identified in added paths. **Static** closure;
discriminating tests are delegated to the parent's campaign without being
anticipated, duplicated, or certified by this assignment.

<a id="ritiro-di-un-obbligo-io-senza-esecuzione"></a>

### Retiring an I/O obligation without execution

`ritira-io-commit-serie` rejects healthy with `invalid-argument :serie-not-faulted`.
It requires current event/generation, prepared phase, active io, exact captured
token, sealed batch without group owner, and positive active-io. Guards
precede effect: written/durable/faulted state or a group still owning the batch does not
authorize retirement. Preflight `verifica-ritiro-lotto` also delegates
the length invariant; the wrapper marks Archivio if it fails.

On success it changes only io-state→retired and active-io→active-io−1,
with ring and event post-guards. Token still pending, prepared phase,
root, count, unresolved, and both FIFO cursors are preserved. Double retirement
rejects retired io; it does not repeat decrement. It does not write, flush,
abort the token, or reopen the batch. Archivio scope allows local draining
but retains the prohibition on automatic abort.

External proof of retirement/never accepted is a **precondition** tied to the
message task with captured event and generation. The caller must definitively
exclude worker access, then abort the never-written group before
this API. `sealed` and null owner do not independently prove scheduler
quiescence. After retirements, `annulla-commit-serie` still rechecks all
Serie I/O, zero active-io, and every slot non-active before marking
the log and resolving the captured token. This separation prevents permanently
abandoning the active obligation after scheduler rejection followed by fault.

The new cleanup uses the same acquired/released effect-active ownership:
the COD-26 rationale remains valid for seven effect paths. No
deviation or human approval introduced. The previous WAL anchor remains unique
and unchanged; no mutator run.

<a id="checklist-c1-e-limiti-della-fase-corrente"></a>

## C1 checklist and current phase limits

<a id="complessità-preliminare--lettura-intermedia-a"></a>

### Preliminary complexity — intermediate reading A

Manual local count compared with syntactic scanning without loading or
compiling product. Base 1; `if/when/unless` and loop add 1;
`and/or` add N−1; each `handler-case` clause adds 1. Runtime
macros and called helpers are not expanded. Maximum of **20 available
functions: 8 ≤ 10**; not yet the complete module maximum.

| File | Functions and complexity |
|---|---|
| `src/series/types.lisp` | `crea-controllore-serie` 6. |
| `src/series/ownership.lisp` | `%mark-fault` 2; `%serie-invariant` 1; `%check-ring` 8; `%check-owner` 5; `%release-owner` 3; `acquisisci-controllore-serie` 4; `rilascia-controllore-serie` 2; `%require-healthy` 3; `%begin-effect` 2; `%end-effect` 2; `%next-position` 4. |
| `src/series/events.lisp` | `%check-event` 8; `%live-event` 3; `%csn-after-p` 3; `%check-admission` 8; `%check-new-slot` 4; `registra-commit-serie` 2; `%check-captured-token` 3; `%check-publish-head` 4. |

New WAL preflights: `verifica-token-lotto` 2,
`verifica-pubblicazione-lotto` 3, `verifica-riuso-lotto` 3,
`marca-log-faulted` 1. The count does not incorporate delegated guards;
these remain in the context read and decision obligations.

### Checklist

| Standard item | Current evidence | Status |
|---|---|---|
| 1. Consistent requirements and ADRs | Parent contract, eight Series files, WAL preflights, exports, and ASDF read. No engine requirement promoted. | Static reading performed. |
| 2. Invariants and discriminating tests | Obligations listed in matrix; tests assigned elsewhere. | Not attested. |
| 3. Typed errors, handling, and tests | Actual reasons inventoried; CS-REV-01 and CS-REV-02 statically closed in D. Tests not executed/read as review evidence. | Static handling reread; tests unattested. |
| 4. Bounded loops/waits | Factory and quiescence at most capacity≤1024, single CAS operations, no wait or retry. Maximum complexity 8; table D below. | Statically compliant with observed bounds. |
| 5. Measured allocations | No measurement run or read for new controller. | Not attested. |
| 6. Validated output data | Root/token/lease validated and public state restricted to five outcomes; immutability/handoff and cancel-proof remain preconditions. | Static reading performed under preconditions. |
| 7. Compound decisions | All six direct compound predicates and actual selections/guards inventoried; existing WAL helpers identified. | Static inventory complete; MC/DC unattested. |
| 8. Ownership | Thread/lease, object+generation, and source log/registry distinct; effect-active is an actual resource with protective cleanup. | Static reading performed; external protocol remains a precondition. |
| 9. Traceability and checks | Parent responsibility; no check during integration. | Not attested. |
| 10. Deviations | COD-26 reassessed as safe release of effect ownership; rationale CS-REV-03. No deviation/human approval recorded. | Explicit static interpretation, not certification. |
| 11. Parallelism across Serie | Local owner/root/count, CSN register shared only per batch. No shared per-document write introduced. | Static reading performed; benchmarks unattested. |
| 12. Atomicity and removals | Volatile root CAS distinct from persisted SEAL; no file I/O or removal in controller. Uncertain state requires Archivio fail-stop. | Static reading performed under preconditions. |

<a id="complessità-completa--lettura-d"></a>

### Complete complexity — reading D

Same criterion as phase A, with `case` counted per explicit nondefault
alternative; conservatively, individual values in a grouped clause
are also counted. Example `%mark-fault`: 1 base + 1 if + 3 values accepted by case
= 5. Example `%check-ring`: 1 base + 2 unless + 3 and + 2 and = 8;
the geometry helper is counted separately. Runtime macro and called-helper
branches are not expanded in the calling function.

| File | Each function and local C1 complexity |
|---|---|
| `src/series/types.lisp` | `crea-controllore-serie` 5. |
| `src/series/ownership.lisp` | `%mark-fault` 5; `%serie-invariant` 1; `%check-ring` 8; `%position-after` 4; `%check-geometry` 3; `%check-owner` 5; `%release-owner` 3; `acquisisci-controllore-serie` 4; `rilascia-controllore-serie` 2; `%require-healthy` 3; `%begin-effect` 2; `%end-effect` 2; `%next-position` 4. |
| `src/series/events.lisp` | `%check-event` 8; `%live-event` 3; `%csn-after-p` 3; `%check-admission` 8; `%check-new-slot` 4; `%capture-token` 2; `%check-lotto-release` 4; `registra-commit-serie` 2; `%check-captured-token` 3; `%check-publish-head` 4. |
| `src/series/io-events.lisp` | `inizia-io-commit-serie` 4; `completa-io-commit-serie` 6; `ritira-io-commit-serie` 6; `%require-quiescent` 5. |
| `src/series/publication.lisp` | `%check-publication` 6; `%publish-root` 6; `%advance-publication` 3; `%resolve-publication` 5; `pubblica-commit-serie` 2. |
| `src/series/query.lisp` | `stato-controllore-serie` 2; `ambito-fault-serie` 4; `leggi-radice-serie` 3; `stato-commit-serie` 6; `leggi-csn-commit-serie` 1; `conta-commit-serie` 1. |
| `src/series/retirement.lisp` | `riusa-commit-serie` 6; `fault-controllore-serie` 3; `annulla-commit-serie` 4. |
| `src/wal/csn.lisp`, new preflights | `verifica-log-segmento` 3; `verifica-token-lotto` 2; `verifica-pubblicazione-lotto` 2. |
| `src/wal/builder.lisp`, new helpers | `verifica-riuso-lotto` 3; `verifica-ritiro-lotto` 2. |
| `src/wal/executor.lisp`, new helper | `marca-log-faulted` 1. |

There are 42 Series functions and 6 new WAL helpers. Maximum **8 ≤ 10**, including
short circuit and handlers, for version D. Series definitions reach
29 lines from `defun` through final parenthesis, including docstrings/comments;
none exceeds COD-12's limit of 60. These are syntactic observations, not
lint/build or coverage outcomes. Types and docstrings observed; no runtime verification
of rejections, barriers, or interruptions. The two previous P2 findings are statically closed;
the overall C1 checklist with two readings and tests is integration's responsibility.

<a id="addendum-e--dichiarazioni-e-lettura-dellintegratore"></a>

## Addendum E — declarations and integrator reading

The integrator reread ownership, ring geometry, adoption, publication,
retirement, queries, and new WAL preflights; independent reading D produced the
two P2 findings subsequently corrected. No open P1/P2 in scope under preconditions
P01–P08. Pool, index, snapshot, and global Archivio shutdown remain external.

After the first build stopped under COD-01, `%serie-invariant` declares return
`nil`, the empty type, instead of `null`: the function always signals a condition
and never returns normally. The health getter's forward declaration
matches the one in `query.lisp`. A second independent rereading of the
delta found no regression or new P1/P2; maximum 8 and 42 functions unchanged.

| File reread | Git blob | SHA-256 |
|---|---|---|
| `src/series/ownership.lisp` | `7352a27581b8e2e68407611e65e46773efdc333c` | `195e71c81a6993d5c021ba520918885f6c91629af7940688f723fe421fc388e4` |
| `src/series/types.lisp` | `a0def7fc9452d291e2e60dbeff26a56a2b06e3a3` | `5b35f8f0b017476e14078ba073840e40f182438af41750dd1b3262d0a80c1ca9` |

Lint now distinguishes barrier `(:read)` from `(cl:read stream)`: both
positive/negative fixtures verify this distinction. Independent rereading
confirms the prohibition on direct reader calls, including unqualified calls or
package `common-lisp:`. This is a syntactic property, not a general semantic
program analysis. Matrix D02/D03 receives separate capacity,
cursor, and counter FIs; D06 receives explicit truth pairs. Runtime outcomes and
allocation belong to campaign records, distinct from the
two static readings.
