<a id="inventario-dei-segmenti-dalla-directory-metodo"></a>

# Segment inventory from directory: method

Method registered before executions. The increment moves into the
product the name collection required by ADR-0040 §3 and recovery
steps 3–4, reusing the existing planner. It changes no formats or actions.

<a id="contratto"></a>

## Contract

The controller owns and freezes namespace throughout the call, in the
Serie's I/O pool. Parent is an already open borrowed directory capability.
An independent cursor opens relative to that
FD: `dup` is insufficient because it would share offset. Only
the private cursor closes; parent remains open and reusable.

`elenca-directory` delivers owned names and attestation `T` only
after actual EOF and successful close. The injected backend must explicitly
provide the same attestation. No list prefix is
success. Names are copied before the next `readdir`, using
a locale-independent Latin1 byte/character mapping.

Three budgets limit name count, total name bytes, and bytes
per name; they also include names ignored by the storage parser. `.` and
`..` are excluded. Budgets equal to consumption are valid; one additional
name must fail. These are work and payload limits, not heap/RSS measurements.

The parser uses the exact on-disk format: sixteen lowercase ASCII
hex digits followed by `.seg` or `.seg.tmp`. Zero and all u64
bits remain meaningful. Segment-like but noncanonical names are
explicit errors. Other categories are ignored and preserved.

Each candidate is checked by identity relative to the same parent,
without following symlinks: only regular files are allowed. Two distinct
segment names with the same device/inode are an explicit anomaly.
The planner receives only the complete set after all checks.

Code does not certify that another process respects exclusivity:
`readdir` is not an atomic snapshot. It neither checks headers/CRCs/content,
physically reconciles names, opens segments, rebuilds
indexes/CSNs, nor admits traffic. `:ready` remains name availability.

<a id="errori-e-proprietà-da-osservare"></a>

## Errors and properties to observe

Configuration errors, budgets, incomplete callback, malformed names,
aliases, and identity failures produce typed conditions and no plan.
Dependency conditions propagate. The private cursor is
closed on documented error paths without retry.

Native code retains the first rejection reason until close:
exhausted budget with successful cleanup reports `resource-exhausted`;
a syscall failure retains errno and any cleanup-errno. If both
budget and close fail, `io-fault` retains the budget reason and
cleanup-errno. Close failure alone remains an I/O error. No
result is promoted after cleanup error.

| ID | Decision / boundary | Cases |
|---|---|---|
| IND-D01 | capability and callbacks available | open directory, wrong mode, closed, missing callback |
| IND-D02 | EOF distinct from truncation | empty, exact, one name beyond limit, false attestation |
| IND-D03 | three budgets before accumulation | exact and insufficient, including ignored names |
| IND-D04 | canonical / other / malformed name | zero, high and maximum ID; case, length, digits and suffix |
| IND-D05 | candidate within max-files | exact / insufficient, before excess stat |
| IND-D06 | entry identity and type | regular, symlink, FIFO/directory, two hardlinks |
| IND-D07 | manifest availability | use, rename, delete, anomaly, missing and conflict |
| IND-D08 | ownership and complete return | name copies, callback closing parent, two scans from same FD |
| IND-D09 | cursor and native failures | open, transfer to DIR, read, EOF, close and double error |
| IND-D10 | parent anchoring | parent renamed after capability open |

<a id="esecuzione-e-conservazione"></a>

## Execution and preservation

Injected fixtures compare plan queries with the independent oracle
already used for inventory, in v1/v2 formats. Native fixtures use
exclusive `0700` namespaces, registered leaves only, finite cardinalities and
deadlines, and cleanup of owned resources. They also check repeatability,
anchoring, and file immutability without depending on readdir order.

Before executions, complete two C1 readings and commit
sources. Compilation and tests are recorded through `record-command`;
`make check` performs the full check. Every failure remains preserved
with original sources and output; correction changes commit. Linux/macOS CI
and local executions remain distinct snapshots. No performance
measurement, MC/DC certification, or Recovery Manager closure.

Requirements: REQ-REC-001, REQ-REC-002, REQ-AFF-001, REQ-AFF-004,
REQ-AFF-008, REQ-AFF-018, and REQ-VAL-001. Invariants: INV-A7, INV-A9,
INV-A10, and INV-P6.
