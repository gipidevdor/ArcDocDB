<a id="analisi-dei-guasti"></a>

# Failure analysis

Failure model and FMEA. For each failure: what happens, how it is **detected**, how the
system **responds**, which requirement or invariant governs it, and how it is **verified**.
A failure without a defined response and verification is a design defect.

<a id="modello-dei-guasti"></a>

## Failure model

**Tolerated (with a defined response):**

1. abrupt process or machine termination at any instruction (crash, `kill -9`,
   power loss);
2. partial or unordered writes not yet synchronized (truncated tail, incomplete sector);
3. errors returned by the operating system (`EIO`, `ENOSPC`, `EMFILE`, `fsync` error);
4. alteration of data at rest (bit rot, zeroed block, duplicated block, truncation);
5. alteration of in-memory data (bit flip in index or cache);
6. resource exhaustion (memory, descriptors, space, queues);
7. malformed or hostile protocol and decoder input;
8. software defects (internal invariant violations);
9. operator error (double open, removed files).

**Not tolerated (declared, made detectable where possible):**

10. flush reported successful but not durable (unbarriered media write cache,
    defective firmware);
11. simultaneous loss of all media;
12. defects in the compiler, GC, SBCL runtime, or kernel;
13. Byzantine or adversarial behavior.

## FMEA

| ID | Failure | Effect | Detection | Response | Governing rule | Verification |
|---|---|---|---|---|---|---|
| FM-01 | Power loss or crash during append | last log batches partial or absent | invalid batch (CRC, missing or mismatched SEAL) | **tail** if no later SEAL declares a durable frontier beyond the anomaly: valid length is the start of the first invalid batch; nothing is truncated, the segment is closed at that length ([ADR-0037](../adr/0037-lotto-sigillato.md) §3–4) | INV-F1, INV-F2, INV-F3, INV-D1, INV-A9 | FI-01, FI-02; simulator |
| FM-02 | `fsync`/`rename`/`write` returns an error | undefined page state | return code | **no retry**; Serie/Archivio `FAULTED`; no batch acknowledgment | INV-A1 | simulator with I/O errors |
| <a id="fm-03"></a>FM-03 | Successful but nondurable flush (media or firmware) | loss of acknowledged data | undetectable at runtime; detectable by subsequent verification | `F_FULLFSYNC` on macOS, `fdatasync` on Linux; **declared residual risk** | — | power-interruption test outside CI |
| FM-04 | Alteration of a closed segment | incorrect data | read-time CRC; scrubbing | segment quarantined (`DEGRADED`); `corruption-detected` error; restore from backup | INV-A2, INV-A6 | deliberate corruption of every file; scrubbing |
| FM-05 | Lost or misdirected write (media acknowledges it, data absent) | missing or unrelated record | CRC and key/version comparison on read; scrubbing and hint ↔ segment ↔ control-log comparison | quarantine; `FAULTED` if control logs are affected | INV-A2, INV-A6, INV-F1 | lost-write scenarios in simulator |
| FM-06 | Alteration of already durable data in the `ACTIVE` segment or a control log | risk of discarding committed data | a later valid SEAL declares a durable frontier beyond the anomaly | `FAULTED`; no writes; operator decision | INV-A1, INV-F3 | FI-01 with damage below frontier |
| FM-07 | Disk space exhausted | writes impossible | free space below reserve; `ENOSPC` | controlled `resource-exhausted` rejection before exhaustion; `ENOSPC` during write = write error (FM-02) | INV-A8, INV-A1 | simulator with full disk |
| FM-08 | Read error (`EIO`) | data unavailable | return code | `io-fault` error for that read; repeated errors → segment quarantine; **never** unverified data | INV-A2 | simulator with read errors |
| FM-09 | File descriptors exhausted | cannot open segments | `EMFILE` | controlled rejection; open-segment limit and bounded descriptor cache | INV-A8 | saturation test |
| FM-10 | Heap exhaustion | possible fatal runtime exit | memory accounting; internal thresholds | rejection well before the limit (backpressure); heap explicitly sized at startup; accounting verified at startup | INV-A8 | saturation test; SPK-02 |
| FM-11 | Bit flip in index or cache | incorrect location or data | key/CSN comparison with record; header and body CRC | in cache: discard entry and reread from segment, without quarantine; in index: `corruption-detected` error, index rebuildable from hints | INV-A2, INV-A12 | in-memory bit-flip injection in simulator |
| <a id="fm-12"></a>FM-12 | Compiler, GC, or runtime defect | arbitrary corruption | end-to-end checks; assertions | pinned version tested on two platforms; **declared residual risk** | INV-A2, INV-A3 | CI on Linux and macOS; soak test |
| FM-13 | Process `kill -9` | abrupt termination | on restart | recovery ([architecture](../architettura.md#recovery)) | INV-D1, INV-A7 | repeated real crashes + verifier |
| FM-14 | Crash during recovery | incomplete recovery | on next restart | **idempotent, nondestructive recovery**: nothing has changed before renaming the compacted control log; rerun | INV-A7, INV-A9 | recovery interruption at every point in simulator |
| FM-15 | System-clock jump | incorrect durations | — | use only the **monotonic** clock for durations; wall clock is informational only | — | simulator with manipulated clock |
| FM-16 | Files or directories removed or renamed externally | inconsistent structure | control-log ↔ directory comparison at startup and during scrubbing | missing segment file → quarantine; missing log → `FAULTED` | INV-A6 | verifier test |
| FM-17 | Double open of the same Archivio | two writers on the same log | exclusive lock on `LOCK` | second open fails immediately | REQ-AFF-011 | double-open test |
| FM-18 | Internal invariant violation (defect) | invalid state | always-active assertions | `invariant-violation`; Serie `FAULTED` | INV-A3, INV-A4 | defect injection (mutation testing) |
| FM-19 | Malformed or hostile request | risk of crash or out-of-bounds read | validation of every field; size limits | `invalid-request`; never state effects | INV-A8 | protocol fuzzing |
| FM-20 | Coordinator crash between decision and OUTCOME | partial multiseries transaction | `multiserie.log` and `PREPARE` without `OUTCOME` | recovery completes COMMIT or ABORT (presumed abort) | INV-T4 | FI-03, FI-04, FI-05, FI-12 |
| FM-21 | Crash during Serie creation or deletion | inconsistent catalog and directory | `.tmp` directory; `dropping` catalog state | `.tmp` without document: deleted; `.tmp` with document: renamed; `dropping`: removal completed ([ADR-0040](../adr/0040-manifest-a-record-unico.md) §5) | INV-A7, INV-A11 | FI-13 |
| FM-22 | Altered or incomplete backup | invalid restore | offline verifier on backup | restore rejects a backup that fails verification | REQ-AFF-014 | backup/restore test |
| FM-23 | Snapshot that never ends | unbounded retained space | snapshot age | termination after maximum duration (`snapshot-too-old`) | INV-A8 | long-lived snapshot test |
| FM-24 | Seqlock counter wraps | undetected inconsistent read | enforced 2⁶² threshold | fragment rebuild, resetting counters ([ADR-0043](../adr/0043-primary-index-a-frammenti.md)) | INV-A8, [ADR-0032](../adr/0032-seqlock-a-64-bit.md) | test with high initial counter |
| FM-25 | Unordered persistence of unsynchronized writes (later batch on disk, earlier one absent) | valid batch after missing batch | SEAL durable frontier | it is a tail: batches beyond the first invalid one were unacknowledged and are ignored; **not** a failure | INV-F3 | FI-01, FI-02 with arbitrary subsets of unsynchronized batches |
| FM-26 | File or directory with a definitive name unknown to every source of truth | possible manifest defect or external intervention | restart reconciliation; verifier | **do not delete**: log event, leave object intact | INV-A10 | verifier test; FI-09, FI-13 |
| FM-27 | Commit remains in flight for a long time (slow or stalled Serie flush) | Archivio snapshots cannot be created | CSN-to-horizon distance; wait time | bounded wait, then `resource-exhausted`; reads and writes without snapshots unaffected; a `FAULTED` Serie releases the horizon | INV-M4, INV-A8, INV-P3 | simulator with delayed flush |

<a id="rischi-residui-accettati"></a>

## Accepted residual risks

> **Decided (prepared verification → ADR-0047)** — In FM-11, flag and key comparison
> is insufficient for a prepared record: TXID and CSN are checked against the segment's
> OUTCOME or the closure EDIT outcome. The proof is itself verified; an incorrect
> location pointing to a prepared record with the same key must be rejected
> ([ADR-0047](../adr/0047-verifica-csn-dei-record-prepared.md)).

| ID | Risk | Why accepted | Mitigation |
|---|---|---|---|
| RES-01 | FM-03: nondurable flush | outside software control | correct flush primitives; document hardware requirements; backup |
| RES-02 | FM-12: runtime defects | SBCL is not qualified | end-to-end verification; two platforms; pinned version |
| RES-03 | Loss of all media | one device in v1 | consistent, verifiable backup ([ADR-0030](../adr/0030-scope-v1.md)); replication in a later phase |
| RES-04 | Limited verification independence | single author | automatic tools, checklists, evidence-based review ([ADR-0031](../adr/0031-software-critico-criteri-e-priorita.md)) |
| RES-05 | At-rest damage affecting only batches made durable by the final flush before abrupt termination, not yet witnessed by a later batch's SEAL: indistinguishable from a tail | the boundary of what a log can know about itself; requires abrupt termination coinciding with damage in those few batches | orderly shutdown closes the segment (no window); scrubbing; backup ([ADR-0037](../adr/0037-lotto-sigillato.md)) |

Each entry is also in the [risk register](../valutazione/registro-rischi.md).
