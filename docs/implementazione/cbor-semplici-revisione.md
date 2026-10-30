<a id="prima-lettura-c1-della-scrittura-dei-valori-semplici-cbor"></a>

# First C1 reading of CBOR simple-value writing

Static reading dated 2026-10-11, **before compilation and campaigns**.
The reviewer wrote neither product nor tests and did not read the new
blind corpus. Before the product, they began preparing the C4 benchmark-data
auditor from the frozen contract and driver; auditor freeze
follows product freeze. They did not run the auditor.
This is the first C1 reading; it does not replace the second reading or tests.

Git base: `d155db3f977677fa95280f59c23fbe46a5e116d2`.
Source read: `src/codec/cbor-simple-write.lisp`, blob
`58c7a3a040ec814fae2dfe636f569b5623cba8f0`.
[Preregistered method](cbor-semplici-metodo.md), blob
`e8864f7c0124f86cebdcdbcb2449800e078e1cc8`.
Export `0a75ef778c3d5ea490ec0a61f11bf6c65a3183ee`,
ASDF `2a4f3cf6dd800e5e9c3d624c23971bec352d7988`,
requirements catalog `19223d1767a6b7eebb9636d99cea7d898560cbd2`.

<a id="esito-statico"></a>

## Static outcome

No functional defect or mandatory correction identified in the
read blob. The product follows the raw MT7 contract: 0..23 uses E0+VALUE and
32..255 uses F8 followed by VALUE. LOGIOR at line 47 equals
addition in the direct domain because code bits do not intersect E0.
TYPEP at line 17 rejects reserved codes 24..31 and every out-of-domain
value, including T/NIL, without introducing application conversions.
Undefined remains wire code 23; no semantics are assigned to
unassigned codes.

The helper checks type and range before LENGTH and subtraction;
checks code before THE U8 in the public path. Capacity
is checked at line 41 before calculating NEXT and CURSOR and before
every writing AREF. SIZE<=END-START implies START+SIZE<=END,
so NEXT and CURSOR remain index. Valid empty span signals insufficient
capacity only after code verification.

Span, footprint, and progress guards remain active. The last two
public assertions verify NEXT increasing/within END and CURSOR=NEXT.
First write is at line 47; second, only for SIZE2, at 49.
All public errors precede both. The final guard may fail
after internal mutation: the contract retains fail-stop without rollback.

<a id="dimensione-e-complessità"></a>

## Size and complexity

Conservative syntactic count: one initial path, one per IF/WHEN/UNLESS
check, and one per additional AND condition. It excludes
TYPEP expansion, its type union, and primitive comparisons.
Lines include DEFUN and docstrings.

| Function | Lines | Paths |
|---|---:|---:|
| `check-input-simple-cbor-write` (10–23) | 14 | 7 |
| `scrivi-semplice-cbor-minimo` (28–53) | 26 | 8 |

Both meet COD-12 and COD-13. No loop or recursion: a complete item
occupies one or two bytes and each call modifies at most two
positions. The compound-decision inventory is maintained separately
by the author; this count attests neither coverage nor MC/DC.

<a id="checklist-c1"></a>

## C1 checklist

| Item | First reading |
|---|---|
| 1. Requirements and ADRs | REQ-CBR-003 and AFF-004/008 are indicated; local domain consistent with RFC 8949 §3.3 and ADR-0014. ADR-0048 retains higher-level budgets and document profile. |
| 2. Invariants | INV-F1/P6 in requirement; exclusive destination, half-open capacity, well-formed code, unchanged outside bytes, and bound2 in product. Falsifying tests pending. |
| 3. Errors | Range → code → capacity, as preregistered. INVALID-ARGUMENT and RESOURCE-EXHAUSTED with offset NIL derived from base condition and without mutation. Internal INVARIANT-VIOLATION propagated to owner, without rollback. |
| 4. Limits | No loop, recursion, wait, or thread created; fixed two-byte bound. END is actual limit; physical suffix does not increase capacity. |
| 5. Heap | No constructors, closures, AST, floats, or u64 on success. Index cursors and u8 code; arithmetic bounded before use. No allocation expected from source; zero heap allocation requires local measurement with sensors and is not attested. |
| 6. Verified data | All cold inputs verified before THE and access. Module returns one NEXT with VALUES and writes raw code; no promise of semantic document validation. |
| 7. Compound decisions | Range and footprint ANDs present; chained range and TYPEP union distinct from explicit AND/OR decisions. Inventory, independent cases, and coverage remain to be checked separately. |
| 8. Owner | Explicit OWNER/SHARED: caller's exclusive destination until return, only local scalars. Module does not verify exclusivity or share state per operation. |
| 9. Integration | Export at package line 11; serial ASDF component after dependencies; new suite registered without removing previous ones. Requirement in catalog; matrix, compilation, and MAKE CHECK pending. |
| 10. Rules | Complete FTYPEs, safety3, pre/post/error docstrings, REQ per definition, guards without side effects. No generic handler, prohibited construct, or static deviation identified. Compilation/lint not run. |
| 11. Parallelism | No lock, wait, I/O, or shared write between Serie introduced. Separate workers may use private destinations and immutable plans; actual concurrency and scaling not demonstrated by reading. |
| 12. Durability | No publication, persistence, or deletion. The two writes are not atomic publication; caller retains ownership and fail-stop boundary for possible internal faults. |

<a id="verifiche-ancora-necessarie"></a>

## Verification still needed

The diff of existing codec kernels and foundations shows
no changes; only the new primitive's export is added to the package.
This reading does not renew dependency qualification and did not
consult blind tests or run compilation, tests, benchmark,
coverage, mutations, or tool self-tests.

Second C1 reading, compilation without warning/style-warning,
corpus and concurrency, sensor measurements, mutations, raw coverage and
compound-decision verification, data auditing, matrix, and MAKE CHECK remain.
No attestation of MC/DC, 100% coverage, zero heap allocation, closed C1 gate, or
qualification of the complete document and engine.
