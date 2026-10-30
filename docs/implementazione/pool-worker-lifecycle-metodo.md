<a id="metodo-preregistrato-dellattuazione-logica-dei-worker"></a>

# Preregistered logical worker-actuation method

Preregistration dated 2026-10-13, before frozen campaigns, on base
`105ae0dd28a6ae3e7ee60ab1477815a49b1b350b`. Scope: five new sources
`src/scheduler/lifecycle-{types,build,read,worker,update}.lisp`, package
and ASDF changes, tests, and local C4 tool. C3 component connects
controller target to requests and acknowledgments for preallocated workers.
Creates no threads, waits, or semaphore signals; changes neither
ready, leases, obligations, nor C1-component Serie connections.

Activation and retirement logical: only context's thread can
acknowledge request after complete IDLE-worker barrier.
Actual count comes from acknowledgments; sending command does not
equal completion. Gate retains owners and context;
monotonic generation prevents reuse or overwriting of pending
commands. Physical owner and its gate do not transfer.

<a id="verifiche-previste"></a>

## Planned verification

- Gate factory on context owner and registration on
  controller owner; valid configuration, free contexts,
  distinct gates and owners, consistent maximum, initially active prefix.
  Gate-vector copy; original input modifiable without changing
  published registry. Incorrect domains and configurations must be
  rejected before publishing or binding incomplete structure.
- Packed values and generation endpoints; separation of command and
  acknowledgment, pending-request preservation, and reuse,
  regression, or exhaustion rejection before any mutation.
- Identical already-applied command, active/inactive transition, and return
  to active. Acknowledgment only on real owner. CLAIMED, RUNNING,
  BATCH, FINISHING, RESCHEDULE, and FAULTED do not attest IDLE; lease, debt,
  reference, and fault must remain intact after rejection or deferral.
- Every count in a read concerns observed acknowledgments;
  in-progress requests excluded from active-worker count. Registry
  checks owner and binding, ranges, and request/acknowledgment relation.
  Do not infer global quiescence from EMPTY or BUSY ready list.
- Sample wrapper: full metric, time, count, and generation-budget
  preflight before writes; target retained with pending
  acknowledgments. Sample error must not leave partially
  updated commands or controller.
- Finite traces with growth, shrinkage, and load reversal, busy
  worker and delayed acknowledgment; tests on two real owners with harness-only
  deadlines. Verify no command replaces pending one
  and feedback waits for acknowledgments.
- Read code for types, safety 3, declarations, REQ/OWNER/SHARED,
  bounded functions, no product callback, thread, or wait, and no
  globally shared write on request path. Independent automated
  readings are not human certification.

<a id="copertura-e-misure"></a>

## Coverage and measurements

C3 gate at least 95% of expressions and branches, compared using exact
integers without rounding. Scope includes all five new files and
`src/scheduler/package.lisp`, including structure-generated paths;
no exclusions. Old controller and worker files not
attributed to new component. Reader checks complete inventory,
agreement between native SB-COVER data and HTML index, nonzero denominators,
identity, and position of every missing path. Public
SAVE-COVERAGE checkpoints after loading preserve startup marks before
runtime reclaims code components; do not alter marks. Preserve
native data and every original HTML even in failed attempts.
SB-COVER does not attest MC/DC.

Heap measurement separates product from test coordination. Startup, factories,
threads, synchronization, oracles, and GC outside measured slice.
Warmup 128 cycles, five replicates of 4096 cycles, safety 3; no generation
reset or wrap. Sensor preserves heap bytes, raw ticks,
completed count, and deterministic sink; zero clock means
below resolution, not zero time. No timing or performance threshold
derived from campaign; external load remains uncontrolled.

Campaign A applies preallocated packed-command C4 fixture on current
context owner. Each cycle retains monotonic progression
and verifies retirement, repeated acknowledgment, activation, and repeated acknowledgment.
Fixture may write request at quiescence without competitors while retaining
protocol progression, but declared private and does not qualify coordinator.
Campaign B creates two contexts on distinct real owners during startup,
with initially active prefix, and measures only registry update/read
on coordinator under hold and pending conditions. Test barriers
remain outside heap sensor. Growth, shrinkage, and actually concurrent
acknowledgments verified by integration tests; not presented as
allocation-free measurement of that harness.

C4 tool must detect deliberate allocation, incorrect sink,
API result differing from oracle, clock below resolution,
invalid CLI, existing destination, and partial raw data after error.
Coverage reader must reject malformed bits, lengths, duplicates, and HTML
schema, mismatched counts, and below-threshold gate. Compilation
without warning/style-warning and self-tests precede product measurements.

Every frozen qualification process uses `tools/record-command.lisp`:
argv, environment, original output, outcome, and initial/final source identity.
Dedicated caches avoid contamination. Failed attempts remain failed
tests; no missing raw data reconstructed or promoted. SHA and original bytes
of published artifacts verified. Physical park/wake, startup and joins,
shutdown, dead workers, I/O, admission, real sensors, and tuning remain
out of scope: campaign qualifies bounded logical actuation.
