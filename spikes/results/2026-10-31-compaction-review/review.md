# Two-reading review and decision table

First reading traced selection, copied frames, CONTROL replacement/pruning,
RAM/paged relocation, removal permits and startup/write admission. It identified
missing representable-ID/revision headroom. The new mixed-state regression then
exposed restart capacity being checked only after publication. Second reading
traced the corrected limits and shared-scan observer through normal, no-op,
error and nonlocal exits, and through the following recovery.

## Decisions introduced or changed

| Condition | Required result | Regression |
|---|---|---|
| Fresh compaction ACTIVE > u32 MAX-1 | Exhaustion before output creation | rejected ID fixture, unchanged bytes/names, reopen |
| CONTROL revision > u64 MAX-3 | Exhaustion before output creation | rejected revision fixture, unchanged bytes/names, reopen |
| Last accepted ID/revision reservation | Normal completion and one full recovery fit | accepted boundary fixtures |
| Interrupted after first CONTROL at accepted boundary | Recovery checkpoint and prune both fit | boundary interruption/reopen/next-CSN fixtures |
| Rotation would leave no recovery slot | Force bounded compaction before reserving a data CSN | mixed model and existing capacity case |
| Reopened handle has already used the recovery slot | Probe pressure compaction before its next write | mixed model across four sessions |
| Pressure remains after read-only skip | READY capacity refusal before the data commit | existing exact-byte capacity test |
| Startup live count already fills configured capacity | Refuse before checkpoint/reclamation effects | independent capacity/increased-budget fixture |
| Optional order observer absent | Existing framing/order/application validation only | all existing startup/rotation suites |
| Observer present | Invoke only after ordinary frame/order/application checks; NIL result required | compaction, corruption and mixed-model suites |

## Invariants and concrete checks

- Data CSNs and the maximum tombstone witness remain unchanged by maintenance.
  Existing v1/v2 exact-value/CSN and all-deleted tests, plus the mixed model,
  check this before/after compaction and restart.
- CONTROL remains the atomic decision. Producer validation, independent exact
  original-byte comparison, live coverage, strict CSN order and post-decision
  canonical reread remain. The shared planning observer performs no file effects;
  any late error abandons private geometry and faults the maintenance boundary.
- The new guards precede output creation and, for startup, all reclamation and
  checkpoint effects. Reference-codec fixtures assert complete byte/name equality
  on refusal. Finite capacity is explicit; repeated read-only opening is not
  claimed to consume no structural resources.
- After successful writes, the canonical set leaves room for a fresh recovery
  ACTIVE. `needed` and source count are reevaluated after compaction; no stale
  controller/segment-count result decides the subsequent write.
- Borrowed key spans remain inside the checked scratch frame and are not retained.
  Planning adds no resident key table. The existing backend performs lookup;
  paged relocation still uses its bounded persistent path. Mixed-model budget
  changes verify RAM/paged equivalence across maintenance and sessions.
- No canonical removal capability or unlink path changes. Positive REMOVED,
  header/inode proof, old-reader retirement, parent synchronization and prune
  ordering retain the existing crash/error tests. Existing FD/source count tests
  and no-gain exact-resource restoration tests remain applicable.
- New loops traverse bounded byte prefixes, configured source arrays or fixed
  regression counts. No new recursion, syscall outside IO, inter-Serie state,
  lock, scheduler, wait or lowered safety policy is added. The actor remains
  synchronous and current-only; no concurrent-reader or power-loss claim follows.

Requirements are REQ-CMP-001/007/008/009, REQ-REC-001, REQ-IDX-013,
REQ-LIM-003 and REQ-AFF-018 under ADR-0078. The existing requirement qualification
statuses are retained. Compilation, lint, traceability, links, full suites and
benchmark allocation results must be read from the recorded final campaigns;
this review alone is not C1/MC/DC or whole-engine qualification.
