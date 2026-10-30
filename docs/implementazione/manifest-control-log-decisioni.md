<a id="decisioni-del-manifest"></a>

# Manifest decisions

Contract inventory to read alongside the
[method](manifest-control-log-metodo.md) and
[application contract](manifest-control-log.md#applicabilità-e-duplicati).
Internal guards remain in the raw coverage denominator.

| Check | Independent cases |
|---|---|
| Configuration | each budget valid, zero, negative or beyond type; checked even without records |
| Prefix | intact log, complete tail search, later durable witness, incomplete search; no state on error |
| First EDIT | initial complete present, initial differential, empty log, incomplete first batch, later complete |
| Complete state | nonzero ACTIVE; nonzero next-id above every ID; disjoint sections |
| Rotation | repeated ACTIVE; replacement with closure; opening without closure; closure without opening |
| CLOSED | new compaction output; ACTIVE closure; identical repeat; mismatching length or outcomes; removed ID |
| Removal | CLOSED present; already removed; duplicate within same EDIT; ACTIVE or unknown ID |
| Outcomes | TXID present/absent; zero, high and maximum CSN; consistent or conflicting duplicate |
| Identifiers | earlier lower reservation published later; high checkpoint; removal preserves limit; u64 exhaustion |
| Budgets | exact/exceeded physical; cumulative across EDITs; duplicates consumed before coalescing |
| Ownership | input unchanged; reused input afterward; scalar queries without internal vectors |
| Parallelism | four independent constructions; shared read-only queries; worker errors and bounded joins |

<a id="predicati-del-prodotto"></a>

## Product predicates

Names below match private module functions. Cases are
exercised through the public API; structural properties already guaranteed
by the preceding pass remain defensive guards without exclusions from
coverage denominator. This inventory claims no MC/DC
independence of individual operands.

| Function / predicate | Cases or justification |
|---|---|
| `checked-manifest-limits`: three `index` counts, three `u32` counts, `index` bytes within 16 MiB | `zero-empty-sections-and-invalid-budgets`: zero, negative and beyond type for every budget; `physical-duplicate-budgets`: exact limit and excess |
| `manifest-frame`: progress, end within prefix, empty key, payload through end; zero SEAL flags; ordered CLOSED/REMOVED spans | Internal guards: scanner and codec already checked these properties; corrupt frames/payloads in `semantic-corruption-in-sealed-prefix` and `scanner-and-eof-contracts` |
| `preflight-manifest`: consistent EDIT/frame counts, exact consumption; OPEN references only if nonzero | Count/consumption guards; `physical-duplicate-budgets` and `zero-empty-sections-and-invalid-budgets` separately check OPEN, CLOSED, REMOVED and duplicates |
| `decode-manifest`: equal consumption, counts and previously certified budgets; state present | Cross-pass consistency guards; `snapshot-required-and-valid` and `every-cut-keeps-whole-sealed-prefix` check absent snapshot |
| `check-closed-shape`: length 64..u32 maximum, EQL map | Private-construction guards: length already checked by codec and map always created with EQL; no exclusion |
| `same-closed-p`: length, outcome cardinality, TXID presence and CSN equality | `idempotent-closures-removals-and-outcomes`, `conflicting-outcome-and-closed-proof`: equality, different length, different cardinality, different TXID at equal cardinality, different CSN |
| `decode-closure-outcomes`: duplicate present with different CSN; exact consumption and cardinality no greater than count | Consistent/conflicting duplicate and zero/high/maximum CSN in outcome tests; consumption/cardinality are internal guards |
| `decode-edit-closed`: duplicate present with different proof; exact consumption and bounded cardinality | CLOSED duplicates in idempotence/conflict tests; span and consumption are internal guards |
| `decode-edit-removed`: exact span and bounded cardinality | Last, duplicate and repeated removal; guards after codec and coalescing |
| `check-edit-sections`: OPEN nonzero and present in CLOSED or REMOVED; CLOSED present in REMOVED | `section-overlap-is-invalid` distinguishes three collisions and `zero-empty-sections-and-invalid-budgets` exercises OPEN zero |
| `initial-manifest-state`: complete, nonzero ACTIVE, next-id greater than maximum | `snapshot-required-and-valid`, `snapshot-sizes-and-permuted-sections`, `u64-boundaries-and-id-exhaustion` |
| `check-active-rotation`: OPEN nonzero and different from ACTIVE; change equals closure; change toward CLOSED or REMOVED | `reserved-old-ids-and-unchanged-active`, `invalid-transitions-never-reactivate`, valid rotation histories |
| `check-closed-additions`: removed ID; CLOSED ID present with different proof | Prohibited reactivation, new compaction, identical repeat and proof conflicts |
| `check-removed-additions`: ACTIVE ID; present in CLOSED or REMOVED | `invalid-transitions-never-reactivate` and `idempotent-closures-removals-and-outcomes`: ACTIVE, unknown, CLOSED and already removed |
| `apply-manifest-delta`: alias of one map; nonzero ACTIVE and nondecreasing next-id | Ownership/private-state guards; histories exercise closures, removals, zero/nonzero OPEN and limit preservation |
| `fold-manifest-edit`: state absent/present and repeated complete | `snapshot-required-and-valid`; initial complete and deltas in histories |
| Queries: next ID representable u64; ACTIVE/CLOSED/REMOVED/unknown; CLOSED present and TXID present | All states in oracle; u64 exhaustion, CSN zero distinct from absence, outcomes gone after removal; shared read-only queries and reused input |
| Public API and defaults | `direct-api-defaults-and-required-options` omits budgets and offset, checks versions 1/2, mandatory version, mandatory EOF and ownership; other fixture wrappers pass keywords explicitly |

Abbreviated test names retain the suffix of `test-REQ-…` symbols
in [manifest.lisp](../../tests/recovery/manifest.lisp) and
[manifest-audit.lisp](../../tests/recovery/manifest-audit.lisp).
Branch measurement is not MC/DC. The engine gate remains open.
