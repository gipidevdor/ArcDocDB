<a id="tabella-delle-decisioni-multiserie"></a>

# Multiseries decision table

Module [`src/recovery/`](../../src/recovery/) rebuilds in-memory
TXID → CSN and participant set from verified prefix of
`multiserie.log`, under [ADR-0041](../adr/0041-multiserie-segmenti-autosufficienti.md).
Result of recovery step 2, later used to interpret
Serie prepared records.

<a id="contratto"></a>

## Contract

`arcdocdb.recovery.decisions:ricostruisci-decisioni` receives stable buffer,
`start`, `end`, explicit version, authoritative physical size. Returns
owned table, prefix boundary within **buffer**, and `:complete`
or `:tail`. Arguments `file-offset` and `file-size` have same contract
as [log scanning](scansione-log.md): range reaches stable physical
EOF; header, version, and Archivio identity verified
by caller. Multiseries log file-id zero.

First verify entire log and search for later SEAL witnessing
corruption. Then verify all DECISION payloads in
prefix, counts, and budgets. Result built only after
checks. No partial table returned on error.

| Query | Result |
|---|---|
| `numero-decisioni(tabella)` | distinct TXID count |
| `trova-decisione(tabella, txid)` | explicit presence, CSN, participant count |
| `partecipante-decisione-p(tabella, txid, buffer, start, end)` | membership of 16-byte Serie ID in set |

Absent decision returns `nil, 0, 0`. Present decision with
zero CSN returns `t, 0, count`: caller uses presence, not
CSN value. Absent TXID may be interpreted as presumed abort
only after successful table construction. Scan error,
corruption, or budget error does not become ABORT outcome.
Controller also verifies Serie among participants;
TXID presence alone does not authorize application to any Serie.

<a id="identità-duplicati-e-ownership"></a>

## Identity, duplicates, and ownership

One DECISION's participants must be at least two and distinct.
TXID and CSN remain opaque u64 integers, including zero/maximum; no
CSN monotonicity or uniqueness constraints added across different transactions.
Order of DECISIONs and Serie IDs does not change result.

Repeated same TXID with equal CSN and participant set
is idempotent. Conflicting CSNs or sets produce `corruption-detected`
with reason `:decision-conflict`. Repeated participant in same
DECISION produces `:decision-duplicate-participant`. Such semantic errors
in sealed batch not treated as incomplete tail.

Scanner verifies minimum frame length before batch
enters prefix. Thus undersized DECISION frame follows
[scan](scansione-log.md) tail/witness classification even
if fixture contains intact CRC and SEAL. This table's semantic
checks apply only to prefix with already verified frames.

Table sorts TXIDs and Serie IDs and owns data copies. Does not
return internal vectors or retain source-buffer spans.
After construction caller may reuse buffer without changing
queries. Table has no global state or shared writes
between Serie; queries read-only.

Recovery selects stable LSD radix from 1,024 ID16 participants per
decision and from 256 physical DECISIONs; below threshold uses bottom-up merge.
[Measured choice](decisioni-radix-risultati.md) preserves physical order
of equal TXIDs needed for conflict diagnostics. Immutable-table
queries also checked with six concurrent readers.

<a id="budget-e-confini"></a>

## Budgets and boundaries

> **Proposal** — Table budgets: 65,536 physical DECISIONs, 65,536
> cumulative participants, at most 65,535 participants per decision.
> Scan budgets remain separately configurable.

Cumulative counts include duplicate records before coalescing.
Empty log valid even with zero budget; memory not allocated
proportionally to unused budget. All loops bounded by bytes,
verified counts, or binary-search depth.
Opening/recovery path: copying and sorting may
allocate, without zero-heap promise.

New count, duplicate-participant, and conflicting-decision errors
report absolute file offsets. Codec conditions retain
buffer offsets under their contracts. Queries check
ID range/length even with absent TXID.

<a id="verifica-e-limiti"></a>

## Verification and limits

[Method](decisioni-multiserie-metodo.md) and
[decision table](decisioni-multiserie-decisioni.md).
Bytewise fixtures and bitwise CRCs independent of product
codecs; oracle interprets declared logical histories as data.
Tests cover consistent/conflicting duplicates, truncations and corruption,
budgets, extreme values, nearly equal IDs, and ownership.
Suite has 43 dedicated tests (62 with scanner), including
identity across all 128 ID16 bits and valid 65,535-participant
limit in v1/v2.
18 radix-added tests include independent oracles, internal
guards, both public-threshold boundaries, and concurrent readers.

Six `decisions-*` sources and four fixture, test, and second-reading
files are `arcdocdb.asd` components: `make test` and `make check`
compile module without warnings and run tests alongside recovery
scanning. Mutation campaign `decisions` selects dedicated-test
definitions, checks they actually start,
and distinguishes detected defects from pre-execution errors.

```sh
make check
sbcl --noinform --no-userinit --no-sysinit --script tools/foundation-mutation.lisp --self-test
sbcl --noinform --no-userinit --no-sysinit --script tools/foundation-mutation.lisp --run spikes/out/decisions-mutants/ decisions
sbcl --noinform --no-userinit --no-sysinit --script tools/foundation-coverage.lisp --self-test spikes/out/decisions-coverage-self-test/
sbcl --noinform --no-userinit --no-sysinit --script tools/foundation-coverage.lisp --report spikes/out/decisions-coverage/ recovery
```

Mutant directory must be new. `recovery` coverage
includes scanner/table; report separates files and retains
raw denominator. Does not equal MC/DC coverage or engine qualification.

[Evidence of 2026-10-09](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-decisions-verifica/catalogo.lisp)
preserves self-tests, commands, environment, hashes before/after, mutation
output, and raw `sb-cover` state. Campaign detects seven mutants
of seven after dedicated tests start, without compilation errors or
pre-test failures. For only five `decisions-*` files of that version,
raw observed coverage is 935 forms of 1,121 and 82 branches of 122.
Definitions/defensive guards remain in totals; no coverage exception
approved or subtracted by integration. Catalog
also includes nine scanner-regression mutants and initial-fixture
failures. [Reading and integration-test catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-decisions/catalogo.lisp)
preserves earlier variants and full isolated-copy check.
[Missing-form inventory](../affidabilita/copertura-eccezioni.md)
reports observed reasons and limits.

Requirements: REQ-TXM-001/005, REQ-FOR-003, REQ-AFF-008/009/017, REQ-VAL-001.
Affected invariants: INV-F1/F2/F3, INV-A7/A8/A9, INV-T4, INV-P6, INV-X3.
Module neither verifies catalog, applies prepared records, writes
manifest outcomes, nor compacts `multiserie.log`. Implements neither
2PC coordinator nor full database opening; no engine gate
closed by evidence from this table alone.
