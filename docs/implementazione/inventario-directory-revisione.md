<a id="inventario-directory-letture-c1"></a>

# Directory inventory: C1 readings

Two static readings precede executions: root on the I/O boundary and
planner connection; a distinct reviewer on I/O boundary, I/O author
on planner connection. Method and cases are in
[inventario-directory-metodo.md](inventario-directory-metodo.md).

Final reading sources are `native-directory.lisp` SHA-256
`781b3fcf6d422efa811e0c136c11735aa9f9123d1a42f45fc2d4c8d4e82ac08b`
and `inventory-directory.lisp`
`c3d45d7c41661865b9739fda5bf9762fc1e238ab213638285579cfe4d2c86fb4`.
Other files are identified by execution-commit blobs.

| Check | Static outcome |
|---|---|
| Requirements and ADRs | REQ-REC-001/002, REQ-AFF-001/004/008/018; ADR-0040 §3, injectable IO ADR-0035 |
| Invariants | INV-A7/A9/A10: read-only collection; no planner effects; INV-P6: workspace/cursor per Serie |
| Errors | EOF distinct from error and budget; typed conditions; double error with cleanup reason and errno |
| Loops and waits | Parser 16 steps, collections bounded by cardinality, native at most N+3 reads; syscalls in I/O pool |
| Heap | Opening path allows allocations and bounded payload; no RSS or hot-path attestation |
| Boundaries | Callbacks and names revalidated, capabilities open before/after, no partial list published |
| Decisions | IND-D01…D10 in method; dynamic qualification and coverage distinct from reading |
| Ownership | Borrowed parent; independent openat; FD transferred to DIR only on success; one cleanup |
| ABI | Linux/macOS 64-bit; SB-POSIX-grovelled dirent layout, consistent inode64 selector |
| Rules | ftype, safety3, functions under 60 lines; explicit normal branches and original conditions propagated |
| Parallelism | No lock or shared write between Serie; thread-local Latin1 binding |
| Durability | No new atomic point: names, files, and frontiers unchanged |

Rereading made normal `cond` branches explicit and restricted
native-result reasons. Encoding binding is an SB-EXT special
variable inherited by SB-ALIEN: checked in runtime and installed
sources, without introducing an alternative converter.
First compilation also found an overly narrow type for the
literal suffix: its argument now uses `simple-string`. Second
attempt reached the Latin1 case and found `base-char` does not cover
byte 255: name copies now use simple `character` arrays,
and parser accepts `simple-string`. Validation remains bounded to
codes 1…255. Both corrections were separately reread;
failed attempts are preserved.

<a id="limiti"></a>

## Limits

The controller must prevent namespace mutations and concurrent closes;
callbacks are trusted. Enumeration is not an atomic snapshot.
Syscalls may block and have no implicit wall deadline.
Interrupt-free windows protect ownership and cleanup; asynchronous
task cancellation is not a supported protocol. On a nonlocal exit
outside contract, cleanup is attempted once, preserving the primary
cause without attaching any secondary errno.

Runtime creates the current name before checking accumulation
budgets. These budgets do not include all Lisp objects or runtime
costs. Pure reason-matrix tests do not simulate a real
`closedir` failure. Full C1 qualification, MC/DC, mutation
testing of new paths, and measurements remain open. No reader here checks headers,
CRCs, segment contents, or traffic admission.
