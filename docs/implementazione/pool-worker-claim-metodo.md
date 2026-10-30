<a id="metodo-preregistrato-della-presa-governata-dal-pool"></a>

# Preregistered method for pool-governed acquisition

Preregistration on 2026-10-13 against base
`900fa93d9e14a252e6a2b5a009d19728b2de34af`, before frozen campaigns.
New C3 component is `src/scheduler/pool-claim.lisp`, with package
export and ASDF registration. No C1 sources changed; their APIs
and checks are delegated without weakening ownership or barriers.
The [contract](pool-worker-claim.md) fixes check order.

<a id="prove-e-revisione"></a>

## Tests and review

- Inactive port with actually ready writer: no pop, cursor rotation,
  lost/duplicated obligations; ready and context retained.
- Controller-requested growth/shrink on actual distinct owners:
  activation before claim, retirement before ready polling.
  Immutable ready shape still read by C1 barrier.
- Foreign owner, every non-IDLE phase including FAULTED, and inconsistent IDLE:
  rejection before ACK/pop, with first cause, references, lease, and debt intact.
  Declared private fault injections occur at fixture quiescence.
- Inconsistent pool words and acknowledgment conflict: no claim reported
  successful, no new C3 write to C1 integrity fields.
- EMPTY/BUSY retain execution results and expected rotation;
  INACTIVE returns original cursor without ready scan.
- Pending retirement after claim: bridge completion, payload acknowledgment,
  Serie release before writer, and RESCHEDULE obligation drain.
  Full ring: next writer remains CLAIMED and receives its routing.
- Independent C3 reading of check order, owner, private coupling,
  error preservation, and bounded costs. Safety 3, warning/style-warning-free
  compilation, lint, and traceability must pass.

<a id="copertura"></a>

## Coverage

Complete scope: new `pool-claim.lisp` file and `src/scheduler/package.lisp`,
without exclusions. C3 gate at least 95% expressions and branches, exact comparison
of integers and nonzero denominators. Compare native SB-COVER data and HTML,
preserving all originals, inventory, and missing paths. Existing reader
stays unchanged: adapter declares new scope and passes reader
self-tests. Inherited C1 coverage is not attributed to gate,
and MC/DC is not inferred from counts.

<a id="misura-locale"></a>

## Local measurement

C4 sensor reuses verified lifecycle sensor. Five replicates of
4096 cycles per campaign, 128 warmup cycles, and full GC before clock.
Factory, API lookup, oracles, and setup are outside measured section.
All four values of every step contribute to cycle verification.

| Campaign | Cycle and oracle |
|---|---|
| EMPTY | Active port, four empty shards; four acquisitions, cursors 1/2/3/0 and `:unchanged` action. |
| INACTIVE | Inactive port, four shards, cursor 2; four acquisitions without rotation, `:unchanged` action. |
| SWITCH | Private retirement request, two inactive acquisitions; activation request, four EMPTY acquisitions with cursors 1/2/3/0. Six calls and two monotonic generations per cycle. |

SWITCH serializes owner/coordinator roles in a quiescent C4 fixture;
it qualifies neither concurrent acknowledgments nor resets of contexts/generations.
Tests own cases with actual work and concurrent controller.
Preserve raw ticks, heap, sink, and completed-cycle count. Zero clock
means below resolution; no timing threshold or tuning.
Observed zero heap is not universal nonallocation proof.

Before measurements, sensor must detect deliberate allocation, wrong
sink, each of four differing results, below-resolution clock,
invalid CLI, existing destination, and partial raw data after error.
Every frozen qualification uses `tools/record-command.lisp`, dedicated caches,
original argv/output/outcomes, and initial/final source identity. Failures
remain failures; copies and compressed payloads checked byte for byte.
Full repository check includes ten existing spikes.
