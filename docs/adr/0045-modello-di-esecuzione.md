<a id="adr-0045--modello-di-esecuzione-compiti-a-completamento-migrazione-senza-stato-attese-come-parcheggi"></a>

# ADR-0045 — Execution model: run-to-completion tasks, stateless migration, waits as parking

- **Status:** Accepted
- **Date:** 2026-10-03
- **Relationship to the specification:** no amendment; implements “Concurrency” and “Dynamic
  thread pool” (no thread per request or per Serie). **Clarifies**
  [ADR-0017](0017-piattaforma-e-io.md) item 5 (what goes through the I/O pool),
  [ADR-0016](0016-epoch-based-reclamation.md) (scope of a read section), and
  [ADR-0035](0035-strategia-di-verifica-e-tracciabilita.md) §2 (how the simulator is
  implemented).
- **References:** [design analysis](../analisi-progettuale.md) AP-10;
  [architecture](../architettura.md#concorrenza); INV-P2, INV-P5, INV-P6, INV-A8

<a id="contesto"></a>

## Context

The design has two worker pools and zero allocations on hot paths, but did not say what
happens when an operation must wait: a read that misses the cache, a client
waiting for a flush, a snapshot waiting for the horizon, a coordinator waiting for
participants. Common Lisp has no continuations: an operation suspended halfway through
occupies a thread. And a single-stream deterministic simulator (ADR-0035) is possible
only if no operation suspends halfway through.

<a id="decisione"></a>

## Decision

1. **Run-to-completion tasks.** Each unit of work — a read, a slice of a Serie's
   writer, a log I/O task, a compaction step, a coordinator step — is a
   **task** that a worker executes from beginning to end without suspending or waiting for
   another task.
2. **A wait is parking.** A task that needs a future event registers the
   **request context** (preallocated, fixed-size) in the list of whoever will produce
   the event, and ends. The event queues a new task that resumes from that context. There
   are three parking lists: clients of a batch (waiting for publication), snapshots
   (waiting for the horizon), coordinators (waiting for participants). Each has a
   **maximum length** and a **maximum time**; exceeding either yields `resource-exhausted`
   (INV-A8).
3. **The compute pool does not block** (INV-P5). No compute worker makes blocking system
   calls. Log writes, flushes, segment reads, renames, and deletions
   are **I/O pool** tasks. The I/O pool has a worker ceiling: it also limits
   concurrency on the device.
4. **Stateless read migration.** A read starts in the compute pool: index,
   cache; if it finds the record, it responds. If the cache misses, it **migrates**: queues
   the same request to the I/O pool and ends. The I/O worker **reruns the read from the beginning**
   (index, cache, segment read, verification, response). No location, descriptor, or
   epoch crosses the handoff: the read is idempotent, so repeating it is always correct.
5. **Read section = task.** A task consulting the index or segments stays inside
   an epoch ([ADR-0016](0016-epoch-based-reclamation.md)) for its entire duration. A
   section may contain a disk read (in the I/O pool), never network activity or parking:
   parking ends the task, and thus the section.
6. **Writer slice.** A Serie's logical writer is a task that acquires the Serie's
   token, processes at most a bounded number of operations and messages (flush outcomes,
   PREPARE, OUTCOME, relocations), releases the token, and requeues itself if the
   queue is not empty. The bound guarantees fairness across Serie.
7. **The engine is a library.** The engine's interface is: request plus continuation. The
   server (connections, frames, [ADR-0029](0029-interfacce-protocollo-query-contratto.md)) is a
   shell that calls it; the simulator and tests call the same interface.
8. **Work distribution is not a serial point** (law 1,
   [ADR-0036](0036-leggi-di-progetto.md)). A read is executed by the worker receiving it,
   without passing through a common queue. A write enters its Serie's queue.
   The list of Serie with ready work, from which workers take writer slices, is
   touched once per slice, not per operation. There is no global queue traversed
   by every request.
9. **Simulator.** Since no task suspends, the deterministic simulator is a loop
   that uses the seed to choose the next ready task and executes it, with simulated time and I/O.
   A crash discards in-memory state between two tasks or at a named injection
   point. Neither threads nor continuations are needed. Interleavings **inside** structures
   without locks (index and cache seqlocks) are not tasks: the exhaustive model
   (SPK-07) and stress tests with real threads cover them.

Pattern: short nonsuspending tasks with per-partition queues (SEDA; Seastar/ScyllaDB's
message-passing *thread-per-core* model, here without core affinity);
single-stream deterministic simulation (FoundationDB, TigerBeetle).

<a id="conseguenze"></a>

## Consequences

- Thread count does not depend on the number of waiting requests: it depends on cores and
  the I/O pool ceiling.
- Every wait in the system is a bounded list, observable through a metric.
- A read that misses the cache costs a queue handoff and a second index lookup:
  nanoseconds compared with the ~0.1 ms of a device read.
- Intermodule interfaces are “request plus continuation,” not calls that return
  after a wait: this must be kept in mind from Phase 1.

<a id="limite-da-misurare"></a>

## Limit to measure

SBCL's collector stops **every** thread on each collection: the pause grows with the number
of threads, including I/O workers blocked in a system call. The I/O pool ceiling is
therefore also a pause parameter: SPK-02 measures pauses as a function of thread count,
and the ceiling is set accordingly.

<a id="alternative-considerate"></a>

## Alternatives considered

- *Blocking the worker serving the request:* simple, but a slow device occupies all
  workers and stops even reads served from memory.
- *Passing the location to the I/O pool:* avoids the second lookup, but requires keeping
  an epoch across two threads or revalidating the location; restarting has no special cases.
- *Simulator with real threads taking turns:* also explores suspensions halfway through a task,
  but those suspensions do not exist in the model.

<a id="valutazione"></a>

## Evaluation

- Risks: RSK-01 (thread count and pauses), RSK-12.
- Verification: SPK-04 (queue handoff cost, fairness across Serie); SPK-02 (pause by thread
  count); saturation tests for every parking list.
