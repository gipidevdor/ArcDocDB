<a id="header-dei-log-di-controllo"></a>

# Control-log headers

Module [log-header.lisp](../../src/storage/log-header.lisp) prepares and verifies
headers of `control.log` and `multiserie.log` under
[ADR-0052](../adr/0052-header-dei-log-di-controllo.md).
Operates on stable exclusive buffers, without I/O or shared state.

<a id="contratto"></a>

## Contract

`scrivi-header-log(buffer, start, log-kind, identity, :version)` returns
end of 64-byte header. `verifica-header-log(buffer, start, end, log-kind,
identity)` returns header end and actual version. `log-kind` required:
`:control` or `:multiserie`; expected identity is a specialized
16-byte vector supplied by authoritative source. Default written version is 2;
only 1 and 2 recognized. Buffer may contain further bytes afterward.

Every encoder preflight precedes first write. Destination and identity
cannot be the same vector. Verifier neither writes nor returns
identity views: compares all 16 bytes and returns only two integers.
Work bounded by 64 header bytes; no locks or writes between Serie.

| Error | Condition |
|---|---|
| Wrong range, log kind, or caller identity length; write alias | `invalid-argument` |
| Truncated header, invalid CRC, magic, reserved fields, or identity | `corruption-detected` |
| Unknown version, after correct CRC | `unsupported-format` |

Codec does not decide whether to open or put an Archivio/Serie into `FAULTED`;
owner handles condition. Caller uses verified version
for batch decoders. Current scanning APIs start after an already
verified header: this module supplies that check without introducing a
recovery coordinator or new durable operation.

<a id="decisioni-composte"></a>

## Compound decisions

| Decision | Conditions and independent tests |
|---|---|
| Valid magic | ARCD half and kind half: each altered with valid CRC; both valid and swapped kind |
| Zero reserved fields | Areas 10–15, 32–55, and 60–63: every byte altered with valid CRC; all zero |
| Valid identity | Exact 16-byte comparison: each expected byte different; all equal |

Kind selection has explicit error branch. Range, length,
version, and alias guards are individual decisions with dedicated tests.

<a id="verifica"></a>

## Verification

[Method registered before campaigns](header-log-metodo.md) and
[evidence catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-header-log/catalogo.lisp).
Eleven new tests: independent oracles for kinds/versions, all truncations
and altered bits, every reserved and identity byte, default version 2,
error classification, and unchanged buffers. Strict build and lint
pass; earlier tests remain included.

[Eight mutations](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-header-log/mutazioni.lisp)
detected after successful unchanged baseline: CRC, each magic half,
identity, truncation bound, and each reserved area. Full logs and
campaign report [preserved as data](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-header-log/mutazioni-dati.lisp).
Self-tests verify allocation counter, missing branch, missing/ambiguous
target, and distinction between detected defect and failed compilation.

[Coverage](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-header-log/copertura-dati-finali.lisp)
reports 218/224 forms (97.3%) and 22/22 branches for new codec. Full
denominator preserved. Five declarative forms and default form
`(version 2)` appear unexecuted to SB-COVER; public test without
`:version` nevertheless runs and compares v2 oracle. Instrumentation is not
modified to increase count. Branch coverage does not
equal MC/DC qualification.

[Benchmark](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-header-log/benchmark.lisp): eight
campaigns (two kinds, two versions, write/verify), five replicates of
262,144 calls; zero measured heap in all 40 samples. Positive
control detects deliberate allocation of 16 × 1 MiB. Local
observations on Apple M4, SBCL 2.6.9, safety 3, ready buffers and one worker; no
database performance inferred from in-memory codecs.

<a id="due-letture-c1"></a>

## Two C1 readings

First reading: format, boundaries, and errors. Second: oracles, buffer
ownership, bounds, and integration; default-version test rechecked.
No codec defect detected. Tool audit corrected benchmark
package-loading order and added mandatory unchanged mutation baseline
before campaigns.

| Checklist item | Finding |
|---|---|
| 1. Requirements and ADRs | REQ-FOR-001/002, ADR-0052, consistent layout and API |
| 2. Invariants | INV-F1: integrity, identity, reserved fields, and version checked before results |
| 3. Errors | Explicit classes and reasons; every meaningful rejection has a test |
| 4. Bounds | Header 64 bytes, CRC 56 bytes, reserved fields 34 bytes, identity 16 bytes; no waits/recursion |
| 5. Allocations | Zero heap in 40 successful samples; counter checked with positive control |
| 6. Verified data | Only header end and version after all checks; no identity view |
| 7. Decisions | Table above, conditions isolated by tests and targeted mutations |
| 8. Ownership | Caller's exclusive/stable buffer, centralized constants, no new mutable state |
| 9. Traceability | Updated matrix, product and test ASDF components registered |
| 10. Standard | Safety 3, ftype, docstring, and REQ; strict build and lint successful |
| 11. Parallelism | No locks, counters, or shared writes between Serie |
| 12. Atomicity | In-memory preparation, no I/O or durable change |

Requirements remain at engine status. Opening with authoritative identity,
catalog, `FAULTED` handling, full recovery, and release criteria remain
to integrate; these tests concern only the in-memory codec.
