<a id="revisione-indipendente-statica-della-directory-get-closed"></a>

# Independent static review of the CLOSED GET directory

Base: `6eeb501d2eace49fad8e2ec333ed0c6c1386dd6c`. Worktree:
`/Users/gpicchiarelli/.codex/worktrees/get-directory/ArcDocDB`.
Date: October 11, 2026. Only file written by the reviewer: this report.
No product or tool execution, compilation, test, benchmark,
commit, or agent creation. Readings and blob identifiers are
static content observations; they certify no dynamic results.

<a id="esito-e-sequenza-delle-letture"></a>

## Outcome and reading sequence

The first complete reading of product and GET/resolver/IO/EBR dependencies
found no P0/P1/P2 findings on canonical-constructor paths.
The second reading completed immediately on the parent's “canonical
product ready” notification, rereading all four sources. Product blobs
were identical in both readings. The later private-NIL-entry FI case,
requested by the parent, introduces finding GDR-R02 below.

The two initial P2 findings, concerning C4 collection of incomplete raw data and
classification of private-entry corruption, are closed by static
reading of corrections reported by the parent. No P0 or P1
identified in read content. These outcomes are neither C1 qualification,
proof of defect absence, nor performance/allocation measurements.

<a id="rilievi-concreti"></a>

## Concrete findings

<a id="gdr-r01--p2--raw-di-campagne-non-terminali-raccolti-senza-controllo-di-chiusura"></a>

### GDR-R01 — P2 — Nonterminal campaign raw data collected without closure checks

Status: **statically closed** on corrected blob
`086da7ca0d664169bd433a60db943c221f3bb365`.
`publication-raw-roots` selects only the manifest's `:raw-roots`
specifications. Before collecting each root, `raw-root-metadata` requires
schema 1, kind command-verification, terminal status OK/FAILED/SOURCE-CHANGED,
and an integer end timestamp. RUNNING or a missing timestamp stops publish.
Every raw file in the root and every mutated source receives producer, status,
source-consistency, and explicit limits on partial raw data from failed producers,
without promoting the result. Reading of lines 129–201.
The four added self-test checks (lines 235–245) accept terminal OK/FAILED
and reject RUNNING/missing end; `:checks 25` is source
data, not an executed outcome. Correct raw-root/producer association
in the manifest remains to be read when available.

Finding description for previous content:

File: [`tools/get-directory-evidence.lisp`](../../tools/get-directory-evidence.lisp),
lines 144 and 151–166. Blob read:
`09c68723c15f286641d9b24844bfe2f282394db9`.

`publish` excludes a `:running` record from `:entries`, but recursively collects
raw data from all coverage/mutations-prefixed directories
without requiring a terminal report. Mutated-source collection
checks only report and file existence. Final checking
requires at least one completed entry, not closure of raw-data roots.

Concrete scenario: an interrupted mutation process leaves a `:running` report
and some raw data; another execution has a completed record. `publish` can
complete with `:status :ok` and archive that partial raw data without an incompleteness
attribute or mandatory link to a terminal report. Digests and an intact
copy certify retained bytes, not campaign completeness.
The risk concerns reading the catalog as a completed collection; it is
neither a GET defect nor an observed dynamic result.

Proposal: require a terminal report for every raw root to publish,
or explicitly record incomplete roots/raw data and prevent their use
as completed evidence. Preserve failed terminal reports with their
status. The explicit root manifest remains necessary; alone it does not
check report status. The self-test should distinguish a completed
root from a `:running` root with raw data present.

Limit: the logic is inherited from the get-performance collector; this does not claim
that copying partial bytes is inherently impermissible, or that a partial artifact
already exists in this campaign. The reported issue is the static publication
path without completeness classification.

<a id="gdr-r02--p2--entry-privata-nil-produce-type-error-e-contesto-idle"></a>

### GDR-R02 — P2 — Private NIL entry produces TYPE-ERROR and IDLE context

Status: **statically closed** on corrected blob
`b0e40d9ff3f504130aaf1e083a633dee9b146d29`.
`read:23–26` reads the entry, checks TYPEP before return, and calls
`guasto-get :directory-shape` for an impossible type. Context enters
FAULTED before the condition; wrapper unwind-protect releases EBR and
`abbandona-get` preserves FAULTED. The guard adds only the selector
invariant and changes neither search, ownership, nor resolver delegation.
Complete path and cleanup reread; no execution.

Finding description for previous content:

File: [`src/get-directory/read.lisp`](../../src/get-directory/read.lisp),
lines 23–24 and 35–46. Blob read:
`a6e13ce6f1b3f5aa23f479de2efbcdab78cf5f0f`.
Cleanup dependency: [`src/get/lifecycle.lisp`](../../src/get/lifecycle.lisp),
blob `23f16c3039b71be0bd46d6bf92f05791e444683e`.

If FI replaces the private entry associated with the found ID with NIL,
`(the mappa-segmento-get (svref maps middle))` raises TYPE-ERROR with safety 3.
Geometry checking has already accepted equal lengths. Context is
still CANDIDATE: `abbandona-get` releases EBR and, without preexisting
FAULTED, returns it to IDLE. Internal corruption therefore does not take the
terminal-failure branch already provided for impossible geometry or missing IDs.

Proposal: read the entry, check `typep` for `mappa-segmento-get`, and
call `guasto-get context :directory-shape` before return if the type
is impossible. Cleanup then preserves FAULTED. This is a local selector-invariant
check without duplicating CSN, size, FD, or proofs.

Limit: NIL cannot be produced through the canonical constructor with stable
input. Current copying prevents input reuse from altering the private
entry. A mutant removing the copy can instead expose this path.
The guard improves classification under FI/alias regression; it neither
replaces copying nor checks identity of a correctly typed map.
No value is authorized by the existing TYPE-ERROR path.

<a id="checklist-c1--due-letture-statiche"></a>

## C1 checklist — two static readings

“Read” indicates source checking and branch reasoning, not a passed
test or measured coverage. References and line numbers are those of the
blobs listed in this report.

The checklist preserves both initial readings of previous blobs. The
rereading after R02 correction also confirms the new entry-type
invariant; the other three product sources have identical blobs.

| Check | First reading | Second reading | Static evidence and limit |
|---|---|---|---|
| View identity | Read | Read | `build:30–31`, `read:39–40`: EQ of canonical view; equal identity bytes do not make two views interchangeable. |
| Integer u32 ID, high zero and low positive | Read | Read | `build:23–38`, segment u32 slot: zero and nonzero high rejected; `#xffffffff` representable without truncation. GDR-D02. |
| u64 candidate location and selector FTYPE | Read | Read | `read:7–8,41–43`; GET content is a u64 array. `ldb (byte 32 32)` extracts every ID bit without narrowing location to u32. |
| Strictly increasing order and duplicates | Read | Read | `build:37,49–56`: previous u32, initial ID zero; duplicates and inversions rejected. No implicit sorting. |
| Array copies and ownership | Read | Read | `build:51–56`: new u32 array and simple-vector copy; immutable maps shared by reference. No exported array accessor. |
| Budget before arrays | Read | Read | `build:12–20,48–52`: shape, M in 1…65,536 and B index, count and 12N before copies; then full map verification. GDR-D01. |
| Zero, maximum and payload | Read | Read | N=0 allowed with positive M and B=0; N=65,536 requires 786,432 bytes logical SBCL64 payload. Excludes input, maps, headers, GC, and old roots. |
| Search at most 17 probes | Read | Read | `read:13–25`: half-open interval, maximum 65,536; first/last/missing/extreme ID considered. GDR-D04. Detailed argument below. |
| No false ABSENT | Read | Read | Empty, impossible geometry, and missing ID call `guasto-get`; no translation into absent document. Impossible entry type: finding GDR-R02. |
| EBR precondition and cleanup | Read | Read | `read:35` precedes unwind-protect; after acceptance, view and lookup errors abandon GET. Wrong API order does not acquire another task's cleanup. External cleanup remains necessary before AVVIA-GET. |
| Map selection and delegated checks | Read | Read | `trova-mappa` returns a map; the three wrappers call resolver/GET, which recheck offset, size, CSN, flags, frontier, FD, and, when required, CRC/key/OUTCOME. Selection does not authorize a response. |
| Read-only/open FD and lifetime | Read | Read | `build:34–36`, resolver read: current state rechecked; GDR-D03. Lisp capability neither authorizes close/reclamation nor demonstrates physical identity or quiescence. |
| CLOSED source and frontier | Read | Read | Resolver build: CLOSED manifest, valid-bytes frontier; header/body from same FD. Directory derives no limit from EOF, cache, H, or hint. |
| Heap and I/O | Read | Read | Selector contains no explicit array allocation or I/O; delegated probe without I/O, delegated read in I/O pool. u64 FTYPE does not demonstrate absence of boxing or actual heap. |
| Migration and private response | Read | Read | New AVVIA-GET and acquisition after migration; private copying and completion with fresh time remain mandatory. No pin or location retained in queue. |
| Integrated ASD and coverage scope | Read in integrated state | Read | Module after get-resolver; scope of three files types/build/read. Presence of scope does not certify coverage or test success. |

<a id="argomento-statico-del-limite-di-ricerca"></a>

### Static search-bound argument

For an interval of width N, `middle = left + floor(N/2)` is internal
when N>0. After an unsuccessful probe, the left half has at most
`floor(N/2)` elements and the right half `N-floor(N/2)-1`.

With N=65,536, search for the first element visits indices
32,768, 16,384, 8,192, …, 2, 1, 0: seventeen probes, with return allowed
even on the last iteration. The last element requires sixteen probes.
An ID below minimum follows the first path and ends in failure; above
maximum it exhausts the interval before another read. Internal misses
exhaust within the same bound; an empty array fails
before AREF. Maximum positive ID `#xffffffff` is compared as exact
u32 and follows its position's path without wrap or alias.
The limit concerns pivot probes; COND uses relations `<` and `>`.
It is not an instruction, latency, or allocation measurement.

<a id="c4-disponibile-e-lavoro-non-ancora-leggibile"></a>

## Available C4 and work not yet readable

Contract, preregistration, and C4 collector read. Static comparison with
get-performance-evidence shows adaptations of names, prefixes, scope,
campaign, and temporary name; dynamic qualification is not assumed transferred.
The collector verifies copies/digests and lossless gzip; it preserves completed
record statuses and checks HTML links. The self-test contains positive
and negative checks of copies, digests, compression, selector, and links.
Raw collection has limit GDR-R01. Manifest `publication-roots.lisp`
is required before publish; its future presence is not certified here.

At this reading's close, complete get-directory benchmark/method/mutation files
are unavailable for assessment. Clocks and temporal regression,
raw interrupted-window data, global heap and its oracle,
fixed/nonadaptive counts, positive/negative sensor checks,
and thread timeouts/joins therefore remain unassessed. Neither a defect nor a positive
outcome is assigned without code. Any update depends on
new messages before freeze; after freeze and during verification,
the reviewer neither writes nor runs tools.

<a id="identificatori-del-contenuto-letto"></a>

## Identifiers of content read

| File | Blob |
|---|---|
| `src/get-directory/package.lisp` | `951e5efdd1977c18a5bd90a1e4b3199d60e92d38` |
| `src/get-directory/types.lisp` | `ec99839d234468298b553e331873a320c8ece53f` |
| `src/get-directory/build.lisp` | `f1a1a37ccd59a81e7ff91fcb36009d5953d7edd5` |
| `src/get-directory/read.lisp` | `a6e13ce6f1b3f5aa23f479de2efbcdab78cf5f0f` |
| `src/get/types.lisp` | `032ad088b19ec3498a7c80a5e4b96d7777257dad` |
| `src/get/build.lisp` | `cb426426eac6e923224bc57c1dd602405f4bc040` |
| `src/get/lifecycle.lisp` | `23f16c3039b71be0bd46d6bf92f05791e444683e` |
| `src/get/lookup.lisp` | `5a105a141b43f5585f8e79c2965d59e96cd35ac6` |
| `src/get/target.lisp` | `c9b8488d0a1aa7643a6ab1570765ec870aa7c9e4` |
| `src/get/segment.lisp` | `cf168c44bfe5aedd2e34180ce4f766a6a89500a7` |
| `src/get-resolver/types.lisp` | `b6a50c95567f302f84000471197ca4f9bc7e5be8` |
| `src/get-resolver/build.lisp` | `4c0deb7ca308c4fd617a585ac174f8d3d344b670` |
| `src/get-resolver/read.lisp` | `e12dfbef734622173bb2a44a317c527f0827461d` |
| `src/read/core.lisp` | `132e44c138e209d3f8840b098cca0424853d09c3` |
| `src/read/task.lisp` | `b3601060197a27c6e8a2aaee22b5576c6b0c6e5a` |
| `src/epochs/read.lisp` | `a3dfde4a4780554b88e6e037ab4f70731f9c884a` |
| `src/epochs/reclaim.lisp` | `57235763cf556ecd7633a0052f265ce3eb2b0462` |
| `src/io/types.lisp` | `b496c1df87108127da568a1fb7b0fd32856afcc5` |
| `src/io/lifecycle.lisp` | `0b93448ffe9c6dd4f3a0a2f3f35d5cd656700bd7` |
| `src/io/transfer.lisp` | `93acbd608b1af475aa505a6a7dedceb3b15e8d4b` |
| `arcdocdb.asd` | `c4d066a48bf840d841bad9f1e92e534dcded7985` |
| `tools/foundation-coverage.lisp` | `6e6eccefd5fad1786d555fa2060d4660f8c4e725` |
| `tools/get-directory-evidence.lisp` | `09c68723c15f286641d9b24844bfe2f282394db9` |
| `docs/implementazione/get-directory.md` | `cf00b52a7dd8be53fd49ebafb320000978faa7e8` |
| `spikes/results/2026-10-11-get-directory/README.md` | `2768e28d64c35853d0cbeac5d57f9d39a0a609ed` |

Root publication, source reachability for already admitted readers,
and FD retention until reclamation are controller preconditions,
explicit in the CLOSED contract. This directory adds no
publication cell. ACTIVE/controller integrations developed
elsewhere are neither duplicated nor modified by this review.

<a id="chiusura-dellautore-prima-del-congelamento"></a>

## Author closure before freeze

This section is written by the author, not the independent reviewer.
The reviewer was closed before executions after two C1 readings and
static rereading of R01/R02 corrections already preserved above.
The later request to extend C4 reading produced no conclusive
handoff: benchmark and mutations do not receive complete independent
review from this report. Their method was read by the author;
dynamic checks and sensors remain to be run and recorded.

Integration includes `main` through `7568456`, functional GET, ordinary ACTIVE
resolver, and worker routing. ASDF and coverage conflicts preserve both
paths and respective scopes. Directory product retains the four files
listed above, with the R02 guard. Benchmark fixtures are sequential,
with at most 64 live read-only FDs; counts remain fixed at 80/240
serial/parallel windows. The location mutant preserves failure in
the empty case and alters only nonempty directories.

The correction in `get-resolver/build.lisp` compares the `leggi-esatto` return with END,
under `io/transfer.lisp`'s contract, rather than
END−64. The new real-file regression checks return, region,
sentinels, and I/O observation. It was not run before freeze.
Subsequent results qualify only content actually
recorded in respective commands; no overall C1 qualification
is assigned to this increment.
