<a id="adr-0052--header-di-controllog-e-multiserielog"></a>

# ADR-0052 — Headers of control.log and multiserie.log

- **Status:** Accepted; format completion before the first codec
- **Date:** 2026-10-08
- **Relationship to the specification:** clarifies the header offsets already provided for
  by [ADR-0040](0040-manifest-a-record-unico.md) and
  [ADR-0041](0041-multiserie-segmenti-autosufficienti.md).
- **References:** [on-disk formats](../formati-su-disco.md),
  [ADR-0048](0048-limiti-documentali-e-formato-v2.md)

<a id="contesto"></a>

## Context

Both logs provide for a 64-byte header with magic, version, identity, and CRC.
The offset table was defined only for segments. A codec requires
 a complete layout and comparison with the authoritative identity before passing
 the version to the record decoder.

<a id="decisione"></a>

## Decision

Both logs use this header in versions 1 and 2:

| Offset | Type | Field |
|---|---|---|
| 0 | `char[8]` | `ARCDCTL1` for control; `ARCDMSL1` for multiseries |
| 8 | `u16` | record format version, little-endian |
| 10 | `byte[6]` | reserved, zero |
| 16 | `byte[16]` | Serie identity for control; Archivio identity for multiseries |
| 32 | `byte[24]` | reserved, zero |
| 56 | `u32` | CRC32C of bytes 0–55 |
| 60 | `byte[4]` | reserved, zero, checked separately from the CRC |

The Archivio identity is fixed at 16 opaque bytes, with exact comparison;
this completes a previously undefined detail. The codec does not generate identities.
The magic remains unchanged between v1 and v2; the version field decides. Origin,
segment-id, and timestamp are not fields in these headers. The zero identifier
of log SEALs remains in the SEAL and does not replace the header identity.

The caller supplies the type and identity from the authoritative source. The decoder verifies
length, CRC, magic of the expected type, supported version, all reserved fields, and
identity. An incomplete or damaged header is an integrity error;
the tail rule applies to subsequent batches, after a verified header.
An unknown version with a correct CRC is `unsupported-format`.

<a id="conseguenze"></a>

## Consequences

The first decoder fixes this layout: later changes require a new
version and migration. No data migration is needed for these logs, whose header
had no previous product codec. Records and atomicity points for
EDIT, DECISION, and rename remain those of their respective ADRs.

<a id="alternative-considerate"></a>

## Alternatives considered

- Copying the segment's origin, ID, and timestamp: introduces fields with no purpose
  for these logs and ambiguity relative to the SEAL's zero identifier.
- Not comparing type or identity: allows the wrong file to be interpreted.

<a id="valutazione"></a>

## Evaluation

Independent oracle, truncations, alterations of every bit, invalid fields with
correct CRC, two C1 readings, coverage, mutations, and allocation measurements.
Tests cover the in-memory codec; integration with file opening,
catalog, and `FAULTED` transitions remains the engine's responsibility.
