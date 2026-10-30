<a id="verifica-funzionale-del-get-active-ordinario"></a>

# Functional verification of ordinary GET ACTIVE

Dedicated suite adds **28 named tests**: 12 construction/
preflight, four directory geometry, 12 reading.
Follows [preregistered method](get-active-metodo.md). Format/boundary
iterations remain internal cases within same tests.

[First collection](https://github.com/gpicchiarelli/ArcDocDB/tree/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-get-active/) preserves
commands, outputs, builds, raw coverage state/HTML, process
fixtures, all ten spikes. Its
[copy audits](https://github.com/gpicchiarelli/ArcDocDB/tree/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-get-active-audits/)
separately preserve verifiers, contracts, attempts, results.
[Integrated repetition](https://github.com/gpicchiarelli/ArcDocDB/tree/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-get-active-integration/)
and its
[copy audits](https://github.com/gpicchiarelli/ArcDocDB/tree/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-get-active-integration-audits/)
retain attribution to second freeze. FASLs/reports are data,
never code to load; large-file compression lossless,
preserving expanded-content hash.

<a id="risultati-locali-e-attribuzione"></a>

## Local results and attribution

First freeze `42dcad77530c09784f9d77fabb92ff4477927983` passes
`make check` R2 without warnings: **1,080 module tests in 29 suites and two
smoke checks**. Separate coverage processes run 28 ACTIVE tests
and 42 CLOSED. Positive records exit 0, initially clean working
tree, same **771 path/blob** pairs before/after verified against
commit; inventory excludes `spikes/results/`.

Integration of Serie GET sources with exact main
`64a5ef06987af61c36ce9818eb24ca8f0a0eb7f4` changes ACTIVE wrapper
to delegate to captured-root resolver and adds 27 tests of
another suite. At freeze `e8c88a4cdc697422eb05b0c6a7f79d0ec9480e26`,
full check passes without warnings with **1,107 module tests in
29 suites and two smoke checks**. Both isolated coverage runs again pass 28
ACTIVE and 42 CLOSED tests. Records exit 0 and **781 path/blob** pairs stable,
matching full freeze Git inventory excluding results.
Independent audit derives test names/order/totals from frozen
Git; also checks external-command/internal-record association.
Outcomes belong to respective local freezes, not CI.

Before pull request also integrate exact main
`061e638200f0d97fc2443c7dec38d4362ef274e1`. 18 new worker-pool
tests bring total to **1,125 module tests in 29 suites and two
smoke checks**. Third separate copy passes `make check` at freeze
`ae4022fb66914c53a8f9fba69298e88ce2a35d98`, clean working tree,
exit 0, **807 path/blob** pairs stable/matching frozen Git.
No WARNING/STYLE-WARNING; compiler NOTEs in original
stderr preserved. Independent audit derives counts/order
from sources, associates external/internal records, checks
four expected fixture errors and exact inventory of 314 system/test
FASLs, read only as bytes.

[Final collection](https://github.com/gpicchiarelli/ArcDocDB/tree/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-get-active-final/)
preserves full groups of this check and both local audits;
[copy audits](https://github.com/gpicchiarelli/ArcDocDB/tree/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-get-active-final-audits/)
separate. R1 uses cache-association check based
on directory presence in ASDF argument. R2 strengthens helper
only: reads argument as data with disabled `read-eval` and EOF,
checks exactly two source/destination wildcard pathnames and
exclusion of inherited configuration. Both attempts and sources
preserved; exact-mapping verification belongs
to R2. Ten coverage sources unchanged from `e8c88a4`:
measurements attributed to that freeze, without new execution.

Editorial note on original README preserved in final collection:
645,763 is **character** count of core `:stderr` string,
corresponding to **645,773 UTF-8 bytes**. Original “bytes” label
imprecise; outputs, hashes, outcomes unchanged.

ACTIVE fixtures use real files, v1/v2 headers, frames/CRCs expected
independently of product encoders. Frontiers derive from literal
offsets and batch plan; built map does not supply oracle.
Tests include CSNs beyond low word, ordinary flags 0/4, tombstones,
exact and one-byte-below budgets, root persistence, batch reuse.
Synthetic 65,536-page view verifies search/convergence,
not that many native batches.

Reads enter from `avvia-get` with real snapshots/EBR. Compare
bytes, sentinels, five outcomes, cold/hot cache, page
frontier even after append. Merely planned root does not authorize
read. Inconsistent locations, wrong CSN/size, foreign owner,
closed FD check faults; small buffer, new entry,
expiry after provisional copy, nonlocal exit during pread
check GET/EBR cleanup before external cleanup. Resolve/probe
perform no I/O.

<a id="copertura-diagnostica-isolata"></a>

## Isolated diagnostic coverage

SB-COVER reset after loading, before only 28 ACTIVE
tests. Raw state, summary, HTML counts compared per
source. Profile contains ten files, eleven HTML files including
index. Table belongs to integrated freeze `e8c88a4`.

| File in `src/get-resolver/` | Executed/total expressions | Executed/total branches |
|---|---:|---:|
| package.lisp | 0/1 | 0/0 |
| types.lisp | 1/29 | 0/0 |
| rows.lisp | 0/167 | 0/16 |
| read.lisp | 208/265 | 27/40 |
| active-types.lisp | 12/39 | 0/4 |
| active-directory.lisp | 145/161 | 24/28 |
| active-scan.lisp | 186/247 | 19/34 |
| active-build.lisp | 244/274 | 29/36 |
| active-preflight.lisp | 130/193 | 16/26 |
| active-read.lisp | 102/115 | 7/8 |
| **Total** | **1028/1491 (68.95%)** | **122/192 (63.54%)** |

First freeze had 1001/1459 expressions, 121/190 branches; denominators
belong to respective frozen sources. Zero branches means
zero denominator, no invented percentage. Separate CLOSED
process retains **42 tests** and seven-source/eight-HTML scope:
**1156/1416 expressions (81.64%)**, **131/184 branches (71.20%)**, unchanged
between freezes. [CLOSED verification](get-resolver-verifica.md) describes
its distinct OUTCOME scope.

<a id="tentativi-conservati-e-limiti-delle-prove"></a>

## Preserved attempts and test limits

First `make check` R1 fails at private ASDF cache
configuration using wildcard strings instead of pathnames: no
compilation output or test summaries observed. R2 corrects command
argument only on same
freeze. Failure/separate audit preserved, not
promoted to overall success.

Three initial CLI fixtures end in usage error without creating
report directories. Initial duplicate suite has six arguments,
reaches cardinality guard only. Integrated repetition uses
four arguments, `--suite active --suite active`, verifies specific
duplicate message with exit 1, without requiring report.
Reader/snapshot fixtures retain four expected process errors:
SIGKILL before completion and exit 7 after `COMPLETE`. Not product
failures; audit verifies records/raw output as data.

Failed helper attempts also preserved. First independent
coverage-report verifier has syntax error
before reading evidence:
stdout/stderr available, but initial source not
preserved. Gap neither reconstructed nor described as
complete provenance. Other corrected attempts preserve previous
source and outputs. Initial copy audit R1 exits
0 but emits warning for constant tail passed to `sort`; console
counts also altered by `nreverse`. R2 corrects helper only,
repeats with exit 0, no warnings, stable inventories/SHAs; R1 attempt
preserved.

Independent reading uses `tools/evidence-storage.lisp`, disabled `read-eval`,
one datum followed by EOF. Checks inventories/hashes in
two passes without loading reports/FASLs. Coverage diagnostic:
demonstrates neither MC/DC, C1 qualification, nor mutation results. No
performance/heap/RSS measurement; payloads are geometry calculations.

These 28 ordinary tests do not independently qualify new captured-root
API, prepared/OUTCOME ACTIVE, EDIT, mixed directory,
concurrent publication, atomic concrete index, rotation/reclaim,
multiseries, server. Unexercised decisions, requirements,
C1 qualification, Phase 0 remain open.
