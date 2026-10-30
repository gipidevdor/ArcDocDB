<a id="prima-verifica-funzionale-get"></a>

# First GET functional verification

Campaign verifies composition of [GET path](get-record.md) with
primary index, cache, read-only file, snapshots, and epochs. The
[method](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-get-verification/metodo.lisp) is registered
before runs on base `65972a4`. Product remains distinct from
fixtures: data and times chosen by suite, outcomes compared with
explicit bytes and values.

<a id="metodo-e-confini"></a>

## Method and boundaries

[Support](../../tests/get/support.lisp), with
[lifecycle](../../tests/get/lifecycle.lisp) and
[segment/cache](../../tests/get/segment.lisp) cases, constructs real registries, seeded index,
view, and context, and read-only files with header, PUT, and OUTCOME written by
public APIs. Expected value is a known sequence independent of GET's returned
value. I/O-backend counters distinguish capability construction
from task reads. Every case owns separate resources and
installs cleanup before start.

| Group | Decisions | Observations |
|---|---|---|
| Configuration and lifecycle | GET-D01..D03 | Budgets, identity copies, canonical Archivio, reentry, current and historical miss, CSN relative to snapshot |
| Target, record, and cache | GET-D04..D08 | Authoritative identity and frontier, buffers, no I/O in compute, OUTCOME, corruption, and fallback |
| Response and completion | GET-D09 | Bytes copied into private response, ranges and aliases, expiry, and protection release |

Rejections before taking ownership must preserve an already-active task
of nested caller. Operational errors must release protections.
Copied response becomes deliverable only if `concludi-get` returns
normally: expiry after copy must still prevent
delivery. Prepared record requires file proof even on cache hit; insufficient
scratch precedes proof request and performs no I/O.

Private-state changes limited to declared fault-injection
fixtures, to induce inconsistencies or damage cached copy.
I/O observer uses public backend and delegates to unchanged native
adapters to count reads. None of these accesses supplies
CSN, value, or frontier oracles.

<a id="raccolta-dei-risultati"></a>

## Result collection

Recorded runs follow freeze of sources, documentation, and
Git index. Full compilation and suites, coverage-tool self-test,
and `get` scope use separate processes. Coverage retains HTML,
SB-COVER state, and private FASLs; measures expressions and branches, not MC/DC.
[Results](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-get-verification/risultati.lisp),
[independent review](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-get-verification/revisione.lisp),
and [catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-get-verification/catalogo.lisp)
preserve original references. All records read as data.

<a id="risultati-locali"></a>

## Local results

All 70 GET tests pass in ordinary suite and coverage compilation.
First freeze `f1bd3cd` passes 840 module tests and two smoke tests.
The [integration method](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-get-verification/integrazione-metodo.lisp)
records concurrent CBOR and worker/Serie updates from `0d0ec4b`.
Integrated freeze `222b9fd` passes 887 module tests and two smoke tests. Seven
GET files and three suite files identical across both freezes; ASD and
coverage tool also retain upstream routes.

Subsequent CLOSED-resolver integration from `d155db3` registered in
[method](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-get-verification/resolver-integrazione-metodo.lisp)
and [results](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-get-verification/resolver-integrazione-risultati.lisp).
Freeze `5d6490a` compiles without warnings and passes same 887 module tests,
two smoke tests, lint, traceability, and links; 70 instrumented GET tests also pass.
667 sources stable before/after. GET and suite files remain identical,
with same coverage counts. Runs verify suite loading and
composition; resolver functional qualification remains separate.

Latest update `6eeb501` corrects lookup of already-rejected cache copies
and adds 19 GET performance tests. [Integration method](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-get-verification/cache-integrazione-metodo.lisp)
and [local results](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-get-verification/cache-integrazione-risultati.lisp)
record freeze `b2a847e`: 70 instrumented GET tests also pass with
this changed dependency, with same counts below, and tool
self-test passes. 677 sources stable before/after.
Suites `get` and `get-performance` and respective scopes remain separate.
Full CI on published commit must pass 906 module tests and two
smoke tests; previous full runs remain associated with their own freezes.

Records of both freezes attest respectively 633 and 659 source files
identical before and after runs. Reader and snapshot self-tests preserve
expected classifications of terminated workers; ten spikes complete
with zero exit, retaining `:PASS` for SPK-07 and `:OK` for others.

| GET file | Expressions | Branches |
|---|---:|---:|
| build | 124/147 | 14/20 |
| lifecycle | 181/195 | 18/20 |
| lookup | 127/140 | 25/26 |
| package | 0/1 | 0/0 |
| segment | 293/312 | 19/24 |
| target | 190/205 | 27/30 |
| types | 11/55 | 0/14 |
| **Total** | **926/1055 (87.77%)** | **103/134 (76.87%)** |

HTML and SB-COVER state read as data match for every file in compared
freezes. Denominators include package and types: generated definitions and
INLINE accessors without local hits receive no inferred coverage.
Run states preserved separately with lossless gzip.

Two fixtures republishing same CSN corrected during
review before runs. No GET product-code change necessary.
Traceability, links, and preservation checked after
local publication; CI verified on published commit.

<a id="preregistrazione-dellultima-integrazione-active"></a>

### Preregistration of latest ACTIVE integration

Update `be9d2dd6816f8c999fcab383702c7a133c061902`, arriving after local
freeze, adds six ACTIVE-resolver files and connects their loading
in ASD. Before integration, following check registered: independent
review of composition and differences, full preservation of
previous runs, then full Linux/macOS CI and documentation
check on final published commit. Expected: 906 module tests
and two smoke tests, with 70 functional GET and 19 performance-suite tests distinct.
CI must attest identical before/after sources matching exact
commit. Seven GET files, three suite files, and cache dependency must
remain unchanged from local freeze; reported coverage remains attributed
to preserved runs. Integration verifies loading of new
resolver, without adding ACTIVE functional qualification or performance measurements.

<a id="limiti"></a>

## Limits

An initial functional suite; tests are partial decision
witnesses, not full C1 qualification. MC/DC independence pairs,
operator mutation, concurrent stress, engine crash and fault injection
remain. Internal INLINE EBR-admission window not qualified
through function interposition. Index retry,
retry completion, some internal guards, short reads/EOF, and cache busy,
bypass, or unavailable outcomes remain without witnesses.

No attestation of historical resolver, server endpoint, scheduler, committed-frontier
integration, weak memory, zero heap allocation, performance, or phase
closure. Controller guarantees and validity of batch containing
OUTCOME remain module preconditions.
