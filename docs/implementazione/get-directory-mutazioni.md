<a id="mutazioni-della-directory-get-closed"></a>

# CLOSED GET directory mutations

<!-- REQ: REQ-IDX-001 REQ-CMP-007 REQ-AFF-002 REQ-AFF-008 REQ-VAL-001 -->

Driver [get-directory-mutation.lisp](../../tools/get-directory-mutation.lisp)
preregisters five semantic mutants of directory construction and selection.
Preparation was exclusively static: no compilation, product load,
suite execution, self-test, or campaign was performed
by the author of these two files. The parent freezes sources and records every
subsequent execution. This page describes the method and required results;
it certifies no results already obtained.

<a id="scope-e-contratto"></a>

## Scope and contract

Only `src/get-directory/build.lisp` and `src/get-directory/read.lisp`
may be modified in private copies. The existing CLOSED resolver
and GET core are compiled dependencies without mutations.
The ACTIVE resolver is not included, and no publication, shared cells,
or CAS is added. The controller must acquire the directory after `avvia-get`,
in the candidate's same EBR epoch; publication, FDs, and reclamation remain with the
controller. The complete contract is in [get-directory.md](get-directory.md).

The suite uses package `arcdocdb.get.directory.tests` and registry
`*get-directory-tests*`. Only the directory suite is compiled and run:
`support.lisp`, `construction.lisp`, `read.lisp`, `threads.lisp`. First,
`tests/foundation/support.lisp` is compiled to import assertion oracles;
foundation tests are not run. `arcdocdb/tests` is not loaded and
other suites are not copied. All product sources and
`arcdocdb.asd` are copied instead; ASDF loads only system `arcdocdb` with
forced compilation. The method is not a product-only measurement.

The directory domain remains 0–65,536 segments, sorted positive u32 IDs,
at most 17 search steps, and `12*N` bytes of array payload on SBCL64.
Headers, maps, and FDs are outside that payload. The campaign measures neither memory,
latency, nor throughput; geometric limits are test observations.

<a id="mutanti-preregistrati"></a>

## Preregistered mutants

Every mutant replaces one literal occurrence of an anchor. A missing or
duplicate anchor or missing named test prevents baseline startup.
Multiline strings contain actual newlines. No anchor is matched
by similarity or updated automatically after freeze.

| Mutant | Target | Exact test | Defect and expected observation |
| --- | --- | --- | --- |
| `omit-directory-owner` | `src/get-directory/build.lisp` | `TEST-REQ-CMP-007-DIRECTORY-CANONICAL-OWNER-AND-FOREIGN-OWNER` | Guard `(unless (eq view (segmento-get-owner segment))` becomes `(unless (or (eq view (segmento-get-owner segment)) view)`. The canonical view, always true as an object, makes a foreign view accepted: the assertion for rejection `invalid-argument :directory-source-owner` must fail. The `view` reference is retained. |
| `missing-location-first-map` | `src/get-directory/read.lisp` | `TEST-REQ-IDX-001-DIRECTORY-MISSING-PUBLISHED-CANDIDATE-FAILSTOP` | When the interval is exhausted, a nonempty directory returns its first map. The empty directory retains its original failure, so the test also reaches the published candidate in the gap. The assertion for failure `:directory-location-absent` must fail; no false absence is allowed. |
| `alias-input-maps` | `src/get-directory/build.lisp` | `TEST-REQ-IDX-001-DIRECTORY-INPUT-ARRAY-COPIED` | `(owned (copy-seq maps))` becomes `(owned maps)`. After `fill` of input with `nil`, the directory loses its maps. Expected test success is replaced by `invariant-violation :directory-shape`, with GET FAULTED. |
| `truncate-directory-id` | `src/get-directory/read.lisp` | `TEST-REQ-IDX-001-DIRECTORY-NATIVE-READ-V1-V2-VALUES-AND-MAXID` | `(ldb (byte 32 32) location)` becomes `(ldb (byte 31 32) location)`. The candidate with ID `#xffffffff` is searched as `#x7fffffff` and rejected rather than selecting and reading the exact segment. |
| `bypass-closed-resolver` | `src/get-directory/read.lisp` | `TEST-REQ-IDX-001-DIRECTORY-CANDIDATE-SIZE-AND-HIGHBITS` | `risolvi-candidato-directory-get` selects the map and directly returns segment, frontier, `0`, `nil`. The assertion for the CLOSED candidate-size check must fail. The anchor affects only this directory wrapper. |

The alias mutant depends on the selected-map type guard introduced
by the parent in `cerca-mappa-directory-get`: an entry other than
`mappa-segmento-get` must call `guasto-get :directory-shape` before
return. Without that guard, the test could raise a CL `TYPE-ERROR`:
the classifier treats it as infrastructure, **not** a kill. Preflight
does not certify this guard through an additional anchor; its
presence must be confirmed statically before freeze.

The delegation mutant also removes CSN, FD, and proof checks from wrapper
`risolvi-candidato-directory-get`, but the preregistered test witnesses the
size check starting with the first wrong case. No independent kill
is claimed for every other check or for cache/read wrappers that
continue delegating to the original resolver. The baseline still includes
dedicated tests for low/high CSN, FDs, prepared records, and cleanup.

<a id="isolamento-e-attestazioni"></a>

## Isolation and attestations

`--check` requires a new, exclusively acquired output directory.
The baseline receives copies of frozen source bytes. Original fingerprints
are compared before and after copying; all other copies derive from the
verified baseline. A mutant must change exactly the preregistered file,
while every other source and every suite file remain identical.

Each copy runs in a new SBCL process without user or system init,
with local ASDF source registry and private output translations
under `fasl/`. Suite files also have explicit private outputs. A
compilation with warnings, except redefinition warnings, or a failure
indicator is not a useful compilation for the campaign.

The child attests the complete source manifest with MD5, FASLs of every product
source, the five suite/support FASLs, and the compiled target.
Every entry contains role, source path, source MD5, absolute FASL
path, and FASL MD5. Lists must match the expected manifest exactly:
missing entries, duplicates, different order, output outside the private directory,
or different digests invalidate the result. Attesting only the target is insufficient.

After the child, the supervisor recalculates digests of sources, generated
runner, and on-disk FASLs and checks their real paths. The test registry must
match frozen literal `deftest` forms exactly, and every name must
contain `REQ-`. MD5 attests byte identity in the local method
inherited from `get-performance-mutation.lisp`; it is not cryptographic attestation
against a hostile child or coordinated alteration of sources and reports.

Before mutants, the baseline must compile product and suite and complete
all directory tests in frozen order. Otherwise no
mutant is launched and `:not-run` outcomes remain recorded. Each
mutant runs only its named test in a new copy with its own fixtures;
it inherits no cache, FDs, snapshots, pins, or results from baseline.

<a id="classificazione-c4-e-self-test"></a>

## C4 classification and self-test

The main report and copy reports are plists with `:schema-version 1`,
`:kind`, and `:status`. The child-report parser accepts one plist with
unique keyword keys, top-level markers, and EOF after data. It disables
read-eval, reader labels, feature conditionals, array/structure construction,
and other dispatch forms incompatible with report data. Text is bounded
to 16 Mi characters; quoted logs or markers are not reports.

A kill (`:detected`) requires valid attestations, exit code 1,
phase `:tests`, status `:failed`, no other passed test, and failed-test
name exactly equal to preregistration. Failure type remains
distinct: `:assertion` recognizes the `is` oracle format, while
`:product-condition` recognizes `arcdocdb-error` conditions excluding `io-fault`.
Actual reason and condition type are retained in diagnostics;
`:expected-failure` describes the expected defect without log matching.

Timeouts, crashes/signals, I/O errors, fixtures, generic CL errors, and unreadable
children are `:infrastructure-error`. Errors in `:compile-product` or
`:compile-suite` are `:compilation-error`. Insufficient attestations,
a different test, malformed data, or inconsistent combinations are `:invalid`.
A successful named test is `:survived`. None of these categories counts
as a kill. Baseline distinguishes `:baseline-passed` and `:baseline-failed`.

`--self-test` examines only synthetic data, loads neither product nor suite,
does not compile, and starts no processes. It covers single substitution and negative anchors,
positive/negative parser, assertion and product condition, baseline, survival,
compilation, timeout, signals, fixtures/infrastructure, wrong test, wrong
digests, FASL outside copy, incomplete product or suite coverage, and malformed
fields. Counters are checked both against classifier outcomes
and with a fixture of every category, including `:pending` and `:not-run`.
This self-test prepares sensor checks; it witnesses neither compilability
nor correctness of the five actual mutants.

<a id="budget-e-registri-parziali"></a>

## Budgets and partial records

Total operational budget is 900 seconds from driver startup, including
preflight, copies, compilations, and tests. Each process gets at most 120 seconds,
reduced by remaining budget, with two seconds reserved for cleanup. A child
still alive is terminated; the supervisor waits for death with bounded
polling for at most two seconds. It calls `wait-process` only after observing
death. Failed cleanup or an unreaped process cannot produce
a kill and prevents subsequent mutants from starting. Final persistence and fingerprint comparison
also occur after timeout, outside the operational window. The report
also measures finalization time: a total beyond 900 seconds still makes
the campaign fail even if all mutants were detected.

The driver saves the initial report, complete plan, every copy before
copying its sources, attestations before launch, process status,
cleanup, and every result. It updates `report.lisp` through a pending file
and rename. If interrupted, the latest checkpoints, pending
files, and already written logs remain. Manageable errors always produce a final report
on stdout too; a filesystem error or inability to acquire the new
directory may prevent the on-disk copy and is diagnosed on stdout. No final
report is promised after supervisor SIGKILL or system loss.

Under `raw/isolatedtests/`, preserve reports, `stdout.log`, `stderr.log`,
generated runner, and for every mutant `original-source.lisp`,
`mutated-source.lisp`, `mutation.patch`, sources, and FASLs. The parent's C4
collector must treat retained runners and patches/sources as raw data, not
reports; it must exclude subdirectories `src`, `tests`, `fasl` from report
scanning, as in the performance pattern. Plan records expose
`:directory` and `:file` even if a copy fails before the child.

The final report retains workspace fingerprints before/after,
separate counters, and missing results. Exit code 0 requires passed
baseline, five kills, and stable sources. Every compilation/infrastructure
failure, invalid result, survivor, or modified source gives exit code 1.
Copies, logs, and partial failures are not deleted; workspace sources
and shared ASDF cache are not modified by the driver.

<a id="esecuzioni-riservate-al-padre"></a>

## Executions reserved for the parent

These commands are instructions for the post-freeze phase and **were not
run** during preparation:

```sh
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- \
  sbcl --noinform --no-userinit --no-sysinit --script tools/get-directory-mutation.lisp --self-test

sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- \
  sbcl --noinform --no-userinit --no-sysinit --script tools/get-directory-mutation.lisp \
  --check spikes/out/get-directory-mutations-frozen/
```

Before freeze, agree on presence of the `:directory-shape` guard,
the five test names listed here, ASDF with four directory product
components, and final suite files. If implementation evolves, correct
only these two files, then the parent freezes again. No previous
campaign result can qualify a later source version.
