# Integration review

Two static readings before final qualification cover:

- INV-A12/M3: cache keyed only by immutable location, no retagging or eviction in
  writer/rotation/compaction; canonical resolver membership remains mandatory.
- REQ-CCH-004/AFF-002: existing CRC, exact key, CSN, flags and length checks on
  every cache hit; rejected copy is never delivered; independent source errors
  still close engine admission. Successful fallback emits an observer event and
  increments a saturating counter. Counters cover completed reads only.
- Resource ownership: one private cache constructed from a scalar grant before
  storage resources, no caller-supplied cache aliases; finite classes/set counts;
  zero grant allocates no cache. Close drops view/controller/log references to
  retire cache arenas from the closed handle, after all resource attempts.
- Current M1 serial exclusion/EBR cleanup remains in force; observer callbacks
  cannot reenter. No new process-wide lock, clock, registry or data CSN.
- Hot read keeps existing verification and reports cache outcomes; both :cache
  and :segment are accepted. Nonallocation is measured, not inferred.
- CLI grant parsing is bounded decimal, permits zero once and rejects malformed,
  repeated or oversized arguments. Index grant and record-cache grant are separate.
- Recorded failures are preserved: first focused attempt had an extra test-file
  parenthesis; second attempt's selector omitted two differently named tests and
  correctly failed its expected-count check. The final driver lists tests explicitly.

Residual scope: synchronous serial M1, no new concurrent readers, no group-commit
admission, no cache bypass of per-segment canonical row verification, no RSS cap.

Documentation verification passed, including generated runtime API contracts and
the public Unix round trip. Its original diagnostics retain the documentation
renderer/dependency warnings (including legacy reference-link warnings and YASON
symbols); product warning-as-error compilation is qualified separately.

## New decisions and exercised conditions

| Decision | True/false or alternatives | Verification |
|---|---|---|
| Grant domain | noninteger/negative/above cap vs admitted zero/positive | exact-minimum/config and local CLI cases |
| Disabled cache | zero vs positive | zero-budget and all hit/fallback cases |
| Minimum class payload | exact fit vs one byte too small | independent geometry oracle, six frame limits |
| Per-class growth | below set ceiling, doubled payload fits or exceeds grant | minimum and 32 KiB/1 MiB constructions; final factory independently checks payload |
| Cache read outcome | hit, miss, altered-copy fallback, disabled | ACTIVE/CLOSED, corruption and zero-budget cases |
| Engine record source | cache, canonical segment, preexisting insufficient-buffer/error path | public reads, unchanged full GET suite |
| CLI cache option | matching flag AND argument remains AND no prior grant | valid/missing/duplicate-zero and unrelated-option cases |
| Primary backend | legacy, automatic RAM, automatic paged | v1/v2 differential current values and fresh recovery |
| Canonical membership despite hit | valid source vs damaged CLOSED source | warm-record/canonical-proof negative case |

These are exercised local decisions, not a claim of MC/DC or whole-engine C1
qualification. Existing cache concurrency/progress tests run unchanged in the
complete suite; this integration exposes no new concurrent M1 reader.

The benchmark helpers have explicit negative value-oracle controls and preserve
per-operation samples. Self-test windows are development checks and are never
included in the final performance aggregates. The final commands run after the
parallel functional campaigns complete; source inventories must remain stable.

## Postprocessing diagnostics

The first summarizer expected a plain report and refused the recorder's already
verified gzip descriptor. Its failing command and original helper are retained;
postprocessing now uses the existing lossless evidence reader. The first range
printer also destructively reversed its in-memory list before printing its
minimum/maximum: its persisted 36-pair comparison was correct, but the printed
range covered only the last pair. The corrected helper uses a nondestructive
reverse; the complete before/after comparison files were byte-identical. No
product source or benchmark sample changed, and the corrected final ranges use
all 36 pairs. The archive helper had the analogous printed-count issue; its full
copy manifest remains authoritative and is independently checked during retention.
