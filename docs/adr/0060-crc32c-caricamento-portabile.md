<a id="adr-0060--caricamento-portabile-del-backend-crc32c"></a>

# ADR-0060 — Portable loading of the CRC32C backend

- **Status:** Accepted for the authorized integration of 2026-10-23
- **Date:** 2026-10-23
- **References:** REQ-FOR-003, REQ-AFF-004;
  [ADR-0017](0017-piattaforma-e-io.md), [ADR-0059](0059-crc32c-arm64-sbcl.md)
- **Relationship to previous decisions:** clarifies loading for ADR-0059;
  algorithm, format, and acceleration scope remain unchanged.

<a id="contesto"></a>

## Context

Runtime software selection alone does not guarantee portability:
compiling ARM VOPs on an unqualified platform or SBCL version can
fail before selection. Linux x86-64 remains the reference platform.
The gain measured on macOS ARM64 does not qualify other CPUs or systems.

<a id="decisione"></a>

## Decision

A Lisp bootstrap shared by ASDF and the measurement loader calculates a private
compilation feature. It enables it only for SBCL 2.6.9, ARM64,
macOS, 64-bit, and little-endian. On every other combination it does not require
SB-SIMD or read VOP definitions or NEON references. The feature
describes compiler compatibility, not CPU capability.
OS and NEON probing remains necessary before selecting the kernel.

The public startup feature `:arcdocdb-crc32c-software`, set before
loading the system, forces software even on the qualified host.
It serves diagnostics, differential tests, and rollback; no hot switching
during service. The bootstrap removes any obsolete native features.

Compatibility, OS-response validity, and kernel-selection decisions
are pure functions with tests for each condition. The GET
path continues to read only the already selected kernel. No foreign
checksum dependency and no change to persistent data.

<a id="verifica-e-limiti"></a>

## Verification and limits

Full builds and suites in two fresh processes, normal and forced software;
reader-isolation test without the SB-SIMD package and synthetic matrix of
OS, architecture, and version. These local tests do not replace a Linux
run. Existing CI runs the product on Linux x86-64 and macOS ARM64;
published hardware performance remains specific to the local M4.

Linux ARM64, macOS x86-64, other SBCL versions, and CPUs without CRC32C use software
for the checksum; this does not extend whole-engine support to new
systems. Windows is not a platform for the current POSIX engine. A future
SSE4.2 or Linux ARM backend will require its own tests and qualification.
