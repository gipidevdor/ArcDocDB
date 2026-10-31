# ADR-0074 — Qualify ARM64 CRC32C for SBCL 2.6.10

- **Status:** Accepted for incremental integration authorized on 2026-10-31; qualification evidence required before publication
- **Date:** 2026-10-31
- **References:** ADR-0059, ADR-0060, REQ-FOR-003, INV-I1, INV-I8, INV-P6

## Decision

Extend the exact compiler allowlist on macOS ARM64 from SBCL 2.6.9 to 2.6.9 and
2.6.10. The existing CPU/OS CRC and NEON probes, safety 3, range checks and
software-disable feature remain mandatory. Unknown versions and platforms keep
the software fallback. There is no format change, runtime switching or CPU
probe on a GET path. Accepted ADRs remain unchanged in meaning.

This integration is conditional on the existing strict suite, independent
software/native differential checks of unaligned/bounded/incremental spans,
fresh-process native/software/native cache transitions, instruction inspection,
and matching canonical/WAL/page behavior on 2.6.10. Any failure blocks promotion;
it does not justify weakening a check or extending the allowlist to future versions.

The performance campaign found software CRC in the 2.6.10 profile and native CRC
in the qualified 2.6.9 profile. Reusing the exact measured drivers after
qualification separates backend cost from unrelated product changes. A faster
benchmark alone is not evidence of checksum correctness or compiler safety.

[Integration contract and evidence](../implementazione/prestazioni-local-m1.md).
