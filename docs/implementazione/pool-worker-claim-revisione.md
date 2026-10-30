<a id="revisione-indipendente-della-presa-governata-dal-pool"></a>

# Independent review of pool-governed claim

Static reading on 2026-10-13 at base
`900fa93d9e14a252e6a2b5a009d19728b2de34af`, performed by an agent other
than the new gate's author. Final outcome: **positive for the C3 scope**, after
the documentation clarification described below. The reviewer modified no
product code or tests. This reading is not a human
review and does not attest build, test, coverage, or measurement outcomes.

Read: the [contract](pool-worker-claim.md),
[preregistered method](pool-worker-claim-metodo.md), gate, export,
ASDF order, and twelve new tests. The applied framework is
[ADR-0031](../adr/0031-software-critico-criteri-e-priorita.md),
[ADR-0034](../adr/0034-policy-di-compilazione-e-standard-di-codifica.md),
[ADR-0045](../adr/0045-modello-di-esecuzione.md), and the
[coding standard](../affidabilita/standard-di-codifica.md).

<a id="identità-della-lettura-finale"></a>

## Final reading identity

The following SHA-256 identities refer to files read before frozen
campaigns. Any subsequent results must state
whether they used these same versions.

| File | SHA-256 |
|---|---|
| `src/scheduler/pool-claim.lisp` | `e384f6091a5fcb506e718e12e77b06ab8dd4233a41024bc57ca3b14425e10b14` |
| `src/scheduler/package.lisp` | `a44fd2c3d435e1f6729bf861b6caeb54a184f31c92e7909aad9c18b491f03cdf` |
| `arcdocdb.asd` | `766acc26f77abbcf6c19b9d1e4ba02042a31f14f70fdf62b53d71e6ea3965937` |
| `tests/scheduler/pool-claim.lisp` | `f968d57b6ff4dfc3cc31f1b1979afa896d95435093406b36320800783629901f` |
| `tests/scheduler/support.lisp` | `300234f9ac7931f8c8b9bf305498a2742a3b8868dd9158dbab8c7fdceed5a1e4` |
| `docs/implementazione/pool-worker-claim.md` | `20240f3011569792d86d0369e374b3e6c43dcac48192ea34c0fd37b54f211ef7` |
| `docs/implementazione/pool-worker-claim-metodo.md` | `aedfadbf875ef9b58ba54bc4b5269aba438983e53137c5c3eef645e1265f1e19` |

C1 coupling and lifecycle protocol were checked on these
existing sources, without changes to their files:

| Source | SHA-256 |
|---|---|
| `src/execution/worker-types.lisp` | `62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317` |
| `src/execution/worker-boundary.lisp` | `4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a` |
| `src/execution/worker-claim.lisp` | `62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e` |
| `src/execution/ready-types.lisp` | `0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f` |
| `src/scheduler/lifecycle-worker.lisp` | `ec8b462ff3f5f7a6435f0f0c01b62034d8de2a784a9e354d469a0adfec9cf837` |
| `src/scheduler/lifecycle-read.lisp` | `c60e1d5f67eeafb216b374fa001d27f87d1a734c5d066fc092902c0301069200` |

<a id="rilievo-corretto"></a>

## Corrected finding

The first wording said that an inactive worker did not consult ready
and retirement preceded every access to it. The function actually
always executes `%richiedi-worker :idle` before lifecycle. The C1 verifier
reads partition-vector size, cursor/home indices,
and types of the two partitions referenced by the context. It does not read ring head,
tail, count, or slots; it acquires no guard and searches for no work.

Final contract and method distinguish this immutable-shape check
from ring polling, scanning, and mutation. The docstring now
promises preservation of ready/cursor. Rereading confirms the
correction; the executable gate body remained unchanged.

The gate's previous version had SHA-256
`37d8e2f60d7da8f5de1f5df6774bb2ac32e430771d370adc3689c25dd3222ddb`.
The first contract and method versions had, respectively,
`ee7cbc96be1e4a9895025ea4d9580dab034315c82786f27d8fe1015e4dbbec4e`
and `af28052c22ebe07e4d26d93d8ff618d960ea5221a80190436a51e606c08ac1df`.
These identities distinguish earlier wordings from the final reading.

<a id="confine-c3-e-protocollo"></a>

## C3 boundary and protocol

The gate controls when to delegate a new claim. The gate contains the
immutable context, so caller cannot separately supply a
different context. Gate owner precedes every context access;
the phase getter also checks execution owner. Every non-IDLE phase,
including FAULTED, is rejected without reading a live lease, applying a
command, or replacing the first fault cause.

On IDLE context, the full C1 barrier precedes lifecycle even when
the gate is inactive or request=ack. The `:unchanged` value is therefore not
used as proof of IDLE or health. After the gate, only the active branch calls
`execution:prendi-writer-worker`, which retains its own checks, obligation
transfer, and fault boundary. The new file does not write C1 integrity
fields or wrap pool errors in `%passo-worker`.

Private dependencies are `%richiedi-worker` and reading the validated
cursor. They require attention in future execution changes: the
gate must retain owner/phase/shape order and nonmutating reads.

Retirement published after the active read may allow a single
claim to start. The command remains pending until return to IDLE. CLAIMED,
batch, FINISHING, and RESCHEDULE obligations continue using existing APIs;
a full ring may assign a new writer and still prevent retirement.
The contract does not promise convergence under perpetual saturation.

The fourth value retains the base lifecycle domain. On the
normal, exclusive IDLE path, `:unchanged`, `:activated`, and `:retired` are expected;
the declaration also allows `:busy` and `:faulted`, like the delegated API.
No new reachability is attributed to those two values.

<a id="lista-di-controllo"></a>

## Checklist

The twelve C1 checklist points are used as an additional check. They do not
change class C3 or constitute the two reviews required for C1.

| Point | Static assessment and limit |
|---|---|
| 1. Requirements and ADR | REQ-THR-001, REQ-CON-001/002/004/005, and REQ-AFF-008 consistent with governance of new claims, ownership, and bounds. REQ-THR-001 remains open for the whole engine. |
| 2. Invariants | Owner before fields, context bound to gate, non-IDLE before ACK, complete C1 IDLE even for inactive gate, claim only in active branch. Obligation preservation covered in fixtures read. |
| 3. Errors | Typed owner and phase reasons; delegated invariants without hiding. Gate rejections do not poison C1. Claim errors retain the execution boundary. No ACK rollback after failed claim. |
| 4. Bounds | No loop, recursion, wait, syscall, or retry in gate. O(1) beyond C1 verifiers; only active branch delegates bounded scan over at most 64 partitions. |
| 5. Allocation | No list, closure, or structure explicitly created in gate; multiple values. Absence of heap remains to be measured and is not attested by reading. |
| 6. Results | Claim writer, outcome, and cursor forwarded without reinterpretation; inactive returns NIL and already validated cursor. Fourth lifecycle value retained; no error value ignored. |
| 7. Decisions | Two simple `unless` and one `if`; no new compound predicate. Cyclomatic complexity 4. MC/DC not required for C3; expression and branch coverage remains separate. |
| 8. Ownership | Gate and context of nonreentrant worker, ACK delegated to its owner; coordinator request. No new global state or synchronization protocol. |
| 9. Traceability | REQ on function and in twelve test names. ASDF loads gate after execution/lifecycle and registers tests. Reviewer did not run build, lint, trace, or full check. |
| 10. Standards | Safety 3, complete ftype, docstring, and OWNER/SHARED comments; 18-line function. No handler, cleanup, declaration removing checks, or deviation identified. |
| 11. Parallelism | No global write per message. ACK per wave and partitioned ready, touched only by active C1 claim. Review does not measure scalability, fairness, or progress under load. |
| 12. Durability | No effect on payload, CSN, files, or Serie controller; no durable change or deletion. Disk atomicity not applicable to this gate. |

<a id="lettura-delle-prove-nuove"></a>

## Reading of new tests

The test file contains twelve named tests. They were read as code,
without running them or attributing others' reported PASS to this review.
Caller uses real writers and ready lists; successful claims are checked
with writer identity and completion through execution APIs.

| Test group | Expected code evidence and limit |
|---|---|
| Inactive with ready work | Gate, context, ring, and writer images preserved; FI sentinel in `%prova-pronta` distinguishes no scan from scan without pop. |
| Real growth and retirement | Real controller and registry with distinct owners; growth leads to claim of already queued writer, retirement leaves writer in ring. |
| Owner and phases | Foreign owner before phase/corrupted words; all six non-IDLE phases retain references, debt, and first cause, even deliberately inconsistent ones. |
| Corrupt IDLE and protocol | Quiescent FI on cursor/home/writer/lease/pending/fault, four active/request/ack configurations, and invalid words. Images preserved before ACK/pop; no C1 fault added by pool. |
| Acknowledgment CAS | Fixture invokes real CAS helper with wrong OLD; counts invocation and checks rejection without pop, then applies original command. |
| EMPTY and BUSY | Outcomes and cursor rotation checked on real shards; occupied guard prevents claim and retains work. |
| Late command | Boundary FI after real active sample, before pop; one task completed and retirement acknowledged at next claim. Injected interleaving, not observed random race. |
| Bridge and full ring | Pop under both leases, acknowledgment, closure, and explicit obligation transfer; full recycling returns a new writer and routing selects its Serie. |

FI that temporarily replaces functions restores definitions
with `unwind-protect` and declares quiescence. Direct execution bypasses
in tests are explicitly C4 setup, drain, or cleanup; they are not
presented as claims authorized by an inactive gate. Sentinel payloads
are checked in buffer; this does not qualify durable effects of application
operations. The in-memory Serie backend does not qualify native I/O.

<a id="limiti-dellesito"></a>

## Outcome limits

The reading runs no build, lint, trace, test, tool self-test,
coverage campaign, or benchmark. The C3 gate of at least 95% of expressions
and branches, heap measurement, and full check remain to be attested on
frozen sources and original output. The statement that ACK remains valid
if the subsequent claim fails is checked statically in code
order; the twelve tests read contain no FI dedicated to that exact case.

Wake/park, gradual startup, dead workers, sensors,
Archivio coordination, message admission, physical shutdown, and complete
dispatcher are not attested. QA-12/19 and the engine thread requirement remain open.
No human review result or formal qualification is implied.
