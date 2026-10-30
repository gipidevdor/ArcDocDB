<a id="inventario-delle-decisioni-del-routing-workerserie"></a>

# Worker/Serie routing decision inventory

Reading on 2026-10-11 against base
`92decf4265554cd4959e32a1c881cf00758bb6a1`, after RW-REV-01.
This manual inventory is not a coverage or MC/DC measurement.
The [method](routing-worker-metodo.md), [contract](routing-worker.md),
and [C1 review](routing-worker-revisione.md) bound the scope.

| Source read | SHA-256 |
|---|---|
| `src/execution/handoff.lisp` | `3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a` |
| `src/execution/package.lisp` | `833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30` |
| `src/series/worker-package.lisp` | `dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7` |
| `src/series/routing-types.lisp` | `31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1` |
| `src/series/routing-build.lisp` | `70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d` |
| `src/series/routing-select.lisp` | `796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a` |
| `arcdocdb.asd` | `a4852ba400f91c52af42df0143b921fbcb1895479d4e250f16d57ad8d65f7fb9` |

<a id="controlli-locali"></a>

## Local checks

The IDs cover all 21 scalar predicates in the three new files,
the compound decision added to the writer factory, the two startup loops,
and the two selection macro gates. Existing decisions in handoff,
worker, and bridge remain in their inventories; they are not removed
from the complete-file coverage denominator.

| ID / location | Decision | Outcomes and obligation |
|---|---|---|
| H01 / handoff:71–72 | Writer factory, `unless (or A B)` | A: NIL index; B: index of type integer0..65535. At least one true accepts; both false produce `invalid-argument :writer-configuration` before the queue. |
| T01 / types:33 | `%routing-size`, `unless (<= 1 size 65536)` | Within budget continues; outside produces `invariant-violation :worker-serie-routing`. No scan. |
| T02 / types:35 | Same helper, equal writers/controllers lengths | Equal returns size; different signals invariant before using elements. |
| I01 / build:12 | `%routing-input-size`, writers simple-vector | Accepted type continues; other produces `invalid-argument :worker-serie-routing-configuration`. |
| I02 / build:14 | Same helper, controllers simple-vector | Accepted type continues; other produces same rejection, before copies. |
| I03 / build:17 | Same helper, size1..65536 | Accepted budget continues; empty/excessive produces same rejection. |
| I04 / build:19 | Same helper, equal lengths | Equal returns size; different produces same rejection. |
| E01 / build:28 | `%routing-input-entry`, writer type | Valid writer continues; other produces `invalid-argument :worker-serie-routing-binding`. |
| E02 / build:30 | Same helper, writer index EQL ordinal | Exact ordinal continues; NIL, different ordinal, or duplicate writer in a different slot produces same rejection. |
| E03 / build:32 | Same helper, controller type | Valid controller continues; other produces same rejection. Does not consult health/owner/ring. |
| E04 / build:34 | Same helper, `when (gethash controller seen)` | Already seen EQ rejects duplicate; new enters startup-only hash. |
| R01 / build:51 | Registry factory, final size equals input size | Consistent postcondition returns registry; different signals invariant, without publication. |
| W01 / build:68 | Table factory, links length equals size | Consistent postcondition returns table; different signals invariant, no lease assumed. |
| O01 / select:14 | `%routing-ordinal`, links length equals registry | Equal continues; different signals invariant before link access. |
| O02 / select:16 | Same helper, ordinal of type index | Index continues; NIL/invalid signals invariant after claim. |
| O03 / select:18 | Same helper, ordinal less than size | In range continues; outside signals invariant before `svref`. |
| O04 / select:20 | Same helper, writer EQ in slot | Identical returns ordinal; foreign, even with same number, signals invariant. |
| L01 / select:31 | `%routing-link`, link type | Valid link continues; other signals invariant. |
| L02 / select:33 | Same helper, link context EQ table context | Identical continues; foreign signals invariant before capability access. |
| L03 / select:35 | Same helper, link writer EQ current writer | Identical continues; other signals invariant. No reuse of previous writer segment's link. |
| L04 / select:37–38 | Same helper, link controller EQ registry controller | Identical continues; other signals invariant, without reading controller state. |
| L05 / select:40 | Same helper, link phase IDLE | IDLE delegates local shape/lease to `%check-worker-serie` and returns link; other signals invariant, no cleanup. |
| C01 / select:53 | Outer `%passo-worker` FAULTED gate | Terminal rejects before handler, preserving first diagnosis; operational performs CLAIMED preflight. Owner checked before gate. |
| C02 / select:55 | Inner `%passo-worker` FAULTED gate | Terminal rejects before handler; operational protects only lookup helpers with empty allowlists. RW-REV-01. |
| Q01 / build:48 | Registry factory `dotimes` | Exactly N iterations, N validated1..65536; no retry and no loop in lookup. |
| Q02 / build:64 | Table factory `dotimes` | Exactly N preallocated bindings; bound from registry T01/T02 before array. |

The `indice-routing-writer` getter, structures, and packages add no
other decisions. The table factory delegates the worker IDLE check
before allocation; selection delegates CLAIMED before the inner boundary.
Both check the owner through execution.

<a id="decisione-composta-h01"></a>

## Compound decision H01

A is `(null routing-index)`; B is
`(typep routing-index '(integer 0 65535))`.
The assignments required by fixtures are independent with respect to
the acceptance decision:

| Fixture input | A | B | Decision | Contrast |
|---|---|---|---|---|
| Foreign symbol | F | F | Rejects configuration. | Common base. |
| `NIL` | T | F | Accepts compatible writer without routing. | Only A changes from base. |
| `0` | F | T | Accepts ordinal0. | Only B changes from base. |
| `65535` | F | T | Accepts upper limit. | Additional budget check. |
| `65536`, `-1`, float or string | F | F | Rejects configuration. | Additional type/range check. |

`or` short-circuits: with A true, B is not evaluated. The table values
are those of the inputs, not an attestation that every operand executed.
MC/DC is not inferred from sb-cover or fixture success alone.

<a id="confine-degli-errori-e-controlli-delegati"></a>

## Error boundary and delegated checks

| Step | Recoverable resource reasons | Recoverable invalid reasons |
|---|---|---|
| Writer/registry/table factory | No new handler; inputs/phase rejected before publication. | No new handler. |
| Outer selection, owner/CLAIMED preflight | Only `:worker-state`. | None. |
| Inner selection, lookup helpers | None. | None. |

Outer selection permits an out-of-phase call without mutation.
Inner lookup cannot use that allowlist: a lookup error with the same
`:worker-state` reason is recorded as terminal before passing through the
outer boundary. The condition propagates without changing identity;
if the outer boundary recognizes it, the worker is already FAULTED anyway.
A new step on the terminal worker rejects outside handlers without
replacing the diagnosis. Wrong-thread is likewise rejected before the
handler, without poisoning the context, table, link, or controller.

| Delegate read | Obligation |
|---|---|
| `execution::%passo-worker` | Single context evaluation, owner/terminal gate outside handler, preserved body values, and persistent diagnosis. Two local dynamic-extent instances; macro already documented and tested in worker. |
| `execution::%richiedi-worker` | Worker shape/capability/cursors and requested phase; factory IDLE, selection CLAIMED. Assumes no new obligation. |
| `writer-worker-writer` | Owner-only getter; current writer reference retained after claim. |
| `%check-worker-serie` | IDLE shape, NIL fault, and zero local leases; does not consult live Serie state in IDLE. |
| `crea-collegamento-worker-serie` | Preallocation on context thread, immutable references, no lease. |

This internal coupling remains explicit and requires rereading if the worker,
macro, binding, or registry shape changes. No Archivio health is written
on the normal path. A routing error does not mark a Serie without owning
its lease: fault coordination remains open.

<a id="limiti-e-denominatori"></a>

## Bounds and denominators

Local complexity is counted as a base plus each `when`/`unless`, one
additional entry for the second operand of `or`, and one entry for each
`dotimes`; delegate checks remain in their helpers. The maximum in the
three new files is6 in `%routing-link`; `%routing-input-size`,
`%routing-input-entry`, and `%routing-ordinal` are5, `%routing-size` is3,
and the two factories are3. Public selection is3 including both macro
expansion gates; the modified writer factory is3. Bodies within60lines,
no new recursion, wait, callback, retry, thread, or syscall.

Every hot access is O(1). The registry factory occupies O(N) space and uses
an EQ hash only for startup uniqueness; no O(N) worst-case runtime hash
cost is promised. The table occupies O(N) space per worker. The N≤65536
limit controls component memory/loops; the caller must include it in
the overall startup budget.

Dedicated coverage must retain complete files: 15 Series sources,
including packages and three new late files, and 11 execution sources,
including modified handoff. Writer ordinal and worker checks are not
attributed to Series scope. Native/HTML reports, denominators, and all
missing identities remain in the raw result; no exclusion is approved.
The passed test count does not attest to total coverage, all interleavings,
universal zero heap, or engine qualification.

The SHA table above identifies the scope of dedicated v2 campaigns
on base92decf4. The general freeze integrates d155db3, which changes
ASDF for CBORstring-write and GETresolver without changing execution/Series;
8fb3051 then adds only artifacts, without changing sources, tools, or docs.
The [review](routing-worker-revisione.md#integrazione-con-main-avanzato)
keeps dedicated qualification and the integrated general check distinct.
