<a id="apertura-relativa-letture-c1"></a>

# Relative opening: C1 readings

Two static readings precede compilation and execution: root and a distinct
reviewer on product; root and test author on connection and C4
assertions. The [preregistered method](io-apertura-relativa-metodo.md)
defines OR-D01…D10 before tests. No flow finding remains
open; rereading completed conditions declared in docstrings.

Final product sources, SHA-256:

| File in `src/io/` | SHA-256 |
|---|---|
| `native-open-relative.lisp` | `3ec8ca51841d3d07ce1e69153dbf069eecaa9de484d9c976642fc03527c3af32` |
| `open-relative.lisp` | `f1d37c3ca3d5d186cc02ecbf6479216d9b7c2d731ca06707004469077d795ecd` |
| `types.lisp` | `a934f29924bd798ebb0aeb3ba7e75c23abc188820c8e78b3a35a6ed8796423d5` |
| `package.lisp` | `758e9ea9d232d5d3f56d9b1e4aa9ea3d6044dbaa5b6af06c8f4506542ad83bca` |

| C1 checklist item | Static reading |
|---|---|
| 1. Requirements and ADRs | REQ-STO-003, REQ-REC-001, REQ-AFF-001/004/008/018, REQ-FOR-001; ADR-0017/0033/0035/0040 and COD-37 consistent |
| 2. Invariants | INV-A7/A9/A10, INV-P6/X3; cases on parent, bytes, identity, frontiers, and cleanup |
| 3. Errors | Explicit types and provenance; tests of original condition, syscall, and double failure; nonzero close even with errno NIL |
| 4. Loops and waits | No new product loop; name bounded to 255 bytes; syscalls in I/O pool without wall deadline |
| 5. Heap | Opening allows allocations and bounded leaf; no hot-path or RSS measurement claimed |
| 6. Boundaries | FD and tuples validated before publication; FD 0 allowed, parent alias rejected; EOF not narrowed before budget |
| 7. Decisions | OR-D01…D10; dynamic coverage and MC/DC remain distinct from reading |
| 8. Ownership | Borrowed parent; private copy and child before openat; protected handoff; one child cleanup even with invalidated parent |
| 9. Traceability and checks | References present; matrix regeneration and `make check` required on frozen commit, outcomes recorded separately |
| 10. Rules | ftype, safety 3, docstrings, and functions under 60 lines; no generic product handler or new dependency |
| 11. Parallelism | No lock, wait, or shared write between Serie; controller owns namespace and capabilities |
| 12. Durability | No durable change or deletion; observed EOF distinct from valid/committed/durable frontiers |

Device/inode comparison preserves signed and unsigned 64-bit components.
EOF may be zero or a large integer: negative/noninteger values are
rejected; excessive values produce a resource error before any
narrowing. Missing callbacks do not enable native fallback.

Callbacks are trusted. The controller prevents namespace mutation,
file modification, and concurrent closes. Interrupt-free windows
protect handoff and cleanup; they do not define asynchronous cancellation.
Unrelated nonlocal exits attempt cleanup once, without attaching
secondary errno to the cause; unrelated errors in the close callback remain
outside protocol. C4 deadlines are cooperative.

The vertical fixture passes EOF and capability from the same opening to
CONTROL, decision-log, and ACTIVE readers; bootstrap, output, and coordination remain
C4. This reading does not establish full C1 qualification, MC/DC, mutation
testing of new paths, performance, or a complete Recovery Manager.
