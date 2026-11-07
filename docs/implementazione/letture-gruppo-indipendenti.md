# Independent read groups in the serial Unix actor

[ADR-0090](../adr/0090-independent-read-groups-write-cohorts.md) extends the
ordinary/versioned GET scheduling rule to the existing negotiated read group.
The wire, public APIs and current-only serial view are unchanged.

## Implementation and bounds

The shared [`read-group-dispatch.lisp`](../../src/local/read-group-dispatch.lisp)
decodes the complete group once; the dependency predicate in
[`write-queue.lisp`](../../src/local/write-queue.lisp) checks at most eight keys
against eight queued writes. Immediate and queued calls share validation and cleanup.
The connection owns its key copies, workspace and response. No new shared state,
lock, wait or payload arena is added. Canonical GET still checks record integrity,
uses the selected primary backend/cache and releases pins before response send.
Every workspace is cleared before later writer admission or on incomplete exit.

| Decision | Required behavior | Verification |
|---|---|---|
| Frame already expired | Close without decoding or reading | Deadline fixture |
| Capability absent or engine unavailable | Drain writes and retain authoritative rejection | Negotiation/state fixtures and existing read-group tests |
| Unnegotiated group expires at its next clock sample | Drain preceding writes before that sample, preserving the existing barrier | Clock-step regression with two flushes |
| Invalid status or empty decoded prefix | Drain; no canonical GET | Malformed and late-invalid member fixtures |
| Frame credit below 65,536 | Drain, using the original collector and actual response budget | 65,535-byte control |
| Empty write queue | Original read path; no artificial flush | Existing read-group suite |
| Any selected key equals any queued key | Drain before the whole read | All eight read positions; PUT, DELETE, conditional apply/conflict |
| All keys disjoint | Copy the whole current result before writer admission | v1/v2, legacy/resident/paged, duplicates, absence and prefix-distinct keys |
| Aggregate response overflows | One status-5/null rejection, no partial vector | Duplicate 40,000-byte document fixture |
| Decode/GET consumes original deadline | Close read; preserve unrelated queued writes | Injected clock after decode and first/last GET |
| Later writer rotates or falls back | Copied response remains unchanged | One-record ACTIVE fixture |
| Strong flush fails or exits nonlocally | No send; scratch released; service closes peers | Error/throw actor tests and process fixture |

## Verification method

Run the complete warning-free build and all registered checks with `make check`.
The command recorder retains environment, exact argv, Git revision, source
hashes, raw output, exit status and failures under `spikes/out/`.
The dedicated tests are
[`grouped-disjoint-read.lisp`](../../tests/local/grouped-disjoint-read.lisp)
and the grouped variant of
[`disjoint-read-processes.lisp`](../../tests/local/disjoint-read-processes.lisp).

The deterministic actor fixture counts actual `durable-flush` calls around
`PUT A / GET-group B / PUT C`: disjoint full-credit reads preserve one strong
flush; same-key or reduced-credit controls require two. Verify decoded bytes,
CSNs and scratch cleanup as well as the count. This demonstrates the eliminated
flush boundary, without inferring a latency percentile or service throughput.

The C4 process server collects three real peers before dispatch. It asserts that
the copied group response exists before the sole strong flush and that no send
occurs until strong completion. Inject failure before and after that flush;
every peer must lose its response. Reopen canonical storage and verify a valid
sealed prefix, all writes after strong completion, exact record CSNs and the
next write. On success, SIGKILL after received acknowledgments and reopen.
Repeat for v1/v2 and resident/paged primary storage.

The complete Unix process suite retains one cumulative fixture. Its finite
process budget is 280: the previous allowance of 256 plus this increment's
24 servers (two formats, two modes, three failure stages and two starts).
A negative test verifies refusal at the bound before any spawn or registration.

The local runtime is recorded by the command harness. Local SBCL 2.6.10/macOS
ARM64 results do not establish the pinned CI runtime's results, Linux behavior,
power-loss durability, natural-arrival throughput or complete C1/MC/DC coverage.

## Two source readings

The first reading follows preparation, dependency checks, canonical copies,
writer admission and response send. Exact disjointness makes the reordered reads
equivalent in the serial logical history; the existing SEAL remains the atomicity
point for each independent write. No new durable state or removal is introduced.

The second reading follows rejection, deadline, I/O fault and nonlocal exits.
Only read-side `protocol-error` while the engine remains READY may close one peer
and continue the turn. A faulted engine propagates through dispatch to service
cleanup. Group and write workspaces release references on every incomplete exit;
copied bytes never become authority through a partial response. Tests target
INV-A8 and the existing bounded actor/no-cross-Serie-wait contracts INV-P5/P6.

<a id="decoder-and-cleanup"></a>
## Decoder ownership and source cleanup

Read-key preparation retains one independent private copy per member after
rejecting two sharing prototypes. Every selected member still executes canonical
GET, including duplicates. Returned document vectors remain independent, and
the full-frame and partial-response rules are unchanged.

New regressions count actual key copies for identical, distinct and mixed
eight-key groups, overwrite the input frame, check reference release and reuse
the workspace for a different request. Error and nonlocal-exit injection during
a later copy must clear both key references and spans. Existing tests retain
complete preflight before copies and independent duplicate results.

The preregistered component comparison used the same decoder with either the
original copy policy or request-local sharing: key lengths 1, 32 and 1,024,
identical/mixed/distinct/near-identical keys, warmup and three measured windows.
All 72 rows per prototype retain elapsed ticks and consed bytes. Generic span
comparison regressed decoder time; the typed dynamic-extent variant allocated
scratch on the managed heap in this runtime and increased total allocation.
Both proposals were removed. The [rejected experiments](../../spikes/results/2026-11-07-lean-code/report.md)
retain original records, exact prototype sources and driver identities.
These are local component results, without service-throughput or universal
stack-allocation claims.

The same cleanup removes the unused `check-outcome` adapter and delta membership
probe in favor of the active word-based record verifier and committed-location
lookup. The latter's ownership test now exercises the actual read path.
Socket tests call the canonical FD constructor directly. The unused FD accessor
wrapper and callback-gated listener are removed; actual startup/admission remains
in `serve-local`, covered by real recovery and no-listener-on-failure scenarios.
Eight client call sites share one nonconsuming u64 ID preflight. Immediate and
queued read groups share decoding, admission checks and workspace cleanup.
The ordinary command body has its own bounded helper so the outer opcode
router stays within COD-13; extraction preserves the exact clock-sample order.
No public export, durable format, readiness gate or verified read is removed.

The first source reading checks that removed names have no product callers and
no exported API, and that real startup still precedes listener acquisition.
The second follows every refusal, fault and nonlocal exit through the shared
dispatcher and client ID preflight. Existing final-u64-ID, deadline, input/output
alias and unknown-outcome cases remain regression controls. This refactoring
does not replace verification with name-frequency heuristics.
