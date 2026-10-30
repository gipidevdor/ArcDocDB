<a id="prima-lettura-della-struttura-cbor"></a>

# First reading of CBOR structure

The coordinator established the contract and connected ASDF without writing
the kernel or oracles. The static reading covers the six scanner files and concludes on the kernel and three test files frozen on
2026-10-09, before compilation and runtime campaigns. The second reading is attributed to the oracle author in the separate report. Local readings are not human approvals.

Preflight checks types and spans before accessing the private array; an EQ
alias is rejected before any reset. Configurations and byte
budget precede writes. Reset clears residual state and active
references; the structure does not retain the buffer and arrays have read-only slots.
The caller owns both and assigns separate space to each worker.

The root frame counts one child. Every non-tag item charges its parent before
opening any container; a tag retains only pending and does not
consume arity. A container child keeps its parent on the stack until
complete. An indefinite map changes parity at the complete child's start,
including container or tagged keys/values. Break requires an indefinite frame,
no pending tag, and even map parity. Chunks remain counted items,
but do not charge the outer container already consumed by the string.

Drain collapses only definite arrays/maps at zero. The bound of 102 iterations
includes final root verification after 101 pops; an indefinite string
does not nest inside another indefinite string. Arrays/maps, even empty, check
the budget before being pushed and contribute to peak. A tag chain
uses no frames and remains bounded by node/byte budgets. Each step consumes at least
one byte, including payload; the outer loop is bounded by span with final drain.

High/low remain u32. Strings check high zero and low within remaining bytes
before addition and payload. Arrays compare the minimum of one byte per
child; maps compare pairs against floor(bytes/2) before multiplying by two.
The depth guard precedes these checks. Text delegates to the
already verified UTF-8 primitive, retaining absolute offsets and checking
its returned count. The public result exits only after complete root,
cursor end, no residual frames/tags, and counts within budgets.

All helpers have FTYPEs, contracts, and typed conditions; safety 3.
Internal errors and impossible defaults are explicit and remain in the
coverage denominator. The source has no constructors on success,
recursion, I/O, waits, or global mutable state. The cold factory allocates two
arrays and the structure: the heap campaign concerns successful calls with
preallocated scratch and input, not errors or the factory.

The concurrent test uses two distinct buffers/spaces, compares exactly three
values, and verifies full copies. Barriers and joins have timeouts and cleanup
checking termination; overlap is observed outside the barrier.
This verifies computation isolation, not pool scaling.

No open functional defect detected in static reading. Build,
coverage, mutations, and measurements are pending at this reading; the block does not
establish tag semantics, duplicate keys, deterministic representation,
writer admission, runtime fail-stop, or engine release gates.

<a id="riscontro-dei-dodici-punti-c1"></a>

## Findings against the twelve C1 points

| Point | Finding |
|---|---|
| 1. Requirements | REQ-LIM-001/002 and AFF-004/008; ADR-0014/0048 limited to scanner contract. |
| 2. Invariants | Progress, arity, parity, frame/depth, ownership, and independent oracles; campaigns pending. |
| 3. Errors | Typed conditions, explicit reason/offset and precedence; runtime owner remains future work. |
| 4. Bounds | Span steps, 102 pops, 16MiB/16Mi nodes/100 levels; no recursion or waits. |
| 5. Heap | No constructor on success; separate cold factory, positive sensor and measurements pending. |
| 6. Output | Three values after exact root and postconditions; no AST or implicit interpretation. |
| 7. Decisions | Separate inventory, internal guards retained; raw coverage, no MC/DC qualification. |
| 8. Data | Immutable buffer, exclusive scratch without retained buffer; kinds alias rejected. |
| 9. Integration | ASDF after header/UTF8; separate suite and exact cbor-structure scope. |
| 10. Coding | FTYPE, safety3, contracts, short helpers, and invariant defaults; runtime checks pending. |
| 11. Parallelism | Two workers with private spaces; bounded waits, all3 values and inputs checked. |
| 12. Durability | No durable write or I/O in this module. |
