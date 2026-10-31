<a id="verifica-dei-rifiuti-open-del-get-active"></a>

# Verification of GET ACTIVE OPEN rejections

Method registered before runs dated 2026-10-14, on base
`a5715a1aa0b2571d650d1b794e9bb7b7324e951e`. The campaign completes the
[first ACTIVE suite](get-active-verifica.md) in the portion preceding
sealing and CSN assignment. It does not modify the product protocol.

<a id="perimetro"></a>

## Scope

The entry point is `verifica-capienza-get-attiva`, in
`src/get-resolver/active-preflight.lisp`. Decisions GSA-D09 and GSA-D14 are
described in the [ACTIVE contract](get-active.md). Tests verify identity,
state, order, and capacity rejections and propagation of OPEN-header
faults. Empty bootstrap and Serie GET sources have separate
campaigns; their mutants are not recounted.

Fourteen named tests were added in `tests/get-active/preflight.lisp`,
with a requirement ID in each name. Expected ACTIVE suite grows from 28 to 42
tests; the actual count and names are derived from frozen sources
and compared with loaded registry. The whole-system total is
derived separately: other increments may add tests to `main`.

| Case | Independent expectation |
|---|---|
| Batch ID | Conforming check and only different file-ID, in v1/v2 |
| Batch version | Conforming check and only different version, in v1/v2 |
| Empty OPEN batch | Rejection before CSN |
| OPEN with CSN binding | Actual SEALED token, FI only of state to OPEN; rejection without acquisition |
| SEALED batch | State rejection; caller token still pending |
| Previous root | Old or foreign root rejected before adoption |
| Full ring | No new event, slot, or token |
| Exhausted generation | Typed limit FI, no wrap |
| Contiguity | Mismatched initial offset and stable root |
| Segment space | Admitted endpoint and one byte beyond, without creating giant files |
| Record count | Exact limit and overrun |
| Batch bytes | SEAL included: exact limit and one byte below |
| OPEN-header CRC | Original cause and Archivio controller FAULTED |
| Inconsistent OPEN count | Typed invariant or corruption, without adoption |

Cases constructing impossible state through internal fields are explicit
FI. They do not attest that state is reachable through the conforming
protocol. Impossible progress after conforming `checked-header` remains
a defense to analyze; the function is not altered to simulate coverage.

<a id="oracoli-e-risorse"></a>

## Oracles and resources

Fixtures own separate native read-only/append files and their
association. Every call preserves bytes and batch state,
CSN binding/token, registry frontiers, root identities, ring and
generation, controller offset, and file written/durable positions.
Backend observes reads, writes, flushes, and identity queries.
Conforming preflight and rejections produce none of these operations.

Ordinary rejection keeps controller HEALTHY; corruption
or invariant errors follow Archivio fail-stop. In those cases,
other data are still compared and the health transition is checked
separately. No cleanup error is ignored.
Never-adopted SEALED tokens are explicitly canceled after observations.
FI is restored before releasing resources requiring original
state; restoration is not presented as product rollback.

<a id="mutazioni-preregistrate"></a>

## Preregistered mutations

The C4 tool `tools/get-active-init-mutation.lisp` is extended with
`--suite preflight`; without the option, bootstrap selection and behavior
remain. The new profile has four isolated changes only to
`active-preflight.lisp`, with unique anchor and preserved diff.

| Mutant | Detection test |
|---|---|
| Omit file-ID comparison | `test-REQ-WAL-005-active-preflight-batch-file-id` |
| Omit version comparison | `test-REQ-WAL-005-active-preflight-batch-version` |
| Exclude SEAL from byte budget | `test-REQ-AFF-008-active-preflight-seal-byte-boundary` |
| Reject exact record count with `>=` | `test-REQ-AFF-008-active-preflight-record-boundary` |

The baseline runs the entire ACTIVE suite. Each mutant runs the preregistered
test already passed in the baseline; full registry and ASDF
definitions remain verified. The whole suite and executed tests are preserved
separately. Copies and FASL caches of the five children are private.

Failed compilation, timeout, fixture or I/O error,
signal, and unreaped child are campaign errors. A mutant is
detected only by product assertion or semantic condition in
the preregistered test, with sources, patch, configuration, registry,
and artifact identities verified. The campaign also saves failures and partial results.

The new profile imposes observable limits on processes and subprocesses
used for digests and verifies termination. The self-test exercises
the classifier and infrastructure errors. Existing bootstrap-profile
regression and CLI fixtures for unknown/duplicate suite also run.

<a id="esecuzione-e-conservazione"></a>

## Execution and preservation

Before runs, the method, tests, ASDF configuration, and tool are committed;
they then stay fixed during runs, independent readings, and collection.
`tools/record-command.lisp` records commands. `make check` and ACTIVE
SB-COVER profile use separate processes and caches; coverage retains
an explicit list of ten original files. It does not include `active-init.lisp`.
The CLOSED default is rechecked with its own separate suite.

Complete groups, stdout/stderr, configurations and drivers,
original manifests, patches, and used FASLs are preserved, read as bytes only. Canonical
sources are identified by frozen Git; mutated sources and their hashes are
preserved with patches. Tests are read through the repository evidence
reader with `read-eval` disabled, never loaded as code.
Local and Linux/macOS CI outcomes remain attributed to their respective commits.

<a id="limiti"></a>

## Limits

Four selected defects do not measure general test adequacy.
Condition witnesses and SB-COVER do not constitute overall MC/DC
qualification. C1, interruptions at every phase, concurrent stress,
ACTIVE prepared/OUTCOME, concrete index, rotation/reclamation, and complete engine remain open.
This campaign measures no throughput, latency, RSS, or allocations.
