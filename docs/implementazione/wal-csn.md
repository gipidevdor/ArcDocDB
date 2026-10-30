<a id="collegamento-fra-lotti-wal-e-registro-csn"></a>

# Connecting WAL batches and the CSN registry

The `arcdocdb.wal` bridge implements segment batch closure specified by
[ADR-0037](../adr/0037-lotto-sigillato.md), retaining the
[Archivio registry](csn.md) token under [ADR-0046](../adr/0046-orizzonte-con-registro-limitato.md).
The logical writer owns the batch; it observes I/O task outcomes after a
synchronized handoff. The shared registry is touched twice per batch.

| Step | API and result |
|---|---|
| Preparation | `aggiungi-record`: private buffer, SEAL space reserved, no CSN. |
| Closure | `sigilla-lotto-con-csn lotto registro log inizio durable`: checks preconditions, acquires CSN, retains registry/log/slot/words in batch, prepares SEAL. Returns length, high, low. |
| Write and flush | [WAL group](wal.md) APIs: byte coverage, no automatic resolution. |
| Publication | The controller publishes atomically in the index and honors Serie order. |
| Resolution | `risolvi-lotto-pubblicato lotto registro slot high low livello`: checks healthy log and coverage, releases token; returns H-high, H-low. |
| Fault | After Serie transition to FAULTED and consumer completion/retirement, `annulla-csn-lotto lotto registro slot high low` also requires FAULTED log. Releases token without modifying files. |
| Reuse | `riusa-gruppo`, then `riusa-lotto`: require durability, no consumer, and no pending CSN. |

<a id="identità-e-rifiuti"></a>

## Identity and rejections

The token is retained together with its originating registry and actual log.
`aggiungi-lotto` rejects transfer to another log object, even if file-id and
version match. `leggi-csn-lotto` returns slot/high/low without materializing
a u64; identity remains readable after resolution and is reset only at reuse.
Events retain registry and slot/high/low captured at closure: resolution APIs
compare expected identity before releasing credit, even after reuse or between
Archivi with equal numeric values. `stato-csn-lotto` distinguishes free,
pending, and resolved.

Before acquiring CSN, open state, internal budgets, offsets, nonempty segment,
log identity/version, health, and append file availability are checked.
Transfer and file budgets also include closures planned before the current
batch; a start before written bytes is rejected. The executor repeats checks
before syscalls. The historical frontier cannot exceed either the planned
start or observed durable frontier. The log can have other planned closures:
start need not already equal the written position; the executor checks
contiguity before append.

A full, busy, or exhausted registry leaves batch and registry unchanged. A
subsequent group rejection retains the token: the controller reschedules work;
it does not acquire a second CSN. A busy rejection at resolution retains the
obligation. A second resolution is rejected; a token identity error propagates.
There are no waits, internal retries, callbacks, or context allocations per closure.

<a id="copertura-pubblicazione-e-guasti"></a>

## Coverage, publication, and faults

Durability and H are different frontiers. A successful flush leaves CSN
pending until the index is published. In async, the writer can resolve after
append and publication; the buffer remains protected by the ordinary durability
constraint until flush completion. This prevents reuse during I/O.

The controller must validate event identity, health, coverage, and order before
external publication. It must retain an already published outcome if resolution
alone rejects busy, avoiding publishing twice. Log health is rechecked at
resolution: even an old durable batch does not authorize new publication after
a subsequent fault. Cancellation requires the Serie FAULTED transition applied
by the controller. The bridge owns only the log: it cannot independently prove
that transition, index publication, or absence of consumers. These are explicit
internal preconditions, not capabilities for external input.

An unexpected error after assignment, or an asynchronous interruption while
passing between registry and batch fields, requires Archivio fail-stop.
The bridge promises neither rollback nor retry in that window. Ordinary typed
rejections before assignment and registry busy are instead reschedulable.

<a id="codifica-e-confini"></a>

## Encoding and boundaries

`scrivi-record-parole` is the common codec with high/low u32 stamp; the previous
`scrivi-record` delegates to the same codec. Ordinary records and SEAL use words
directly; prepared and OUTCOME retain TXID. SEAL file-id remains encoded once
at construction. The buffer becomes immutable at closure. The atomic point is
the SEAL persisted by writing; closure prepares it.

The bridge accepts only nonempty segments. Control.log ordinals and multiserie
DECISION CSN require distinct coordinators, still to be connected.
Index, Serie controllers, ordered publication, acknowledgments, and snapshot
registration/wakeup remain to be implemented. No complete transaction or
database performance is claimed.

The [verification method](wal-csn-metodo.md),
[decision matrix](wal-csn-decisioni.md), and
[C1 review](wal-csn-revisione.md) retain verifiable arguments. [Local results](wal-csn-risultati.md)
report campaign tests, limits, and diagnostics.
