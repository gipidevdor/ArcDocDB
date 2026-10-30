<a id="metodo-del-collegamento-poolserie"></a>

# Pool/Serie connection method

Preregistration on 2026-10-13, base
`14fd7738c216e3a0bd3ce9612576b9b57d648f74`, before formal campaigns.
Complete C3 scope: `src/dispatch/package.lisp`, `types.lisp`, `build.lisp`,
and `claim.lisp`. The [contract](pool-dispatch.md) defines both entry points.
No C1 source changed; claim, routing, and bridge are reused
with their original checks and barriers.

<a id="prove-e-lettura-indipendente"></a>

## Tests and independent reading

- Factory types/binding, owner checked before table;
  port, context, ready, and writer preimage on rejection.
- Port/table of different contexts: rejection before ACK/claim, even
  with pending activation request and ready work.
- INACTIVE, EMPTY, and BUSY: four original results and no routing.
  FI sentinels are quiescent, temporary, and restored.
- Actually ready writer, ordinal selection, and explicit dual-lease
  begin; pop, acknowledgment, and end through existing bridge.
- Retained CLAIMED, pending retirement, and invalid pool words: lookup
  only existing obligation, no acknowledgment, completion allowed.
- Full recycling with new writer: repeated routing on new obligation;
  after IDLE, retirement prevents new acquisition.
- Valid activation and actual claim followed by unknown routing:
  ACK retained, worker FAULTED with reference/home and original cause,
  no controller acquisition or mutation.
- Wrong phases and foreign owner: diagnosis, debt, and lease retained.
- Inconsistent gate returns injected separately from normal
  execution to check C3 boundary defenses. Status outside ftype
  domain is not presented as a nominal return.
- Independent C3 reading with checklist, safety 3,
  warning/style-warning-free compilation, lint, and traceability.

<a id="copertura-e-memoria"></a>

## Coverage and memory

C3 gate at least 95% expressions and branches across the entire scope without manual
exclusions. Preserve native SB-COVER, HTML, and audit with denominators, missing
paths, and exact fingerprints. Compare integer native/HTML counts;
no MC/DC inference and no inherited C1 coverage in denominator.
Verified reader stays unchanged; adapter declares dispatch heading/scope
and checks files/shapes/missing paths with negative cases.

C4 sensor reuses verified lifecycle sampling and preservation
with dedicated self-tests. Five replicates of 4096 cycles and 128 warmup cycles
per campaign, factory/API lookup/GC outside clock, no tuning.

| Campaign | Cycle |
|---|---|
| EMPTY | Four fresh acquisitions on four empty shards, cursors 1/2/3/0, NIL and unchanged action. |
| INACTIVE | Four fresh acquisitions, unchanged cursor 2, NIL and no routing. |
| ROUTE-CURRENT | Four selections of preallocated link on stable CLAIMED, without begin/pop or new obligations. |

All values and identities contribute to cycle oracle.
Preserve heap, ticks, sink, and completed cycles; observed zero heap does not
demonstrate universal nonallocation. External load uncontrolled,
no engine-throughput conclusion. Sensor must detect
deliberate allocation, wrong sink, differing returns, and below-resolution clock,
preserving partial output and existing destinations.

Formal campaigns use frozen copies and `record-command.lisp`,
with dedicated caches, argv, stdout/stderr, exit, and initial/final identities.
Failures remain failures; preliminary raw data stay separate. Published
copies are checked byte for byte and new manifests do not replace
originals. Full check includes ten existing spikes.
