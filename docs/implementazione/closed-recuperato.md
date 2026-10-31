<a id="recovery-readonly-dei-closed"></a>

# Read-only recovery of CLOSED segments

`arcdocdb.recovery.closed` verifies CLOSED segments named by
[recovered CONTROL](control-recuperato.md), under
[ADR-0040](../adr/0040-manifest-a-record-unico.md#3-riconciliazione-al-riavvio)
and [ADR-0041](../adr/0041-multiserie-segmenti-autosufficienti.md#3-segmenti-autosufficienti-inv-s7).
It does not change formats, CLEAN/MERGE policy, or canonical publisher.

## API

| API | Contract |
|---|---|
| `leggi-closed-recuperato(control, input, id, scratch, …)` | header and prefix from same read-only FD, locally resolved prepared records |
| `frontiere-closed-recuperato(result)` | u64 ID, manifest P, version 1/2, origin writer=1/compaction=2 |
| `statistiche-closed-recuperato(result)` | batches, records excluding SEAL, distinct prepared TXIDs, local commits, EDIT-only commits, aborts |
| `massimo-csn-closed-recuperato(result)` | presence and local maximum including orphan EDITs; NIL/0 distinct from T/0 |
| `massimo-csn-serie-recuperata(active, vector, :max-segmenti)` | maximum ACTIVE + complete CLOSED set; sources still open |
| `verifica-closed-completi(control, vector, :max-segmenti)` | all and only old CLOSED, once per ID, same CONTROL, P, open files |
| `pubblica-control-con-closed(prepared, active, vector, :max-segmenti)` | checks set before claim, delegates to `pubblica-control-da-active` |

The result retains CONTROL, read-only capability, and scalars without scratch,
workspace, arrays, or numeric FD exported. Format IDs are full u64,
including zero: the reader neither builds a GET capability nor applies current
primary-index limits. It builds no GET maps or indexes.

<a id="autorità-lettura-e-frontiera"></a>

## Authority, reading, and frontier

The controller guarantees exclusive Serie recovery and catalog
association of CONTROL, input, and file names. Files, FDs, and namespace remain
authoritative, frozen, and open until publication; scratch remains exclusive
throughout reading. Read-only does not prevent external mutation. CONTROL
and segment backends must match, including `nil` for native path.

1. Without syscall: check capabilities, alias with Serie UUID, budgets,
   backend, and ID's CLOSED state. Obtain P from manifest; check range
   and transfer capability before reading.
2. Read header from supplied FD, check CRC, Serie, all ID bits,
   reserved fields, actual version, and origin before body.
3. Read body in chunks through **exact P**, without rereading header.
4. Verify complete in-memory prefix, then apply local semantics.
   Deliver result only while CONTROL and input still open.

P is not a measurement of physical EOF. The reader does not use the EOF TAIL scanner,
read/interpret bytes beyond P, or truncate files. A broken batch before
P is an error, not an ignorable tail. A file shorter than P causes
the original I/O error. The manifest does not replace headers, CRCs, or data.
FD numbers or inodes are not compared: name authority and stability
remain controller obligations; the header checks logical identity on the same FD.

<a id="origine-e-prepared"></a>

## Origin and prepared records

Writer origin: complete batches are verified with the canonical verifier:
frames, CRCs, SEAL, u64 ID, frontiers. P must match a complete
batch end. Only after all CRCs are verified is the ACTIVE semantic traversal reused
on a private workspace: prepared TXID in one batch, later OUTCOMEs,
identical duplicates allowed, conflicting CSNs rejected. A second
pass rechecks headers without recalculating document CRCs.

| Local OUTCOME | EDIT outcome for TXID | Prepared resolution |
|---|---|---|
| present | absent | local commit |
| present | present, same CSN | local commit, one classification |
| absent | present | commit from closing |
| absent | absent | abort in self-contained CLOSED |
| present | present, different CSN | corruption |

There is no `multiserie.log` access. A present zero is distinct from absence;
no high-bit truncation. Each prepared TXID is classified once:
`prepared = locali + solo-EDIT + abort`. OUTCOMEs or EDIT outcomes without prepared
records in prefix create no versions or new commits. All OUTCOMEs, including
orphans, are compared against any same-name EDIT: conflicting proofs
prevent result and maximum CSN. Manifest metadata
remains intact and is not discarded.

Compaction origin: the existing full verifier is reused: ordinary
PUT/TOMBSTONE only through P, no prepared, OUTCOME, or SEAL. The header
is reverified in memory by the codec, without a second file read.
Statistics have zero batches/prepared/outcomes and PUT+TOMBSTONE count. Closing
metadata without prepared records does not authorize stamp modification.

<a id="insieme-completo-e-pubblicazione"></a>

## Complete set and publication

The set vector must remain complete and stable during the call.
The budget is checked before allocating the `seen` table, which is sized by result count.
Every result must come from **the same recovered CONTROL object**,
name CLOSED with identical P, have open input, and be unique by ID.
Membership, uniqueness, and cardinality equal to manifest prove coverage
of old CLOSED entries. The vector may be empty only if no CLOSED entries exist.

The publication entry performs the check before any claim and
delegates to the ACTIVE publisher, which checks old ACTIVE closing,
conservative transition, and new ACTIVE. The atomic point remains the CONTROL
rename, with acknowledgment after parent fsync and the same terminal states.
There is no new token, second rename, or segment reread.

This module does not reconcile physical names, remove files, or verify
directory inventory. It authorizes neither forgetting global decisions,
index/CSN rebuild, nor reopening traffic: the Recovery Manager gate
remains. Previous publication APIs retain their contracts.

<a id="budget-e-costi"></a>

## Budgets and costs

| Opening budget | Default |
|---|---:|
| prefix/scratch | 256 MiB, configurable; segment-format maximum remains |
| body chunk | 64 KiB |
| batches / records per batch | 65,536 / 65,536 |
| bytes per batch | 64 MiB |
| total records excluding SEAL | 1,048,576 |
| distinct prepared TXIDs / physical OUTCOMEs | 65,536 / 65,536 |
| `max-esiti-chiusura` | 65,536 unique outcomes already folded into manifest |
| set `max-segmenti` | 65,536 CLOSED, excluding ACTIVE |

These are task budgets, not new database limits. Exhaustion does not
mean absence or abort. Zero records/prepared/outcomes/closing outcomes are allowed
when the prefix contains none; chunk, batches, and records per batch are
positive even for empty input. `max-bytes` is between the header size and the format maximum,
and is checked before reading for both origins. OUTCOME budget counts physical duplicates; EDIT
outcomes are already canonical from CONTROL replay.

I/O capability allows `max(64, min(P-64, chunk))` bytes per transfer.
There is one header transfer and `ceiling((P-64)/chunk)` exact body transfers; each byte is read
once. Writer: full CRC verification then traversal bounded by batches+records
and EDIT queries for distinct OUTCOMEs before prepared classification.
EDIT fold checks u64 values and traversed cardinality. Compaction:
full frame codec.
The semantic workspace, including canonical parser hash tables, is bounded by
prepared/OUTCOME budgets and is not retained in the result. The set check
uses a private table and average O(N) work. No zero-heap,
RSS, latency, or throughput measurement. No new lock or shared write between Serie.

<a id="decisioni-e-qualifica"></a>

## Decisions and qualification

| ID | Compound decision / boundary | Required cases, open |
|---|---|---|
| CDR-D01 | five configuration conditions | each false, all true; bytes below header/above format; header-only writer/compaction |
| CDR-D02 | header end and created offset in range | each false, both true; versions 1/2 |
| CDR-D03 | positive chunk and P at least header in body reader | each false, both true; short/exact chunk |
| CDR-D04 | batch progress/end/stamp/durable | each impossible result, all coherent; boundary budget |
| CDR-D05 | compaction end/version/count/budget | each mismatch separately; prepared/OUTCOME/SEAL rejected |
| CDR-D06 | EDIT present and different CSN for every OUTCOME; then local/EDIT presence for prepared | every combination, including orphan OUTCOMEs, zero, high bits |
| CDR-D07 | CLOSED state and equal P in set | each false, both true |
| CDR-G01 | preflight and identity before body | aliases, scratch, backend, state, budgets; UUID/ID/CRC/reserved fields/origin |
| CDR-G02 | exact prefix | half batch, corruption before P, short file, tail after P intact/unread |
| CDR-G03 | semantics and counts | prepared across batches, earlier/duplicate OUTCOMEs, all resolutions, orphan outcomes |
| CDR-G04 | manifest coverage | missing/extra/duplicate, another CONTROL, closed FD, empty vector, zero/high-u64 ID |
| CDR-G05 | publisher entry | rejections before claim without effects, same token and canonical faults after claim |

[Initial local evidence](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-closed-recovery/README.md)
concerns compilation and static checks. The
[dedicated campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-16-closed-verifica/report.md)
preserves 69 composite tests, FI, native tests, and static review.
C1/MC/DC qualification and measurements of new entries remain open.
Tests of existing parsers do not automatically qualify new
CLOSED/CONTROL binding, EDIT resolution, or set check.
The [dedicated-verification method](closed-recuperato-verifica.md) defines
oracles, functional matrices, native tests, coverage, and preservation of
the later campaign, separating executed outcomes and open requirements.
