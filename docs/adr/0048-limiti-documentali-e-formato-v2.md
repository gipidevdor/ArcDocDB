<a id="adr-0048--limiti-documentali-e-formato-v2"></a>

# ADR-0048 — Document limits and v2 format

- **Status:** Accepted for the design; implementation and verification remain to be produced.
- **Date:** 2026-10-08
- **Relationship to the specification:** clarifies the document contract; partly supersedes ADR-0014 (limits), ADR-0039 (key-len), ADR-0043 (slots). Does not change atomicity, parallelism, or reclamation.
- **References:** INV-F1, INV-A8, REQ-LIM-001…003.

<a id="decisione"></a>

## Decision

1. A deterministic CBOR document occupies at most **exactly 16 MiB (16,777,216 bytes)**, including its CBOR encoding, excluding the key and storage header. This is also the default; a Serie can configure a lower maximum. The limit applies to uncompressed bytes.
2. A document allows **100 container levels**: a root map or array counts as level 1; each nested map or array adds 1. Map keys and values are traversed. The decoder maintains explicit counters and budgets; it does not depend on the native stack. Nodes, bytes, requests, and responses have separate budgets. The document is validated before admission to the writer.
3. `_id` remains a binary sequence compared byte by byte, **1–65,535 bytes** long. The default allows the full range; lower limits are configurable per Serie. Generated identifiers remain 16 bytes. BSON type semantics are not introduced; extending to 65,535 bytes is an ArcDocDB choice, not a limit copied from MongoDB.
4. Records and hints adopt **format version 2**. The frame remains 24 bytes: offset 10 is `u16 key-len`, without a reserved byte at 11; header and body CRCs are unchanged. Maximum PUT length: **16,842,775 bytes** (24 + 65,535 + 16,777,216). Hint entries remain 24 bytes: `u32 offset`, `u32 len`, `u64 csn`, `u32 key-off`, `u16 key-len`, `u8 tipo`, `u8 flag`.
5. Primary slot: **five u64 words**, plus control (41 bytes/slot): CSN; location; `key-off(32) · key-len(16) · flag(8) · riservato(8)`; seqlock; `record-len(32) · riservato(32)`. Retained versions add one word. Fragments remain bounded by slot count; key copying also has byte, time, and memory budgets. The arena is not preallocated for all maximum-size keys. Budget exhaustion rejects the operation before commit, without partial acknowledgments.
6. Segments retain the 256 MiB target and 4 GiB − 1 limit. There is no fixed limit on total Serie size beyond identifiers, resources, and the file system. The record and its SEAL must fit in the segment: rotate before append if necessary.

<a id="versionamento-e-migrazione"></a>

## Versioning and migration

Decoders select the layout from the file version; they do not interpret v1 as v2. Existing spikes remain v1 experiments and their measurements do not verify v2. An offline converter reads v1, writes and verifies v2 in new files, publishes the new manifest with EDIT, and retains sources until reclamation. Never in-place updates. This converter is designed, not implemented.

<a id="costi-e-verifica"></a>

## Costs and verification

+8 bytes per slot compared with ADR-0043; long keys increase hashing, comparison, memory, and split costs. Earlier estimates are not guaranteed capacities of the new layout.

Required checks: 16 MiB documents accepted and 16 MiB + 1 rejected; depths 100/101; keys 1/255/256/65,535/65,536; both versions and unknown versions; corrupt lengths, truncations, budget saturation; crashes during conversion. The v2 gate precedes engine implementation.

<a id="riferimento-esterno"></a>

## External reference

MongoDB limits BSON documents to 16 MiB and nesting to 100 levels. Total collection/database sizes depend on resources and the file system. These are product references, not equivalence of formats or performance: [official limits](https://www.mongodb.com/docs/manual/reference/limits/) (accessed 2026-10-08).
