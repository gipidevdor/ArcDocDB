<a id="metodo-del-ricircolo-poolserie"></a>

# Pool/Serie recycling method

Preregistration on 2026-10-14 against base
`a5715a1aa0b2571d650d1b794e9bb7b7324e951e`, before formal campaigns.
The [contract](pool-recycle.md) defines one ready operation per step.
Complete C3 scope of extended dispatcher: `src/dispatch/package.lisp`,
`types.lisp`, `build.lisp`, `claim.lisp`, and new `recycle.lisp`.
No C1 source modified; recycling, worker, routing, and bridge delegated.

<a id="prove-e-revisione"></a>

## Tests and review

- Room: FIFO obligation publication, exact NIL/status/count and IDLE.
  No routing, second acquisition, or retirement acknowledgment; distinguish count from cursor.
- Full: actual A→B exchange, A queued, unchanged count and current B link IDLE,
  without begin. Home and cursor retained.
- Inactive port, pending retirement, inconsistent lifecycle words: recycling
  independent of pool. Complete new CLAIMED, return to IDLE, and
  retirement acknowledged only by next explicit acquisition.
- Actually held ready guard: busy error and preimage of ring, context,
  writer, links, controller, and pool words; explicit retry only.
- Foreign owner and binding between different contexts: rejection before transfer.
- All consistent phases other than RESCHEDULE, including FAULTED: delegated
  rejections and diagnosis/debt/lease retained, first cause EQ.
- Unknown writer or invalid link after full: transfer already occurred,
  old obligation in ready and new reference retained in FAULTED, controller
  and Serie lease intact. No rollback inferred from an exception.
- Quiescent restored FI for contradictory writer/status and sentinels
  distinguishing no gate/routing from a merely NIL result.
  Status outside ftype is contract failure, not nominal return:
  separate NOTINLINE guard must reject before routing, preserving
  context, ring, and first cause. FI does not qualify an actual C1 return.
- Independent C3 reading of extended component and tests, with checklist,
  strict compilation, safety 3, lint, and traceability.

<a id="copertura"></a>

## Coverage

At least 95% expressions/branches across entire five-file component,
without manual exclusions. Publish all per-file counts and
missing entries too, including defensive branches outside delegate domain if SBCL
retains them. Zero denominator means only no native probe of that type,
not no source decisions. No MC/DC inference or
C1 delegate coverage in C3 denominator.

Preserve native SB-COVER, original HTML, and exact native/HTML audit.
Reuse verified reader with explicit extended-scope adapter,
negative tests on files, shapes, duplicates, denominators, and missing paths.

<a id="memoria-e-misura-locale"></a>

## Memory and local measurement

C4 sensor with verified sampling, dedicated self-tests, and two
actual campaigns. Every replicate has a fresh fixture: five replicates of
4096 cycles, 128 warmup, preallocated queues with enough immutable
symbolic payloads and quantum one. Factory, API lookup, GC, and final drain are outside
clock; no private state/generation resets.

| Campaign | Measured cycle |
|---|---|
| ROOM | Published recycling, fresh explicit acquisition, execution begin, one payload pop, ack and end in RESCHEDULE; IDLE link. |
| FULL | Recycling on full ring, alternating link of new CLAIMED, execution begin, one payload pop, ack and end in RESCHEDULE; IDLE link. |

These are integrated cycles: they include C1 execution protocol and scalar oracles
without attributing time to adapter alone. Fresh ROOM acquisition belongs
to explicit fixture, not a hidden recycling call.
Serie bridge is not started in clock and measurement acquires
no Serie lease; functional tests verify bridge separately.
Count, status, and link identity contribute to oracle.
Bounded public cleanup resolves all fixture obligations before
closing I/O backends; no abandonment is qualified as valid shutdown.

Preserve ticks, heap, sink, and completed cycles. Sensor must detect
deliberate positive allocation, differing returns, wrong sink, below-resolution
clock, invalid CLI, partial raw data, and existing destinations.
External load uncontrolled; no tuning, threshold, or engine-throughput
conclusion. Observed zero heap proves neither universal nonallocation
nor correctness of a concurrent coordinator.

Qualification in frozen copy with `record-command.lisp`, dedicated caches,
argv/output/exit, and initial/final fingerprints. Failures/preliminary versions
stay distinct from frozen originals. Bytewise preservation,
new exclusive manifests, and full check with ten existing spikes.
