# Scoped client response envelopes — preregistered method

Base `d6c69eec7d531adcd2e2bd7211386c0d4f00dcd8`, 2026-11-01.
Question: can the synchronous client consume each immutable response envelope
within a bounded dynamic extent, avoiding its per-frame managed-heap object?
Public `decode-local-envelope` and queued server envelopes remain persistent.
No slot becomes mutable, no unchecked access, wire or durable behavior changes.

First test the actual SBCL constructor and complete parser with a private
non-escaping consumer. Reject the change if either supported runtime cannot
compile it cleanly or preserve its validation/exception behavior. Extract one
shared validator; private scoped consumers must never retain or return the view.
Keep all deadline, ID, output, rejection and incomplete-exit rules.

Before product edits record the public grouped-into client with its current
allocating finisher. Frozen source copies reproduce that finisher in a disposable
C4 process. After integration compare heap/scoped finishers with the same clients,
server and public API. Switch only with all client owners parked, restore the
candidate at exit; do not mutate functions in any other process. Sixteen cases:
resident/paged, one/eight owners, one/eight members, 1,024 bytes/member or 60,000
bytes/group. Five 5,000-call windows per owner; paired order alternates. Warmup,
cold buffers and pre-window full GC are outside timing. Preserve every latency,
validate every byte/order/length, exact ID totals, final CSNs and actual mode.
Client process counters include validation; server CPU is separate. Local hot M4
measurements are not cold-I/O, natural-arrival or production guarantees.

Qualify independent wire fixtures, fresh public envelopes, bounded scoped success
and failure, partial/coalesced I/O, all client capabilities and nonlocal exits.
Run both SBCL versions, affected suites, registered spikes, static and docs gates.
Record two C1 readings and decision table. Retain raw successes/failures with
source hashes and verified lossless storage; clean only owned regenerable paths,
publish without force and leave other worktrees and branches untouched.

## Pre-edit refinement from the allocation spike

The initial bootstrap harness rejected its own expected ASDF redefinition warning;
its exact source/output are retained. After fixing that harness, ordinary and
inline raw-slot prototypes both retain about 128 bytes per call on ARM64.
Disassembly confirms heap allocation; the [SBCL stack-allocation manual](https://sbcl.sourceforge.io/manual/#Stack-allocation)
restricts raw-slot structure stack allocation to x86/x86-64. A separate immutable
prototype splits ID into two u32 fixnum slots, preserving the full numeric u64
contract, and reports zero managed allocation for 50,000 complete parses at
safety 3. All failed attempts remain distinct from a successful product result.

The product representation must guard the complete u64 ID before splitting and
retain all read-only slots, old constructor keywords and public numeric accessor.
The pre-edit Unix baseline uses the actual original finisher. Paired calibration
compiles its frozen source with its identical full FType under a C4-only alias;
both variants use the candidate shared validator/representation, differing in
persistent versus scoped consumption. The pristine baseline and this calibration
have distinct scopes and must not be conflated.

## Refinement after the first complete comparison

The first paired comparison completes 3.6M groups but has mixed/variable throughput
and about 13 reported bytes/group on the scoped path. Its exact eight changed
source files are retained in `variant-uninlined.lisp` and `variants/uninlined/`.
Both initial eight-suite qualifications pass 299 cases; these remain variant
results. The in-memory public PING diagnostic reports zero scoped allocation,
separating the residual from envelope construction. Compiler disassembly shows
that the envelope and consumer are already stack objects.

A real zero-timeout poll spike identifies temporary SAP boxing in the existing
out-of-line foreign wrapper: 50,000 calls with one/nine disabled FDs report
786,432 bytes; the equivalent inline entry reports zero. Extend the implementation
by the inline declaration at this exact I/O boundary, preserving ABI, pin scope,
timeout, count/errno and all ownership rules. The final poll fixture retains an
explicit out-of-line allocating control and exercises the actual product inline
entry. Also inline the shared validator, private scoped helper and private result
dispatcher to remove call/closure overhead, with unchanged safety/debug policy.

The final focused registry includes all I/O tests (361 cases total). The final
selected qualification includes I/O plus the original eight suites: nine suites
and 460 cases per runtime. Run the full repository check because an I/O source
file changes. Repeat the frozen paired campaign on the final source; both variants
share its I/O and validator. Retain the initial comparison rather than selecting
only favorable rows. Protocol validation and numeric/error allocation limits
remain; zero in a hot measured window is not a universal allocation guarantee.
