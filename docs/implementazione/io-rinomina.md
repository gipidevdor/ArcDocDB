<a id="rinomina-atomica-nella-directory-posseduta"></a>

# Atomic rename in an owned directory

`io:rinomina-nella-directory(directory, source, destination)` implements the
POSIX boundary needed by [ADR-0040](../adr/0040-manifest-a-record-unico.md).
Parent capability already open; both names relative to same FD,
without rereading parent path or changing current directory.

<a id="contratto"></a>

## Contract

I/O-pool task owns directory and controller reserves both
names. Caller guarantees authoritative decision, file identity and
content, and prevents concurrent mutation/close. Lisp names borrowed
and stable until return. After validation, module creates
two private simple-base-string copies before effect: even displaced,
adjustable, or fill-pointer strings meet FFI contract.
No lock or counter between Serie.

> **Proposal** — API accepts canonical storage-name ASCII
> components, 1 to 255 bytes: no NUL, slash, `.` or `..`; source and destination
> differ by content. Not an interface for arbitrary paths or
> Unicode names. Filesystem may impose further restrictions reported by I/O.

A successful `renameat(parent, source, parent, destination)` is
atomic name-change point. Returned NIL certifies only
POSIX zero outcome and still-open capability; parent fsync remains a
separate `durable-flush(directory)` call. Byte frontiers do not advance.
For Serie recovery, control-log rename will be atomicity
point under ADR-0040; executor must still connect decision,
verified checkpoint, namespace, and durable completion.

Primitive checks neither inode associated with names, file type/content,
nor absence of hardlinks. POSIX semantics: two names already
identifying same inode may succeed without movement. Already-open FDs
retain identity even when a name is replaced.
No EDIT decision inferred from `.tmp` name, and no unlink offered.

Verified replacement `sostituisci-temporaneo` retains identity,
`.tmp`/final, and no-alias checks. Normalizes both private
leaves and delegates to same protected effect, including installed-name
verification in postcondition. Ordinary rename retains
native wrapper `native-replace`. [Exclusive publication](io-pubblicazione.md)
instead selects native primitive rejecting existing targets,
reusing same effect, postcondition, and fail-stop helper.
Ordinary default remains unchanged.

<a id="guasti-e-backend"></a>

## Faults and backend

Capability, name, and callback preflight before first operation. Ordinary
rejections mutate neither state nor namespace. Backend adds `:rename`, an
immutable function receiving fd/source/destination and returning zero;
missing callback means `unsupported-format`, never native fallback.
Backend and callbacks trusted and do not modify capabilities or names in use.

Failed syscall (including EINTR) or nonzero result puts
directory into FAULTED before `io-fault`. Incomplete effect, including nonlocal
exit, faults a still-open capability without replacing original
cause. Brief state transitions protected from interruptions:
no syscall or wait inside protected section. Cleanup and POSIX/
return errors preserve an already-closed capability. No retry,
rollback, close, unlink, or implicit flush. Caller propagates fault to
Serie/Archivio and reconciles from manifest before reopening capability.

| Rejection/fault | Reason |
|---|---|
| Name outside contract | `:io-rename-name` |
| Equal names | `:io-rename-same-name` |
| Backend without callback | `:io-rename-unavailable` |
| Invalid mode/capability | `:io-mode` / `:io-unavailable` / `:io-descriptor` |
| Nonzero callback return | `:io-rename-result` |
| POSIX error | `:io-syscall`, operation `:rename`, errno preserved |

<a id="decisioni-e-prove-previste"></a>

## Decisions and planned tests

| ID | Decision | Cases |
|---|---|---|
| RIO-D01 | Length between 1 and 255 | Empty, 1, 255, 256, each name separately |
| RIO-D02 | Name other than dot/dotdot | Each rejection and ordinary component |
| RIO-D03 | ASCII non-NUL and non-slash | NUL, non-ASCII, and slash separately; allowed boundary bytes |
| RIO-D04 | Source differs from destination | Distinct equal strings, different names |
| RIO-D05 | Backend present and callback absent | Missing backend, missing callback, present callback |
| RIO-D06 | Zero result | Zero, NIL, -1, +1, POSIX error |
| RIO-D07 | Incomplete effect and capability still open | Success, typed error, nonlocal exit, already-faulted/closed capability |
| RIO-D08 | Valid FD after callback | Valid; out-of-contract injected invalidation for cleanup |
| RIO-D09 | Optional postcondition present and NIL return | Absent, present successful, injected error and impossible return |

Maximum loop 255 characters per name; one rename per
call and no added wait. Metadata path; may allocate
for FFI string conversion. C1 qualification, tests, mutations, and
local benchmark registered separately; primitive qualifies neither
complete database opening/recovery nor power-loss resistance.
