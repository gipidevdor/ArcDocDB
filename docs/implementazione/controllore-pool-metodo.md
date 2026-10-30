<a id="metodo-preregistrato-del-controllore-di-calcolo"></a>

# Preregistered compute-controller method

Preregistration of 2026-10-13 before component campaigns, on
base `4344d9e1f2ceb45e5fa3d5076b57d09505e69ac3`. Scope: new package
`arcdocdb.scheduler`, owner-only configuration/state, fixed-point EWMA,
bounded policy/getters, ASDF integration, tests, documentation, local
measurements. [Contract](controllore-pool.md) fixes APIs/domains/limits.

Component C3: [ADR-0031](../adr/0031-software-critico-criteri-e-priorita.md)
requires full standard, one review, statement/branch coverage
at least 95%. Additional twelve-point C1 reading strengthens
verification; changes neither class nor data-path qualification.
REQ-THR-001 satisfied only in control portion; REQ-AFF-008/013
and REQ-CON-005 bound budgets, injected time, separation from request
path. REQ-OBS-001/002 and operational pool outside scope.

<a id="controlli-previsti"></a>

## Planned checks

- Default/explicit configuration, cores 1/65536, maximum 2×cores,
  coherent minimum/maximum/initial. Negative values, prohibited zero,
  over-budget values, floats, symbols, strings, NIL outside contract
  rejected before instance publication.
- Period 1..2^20, dwell period through 2^20, queue-high1..2^20: exact
  thresholds, interval mismatch, wrong budgets rejected. No default
  presented as calibration result or implicit time unit.
- Complete sample domains; actual minimum..maximum, including
  zero rejection before confirmed startup. Public seven-value snapshot
  unchanged after every rejected input, even initialized
  sensors/pending target; immutable configuration and complete validation
  before writes verified in source reading.
- Initial tick zero, maximum 2^40−1, duplicates, regressions, delta below
  period, equal to period/2×period. Gap greater than 2×period
  resets EWMA/dwell; unobserved time not counted.
  No wrapping; exact subtraction remains fixnum even when negative
  delta rejects regression before mutation.
- Exact initial EWMA, later floor((7E+256x)/8), including lost
  fractions, alternating sequences, all signals maximum, return toward zero,
  different valid intervals. Oracle uses rational arithmetic in harness
  only to compare product integer values/rounding.
- Compound thresholds, each operand decisive in tests: queue<1,
  CPU≤300 for idle shrink; P99≥1200 overriding even high queue;
  queue≥queue-high, CPU<700, P99≤1000 for growth. Input/scaled EWMAs
  not confused. Test immediately below/equal/immediately above values.
- Inclusive dwell; first candidate, repetition, direction
  change, intermediate hold, gap, pending reset continuity. After
  command, new dwell required. No implicit action at first
  sample without already observed dwell.
- AIMD: +1, floor(3×target/4), including rounding, maximum saturation,
  minimum clamp. At bounds, hold result without false grow/shrink command.
  Target never outside configured range.
- Actual differs from target: EWMAs updated, target unchanged/pending,
  even with many samples/reversed pressure. Later target
  acknowledgment restarts dwell. Pending growth with degraded P99
  stays pending: fixture explicitly shows limit,
  without claiming absent revocation.
- Seven-value getter before/after samples, rejections, commands; no
  foreign-owner access. Second real thread for owner rejection
  on update/getter; deadlines/synchronization harness
  only. Controllers on different threads share no local state.
- Finite traces with abrupt load reversal, oscillation around
  thresholds, prolonged missing samples, delayed actuation. Independent
  oracle for target, outcome, sensors, candidate, dwell. Real-system
  stability not inferred from synthetic traces.
- Checked private-representation invariants: target outside
  minimum..maximum, dwell origin beyond last tick; quiescent
  injections preserved without repair. Unexpected private direction
  rejected by AIMD helper. Slot domains protected by types/
  factory, without promising every arbitrary-corruption detection.
  Typed diagnostics/ordinary rejections distinguishable; every new branch in
  coverage denominator.

<a id="analisi-copertura-e-misura"></a>

## Analysis, coverage, measurement

Compilation without warnings/style-warnings, safety 3, type declarations,
read-only slots where appropriate, docstrings, REQ/OWNER/SHARED comments.
Check functions within 60 lines, bounded complexity, no hidden loops/
waits, no time source read by component, no shared
per-request update. Policy operates only within barriers
that change no C1/C2 data, obligations, leases.

First/second change readings compare sources/contract;
inventory retains scalar predicates, compound decisions,
preconditions, postconditions, any macros/delegates. Both readings
are automated agents, not certification or human independence.

Coverage includes every package file, including package/helpers,
without attributing old-worker branches to new component. Preserve
native/HTML reports, denominators, identities of all missing paths,
without implicit exclusions. Compare with C3 minimum 95%
statements/branches; `sb-cover` does not establish MC/DC. Any gap
remains declared, not removed from denominator.

Local normal-path measurement excludes factory/startup/GC,
uses preallocated controller, inputs, targets, oracle. Warmup/five
bounded samples preserve heap, raw ticks, observed result;
cover initialized updates, hold, pending, actions applied by harness
only. C4 tool must detect positive heap/wrong result,
report below-resolution clock; compilation/self-tests preserved.
Measurements concern calculation, not real pool/engine targets.

Driver `tools/pool-controller-bench.lisp` fixes warmup 128, five
samples of 4096 cycles. Each cycle contains 160 main-controller update/getter
pairs, 80 high-queue inputs/80 empty-queue inputs, plus one pending update/getter
and one hold on two separate private controllers: 162 steps per cycle.
CPU/P99 constant in main trace; startup oracle calculates
EWMA, target, candidate, dwell origin. P99 cases/thresholds
also in test expected vectors without inferring exhaustive
state-machine exploration.

Build/targeted tests precede global frozen-code check.
Each campaign uses `tools/record-command.lisp` with argv, environment, outputs,
errors, initial/final snapshots; failed attempts preserved.
Caches/frozen copies separate tests from other repository work.
Original bytes/SHAs of published artifacts verified; no missing
output reconstructed as original process output.

[Results](controllore-pool-risultati.md) must distinguish executed tests,
limits, remaining work. [Code reading](controllore-pool-revisione.md)
separate from process records/measurements.
RSK-12 open for sensors, real feedback, actuator delay,
stability/tuning. Live pool, park/wake, admission, retirement, shutdown,
I/O, compaction, Archivio coordinator excluded; neither phase
gates nor requirement `progettato` states closed by campaign.

<a id="chiusura-del-metodo-prima-della-campagna-congelata"></a>

## Method closure before frozen campaign

Preliminary attempts required SAVE-COVERAGE checkpoints after
each load to preserve startup executions too, before temporary
components collected by GC. Final count
still includes all native records without exclusions/mark
changes. Generated EQUALP comparison in denominator: two identical
controllers and isolated differences in period, dwell, queue-high, CPU, P99
exercise both comparison outcomes. Final suite
23 tests; 20-test fixtures read in first review
preserved as preimage. Six product sources unchanged.
