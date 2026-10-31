# Two-reading review and optimization decisions

First reading examined repeated canonical-frame checks, paged membership probes,
source-window lookup, vector comparison, disk cache loads, current GET resolution,
PUT preparation and recovery. Second reading traced the implemented shortcuts
through healthy, disabled, empty, collision, corrupted-derived-state and IO-error
paths, preserving the exact publication and resource boundaries.

| Decision | Result and independent protection |
|---|---|
| History at most twice live count | Keep the original exact selection path; no signature construction |
| Overwrite-heavy history | Walk the existing frozen index; verify actual count and CSN range before enabling metadata |
| Claimed empty count with a live tree | Traversal/count mismatch refuses before outputs |
| Maximum canonical CSN | Always retain its witness, including a tombstone, independently of the filter |
| CSN below the live minimum | Cannot be current; skip its membership probe after canonical framing/order checks |
| Signature bit absent | Cannot be a visited current version; skip the lookup |
| Signature bit present/colliding | Perform unchanged exact key/CSN/location/length lookup |
| Damaged derived threshold/signature | Independent current membership and exact coverage refuse before CONTROL |
| Original segment and span already cached | Reuse immutable source binding only inside its previously checked window |
| Different source or outside cached span | Resolve source, validate physical bounds and load a fresh bounded window |
| Byte comparison | Standard bounded vector mismatch compares the complete frame, including payload; CRC is insufficient alone |
| Complete page read | IO overwrites every byte before publishing the tag; no preparatory clear |
| Partial page read | Clear only unused tail; publish only after exact successful read |
| Read error/partial effect | Tag remains unavailable; subsequent successful load replaces the complete requested frame |

The signature is exactly 512 bytes regardless of document count. Modulo collisions
are intentional false positives. No key/version list, resident mirror or retained
borrowed key is added. Index traversal uses existing checked pages, bounded paths
or unique resident fragments. The observer copies only scalar CSN facts.

The source window is local to one maintenance run, and original readers remain
open until verification finishes. A cached range cannot authorize a new source
or extend physical bounds. Normal IO/header/domain/CRC/index validation remains;
CRC-correct payload substitution is rejected by the original-byte comparison.

GET/PUT/replay/migration reuse the shared page cache; only unnecessary memory
writes change. Admission, durability/flush points, CSN allocation, source-epoch
ownership, append invalidation and canonical removal capabilities do not change.
There is no new syscall outside IO, inter-Serie lock/shared write, wait, recursion,
reduced safety level or persistent format. Functions retain bounded loops/types
and the existing requirement tags under ADR-0078. Formal C1/MC/DC, concurrency,
power loss and whole-engine performance are not inferred from local C4 tests.

The global minimum alone is ineffective with an ancient cold key. The fixed
signature was added before final qualification for that case. The first full
2.6.9 campaign was deliberately interrupted; its raw result remains. The earlier
2.6.10 run completed on the pre-signature stage. Final suites and timing runs
must use the same final inventory, rather than treating either as final evidence.
