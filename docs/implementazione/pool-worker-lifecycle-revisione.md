<a id="revisione-indipendente-dellattuazione-logica-dei-worker"></a>

# Independent review of logical worker actuation

Static reading on 2026-10-13 against base
`105ae0dd28a6ae3e7ee60ab1477815a49b1b350b`, performed by an agent other than
the source author. Final reading outcome: **positive for the C3 scope**,
after the two corrections described below. This outcome does not attest to a build,
tests, coverage, heap measurement, or engine qualification.

The five new lifecycle sources, package and ASDF integration, the
[contract](pool-worker-lifecycle.md), and the
[preregistered method](pool-worker-lifecycle-metodo.md) were read in full. The
controller, IDLE checker, worker claim/handoff, and worker/Serie bridge were reread;
ADR-0011/0031/0035/0045, invariants, and
[coding standards](../affidabilita/standard-di-codifica.md) bound the
assessment. The reviewer did not run compilation, tests, or benchmarks and did not
modify sources, tests, ASDF, the contract, or Git.

Before freezing, the integration was reread against base
`c4bbb037b779d33ee9e8c01b4a33aac875ccf96f`, after the inclusion of CBOR floats
and previous evidence. ASDF, the implementation README, and the current contract
were reread in full. The execution, controller, and lifecycle order and the scheduler
test registration are preserved; the new README entry links to the correct contract
and source. The contract retains its SHA unchanged. The following table records
the identity of the integrated ASDF, without attributing qualification of the new
codec components to this review.

<a id="identità-dei-file-della-lettura-finale"></a>

## File identities for the final reading

| File | SHA-256 |
|---|---|
| `src/scheduler/lifecycle-types.lisp` | `4fe980e00f1d273e9b8278cd2daace6b4a9e4ab948ddfac83b79f4b0c537cb7c` |
| `src/scheduler/lifecycle-read.lisp` | `c60e1d5f67eeafb216b374fa001d27f87d1a734c5d066fc092902c0301069200` |
| `src/scheduler/lifecycle-build.lisp` | `d6d67faf8721f26e7fcd228d6ab9a7dfdc36ff5ec56c67ed9e5fb6d914006a9e` |
| `src/scheduler/lifecycle-worker.lisp` | `ec8b462ff3f5f7a6435f0f0c01b62034d8de2a784a9e354d469a0adfec9cf837` |
| `src/scheduler/lifecycle-update.lisp` | `2020e46809e9fe8fa74e061a420b8085679d5f461eabd8b044f3975c1024800e` |
| `src/scheduler/package.lisp` | `5a139172de1648b30e09fdc6fc068141299c2034702f8d5b5f44bb0de14a3112` |
| `arcdocdb.asd` | `a81c523ececccd4f1f5deaea037cfa419738c881ef37a89f7869f18f6becc7db` |
| `docs/implementazione/README.md` | `b863d42ce333caa19e9e87c9b67d8b12472aba47d2586d0681ff56df445a7aba` |
| `docs/implementazione/pool-worker-lifecycle.md` | `39c95f21b87752208b77844bca26092a4cd9f4f45900a04ead6c3ed42b10dba4` |
| `docs/implementazione/pool-worker-lifecycle-metodo.md` | `e529f3c3959b8143b099febef773ebc880aeae0424c01e3ddec89583d2d3615b` |

<a id="rilievi-corretti-prima-dellesito-positivo"></a>

## Findings corrected before the positive outcome

1. **Unchecked CAS return value, COD-23.** In the first version, the request
   and ack CAS operations ignored the returned value; an unexpected conflict
   could be followed by false success. The author introduced
   `%pool-request-command` and `%pool-ack-command`: both check the
   expected value and signal `invariant-violation :pool-port-state`.
   Rereading confirms the correction. This is not a retry: a conflict breaks
   exclusivity and requires discontinuing use of the component; a partially
   published wave is not rolled back. No C1 field is touched.
2. **Startup validation complexity, COD-13.** The first
   `%pool-validate-ports` reached cyclomatic complexity 11 when counting
   the loop and Boolean short circuits. The author extracted
   `%pool-startup-owner`; shape/capacity and deduplication remain in the
   validator. Both bodies are now below the maximum of 10 independent paths.
   The startup contract and binding after complete validation are preserved.

The previous identities were `ee00fa5436a02bd467368b7eb199f1e1364826c1f01257f731e323ccb4da051f`
for lifecycle-worker, `ef52c911164e7dfe7f0ab0a8d90e5bfc9583a9725de5c546e01639ab76217bf9`
for lifecycle-update, and `5fec1f6e81fc7f1d87e15e4cdcf7904fb9bb75ecb08d92ccc5596e9181a35191`
for lifecycle-build. They are not the versions approved by the final reading.

<a id="classificazione-e-barriere"></a>

## Classification and barriers

The component remains C3 under ADR-0031: it decides logical enablement and
counts acknowledgments, without modifying data, ready queues, writers, leases, debts,
bridges, or Serie controllers. The existing C1 barrier
`execution::%richiedi-worker :idle` is called only for reading before
an acknowledgment; it is not replaced by a weaker C3 predicate. The packed ack
is itself the active state: there is no second copy to synchronize. The factory
call checks IDLE before construction.

The dispatcher must honor the acknowledged Boolean and must not start new
tasks on an inactive port. Without this cooperation, the execution APIs remain
usable: the new component does not promise a complete execution pool. Epochs or
resources outside the context must already have been released by the caller;
the IDLE checker cannot attest to them. The bridge must be used without
bypassing the underlying APIs during a segment.

<a id="lista-di-controllo"></a>

## Checklist

The twelve C1 points serve as an additional checklist; they do not change the
class or turn this reading into the qualification required for C1.

| Point | Static assessment and limitation |
|---|---|
| 1. Requirements and ADRs | REQ-THR-001, REQ-CON-001/002/004/005, REQ-AFF-008/013 specify adaptation, the worker barrier, parallelism, limits, and injected inputs. REQ-THR-001 remains designed for the complete engine. |
| 2. Invariants | Immutable owner/coordinator; nonnegative request and ack within fixnum; only one pending generation with a different bit; capacity equal to maximum; prefix requests and minimum always active. The count uses ack, not command submission. |
| 3. Errors | Typed reasons for owner, input, binding, words, target, and generation. Ordinary rejections precede binding or the sample; a CAS conflict is a terminal invariant. No generic handler, rollback, or hidden error. |
| 4. Bounds | Loops bounded by the vector of at most 131072 ports, no recursion, waiting, syscall, callback, or CAS retry. Worker O(1) beyond the bounded C1 check; reading/updating O(maximum). |
| 5. Allocation | Hash, copy, and structures only at startup. No new lists, closures, or structures appear in the steps; preflight keeps packed arithmetic within fixnum. Observed zero heap remains to be measured and is not inferred from the reading. |
| 6. Checked results | Getter and wrapper check owner, binding, words, request prefix, and count. `:unchanged` only reads the previous acknowledgment: it does not attest to health or IDLE. No application data is returned. |
| 7. Decisions | Compound predicates confined to words, startup, binding, and count range; inventory below. MC/DC is not prescribed for C3. Coverage of complete files and generated forms still needs to run. |
| 8. Ownership | Coordinator owns request/binding, worker owns ack; read/write barriers and checked CAS operations. Nonreentrant access, explicit startup handshake, private vector after copying. No new mutable global state. |
| 9. Traceability and verification | REQ on definitions; ASDF loads lifecycle after execution and controller and includes the lifecycle test file. Tests and campaigns were not run by the reviewer; the C3 gate of at least 95% of statements/expressions and branches remains pending. |
| 10. Standards | Safety 3, complete ftypes for the 13 functions, typed/read-only slots where immutable, copier NIL, docstrings, OWNER/SHARED. Functions within 60 lines and complexity below 10 after extraction. Lint and compilation remain separate checks. |
| 11. Parallelism | Independent words per worker, writes per sample/acknowledgment outside the body of Serie operations. No lock or global counter on a request path. Scalability or fairness is not measured here. |
| 12. Durability | No files, durable change, or effect on payloads, CSN, or Serie controllers. CAS operations are in-memory publication points, with no claim of disk atomicity. |

<a id="inventario-del-protocollo-letto"></a>

## Inventory of the protocol read

| Boundary | Decisions and effect |
|---|---|
| Words | Equal, or request generation=ack+1 with a different bit; every other case is an invariant. |
| Startup port | Valid coordinator thread, valid Boolean, and complete IDLE context before construction. |
| Startup registry | Simple vector of exact capacity; valid port/coordinator, false bound, generation zero, request=ack, correct prefix, and distinct owners before binding. |
| Live registry | Current owner, consistent controller/target/capacity, prefix requests; actual from ack within minimum..maximum and pending from any inequality. |
| Application | Owner before every access; no command returns unchanged. A command on faulted/busy preserves both words; complete IDLE precedes ack CAS and the activated/retired result. |
| Budget | When pending is false, all generations must have room before the sample; exhaustion rejected even for hold. Pending does not create another wave. |
| Publication | Only ports whose bit must change receive generation+1; checked CAS, local target updated after publication. No identical command overwrites a pending command. |
| Wrapper | Delegates the sample to the existing controller; a different target publishes one wave and conservative pending. Invalid metrics and ticks do not publish requests. |

Request/ack reads do not require an atomic snapshot of the entire pool:
on the coordinator, request stays stable during the scan; on the worker,
ack has only one nonreentrant local writer. A wave changes all bits in the
same direction, so acks can arrive out of order and the observed count remains
monotonic. Gaps in the prefix of intermediate acks are legal. If pending is false,
all words read match and actual=target; an already observed pending can instead
remain true after an acknowledgment arrives. The wrapper does not present actual
as a measurement of worker health or OS thread count.

<a id="obblighi-residui-e-verifiche-mancanti"></a>

## Remaining obligations and missing checks

A controller belongs to only one registry; after binding, it is updated
exclusively through the wrapper. Only one operational port per context, even
across different registries, remains the caller's obligation: bound prevents
reuse of the same port but does not detect duplicate new ports. Startup and
the input vector remain exclusive until the factory; publication between
owners requires the documented handshake.

FAULTED retains the command and can block the wave indefinitely in external
time; every API remains bounded. The coordinator's fault response, dispatcher,
physical startup/shutdown, park/wake, I/O, real sensors, and tuning are not
implemented. This review attests to no native timeout or engine progress guarantee.

Before qualification, retain executable results for wrong owner, invalid startup
without partial binding, input copying, non-IDLE execution states without loss of
capacity, inconsistent words/exhaustion, conflicts in both CAS helpers, out-of-order
acks, and invalid samples without mutation. Concurrent tests require deadlines
only in the harness. Build, lint, trace/check, complete scope coverage, C4
self-tests, and heap measurement remain pending at the end of this reading:
none of their results has been assumed or promoted to PASS.
