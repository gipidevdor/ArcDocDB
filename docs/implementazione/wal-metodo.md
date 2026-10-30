<a id="metodo-lotti-wal-e-compito-io"></a>

# Method: WAL batches and I/O task

Registered before implementation. Scope: preallocated batch buffer,
CSN assigned by caller at closure, SEAL, bounded groups, one I/O task
per log, and frontiers after write/flush. No catalog, index, client
acknowledgment, scheduler, rollover, or complete transaction.

<a id="contratti"></a>

## Contracts

- The private buffer is mutable only in the open batch. At closure the CSN
  is assigned to ordinary records, preserving prepared/OUTCOME/DECISION TXIDs.
  Header CRCs and aggregate CRC are recalculated; SEAL contains position, file,
  record count, and known durable frontier, with budgets checked beforehand.
- All buffers and vectors are allocated at initialization. Groups have finite
  capacity and contain contiguous batches of the same file/version/log.
- Preparation performs no I/O. Write and flush belong to the I/O pool task.
  A log-local CAS prevents a second in-flight group, without waiting or shared
  writes between Serie. Only one transition authorizes flush.
- Completed write and completed flush are distinct. A failure prevents new
  operations and coverage; there is no publication or acknowledgment after a fault.
- Async coverage applies only to data; group/strong require durability.
  Byte coverage does not prove index publication or 2PC outcome.
- Reuse of preallocated batches/groups requires durable completion and absence
  of references/consumers; the caller owns this lifetime protocol.

<a id="prove-e-misure"></a>

## Tests and measurements

Comparison with codec/batch verification and v1/v2 recovery scan: empty and
nonempty batches, PUT/tombstone/prepared/OUTCOME, EDIT/DECISION, u64 stamp at
limit, nonzero physical offset, historical frontier, and group writes. Injected
backend for EIO/ENOSPC/EINTR, short write, crash at every prefix, failed flush,
repeated operations, premature reuse, and concurrent groups on the same log.

Measurements separate from tests: preallocated buffers, warmup, full GC,
five samples, safety 3, heap, and time. Measure formation/sealing and simulated
I/O without generalizing to database latency or throughput. Retain command,
environment, hashes, output, and failures with `tools/record-command.lisp`;
publish catalog, raw coverage, and mutations. C1 and engine integration
remain separate gates.
