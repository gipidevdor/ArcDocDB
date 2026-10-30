<a id="riserve-full-text-del-writer"></a>

# Writer full-text reservations

`arcdocdb.fulltext.admission` implements local reservation planned by
[ADR-0054](../adr/0054-contratto-e-formato-full-text.md), before append and
SEAL/PREPARE. Receives DONE [document tasks](full-text-documenti.md),
reserves capacities and costs of all indexes together, and copies runs into
writer-owned buffers. Reference case remains NNTP Usenet in Common Lisp,
with subject/body indexes and local interface through [Unix socket](../adr/0055-interfaccia-locale-unix-socket.md).

The [PUT/WAL bridge](full-text-put.md) can now own record frame,
analyze those exact bytes, and enqueue them after reservation. This page's primitives,
used alone, do not attest that binding. Complete gate still requires
general Serie validation, durable-publication integration, authoritative prepared outcomes, publication
with document/H/ACK, MVCC, and retirement after quiescence. Functions perform no I/O,
assign no CSN or catalog IDs, and do not make an index READY for queries.

<a id="pool-e-proprietario"></a>

## Pool and owner

`crea-riserve-full-text(queue, configs, segment)` constructs pool for a new
empty ACTIVE. `queue` is canonical Serie writer queue; every hot operation
requires current queue lease and owner thread. Caller maintains
one authoritative pool for that segment/generation set: factory does not
prove canonical queue, catalog, or file identity or admit an already-populated ACTIVE.
Worker→writer ownership transfer must be synchronized by caller.

`configs` is a simple-vector of 1…16 immutable canonical configurations,
strictly ordered by `(index-id, generation-id)`, at most eight indexes and
two generations per index. Vector is copied. Configurations are shared
read-only; tasks must reference the same adopted objects, not declarations
reconstructed from IDs alone. Superseded configuration produces `:fulltext-contract-changed`.
Actual catalog adoption and draining of old contracts remain external.

Defaults: eight slots, 4096 tokens and 262144 term bytes per run/generation,
256 MiB preallocated memory, 256 MiB delta, 64 MiB staging, 16 GiB per file.
Capacities are finite and configurable; may reject documents fitting
analysis scratch. No promise of reaching all maximums together.

Before allocations, conservative array/object cost is checked:
`4096 + 128*N + slot*(1032 + N*(4096 + 20*token + term-bytes + 12*16))`.
Additional 8 bytes per slot cover [local row directory](full-text-righe.md).
Physical budget distinct from logical used bytes; configurations, worker
scratch, original input, RSS, and preexisting pools external. Coordinator must
also count frozen pools, new generations, and retained Serie views together;
creating another pool does not authorize zeroing previous costs.

<a id="prenotazione-e-copia"></a>

## Reservation and copy

`prenota-full-text(pool, lease, sources)` receives a simple-vector with one DONE task
per configuration. Checks all tasks, same u32 row, configurations, and physical
run capacities; no already-retained row can be admitted twice.
Row is still a proposed ordinal: not proof of PUT/hint membership.
Caller guarantees all tasks represent same immutable document.

Cumulative payload is `sum(20*token + term-bytes + 12*present-fields)`.
Every generation's file counts fixed cost once plus all `U(documento)`
[already defined](../formato-indice-full-text.md#limite-superiore-e-rotazione). No
reduction for historical versions, prepared PUTs, or absence from a snapshot.
Request larger than empty file produces `:fulltext-reservation-request-too-large`;
sum requiring rotation produces `:fulltext-reservation-rotation` before append.
Rotation is not performed and pending intents are not ignored.

Every ordinary rejection precedes effects: even if last configuration fails,
slots, generation, costs, and loans do not change. Success returns a stable
slot and positive fixnum generation without wrap, to capture in message.
Caller vector not retained. Tasks remain DONE but their public
restart rejects with `:fulltext-document-borrowed` while copy owns their run.

`passo-riserva-full-text(pool, lease, slot, generation, quantum)` copies at most
`quantum` bytes/words or transitions, quantum 1…65536. No analysis, sorting,
or waiting in writer. Lease may be released and work continued with new one; slot
token remains captured. Individual tasks released on copy completion; bundle
READY requires all runs. Quantum is logical limit, not realtime deadline.

`leggi-run-riserva-full-text(..., indice-zero-based)` returns a run loan
only READY/TRANSFERRED and under writer lease. Worker can now reuse its own
scratch without changing copies. Not an MVCC query view or EBR-protected
reference; must not be delivered to clients. `leggi-budget-riserve-full-text` exposes delta,
staging, and occupied slots; `leggi-bound-riserve-full-text` fixed cost plus retained Us.

<a id="cancellazione-trasferimento-ed-errori"></a>

## Cancellation, transfer, and errors

`annulla-riserva-full-text` used only before append/SEAL/PREPARE and transfer,
without external run loans. Releases costs and sources even during partial copy;
idempotent until slot reuse. Old token rejected after reuse.
Does not abort an already-prepared or decided transaction.

`trasferisci-riserva-full-text` requires READY and precedes append: writer accepts
permanent buffer ownership. Returns staging, preserves delta/file/slot, and
makes cancellation through this API impossible. Does not attest commit or modify
H/ACK. Transferred reservations remain retained: future resolution/retirement entry must
verify authoritative outcome and quiescence before freeing them. Saturation means
backpressure before new append, not deletion or reuse by absence.

An invariant or incomplete exit during mutation makes pool FAULTED and
retains references and costs for diagnosis. No rollback of uncertain effects or ACK.
Worker boundary must make Serie FAULTED and start recovery: this component
does not own durability controller. Ordinary lease/token error precedes
effects and does not fault healthy pool. No locks, waits, or shared writes between Serie.

The [method and decision table](full-text-riserve-metodo.md) distinguish local
tests, two readings by same author, and still-open full C1 qualification.
Overall requirements remain `:progettato`.

The [preserved tests](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-17-fulltext-reservation-dev-targeted/README.md)
report commands, actual sources, results, and verification limits.
