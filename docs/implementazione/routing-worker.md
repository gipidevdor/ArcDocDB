<a id="routing-preallocato-dal-writer-alla-serie"></a>

# Preallocated routing from writer to Serie

C1 foundation for REQ-CON-001/002/004/005 and REQ-AFF-008;
ADR-0005, ADR-0033, and ADR-0045. Routing connects writer already
claimed from ready list to its [worker/Serie connection](worker-serie.md).
[Preregistered method](routing-worker-metodo.md), [decisions](routing-worker-decisioni.md),
[review](routing-worker-revisione.md), and [results](routing-worker-risultati.md) delimit tests.

Caller assigns immutable `routing-index` to writer at startup.
Index local to registry, 0 to 65535; `NIL` preserves contract
of existing writers not using routing. No global counter
assigns indexes. Registry has 1 to 65536 dense
associations: writer in slot i must have index i. Registry controllers
distinct by EQ identity, so two writers do not represent same
Serie in same registry. One logical association per Serie across
different registries remains caller configuration precondition.

| API | Contract |
|---|---|
| `crea-writer-programmabile :routing-index` | Startup construction; index `NIL` or integer within declared budget. No implicit assignment. |
| `indice-routing-writer writer` | Reads immutable ordinal, without assuming obligations or lease. |
| `crea-registro-worker-serie writers controllers` | Copies caller vectors, validates type, length, ordinals, and controller uniqueness; produces immutable shareable registry. No claim. |
| `crea-tabella-worker-serie context registro` | Current owner, IDLE worker; preallocates local connection per association. Acquires neither writer nor Serie. |
| `collega-writer-worker-serie tabella` | CLAIMED worker; selects current ordinal's slot, checks writer/context identity and IDLE connection, returns connection. No begin or pop. |

Registry copies vectors and keeps representation private:
changing inputs after factory does not change associations. Registry
may be read by multiple workers; each owns its own table and
connections on thread that created context. No connection migrates
between threads. Table contains O(N) connections per worker and must be
counted in startup memory budget: allowed maximum
is not sizing recommendation.

Selection uses CLAIMED writer's ordinal and one indexed access.
Also checks writer EQ: a foreign writer with same number cannot
accidentally select valid Serie. After full-ring recirculation,
worker may have another writer; caller repeats selection on new
CLAIMED, without retaining previous slice's connection as current.
Repeating selection while connection is IDLE returns same
object and creates neither new obligation nor second capability.

Successful selection precedes `inizia-worker-serie`; pop, ack, closure, and
recirculation use existing contracts. Routing does not consult controller
health, preserving already-permitted I/O draining on
FAULTED Serie. Transfers no lease and applies no payload.

Foreign owner rejected before boundary, without poisoning objects.
Incorrect worker phase remains ordinary rejection. Absent or out-of-table
ordinal, foreign writer, inconsistent private table, or already-engaged
connection are instead post-claim configuration/protocol defects:
worker becomes FAULTED and retains writer, home, and obligation with
original condition. No controller marked without its lease;
stopping and coordinating Archivio from diagnosis remains caller task.
No automatic rollback, publication, handoff, or reuse promised.

Normal lookup O(1), without scans, hashing, allocations, shared
writes, threads, waits, callbacks, or I/O. Construction separate from
hot path and may use EQ hash to check distinct controllers.
Bounded ready-list scan remains O(K), at most 64 partitions,
already implemented by worker. Component implements neither pool,
wake/park, admission, EWMA/AIMD adaptation, retirement, nor shutdown.
Introduces no durable changes and does not qualify complete engine.
