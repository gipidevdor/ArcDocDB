<a id="hash-delle-chiavi-e-seme-dellindice"></a>

# Key hashing and index seed

<a id="contratto"></a>

## Contract

ADR-0014 requires a noncryptographic 64-bit hash with a per-Serie seed.
Kernel implements XXH64 from the
[official xxHash v0.8.3 specification](https://github.com/Cyan4973/xxHash/blob/v0.8.3/doc/xxhash_spec.md).
No product dependencies beyond SBCL/ASDF introduced. References:
REQ-IDX-001, REQ-IDX-003, REQ-IDX-005, REQ-LIM-003, REQ-AFF-004, and REQ-AFF-008;
invariants INV-I3 and INV-P6.

```lisp
(arcdocdb.hash64:xxh64 octets start end seed-high seed-low)
;; => high, low: exactly two u32s
```

Half-open span, zero to 65,535 bytes, simple u8 vector. Empty-span hash
is allowed; writer separately retains the minimum one-byte
key constraint. Both u32 words are fixnums on 64-bit SBCL. No u64
crosses the public boundary: modular operations and inline helpers retain
native words. Safety 3 and type/range checks stay active.
Caller keeps buffer and seed unchanged throughout call.

Validation rejects nonconforming types/seeds with INVALID-ARGUMENT
`:hash-arguments`, out-of-buffer span with `:buffer-range`, length beyond
limit with `:hash-span-limit`. Input unchanged even on rejection.
Kernel owns no state, locks, scratch, I/O, or random sources.

<a id="seme-posseduto-dalla-serie"></a>

## Serie-owned seed

`crea-indice-primario` accepts `:hash-seed-high` and `:hash-seed-low`:
both explicit u32 or both NIL. Incomplete/nonconforming pair
rejected with `:primary-hash-seed-configuration` before arrays.
Configured seed is read-only for index lifetime.
`digest-chiave-indice` checks health/configuration and uses this pair.
Index without seed retains low-level API with trusted digests;
new hash APIs reject it with `:primary-hash-unconfigured`.
An inconsistent internal pair makes index terminal with
`:primary-hash-seed-corrupt`.

Generation, injectable entropy, restart rebuilding, and seed choice
belong to controller. No implicit random value introduced,
nor is changing a populated root's seed allowed. Precalculated-digest
APIs remain trusted subsystem interfaces; external boundary
must calculate the same index-owned digest.

<a id="digest-per-la-ricostruzione"></a>

## Digests for rebuilding

```lisp
(arcdocdb.index.primary:calcola-digests-frammento
 index source highs lows seed-high seed-low)
;; => C, live-slots, hashed-key-bytes
```

Writer only with exclusive token. Source must be canonical,
current, published, and writable. Two distinct simple u32 arrays of C elements,
private and already reserved. Preflight of types, lengths, aliases, and complete
seed matching index pair, before allocations or writes.
Checking both u32 words does not depend on the few bits observable
in fingerprint or fragment prefix.

A C-slot scan samples payload, computes XXH64 over live bytes,
and verifies fingerprint, prefix, and lookup to original physical slot.
Writes live cells only; EMPTY/DELETED retain sentinels.
Result feeds the [verified builder](indice-ricostruzione.md).
Root, bank, arena, healthy state, and revision are not modified.
Domain/corruption error follows existing fail-stop; partial private maps
on scan error are discarded, without index rollback.
Missing root: `:primary-index-missing-root`. Internally recalculated
digest mismatch: `:primary-hash-source-digest`, always FAULTED.
Trusted external rebuild digests retain rejection contract.

Separate budget: maps 8*C bytes and two fixed scratch areas of five u64 words,
80 payload bytes beyond headers/runtime. Not part of rebuild copy
budget. Cost: O(C + live-key-bytes) for scan/hash,
plus original probes bounded by C per key; hostile case O(C²*K).
No constant-pause or P99 claim. Maintenance allocates outside
hot path.

<a id="verifica"></a>

## Verification

[Campaign and method](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-key-hash/README.md).
[Reviews and corrections](hash-chiavi-revisione.md).
[Preserved tests and measurements](hash-chiavi-risultati.md).
Independent cold oracle, upstream vectors, every remainder and alignment,
beyond-fixnum seeds, immutability, and real workers. Map tests with
lookup/rebuild/split, named predicates and mutants; serial and
parallel measurements separate after checks.

Hash and fingerprint are accelerators: lookup always decides with
bytewise key comparison. Digest is not used to authenticate
input or persistent data. Remaining: controller/seed lifecycle, full GET,
engine measurements, P99, and reference-platform qualification.
