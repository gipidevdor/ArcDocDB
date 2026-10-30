<a id="principi-di-ingegneria"></a>

# Engineering principles

> Author's decision (2026-10-03): write it once, using the best known solution.
> Do not write code ‘to improve later’.

<a id="software-critico"></a>

## Critical software

Since 2026-10-03, the project has been treated as critical software
([ADR-0031](adr/0031-software-critico-criteri-e-priorita.md)): reliability takes precedence over
performance, and a pattern is ‘best’ only if that also holds for **integrity guarantees
and verifiability**. The six conditions below remain; a seventh is added.
The [design analysis](analisi-progettuale.md) adds an eighth: parallelism
as a foundational principle.

<a id="che-cosa-significa-la-soluzione-migliore"></a>

## What ‘the best solution’ means

‘10/10’ is not an objective score; it is an admission criterion. A pattern is admitted to
ArcDocDB only if it satisfies **all** conditions:

1. **Track record.** It is used in production by at least one known storage system or
   database for the same problem, or derives from a published, verified result. The ADR cites where.
2. **Alignment with invariants.** It guarantees the [invariants](invarianti.md) *by construction*
   where possible, rather than through programmer discipline.
3. **No known failure mode for our case.** If the pattern has a known weakness
   (e.g., participant blocking in 2PC), the ADR explains how it is neutralized.
4. **The simplest solution that fully satisfies the requirement.** With 1–3 equal, the
   solution with fewer mechanisms wins; an extra mechanism must be justified by a requirement,
   not a possibility.
5. **Implementable in Common Lisp only** ([ADR-0001](adr/0001-common-lisp-sbcl.md)) without
   hot-path allocations.
6. **Verifiable.** There is a way to show it works: an explorable model, fault-injection
   tests, or a reproducible benchmark.
7. **Guaranteed by construction, not timing.** Correctness does not depend on relative
   thread speeds or an ‘unlikely’ event: a probabilistic or timing argument is not a
   guarantee ([ADR-0032](adr/0032-seqlock-a-64-bit.md) is an example).

8. **Introduces no serialization point.** Parallelism is a foundational principle
   ([ADR-0036](adr/0036-leggi-di-progetto.md), INV-P6): a pattern is admitted only if it adds
   no lock or shared write between Serie per operation. If a higher-level guarantee
   requires a shared point, the ADR declares and bounds it and places it where it costs
   least ([ADR-0038](adr/0038-orizzonte-di-visibilita.md) is an example).

If no option satisfies all conditions, **no code is written**: record the question,
run the missing spike, and decide afterward.

<a id="regole-di-lavoro"></a>

## Working rules

- **Decide first, write afterward.** Every mechanism has an accepted ADR *before* the first
  line of code. The ADR fixes patterns, formats, guaranteed invariants, and verification.
- **Final form.** Code is written in its final form: no `TODO`, placeholders,
  ‘version 1 to refactor’, hardcoded parameters ‘for now’, or deferred error handling.
- **No ‘good enough’ alternatives.** If two solutions qualify, the ADR chooses and explains
  why; the second is not kept as a reserve in the code.
- **Measurements change numbers, not architecture.** Benchmarks tune thresholds and parameters
  declared configurable by the ADR. If a measurement invalidates a mechanism, write a new
  ADR superseding the previous one: do not ‘adjust’ the code.
- **Spikes are not product code.** They are disposable experiments in [`spikes/`](../spikes/README.md):
  they are not promoted and do not count as provisional code.
- **A persistent format does not change.** Every on-disk format has a version and magic number;
  a format change is a new format with migration, never an in-place modification.
- **One source of truth for each fact.** Every derivative (metadata, indexes, caches) is
  rebuildable and declares from what.

<a id="che-cosa-resta-fuori"></a>

## What remains outside

This principle does not remove uncertainty about *performance*: some questions (GC-pause
duration, concurrent-flush scalability) can be answered only by measurement. In those
cases, the ADR states the hypothesis, the spike that tests it, and which result would
cause it to be superseded. Code depending on that hypothesis is still written in the
final form specified by the ADR.
