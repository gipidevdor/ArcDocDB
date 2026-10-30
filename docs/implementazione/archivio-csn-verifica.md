<a id="verifica-del-piano-csn-dellarchivio"></a>

# Verifying the Archivio CSN plan

<a id="metodo-prima-delle-esecuzioni"></a>

## Method before executions

The `tests/recovery-archive-csn/` suite exercises the
[set, provenance, and base](csn-archivio-recovery.md) contracts, with v1/v2 and
independent CT/RT oracles for packing and CRC. No format or new
database limit. Serie, Registri, scope, and initial catalog completeness
are declared fixture facts, not deductions from the plan.

Support owns at most four Serie, four CLOSED segments per Serie,
32 read-only capabilities, 4096 bytes per file, and 65536 events. It generates CONTROL,
ACTIVE, writer/compaction CLOSED, and the entire decision log; it recovers them
through public APIs. Tokens, markers, and positive results are not forged.
Plan queries must leave the event log empty: no I/O,
source mutation, or advancement of the bootstrap CSN registry.
Intentional caller closes are separate from integrity checks.

The matrix follows ACR-D01…12: count and `8*N` budget before copying,
Registri present by EQ, unique scopes and UUIDs, owned vector copy,
ACTIVE/CLOSED cardinality, and global sum including ACTIVE segments. For
each Serie, replay view and marker must coincide: rereading
the same bytes does not produce the same authority. The CLOSED gate is checked
with real results; internal impossibilities may be forced only by declared FI,
restored before the next case.

The maximum includes DECISION even without local prepared records, as well as Serie
CSNs. No CSN and present CSN zero remain distinct; TXIDs and unsealed
tails are excluded. Orders, parity, high bits, and maximum u64 do not
depend on an expected maximum extracted from product queries.

The native chain reuses the CONTROL fixtures' 0700 namespaces, bounded FD/name registries,
and deadlines. The two-word base passes to the existing registry constructor
only in the test: first CSN M+1, carry between u32 words,
exhaustion without wrap. Any real workers have deadlines, joins, and
one owner per result cell; cleanup only after all joins.
The test neither creates a product controller nor authorizes admission.

<a id="coordinamento-copertura-e-conservazione"></a>

## Coordination, coverage, and preservation

Agents write disjoint files without running tests or compilations.
Before runs, writers are stopped, the revision is frozen, and work
is saved. Every execution uses the existing recorder, including
failures; every correction produces a separate revision and run.

The `recovery-archive-csn` scope selects nine exact files: the module's five
non-package files, `recovery/decisions-types`, `recovery/decisions-query`,
`recovery-active/types`, and `recovery-active/build`. The latter expose the marker's
context and transfer to the result; they are not all of ACTIVE or DECISION
recovery. The DECISION fold now rechecks entry shape and result
consumption/normalization after the reviewer's COD-24 finding;
the correction adds only scalar checks to the existing scan.
Counters are reset after loading, before
only the Archivio CSN suite. The self-test checks inclusions/exclusions
and detection of a missing branch. SBCL forms and branches are not MC/DC;
residuals, generated code, and dependency checks remain distinct.

The [independent review](archivio-csn-revisione.md) preserves two readings
by the same reviewer, separate from the coordinator's rereading and
runs. Suite success alone confers no C1 qualification. Persistent catalog,
inventory, publication, indexes, and a single registry in the controller remain,
along with overall verification before traffic.

Collection uses the [common collector](raccolta-comandi.md), an explicit
manifest, four workers, hashes, and a closed inventory verified by an
independent process. The producer remains in a separate collection;
no append to the closed archive. FASL caches and reconstructible sb-cover
global state are excluded; HTML, helpers, failures, and cited raw outputs are preserved.

No new benchmark is planned. Recorder timings include compilation
and fixtures under uncontrolled external load: they are not DB throughput,
scalability, RSS, or zero heap. The plan scan remains bootstrap
work; catalog cost and completeness are distinct obligations.

<a id="esiti-conservati"></a>

## Preserved outcomes

The [2026-10-16 campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-16-archivio-csn-verifica/report.md)
preserves 54 passed tests, failed diagnostics and fixture correction,
coverage, and the full check on the integrated revision.
Module only: 267/301 forms and 34/36 branches; nine raw module and
context files: 589/736 forms and 57/74 branches. No residual is excluded from the total;
the report explicitly retains the absence of MC/DC or C1 qualification.
