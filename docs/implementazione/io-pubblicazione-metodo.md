<a id="pubblicazione-esclusiva-di-un-temporaneo--metodo"></a>

# Exclusive publication of a temporary file — method

> **API proposal** — Completion of ADR-0040 and INV-A9/A10/A11,
> preregistered on 2026-10-17 before implementation and runs.
> No new database format or commit point.

<a id="incremento-e-responsabilità"></a>

## Increment and responsibilities

`io:pubblica-temporaneo(directory, source, source-name, target-name)`
receives a read-only capability for an already-verified file. Coordinator
guarantees authoritative durable decision naming that segment,
content integrity, and exclusive stable namespace. Suffix
`.tmp` alone proves none of these facts. Names are ASCII components and
`source-name` is exactly `target-name` followed by `.tmp`.

Primitive verifies FD and source-name identity, performs an
exclusive rename relative to same parent, and verifies final name
against still-open FD. Existing target, including symlink or
alias, must prevent replacement within syscall. Absence
check followed by ordinary `renameat` is insufficient.

Linux uses `renameat2` with `RENAME_NOREPLACE` (1); Darwin uses `renameatx_np`
with `RENAME_EXCL` (4). No fallback to ordinary rename, link/unlink, or
prior deletion. Absent native symbol, disallowed ABI/platform,
and missing callback are explicit rejections. Filesystem rejecting
primitive produces original POSIX fault, without retry.

Backend adds only optional keyword `:rename-exclusive`,
with parent-fd/source/target arguments and zero result. Also requires
`identity` and `entry-identity`. Existing backends retain constructor
call layout; instances must be recompiled after new slot.

<a id="effetti-e-guasti"></a>

## Effects and faults

Rename is namespace atomicity point and completes an already-made
decision. Not a new EDIT decision. Caller separately executes
`durable-flush(directory)` before admitting traffic. No implicit open,
segment write, truncation, close, or flush.

Preflight and first identity check do not change capability. Once inside
effect boundary, failed syscall, nonzero callback result,
failed postcondition, or incomplete exit fault a still-open
directory while preserving cause. Existing rename cleanup
reused, without duplication. Uncertain outcome neither retried nor undone.
If return lost after success, coordinator reconstructs inventory
from manifest: same call is not a retry protocol.

Capabilities borrowed; remain open on success. I/O task
prevents FD close/reuse and source replacement throughout
call. Target exclusivity does not make source-identity
check atomic or authorize concurrent namespace.
Owned recovery source retains facts of observed name:
coordinator does not reuse those initial names after completion.

<a id="decisioni-c1-e-verifica-prevista"></a>

## C1 decisions and planned verification

| ID | Decision / obligation | Cases to qualify |
|---|---|---|
| PIO-D01 | Open directory and open read-only source | Different modes, closed, faulted, invalid FD |
| PIO-D02 | Two valid leaves and exact `.tmp` relation | Limits, separators, case, different suffix/target |
| PIO-D03 | Identical backend and complete callbacks | Mixed backends; each missing callback separately |
| PIO-D04 | Native 64-bit, platform and symbol present | Unsupported ABI/platform/symbol |
| PIO-D05 | Source-name device and inode equal FD | Each inequality, nonregular file, and symlink |
| PIO-D06 | Ordinary/exclusive selector in common helper | Previous rename unchanged; new callback/native |
| PIO-D07 | Exclusive effect zero | Target absent, present, symlink, hardlink; errno, impossible return |
| PIO-D08 | Final-name/FD postcondition and open capabilities | Changed identity, post-effect fault, FI invalidation |
| PIO-D09 | Incomplete exit and directory still open | Error, nonlocal exit, directory already closed/faulted |

This increment performs warning-free product-only
compilation, lint, traceability, links, and disassembly reading. Diagnostics
and any failures go through common recorder and are preserved
with revision, hashes, environment, and original output. Authors closed
and code committed before runs. Two static C1 readings distinguish
contract and faults; independent review remains explicitly static.

No new functional tests, FI, mutations, coverage, or
benchmarks planned in this increment. PIO-D01…D09, MC/DC, Linux/macOS execution,
crashes/power loss, Recovery Manager integration, and admission remain
to qualify. No throughput figure or zero-allocation promise:
name copies and FFI belong to cold metadata path.

<a id="fonti-delle-primitive"></a>

## Primitive sources

- [Linux man-pages: renameat2 and RENAME_NOREPLACE](https://man7.org/linux/man-pages/man2/rename.2.html).
- [Apple XNU: renameatx_np ABI and RENAME_EXCL](https://github.com/apple-oss-distributions/xnu/blob/main/bsd/sys/stdio.h).
- [Apple: volume support for exclusive renaming](https://developer.apple.com/documentation/foundation/urlresourcevalues/volumesupportsexclusiverenaming).
- [SBCL: checking external-symbol availability without effects](https://sbcl.org/sbcl-internals/Linkage_002dtable.html).
