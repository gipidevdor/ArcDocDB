<a id="adr-0047--verifica-indipendente-del-csn-di-un-record-prepared"></a>

# ADR-0047 — Independent CSN verification for a prepared record

- **Status:** Accepted
- **Date:** 2026-10-08
- **Relationship to the specification:** no amendment; strengthens the read verification in item 4
  of [ADR-0039](0039-cornice-unica-dei-record.md), applying INV-A2.
- **References:** [SPK-09](../../spikes/SPK-09-integrity/README.md), INV-A2, INV-S7,
  REQ-FOR-004, FM-11.

<a id="contesto-e-controesempio"></a>

## Context and counterexample

In an ordinary record, `stamp` is the CSN and is compared with the index. In a prepared record it is the
TXID: ADR-0039's first rule checked only that the entry also had the prepared
flag. Two prepared records for the same key, of the same length, may
belong to different commits. A location corrupted in RAM may point to the wrong
record: both CRCs are valid, key and flag match, but the returned version
is not the one in the index or snapshot.

<a id="decisione"></a>

## Decision

1. Checking a prepared record's CRC, key, and flag is **only parsing**. Returning
   its value to the caller requires verifying its effective CSN.
2. The reader resolves the TXID through the segment's authoritative source: an OUTCOME record
   in the same segment, or the outcomes in the EDIT that closed it during recovery.
   The proof is also read and verified before its TXID and CSN are used.
3. The proof's TXID must match the record's `stamp`; the proof's CSN must
   match the entry's CSN. Missing, altered, or inconsistent proof produces an integrity
   error, never a value.
4. Lookup may use a derived index and a cache, but durable proof remains the source
   of truth. The verifier must also check proof identity, so an incorrect
   location in the resolution index is not accepted. Structures have limits
   proportional to the segment's records. No lookup modifies state shared between Serie.
5. The resolved value in hints is useful for index reconstruction; by itself it does not waive
   read verification. After CLEAN/MERGE the record is ordinary and has no such cost.

No on-disk format or four-word index layout changes. The additional
cost applies to prepared records not yet normalized by compaction: a proof
lookup and verification. The resolver budget and cache are to be measured in
SPK-05, without removing the comparison when the resolver is unavailable.

<a id="verifica-e-limiti"></a>

## Verification and limits

SPK-09 uses a real OUTCOME in ADR-0039's frame, verifies CRCs, and compares TXID and
CSN; it must reject proof referring to another transaction or version. Reading
proof from the manifest, positional lookup, caching, and I/O errors belong to the
future engine. Spike tests do not promote the resolver to implemented-component status.
