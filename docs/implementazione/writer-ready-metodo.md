<a id="metodo-della-lista-dei-writer-pronti"></a>

# Ready writer list method

Registered on 2026-10-09 before campaigns, base `92d8b0e`.
C1 component: preallocated ready list with independent partitions, from
[ADR-0045 §§6/8](../adr/0045-modello-di-esecuzione.md), REQ-CON-001/002/004/005
and REQ-AFF-008; INV-P1/P2/P5/P6, INV-A8, and INV-V4.

<a id="contratto-preregistrato"></a>

## Preregistered contract

Each partition is a FIFO ring with a local guard acquired by one CAS.
No spin, callback, I/O, global counter, or per-task allocation. The ring
transports writer references, without membership, generations, or writer
state cleanup. The [handoff](writer-handoff.md) protocol remains unchanged.
The common list is touched only to publish or acquire a segment, not for
every message.

Construction accepts 1..64 partitions, default 4, and 1..65536 slots per
partition, default 1024; maximum 4194304 preallocated references. A Serie's
partition is chosen by the caller before the hot path. No catalog hashing
algorithm is introduced.

`pubblica-writer-pronto(lista shard writer)` transfers an obligation already
produced by `:schedule` and returns local count. Full/busy reject before
mutation: the obligation remains with the caller. Retry concerns this
publication, without accepting payload again in the writer. Success is not
retried: the API does not deduplicate erroneous publications.

`preleva-writer-pronto(lista start)` tries at most K partitions in circular
order. A contended guard does not prevent trying another. It returns writer,
`:writer`, and the cursor after the served partition; without success it
returns NIL, `:busy` if at least one guard was contended, otherwise `:empty`,
and cursor after start. Empty means only that each local observation was
empty: a concurrent producer can publish immediately afterward; this is
neither proof of global quiescence nor permission to park without a protocol.
Each candidate has one acquisition CAS attempt; a successful acquisition
also requires release CAS. At most K acquisitions and 2K CAS operations total.

The worker retains the acquired reference until successful writer begin;
busy neither duplicates nor loses it. There is no late cleanup of a scheduler
flag after `termina-tratto-writer`: a new wave may already be published.
Pool, wakeups, shutdown, FAULTED controller, and adaptation still require
integration. Progress is not guaranteed if the caller abandons an obligation.

<a id="scelta-e-prove"></a>

## Choice and tests

The ring with a single-attempt guard extends the already verified local
queue protocol. Partitioning reduces the contention domain; circular scanning
has a static bound and introduces no global ready queue per request.
It is not a lock-free structure and is not claimed as universally fastest.
CAS operations follow the [SBCL contract](https://www.sbcl.org/manual/#Atomic-Operations)
and also act as [memory barriers](https://www.sbcl.org/manual/#Barriers).
The MPMC alternative with per-slot sequence would require a new publication,
overflow, and reuse protocol; it is not selected without its own tests.

- Independent FIFO-list and cursor oracle, finite seeded sequences,
  capacity 1 and other cardinalities, wrap, full, empty, and partition rotation.
- Limits/defaults, invalid inputs, rejections without mutation, cleanup after
  full, guard owned by another thread, and private FI on ring invariants.
- Integrated handoff: obligation retained on full/busy publication and busy
  begin; both enqueue/empty-end orders, new wave, and reenqueuing.
- Real workers reused over waves with live producers and multiple consumers;
  one busy partition while another advances. Harness-only retry and joins
  have bounds and worker errors are rethrown.
- Two C1 readings, decision inventory, complete raw coverage of all execution
  files. No form subtracted, approved exclusion, or implicit MC/DC. Build
  without warning/style-warning, lint, and `make check`.
- Twelve semantic mutants preregistered in runner before campaign:
  ring, ownership, capacity, scanning, busy, cursor, and publication. Successful
  baseline mandatory; compilation failure and before-tests are not detections.
- Allocations: two preallocated scenarios with one and four partitions,
  five 4096-cycle samples each, warmup 128 and GC outside counter. Capacity 3
  and two writers per partition force wrap; each cycle includes preallocated
  payload acceptance, publication, extraction, and segment end. The handoff/ready
  list composition is measured. Identity, count, status, and cursor contribute
  to an exact sink; positive heap control, wrong sink rejected, and zero clock
  distinguished. Error paths excluded; observed zero is not a universal guarantee,
  throughput, or P99.

All attempts are recorded with `tools/record-command.lisp`, argv, environment,
stable sources, and complete outputs. C4 tools have self-tests and partial
reports; frozen tests live in a separate clone. Large data are compressed
losslessly and verified by the evidence reader. Engine gates and integrated
targets remain open.

<a id="correzione-del-runner-prima-della-campagna-finale"></a>

## Runner correction before the final campaign

After integration of `fd96fb3`, the ready runner adopts the process
classification correction: an OS signal or nonzero exit after the real
completion marker are `:worker-error`, never detection. Exit and signal
remain distinct in data and baseline; the self-test terminates its own
child with SIGKILL and retains runner, log, and report. The twelve-mutant
set remains unchanged. The campaign is repeated in full in
`ready-mutations-final`, retaining previous driver and campaign; product,
tests, and benchmark remain unchanged; targeted coverage and allocation
campaigns need no repetition. The complete suite will be rerun by integrated check.
