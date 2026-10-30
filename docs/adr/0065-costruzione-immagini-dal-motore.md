<a id="adr-0065--costruzione-delle-immagini-primarie-dal-motore-m1"></a>

# ADR-0065 — Building primary images from the M1 engine

- **Status:** Accepted in the incremental integration authorized by the author on 2026-10-29
- **Date:** 2026-10-29
- **References:** ADR-0058, ADR-0063, ADR-0064; REQ-IDX-009, REQ-IDX-010, INV-I8, INV-A8, INV-P6
- **Relationship to the specification:** makes the M1 derivative producer concrete, without new authoritative formats

<a id="decisione"></a>

## Decision

The serial M1 actor can prepare an image of its canonical index
through `costruisci-indice-paginato-motore`. The request excludes reentry and
writes until completion; the resident remains unchanged and present.
The source is the one defined by ADR-0064, recovered by the engine rather than supplied
by the caller. The derivative remains private, selectable at startup.

The plan retains slot IDs and high/low digests, without duplicating all
keys. A bounded fragment scan acquires candidates; eight
stable radix passes sort only metadata by unsigned 64-bit digest.
Postorder emission produces buckets at most 7/8 full and directories with
adaptive fanout, up to seven bits per node. The endpoints of the sorted
subset determine common prefixes to skip. Children consume at least
one bit: maximum depth of 65 calls, including the final leaf.
Completely identical digests produce an overflow-bucket chain.
Correctness does not depend on the probabilistic distribution of hashes.

Keys are copied only for the current batch; the builder receives
a span of the resident arena and owns only one copy. Routing,
packing, per-batch quotas, and PageRef constraints remain checked by
ADR-0058 primitives. The fragment count must meet maximum
load before allocating the plan and match the actual scan.

The new name `primary-<16 hex>.idx.tmp` comes from the option already valid
under ADR-0064. For construction, the ID must be in 1..2^60-1 and becomes the image
ID; initial generation is one. An existing name is rejected;
creation uses O_EXCL. No authority is extracted from the name: UUID,
source, and candidates are always verified separately. The private
namespace and absence of name reuse remain controller preconditions.

After prefix and pages, the engine rechecks source and revision, seals the
file with ARCIRF01 and flush, synchronizes the directory, and closes append access. It
then opens the same name read-only with verified EOF and rereads the entire image
against the resident. Only after this verification, another source check,
and closing every local FD does it return the option to the caller.
At most two local capabilities, none accumulated in the engine handle.

The operation prepares a derivative: it does not assign a CSN, modify WAL or
CONTROL, adopt a new root, or publish/rename in the catalog.
Directory flush concerns only creation of the temporary file.
The next data write makes the newly built image obsolete.

<a id="budget-ed-errori"></a>

## Budgets and errors

The construction-payload limit is explicit and checked before large
arrays and the new file. It includes plan arrays, the maximum key
batch, builder, radix stack, and read-only verification. It is an application-payload
limit, not RSS: headers, objects, GC, and runtime transients
remain in the controller reservation, separate and unqualified here.
Qualification of the overall quota for migration beyond RAM remains open.

Page and file-byte quotas are finite and checked
for every batch; the cumulative verification budget comes from the option.
Preflight does not promise reservation of the entire image: a quota
exhausted after creation leaves an incomplete prepared file and makes M1
FAULTED. The same applies to faults, errors, or nonlocal exits after admission.
All FD cleanup is attempted, the primary cause preserved, and cleanup faults
aggregated. No automatic deletion or replacement of a file.
Ordinary configuration, memory, and occupied-name preflight failures keep
the engine READY. Namespace faults instead close admission.

<a id="seguito-e-rollback"></a>

## Follow-up and rollback

The complete producer → seal → verify → restart → paged GET path
is available without fixtures constructing files in place of the product.
Automatic selection, writer delta, durable catalog, snapshots, and datasets
beyond resident capacity remain separate. To return to the resident,
open without the derivative option; canonical data is not migrated.
Contract and tests in [M1 construction](../implementazione/costruzione-indice-m1.md).
