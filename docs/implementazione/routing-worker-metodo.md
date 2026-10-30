<a id="metodo-preregistrato-del-routing-workerserie"></a>

# Preregistered worker/Serie routing method

Initial base `92decf4265554cd4959e32a1c881cf00758bb6a1`.
Method fixed before campaigns dedicated to the new routing.
Scope: immutable programmable writer extension, shared registry,
local table and lookup, package/ASDF declarations, tests, and measurement C4.
The [contract](routing-worker.md) keeps unintegrated boundaries explicit.

Planned checks:

- `NIL` ordinal compatible with existing writers, 0 and 65535 valid;
  values outside type/budget rejected at startup before publication.
- Registry from 1 to 65536 slots, consistent input type/length,
  ordinal exactly equal to slot; duplicate EQ controllers rejected.
  Private copies: modifying both inputs after the factory does not change
  lookup. Independent registries can use the same numbers.
- Table created on the IDLE context's owner thread, preallocated local
  links, distinct between workers and referring to the same registry.
  Wrong owner and phase do not consume obligations or leases.
- Real acceptance, ready publication, claim, lookup, double lease,
  FIFO, pop, ack, end, and recycling chain. Full recycling must change writer
  and therefore link without repeating the previous writer's segment.
- Repeated lookup on CLAIMED/IDLE returns the same link without mutating
  the state graph; no Serie lease is acquired by lookup.
- Foreign writer with valid ordinal, writer without ordinal, and index beyond
  the table become terminal worker faults after claim. Same EQ condition
  retained and propagated; writer/home/obligation remain available for
  diagnosis. No mutation of any unacquired controller.
- Quiescent FI of the private table: inconsistent slot or binding, foreign
  context, non-IDLE link. Rejection precedes begin/pop and does not release
  or mark a Serie whose lease routing does not own.
- Two real workers, two Serie, and the same registry: distinct local links,
  two simultaneously ACTIVE Serie. Semaphores and deadlines are only in
  the harness. Identity checking is distinguished from exclusion already
  proven by the bridge; the fixture measures neither throughput nor pool fairness.
- FAULTED Serie selectable for draining already provided by the controller.
  No health gate added to lookup; new publication remains controlled by
  the controller. No global Archivio shutdown proof is inferred.
- Two C1 readings on the twelve points, inventory of all decisions and
  delegated checks, including any compound decisions condition by condition.
  Native and HTML coverage in the same process that runs Series and execution
  suites: complete union of 15 Series sources and 11 execution sources,
  packages and helpers included. The denominator also contains existing
  handoff, worker macro, and bridge forms; no execution decision is attributed
  only to Series scope. All missing path identities remain in the audit,
  without approved exclusions.
- Local allocation on a complete cycle with two writers, two controllers,
  one worker, ready with one partition/capacity1, and a preallocated table.
  Each cycle alternates the writer and composes enqueue, publish, claim,
  two EQ/expected index lookups, begin/lease, pop/ack, and end idle. Two
  startup cycles populate identities outside the sensor. Warmup128, five
  samples of4096 cycles, GC/printing outside measurement. Independent driver sink:
  `12+17+19+13+11+13+3+25+7+23=143`,
  sample `N*143+N*(N-1)/2`; monotonic bridge tokens and Serie leases per writer,
  monotonic batch token in worker. Baseline, positive heap16×1MiB, wrong sink,
  and below-resolution clock controls demonstrate C4 detection.
- C4 fully compiled with fatal warning and style-warning, FASL self-test,
  wrong heap/sink detection, and invalid CLI. The only ASDF runtime exception
  is `sb-kernel:redefinition-warning`, already provided by the build;
  no exceptions to compilation warnings for the new tool.
- Build and targeted tests before the general check; `make check` once
  on the final frozen code, unless changes or real failures occur.

Each campaign uses `tools/record-command.lisp`, with stdout/stderr, argv,
environment, initial/final snapshots, and failed attempts retained. Campaigns
use frozen copies and separate caches. Large data compressed losslessly,
catalog and byte verification retained; no raw data is reconstructed.

Local measurements distinguish startup and normal path. Universal zero heap,
throughput, P99, fairness, scalability, or closure of Phase0 gates are not
inferred. Global requirement statuses remain `progettato`.
