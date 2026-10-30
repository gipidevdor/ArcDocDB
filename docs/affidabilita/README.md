<a id="affidabilità"></a>

# Reliability

[Documentation](../README.md) · [Traceability](../tracciabilita/README.md) · [Evaluation](../valutazione/README.md)

ArcDocDB is designed as **critical software**
([ADR-0031](../adr/0031-software-critico-criteri-e-priorita.md)): reliability is the
ultimate goal; performance is reasonable and subordinate.

<a id="documenti"></a>

## Documents

| Document | Contents |
|---|---|
| [Failure analysis](analisi-dei-guasti.md) | Failure model, FMEA (`FM-…`), residual risks |
| [Coding standard](standard-di-codifica.md) | `COD-…` rules for all product code, with how each is verified |
| [Verification plan](piano-di-verifica.md) | Verification levels, coverage, review, release criteria |
| [Deviations](deviazioni.md) | Register of deviations from the standard (`DEV-…`) |
| [Traceability](../tracciabilita/README.md) | `REQ-…` requirements, generated matrix, automatic check |

<a id="il-caso-di-affidabilità"></a>

## The reliability case

Argument structure: a top-level claim, subclaims, and for each the supporting
evidence (documents, tests, models). Evidence marked ‘to produce’ becomes passing
as phases progress; a claim without passing evidence is not asserted.

**A0 — No committed data are lost or corrupted without the system detecting and
reporting it** (ADR-0031 §2a).

| Subclaim | Argument | Evidence |
|---|---|---|
| A1 — Data acknowledged as committed are durable | write once, flush before acknowledgment, fail-stop on errors | INV-D1, INV-A1, INV-V1; FI-01, FI-02, FI-05; SPK-07 model *(to produce)* |
| A2 — A crash at any point neither loses data nor leaves ambiguous states | sealed batches, one atomicity point per operation, tail or corruption decidable from contents, idempotent recovery that neither truncates nor deletes due to absence | INV-F1…F3, INV-C7…C9, INV-A7, INV-A9…A11; FI-01…FI-13; simulator *(to produce)* |
| A3 — A multiseries transaction is atomic even with crashes | single durable decision, presumed abort, outcome in the same segment as prepared records | INV-T3, INV-T4, INV-V2, INV-S7; FI-03…FI-05, FI-12; SPK-07 model *(to produce)* |
| A4 — Data damaged after writing are detected before use | read-time verification, scrubbing, quarantine | INV-A2, INV-A6; deliberate corruption, fuzzing *(to produce)* |
| A5 — No silent incorrect answers | end-to-end verification, always-active type and bounds checks, typed errors | INV-A2…A4; warning-free compilation, linter *(active)* |
| A6 — Concurrent reads and writes observe no intermediate states | 64-bit seqlock on a single concurrent table, EBR, single writer, visibility horizon for snapshots | INV-I1, INV-V3…V5, INV-M1…M5; model and real-thread stress *(to produce)* |
| A9 — A deleted document never reappears and a live one never disappears | live-only index, maximum-CSN rebuild, tombstones discarded only with the existence filter | INV-C11; property tests with restarts and nonadjacent MERGEs *(to produce)* |
| A7 — Every requirement is verified | checked bidirectional traceability | INV-A5; `make trace` *(active)* |
| A8 — Resources do not become exhausted in an undefined way | limits on everything, backpressure, waits as bounded parking, index growing one fragment at a time | INV-A8, INV-P5, INV-I3; saturation tests *(to produce)* |

<a id="che-cosa-il-sistema-non-promette"></a>

## What the system does not promise

- Survival of simultaneous loss of all media (backup is required,
  [ADR-0030](../adr/0030-scope-v1.md)).
- Correctness if the operating system or firmware lies about a successful flush
  ([FM-03](analisi-dei-guasti.md#fm-03)).
- Absence of defects in SBCL's compiler, GC, or runtime: end-to-end verification makes
  defects *detectable* ([FM-12](analisi-dei-guasti.md#fm-12)).
- Protection against an adversary (information security: outside v1 scope).
