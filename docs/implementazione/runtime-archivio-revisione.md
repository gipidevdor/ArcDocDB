<a id="due-letture-statiche-del-bootstrap-runtime"></a>

# Two static readings of runtime bootstrap

Independent reviewer Russell, agent `01a145a0-029b-7b80-af19-35be4a3efe9f`:
first schema reading, second threat reading on stable source and
[method](runtime-archivio.md). Same reviewer wrote only
FI `tests/runtime/guards.lisp`; two readings are not two reviewers.
Coordinator separately reread implementation and fixture.
No run attributed to static review.

| C1 checklist | First reading | Second reading |
|---|---|---|
| 1. Requirements/ADRs | REQ, ADR-0046, existing registers | Uniqueness per canonical object, external physical exclusion |
| 2. Invariants | Configuration, plan, bindings, and base before CAS | Distinct FI; effectiveness to verify |
| 3. Errors | Typed conditions, no generic catch | Loser not returned, winner never undone |
| 4. Bounds | No loop/retry/wait in module | One CAS attempt, bounded delegated capacities |
| 5. Allocations | Construction only, getter without explicit allocations | Concurrent candidates and GC to measure |
| 6. Verified data | Preflight before arrays, two read-only fields | Getter: one load, acquire, type; no retained source |
| 7. Decisions | RTA-D01…D08 aligned | Coverage/MC/DC to demonstrate |
| 8. Ownership | OWNER/SHARED, private opaque slot | Sole productive CAS writer, serial FI restored |
| 9. Traceability | ASDF and method present | Matrix and full check later, not inferred statically |
| 10. Standard | Safety 3, FTYPE, types, short functions | `t` slot avoids ASDF cycle; getter checks it |
| 11. Parallelism | No new per-operation coordination | Release before CAS, acquire getter; only return after success |
| 12. Durability | No format or I/O | Volatile publication; H=M does not authorize traffic |

<a id="precisazioni-recepite-prima-dei-run"></a>

## Clarifications incorporated before runs

Reviewer requested distinguishing unchanged binding
from a still-free binding: another attempt may have published it.
Docstring now says pre-CAS error publishes no candidates.
Constructor uses existing register locks, not an additional protocol;
docstring makes invariant propagation and bootstrap stop explicit.
Coordinator clarifications, without changes to reviewed protocol.

Losing CAS branch is not forced by workers starting together.
Observed coverage will be distinct from scheduling guarantee. Recovery
after interruption immediately after CAS: static argument, dedicated
dynamic test open. No hook or replacement of CL primitives.

Reviewer found no functional defect under preconditions;
compilation, runs/FI, coverage, MC/DC, measurements, and reference
platform remain to verify separately. Canonicality, temporal plan validity,
capability rebuilding, and traffic gates are controller obligations.
An invariant prevents bootstrap continuation.

Review does not confer full C1 qualification.
