<a id="metodo-preregistrato--csn-e-orizzonte"></a>

# Preregistered method — CSN and horizon

Method defined before execution, 2026-10-09. Class C1,
REQ-MVC-005, REQ-MVC-008, REQ-AFF-008; implements the register from
[ADR-0046](../adr/0046-orizzonte-con-registro-limitato.md).

<a id="ipotesi-e-oracoli"></a>

## Assumptions and oracles

1. One register per Archivio. Two u32 words represent all 64 bits;
   positive, strictly increasing allocation, no wrapping.
2. Allocation and registration indivisible. `H` does not pass any pending value;
   an independent list of Lisp integers calculates `min(pendenti)-1`, or
   last CSN when empty. Oracles may allocate.
3. Credits limit actual pending values: the oldest can remain open while
   the other slot is reused many times. Reproduce the ADR-0046 counterexample.
4. Capacity, exhaustion, token, and contention rejections preserve state.
   A resolved token cannot consume credit from a later wave.
5. Mutex does not wait. Repetition belongs to scheduler; fixtures and
   tools have deadlines and thread cleanup, no unbounded retry.

<a id="prove-previste"></a>

## Planned tests

Sequential tests, reversed completions, deterministic pseudorandom oracle,
action exploration with small capacity and finite depth, carry at 2^32,
fixnum boundary, maximum u64, and subsequent rejection. Tests with deliberately
occupied mutex and four real workers check unique identities and H convergence.
Implementer and reviewer C1 readings are recorded with limits.
Coverage through `sb-cover` uses a separate cache and preserves raw state
and HTML report; self-check must detect a deliberately missing branch.
Instrumented coverage and decision table are complementary readings.

Isolated mutants must compile and fail a relevant assertion:
omitted register, advanced H, omitted carry, accepted stale token. Baseline and
C4 self-check precede mutants; compilation error does not count as a kill.
A missed detection is preserved, analyzed, and resolved before delivery.

<a id="misure"></a>

## Measurements

Five sequential allocation/resolution samples, capacities 1, 16, 256,
1024, small base and beyond-fixnum base; case with oldest pending value fixed.
Buffer and register precede measurement; warmup and GC precede each sample.
Sensor checks a nonallocating baseline and deliberate allocation.
Each window has positive duration and stated resolution; overly short windows
require a bounded increase in work. Acceptance: zero heap bytes in sequential
successes, including high CSNs, and correct outcomes.

Campaigns with 1, 2, 4 workers: shared Archivio and independent Archivi. Reuse
precreated workers; report work quantity, time, busy/full retries, and final H.
Contention conditions may allocate: no claim of zero heap on the
error path. Campaigns run one at a time. External load
is uncontrolled; no database throughput target is inferred.

<a id="conservazione"></a>

## Preservation

Every invocation through `record-command.lisp` preserves argv, environment, commit,
source hashes before/after, stdout/stderr, duration, exit code, and outcome. Preserve
failed attempts, raw campaigns, and automatic-compaction records too.
Final verification takes place with sources stationary; published results follow
the project's existing size limit and lossless compression.

The component neither makes data durable, publishes the index, nor creates snapshots.
WAL integration, global maximum recovery, parking, and Archivio lifecycle
remain distinct steps; no whole-engine requirement is promoted.
