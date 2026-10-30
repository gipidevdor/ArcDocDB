<a id="revisione-del-routing-workerserie"></a>

# Worker/Serie routing review

Two C1 readings on 2026-10-11: contract, product sources, and
execution/Serie dependencies. First reading: agent `next_execution_audit`;
second independent reading: agent `routing_measure`, after RW-REV-01.
The second reading also compared fixtures before campaigns.
Root then ran campaigns and `next_execution_audit` read their
dedicated v2 raw data: target, coverage, native/HTML audit, measurements, and strict C4.
The general check on integrated freeze passes: 835 tests,
2 smoke tests, 21 suites, and ten spikes with stable sources. These raw data
were also read by `next_execution_audit`. These are agent readings,
not human attestations; global qualification gates remain open.
Initial base `92decf4265554cd4959e32a1c881cf00758bb6a1`.

| C1 point | First reading | Second reading / evidence |
|---|---|---|
| 1. REQ and ADR | REQ-CON-001/002/004/005 and REQ-AFF-008; ADR-0005/0033/0045. Routing of already CLAIMED writer to local binding, without implicit scheduler. | Confirmed in writer delta, three routing sources, package, and ASDF. No change to explicit-task model. |
| 2. Test-sensitive invariants | Immutable local ordinal, dense registry 1..65536, EQ-distinct controllers, copied inputs, worker owner, CLAIMED, EQ writer, context/pair link, and IDLE. | The 18 v2 fixtures pass: copies, controller alias, full recycling, link FI, owner, phase, RW-REV-01, FAULTED Serie, and private shape. Compare identities and before/after images; 65536 limit tested in shape without constructing 65536 real controllers. |
| 3. Typed errors | Invalid configuration before publication; ordinary phase/owner; routing error after claim makes worker FAULTED and retains obligation. RW-REV-01 reported on recoverable-reason boundary. | RW-REV-01 closed in source and v2 campaign: FI on both helpers with reason `:worker-state`, EQ condition, writer/home retained, and controllers intact. No lookup error becomes recoverable through outer allowlist. |
| 4. Loops and waits | Two construction loops, each bounded by checked size N≤65536. No lookup loop, no wait/recursion/thread/callback. | Confirmed on final sources; semaphores/deadlines only in concurrent harness, no hidden retry. |
| 5. Hot allocation | Immutable slots and references, preallocated local table, `dynamic-extent` worker handler. EQ hash only at startup. Static reading does not attest zero heap. | Five v2 samples of 4096 cycles after warmup 128: heap `[0,0,0,0,0]`, sink 8972288 each. Positive control 16777472 bytes, wrong sink rejected, and zero clock below resolution. Only local preallocated serial success, not universal zero heap. |
| 6. Data verified on exit | Range before `svref`; EQ before returning link; owner/phase and shape checked by helpers. Ordinal getter grants no membership or lease. | Confirmed range, writer EQ, context/writer/controller EQ, IDLE, and link shape order. No acquire, pop, or access to live Serie state from selection. |
| 7. Compound decisions | One new compound decision in writer factory: `or` between NIL and integer0..65535 type. Other scalar decisions, loops, and boundaries listed in inventory. | NIL,0,invalid inputs cover TF/FT/FF, with declared short-circuiting. Native/HTML audit of 26 files PASS: 3250/3766 expressions, 436/526 branches; three routing sources 267/291 and 40/42. All 516 missing expressions and 90 missing branches retained; no MC/DC inferred. |
| 8. Shared ownership | Private registry after copies, shared read-only. Context/table/link local to thread. Lookup does not read controller health, owner, or ring. | Copies and read-only slots confirmed, no hot shared writes, and owner before handlers. No poisoning on wrong-thread and no controller fault marking without lease. |
| 9. Traceability and check | REQ on new definitions; package/ASDF load routing after bridge. Global requirements remain `progettato`. | Loading sequence confirmed without inverted dependencies. Traceability and full check PASS on integrated freeze: 835 tests, 2 smoke tests, 21 suites, and ten stable spikes. No global requirement promotion. |
| 10. Rules and deviations | Safety 3, typed/read-only slots, ftypes/docstrings, pre/post, bodies≤60 lines, local complexity≤10. No new syscall or deviation identified. | No new static defect or deviation identified. Full strict C4 compile and FASL self-test PASS in v1, product/C4 unchanged in v2; strict compile/FASL reader audit and self-test PASS in v2, both with empty stderr. Integrated fullcheck PASS, compilation without warnings; 370114 bytes of compiler notes retained in stderr. |
| 11. Serialization and INV-P6 | No lock, wait, hash, or global write in per-slice lookup. O(1); ready queue and leases remain in existing protocols. | v2 fixture PASS: two local tables on same read-only registry, two Serie ACTIVE before releases. Correctness of this finite interleaving is not a scalability or fairness measurement. |
| 12. Durable atomicity | Changes only in-memory configuration and object selection. Does not write WAL, delete data, or acknowledge effects. No new durable point. | Confirmed: no I/O, durable record, deletion, rollback, or cleanup. Global recovery/shutdown not qualified. |

<a id="osservazioni-della-prima-lettura"></a>

## First reading observations

| ID | Observation | Status |
|---|---|---|
| RW-REV-01 / P2 | Selection API `:worker-state` allowlist also enclosed lookup helpers. An unexpected `resource-exhausted :worker-state` error from lookup could remain recoverable because its reason coincided with phase rejection. First reading found no current natural branch producing it; risk concerns fault containment and future coupling. | Internal lookup boundary with empty allowlists after CLAIMED check, in `routing-select.lisp:55`, reread by both agents. Regression `test-REQ-AFF-008-routing-lookup-reason-cannot-bypass-terminal-boundary` injects both helpers and passes in v2 target. |

Routing owns no Serie lease when it fails: it does not mark a
controller that might belong to another worker. Diagnosis and retained
writer/home/obligation must be handled by the future
Archivio coordinator. Local fail-stop does not prove global stop,
quiescence, pool, shutdown, or safe reuse after error.

<a id="tentativi-preliminari"></a>

## Preliminary attempts

The first v1 freeze compiled product without warnings, but the
maximum-budget test exhausted the stack of the fixture image's recursive
comparator on 65537-element vectors. Original record
`4000711896-command-71058-0` remains a retained failure and is not
promoted to PASS. The test-only comparator is corrected before the
v2 campaign; product sources and distinction between campaigns remain
explicit. The v2 target passes after this harness-only correction.

<a id="gate-dedicati-letti"></a>

## Dedicated gates read

The four dedicated process records and the audit record were
read with `:STATUS :OK`, `:SOURCE-CONSISTENCY :STABLE`, and exit 0. Canonical
copies and the general check are described in results.

| Gate | Original record | Outcome and scope |
|---|---|---|
| v2 target | `4000712082-command-76603-0` | 18 routing tests PASS; includes shape FI, FAULTED Serie, and RW-REV-01. |
| v2 suite and coverage | `4000712082-command-76602-0` | 88 Serie and 89 execution tests PASS in same process; native/HTML union of all 26 files. |
| v2 coverage audit | `4000712247-command-79840-0` | Full strict reader COMPILE-FILE, FASL, self-test, and native/HTML agreement PASS; empty stderr. 26 rows, 3250/3766 expressions, and 436/526 branches; 24 expressions and 2 branches missing in three routing sources, all identities preserved. |
| Strict C4 v1 | `4000711978-command-74703-0` | Full COMPILE-FILE and FASL self-test PASS, fatal warning/style-warning, empty stderr. C4 SHA unchanged in v2. |
| v2 measurement | `4000712105-command-77187-0` | Five samples of 4096 cycles: heap 0, sink 8972288, ticks 6792/6802/6814/6820/6815. Positive control 16777472 bytes; badsink3 expected1 rejected, clock0 below resolution, partial raw data and CLI checked. |

Original C4 report `routing-bench-01/report.lisp` contains 53759 bytes,
SHA-256 `9f8fb919d590c230ce75063ca754782537759779048cddfb2490fea97bf58b93`.
Ticks are in local platform units of 1e6/s and are not throughput,
P99, or parallel comparison. Startup/compilation/GC/printing remain outside
the sensor; the cycle is serial, with two alternating Serie and fixture mock I/O.

<a id="controllo-generale-finale"></a>

## Final general check

Record `4000712542-command-86913-0` of integrated freeze d155db3
with routing delta passes with `:OK/:STABLE`, exit 0, and 673 source blobs.
The process runs `make check-core`, the core invoked by `make check`,
with private ASDF cache: 835 named tests, 2 smoke tests, and 21 suites in
182.076021 seconds. Original stderr contains 370114 bytes of compiler
notes, without warnings or unhandled conditions.

Master `4000712691-check-90489-0` is `:COMPLETE`: all ten spikes
have stable sources, exit 0, and empty stderr; SPK-007 is PASS, others OK.
Compact projection `4000712744-routing-fullcheck-projection-92144`
was compared with original records. Auxiliary tests retain
14 original files and 2 orchestration files; intentional self-test
failures are distinct from campaign success and are not new
C4 gates.

Publication retains these data in canonical files
`full-check.lisp`, `fullcheck-summary.lisp`, and `fullcheck-selftests.lisp`,
with provenance and byte verification declared in results. Coverage
remains partial, no MC/DC is inferred, and general engine
qualification and gate F0 remain open. Routing sources, fixtures, and C4
qualified in this freeze remain unchanged.

<a id="integrazione-con-main-avanzato"></a>

## Integration with advanced main

Dedicated qualification remains on the v2 freeze of base 92decf4.
General freeze integrates
`d155db3f977677fa95280f59c23fbe46a5e116d2`:
adds CBOR string writing and GET resolver without changing
execution/Series or foundation/hash/io/wal/csn. ASDF delta adds
new units and CBOR suite; `foundation-coverage.lisp` delta adds
CBORstring-write scope and does not change Series/execution predicates.

Subsequent remote advancement to
`8fb30517a72c5a7bf51f0f5746c6d04a0a8c3486` adds only artifacts:
diff from d155db3 changes no sources, tools, documents, or ASDF.
This distinction retains the actual base in freeze records.

These deltas do not change the three routing sources, bridge, writer change,
routing fixtures, or C4. Dedicated raw data retains original base, sources, and scope:
it is not presented as new measurements on the integrated base.
ASDF, implementation index, and changelog are composed retaining
both additions. General check on the integrated package passes
in record `4000712542-command-86913-0`, with ten spikes in the corresponding
master: this outcome comes from final raw data, not inferred from dedicated gates.

<a id="pubblicazione-e-conservazione-dei-byte"></a>

## Publication and byte retention

Publication wrapper `4000712318-command-81618-0` has exit 0,
but status `:SOURCE-CHANGED` and source consistency `:CHANGED`: it is not a
PASS test. Before/after blob projection shows 672→673 files and two
concurrent documentation deltas: creation of `routing-worker-risultati.md`
and link updates in `routing-worker.md`. Other blobs remain
identical, including all product, test, and tool sources.
The original record retains this status without normalization.

Raw copying and catalog construction completed with
verification of original and expanded bytes. The subsequent separate check
`4000712554-command-87125-0`, read after documents stabilized,
rereads all raw/expanded catalog bytes and passes with `:OK/:STABLE`,
exit 0, and empty stderr. This gate attests artifact retention;
it does not transform the previous wrapper into PASS or replace `make check`
on final code.

<a id="ultima-integrazione-prima-del-push"></a>

## Final integration before push

A separate reading of delta d155→6eeb501 confirms it does not modify
execution/Series/routing or their contracts. Cache/read skips
disabled/rejected slots within eight ways before tag; copy still rechecks
availability and sequence. The new GET suite and three associated
tools do not invoke routing APIs. ASDF retains both additions and
`foundation-coverage.lisp` keeps Series/execution predicates identical.

The new 683-source/document snapshot at
`6eeb501d2eace49fad8e2ec333ed0c6c1386dd6c` is checked by process
`4000713646-command-11645-0`: OK/STABLE/exit0, 854 tests plus 2 smoke tests,
22 suites, no warning/style-warning. Ten additional experiments
succeeded in master `4000713800-check-18712-0`, all stable.
Previous 835+2 raw data remains historical; it is not reinterpreted as
proof of the new base. Both C1 readings, measurements, and dedicated
denominator retain original source and scope. The new general check
does not close Phase 0 or engine qualification.

<a id="composizione-finale-con-resolver-active"></a>

## Final composition with ACTIVE resolver

Delta 6eeb501→be9d2dd does not modify execution/Series/routing or their
contracts. Six ACTIVE units load after the CLOSED resolver,
without cycles or routing reordering. New APIs read the Serie
root, do not automatically attach bridge or routing lookup, and
do not redefine their functions. ACTIVE metadata allocation per
batch remains outside serial routing measurement scope.

Combined-tree build, record `4000714586-command-55084-0`,
is OK/STABLE/exit0 with 690 sources/documents and 854 tests plus 2 smoke tests,
without warnings. Existing tests do not exercise new ACTIVE APIs: this
PASS does not attest their C1/C4. Previous F0/coverage/measurement freezes
retain source and scope. ASDF, index, and changelog preimages are
retained; both additions remain in the final tree.

<a id="integrazione-della-suite-get-finale"></a>

## Final GET suite integration

PR9 brings main to `644e53f176d0dce2c5ac5870659e7d89c0c9df3e`:
adds 70 GET tests, suite loading, GET coverage scope, and
documentation. It changes no product source or Series/execution coverage
predicates. Integration retains previous deltas.

Combined build `4000715110-command-98694-0` is OK/STABLE/exit0,
with 694 sources/documents, 924 named tests, and 2 smoke tests, without warnings;
private FASL cache, about 22.71 s. This check reruns the suite with
new tests; F0, coverage, and routing measurements retain original bases.
It is not new qualification of ACTIVE APIs, pool, or engine.
