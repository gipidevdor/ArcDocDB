# Public engine conditional groups — preregistered integration

Base `3bf46428e03d7b9e8ef9bd1e6394201b038c3ffe`, 2026-11-02.
Expose the existing bounded conditional projection and strong group writer as
`scrivi-gruppo-documenti-se-versione(engine,operations,expected,tokens,applied,
:count n)`. One serial owner selects 1..8 distinct-key operations. Return the
applied count and complete caller-owned result prefixes: applied byte 1/new
strong CSN, or 0/current live CSN (zero for absence). Preserve output tails,
whole-prefix preflight, all-conflict no-write behavior, independent SEALs,
prefix recovery, original faults and no implicit retry/split.

Use NIL only at the private condition-flag boundary to mean every member is
conditional. Existing explicit flag vectors retain mixed same-turn semantics.
This avoids a new per-engine array, allocation, global state or durable choice.
The existing shared validator enforces distinct keys for NIL before any probe.
The explicit Unix conditional dispatcher calls the exported engine API; the
opportunistic mixed collector retains its private explicit-flag entry.
Wire bytes, capabilities, strong writer, CSN allocation and index modes stay
unchanged. This is an API composition of ADR-0086/0087, not a transaction or new
format/requirement.

Complete two author source readings and a decision table before execution.
Test public counts/prefixes/aliases and complete validation before probes;
independent reference histories, conflicts at full ACTIVE, capacity refusal,
BUSY/foreign owner/state, error/throw cleanup and strong recovery in v1/v2 and
legacy/resident/paged profiles. Prove the socket reaches the public boundary.
Retain existing explicit Unix group, lost-response and crash tests. The real
cross-process campaign uses both automatic modes and formats; no test rebuilds
runtime state on behalf of the product.

Measure actual public all-conflict calls with preallocated descriptors/arrays,
real primary lookups and unchanged frontier/storage. Five 10,000-call windows
after warmup/full GC outside the counter; 1/8 members and legacy/resident modes.
This allocation diagnostic does not measure mutating throughput or imply no
allocation in admitted writes, bignums, paged I/O, errors or arbitrary callbacks.

Qualify named affected cases on SBCL 2.6.9 and 2.6.10 with exact
planned/started/passed IDs; report this selected scope explicitly. Run the full
repository check including all eleven registered spikes, trace regeneration and
documentation. Use the common recorder, preserve failed variants and raw
terminal receipts, and verify source hashes. Retain logs from dedicated P3
runs; normal full-check fixtures keep their standard successful cleanup policy.
Compress only this campaign's completed evidence losslessly. Publish without
force, clean only owned regenerable files, and leave other worktrees untouched.
