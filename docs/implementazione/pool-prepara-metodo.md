<a id="preparazione-bounded-di-un-tratto-poolserie-metodo"></a>

# Bounded preparation of a pool/Serie execution slice: method

C3/C4 preregistration dated 2026-10-15, base
`7f1cc54477483039bd98bd8c3f6508416f5c0ced`, before code and tests.
REQ-THR-001, REQ-CON-001/002/004/005, REQ-AFF-008; ADR-0031/0034/0045.

<a id="contratto-fissato"></a>

## Fixed contract

`prepara-tratto-pool dispatcher` performs one
[selection step](pool-step.md). Only with CLAIMED does it directly start
the returned link's bridge: nonreentrant owner and no intervening
step make a second routing unnecessary. At most one ready
transfer and one begin; no pop, batch ACK, end, retry, or implicit cleanup.

Seven values: **link, token, status, reason, origin, detail, action**.
First four retain [startup](pool-begin.md) form: ACTIVE or
CLOSING with positive token and original reason. EMPTY, BUSY, INACTIVE, and
PUBLISHED return NIL/0/status/NIL without begin; last three values
come from step, distinguishing cursor, count, and no transfer.
Publication ends immediately; retirement remains for next IDLE entry.

Already-active phases, invalid owner/binding, and delegate faults retain
original conditions. Busy writer preserves CLAIMED/link IDLE; busy Serie or
generation exhaustion returns CLOSING to end explicitly.
Errors after transfer do not undo it or authorize replay.
A NOTINLINE helper with link/status T retains pair checks:
CLAIMED requires a link, no-work outcomes require NIL; unexpected
statuses signal `invariant-violation :pool-dispatcher-state`.

<a id="qualifica-prevista"></a>

## Planned qualification

- Tests of new claim with activation, current CLAIMED with inactive pool,
  full/room recirculation, pending retirement, all seven values, and real FIFO.
- Call counting: one step, one begin only with CLAIMED; no
  second routing or bridge startup, pop, ACK, end, or new claim after published.
- Owner/binding/phase rejections before effects; ready-queue and writer
  BUSY, busy Serie, and generation limits; EQ cause and capacities preserved.
- FI outside link/status pair contract and unexpected statuses, distinguishing them
  from C1 delegate named tests. Cleanup only of fixture resources.
- Strict compilation, complete suite, lint/traceability/links; native
  coverage of entire `src/dispatch/`, C3 threshold ≥95%, without excluding missing entries.
- C4 sensor with fixtures and cleanup outside clock: EMPTY and real ACTIVE cycle
  with payload, pop/ACK/end outside entry alone but included in measured
  cycle. Five fresh fixtures per campaign, 4096 cycles and 128 warmups.
  Oracle self-tests, heap/sink/clock detection, and fault preservation.
- C3/C4 rereading with checklist and file identities; original registers and
  attempts preserved. No C1 source changes.

Measurements include checks and delegates and do not isolate adapter cost.
No promise of speedup, new positive concurrency evidence, fairness, or server loop.
Engine payload application, durable I/O, park/wake, and Archivio
control remain; no complete-engine gate is closed.
