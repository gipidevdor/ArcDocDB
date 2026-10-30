<a id="testate-cbor-minime--prima-lettura-c1"></a>

# Minimal CBOR headers — first C1 reading

Reading independent of the kernel author, performed by the coordinator of
contract, ASDF, and campaigns. The second reading is assigned to the oracle
author after freezing their tests. No open static finding
in the two new files; runtime outcomes are recorded separately.

| C1 checklist point | Finding |
|---|---|
| 1. Requirements and ADRs | REQ-LIM-002, REQ-AFF-004/008, ADR-0014/0048; explicit local boundary. |
| 2. Invariants | Immutable buffer, widths and progress, separate words; INV-F1/A8/P6. |
| 3. Errors | Base parser precedes `:cbor-nonminimal`; lead offset; typed internal guards. |
| 4. Limits | No new loop, recursion, or wait; maximum read nine bytes. |
| 5. Allocations | Operations on fixnums and u32 words; separate measurement required, without deduction from code alone. |
| 6. Verified data | Six values returned only after syntax and minimal width checks; no payload certified. |
| 7. Decisions | Inventory compared with source forms; coverage and mutations preserved separately. |
| 8. Owner | Only local variables and read-only buffer, no factory or scratch. |
| 9. Traceability | ASDF and dedicated scope prepared; `make check` is the integration check. |
| 10. Standard | FTYPE, docstrings, guards, safety 3, short functions; no deviation introduced. |
| 11. Parallelism | No lock, shared write, or rendezvous in the product. |
| 12. Durability | Pure module: no durable change or deletion. |

IEEE fields are compared without constructing floats. For binary32, the normal
binary16 exponent field corresponds to 113–142; the subnormal field to
103–112, with significand divisibility by `2^(126-exp)`. For binary64,
normal binary32 corresponds to 897–1150 and subnormal to 874–896, with
divisibility by `2^(926-exp)`, checked on separate words. Padding
requires 13 zero bits for 32→16 and 29 for 64→32 in normal and special cases.
Zero requires a zero significand; a nonzero source subnormal is
too small for the destination. Tests use a general rational
oracle, distinct from these kernel thresholds.

Sign and payload are not modified; availability of a shorter
representation does not depend on sign. Alignment guards check
predicate postconditions without affecting the buffer. Internal
branch unreachability is not certified from coverage results alone.
