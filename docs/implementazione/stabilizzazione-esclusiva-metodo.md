<a id="collegamento-della-stabilizzazione-alla-pubblicazione-esclusiva"></a>

# Connecting stabilization to exclusive publication

> **Integration proposal** — Method of 2026-10-22, before functional
> changes and diagnostics. Applies ADR-0040 §2–3 and
> INV-A9/A10/A11 without changing formats, decisions, or admission.

<a id="base-e-incremento"></a>

## Base and increment

This integration composes exclusive publication from branch
`codex/recovery-publish-temporary` (`a478cf94`) and idempotent
stabilization merged into `main` (`52ca4f77`). Integration resolves only
component/export lists in ASD and package, retaining both
APIs and all versioned originals. The primary copy is not
modified by this work.

`stabilizza-nome-fonte-recuperata` continues checking semantic token,
CONTROL, set row, and read-only FD before delegating to the I/O module.
`stabilizza-nome-temporaneo` retains both name observations and
T/NIL return; only the rename path changes:

1. Common preflight of names, modes, and identity backends.
2. Observation: exactly one of the two names must designate FD.
3. If temporary, exclusive-publication preflight **before** effect
   boundary; exclusive callback mandatory, no fallback.
4. Within existing cleanup boundary, temporary branch calls
   `pubblica-temporaneo`; final branch invokes no rename.
5. Common postcondition on both names, parent fsync, and FD still open.

The final branch requires identity and flush without ordinary/exclusive
rename callback or native rename symbol. The temporary branch
requires `:rename-exclusive` even if backend has `:rename`.
Public publication API retains preflight, bounded private copies,
and identity verification: no second rename engine.
Additional short-name copies are a declared cold-path
cost; no new private path is introduced to avoid them.

<a id="guasti-autorità-e-limiti"></a>

## Faults, authority, and limits

The preliminary absence check remains a namespace diagnostic;
the exclusive syscall prevents target replacement even if the target appears
before rename. Source identity still requires exclusive,
stable namespace. No concurrent-recovery promise.

Missing callback/symbol in temporary branch: rejection before the effect
boundary, capabilities still open. Rename error, syscall collision,
failed postcondition or flush, and interruption during completion:
original cleanup, still-OPEN parent becomes FAULTED, cause preserved.
No retry, rollback, close, unlink, or segment write/truncation.
Reacquisition observes temporary or final state and repeats only
completion justified by authoritative EDIT.

The new connection does not complete all recovery actions,
proof-based removal, checkpoint, indexes, or admission.
A Serie remains an independent unit: no thread, lock, register, or
write is added between Serie; parent fsync remains per successful source.

<a id="decisioni-e-piano-delle-diagnostiche"></a>

## Decisions and diagnostic plan

| ID | Boundary to qualify |
|---|---|
| SNE-D01 | Common preflight without rename callback; each required identity callback |
| SNE-D02 | Only temporary branch requires exclusive callback/symbol, before effect |
| SNE-D03 | Temporary branch uses exclusive publication; `:rename` is not fallback |
| SNE-D04 | Final branch without rename retains postcondition and required fsync |
| SNE-D05 | Two cleanup levels preserve cause and do not reopen CLOSED/FAULTED |
| SNE-D06 | ACTIVE/CLOSED tokens, u64 IDs, FD, and CONTROL remain those of verified source |

Code and documentation are committed before processes run; review agent assignments
end before diagnostics. Forced product-only compilation
with fatal warnings and private hierarchical cache; lint,
traceability, links, and disassembly reading, all recorded
with revision, hashes, environment, and originals. Independent review and
two author C1 rereadings remain static.

No functional tests, FI, coverage, mutations, or benchmarks were added
or run. SNE-D01…D06, PIO-D01…D09, and SNR-D01…D09 remain to qualify.
Local diagnostics are not execution of the new API or GitHub CI.
Records are collected into new closed archives with the common collector,
four workers, and independent checker; earlier originals
remain unchanged. Lossless preservation may use gzip descriptors
before collection; no FASL or cache is published.
