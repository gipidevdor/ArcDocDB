<a id="adr-0058--pagine-derivate-dellindice-primario"></a>

# ADR-0058 — Derived primary-index pages

- **Status:** Accepted in the incremental implementation authorized by the author
- **Date:** 2026-10-22
- **Relationship to the specification:** makes ADR-0049's page format and
  ADR-0057 increment I2 concrete; does not replace the resident primary index, logs, or commit
- **References:** REQ-IDX-009, INV-I8, INV-A2, INV-A8, INV-P6;
  [format and verification](../implementazione/pagine-indice.md)

<a id="decisione"></a>

## Decision

The ARCIPG01 format, version 1, uses little-endian pages of 4096, 16384, or
65536 bytes. Size will be uniform within an index image and will not
change in place. The 96-byte header contains Serie and image identity,
physical offset, generation, geometry, and two separate CRC32Cs.
The codec operates only on owned buffers; it does not write files or roots.

Three types: flat bucket with seven-bit controls and groups of 16, radix
directory with 16-byte PageRefs, key fragment. The bucket retains digest,
CSN, location, and v2 length; no ordered tree replaces flat
lookup. Seqlocks and Lisp objects are not serialized. An immutable bucket uses
only EMPTY and live fingerprints, without tombstones; DELETE and history remain
the responsibility of the future backend and existing MVCC protocols.

PageRef = (offset, generation), in the domain (Serie, image, size).
Zero/zero means absence. Positive offsets are aligned, below 2^60, and never
reused within the same image. Each reference points to a lower offset
and a generation no greater than its parent's: children are built before
parents, including overflow and key fragments from the end. Local graphs
cannot form cycles; full reachability, coverage, and durability
remain integration obligations. No wrapping or recycling of identities.

Inline keys are packed in physical slot order, without
overlaps or gaps. External keys, up to 65535 bytes, use fragments
with verifiable total and position. Chains and identical hashes are not
resolved by the digest: future lookup compares all bytes with an explicit
budget. The codec checks form and local probing; it does not recalculate the hash
without the authoritative seed or certify uniqueness or committed visibility.

<a id="fondamento-e-alternative"></a>

## Rationale and alternatives

- [Swiss tables](https://abseil.io/about/design/swisstables): compact controls
  and fingerprints; consistent with ADR-0015/0043 and the resident code.
- [PostgreSQL hash](https://www.postgresql.org/docs/13/hash-implementation.html):
  buckets and overflow pages are an established persistent pattern.
- [SQLite](https://www.sqlite.org/fileformat.html#cell_payload_overflow_pages):
  dedicated long-payload pages avoid an implicit page-size limit.
- [CouchDB](https://docs.couchdb.org/en/stable/intro/overview.html):
  derived append-only structures; the topology with earlier children is a specific,
  verifiable ArcDocDB choice, not a guarantee inherited from CouchDB.

A B-tree would change the algorithm and workload without the necessary evidence. A single
resident directory would reproduce the RAM limit. mmap does not make
frame budgets explicit. All three sizes are supported; a performance
preference requires benchmarks and cannot be inferred from the codec.

<a id="atomicita-rollback-e-limiti"></a>

## Atomicity, rollback, and limits

Serializing and verifying a page only prepares a derived object in RAM.
The format contains no new commit marker; SEAL/EDIT/DECISION retain
authority. File container, identity allocation, root publication,
flush, snapshots, cache, reclamation, and recovery beyond RAM will be integrated
separately before use in the engine. An incomplete image is not ready.
Current rollback removes the unconnected codec without migrating user data.

I2 qualifies the local representation, not the complete graph, storage
beyond RAM, lock-free progress, or performance. Checks include
independent fixtures for three sizes/types, maximum keys, collisions, overflow,
full pages, directories from splits, truncations, CRCs, identities, and alterations with
recalculated CRCs. No changes to already accepted ADRs or closed archives.
