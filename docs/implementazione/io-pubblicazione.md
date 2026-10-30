<a id="pubblicazione-di-temporanei-senza-sostituzione"></a>

# Publishing temporary files without replacement

`arcdocdb.io:pubblica-temporaneo` provides the I/O boundary for completing
a `.tmp` segment named by an already durable decision under
[ADR-0040](../adr/0040-manifest-a-record-unico.md#3-riconciliazione-al-riavvio).
[Recovered-source stabilization](stabilizzazione-nomi-recovery.md)
now connects it to the semantic token, CONTROL, and per-source parent flush.
The Recovery Manager still needs to coordinate the full set and admission.
The [method and decisions](io-pubblicazione-metodo.md)
precede code and diagnostics.

<a id="contratto"></a>

## Contract

```lisp
(arcdocdb.io:pubblica-temporaneo
 directory source-readonly "0000000000000001.seg.tmp" "0000000000000001.seg")
(arcdocdb.io:durable-flush directory)
```

The I/O task owns the exclusive namespace and keeps borrowed
capabilities open. `directory` is an open parent; `source-readonly` is the
already verified regular read-only file. Caller guarantees contents,
authoritative durable EDIT, and source stability; a `.tmp` name does not
prove membership. Primitive accepts printable ASCII leaves,
1…255 bytes, without slash, backslash, NUL, `.` or `..`. Source name is
exactly target followed by `.tmp`, also respecting the 255 limit.

Before effects it checks capabilities, names, and backend; copies names into
private strings and compares FD device/inode with source relative
to the same parent, without following symlinks. Exclusive rename rejects
an existing target in the syscall. Final name is checked
against FD before return. Native primitives are specified in the method.

NIL result establishes rename and namespace postconditions.
EDIT decision remains the database's atomic point; rename
completes that decision. Parent durability requires a separate
flush. Read-only FD remains usable with the same identity; primitive
does not modify segment bytes or I/O frontiers.

Target exclusion does not protect a source replaced between check
and syscall. Namespace exclusivity remains a precondition, as
for [relative opening](io-apertura-relativa.md) and inventory. The
coordinator does not reuse names observed in the old source set after
completion as though still current. Stabilization instead observes
both canonical names and can complete the already final branch;
an uncertain outcome with faulted capability requires reacquisition.

<a id="backend-errori-e-costi"></a>

## Backend, errors, and costs

Trusted backend adds `:rename-exclusive` with signature
`(directory-fd source target) -> 0`. Also required: `identity`
and `entry-identity`, on the same backend as parent and file. Existing
ordinary-rename callbacks are not fallback. New
slot requires rebuilding and new backend instances.

| Boundary | Outcome |
|---|---|
| Wrong mode, leaf, or `.tmp` relation | `invalid-argument`; no effect |
| Different backends | `invalid-argument`, `:io-identity-backend` |
| Callback/symbol unavailable | `unsupported-format`, `:io-publish-unavailable` |
| Disallowed ABI or platform | `unsupported-format`, `:io-abi` or `:io-platform` |
| Source differs from FD before rename | `invalid-argument`, `:io-replacement-identity`; no rename |
| Unreadable/nonregular identity | Original condition; no rename if preflight does not finish |
| Occupied target or syscall error | `io-fault`, operation `:rename`, original errno |
| Nonzero callback | `io-fault`, `:io-rename-result` |
| Postcondition or incomplete exit from effect | Original cause, still-open parent moved to `:faulted` |

Cleanup is shared with [rename within directory](io-rinomina.md).
It neither reopens a closed/already faulted capability nor masks the condition.
No implicit retry, rollback, close, unlink, or flush. An existing target
conservatively faults parent capability even when kernel rejected
the effect: caller must reconcile before proceeding.
File-system support conditions do not trigger a less restrictive
fallback. Orphan temporary files and removed segments are not deleted.

Two bounded names, one rename effect, and a constant number of identity
checks. Copies, callbacks, and FFI may allocate on the cold path.
No threads, locks, or shared writes between Serie, nor changes to
hot request path. Performance has not been measured.

<a id="stato-della-verifica"></a>

## Verification status

This increment's scope is warning-free compilation and recorded
static checks, with independent code review. No functional tests,
FI, coverage, mutations, or benchmarks are added or run.
Decisions PIO-D01…D09 remain to be qualified. Primitive presence
does not close physical recovery, admission, or C1/MC/DC gates.

The [preserved local campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-17-io-publish-exclusive/report.md)
includes six successful diagnostics and first disassembly failed due to
a flat C4 cache, later corrected without product changes. Forced compilation
without warnings/style-warnings; lint 351 files, traceability and links
without errors. Second disassembly reads seven functions without
invoking new API. Sources, method variants, and originals are
collected with hashes and closed inventory.

Independent review is static. Supplement confirms that on reference
architectures Linux x86-64 and Darwin ARM64, SBCL linkage
allows explicit rejection of missing symbol in preflight. On other
architectures a loader warning may precede API; this boundary
remains unqualified. Campaign neither executed new syscall nor
verified file-system support or other platforms.
