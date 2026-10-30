<a id="seconda-lettura-c1-indipendente--registro-csn"></a>

# Independent C1 second reading — CSN register

**Current status:** CSN-C1-01 resolved by rereading the refactoring;
no remaining static findings within the scope read. The final addendum updates
the first reading preserved here, including initial hashes and tests absent at that time.

Bounded static review on 2026-10-09, independent of implementation,
in workspace `/Users/gpicchiarelli/.codex/worktrees/sequenze-commit/ArcDocDB`.
Git reference: `92d8b0ebf498800e4847bc4828560c6dac879c0e`; the CSN files
read are workspace changes, not a frozen delivery or commit.
Hash observation: 2026-10-09T07:38:05+00:00.

The product, preregistered method, decision table,
public contract, ADR-0046/0038/0045, and C1 standard were read. Inspection of test
support and benchmark sections is static. No compilation, suite,
measurement, mutation, coverage, or project tool was run.
The reviewer's only writes are this document and
`/tmp/arcdocdb-csn-review.lisp`, a data record with `:schema-version 1`.
No commit. This reading grants no C1 approval, exception, or engine
qualification.

| File read | SHA-256 |
|---|---|
| `src/csn/package.lisp` | `b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0` |
| `src/csn/registry.lisp` | `81fcc0181b883f299c6fe33b3b1bc05a8a6f0d756ef06717eaff1fdde73050a6` |
| `docs/implementazione/csn.md` | `c46cce29aa8fc6ae5f8390eb9cc8d1023b98328dfa6ec33d8c88fbaf2a42cecf` |
| `docs/implementazione/csn-metodo.md` | `f2b18cdf170478141c955c1d77f5393daf23c27888abd6e6dbd2f219a5de604c` |
| `docs/implementazione/csn-decisioni.md` | `ade75b4b0bb050f79b2f8ded23b21745c9a939839b35d1e521c1632ba80aaab6` |

The record also retains hashes of the other references and existing support
files. The conclusion applies to these contents; a subsequent product
change requires a diff review.

<a id="rilievo-da-restituire-al-parent"></a>

## Finding to return to the parent

**CSN-C1-01 — COD-13, complexity of two helpers (P2, open).**
The [standard](../affidabilita/standard-di-codifica.md) requires at most ten
independent paths per function. Counting short-circuit
`and`/`or` branches in addition to explicit decisions and loops:

| Function and lines | Manual count |
|---|---|
| `%check-token-csn`, `src/csn/registry.lisp:130–146` | Base 1 + three `unless` + 4 branches in the first `and` + 1 in the nested `or` + 1 in the second `and` + 2 in the third `and` = **12**. |
| `%frontiera-risolta-csn`, `src/csn/registry.lisp:150–171` | Base 1 + one `dotimes` + four `unless` + two `when` + one `if` + two branches in the two `and` forms = **11**. |

This is a static count of the written control flow, neither a coverage measurement nor
a count of the `with-mutex` expansion. The decision table
inventories conditions but does not document compliance with COD-13;
the deviation register states “None.”
The parent must reduce complexity, for example by separating token shape
validation from checking a remaining pending item, or explicitly justify
a different counting criterion. This review does not
approve an exception. No error in CSN or H computation was identified
in the healthy transitions examined.

<a id="osservazioni-proprie-sul-prodotto"></a>

## Original product observations

- **Carry and borrow.** The two words remain u32; comparison is lexicographic.
  From base `(0,#xfffffffe)`, two allocations produce `(0,#xffffffff)` and
  `(1,0)`. Resolving the first makes the remaining minimum `(1,0)` yield
  H=`(0,#xffffffff)`: the borrow is correct. The maximum guard precedes
  increment, preventing `high=2^32`. These steps are deduced from source,
  not executed tests.
- **No assigned CSN is invisible to the register in completed calls.**
  The slot is selected and both words written before updating last,
  cursor, and count; no public API can read or resolve midway,
  because it uses the same guard. H is computed excluding only the resolved
  slot and considering all other nonzero slots, before mutation.
- **ADR-0046 counterexample.** With K=2, keeping 1 pending while allocating and
  resolving 2, 3, 4, 5 leaves the second slot's credit reusable and H at
  0. Finally resolving 1 leaves no pending items and H becomes 5.
  There is no indexing by `csn mod K`.
- **Nonwaiting guard.** The register is evaluated once; checking
  the current owner prevents recursive acquisition. The actual attempt
  uses `sb-thread:with-mutex ... :wait-p nil`. The `acquired` flag distinguishes
  a busy mutex from a body returning NIL; `multiple-value-prog1`
  preserves multiple values. Cleanup and mutex handling are delegated
  to the runtime macro. Inspection does not prove interleavings or handling
  of an asynchronous interruption during stores.
- **Tokens and rejections.** Range and type precede slot access; both
  words must match. The absence of wraparound and base changes
  prevents a resolved token from becoming valid again in the same register.
  Another register can issue the same `slot/high/low`: binding it
  to the register is a caller obligation stated in code and the
  contract. Identifying Archivio from the token is not guaranteed.
- **Error priority.** `:csn-full` precedes `:csn-exhausted`.
  With K=1 and the last token equal to maximum u64 still pending, a new
  allocation signals full; after resolution it signals exhausted. Both
  rejections occur before stores. The final suite must preserve this
  priority or document its change.
- **Defense limitations.** `%check-registro-csn` checks `used≤K`, not
  equality between used and occupied slots. Exact cardinality is
  checked only by `%frontiera-risolta-csn`. For example, an FI that
  changes used from 1 to 2 in a K=2 register with one pending item passes
  the general check and can produce full on allocation; resolution
  then detects the inconsistency before mutation. Healthy API use does not
  reach this transition. The docstring's “consistent ... count” guarantee is broader
  than the actual general check: the parent must narrow that guarantee.

<a id="checklist-c1-compilata"></a>

## Completed C1 checklist

Numbering follows the twelve items in the
[coding standard](../affidabilita/standard-di-codifica.md);
evidence criteria follow the
[verification plan](../affidabilita/piano-di-verifica.md).

| Item | Observation and limitation |
|---|---|
| 1. Requirements and ADRs | REQ-MVC-005/008 and REQ-AFF-008 annotations present. ADR-0046 is implemented by the pending-only register. INV-M4/M6/A8 relevant; INV-P6 and ownership concern batch coordination. REQ-MVC-005 remains a local contribution: no snapshot is implemented. |
| 2. Invariants and tests | Indivisible assignment/registration, exclusive slot, H≤last, H<pending, and convergence on empty state analyzed. Existing support uses mathematical integers and a token list without reusing product arithmetic helpers. Sequential and thread tests declared by ASDF were absent at observation: their coverage is not attested. |
| 3. Errors and handling | Config/token: `invalid-argument`; busy/full/exhausted: `resource-exhausted`; inconsistencies: `invariant-violation`. Ordinary rejections precede changes. Busy resolution preserves the token and obligation; Archivio fail-stop remains with the controller. Suite for all errors and cleanup on error not run. |
| 4. Loops and waits | Two scans of at most K≤65536, no recursion, callback, I/O, or retry in the product. One mutex attempt per call. Test support has deadlines, finite joins, and termination checks in cleanup; actual thread fixtures are missing. |
| 5. Measured allocation | Arrays and mutex constructed at startup. Successful paths use u32 words and multiple values without constructing a u64/bignum or token object. On 64-bit SBCL, words are fixnums. Zero heap remains **to be measured** with a positive control, five samples, high bases, and a fixed oldest pending item. Benchmark presence does not mean successful execution. |
| 6. Validated data | Token validated before indexing; base and capacity validated before construction. The register does not check published/aborted effects, caller identity, or maximum recovered from files: these are preconditions. Frontier reads check general bounds, not full slot cardinality. |
| 7. Compound decisions | Configuration, shape/frontiers, exhaustion, free slot, token shape/identity, remaining pending items, and u64 comparison appear in the table read. Actual cases still need links to individual conditions, independence pairs, raw coverage, and compiled mutants. No MC/DC attestation. |
| 8. Ownership and sharing | OWNER/SHARED explicit, one register per Archivio, private slots, no copier, immutable read-only fields. APIs acquire the same guard; callers retain token/register association. Arrays in read-only slots contain mutable elements protected by the mutex. |
| 9. Trace and checks | ASDF loads foundation before CSN and registers support/registry/threads for tests. Test registry and threads files were absent at observation. Requirements and matrix remain `progettato`. Final compilation, lint, trace, links, coverage, mutants, and `make check` must be acquired by the parent on stable sources. |
| 10. Rules and deviations | Safety 3, function FTYPEs, typed slots, docstrings, REQ annotations, and functions under 60 lines present. **COD-13 open**, as above. The macro expansion test required by COD-53 is absent from support read and must be inspected in the final suite. No approved exception. |
| 11. Parallelism across Serie | Shared mutex and stores are declared for batch/decision assignment and resolution; reads serve coordination. The contract requires no per-document or simple GET access. The scheduler can reschedule busy/full; fairness, scalability, and parking limits remain to be implemented and measured. |
| 12. Atomicity and removals | Volatile state only; no I/O, flush, deletion, or durable atomicity point. The mutex makes the in-memory transition consistent. H is not the durable byte frontier, and resolution is not a commit acknowledgment. |

<a id="evidenze-mancanti-e-integrazione-successiva"></a>

## Missing evidence and subsequent integration

At observation, `tests/csn/support.lisp` and
`tools/csn-bench.lisp` were present; `tests/csn/registry.lisp`,
`tests/csn/threads.lisp`, and `tools/csn-mutation.lisp` were absent.
No CSN campaign results were read. The parent must complete
and freeze the suite, including carry, borrow, fixnum boundary, maximum u64,
stale tokens, rejection without mutation, contention/recursion, and macro
values/cleanup. It must then tie oracle, finite exploration, real threads,
mutants, heap sensor, and checks to the same product hashes and reread
any changes.

Recovery must determine the validated maximum CSN of the entire Archivio
before construction and write admission. Late opening
of Serie with a higher maximum, WAL, index publication, fail-stop,
correct abort, shutdown, rescheduling, and snapshot registration/wakeup
are declared subsequent integrations. A lost token or
controller that abandons resolution can retain credit and H;
the register cannot release it automatically. No proof of durability,
complete recovery, P99, or engine performance is deduced from this reading.

<a id="addendum--rilettura-della-rifattorizzazione-e-dei-test-presenti"></a>

## Addendum — rereading the refactoring and available tests

Static rereading completed at 2026-10-09T07:44:59+00:00, after the parent's
correction. **CSN-C1-01 resolved within the static review scope.**
The original finding and hashes above remain preserved. The observation about
the general check's docstring is also resolved: it now distinguishes count
bounds from exact cardinality checked at resolution.

| File reread or newly present | SHA-256 at rereading |
|---|---|
| `src/csn/registry.lisp` | `56262b96c0b3fdfc92289e37e80dadb17c49870c57c57e89ab7afba4bb74f14a` |
| `src/csn/package.lisp` | `b9fa9bac97e89dd43bd91e6050ac7f6bbba47109403350478b2df8ca851f01a0` |
| `tests/csn/support.lisp` | `6b19e1c80a8b2e91b4a6bfc6b3cfeae962ed9cd919d6df1a92b58ab3b49255db` |
| `tests/csn/registry.lisp` | `c4e24c711f0ac63e33149bc866d8a62c0eb6e92528b2710a09b74ffc4c78a950` |
| `tests/csn/threads.lisp` | `0470dc35f8c5cd4ca294712fd439e7865e3702fe243a72b9f57194d099f2b5d2` |

The decision table retains its initial hash and conditions remain
relevant. The new pending-item helper adds `used>0` to the scan,
already established on the resolved token before the scan under the
same mutex: it is redundant for this call and does not change the transition.

<a id="conteggio-indipendente-della-versione-corretta"></a>

### Independent count of the corrected version

I use the same criterion as the finding: base 1, one decision per
`if/when/unless` and loop, plus N−1 short-circuit branches for each
`and/or` of N conditions. I do not count called functions or runtime
macro expansions as branches of the calling function.

| Function | Manual count |
|---|---|
| `%check-forma-token-csn`, line 131 | 1 base + 1 unless + 4 and + 1 or = **7**. |
| `%check-pendente-csn`, line 141 | 1 base + 1 unless + 2 and = **4**. |
| `%check-token-csn`, line 154 | 1 base + 1 unless + 1 and = **3**. |
| `%frontiera-risolta-csn`, line 167 | 1 base + 1 dotimes + 3 unless + 2 when + 1 if + 1 and = **9**. |
| `%check-registro-csn`, line 53, unchanged flow | 1 base + 4 when/unless + 4 and + 1 or = **10**. |

All these functions meet the limit of 10 under the criterion used.
The new helpers have FTYPEs, docstrings, and REQ annotations; they do not write
the register. Shape and range still precede slot access,
identity precedes frontier checks, and the scan still
finishes checking remaining items/count before stores.
API signatures and values, mutex, carry/borrow, error priority,
slots, tokens, and frontier updates appear unchanged on reading.
No new functional defect identified; no execution performed.

<a id="aggiornamento-dei-punti-della-checklist"></a>

### Checklist item updates

| Initial item | Rereading update |
|---|---|
| 2. Invariants/tests | Registry and threads now present and read in full. The model uses independent integers/list; cases for carry/borrow, fixnum boundary, maximum u64, reverse completion, credit, stale tokens, counterexample through 65, and FI are present. K=2/3 exploration through six commits and 10,000 deterministic actions are test code, not obtained results. |
| 3. Errors | Suite present for configuration, token, full/exhausted, shape, frontiers, and remaining count; private images compared in FI. State preservation and types are assertions to execute, not review attestations. |
| 4. Loops/waits | A fixture with a held mutex requires the probe to join before release: it can detect a try-lock becoming blocking. Four workers × 1,000 assignments, K=3, two waves force full and reuse; 20 s deadline, cleanup with bounded joins and termination check. No execution or exhaustive proof of interleavings. |
| 5. Allocation | No constructor in new helpers; zero heap still requires measurement on the new hash. Prior campaigns or campaigns on the old hash do not automatically transfer to the corrected version. |
| 7. Decisions | Conditions previously concentrated in the token are distributed across two helpers. The table remains applicable; counts, raw coverage, independence pairs, and mutant kills require final evidence on refactored source. |
| 9. Integration/checks | Test files declared by ASDF are now present. `tools/csn-mutation.lisp` has also appeared and sections were inspected; the reviewer did not run or qualify it. Build/lint/trace/link/check evidence remains to be acquired. |
| 10. Standard | COD-13 closed with counts 7/4/3/9 and general check 10. The macro test now present checks single evaluation, NIL, zero and multiple values, error, nonlocal exit, and recursion; the other-worker test checks busy with body not executed. These are checks of expansion behavior to compile/run; no macro expansion or suite was run here. |

Items 1, 6, 8, 11, and 12 retain the first reading's scope.
In item 6, the clarified docstring now matches the observed limitation;
token/register binding and published or validly aborted effects
remain caller obligations. Previously declared engine lifecycle,
recovery, snapshot, duration, and parallelism limits remain open.

**Current outcome:** no remaining static finding within the scope read.
The initial absences are a historical observation superseded by the tests'
presence and static reading in the addendum. The parent may freeze this hash
for its campaigns; the review does not state that freezing or
campaigns have already occurred. No C1 approval or exception, and no test,
benchmark, project tool, or commit executed by the reviewer.
