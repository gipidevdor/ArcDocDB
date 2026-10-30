<a id="metadati-storage"></a>

# Storage metadata

In-memory encoders and verifiers for segment headers and EDIT/DECISION contents.
Common Lisp only, SBCL, specialized vectors, `safety 3`. References:
[on-disk formats](../formati-su-disco.md),
[ADR-0039](../adr/0039-cornice-unica-dei-record.md),
[ADR-0048](../adr/0048-limiti-documentali-e-formato-v2.md),
[coding standard](../affidabilita/standard-di-codifica.md).

<a id="ambito-e-responsabilità"></a>

## Scope and responsibilities

The module prepares and verifies bytes. It does not open files, apply EDIT to a manifest,
decide transactions, or modify indexes. EDIT visibility requires the
applicable SEAL batch; DECISION durability requires the protocol and I/O of the
log owner. A structurally valid DECISION does not prove that protocol.

Payload IDs, CSNs, and TXIDs are opaque integers: uniqueness, catalog existence,
applicable order, file availability, and participant membership remain
state checks. No new atomicity or coordination point between Serie.

<a id="contratti-pubblici"></a>

## Public contracts

Buffers are `simple-array (unsigned-byte 8)`, ranges `[start,end)`. Declared types
are preconditions detected by the runtime with safety 3. Format or budget errors
are conditions in the `arcdocdb-error` hierarchy.

| API | Verifies/prepares | Returned values |
|---|---|---|
| `scrivi-header-segmento` | 64-byte header, version 1/2, writer/compaction origin, identity, CRC | header end |
| `verifica-header-segmento` | CRC, magic, actual version, origin, reserved fields, expected Serie and segment-id | header end, version, origin, created-at offset |
| `scrivi-valore-edit` | complete closed/outcome/removed sections, counts, next-id, budget; copy after preflight | payload end |
| `valida-valore-edit` | flags, ordinary next-id zero, valid-bytes, cumulative counts, complete sections, exact consumption | closed start, count, removed start, count, total outcomes |
| `scrivi-valore-decision` | at least 2 ID16s, u16 count, budget, and capacity | payload end |
| `valida-valore-decision` | CSN present, count, complete ID16 list, exact consumption | CSN offset, list start/end, count |
| `verifica-record-edit` | budget before CRC, frame, type, exact consumption, EDIT payload | payload range, closed/count, removed/count, total outcomes, flags |
| `verifica-record-decision` | budget before CRC, frame, type, exact consumption, DECISION payload | CSN offset, list start/end, count |

Record adapters require `:version` obtained from the file header.
Omission uses zero and signals `unsupported-format`; it does not interpret the record
by trial and error. The header reader returns the version actually present.

The `valida-valore-*` APIs assume frame and CRC verification: they also serve
internal decoder composition and are not the boundary for external bytes
without verified integrity. File bytes use `verifica-record-*`.

The caller keeps buffers stable and referenced until returned ranges are
no longer used. Encoders require an exclusive destination and inputs
without aliases to it. All preflight rejections precede the first mutation.
Creation date is supplied by the caller: the codec does not read the clock.

<a id="limiti-di-lavoro-e-memoria"></a>

## Work and memory bounds

Counts are compared with budgets and available bytes **before** multiplying
or starting a loop. Outcomes have a cumulative budget across the entire EDIT. Distinct conditions are
`resource-exhausted` (operational budget), `corruption-detected` (impossible structure),
and `invalid-argument` (caller input/configuration).

> **Proposal** — Initial EDIT budget: 65,536 total closures, removals, and outcomes;
> each is a separate parameter adjustable per call, up to the u32 field.
> The payload byte budget is configurable up to 16 MiB, consistent with the
> v2 frame's per-value ceiling. This is not a new limit on the number of segments in a
> Serie: ordinary closures may be spread across multiple EDITs; the owner
> must explicitly handle exhaustion of a complete EDIT without truncating it.

> **Proposal** — Reserved header bytes are written and required to be zero,
> including the final four outside the CRC. The specification calls them reserved;
> this is the codec's conservative policy for current formats, not
> an interpretation of future format extensions.

Identity u64s are compared as two u32s; CSN, TXID, and created-at may
remain in the buffer as offsets. No bignums are materialized during verification.
Integers are fully preserved; no probabilistic approximation.

There is no shared mutable state, global counters, locks, or waits between Serie.
The only serialization is exclusive ownership of one call's output buffer.

<a id="verifica-ed-evidenze"></a>

## Verification and evidence

[Method](metadati-storage-metodo.md), [compound decisions](metadati-storage-decisioni.md),
and [test catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-storage/catalogo.lisp).
Linked requirements retain their engine status: no automatic promotion
from codec success alone.

```sh
make test lint
sbcl --noinform --no-userinit --script tools/storage-bench.lisp --self-test
sbcl --noinform --no-userinit --script tools/storage-bench.lisp --bench
sbcl --noinform --no-userinit --script tools/foundation-coverage.lisp --report /tmp/storage-cover/ storage
sbcl --noinform --no-userinit --script tools/foundation-mutation.lisp --run /tmp/storage-mutants-new/ storage
make check
```

18 new tests: independent packing and bitwise CRC, versions 1/2, origins 1/2,
truncations, byte alterations, invalid fields with correct CRCs, different identity,
high integers, valid-bytes 64 and 4 GiB−1, cumulative/exact budgets, huge counts,
65,535 participants and rejection of 65,536, no partial encoder writes.
Build without warning/style warning and lint without violations.

[10 targeted mutations](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-storage/mutazioni-finali.lisp)
detected on CRC, magic, identity, reserved fields, budget, bounds, and exact consumption.
The [9 foundation mutations](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-storage/mutazioni-fondazioni.lisp)
remain detected after module integration. An initial campaign included
a comparison equivalent to the original under the decoder preconditions: its
[failed outcome](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-storage/mutazioni-iniziali-fallite.lisp)
is retained, and the final mutant instead introduces an observable defect.

<a id="prestazioni-osservate"></a>

## Observed performance

[Final campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-storage/benchmark-finale.lisp),
Apple M4 ARM64, SBCL 2.6.9, one worker, safety 3, five samples, median:

| Campaign | Operations/s | Heap bytes per sample |
|---|---:|---:|
| Header verification, high u64s | 4,617,244 | 0 |
| Header encoding, high u64s | 5,005,709 | 0 |
| EDIT record verification, 2 closures/2 outcomes | 2,301,366 | 0 |
| EDIT payload encoding, 2 closures/2 outcomes | 3,924,899 | 0 |
| EDIT record verification, 1,024 closures/outcomes | 10,771 | 0 |
| EDIT payload encoding, 1,024 closures/outcomes | 23,846 | 0 |
| DECISION record verification, 2 participants | 4,474,058 | 0 |
| DECISION payload encoding, 2 participants | 17,055,563 | 0 |
| DECISION record verification, 65,535 participants | 675 | 0 |
| DECISION payload encoding, 65,535 participants | 40,764 | 0 |

Small EDITs: 96-byte payload, 120-byte record; large EDITs: 36,888/36,912 bytes.
Small DECISIONs: 42/66 bytes; large: 1,048,570/1,048,594 bytes. Verification includes
CRC over the entire record; payload encoding excludes the frame. These are serial
in-memory measurements with preallocated buffers and uncontrolled external load, without
I/O, commit, P95/P99, or concurrency. Zero heap applies to measured successful inputs;
error conditions may allocate.

<a id="letture-e-criteri-aperti"></a>

## Readings and open criteria

Two readings: format/boundaries/errors; then buffer ownership, budgets before
scans, parallelism, and high integers. Evidence does not equate to independent
review or C1 qualification. Traceability: REQ-FOR-001/002/003, REQ-LIM-001,
REQ-TXM-001, REQ-AFF-002/008, REQ-VAL-001; invariants INV-F1, INV-A2/A3/A4/A8,
INV-P6, and INV-X3.

The [raw coverage](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-storage/copertura-dati.lisp)
retains the full denominator: unexecuted definitions and proclamations, and
the defensive `closed-range` branch unreachable from external data after
step checks. Exceptions still require registration/review for C1.
CRC32C does not authenticate data and has collisions; integration with
I/O, resolver, manifest, and `FAULTED`, ID uniqueness and semantic validity,
commit protocols, and engine faults remain to be verified. No release gate closes here.
