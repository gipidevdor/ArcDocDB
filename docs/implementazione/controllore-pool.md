<a id="controllore-locale-dei-worker-di-calcolo"></a>

# Local compute worker controller

The `arcdocdb.scheduler` component implements part of REQ-THR-001:
it proposes a worker count using EWMA, AIMD, and hysteresis. It is class C3
resource control under [ADR-0031](../adr/0031-software-critico-criteri-e-priorita.md),
with explicit limits and injected time, REQ-AFF-008/013, and REQ-CON-005.
[ADR-0011](../adr/0011-thread-pool-dinamico.md) allows starting with few
signals; [the preregistered method](controllore-pool-metodo.md),
[code reading](controllore-pool-revisione.md), and
[results](controllore-pool-risultati.md) bound the evidence.

The [logical actuation registry](pool-worker-lifecycle.md) is the next
component: it connects this policy to acknowledgments from existing workers.
The controller alone retains the contract and scope described here.

The controller belongs to the thread creating it. Only the scheduler reads and
updates its state; getters respect the same owner. Samples,
actual workers, and ticks come from the caller. It does not read the process
clock, collect CPU or latency, or access writers, ready list,
Serie, or requests. This administration is outside the request path,
as required by the [shared-state list](../architettura.md#archivio-coordinamento-minimo).

| API | Contract |
|---|---|
| `crea-controllore-pool cores &key minimum maximum initial period dwell queue-high` | Startup on owner thread; validates all configuration before constructing state. Initial target is within budget. |
| `aggiorna-controllore-pool c tick queue cpu p99 actual` | Current owner; validates all inputs before mutation. Returns target and `:hold`, `:pending`, `:grow`, or `:shrink`. Every call completes without waiting. |
| `leggi-controllore-pool c` | Current owner; returns seven values: target, scaled queue/CPU/P99 EWMAs, last tick or NIL, candidate `:hold`/`:grow`/`:shrink`, dwell origin or NIL. No controller copy. |

<a id="domini-e-avvio"></a>

## Domains and startup

`cores` is an integer from 1 to 65536; `1 ≤ minimum ≤ maximum ≤ 2×cores`.
Minimum defaults to 1, maximum to 2×cores, initial to
minimum. Initial must belong to minimum..maximum. The ceiling is that of the
compute pool in [architecture](../architettura.md#thread-pool), not a
recommendation always to use the maximum or an I/O pool ceiling.

Period is from 1 to 2^20, default 500; dwell from period to 2^20, default 2000;
queue-high from 1 to 2^20, default 8. The caller assigns consistent units to ticks,
period, and dwell. Defaults fix neither milliseconds nor calibration.

A sample contains tick from 0 to 2^40−1, queue from 0 to 2^20, CPU from 0 to 1000
per mille, P99 from 0 to 10000 per mille of latency target, and actual from minimum
to maximum. The pool is therefore already running with an acknowledged worker count:
actual=0 is rejected. P99=1000 means reaching the latency target.
Target selection, sensors, and metric aggregation remain with the
caller; the component does not implement REQ-OBS-001/002.

After the first sample, time must advance by at least period. Duplicate,
regressive, or overly close ticks are rejected without changing
sensors, candidate, or target. Tick does not wrap; reaching its maximum
does not authorize reusing zero on the same controller.

<a id="ewma-e-decisione"></a>

## EWMA and decision

All three sensors have scale 256. The first sample initializes `E=256×x`;
subsequent samples update `E=floor((7×E+256×x)/8)`. Alpha is 1/8 per sample,
rounded down. Integer bit count remains
bounded by domain without growing rational denominators. A time
gap greater than 2×period reinitializes sensors from the current
sample and resets dwell: an interval without samples does not certify
stable load. The 2×period threshold is inclusive for continuing EWMA.

Shrinking takes precedence over growth. Thresholds apply to scaled
EWMAs, not just instantaneous inputs:

| Candidate | Conditions |
|---|---|
| `:shrink` | P99≥1200×256, or queue<256 and CPU≤300×256. |
| `:grow` | Queue≥queue-high×256, CPU<700×256, and P99≤1000×256. |
| `:hold` | Other cases. |

The first sample with a candidate records the start tick. Changing
direction or returning to hold resets dwell. The same direction must
persist for at least dwell: at the inclusive threshold, growth is target+1, bounded
by maximum; shrinking is floor(3×target/4), bounded by minimum. After a
change, a new dwell is needed before acting again. A direction that
cannot change target because it is already at the limit returns hold and
creates no ineffective command.

If actual differs from target, sensors update but the outcome is
`:pending`: target stays identical and dwell resets. When
actual reaches target, the candidate restarts from the new sample; time
spent pending does not contribute to hysteresis. The caller acknowledges only
actually active workers, without assuming a target has already been applied.

<a id="errori-e-confini"></a>

## Errors and boundaries

A foreign owner, wrong configuration, or out-of-domain sample produces
`invalid-argument` with these reasons:

| Check | Reason |
|---|---|
| Foreign thread, in getter and update | `:pool-owner` |
| Factory: cores, minimum, maximum, initial | `:pool-cores`, `:pool-minimum`, `:pool-maximum`, `:pool-initial` |
| Factory: period, dwell, queue-high | `:pool-period`, `:pool-dwell`, `:pool-queue-threshold` |
| Sample: tick, queue, CPU, P99, actual | `:pool-tick`, `:pool-queue`, `:pool-cpu`, `:pool-p99`, `:pool-actual` |
| Duplicate, regressive, or overly close tick | `:pool-sample-period` |

Input and owner are checked before writes; an ordinary
rejection applies no update prefix. The private verifier
checks target between minimum and maximum and dwell origin no
later than last tick; inconsistencies produce `invariant-violation`
`:pool-state`. Other slot domains are protected by types and
factory. Detection of every arbitrary private-representation modification
is not promised, nor repair or rollback on failure.
The component records no Serie FAULTED because it neither owns nor
accesses a Serie.

Pending growth is not revoked if latency worsens. There is no
actuator timeout in the controller: pending may last for an arbitrary
number of short calls. The caller must diagnose an unapplied target
and manage actuator failure or expiration. Revocation, command precedence,
and stale-command rejection require the future pool protocol.

Normal computation is O(1), with structures allocated only by the factory,
without new threads, waits, locks, I/O, callbacks, or shared per-request
writes. Controller and getter do not create, park, wake, or
retire workers. A target is a proposal: it transfers no obligations, leases,
or batches and changes no Serie data or state.

Live pool, wake without lost notifications, admission, retirement, shutdown,
Archivio coordinator, I/O pool, compaction, real metrics, and calibration
remain to be integrated. Ready-list EMPTY/BUSY is not proof of
quiescence for sleeping or stopping; [worker contexts](writer-worker.md)
remain on the creating thread and retain obligations still owned.
This policy promises neither fairness, P99, throughput, scalability, nor stability
of real feedback. RSK-12 and engine gates remain open; global
requirement states remain `progettato`.
