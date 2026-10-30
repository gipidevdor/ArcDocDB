<a id="get-revisione-indipendente-statica-del-codice-e-delle-misure"></a>

# GET: independent static review of code and measurements

Date: 2026-10-11. Checkout examined:
`/Users/gpicchiarelli/.codex/worktrees/get-verificato/ArcDocDB`.
Product baseline: commit `65972a4e6e84bd4c31d1d654c9a9a29bf6c44eb0`.

This review covers `src/get` and its interactions with read, cache, index,
I/O, records, snapshots, and epochs. It includes reading tools from
campaign `2026-10-11-get-performance` available during examination.
The other session's functional GET suite remains outside this review's
writing activity.

Only sources, documentation, Git metadata,
and already preserved disassembly were read. No compilation, Lisp execution,
suite, benchmark, or dynamic verification. No product or tool
modification, no commit, no other agent. The only file written by this
review is this report. Concurrent tool changes are
attributed to their respective activities without altering them.

<a id="esito-della-revisione-attuale-prima-delle-prove-del-padre"></a>

## Current review outcome, before the parent's tests

No statically demonstrable P0/P1 defects emerged in the examined GET
path. This outcome certifies neither C1 qualification nor absence of concurrent
defects. The C4 selector P2 defect (R1) is statically corrected.
R2 is closed as scope clarified by the parent: the complete oracle intentionally
belongs inside the window. One P2 driver finding remains: lost metrics
from a failed self-test (R3). The cache P2 defect reported
by the parent is statically confirmed: a rejected/disabled tag hides a valid
reinserted copy (R4). Fallback preserves the GET value but repeats misses and I/O.
PEF-01–PEF-03 are cost observations without bug severity.

Benchmark and method reading is complete on variants
`e3d41cac51ab5f060d2a8a9c4f3bb4cf3f17387d` /
`78647ca7a9013d10456219e154a2fa4928ba5e1a`.
The V16 correction to both opens is present. Measurement scope
matches the parent's explicit decision, including the per-loop oracle;
preservation of negative self-test evidence requires fix R3 before
benchmark qualification. This report closes the current review to allow the
parent to freeze and record baseline reproduction; it does not close
subsequent review of the cache fix. No report writing
during the parent's tests; resumed only on request.

<a id="r1--p2-corretto-staticamente-selettore-delle-evidenze"></a>

## R1 — P2 statically corrected: evidence selector

**Source:** [tools/get-performance-evidence.lisp](../../tools/get-performance-evidence.lisp),
lines 115–131; blob of examined bytes
`6e298625a54a18fcc7337df8a4d8dc5dc3a2a86c`.

`publish` accepts all directories in `spikes/out/` whose name contains
`-command-` or `-check-`. Neither branch requires prefix
`get-performance`. For example, directory `reader-command-final/` with a
completed schema 1 `report.lisp` is accepted by the same predicate as GET
commands. The resulting catalog is labeled `:scope :get-performance` at
lines 150–152, and counts include that record too.

Preserving bytes and `:source` allows origin reconstruction,
but does not make attribution to campaign scope correct.
With shared working directories or leftovers from another session,
publication can contaminate the baseline evidence inventory.
No contaminated catalog was observed: `spikes/out/` was absent
at inspection time. The defect is in the predicate and the counterexample
is deduced from code without execution.

The parent confirmed `spikes/out/` starts empty and isolated: there is no
observed contamination. They specified a pre-freeze correction with a
closed argv allowlist, distinction between GET reports and repository C4
checks, explicit per-entry scope, and positive/negative selector cases.
The corrected variant was subsequently read with blob
`f098cdb4cf5f0447365cf0bf255e1935d04bc53b`: predicate
`publication-directory-p` (`:111–115`) admits GET-owned prefixes or exact
manifest names. `publication-roots` (`:116–128`) checks schema,
uniqueness, count, and simple names without slashes. `publish` uses that predicate
and adds per-entry scope (`:136–150`); the self-test includes foreign
name `reader-command-final`, an unlisted check, and an explicitly listed common
name (`:199–207`). The original counterexample is no longer admitted by
the predicate when absent from the manifest.

**Status:** the selector defect is statically corrected. Neither self-test
nor publication was run by this review. The actual manifest
was not yet available: attribution of owned runs and scope of common
reports remain to be compared with that file when present.

**Correction proposed to the parent:** apply an exclusive
`get-performance-` prefix to commands/checks too, or an explicit list of
allowed common commands with separate attribution. Preserve any attempts
already produced; change selector before using the catalog to
describe completed scope. No correction applied here.

<a id="r2--chiuso-scope-delloracolo-confermato-dal-padre"></a>

## R2 — closed: parent confirmed oracle scope

**Source:** `tools/get-performance-bench.lisp:192–250`, blob
`e3d41cac51ab5f060d2a8a9c4f3bb4cf3f17387d`;
`docs/implementazione/get-performance-metodo.md:99–113`, blob
`78647ca7a9013d10456219e154a2fa4928ba5e1a`.

`make-cycle` fills the response with sentinels and checks every byte,
summing the checksum, before returning to the measured loop. `observe` wraps
that loop: O(V) cost, clocks, states, sentinels, and checksum are included in both
time and global heap. The previous request for an out-of-window oracle
had produced a conformance finding, communicated before freeze.
The parent explicitly corrected it: the in-window oracle is
intentional and the current method is confirmed. R2 is therefore not an open bug.
Measurements describe the verified GET cycle with its full checking;
they do not isolate primitive cost or database throughput.

<a id="r3--p2-aperto-perdita-delle-metriche-di-un-self-test-fallito"></a>

## R3 — P2 open: lost metrics from a failed self-test

**Source:** `tools/get-performance-bench.lisp:509–523,622–623`, blob
`e3d41cac51ab5f060d2a8a9c4f3bb4cf3f17387d`;
preservation promise in `get-performance-metodo.md:152–168`.

`product-self-test` accumulates metrics in a local list. It writes
`self-test-metrics.lisp` only after all cases and returns the summary
assigned to `report :self-test` only on normal return. If `run-loop`
records a GET error, `run-window` can produce a `:failed` metric with
partial count, checksum, and original diagnostics. Subsequent
`validate-window` instead raises generic “incomplete window or inconsistent
metrics”: control exits before writing and assigning to the
report. The local list, including failed window, is lost.

The process retains a failed report/exit 1 but loses the self-test's
original counters and GET error. Branch `run-bench:588–590` instead retains
the metric in the report before validation; the defect concerns
preliminary self-verification, also run by `--bench`.

**Required correction:** make self-test metrics already owned by the
report or persistable on unwind before validation;
retain failed status, coordinates, counters, and window diagnostics.
Do not consume nonquiescent worker raw data/output to fill the report.
The parent accepted R3 and specifies the fix before benchmark qualification.
Fix and evidence will be reread on resumption; no change here.

<a id="r4--p2-aperto-un-tag-cache-scartato-nasconde-la-copia-riparata"></a>

## R4 — P2 open: a discarded cache tag hides the repaired copy

Defect reported by the test agent through the parent and verified here
statically against the product baseline.

**Sources:** `src/cache/read.lisp:62–65,84–96`, blob
`1b2e5eb00fe15187b74fe0fb87ebd43a3c8fb726`;
`src/cache/clock.lisp:12–20,40–49`, blob
`5aca4d48de7bf0d849eafe87ae89f6e7800282d8`;
`src/cache/write.lisp:49–56`, blob
`bcd7de80241f809dcfce472741f120a61ac787b4`.

Counterexample without concurrency: the first copy occupies slot 0 and the
CLOCK hand has advanced to 1. CRC verification fails and marks slot 0 rejected.
Fallback reads the valid PUT from file. `gia-in-cache-p` ignores the rejected
copy and insertion may choose empty slot 1, retaining the old
tag in slot 0. At the next GET, `cerca-record-cache` sees that tag first:
it calls `copia-posto-cache`, which rejects the rejected slot, and immediately
returns `:miss`. It never reaches the valid copy in slot 1. Subsequent
reinsertion may return `:present`, since the writer already sees
the valid copy: misses and file rereads continue. A disabled tag
preceding a valid copy causes the same shadowing.

This is an accelerator defect affecting reachability of the repaired copy,
not a trustcontroller requirement. It authorizes no corrupt bytes: the reader
returns a zero range and GET uses verified fallback. It nevertheless has concrete
cost in repeated I/O and CRC and prevents the expected subsequent hit.

**Parent's proposal, not yet applied in examined bytes:** filter
disabled/rejected before `tag-cache-p`, retaining complete checks
in `copia-posto-cache`. Statically, the proposal preserves the eight-tag
bound, one copy/verification, and no waits/retries. Preliminary filtering
does not authorize a hit: copying must still check even sequence,
credit, rejection bit, tag, and stable sequence, then CRC/key/CSN/proof.
Conservative bit reading may lose a hit; it does not replace
seqlock or record proof. The first `:verify-failed` still requires
fallback and an alert: filtering concerns already discarded slots.

**Schema and decisions:** no change needed to tag layout, v1/v2
record, or cache outcome shape. In
`docs/implementazione/cache-record.md:187–197`, the case falls under CCH-D04
(readable slot), CCH-D07 (victim/reinsertion), and CCH-D09
(discarding copy without quarantining file). Correction must retain
CCH-D05 and CCH-D06, including prepared proof and final seqlock check.
Review of the actual patch remains separate from this assessment
of the proposal.

**Reproduction prepared by the parent:**
`tests/get-performance/guards.lisp:137–157`, blob
`9bbf7b2ceb817d6ecf2e7c67b0928373c2c07f70`, checks v1/v2,
fallback/reinsertion, then hit without pread, and a second disabled case.
No execution or result attributed here; the parent first records baseline
failure and then the fix. Product sources were still unchanged
at the last reading.

<a id="lettura-del-percorso-get"></a>

## GET path reading

| Area | Localized evidence | Outcome and limit |
|---|---|---|
| Admission | `src/get/lookup.lisp:32–60`; `src/read/task.lisp:24–42` | Initial state and canonical scope checked before startup. Unconfirmed EBR entry returns `:retry` with cleanup. Hash and lookup are inside abandonment boundary. |
| Snapshot | `src/get/lookup.lisp:13–20`; `src/read/task.lisp:61–77`; `src/mvcc/snapshots-read.lisp:25–74` | Current CSN above `s` and primary miss under snapshot become `:history-required`. Value result requires copying and final snapshot check with fresh time. Historical resolver remains a declared integration. |
| Source | `src/get/build.lisp:38–55`; `src/get/target.lisp:13–32` | Header read from capability file and compared with expected Serie and ID. Target must belong to same view and lie within resolver-supplied committed prefix. No conversion of file size into commit proof. |
| Prepared | `src/get/segment.lisp:12–42,104–121`; `src/foundation/record.lisp:269–283,306–325` | Required offset, prefix, and nonoverlap checked. OUTCOME read from same file and verified before cache; common verifier compares TXID and CSN. A prepared record is not authorized merely because CRC is valid. |
| Cache | `src/get/target.lisp:39–53,79–90`; `src/cache/read.lisp:53–65,80–96`; `src/get/segment.lisp:111–122` | Only a verified hit sets range. `:verify-failed` allows segment fallback. File-read proof is verified outside the handler converting corrupt cache-copy data into a miss. |
| Exact I/O | `src/io/transfer.lisp:32–52`; `src/get/segment.lisp:33–35,53–55` | GET passes ranges with start zero, consistent with `leggi-esatto`'s END return. Short I/O is completed; EOF/error propagates without authorizing partial bytes. GET adds no error retry. |
| Copy and acknowledgment | `src/get/lifecycle.lisp:46–69,75–94` | Output distinct from scratch and key; capacity checked before addition. `:copied` remains provisional. `concludi-lettura` precedes returning result, and GET cleanup precedes returning to caller. |
| Cleanup | `src/get/lifecycle.lisp:28–42`; `src/read/core.lisp:53–66`; `src/epochs/read.lisp:31–44,48–58` | Cleanup first marks `:faulted`, releases pin, and clears range/references; an already faulted context remains terminal. No ordinary admitted-error branch found bypassing external cleanup boundary. |

`copia-candidato-get` (`src/get/lookup.lisp:64–72`) copies without its own
`unwind-protect`. A nonlocal exit during this phase is covered
by external task cleanup, which the contract requires installing
before `avvia-get`. Under that contract it is not reported as a pin leak.
Likewise, rejecting invalid API order before acquiring the operation
must not automatically become abandonment of another caller's active
task. The driver must respect context ownership
and discard any response after unwind.

<a id="confini-u64-e-packedword"></a>

## u64 and packed-word boundaries

- CSN and snapshot limit remain u64 words in scratch. Comparison
  `CSN <= s` is declared u64 in `src/get/lookup.lisp:15–18`. Already preserved
  ARM64 disassembly shows word loads and unsigned comparison with `BHI`,
  at lines 2511–2524 of
  [disassemblato-hash-archive.lisp](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-get-record/disassemblato-hash-archive.lisp).
  This supports that comparison, not allocation absence across all of GET.
- `location` encodes high u32 segment ID and low u32 offset. Check
  `segmento-get-high = 0` in `src/get/target.lisp:21–24` rejects an unrepresentable
  u64 storage capability even if its low word matches.
  This is a declared v2 layout limit, not silent truncation.
- The length word has its high half reserved as zero:
  `src/index/validation.lisp:19–27,31–36`. The reader validates fields after
  seqlock confirmation (`src/index/read.lisp:25–33`). Therefore buffer comparisons
  with the entire word in `src/get/target.lisp:82` and
  `src/get/segment.lisp:105` are consistent with the admitted candidate.
- PUT end and OUTCOME end are sums of u32s and format-bounded
  sizes, within fixnum on planned platforms. They are not reduced
  modulo 2^32. The GET/storage limit is `#xffffffff`, consistent with the slot;
  the cache API's more permissive `#x100000000` limit does not expand this
  check. v1/v2 limits derive from capability version.
- Record-read CSN/TXID comparisons use two u32s in
  `src/get/segment.lisp:38–41,57–61` and
  `src/foundation/record.lisp:269–283,306–325`; they do not pass through
  `verifica-record`, the inspection API returning a Lisp u64 stamp.
- Output capacity is checked by subtraction before constructing END
  (`src/get/lifecycle.lisp:60–66`). No overflow or range authorized beyond
  buffer was found for input respecting API types.

<a id="requisiti-trustcontroller-distinti-dai-bug"></a>

## Trustcontroller requirements, distinct from bugs

| Guarantee entrusted to controller/driver | Reference | Why it is not a demonstrated GET bug |
|---|---|---|
| One canonical scope and EBR/snapshot registries of the same Archivio; exclusive worker IDs | `src/get/types.lisp:14–19`; `src/get/build.lisp:20–34`; `src/read/types.lisp:27–33` | Registries carry no common identity verifiable by the module. Runtime check compares the already built scope; it cannot certify a wrong original configuration. |
| Index, cache and identity belonging to same Serie | `src/get/types.lisp:23–30`; `src/get/build.lisp:9–14` | Index has no storage identity to compare. Initial binding is an explicit precondition, distinct from segment-capability checks. |
| Publication only of visible commits, committed prefix, record flags and OUTCOME membership in published batch | `src/get/lookup.lisp:1`; `src/get/target.lisp:1–12`; `src/get/segment.lisp:8–11`; `docs/implementazione/get-record.md:100–118` | CRC, header and range do not certify a committed batch. GET checks consistency, identity and bytes from an authoritative target. Producing that target remains to be integrated. |
| Live files/bindings and immutable prefix bytes until EBR reclamation | `src/get/types.lisp:33–43`; `src/io/types.lisp:28–40` | Lisp capability does not prevent concurrent close or external modification. File lifetime belongs to owner; GET neither opens nor closes it. |
| Fresh monotonic clock; private output until completion; cleanup before migration; I/O pool | `src/get/lifecycle.lisp:46–49,75–78`; `src/read/task.lisp:62–76`; `docs/implementazione/get-record.md:55–80,133–138` | Time regression is detectable, but a stale increasing timestamp is not. GET exposes neither network response nor scheduler: driver must deliver only after normal return and migrate original request. |

The current absence of historical resolver, EDIT/manifest proof, scheduler, and
metrics is an already declared integration limit. It is not confused with
a wrong value returned by the currently implemented subset.

<a id="costi-evidenti-da-attribuire-nelle-misure"></a>

## Evident costs to attribute in measurements

**PEF-01 — repeated PUT verification even before an insertion that may
give up.** In segment branch `src/get/segment.lisp:118–120`,
`leggi-put-get` verifies PUT and `inserisci-cache-get` calls the public
cache API. `src/cache/write.lisp:72–79` verifies all bytes again before
trying the mutex or checking slot presence/availability. With a selectable
cache class, therefore, even `:busy`, `:present`, and `:unavailable`
pay for the second CRC/key scan. This is concrete O(record-bytes) cost,
already partly declared in documentation, not a correctness bug.
A segment-branch measurement with cache disabled excludes this cost.
The parent may assess optimization only after baseline, preserving
the cache API verification contract.

**PEF-02 — repeated prepared-proof verification.**
`leggi-prova-get` verifies the OUTCOME frame before cache.
`verifica-put-parole` verifies it again when comparing TXID and CSN.
On miss with insertion into a cache class, the cache verifier checks it
a third time. The proof is a fixed 32 bytes: cost is bounded,
but prepared-hit measurement includes at least one OUTCOME I/O and two proof
verifications. It cannot be described as a hit without I/O or equated with
prepared access using a cached certificate, which this API does not implement.

**PEF-03 — path scope and driver u64.**
Compute → I/O migration reruns admission, key hash, lookup, and
resolver. A cycle calling `leggi-record-get` directly after one
`avvia-get` measures the I/O-pool task; it does not measure the driver's
planned migration cost. Also, `avvia-get` receives generation and
NOW as Lisp u64 values, while candidate/limit CSN stays in
arrays. Extracting a word beyond fixnum to pass as an argument to a
non-inline function may materialize a bignum in the caller. Distinguish
values already prepared outside measurement from repeated boxing inside the
window without automatically attributing either to the GET kernel.

No new explicit per-request allocation was found in
`src/get`; visible allocations are in construction of views,
capabilities, and contexts. Previous absence of `ALLOC-TRAMP` in twelve
disassemblies does not cover every called function or
`copia-candidato-get`/generic `replace` copying. Full-u64 zero-heap outcome
remains to be measured; static reading does not anticipate it.

<a id="attendibilità-del-benchmark-esame-statico-completato"></a>

## Benchmark reliability: static examination complete

The independent tool and method were read in full. Final identities
for this reading are respectively
`e3d41cac51ab5f060d2a8a9c4f3bb4cf3f17387d` and
`78647ca7a9013d10456219e154a2fa4928ba5e1a`.
The driver neither loads the complementary suite nor uses its I/O observer.

| Boundary examined | Tool source | Static outcome |
|---|---|---|
| V16 opens | `:123–125,160–166`; `src/io/transfer.lisp:12–15`; `src/get/build.lisp:46–47` | Parent-reported correction present in both: `max(64, record-size)`. With V16 PUT is 56 B but header is 64 B; previous limit 56 would have stopped setup before GETs. |
| Cache population | `:154–158`; `src/cache/write.lisp:15–17,37,49–56` | `:inserted`, evicted NIL and scan NIL correct for eight initially empty slots. The two returned events are Booleans, not counts. |
| Loop outcomes | `:213–240` | Requires candidate/absent, hit/disabled, segment source, unattempted insertion, copy length and completion, IDLE/free EBR and complete response. Errors do not become retries or completed GETs. |
| Counters | `:244–250,277–330` | Preallocated raw data; completed/checksum updated after normal return and cycle cleanup. Totals and every worker must equal COUNT and expected checksum; no bytes/op rounding or baseline subtraction. |
| Heap and time | `:254–261,350–353,388–395` | Two global heap reads by main, raw ticks, metadata/rates outside window. Explicit GC before, automatic GC included. Declared tick-start/heap-start/heap-end/tick-end order. |
| Parallel | `:354–387` | Cold closures/semaphores/raw data/names; thread creation, gate, loops and joins inside same global window. Warmup on main, without runtime warmup of new threads. Heap not attributed per worker. |
| Quiescence and ownership | `:180–185,336–346,393–395`; `tests/get-performance/threads.lisp:78–82` | Controller consumes raw data after joins and live-thread check; FD not closed if a worker remains alive. Suite also avoids close when stop/join fails. No controller observation of buffers during parallel loop. |
| Negative/zero ticks | `:469–507,608–614` | Missing/negative fields, corrupt workers, inconsistent rate, missing/different schema and failed/exit 1 boundary explicitly checked. Zero ticks give NIL rate and below-resolution quality. `--negative-fixture` retains metric without completed and requires failure. |
| Matrix and preservation | `:545–593` | Fixed COUNT 20,000, 5 replicates, serial 90 and parallel 270 windows, exact coordinates without duplicates; campaigns retain metric before validation. R3 bounds preliminary self-test exception. |
| Sensor | `:441–467` | Empty control 20,000 cycles and positive control with four retained 1 MiB u8 arrays; delta at least 4 MiB, no subtraction or zero-heap gate on GETs. Positive control does not certify sensitivity to small allocations or every runtime boundary. |
| Persistence/schema | `:398–419,578–580,640–647` | Schema 1, kind and status required for every leaf; UTF-8 budget <1 MiB, reread as data and equality. Exit 0 requires validated, persisted positive report; R3 remains a prequalification requirement. |

<a id="full-u64-e-limiti-della-conclusione"></a>

### Full u64 and limits of the conclusion

Maximum `#xffffffffffffffff` is written into the record through two u32s and
published in the u64 array (`:97–98,138–147`). Within the loop, the driver does not extract
that CSN into a generic Lisp value: it passes generation zero and fresh clock;
the GET verifier receives the candidate's two words. The maximum profile
therefore traverses the current path. It does not cover snapshots, prepared TXIDs,
generation/NOW beyond fixnum, or storage IDs beyond u32, excluded by the method.
No zero-heap result is anticipated from raw-data typing or
absence of explicit driver boxing.

The window includes sentinel fill, full O(V) oracle, checksum,
clock per GET, states, cleanup, and counters, as parent confirmed in R2.
In parallel it includes startup and joins: aggregate rate does not measure a persistent
pool. Small files and warmed page cache do not qualify NVMe,
latency/P99, or DB throughput. The segment case disables cache,
excluding PEF-01; prepared records and migration are excluded. Five replicates and
global deltas do not allow component-specific allocation attribution.
These boundaries are explicit in method and report `:limits`.

<a id="pubblicazione-c4-e-responsabilità-del-padre"></a>

### C4 publication and parent responsibility

R1 is corrected in collector blob
`f098cdb4cf5f0447365cf0bf255e1935d04bc53b`: all three benchmark/self-test
leaves are selectable; common records require an exact name in the data
manifest and receive scope `:explicit-command-or-repository-check` if the name
contains `-command-`/`-check-`. They are not isolated GET product tests.
The self-test contains positive name, negative foreign prefix, and negative common
unlisted name. The manifest is preserved in the catalog with raw digest.

At the last reading, `publication-roots.lisp` was absent: future run names/argv
are not certified. The parent owns generation from actually
owned and completed runs, with allowlist of get-performance tools,
get-performance coverage scope, and explicitly attributed make check-core/global C4
checks. The collector checks manifest schema and names,
not ownership or argv semantics. This is a campaign-controller
guarantee, distinct from the already corrected selector defect.
SPK/repo-check remain repository evidence with explicit scope.
`record-command.lisp:80–99` retains argv and source comparison before/after:
`source-consistency :stable` and actual blobs must be read in parent-recorded
evidence, without this review executing anything.

<a id="fixture-complementare-disponibile-durante-la-revisione"></a>

### Complementary fixture available during review

Variant of `tests/get-performance/support.lisp` with blob
`a92bf7f3161f611db32272a03018cf63214d9954` was read. Independent byte/CRC
construction occurs in setup (`:61–96,168–259`) before measurement. The observed
backend (`:102–110`) uses mutex and lists for every pread: benchmark must
select `:observe-io-p nil`, as the fixture contract requires.
`performance-checked-get` (`:300–340`) is explicitly a correctness
driver: it allocates candidate scratch and outcome lists and executes
oracles. It is not a zero-heap measurement kernel.

The fixture allows CSNs through `#xffffffffffffffff`, keeps snapshot
generation and NOW separate from CSN, and uses controlled clock 10/11/12. A
measurement reusing it must declare that artificial clock, single
document/segment, and absence of prepared records in the currently read fixture.
No heap result is inferred from fixture alone; the independent benchmark
driver is examined separately above.

A later support variant was also read,
`f7eac312809b34fa72dcd3b9a8b67d290cb08cd6`, adding terminal-state
checking and `:cache-record` path, with `paths.lisp`
(`160dae42a9723e9b0e93a085864affa96a4cd6be`) and `guards.lisp`
(`76157fb9424d4cf47847f2cec10c5bbcb977246b`). Full-u64 checks also compare
a stamp differing at bits 0/63 with valid CRCs. Numeric snapshot
checking is performed after GET by the correctness driver, as the
source declares; it is not evidence of performance-cycle allocations.
The cache-repair test variant is localized in R4. The suite
remains complementary to the other session's functional campaign.

<a id="identità-dei-sorgenti-esaminati"></a>

## Identity of examined sources

Table blobs identify bytes in Git without writing
objects (`hash-object` without `-w` for working files). The product was
identical to baseline in read-only checks. For tools in progress,
the blob identifies the variant read and does not imply
it is already committed or final.

| Source | Blob Git |
|---|---|
| `src/get/package.lisp` | `a22de99a63db56417822bb5e66f82e5c89d73bc2` |
| `src/get/types.lisp` | `032ad088b19ec3498a7c80a5e4b96d7777257dad` |
| `src/get/build.lisp` | `cb426426eac6e923224bc57c1dd602405f4bc040` |
| `src/get/lookup.lisp` | `5a105a141b43f5585f8e79c2965d59e96cd35ac6` |
| `src/get/target.lisp` | `c9b8488d0a1aa7643a6ab1570765ec870aa7c9e4` |
| `src/get/segment.lisp` | `cf168c44bfe5aedd2e34180ce4f766a6a89500a7` |
| `src/get/lifecycle.lisp` | `23f16c3039b71be0bd46d6bf92f05791e444683e` |
| `src/read/types.lisp` | `b30795fb7efad5f5313198d345ffabb43249e3fa` |
| `src/read/core.lisp` | `132e44c138e209d3f8840b098cca0424853d09c3` |
| `src/read/task.lisp` | `b3601060197a27c6e8a2aaee22b5576c6b0c6e5a` |
| `src/cache/core.lisp` | `9ab280c17b61b8f98f8299cbfae676942bb3ae47` |
| `src/cache/read.lisp` | `1b2e5eb00fe15187b74fe0fb87ebd43a3c8fb726` |
| `src/cache/clock.lisp` | `5aca4d48de7bf0d849eafe87ae89f6e7800282d8` |
| `src/cache/write.lisp` | `bcd7de80241f809dcfce472741f120a61ac787b4` |
| `src/index/read.lisp` | `abfdeb5397f8be1d390cbdf47f4f02cd2f36bf91` |
| `src/index/validation.lisp` | `a8088783354d2e4e5048d6ac7a3bee7afff92719` |
| `src/index/primary-read.lisp` | `b5b8243bc40b44af8c34ba76a5ab732675690af5` |
| `src/index/primary-probe.lisp` | `f36b55b9e2d9002ed2ce203a0289c92984c89ac9` |
| `src/index/primary-write.lisp` | `5db1d132d91fa11be2b2624ed4c0c8d5405ce591` |
| `src/index/hash-seed.lisp` | `5627b4179b115c008379aa3e60a4724e63f9657b` |
| `src/io/types.lisp` | `b496c1df87108127da568a1fb7b0fd32856afcc5` |
| `src/io/transfer.lisp` | `93acbd608b1af475aa505a6a7dedceb3b15e8d4b` |
| `src/io/native.lisp` | `1b6fe64ea7145f33bcf08c02e8550034ebd6a40c` |
| `src/foundation/record.lisp` | `09185339cab38ab937045b40c52bb1b9092ffb8e` |
| `src/foundation/crc32c.lisp` | `f9c691d28620427099d1d89a89a1ff5d04cbe257` |
| `src/mvcc/snapshots-read.lisp` | `09d73425a6e571c8fac6669b14b98e3ceeb7c96b` |
| `src/epochs/read.lisp` | `a3dfde4a4780554b88e6e037ab4f70731f9c884a` |
| `src/storage/formats.lisp` | `fc942f1c8e30e637abaf13dc26343d40417fc72f` |
| `src/storage/segment-header.lisp` | `f1d99b205b1ea5e6ad059ecd7971d3633411b040` |
| `docs/implementazione/get-record.md` | `07c59c267cac478c83ee2ab9d164cd7e1d0754f6` |
| `tools/get-performance-evidence.lisp` (in progress) | `6e298625a54a18fcc7337df8a4d8dc5dc3a2a86c` |
| `tools/get-performance-evidence.lisp` (later variant, same R1 selector) | `dfaf5aabea2a58b95701da7d1f2431d791b77dc5` |
| `tools/get-performance-evidence.lisp` (R1 selector corrected) | `f098cdb4cf5f0447365cf0bf255e1935d04bc53b` |
| `tools/get-performance-bench.lisp` (complete examined variant, max-transfer corrected) | `e3d41cac51ab5f060d2a8a9c4f3bb4cf3f17387d` |
| `docs/implementazione/get-performance-metodo.md` (complete examined variant) | `78647ca7a9013d10456219e154a2fa4928ba5e1a` |
| `tools/record-command.lisp` | `2e7364821e345b8b8714856a6a2f03c684140320` |
| `docs/implementazione/cache-record.md` | `bd3a4f9fc7a2136b068957bba9307dd4737fb539` |
| `tools/foundation-coverage.lisp` (in progress) | `18d63b375401a58062752e7b4db43ad6be70a2ed` |
| `tests/get-performance/support.lisp` (in progress) | `a92bf7f3161f611db32272a03018cf63214d9954` |
| `tests/get-performance/support.lisp` (later variant) | `f7eac312809b34fa72dcd3b9a8b67d290cb08cd6` |
| `tests/get-performance/paths.lisp` (in progress) | `160dae42a9723e9b0e93a085864affa96a4cd6be` |
| `tests/get-performance/guards.lisp` (in progress) | `76157fb9424d4cf47847f2cec10c5bbcb977246b` |
| `tests/get-performance/guards.lisp` (cache-repair-hit reproduction) | `9bbf7b2ceb817d6ecf2e7c67b0928373c2c07f70` |
| `tests/get-performance/threads.lisp` (quiescence cleanup) | `5780e3ef9c9e34a4098ddbd72e19cebfa6a34edd` |
| `spikes/results/2026-10-11-get-performance/README.md` (in progress) | `050abf32446e1ca18603f5a0ac1e91494428dd05` |
| `spikes/results/2026-10-11-get-record/disassemblato-hash-archive.lisp` | `9910cd7902ab213f310e52225cfb29e579ca3f02` |

Reading disassembly and the author's two readings is preexisting
support material, not a new execution or measurement. No evidence from
the other session's functional campaign is attributed to this
review.

<a id="addendum-definitivo-rilettura-statica-r3r4"></a>

## Final addendum: static rereading of R3/R4

This addendum supersedes open R3/R4 statuses reported above.
**R3 statically corrected:** `tools/get-performance-bench.lisp:509–532,631–644`,
blob `be5fc283b3c06bc60548ea32c240ebf8d9ecafc2`.
Every metric is copied and persisted before validate-window; the handler saves
failed status and diagnostics and reraises the same condition. --negative-self-test
removes completed from the first window before persistence; the normal path
does not activate injection. Persistence remains outside measured windows.
**R4 statically corrected:** `src/cache/read.lisp:89–100`,
blob `5f4f08a4609bd264fa058ec25ba8f6a516c162c8`.
The predicate skips disabled/rejected before tag; copia-posto-cache retains
both guards, seqlock, and subsequent verification. Eight ways, one copy,
fallback on verify-failed, and unchanged schema/outcomes remain; no allocation added.
**Mutant 7 consistent:** `tools/get-performance-mutation.lisp:86–94`,
blob `231cb906b55b9c92905deefc112f7baebecbd4af`: removes the rejected prefilter
and restores shadowing of the repaired copy in the named test.
R2 remains closed as clarified scope: full oracle inside time/heap.
Final static outcome favorable to patches; no run or dynamic result anticipated.
