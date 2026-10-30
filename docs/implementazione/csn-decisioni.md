<a id="decisioni-c1--registro-csn"></a>

# C1 decisions — CSN register

Implementer's reading before execution. Invariants INV-M4, INV-M6, INV-A8;
REQ-MVC-005, REQ-MVC-008, REQ-AFF-008. Subsequent tests must exercise every
individually changeable condition, with rejection and state preservation.
This table claims neither instrumented coverage nor engine qualification.

| Decision | Conditions | Required cases |
|---|---|---|
| Configuration | capacity in domain; high u32; low u32 | capacity 0/65537/wrong type; negative high/low, 2^32, nonintegers; valid boundaries |
| Guard | current owner; successful attempt | recursive call, another owning thread, free acquisition |
| Register shape | high length=K; low=K; used≤K; cursor<K | FI for every inconsistent field; valid register |
| Frontiers | last<H; used=0 with H≠last | FI high order, low order at equal high, each-word difference |
| Credit | used=K | full capacity, rejection without advancing last, resolution and new credit |
| Exhaustion | high=2^32−1 and low=2^32−1 | both true; maximum high/lower low; maximum low/lower high |
| Free slot | high=0 and low=0 | free, low CSN with low only, carry with high only, both nonzero |
| Increment | low maximum | normal increment, carry, beyond-fixnum transition, maximum u64 |
| Token shape | slot index and slot<K; high/low u32; at least one positive word | individually wrong types/ranges; zero/zero; each word positive alone |
| Token identity | high and low match slot | each word different, stale after resolution and reuse |
| Token and frontiers | used>0; H<token; token≤last | FI for each inconsistency, valid current token |
| Remaining minimum | slot≠resolved; nonzero pair; H<slot≤last | resolved excluded, free, older/newer pending, FI frontiers |
| Remaining count | count=used−1 | empty, one/many pending, inconsistent count |
| Minimum decrement | count>0; low=0 | no pending, borrow high→maximum low, minimum with positive low |
| u64 order | high lower; high equal and low lower | lower high with greater low; greater high; equal high/lower/equal/greater low |

Initial values derive from the recovered maximum; no public setter changes
the base during operation. The controller owns resolution obligations
and fail-stop: the register does not know whether effects have been published.

Every scan is bounded by K≤65536; no callbacks or I/O inside the mutex.
u32 words remain fixnums on 64-bit SBCL. Error conditions may
allocate; successes are measured. The API accepts numeric tokens bound
to the register by the caller: it does not detect exchanges between Archivi with identical tokens.
