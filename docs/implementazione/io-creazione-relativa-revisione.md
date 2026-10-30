<a id="creazione-relativa-letture-c1"></a>

# Relative creation: C1 readings

Root and a distinct reviewer read the six final sources, ASDF
connection, and vertical fixture before compilation. Test author and
root read the three test files; the distinct reviewer also checked
oracles. The [preregistered method](io-creazione-relativa-metodo.md)
lists CTR-D01…D17. Static readings do not establish a dynamic outcome.

| C1 checklist item | Static reading |
|---|---|
| 1. Requirements and ADRs | REQ-STO-003, REQ-REC-001, REQ-AFF-001/004/008/018, REQ-FOR-001; ADR-0017/0033/0035/0040 consistent |
| 2. Invariants | INV-A7/A9/A10/A11, INV-P6/X3; exclusive new file, no changes to existing files, no deletion |
| 3. Errors | Rejections before effects; invalid/alias FD; tuples and nonempty file; EQ cause or double fault with provenance |
| 4. Loops and waits | No new product loops, leaf bounded to 255 bytes; syscalls in I/O pool, no wall deadline |
| 5. Heap | Opening allows allocations, copy and capability before syscall; no hot-path measurement claimed |
| 6. Boundaries | FD zero valid; complete metadata before narrowing, empty regular file and same nofollow identity before return |
| 7. Decisions | CTR-D01…D17; private-child guards read statically, without claiming MC/DC |
| 8. Ownership | Borrowed parent, child owned from handoff; one close of unpublished child even with invalidated parent |
| 9. Traceability and checks | References present, `trace-write` and `make check` planned on freeze; outcomes to preserve separately |
| 10. Rules | ftype, safety 3, docstrings, short functions, no generic product handler or new dependency |
| 11. Parallelism | No lock, wait, or shared write between Serie; namespace and capabilities under one owner |
| 12. Durability | Preparation before EDIT, no implicit flush/rename/unlink; possible orphan after failure |

Final sources in `src/io/`, SHA-256:

| File | SHA-256 |
|---|---|
| `create-relative.lisp` | `444a479156881ad66fd2a63460f42116f25f9f5a749442ce911d6bca2540c86f` |
| `native-create-relative.lisp` | `56b824eb7c4ad9ee1a3e3b8bf3690e117d28d1fa4cb2e8e3a282ba252f14b121` |
| `types.lisp` | `aab5bc1d17bbb848785222385686bc21443fc824cfae1569355e67fba646d70d` |
| `package.lisp` | `3654b5eb7f060615debfc9b36aa5bc43d8be3e049cfafec879efca41c21faab5` |
| `native-open-relative.lisp` | `5d3b7f128061a7b5fbae7ff611c1fe4b1e6e7e83e4909789dc1cbb5efeae0242` |
| `open-relative.lisp` | `78faa5443804b61daca3bb58433064ce680a4ef50066541869c3affe2f01922c` |

Reuse of two private helpers adds explicit optional arguments for
mode, mismatch reason, and double-fault operation. Read-only
defaults remain `:input`, `:io-open-relative-identity`, `:open-relative`;
the existing path and tests remain part of the full check.
`native-file-metadata` retains behavior and also documents append FD.

ABI was read in the local SDK (`sys/fcntl.h`, variadic `openat`
declaration; `sys/_types.h`, Darwin 16-bit `mode_t`) and SBCL 2.6.9
sources: `target-alieneval.lisp` interprets `&optional`, `alieneval.lisp`
retains its index, and `compiler/arm64/c-call.lisp` passes Darwin varargs
on stack. `unix.lisp` and `sb-posix` contrib also use promoted
variadic mode for `open`. New binding always passes 0600 as `int`.

Native fixture requires 0600: its already verified mkdir 0700 demonstrates
that umask preserves owner bits, and no test modifies it. The test
thus also detects wrong modes 000/0400 with a privileged runner.
It does not change global umask. It writes after repositioning the
cursor to establish append, verifies intact collisions and moved parent.
Orphan case combines real creation/close and injected validation-callback
failure: it is not presented as native `fstat` failure.

Exclusive-namespace, trusted-callback, and no-asynchronous-cancellation
preconditions remain. No flow finding remains open in the
reading; full C1 qualification, MC/DC, targeted mutations, and performance remain
distinct from local verification and CI.

<a id="raccordo-del-2026-10-22"></a>

## Integration of 2026-10-22

The SHA table above identifies sources of freeze S1 `b5ad739b`.
Integration with main `56fc1c1a` preserves five implementation files
and three tests unchanged; package and ASD also add export
and modules for name stabilization. Order remains: native create
after native open, wrapper create after wrapper open, stabilization after
transfer/flush. Root and a distinct reviewer reread integration before
the integration check, without open findings.

The second integration of 2026-10-22 incorporates main `e75f9794`: the added
selector operates only on private buffers, without depending on I/O API.
Root and a distinct reviewer reread ASD and documentation connections
before R4, without findings; six I/O sources and tests unchanged from `28b7fae0`.

C4 integration with main `c46bc4c1` retains upstream vocabulary, producer,
and boundary tests. The C4 difference against main is the regression
with all six real coverage-consumer modules in a fresh process:
producer remains absent in child, and wrong identity or skipped tests
do not constitute valid normal evidence. Root and a distinct reviewer
reread minimal correction and integration; parser, limits, and schemas
are not expanded by input. I/O sources remain identical to R4.
