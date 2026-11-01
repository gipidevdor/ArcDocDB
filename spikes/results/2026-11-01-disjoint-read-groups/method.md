# Mixed Unix writes — method before product edits

Base: `0b81e0335c8f058a5c570db2612a8e64976b1fe5`, 2026-11-01. Measure actual
strong-group density and successful `io:durable-flush` wall time before changing
the collector. Keep Darwin F_FULLFSYNC, strong publication and all persistent/
wire formats unchanged. No batching timer, peer wait, retry or concurrent engine.

Reuse the preceding trusted benchmark definitions and common adapter byte for
byte, evaluating definitions without its all-case entry point. A selection
adapter chooses format 2, 1,024-byte canonical documents, resident/paged, 1/8
connections, 95/5 and 50/50 GET/PUT. Each client owns eight disjoint keys; the
existing stride-7 schedule and one outstanding request per handle remain.
Five windows of 100 rounds are exact multiples of twenty. Add both 8-connection
50/50 forced-maintenance cases and both administrative group-limit-1 controls:
twelve cases, sixty windows, 34,000 operations per main campaign. Alternate
timing off/on in six calibration windows for both modes and widths at 50/50.
These are controlled closed-loop bursts, not independent arrivals or concurrent
engine readers. Preserve every window, checked document, per-key version,
consecutive CSN interval and final strong frontier.

A C4 wrapper records every completed durable-flush call in bounded arrays,
classifying current data append / other append / directory at entry. Retain raw
tick durations and group-width frequencies; sum only nonoverlapping sync calls.
Capture wall/CPU/allocation before cold serialization. The clock adapter and
group observer are identical before/after; calibration measures timer overhead.
The main matrix is timed; the separate :profile flag denotes alternating timing
only. Preserve child logs and partial/failed evidence. No sync-error retry.

Candidate, only if the measurements support it: a valid ordinary GET whose key
is absent from all preceding queued mutations may read the existing canonical
root before that independent write prefix is flushed. The immutable copied
result is equivalent at its original logical slot position. No socket send
occurs until dispatch has drained the entire collector; a later write to that
read key remains logically after the read. Same-key GET, PING, explicit/version
operations, malformed/rejected/unavailable requests remain barriers. Exact key
comparison is bounded by eight queued operations. Preserve deadlines and all
strong FIFO publication. An engine fault aborts dispatch and clears the queue;
an encoded read must never escape after a failed flush. Document the changed
physical observation order and unknown outcomes in an ADR, without claiming a
transaction or a guaranteed durable prefix for unacknowledged requests.

Qualify exact-key dependencies (including deletes/conditions), later same-key
writes, all rejection gates, deadlines, capacity-1 control, errors/nonlocal exits,
no-send-before-strong, read fault and real-process response loss. Review twice
against the C1 checklist and run the affected engine/Unix suites on both SBCL
runtimes, complete static/CI/docs checks and relevant correctness spikes.
Compare identical-driver baseline and final campaigns, retaining variability;
actual sync counts remain separate from wall-time attribution. Archive/hash and
compact completed evidence before removing only owned generated paths. Preserve
other worktrees and branches; publish non-forcing on main after qualification.
