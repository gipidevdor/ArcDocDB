# ADR-0079 — Verified record cache in serial M1

- **Status:** Accepted for incremental integration under the author's instruction.
- **Date:** 2026-10-31
- **References:** [ADR-0044](0044-cache-acceleratore-puro.md),
  [record cache](../implementazione/cache-record.md), REQ-CCH-001/002/004,
  INV-A12, INV-M3 and INV-A2.

## Decision

Connect the existing location-keyed cache to the final M1 GET view, with a
separate scalar payload grant. Zero remains the default. A positive grant owns
one private cache per handle and must fit at least one eight-way set in each
power-of-two size class, from 1 KiB through the configured maximum frame rounded
up. Classes and finite set doubling use the existing cache's exact payload
accounting. No user-supplied mutable cache can be shared between Serie.

Automatic RAM/paged index switching remains transparent to record caching.
Canonical membership/proof resolution precedes cache lookup; all cached bytes
pass the existing CRC/key/CSN/flags/length verifier. Corrupt copies fall back to
canonical storage. Completed read outcomes provide per-handle saturating counts;
successful corruption fallback also notifies the trusted observer. A fallback
source error remains an engine fault, without authorized output.

Rotation/compaction never retag or invalidate the cache. Immutable locations and
nonreused segment IDs preserve correctness; new locations warm on subsequent
reads. Recovery builds a new cold partition. The Unix library and CLI accept the
same grant without changing wire operations or strong write acknowledgment.

## Verification and boundaries

Differential v1/v2 tests cover legacy/automatic RAM/paged paths, ACTIVE/CLOSED,
fresh recovery, update/delete, primary migration, compaction, cache bit flips,
source corruption, canonical proof rejection with a warm record, exact geometry,
zero grant, closure and CLI validation. Existing interprocess quota/recovery
scenarios also run with the record cache enabled. The complete spike correctness
suite and a paired engine measurement exercise the relevant SPK-05/06/07/09
contracts. [Evidence](../../spikes/results/2026-10-31-engine-record-cache/report.md).

This decision does not introduce background/concurrent readers, group admission,
a scheduler, an RSS ceiling, or a shortcut around CLOSED row verification.
The grant excludes object headers and the primary-index quota. Broader hardware,
power loss and load targets remain open; no spike code is promoted to product.
