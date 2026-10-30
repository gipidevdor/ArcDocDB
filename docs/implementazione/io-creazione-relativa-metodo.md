<a id="creazione-relativa-metodo"></a>

# Relative creation: method

Method recorded on 2026-10-17 before compilation and execution.
The increment completes the relative I/O boundary under ADR-0017/0033 and
COD-37, without changing ADR-0040 formats or durable decisions.

<a id="contratto-e-proprietà"></a>

## Contract and ownership

`crea-temporaneo-nella-directory` returns one append capability
for a new empty regular `.tmp`. It does not open existing files for writing.
Positive budgets, leaf, and availability of all three callbacks are
checked before effects. Private leaf and child are allocated
before opening. Callback `create-relative(parent-fd, leaf, :append)`
transfers ownership only when it returns a valid FD distinct from the
parent; until then it owns its rollback. FD zero is valid.

`file-metadata` attests regular file, device, inode, and zero size;
`entry-identity` must attest the same nofollow identity relative
to the parent. POSIX signed/unsigned 64-bit components remain exact;
size is bounded before narrowing. Out-of-contract metadata,
nonempty file, or mismatched identity prevents return.
Parent and child must remain available until publication.

The controller excludes concurrent file/namespace mutations and capability
closures; comparison does not replace this precondition.
The parent is borrowed and is neither closed nor faulted
by the API. Creation changes the namespace but not its frontiers.
The successful child starts with written/durable zero and passes to the caller.

The native backend uses `openat(parent-fd, leaf, flags, 0600)` with
`O_WRONLY|O_CREAT|O_EXCL|O_APPEND|O_CLOEXEC|O_NOFOLLOW`. The alien
declaration must mark the fourth argument as variadic: on Darwin ARM64
the vararg convention differs from fixed arguments. `mode_t`
undergoes integer promotion. The three-argument read-only declaration
is not used with `O_CREAT`. The umask can only restrict permissions.

<a id="errori-e-risorse"></a>

## Errors and resources

A valid acquired, unpublished FD receives exactly one close from the backend
that created it, with CLOSED state before the call. Cleanup is
attempted even with an invalidated parent, without EINTR retry and without touching an
FD alias of the parent. If successful, the same typed condition object
is propagated. If it fails, primary reason/offset and cleanup-errno are exposed;
an I/O cause retains operation, errno, and progress. For a non-I/O
cause, the double fault's operation is `:create-relative`. Nonzero close
is failure even with errno NIL.

Foreign nonlocal exits attempt cleanup without attaching the secondary
errno. Foreign conditions in the close callback remain outside the
protocol. Interrupt-free windows protect handoff and cleanup,
without introducing asynchronous cancellation. Syscalls belong to the I/O
pool and may block; the product promises no wall-clock deadline.

No implicit unlink, flush, or rename occurs. After successful
creation and subsequent rejection, an orphan temporary may remain, even
when close succeeds. Physical reconciliation remains the controller's responsibility.
Exclusivity does not attest contents, manifest decision, or durability.

<a id="decisioni-e-prove-preregistrate"></a>

## Preregistered decisions and tests

| ID | Boundary | Cases |
|---|---|---|
| CTR-D01 | Parent | open directory, other mode, closed/faulted |
| CTR-D02 | Budget | types/ranges, zero rejected, positive extremes |
| CTR-D03 | Private leaf | ASCII, suffix, separators/NUL/dot, 255/256 bytes, caller name reused |
| CTR-D04 | Complete backend | each callback absent, no fallback |
| CTR-D05 | Acquisition and publication | FD zero, callback order, inherited backend; defensive written=0 and durable=0 guard |
| CTR-D06 | Out-of-contract FD | invalid and parent alias without close |
| CTR-D07 | Metadata | exact components, invalid shape, empty regular file, nonzero/excessive EOF |
| CTR-D08 | Leaf binding | matching device/inode and each mismatched, invalid entry |
| CTR-D09 | Availability | parent invalidation from each callback, cleanup still attempted; private child checked before return |
| CTR-D10 | Primary cause | error before/after handoff, normalized syscall, same object after successful cleanup |
| CTR-D11 | Double fault | I/O/offset fields preserved, nonzero with errno NIL, exactly one close |
| CTR-D12 | Nonlocal exit | no publication, cleanup once |
| CTR-D13 | New native file | append, read-only identity, contents, flags, and permissions |
| CTR-D14 | Native collisions | file/FIFO/directory/symlink remain unchanged |
| CTR-D15 | Renamed parent | creation in open parent, decoy at old path intact |
| CTR-D16 | Ownership end | repeated closes, FD reuse without late close |
| CTR-D17 | Effect already occurred | post-creation rejection with real file, child close, and orphan retained |

Native fixtures use exclusive 0700 namespaces, bounded resource
registries, cleanup of owned names only, and finite cooperative deadlines.
C4 POSIX oracles compare bytes, identity, and FD properties; injected
tests observe callback order, count, and arguments. Pure
faults do not attest native syscall fault injection. The vertical fixture
exercises its v1/v2 and crash cases using the new relative creation.
Callbacks do not receive the private child capability: guards on its
state and frontiers are read statically, without claiming that a
fixture directly alters its slots before publication.

Two static readings of final code precede compilation and tests.
Frozen commit, new ASDF cache, and `record-command` retain every
attempt, including failures. `make trace-write` updates the matrix;
`make check` remains required. Collection uses the existing collector,
explicit manifest, four workers, and closed inventory. Linux/macOS CI
of the integrated version is a separate observation.

Requirements: REQ-STO-003, REQ-REC-001, REQ-AFF-001/004/008/018,
REQ-FOR-001, and REQ-VAL-001. Invariants: INV-A7/A9/A10/A11, INV-P6, and INV-X3.
Recovery Manager, reconciliation execution,
admission, complete C1 qualification, MC/DC, mutation testing of new
paths, and performance measurements remain open.

<a id="integrazione-con-main--2026-10-22"></a>

## Integration with main — 2026-10-22

The full R1 check of 2026-10-17 belongs to freeze
`b5ad739ba1fc0252920c088e2442140e448451ad`. Resumption on 2026-10-22
integrates main `56fc1c1a`, which adds recovered name stabilization
and CI archives. Creation primitives, their helpers, and tests
remain identical to R1; package and ASD must retain both APIs
and module order. Two static readings check these connections.

After the new freeze, run `make test lint trace links` with a new
ASDF cache and separate record. Full R1 is not attributed to the merge;
CI of the actually tested merge remains a separate snapshot.

<a id="secondo-raccordo-con-main--2026-10-22"></a>

## Second integration with main — 2026-10-22

During PR20 CI, main advances to `e75f9794`, adding the in-memory
recovered version selector. The new module performs no I/O
and changes no namespace, callback, or capability. I/O sources, the three
tests, and the vertical fixture remain identical to the previous integration.
ASD retains the selector after recovery-bootstrap, before runtime.
Two static readings precede this integration's freeze.

Run R4 `make test lint trace links` with a new cache and retain
the separate record. CI already started on merge `046c64cc` retains
that exact attribution; the new head requires its own CI.

<a id="raccordo-dei-report-ci-c4--2026-10-22"></a>

## CI report integration (C4) — 2026-10-22

PR20 run `39817860664`, on merge `046c64cc`, completes Linux,
macOS, and audit successfully. `coverage-tests.lisp` is also PASSED; the worker
stops after tests and LCOV, while reading the normal verification result:
the fresh consumer vocabulary does not register all fields emitted
by the producer. Coverage and seal are therefore FAILED and remain retained
as such. No overall green outcome is attributed to that run.

Before new tests, the minimal C4 correction is recorded: declare
in the trusted vocabulary the normal-result fields already allowed by the
producer schema, without interning input symbols or broadening schemas.
The regression must use a fresh SBCL with consumer modules:
the full self-test process already loads the producer and masks
the defect. A check on the previous revision must detect it;
rejections of unknown tokens and executable forms remain required.

The failed attempt, regression, and subsequent C4 check are retained
separately; new CI will check the new head. The correction
does not change I/O sources, CTR decisions, or their tests.

The next integration incorporates main `c46bc4c1` (PR21), which contains
the same declaration of the two fields, also `:skipped` for the data-only
reader, and keeps the coverage summary compact while retaining
the original inventory. Both regressions remain: data-only reader
and complete coverage consumer, with producer absent in their respective children.
The 328 C4 checks at revision `6c409f59` are PASSED; their record
remains distinct from the new full C4 check on the PR21 integration.

Integration `fc0a34a9` completes 334 C4 checks with PASSED:
59 data, 37 test registry, nine conditions, 43 measurements, 172 workflow, and
14 boundaries. Recorders before the correction (`92fbfbbc`, expected exit 1),
after (`6c409f59`, exit 0), and for both full self-tests report STABLE
sources and clean checkouts. R4, at `1ebf8e71`, completes
`make test lint trace links` with a new cache and exit 0/STABLE.
These local outcomes do not replace CI on the actual new merge.
