# Versioned reads across independent write cohorts — preregistered method

Baseline: `31b8bdd862829a3aae9aedbc3e66c0a65c653945`, before scheduler edits.
The same frozen `bench.lisp` runs before and after the change. C4 only, no new
runtime dependency. Dispatch, canonical GET, writer and durable flush are actual
product code; the driver supplies three already-complete requests in slot order.
This isolates the scheduling mechanism, not network throughput or natural arrivals.

For versions 1/2, legacy/resident/paged indexes, 1/60000 byte canonical documents,
ordinary/versioned reads and independent/same-key controls, run three windows of
five turns: `PUT(A), GET(R), PUT(B)`. Seed R first. Check every response's bytes,
write CSNs and version token; same-key reads see A's token, independent reads
retain R's token. Count actual `durable-flush` calls and elapsed dispatch ticks.
Expected baseline: two flushes for versioned reads and same-key ordinary reads;
one for independent ordinary reads. Candidate: one for independent versioned
reads too. Same-key controls remain two. No maintenance is required in these
bounded fixtures. No inference of service throughput from latency percentiles.

Qualification additionally covers exact binary key equality including prefixes,
negotiation, response credit 60040, malformed/unsupported input, unavailable
engine, mixed conditional/ordinary writes and conflicts, deadlines around copy
and encode, cached reads and verification fallback, rotation/capacity fallback,
read faults, flush faults and nonlocal exits. Real Unix peers qualify no response
before strong completion, discarded early copies on failed turns and recovery
in v1/v2 with resident/paged indexes. Full project gates remain required.

Two author readings of contracts, control flow, failure boundaries and tests are
recorded before candidate execution; they are not independent review or complete
C1/MC/DC qualification. Preserve failed attempts and source variants. Archive raw
receipts and child logs, compact losslessly, then remove only artifacts created
in this worktree. No shared Git GC or changes to other worktrees.
