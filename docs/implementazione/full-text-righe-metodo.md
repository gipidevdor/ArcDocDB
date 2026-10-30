<a id="directory-delle-righe-full-text--metodo-preregistrato"></a>

# Full-text row directory — preregistered method

October 22, 2026, REQ-SEC-003/004/006/010 and REQ-CON-002, ADR-0054 and INV-I5/I6.
Pool-local directory links a unique u32 row to canonical reservation;
PUT bridge resolves its physical reference without depending on WAL buffer.
Introduces no publication, concurrent readers, prepared outcomes, or reclamation.

Two preallocated u32 arrays, ordered by row, contain key and slot
position. Binary search bounded to 11 steps at maximum capacity 1024; insertion
and deletion move at most 1024 metadata pairs under writer lease.
No document scan, hot allocation, lock, or state between Serie.
Directory replaces previous linear duplicate check.

| Decision | Planned verification |
|---|---|
| Construction | Unchanged capacity, 8 bytes per slot added to memory limit before allocation |
| Lookup | 0 and UINT32_MAX valid; absence distinct from present but incomplete row |
| Reservation | All checks and duplicate before effects; same existing public error |
| Adoption | Canonical slot/generation/row; strict order and count equal occupied slots |
| Cancellation | Removes only COPYING/READY, before append; idempotence and old token preserved |
| Transfer | Entry retained without reuse or deletion, as are costs and run |
| Exposure | COPYING/READY => pending without handle; only TRANSFERRED exposes slot/generation to bridge |
| Resolution | absent/pending without metadata; sealed preserves verified offset, format, and :CSN/:TXID |
| Fault | Inconsistency or interrupted mutation => pool FAULTED and data/costs preserved, no rollback |

C4 oracle with independent association list: finite sequences of insertions in
different orders, cancellations, and transfers; comparison of all rows after
each operation. Minimum/maximum capacity, boundaries, foreign/stale requests, rejections
without effects, and interruptions during adoption/removal. Already-verified NNTP fixtures
and files/records; lookup after batch reuse and TXID/CSN distinction.

Extend existing reservation and PUT measurements, retaining six CI exclusions:
100 warmups, GC, one thousand operations and lookups without heap allocation. Four private writers
with same row numbers, finite waits. Semantic mutant on public
lookup always returning absent, demonstrating oracle sensitivity. Preserve original outputs,
actual sources, and all failures. Two readings by same author; C1 and MC/DC open.

<a id="decisioni-composte-introdotte-o-estese"></a>

## Introduced or extended compound decisions

| Function | Decision conditions |
|---|---|
| `verifica-writer-riserve` | count within slots; row-count equals count; three capacities equal; staging/delta/file within existing limits |
| `posizione-riga-riserve` | row-count within arrays and maximum 1024; 0 <= low <= high <= count; low=high convergence |
| `slot-riga-riserve` | position in prefix and equal key; mapping within slots; canonical type, position, pool, row, positive generation, and live state |
| `trova-riga-trasferita-full-text` | position in prefix and equal key; only transferred exposes slot, other live states return pending |
| `preflight-riserva` | position in prefix and equal key: checks canonical slot and rejects duplicate before mutation |
| `verifica-posizione-inserimento-riga` | position <= count and space; left boundary or lower neighbor, right boundary or upper neighbor |
| `inserisci-riga-riserva` | active effect, equal slot pool, copying state; mapping-to-same-slot postcondition |
| `rimuovi-riga-riserva` | active effect and copying/ready state; same canonical entry, post-count decreased by one |
| `prenota-full-text` | count=row-count after insertion and delta/staging budgets respected |
| `annulla-riserva-full-text` | removal only pre-append under existing guards, post count=row-count |
| `leggi-riferimento-riga-full-text` | absent/pending without scalars; transferred with absent physical reference remains pending, sealed checks row, other state causes fault |

Tests cover public contract and selected corruptions, do not yet demonstrate
independence of every internal-guard condition. MC/DC count is not
inferred from SB-COVER or fifteen mutants of whole suite.

<a id="due-letture-del-medesimo-autore--22-ottobre-2026"></a>

## Two readings by the same author — October 22, 2026

First reading: verified requirement/ADR, writer owner, keys without sentinels,
per-pool uniqueness, search/movement limits, and preflight/effect order.
Adoption and cancellation effects begin inside `unwind-protect`; incomplete
exit leaves pool faulted even between directory and counter updates.
Costs and loans are not returned to simulate rollback.

Second reading: verified typed arrays with read-only references, absence of
global state or I/O, eight-value contracts, no copying/ready handle,
CSN/TXID distinction, and no dependence on reused WAL buffer. Position/
neighbor check separated to contain function complexity; a missing slot
is recognized as invariant before reading fields. Association-list
oracle, semantic mutant, and limits of documented claims rechecked.
No durable or format change, no data retirement. Traceability and
full verification must be recorded on frozen sources; this is self-reading,
not independent review or C1 qualification.
