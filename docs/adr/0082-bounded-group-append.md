# ADR-0082 — Bounded append coalescing in serial M1

- **Status:** Accepted for incremental integration under the author's instruction.
- **Date:** 2026-11-01
- **References:** [ADR-0017](0017-piattaforma-e-io.md),
  [ADR-0037](0037-lotto-sigillato.md), [ADR-0080](0080-group-commit-m1.md),
  REQ-WAL-002/005/006, REQ-AFF-001/004/008, INV-A2/A11 and INV-P6.

## Decision

Allow `scrivi-gruppo` to borrow an optional exclusive simple octet `:buffer`
for the duration of the I/O task. Validate its type and reject identity with
any batch buffer before acquiring the log. Without the option, retain
per-batch append. A multi-batch group fits the coalesced path only if its total
bytes fit all three independent bounds: scratch length, 65,536 bytes and the
file's immutable maximum transfer. Single batches and groups exceeding any
bound use the sequential path, selected before acquisition or I/O.

After complete existing acquisition/preflight, concatenate the independently
sealed batches in order. Recheck every batch start and the total copied size
before one `append-esatto` entry. Preserve every frame, CSN, SEAL and source
buffer. Mark all batches written only after the complete append and exact
frontier check. Positive short writes use the existing bounded completion;
syscall errors, including EINTR, are never retried. One append entry can require
multiple native writes; entry counts do not by themselves measure syscall count.

Every incomplete exit while this group owns the log faults log/group/batches
and retains ownership, including arbitrary errors and nonlocal exits during
acquisition handoff, copy or append. Preserve the original cause/control
transfer. An unacquired rejection does not fault a different owner. Never
switch paths after I/O or repeat an uncertain operation. The caller retains
scratch ownership and must not mutate it during the call; no scratch reference
is retained afterward.

M1 passes its existing exclusive engine scratch during strong group execution.
Recovery, maintenance and the group run serially, with no outstanding borrower
of that scratch. There is no additional payload arena, configuration grant or
wire operation. Single-write behavior, maximum group size eight, RAM/paged
selection and FIFO root/index publication remain as in ADR-0080.

Each operation's SEAL remains its durable atomicity point. Exactly one canonical
strong flush still precedes publication and all responses. Coalescing does not
make the group a transaction, change crash-prefix recovery or weaken durability.

## Evidence and limits

SPK-03 motivates distinguishing append and flush; SPK-07 motivates independent
SEAL/prefix and publication checks. The
[method and results](../../spikes/results/2026-11-01-engine-group-append/report.md)
retain the C4 candidate, selected source identity, byte-cut model, injected
short/error/nonlocal exits, exact capacity/alias checks and actual M1 recovery.
The existing SIGKILL matrix now cuts the coalesced buffer at exact batch/SEAL
offsets, preserving the same independently predicted recovery prefixes.

The 64 KiB cap bounds extra copying and leaves large groups on their existing
path. It is an incremental local policy, not a format limit or universal
optimal threshold. CPU, entry counts and strong-write throughput are reported
separately. No zero-allocation, full C1/MC/DC, arbitrary concurrency, unexecuted
platform or physical-power-loss qualification follows.
