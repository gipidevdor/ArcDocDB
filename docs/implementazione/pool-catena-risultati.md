<a id="catena-pool-dispatcher-e-serie-risultati-locali"></a>

# Pool, dispatcher, and Serie chain: local results

C4 increment on base `a34cede6fbc9215908d50aa85311d5d703660040`, under
[preregistered method](pool-catena-metodo.md). Two new tests registered
in ASDF execute six scenarios on real threads. No file in `src/`
is modified; previous C1/C3 qualifications retain their scope.

<a id="rilettura-c4-dellautore"></a>

## Author C4 rereading

Code and oracle rereading before campaign closure;
neither independent review nor new C1 qualification.

| Check | Code evidence |
|---|---|
| Owner and publication | Context, port, table and link created in respective worker; registry built before startup; ports published through semaphore. |
| Serie independence | A reaches RUNNING or BATCH with lease; B joined after 32 quanta before signaling A release. |
| Routing and capabilities | Expected writer checked by EQ, link still IDLE and begin link EQ to step link; positive lease and original token. |
| Payload and debt | Every pop checks count/status/token, expected payload and span sentinels; explicit ACK, then end and phase check. |
| Full and room | Five-value results, recycle origin, count 1 or 2; full uses B, room takes no second writer. |
| Retirement and migration | Command from public registry; retirement at next IDLE; another owner takes remaining A; final registry `(1 1 NIL)`. |
| Fixture resources | Finite loops; wait/join with 15s timeout; cleanup releases barriers, stops/joins threads before backend close. |
| Product boundaries | No function or private-slot replacement in new fixture; semaphores and lease-held pauses belong only to test. |

SHA-256 identities of four files frozen before full check:

| File | SHA-256 |
|---|---|
| `arcdocdb.asd` | `6af6230a08151f71826b8566f052320a005e1d67e92e52e8701c414af554de14` |
| `tests/scheduler/pool-chain-support.lisp` | `3a1cfd174c8ca8ee7bb713b026e644e45ab444aa762f0e28d95d6e502b7fbfaf` |
| `tests/scheduler/pool-chain.lisp` | `81da71e08d0e5196b01fb51666b9c123dc3c1d1b206f02076ab5a1c74d6f0c85` |
| `docs/implementazione/pool-catena-metodo.md` | `5d6677962c2dc40bcfb7425c08e9b5ed7f509d16b9722530cf74110f39e8cc97` |

<a id="registri-ed-esiti"></a>

## Records and outcomes

| Original process | Outcome | Wall time | Stable sources |
|---|---|---:|---:|
| [Development, attempt 01](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-catena/processes/development/report.lisp) | OK, exit 0; two tests, six scenarios | 18.677892 s | 947 |
| [Full check](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-catena/processes/check-core/report.lisp) | OK, exit 0; 1,607 named tests, 2 smokes, 4 lint fixtures | 300.889764 s | 947 |
| [Integrated build](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-catena/processes/integrated/report.lisp) | OK, exit 0; 1,624 named tests and 2 smokes | 53.042596 s | 963 |

Full check records all six scenario lines, 112 scheduler
tests, 231 lint files/0 violations, 121 requirements/65 invariants/13 FI
scenarios/52 ADRs without errors, and 462 Markdown/3,139 links/0 broken. All 10 completed
spikes are preserved with original files in campaign
manifest. Archive verification before new publication: 118 catalogs,
3,518 references, 40,972 files, 1,090,326,637 bytes.

After the frozen campaign, parent
`1bdfce485633cacc924d5e7a3b1149b0185a4fa9` (recovery checkpoint and CBOR
item reading) was integrated with merge `6f830dd3f2fa16fc6de8536dba33bcf4d439ca5f`.
Integrated build reruns the entire suite: 237 lint files/0
violations and 122 requirements/65 invariants/13 FI/52 ADRs without errors.
The two new test files and method retain frozen fingerprints; ASDF
also includes new parent modules. Premerge ASDF version is
preserved in the bundle alongside three other frozen copies.

Strict compilation without warnings/style-warnings in every process.
Full-check and integrated-build stderr contain compiler
notes (1,186,895 and 1,219,731 UTF-8 bytes), preserved in full;
they are not presented as empty stderr. Development stderr is empty.
The [manifest](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-catena/manifesto.lisp)
and [catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-catena/catalogo.lisp)
connect sources, original records, preservation, and spike campaign.
Previously verified preservation functions are reused
unchanged; generic catalog family `writer-worker` is declared
in the manifest and does not broaden test scope.


First development did not print six descriptive lines for individual scenarios.
Initial variant is preserved in the source bundle and its Git blob was
compared with original record (`d7ad221b3e665eca54e9d532b54f04d4e53c301c`).
The only later test change is printing those lines; complete
qualification uses the frozen version identified above. No failed
attempt is omitted.

The [first final check](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-catena/processes/final-attempt-01/report.lisp)
is FAILED/exit 2, STABLE sources, 4.720478 s: verifier also scans
Markdown copies under `spikes/out/` and reports three missing relative
references in the isolated method copy. This is not a suite failure.
Only the local copy was renamed from `.md` to `.md.txt`, with SHA-256
identity verified before and after; the publication bundle preserves
both filename and bytes in full as they were when copied.
Failed record and its preservation remain original.

<a id="ambito-del-risultato"></a>

## Result scope

In both isolation scenarios, B completes 32 quanta (64 total) while A
holds its lease, first without pop and then with pending batch debt.
In four retirement scenarios, payloads are A1, B1, and A2 exactly once,
with B and remaining A acquired according to ring capacity. Final empty
ready list is only a local observation; it authorizes neither shutdown nor global parking.

These are synchronized orders of real threads with an in-memory backend.
They are neither speedup measurements, exhaustive interleaving exploration,
universal weak-memory proof, nor allocation measurement.
No database payloads are applied or durable commits/I/O performed.
Timeouts are fixture budgets, not product latency targets.

<a id="chiusura-e-integrazione-della-suite-recovery"></a>

## Closure and recovery-suite integration

[Publication](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-catena/processes/publication/report.lisp)
is OK/STABLE/exit 0, 85.510822 s, 964 sources, and empty stderr.
After local-copy correction, the
[second final check](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-catena/processes/final-verification/report.lisp)
is OK/STABLE/exit 0, 200.360344 s, 964 sources, and empty stderr:
471 Markdown, 3,184 links without breakage; 122 catalogs, 3,561 references,
41,484 files, and 1,104,173,105 bytes. These counts precede closure
copies, new links in this section, and following integration.

[PR 15](https://github.com/gpicchiarelli/ArcDocDB/pull/15), head
`49e66e14f8cade401978b9b969a97989995bcb77`, adds 27 recovery tests
in a separate package, ASDF, and documentation; no change to `src/`,
tools, or CI. Local merge
`284b1248` retains both changelog entries and both suites.
The [subsequent check](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-catena/processes/post-pr-integration/report.lisp)
is OK/STABLE/exit 0, 56.903611 s, 969 sources: **1,651 named tests and
2 smokes**, 237 lint files/0 violations, 122 requirements/65 invariants/13 FI/
52 ADRs without errors, 473 Markdown/3,191 links/0 broken. Strict compilation
without warnings; note stderr preserved in full (1,248,665 UTF-8 bytes).
New chain files and method remain identical to freeze;
final ASDF and changelog are preserved in the closure bundle.

The [closure manifest](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-catena/chiusura-01.lisp)
adds three original records without rewriting previous ones,
preserves statuses, descriptors/payloads, and final sources. It does not turn
this chain's local qualification into whole-engine qualification.
