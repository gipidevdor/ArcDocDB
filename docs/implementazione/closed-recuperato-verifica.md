<a id="verifica-del-recovery-closed"></a>

# CLOSED recovery verification

<a id="metodo-prima-delle-esecuzioni"></a>

## Method before executions

Suite `tests/recovery-closed/` verifies new binding among CONTROL,
CLOSED prefix, and read-only capability, in v1/v2 formats and
writer/compaction origins. Specification remains ADR-0040/0041. Tests
do not change database format or limits.

Fixtures reuse bytewise packing and bitwise CRC from CONTROL,
recovery, and ACTIVE oracles. Every input and scratch belongs to fixture;
CONTROL read through public API before CLOSED call. No
product table or result fabricated on positive path.
Private constructors may be used only in explicitly separate
FI, to verify otherwise unreachable defensive guards.

Injected backend records I/O requests: maximum 32768 events,
4096 bytes per file, eight capabilities total. Header read once,
then chunks through P. Arbitrary suffix beyond P stays intact and
unread; EOF before P is I/O error. Capabilities, ranges, budgets, and backend
checked before reading. Zero ID, high bits, and maximum u64 have
declarative fixtures; for maximum ID, CONTROL uses legal delta
transition exhausting space without wrapping.

Semantic matrix distinguishes ordinary/prepared, local OUTCOME, and EDIT:
neither proof, one proof, both consistent, conflict.
Duplicates and physical limits precede coalescing. Present zero CSN stays
distinct from absence; TXID does not contribute as CSN. Writer SEAL,
orphan OUTCOMEs, and EDIT outcomes contribute as contract specifies.
Conflicting same-name proofs rejected even without prepared records: review R1
motivated preliminary check of all OUTCOMEs.
R2 motivated u64 and EDIT-fold cardinality checks.
Compaction contains ordinary records only, without SEAL or prepared records.

Set gate checks all and only CLOSED entries of same CONTROL
token, unique IDs, exact P, budgets, and live capabilities. Serie CSN query
uses ACTIVE and entire verified set. Campaign does not
qualify global aggregation of all Serie and decision log,
register creation, or traffic admission.

Native tests reuse 0700 namespace and existing CONTROL records,
exclusive temporary files, serial 30-second deadline. Read real
segments and pass CLOSED gate before CONTROL publication.
Compare bytes, names, and capabilities; rejections precede claim. Publication
faults, if any, preserve protocol and original conditions.
Not power-loss or concurrent external-write tests.

<a id="coordinamento-e-risultati"></a>

## Coordination and results

Agents write disjoint files without executions. Before tests,
all writers closed, sources/documents frozen, and revision saved.
Every attempt passes through existing structured recorder,
including failed compilations, FI, and tool checks. Later
corrections produce distinct revisions and runs.

Coverage `recovery-closed` selects exactly eight product
files `types`, `read`, `verify`, `resolve`, `build`, `csn`, `csn-serie`,
`publication`. Package and fixtures excluded. Counters reset
after loading, before CLOSED suite only. Positive/negative self-tests
check selector and missing-branch detection.
SBCL forms/branches do not measure MC/DC. Any residuals remain
in denominator without implicitly approved exceptions. Serial FI
in `guards.lisp` replace dependency returns only during call,
with `unwind-protect`, then repeat positive path. Constructor
and EDIT-table FI separate from valid fixtures.
Do not simulate power loss or concurrent access to frozen hash table.

The [independent review](closed-recuperato-revisione.md) preserves two
readings by same reviewer, distinct from coordinator rereading
and runtime results. Results preserved in new archive
through [common collector](raccolta-comandi.md): explicit manifest,
four copy workers, hashes, and closed inventory. Historical texts
are data; FASL caches excluded and reconstructible. Collection producer
remains separate from archive just verified.

No new benchmark planned. Recorder time includes bootstrap,
oracles, and fixtures; external load uncontrolled. No DB
throughput, zero heap, scaling, or full C1 coverage inferred from local
success alone. Physical sources, catalog, and namespace remain controller
preconditions until publication and later admission gate.

<a id="esiti-conservati"></a>

## Preserved outcomes

The [campaign of 2026-10-16](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-16-closed-verifica/report.md)
preserves 69 passing tests, failed attempts, variants, and integration
checks. Raw coverage: 739/814 forms and 87/94 branches; three application
counting branches and four generated branches remain unreached.
Report retains denominators, oracles, and limits; C1/MC/DC remain open.
