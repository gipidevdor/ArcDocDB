<a id="metodo-del-passo-poolserie"></a>

# Pool/Serie step method

Preregistration dated 2026-10-15, base
`5be241d8f295e3c82df06e75c9b12e0bf75eb202`, before formal campaigns.
C3 scope: all seven files in `src/dispatch/`, including `step.lisp` and six
previous files. No C1 change. The [contract](pool-step.md) specifies
origin, detail, and action, with one delegated operation per step.

<a id="prove-funzionali-e-revisione"></a>

## Functional tests and review

- IDLE with activation, inactivity, empty, and busy: five results, original
  cursor and lifecycle action, one operational entry only.
- CLAIMED from claim, adoption, or full: current without gate, commands, or ACK;
  detail and action NIL, current-writer selection without begin.
- RESCHEDULE room ends IDLE without second claim; full starts only
  routing of new CLAIMED. Count and cursor deliberately different.
- Pending retirement: obligations precede admission; ACK only at
  next IDLE step, never after room in same call.
- Ready guard actually occupied: claim BUSY return distinct from
  recirculation busy condition; preimage and obligation preserved.
- Binding and owner before phase reading and every operational entry.
  RUNNING/BATCH/FINISHING/FAULTED rejected without changing debts or cause.
- Failed routing after exchange: EQ cause, already-successful effects preserved,
  no rollback inference. Inconsistent state delegated to C1 barriers.
- Interposed getter outside ftype: actual unexpected-phase rejection;
  quiescent FI restored, distinct from nominal C1 contract.
- One independent C3 review with checklist; strict safety 3
  compilation, lint, traceability, and full check with ten spikes.

No new positive concurrency test is required by owner-only step.
The foreign-owner case uses a separate thread as negative test. No temporal
overlap or stress is inferred from a startup barrier alone.

<a id="copertura-misure-e-conservazione"></a>

## Coverage, measurements, and preservation

The gate requires at least 95% of expressions and branches over the entire package, without exclusions.
Preserve native SB-COVER, eight HTML files, and native/HTML audit with all missing entries.
The verified C4 reader is adapted to explicit seven-file scope;
no C1 coverage or MC/DC equivalence inherited.

Two campaigns: active EMPTY on four empty shards, four steps per cycle
with cursor rotation; CURRENT on actual CLAIMED and inactive gate,
four stable lookups per cycle. Five replicates of 4096 cycles and 128
warmups per campaign, new fixture per replicate. Fixtures, factories, initial
claim, API lookup, GC, and final public drain remain outside the clock.
Five values and identities are verified inside the clock; no private
reset, begin, or payload application in measured slice.

INACTIVE/IDLE and five rejection values are covered by self-tests;
RESCHEDULE, CLOSING, and contention remain in functional tests, without a
dedicated latency measurement. Preserve heap allocation, ticks, sinks, and completed cycles:
observed zero heap allocation does not prove universal nonallocation. Uncontrolled external
load, no threshold, tuning, or attribution to the adapter alone;
C1 delegates and scalar oracles are part of the cost.

Positive and negative self-tests for five mismatched results, sink, clock
below resolution, deliberate heap allocation, CLI, existing destinations, and partial
raw data. Formal campaigns on a frozen copy, dedicated caches, and
`record-command.lisp`: argv, output, exit, and initial/final fingerprints.
Preserve failures and development separately; byte-for-byte copies and new
exclusive manifests, without rewriting original evidence.
