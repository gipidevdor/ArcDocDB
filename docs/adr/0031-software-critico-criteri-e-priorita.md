<a id="adr-0031--arcdocdb-è-software-critico-priorità-classi-di-integrità-regole"></a>

# ADR-0031 — ArcDocDB is critical software: priorities, integrity classes, rules

- **Status:** Accepted (author's decision, 2026-10-03)
- **Date:** 2026-10-03
- **Relationship to the specification:** **amends** the specification's priority order:
  its performance objectives become subordinate to reliability. No functional
  requirement of the specification is removed.
- **References:** [reliability](../affidabilita/README.md),
  [failure analysis](../affidabilita/analisi-dei-guasti.md),
  [coding standard](../affidabilita/standard-di-codifica.md),
  [verification plan](../affidabilita/piano-di-verifica.md),
  [traceability](../tracciabilita/README.md)

<a id="contesto"></a>

## Context

The author requested the criteria typical of critical software: perfect code,
perfect functionality, traceability; the ultimate aim is total, extreme reliability;
“very reasonable” performance constraints. The project had been set up with performance
as its main motivation (the specification names “high speed” as the main objective).

<a id="decisione"></a>

## Decision

<a id="1-gerarchia-delle-priorità"></a>

### 1. Priority hierarchy

In descending order:

1. **Integrity of committed data.**
2. **Functional correctness** against the specification.
3. **Defined behavior in the presence of faults:** fail-stop or controlled degradation,
   never incorrect data.
4. **Verifiability and traceability.**
5. **Availability.**
6. **Performance.**

Rule: **a lower-priority choice cannot weaken a higher-priority guarantee.** Every
tradeoff favoring performance requires an ADR, a measurement, and a demonstration
that higher priorities are unaffected.

<a id="2-che-cosa-significa-affidabilità-totale"></a>

### 2. What “total reliability” means

It does not mean the absence of faults, which no software can guarantee. It means the
following four properties, each verifiable:

- (a) **no committed data is lost or corrupted without the system detecting and
  reporting it**;
- (b) **no incorrect answer is silently returned**: unverified data is never
  returned;
- (c) **every fault in the [fault model](../affidabilita/analisi-dei-guasti.md) has a
  defined, verified response** (detection, containment, recovery);
- (d) **every requirement is traced** from specification through verification,
  and traceability is checked by a tool.

Faults **outside** the model (simultaneous loss of all storage media, an operating system
or firmware that lies about a flush, compiler defects) cannot be ruled out:
they are made detectable where possible and declared as residual risks in the
[risk register](../valutazione/registro-rischi.md).

<a id="3-classi-di-integrità-del-software"></a>

### 3. Software integrity classes

| Class | Contents | Effect of a defect |
|---|---|---|
| **C1** — data path | record and file codecs, segments, control log, `multiserie.log`, recovery, primary index, MVCC and CSN, transactions, compaction (swap, reclaim), `io` module, catalog, verification on read, cache (data path) | data loss or corruption |
| **C2** — functional correctness without persistent effects | Query Engine, protocol, contract validation, secondary indexes (querying) | incorrect answer |
| **C3** — resource control | scheduler, thread pool, cache replacement policy, metrics, compaction scheduler | degraded performance or availability; **must not** be able to violate C1/C2 |
| **C4** — tools | linter, traceability checker, test harness, benchmarks | false confidence (they are verified too) |

A module takes the class of its most critical component. C3 code operates within verified
**protective barriers**: a scheduler error can slow or reject work, never
change data.

<a id="4-rigore-per-classe"></a>

### 4. Rigor by class

| Activity | C1 | C2 | C3 | C4 |
|---|---|---|---|---|
| Requirement traced through tests | mandatory | mandatory | mandatory | — |
| Coding standard ([ADR-0034](0034-policy-di-compilazione-e-standard-di-codifica.md)) | full | full | full | partial |
| Review | two passes with checklist | two passes | one | one |
| Statement and branch coverage | 100 %, exceptions listed and justified | 100 % | ≥ 95 % | — |
| Condition coverage in compound decisions | 100 % (MC/DC equivalent) | for flagged decisions | — | — |
| Explored protocol model | yes, for protocols | — | — | — |
| Fault injection | yes (FI-01…FI-13) | — | load reversal | — |
| Differential test against the reference model | yes | yes | — | — |
| Decoder fuzzing | yes | yes | — | — |
| Mutation testing | yes | — | — | — |
| Soak test with repeated crashes | yes | — | — | — |

Full strategy in [ADR-0035](0035-strategia-di-verifica-e-tracciabilita.md) and the
[verification plan](../affidabilita/piano-di-verifica.md).

<a id="5-prestazioni"></a>

### 5. Performance

- The specification's objectives remain **objectives**. The **binding** requirements
  are the minimums in [ADR-0028](0028-target-e-obiettivi-di-latenza.md), reasonable by construction.
- The cost of reliability checks (verification on read, bounds and type checks,
  scrubbing) is **accepted** and is no reason to remove them: if a minimum is not met,
  algorithms and structures are changed, not checks.
- No optimization without a reproducible measurement (INV-X2) and without the relevant
  class's verification suite remaining green.

<a id="6-deviazioni"></a>

### 6. Deviations

The rules apply to all product code. A departure is allowed only as a
**recorded deviation** (`DEV-nnn`) in
[deviazioni.md](../affidabilita/deviazioni.md): justification, risk, compensating
measure, author's approval.

<a id="basi-di-riferimento"></a>

## Reference basis

Adapted criteria, not certification. Sources: DO-178C and DO-333 (verification objectives,
bidirectional traceability, structural coverage, formal methods); IEC 61508-3 (recommended
techniques: defensive programming, fault injection, model-based testing); G. Holzmann's
“Power of 10” rules (JPL) for coding; reliable database practice:
SQLite (branch coverage, I/O and memory fault injection), FoundationDB and TigerBeetle
(deterministic simulation, always-on assertions), PostgreSQL (`fsync` failure
treated as fatal after the known 2018 defect).

<a id="limiti-dichiarati"></a>

## Declared limits

- **No formal certification** is claimed; the techniques are adopted, not an
  organization's process.
- **Limited verification independence**: there is one author; mitigation comes from
  automated tools, checklist reviews, and rereading by a second independent
  reviewer (including an automated one) *of data, not conclusions* (RSK-20).
- **SBCL is not qualified**: compiler, GC, and runtime are part of the trusted base
  (RSK-18); defenses are end-to-end checks, pinned versions, and testing on multiple
  platforms.

<a id="conseguenze"></a>

## Consequences

- Three new artifact sets: failure analysis, traced requirements, standards and
  verification plan.
- Eight new invariants (INV-A1…INV-A8).
- Some earlier choices need review under these criteria: ADR-0015 (seqlock,
  → [ADR-0032](0032-seqlock-a-64-bit.md)), ADR-0019 (`:async`), ADR-0028 (objectives),
  ADR-0030 (scope: a single data copy).

<a id="alternative-considerate"></a>

## Alternatives considered

- *Keep performance as the priority with a good test suite:* incompatible with the
  author's request.
- *Formally adopt a standard (DO-178C, IEC 61508) with a declared integrity level:*
  requires organizational processes and assessments outside the scope; the
  techniques are adopted with custom traceability.

<a id="valutazione"></a>

## Assessment

- Risks: RSK-17…RSK-20 (new).
- Verification: the [traceability matrix](../tracciabilita/matrice.md) is checked by
  `make trace`; every invariant and FI scenario is covered by at least one requirement.
