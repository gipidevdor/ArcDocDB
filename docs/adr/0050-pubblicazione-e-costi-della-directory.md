<a id="adr-0050--pubblicazione-e-costi-della-directory-dellindice"></a>

# ADR-0050 — Publication and costs of the index directory

- **Status:** Accepted; memory model and scaling remain to be verified.
- **Date:** 2026-10-08
- **Relationship to the specification:** no amendment; clarifies items 2 and 3 and the
  consequences of [ADR-0043](0043-primary-index-a-frammenti.md). Also applies to
  the v2 layout in [ADR-0048](0048-limiti-documentali-e-formato-v2.md).
- **References:** INV-I3, INV-A8, REQ-IDX-007,
  [SPK-01](../../spikes/SPK-01-primary-index/README.md).

<a id="contesto"></a>

## Context

The experiment uses an immutable root, published through CAS. Each split or rebuild
produces a new directory. Copying at most C fragment slots does not bound
this directory's cost: **2^G references** are copied, even when it does not
 double. The earlier claim of maximum cost C and no pause proportional to
Serie size omitted this work and key copying.

Reading a retired fragment can still be linearizable during the operation.
Its frozen state does not, however, set the linearization point at the
initial reference read: the writer can update a slot between that read
and retirement. The reader would observe the later state. This
observation corrects a proposed instant; it **does not prove** an incorrect answer
from the old protocol in every replacement case.

<a id="decisione"></a>

## Decision

1. The writer builds fragments and directories outside the published root and
   publishes a new indivisible root with an increasing generation. It no longer modifies
   replaced fragments. Generations and seqlocks cannot wrap.
2. The reader acquires the root, reads the fragment using the seqlock, executes the
   read barrier, and rechecks root and generation **even on a miss**. If
   they changed, it discards the result. Retries share the seqlock
   limit; at the limit, the task passes to the same Serie's writer, without unbounded
   spinning. The harness-only mutex is not the production mechanism.
3. Each maintenance operation separately states slots visited/copied, key
   bytes, directory references, transient memory, and duration. The C limit
   concerns the slots of one source fragment. The directory costs O(2^G), with
   a configured maximum depth and budget checked before publication.
4. The transient budget includes old and new maintenance arrays and
   the new directory. Live payload is not RSS: roots retained by readers,
   uncollected garbage, headers, and runtime have additional costs. Worker count
   and in-flight operations remain bounded under ADR-0045.
5. No pause independent of Serie size is claimed for
   this representation. SPK-01 measures directory and key costs;
   SPK-02 measures the collector. A paged or persistent directory
   will require an ADR and comparison if measurements miss the budgets.

No coordination between Serie is introduced. Construction and publication
are serial in the owning writer; readers do not modify shared counters
per operation. No persistent format changes.

<a id="verifica-e-limiti"></a>

## Verification and limits

SPK-01 injects a replacement between fragment acquisition and probing:
it checks retries for both an old hit and a miss that becomes a hit. The
differential suite and stress tests remain evidence limited to the scenarios run.
SPK-07 still needs to model actual publication; disassembly and the
memory model must be verified on ARM64 and x86-64. GC retains referenced
objects but does not guarantee a maximum release time.
