# Conditional same-turn group commit — preregistered method

Base: `4818552784344573f3dc316b794fb6aa3724c014`, 2026-11-01. Record the baseline
before editing product, tests or tools. Reuse current opcode 6, strong independent
SEALs, automatic primary storage and the bounded same-turn collector. No new
wire capability, batching timer, peer wait, durable format or CSN allocator.

Allow independent conditional mutations to share the existing strong group.
A conditional key must not match any earlier queued operation: drain before
enqueuing that request. Ordinary writes may follow a conditional on the same
key. Reads, PING, explicit groups, malformed/unnegotiated requests and versioned
GET drain earlier writes. This restriction makes pre-group condition probes
equivalent to serial application, without predicting future CSNs or an overlay.

Validate all inputs and the independence rule before probes. Probe under the
existing engine BUSY guards, compact only matching/ordinary operations into fixed
private scratch, commit them through the existing writer, and expose complete
result prefixes after strong completion. Conflicts consume no CSN/append/flush.
All-conflict cohorts perform no writer preflight or maintenance. An unadmitted
capacity refusal may fall back to individual original operations with conditions
rechecked. Never retry an admitted fault or encoder failure. Clear all request
references/results on every exit. Recheck absolute deadlines after draining and
before individual fallback; late committed responses close without a false ACK.

Qualify both formats and legacy/resident/paged profiles. Include independent
operation histories, same-key barriers, mixed conflict/success, all-conflict
capacity, expired-member compaction, output nonmutation on failure, input aliases,
maintenance/reentry, encoder errors, SIGKILL/reopen and lost conditional response.
Finish source edits before final focused/full 2.6.9, strict 2.6.10 and manual
checks. Stable complete source inventories and terminal markers are required.

Benchmark serially, outside functional campaigns, using the same hashed drivers
before/after: formats 1/2, resident/paged storage, cohort widths 1/2/4/8, five
windows of eight cohorts, 128-byte documents. Each independent client sends one
opcode-6 conditional PUT before collecting responses. A C4-only dispatcher gate
waits for the fixed complete cohort (bounded by original request deadlines), so
the comparison measures available coalescing, not natural arrival probability.
The production actor gains no wait/timer. Count actual durable flushes around
each dispatch, check every CSN and value, retain exact child logs, report median
window cost and ratios. Baseline expects WIDTH flushes/cohort; final expects one.
No reference-platform, P99, power-loss or full transaction qualification claim.

Final artifact review: the baseline logs pass their exact hash checks. Before
final measurement, namespace untimed copied logs by completed-window count as
well as fixture leaf, preventing same-second temporary-name reuse. Preserve the
original baseline driver and verify identical measurement/cohort definitions;
the server driver remains byte-identical. No timed path or workload changes.
