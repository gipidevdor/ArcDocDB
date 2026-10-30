<a id="decision-log-recuperato-dellarchivio"></a>

# Recovered Archivio decision log

The [`src/recovery-archive/`](../../src/recovery-archive/) module reads
`Registri/multiserie.log` and connects its result to
[ACTIVE recovery](active-recuperato.md). Applies formats and semantics of
[ADR-0041](../adr/0041-multiserie-segmenti-autosufficienti.md) and
[ADR-0052](../adr/0052-header-dei-log-di-controllo.md), without amendment.

<a id="api-e-autorità"></a>

## API and authority

Namespace: `arcdocdb.recovery.archive`.

| API | Contract |
|---|---|
| `crea-archivio-recovery(scope, identity)` | associates canonical Archivio GET scope with private copy of authoritative UUID16 |
| `leggi-decisioni-recuperate(archive, input, size, scratch, …)` | reads header and body from same read-only FD; returns only complete table of verified prefix |
| `frontiere-decisioni-recuperate(result)` | attested EOF, absolute prefix P, `:complete`/`:tail`, version 1/2 |
| `numero-decisioni-recuperate(result)` | distinct TXIDs after coalescing |
| `trova-decisione-recuperata(result, txid)` | presence, CSN, participant count; `nil/0/0` if absent |
| `partecipante-decisione-recuperata-p(result, txid, id, start, end)` | exact ID16 presence; range checked even for absent TXID |
| `leggi-active-con-decisioni(control, input, size, result, scratch, …)` | checks decision-log scope and lifetime, then delegates to canonical ACTIVE recovery |

Bootstrap associates **once only** UUID and `ambito-get` of same
Archivio from catalog. Constructor copies all sixteen bytes;
certifies neither catalog, association uniqueness, nor filesystem
paths. UUID equality alone does not replace canonical identity
of scope shared by Serie views.

Controller attests `size` as **complete stable physical EOF**. Read-only
capability measures no EOF and prevents no external writes. File,
FD, and namespace stay frozen and open until Serie recovery
completes; scratch exclusive until reader return. API does not open,
close, truncate, rename, or make any file durable.

<a id="ordine-dei-controlli"></a>

## Check order

1. Without syscall: open read-only capability, no alias with owned
   UUID, positive chunk, complete header, range, and all budgets.
2. Read exactly 64-byte header from same FD; verify
   magic `ARCDMSL1`, CRC, all UUID bytes, actual version, and reserved areas.
   Incompatible header fails before body reading.
3. Read body through attested EOF, in bounded chunks, without
   rereading header.
4. Run `ricostruisci-decisioni` with header version and
   `file-size = size`: scanner, witness search, participant
   preflight, owned copies, sorting, and conflict checking.
5. Verify frontiers and still-open capability; deliver complete
   result without exported scratch, workspace, or arrays.

SEAL with zero file-id does not replace header UUID. Tail remains
in file: `:tail` means complete witness search and exclusion
of incomplete batch, not partial replay of that batch. Durable-corruption
witness, DECISION conflict, or exhausted budget propagate
original conditions; controller applies fail-stop.

[Canonical replay](decisioni-multiserie.md) retains opaque u64 TXID and CSN,
including zero and maximum; identical duplicates idempotent, contradictory
decisions corruption. Queries return scalars and do not
attest file remains open or healthy at query time.

<a id="collegamento-alla-serie"></a>

## Serie connection

`leggi-active-con-decisioni` accepts only `decisioni-recuperate`.
Before any ACTIVE I/O, requires `eq` between Archivio scope and
view scope in recovered CONTROL, rejects UUID aliases, and
checks decision log open read-only. Then delegates to
existing ACTIVE reader, forwarding all budgets; rechecks decision-log
lifetime before returning result.

Absent DECISION can thus be resolved through canonical path from
complete scan of correct Archivio, under bootstrap and EOF
preconditions. Local OUTCOMEs, participants, and CSNs remain checked
by ACTIVE resolver; no second semantics introduced.

`leggi-active-recuperato` remains available with previous contract:
caller passing bare table directly guarantees identity and completeness.
No fallback from `nil` or unread log. ACTIVE result does not
retain Archivio table. New entry does not authorize forgetting
decisions, new CSNs, or traffic admission.

<a id="budget-memoria-e-prestazioni"></a>

## Budgets, memory, and performance

| Open budget | Default |
|---|---:|
| total file bytes, header included | 64 MiB |
| body chunk | 64 KiB |
| batches / records per batch | 65,536 / 65,536 |
| bytes per batch | 64 MiB |
| physical DECISIONs, duplicates included | 65,536 |
| cumulative participants, duplicates included | 65,536 |
| participants per DECISION | 65,535 |

Configurable open-task budgets, not new database
limits. Per-DECISION cap derives from format's u16 field. Zero
allowed for DECISION/participant counts when file contains none;
over-budget record not ignored. I/O capability permits
`max(64, min(size-64, chunk))` bytes per transfer.

Caller-supplied scratch at least `size` bytes; owned 16-byte
UUID; replay table and workspace bounded by records and participants.
Limits do not measure RSS or Lisp-object overhead.
File read once: header and `ceiling((size-64)/chunk)` exact
transfers. Binary queries and sorting remain existing replay's.
Open path with allocations: no throughput,
latency, or zero-heap-allocation promise. No lock or new shared write between Serie.

<a id="decisioni-e-qualifica"></a>

## Decisions and qualification

| ID | Compound decision or boundary | Dedicated campaign cases |
|---|---|---|
| DAR-D01 | positive chunk and byte budget at least header | each false, both true; size 63/64 and exact/exceeded budget |
| DAR-D02 | positive chunk and size at least header in body reader | each false, both true; empty body and short last chunk |
| DAR-D03 | P within range and state consistent with EOF | each false limit, complete/tail, header-only, tail, durable witness |
| DAR-G01 | exact UUID and owned copy | 15/16/17-byte UUID; caller mutation; high-byte mismatch, CRC, reserved areas, versions 1/2 |
| DAR-G02 | full preflight before I/O | read-only/closed, alias, insufficient scratch, scanner/replay budgets, and chunk capacity |
| DAR-G03 | identical canonical scope before ACTIVE I/O | same/different identity, even with equal UUID; log closed before/during read |
| DAR-G04 | canonical replay and queries | duplicates, conflicts, zero/high u64, participant budgets, scratch mutation after return |

[Initial local evidence](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-archive-recovery/README.md)
distinguishes compilation, static readings, and byte preservation from functional
tests. [New verification method](decisioni-recuperate-verifica.md)
defines functional tests, fault injection, and native chain;
[independent review](decisioni-recuperate-revisione.md) remains separate
from executed results. Full C1 qualification and new-entry measurements
remain open. Component does not complete CLOSED
reconciliation, indexes/CSN horizon, or Recovery Manager gate.
[Complete checkpoint builder](checkpoint-recovery.md) now available
with dedicated qualification still open.
