<a id="pubblicazione-del-checkpoint-del-control-log"></a>

# Control log checkpoint publication

`pubblica-control-recuperato` completes preparation of the
[checkpoint](checkpoint-control.md) through the rename specified by
[ADR-0040](../adr/0040-manifest-a-record-unico.md#3-riconciliazione-al-riavvio).
The atomicity point is replacement of `control.log` with the durable temporary;
the result is delivered only after directory fsync.

<a id="contratto-e-dipendenze"></a>

## Contract and dependencies

| API | Result |
|---|---|
| `pubblica-control-recuperato(prepared, previous)` | Complete result after verified rename and parent fsync |
| `stato-pubblicazione-control(prepared)` | State and rename success observed at the publisher boundary |
| `log-control-pubblicato(result)` | Canonical log of the new control log |
| `manifest-control-pubblicato(result)` | Owned manifest of the installed checkpoint |
| `active-control-pubblicato(result)` | New prepared ACTIVE named by the manifest |

The caller performs **exclusive Serie recovery** in the I/O pool. It has already
verified the old control log, its manifest, the required inventory, and transaction
decisions. `previous` is the read-only capability of that authoritative file,
kept open until the task ends. The publisher does not infer this authority from
merely the existence of a name or an FD.

The prepared result now retains the **canonical directory and expected length**.
The new control log must still be stopped at the prepared, written, and durable
frontier, with a healthy log and valid read-only/append association. The new
ACTIVE must still contain only the durable header. The directory must be
exactly the one synchronized during preparation.

The controller owns the namespace throughout the call: no concurrent rename,
external mutation, close, or FD replacement. Inode checks are not a lock against
other processes: between checking and `renameat`, this exclusivity remains an
engine precondition.

<a id="ordine-degli-effetti"></a>

## Order of effects

1. Preflight without I/O: free token, open capabilities, unchanged log and
   frontiers, ACTIVE dependency, required backend and callbacks.
2. Allocate the result wrapper **before** renaming and claim the local token
   with CAS on its unique identifier.
3. In the already open directory, compare capability device/inode with those
   of the `control.log.tmp` and `control.log` leaves. Both must be regular files,
   without following symlinks, and physically distinct.
4. Perform **only one `renameat`**, using the same directory FD for source and
   destination. No ancestor pathname is resolved again.
5. Verify that `control.log` identifies the new file by comparing it with the
   prepared read-only capability. Old FDs remain open and owned by the caller.
6. Record success observed at the I/O boundary and synchronize the directory.
7. Recheck capabilities, checkpoint frontier, and new ACTIVE. Mark
   `:published` and deliver the complete wrapper.

The publisher does not rewrite the file, acquire a CSN, close FDs, delete segments,
publish indexes, or admit traffic. The result links manifest, log, and prepared
ACTIVE; the controller must still complete the recovery gate.

<a id="gettone-rientri-ed-errori"></a>

## Token, reentry, and errors

The token is local to the prepared result; it introduces no lock between Serie.
Cleanup is installed **before CAS**. It identifies the owner through the private
wrapper, even if a nonlocal exit occurs immediately after CAS and before the
state update. A losing attempt cannot invalidate the winner's token.
The result is not reusable.

| State | Meaning |
|---|---|
| `:prepared` | Preflight and acquisition possible, provided the token is still free |
| `:publishing` | Only one owner can perform verification/rename/fsync |
| `:published` | Rename verified, directory synchronized, and postconditions completed |
| `:faulted` | Incomplete exit after acquisition; requires new authoritative reconciliation |

State observations are for the owner or controller after delivery/join: they
are not a concurrent snapshot of fields or permission to close/delete/retry.
The Boolean `rename-observed = nil` **does not prove names are unchanged**:
an error can occur during the syscall or subsequent verification. If true and
fsync fails, the rename was observed but publication is not confirmed durable.

Any error after acquisition, including reentry not handled by the callback,
a verification failure, or a nonlocal exit, leaves `:faulted`. The original
condition propagates; no generic handler, retry, rollback, close, or namespace
cleanup is performed. The controller applies Serie fail-stop and reconstructs
the decision from disk. Before acquisition, a preflight rejection leaves the
result prepared.

<a id="confine-io-e-piattaforme"></a>

## I/O boundary and platforms

`verifica-capacita-sostituzione` checks capabilities, ASCII leaf names,
the `.tmp`/final relationship, and backend before syscalls.
`sostituisci-temporaneo` compares names with FDs, rejects a physical alias,
performs the rename, and checks the installed name. The caller provides the
complete durable state and authoritative target: the I/O primitive does not
interpret EDIT.

The backend retains the existing six positional arguments and `:identity`;
it adds two optional callbacks:

- `:entry-identity(directory-fd, leaf)` → device/inode of a regular file,
  without following symlinks;
- `:rename(directory-fd, source-leaf, target-leaf)` → zero on success.

An incomplete backend is rejected before acquisition: no native fallback.
Callbacks are trusted and do not mutate names, FDs, or capabilities outside
the contract. Leaves are copied into private strings before I/O observations.
Rename and its postconditions delegate to the
[common boundary](io-rinomina.md), with simple-base-string copies and a
255-byte limit per leaf. Protected local cleanup preserves an already closed
capability and faults an open capability even on incomplete exit or verification
failure after rename.

On the native path, `fstatat` uses SB-POSIX's grovelled `struct stat`,
with the same `INODE64` selector as its stat functions: no struct offset
is duplicated in the product. The `AT_SYMLINK_NOFOLLOW` flag is 0x100
in the [Linux header](https://raw.githubusercontent.com/torvalds/linux/master/include/uapi/linux/fcntl.h)
and 0x20 in the macOS SDK's `sys/fcntl.h`. ABI and platforms remain those of
the [I/O boundary](io.md); dynamic qualification of these new calls is open.

<a id="costi-e-decisioni-da-qualificare"></a>

## Costs and decisions to qualify

At most six identity observations: two fstats and two fstatats before the
rename, one fstat and one fstatat after. One renameat and one parent fsync
follow. No new FD is opened. One wrapper and two private strings are created;
native observations also use runtime `stat` instances and may require boxing
POSIX integers. No new data buffer or batch. These are static costs,
not latency, heap, throughput, or contention measurements.

| ID | Decision | Cases to qualify |
|---|---|---|
| CPU-D01 | Prepared state and free token | Each condition false, both true, two contenders |
| CPU-D02 | Written/durable frontiers equal the prepared frontier | Each frontier different, both exact |
| CPU-D03 | Allowed leaf names | Empty, dot/dotdot, each separator, NUL/non-ASCII, valid |
| CPU-D04 | Temporary/final relationship | Length, prefix, and suffix independently wrong |
| CPU-D05 | Directory/source/target in the same backend | Each association different, all equal |
| CPU-D06 | Three callbacks present | Each callback missing, all present, native |
| CPU-D07 | Name device/inode equal to FDs | Each component different, both equal, symlink/nonregular |
| CPU-D08 | Source and target distinct | Same device/other inode, other device/same inode, both equal |
| CPU-D09 | Cleanup ownership and incomplete exit | CAS won/lost, exit immediately after CAS, success/error |
| CPU-D10 | Entry identity of allowed type | Each component invalid, both valid |

C1 qualification, functional cases, fault injection at every step, and measurements
remain open. The author's static readings are not independent review.
This path replaces an old, already authoritative control log; initial Serie
creation, publication without a target, online rotation, and complete recovery
remain to be integrated.

[I/O completion](io-completamento.md) prevents reuse of append/flush capabilities after incomplete exits, keeping CLOSED terminal. Functional probes of the complete path and the preregistered benchmark are described in the [method](control-verifica-metodo.md); outcomes are retained separately from the method.
