# Next engine integration boundary

The current change completes record caching without changing write admission.
The next substantial performance step is bounded group admission in M1, guided by
SPK-03 (durable flush cost) and SPK-07 (publication/crash ordering):

1. Keep one ordinary record and one distinct CSN per sealed batch. M1 replay
   deliberately requires strictly increasing ordinary CSNs; placing several
   ordinary records in a single existing batch would repeat its CSN and violate
   current recovery/compaction contracts.
2. Reuse the existing Serie planned-root FIFO, captured event generations,
   independent batch tokens and WAL multi-batch group. One physical flush may
   cover several separately sealed batches. Each remains a distinct recoverable
   operation, without claiming all-or-nothing transaction semantics.
3. Reserve aggregate primary capacity and maintenance headroom before any data
   CSN. Testing each key against the same old index is insufficient: several new
   keys, repeated keys and PUT/DELETE mixtures need a cumulative plan. Disk batch
   reservations must cover all admitted mutations, and legacy delta credit and
   renewal policy need the same aggregate treatment.
4. Reserve response slots and keep input ownership stable while grouping only
   requests already available to the serial actor. Preserve declared read order,
   deadlines, one in-flight request per connection and fair finite admission.
   A low-load isolated request must not acquire an arbitrary batching sleep.
5. Publish roots, resolve CSNs and update locations in FIFO order after the shared
   strong flush. Issue each response only after its own complete publication;
   any uncertain write/flush/publication faults admission and retains obligations.
6. Finite models and real SIGKILL at every write-prefix/flush/publication boundary
   must bound acknowledged operations and verify exact recovery, fresh CSNs,
   replay, mode changes and compaction. Measure throughput and tail latency with
   independent clients and compare durability-equivalent baseline behavior.

This is an implementation boundary, not a completed group-commit feature or a
performance promise. The record-cache grant stays independent of all these steps.
