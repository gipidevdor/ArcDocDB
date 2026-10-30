<a id="scrittura-delle-testate-cbor--seconda-lettura-c1"></a>

# Writing CBOR headers — second C1 reading

Independent reading by the test owner on 2026-10-11, after the
blind corpus was frozen and before campaigns. The examined product
is `src/codec/cbor-write.lisp`, Git blob
`61f0d6e2783e4790ed7e19a45bba6407d6e5b3de`. The reference contract is
preregistered in the [method](cbor-scrittura-metodo.md); the decision
inventory is maintained separately by the coordinator.

| Checklist item | Static finding and limit |
|---|---|
| 1. Requirements and ADRs | REQ-CBR-001 from ADR-0014, AFF-004/008; the function implements a local MT0..6 header, without interpreting payloads, tags, maps, or the full document profile. REQ-LIM-002 is referenced by the test distinguishing the local argument from the document budget. |
| 2. Invariants | Exclusively owned simple u8 destination; ai/size, space, and progress have active guards. No u64 reconstructed in the product. Every write is within the already calculated and checked NEXT, with a maximum of nine bytes. |
| 3. Errors | Short-circuit preflight checks range → major → high → low; the capacity check follows selection and precedes the first mutation. Public errors are typed, with offset NIL from the condition's initform. Internal guards propagate invariant-violation without rollback; the fail-stop transition belongs to the owner. |
| 4. Bounds | Selection has five outcomes 1/2/3/5/9; the only loop writes WIDTH 1/2/4, invoked at most twice. No recursion, waiting, retries, or payload reading. Valid END−START subtraction precedes every NEXT; sufficient capacity implies NEXT≤END and prevents index overflow. |
| 5. Heap | The path uses scalars, multiple values, and direct calls; on 64-bit SBCL, u32 words are immediate. It creates no buffers, lists, closures, or u64 objects. This reading does not establish zero allocations: local measurements, zero baseline, and positive sensor remain necessary. |
| 6. Output | The function ends with NEXT as a single value. For size1 the initial cursor is already NEXT; for 2/3/5 it writes only LOW; for 9 it writes HIGH then LOW, both BE. The cursor=NEXT postcondition precedes return. Tests compare exact arity and the entire destination. |
| 7. Decisions | Three outer logical decisions (lines 35–36, 42, 53–54), expressed by four AND/OR forms counting the nested OR. Two standalone chained relations (lines 33 and 84) bring the compound decisions examined to five; the `<=` at line 54 is already inside the range AND. Internal guards and negative branches remain in the denominator; no MC/DC attestation or exclusion. IF/COND selection retains HIGH precedence before LOW thresholds. |
| 8. Ownership | The buffer remains the caller's and is not retained. OWNER/SHARED document exclusivity until return; no mutable global state, internal alias, callback, or buffer publication. A destination shared by active workers would violate the precondition. |
| 9. Integration | CBOR package export and ASDF components examined: product, support, serial tests, threads, and supplementary roundtrip. No storage or I/O dependency. Strict compilation and coordinator checks remain to be recorded. |
| 10. Standard | safety3, complete FTYPEs, Pre/Post/error docstrings, and REQ references present. The four functions have 14/16/14/28 inclusive lines; all within 60 and with at least two active checks. No exceptions proposed. |
| 11. Parallelism | The function creates no threads, locks, or waits, and does not write across Serie. The corpus prepares two distinct destinations before starting workers, with a barrier, timeout, bounded join and cleanup. Overlap of real intervals proves only observed functional concurrency, without inference about cores or scaling. |
| 12. Durability | Mutation is local to exclusive memory; no durable write, deletion, or publication. This is not an atomic primitive and promises no rollback of internal guards. No engine commit point is introduced. |

<a id="provenienza-e-indipendenza-del-corpus"></a>

## Corpus provenance and independence

The following three files were written from the contract without reading
`cbor-write.lisp`, then frozen and checked with an isolated Common Lisp
reader. Product reading began only after freezing.
The owner of this reading ran no build or campaign.

| Blind file | Git blob | SHA-256 |
|---|---|---|
| `tests/codec/cbor-write-support.lisp` | `92327e4b840b8586c50c32a7732e718ee6e9db98` | `e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6` |
| `tests/codec/cbor-write.lisp` | `903a213c810d99fdefc2af2afa93445574a13be7` | `0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3` |
| `tests/codec/cbor-write-threads.lisp` | `878f0fa10825ae3d49e9cac2f94d9992c06f2d20` | `7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb` |

The cold model calculates HIGH×2^32+LOW and bytes arithmetically with
division/modulo; bignums are confined to the oracle. Independent literal
vectors also check the model, including endpoints and asymmetric
words `01234567/89abcdef`. No expected value comes from a
product encoder or decoder.

The 15 serial tests cover all seven majors, all LOW0..65535 arguments
(458,752 comparisons), thresholds and neighbors, nonzero HIGH with small LOW,
4,096 cases with seed `57524342`, every insufficient capacity for all five
widths (140 cases), invalid ranges and destinations, competing errors,
valid empty spans, physical sentinels, misalignment, reuse, and concatenation.
Helpers check one fixnum NEXT on success and zero physical mutations
on every rejection, including capacity excluded by END.

The sixteenth test uses two real workers, each with its own buffer,
16,384 repetitions of seven headers: 229,376 total calls. Plan,
final bytes, and per-iteration sink are calculated before the workers; arity,
NEXT, and final cursor are checked inside workers, sinks and full destinations
after join. Waits and termination have timeouts.

The coordinator separately added
`tests/codec/cbor-write-roundtrip.lisp`: the seventeenth test checks
77 pairs with the minimal reader after comparison with the cold expected value.
It is supplementary compatibility evidence, without changing the three blind blobs.

No open static findings on the product or corpus. Builds,
regressions, test results, heap, raw coverage, and mutations must
still confirm behavior. This reading does not close a phase
gate, establish the whole engine, or constitute human approval.
