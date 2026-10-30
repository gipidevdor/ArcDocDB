<a id="verifica-dei-rifiuti-open-del-get-active"></a>

# Verification of GET ACTIVE OPEN rejections

Campaign follows [preregistered method](get-active-preflight-metodo.md),
committed with tests and driver before executions. Local
freeze `8c0866711c50d047f87b9c484ce56d42a87ba19c`, on base
`a5715a1aa0b2571d650d1b794e9bb7b7324e951e`. Product protocol
unchanged.

**14 new tests** increase ACTIVE suite from 28 to **42 nominal tests**.
v1/v2 and boundary iterations internal to same tests.
Observe batch identity/version, empty/bound OPEN,
SEALED with caller token, previous roots, full ring, generation,
contiguity and space/record/byte budgets including SEAL.

Every call preserves bytes, tokens, CSN frontiers, entire ring,
root/graph identity, offsets, file states/positions.
Backend observes no reads, writes, flushes, identity queries.
Ordinary rejections leave controller HEALTHY; inconsistent header CRC/count
propagate same cause and cause Archivio fail-stop.
FI explicit, restored after witness; real never-adopted
tokens canceled after observations.

<a id="risultati-locali"></a>

## Local results

`make check` passes **1,278 module tests in 30 suites and two smoke checks**,
plus static checks and ten correctness spikes. Compilation
honors builder warning contract. Independent audit derives
counts/order from frozen Git, associates external/internal records,
checks all **852 path/blob** pairs before/after. System/test
cache contains exactly **335 private FASLs**, read as bytes only.

Coverage uses two processes/two separate caches, each with
same 335 FASLs expected from ASDF components. Names/order of 42
ACTIVE and 42 CLOSED tests match frozen Git. SB-COVER state,
summaries, HTML agree per file; byte/SHA inventories
stable across both passes.

| File in `src/get-resolver/` | Executed/total expressions | Executed/total branches |
|---|---:|---:|
| package.lisp | 0/1 | 0/0 |
| types.lisp | 1/29 | 0/0 |
| rows.lisp | 0/167 | 0/16 |
| read.lisp | 208/265 | 27/40 |
| active-types.lisp | 12/39 | 0/4 |
| active-directory.lisp | 145/161 | 24/28 |
| active-scan.lisp | 186/247 | 19/34 |
| active-build.lisp | 248/274 | 30/36 |
| active-preflight.lisp | 174/193 | 25/26 |
| active-read.lisp | 102/115 | 7/8 |
| **ACTIVE total** | **1076/1491** | **132/192** |

CLOSED process retains **1156/1416 expressions and 131/184 branches**
over seven sources/eight HTML files. ACTIVE retains ten sources/eleven
HTML files. `active-init.lisp` remains outside profile.

Preflight file identical to [first campaign](get-active-verifica.md):
observed branches increase from 16/26 to **25/26**. False OPEN
progress branch remains unreachable under `checked-header` contract,
requiring conforming header and at least 24-byte advancement.
Segment limit tested only on local helper without
constructing artificial 4 GiB file or root.

<a id="mutanti-e-compatibilità-del-driver"></a>

## Mutants and driver compatibility

New `--suite preflight` profile passes all-42-test ACTIVE baseline
and detects **four mutants of four**. Each copy contains
one preregistered preflight replacement and preserves patch,
modified source, driver, configuration, all FASLs used.
Full register stays at 42 names in each of five children;
each mutant runs intended single test already passed in baseline.

| Intentional change | Observed detection |
|---|---|
| Omit file-ID | Assertion in identity test |
| Omit version | Assertion in version test |
| Exclude SEAL from budget | Assertion in byte-boundary test |
| Reject exact record count | `RESOURCE-EXHAUSTED`, exact package and reason `:active-batch-record-budget` |

New profile's **109 operations** terminal and collected, with
six separate namespaces: parent and five children. Synthetic self-tests
check 38 preflight-classifier cases and 30 bootstrap cases.
Data does not establish injection of every possible real timeout.

Default without `--suite` retains baseline of **25 tests and four
detected mutants**. Mutants select that suite and stop at
intended test: actual counts 4, 14, 25, 1 respectively,
in catalog order. Old profile retains cooperative deadline
contract. Final audit checks **3,350 FASLs**, 335 for
each of ten children, stable inventory of 8,079 files.

<a id="conservazione-e-tentativi-degli-helper"></a>

## Preservation and helper attempts

Complete collections separate for
[local checks/audits](https://github.com/gpicchiarelli/ArcDocDB/tree/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-get-active-preflight-core/),
[new profile](https://github.com/gpicchiarelli/ArcDocDB/tree/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-get-active-preflight-mutation/),
and [bootstrap regression](https://github.com/gpicchiarelli/ArcDocDB/tree/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-get-active-preflight-bootstrap/).
Include original output, manifests, configurations, patches, isolated
copies, all caches used, driver operations.
[Preservation audits](https://github.com/gpicchiarelli/ArcDocDB/tree/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-get-active-preflight-audits/)
separately retain contracts, collector sources, commands,
copy-verification results. Copies and entry checks
use at most four workers per invocation, joined before
propagating error. SHAs calculated in batches through frozen
library: every input regular and at most 16 MiB;
bytes, paths, identities rechecked after calculation.

Large-file compression lossless. Compressed indexes
remain readable by repository reader, checking descriptor,
payload, expanded hash. Reports, mutated sources, FASLs are data;
audits do not load them as code.

Both CLI fixtures expected usage errors, exit 2, no campaign
created. Full check also preserves four expected process
errors of snapshot/reading self-tests.
Helper attempts preserved: initial Git-inventory syntax error,
preparatory syntax checks, mutant-audit R1 stopped by destructive
`sort` in verifier. R2 passes checks; R3 corrects bootstrap
count label from selection to actual execution. Product campaigns
remain original unchanged R1 campaigns; helper outcomes retain attribution.
First launch of three collectors stops while reading source due to
missing parenthesis. On second execution, core collection finishes
correctly; mutation/bootstrap collectors interrupted due to individual-digest
cost, native FAILED outcome. Core collection R2 retained.
Complete mutation/bootstrap collections then repeated from same terminal
R1 producers with `collector-batch.lisp` (source `e6b2cdec…`);
final `audit-batch.lisp` (`d17564b3…`) verifies all three
collections. Shared library source `130f4285…`.
Sources, commands, attempts, syntax checks preserved.

Both partial copies from interrupted collectors preserved separately
as **unqualified partials**: two opaque USTAR streams in fifteen
gzip parts, eight mutation and seven bootstrap. Manifest records order,
offsets, sizes, SHAs of parts/reconstructed TARs. Each expanded
part at most 4 MiB, each gzip below 8 MiB. Canonical lists,
bytes/hashes of originals and temporary extracts agree;
complete TARs also compared bytewise and via native SHA,
without applying batched digest's 16 MiB limit. Incomplete reports
not interpreted, FASLs not loaded. Successful-attempt
extracts removed after verification; originals intact.

Previous attempt to produce single gzip stops at
8 MiB limit. Failed oversized payload remains outside published
collection, in staging for later full worktree backup;
source, manifests, attempt logs included. First move
failed before rename due to relative pathname also preserved;
subsequent move uses absolute path and retains SHA,
size, device, inode. These outcomes concern preservation
and do not change product-campaign qualification.

<a id="limiti"></a>

## Limits

Four selected defects and diagnostic coverage do not qualify global
MC/DC or C1. Concurrent stress, interruptions at every phase,
prepared/OUTCOME ACTIVE, concrete index, rotation/reclaim, whole engine remain open.
Campaign measures no throughput, latency, RSS, allocations. Local
numbers belong to stated freeze; CI qualifies its own native commits.
