# Bounded ordinary client receive — method before product edits

Base: `68b79c69a6d8a7df92f2005132b5c24d377af1e7`. Investigate the two
successful recv calls required by the prefix/body client path. The proposed
internal receiver reads only into its already reserved full-frame input grant,
validates the prefix as soon as available, and retains any coalesced suffix
without decoding it before the next request. One client still owns one in-flight
request; direction, exact correlation, full CBOR/document validation, absolute
deadlines and cleanup boundaries remain unchanged. The actor/server is unchanged.

Before edits, record a native recv-count diagnostic through the injectable I/O
backend and a public `client-get-into` baseline. Reuse the previous frozen
`bench.lisp`, `server.lisp` and `common.lisp`: eight resident/paged × 1/8-client ×
1,024/60,000-byte cases, five 500-read windows each, 90,000 byte-verified reads.
Request latency excludes validation; window wall/CPU/allocation includes exact
byte validation and synchronization. Preserve raw samples and driver hashes.
Keep diagnostics outside performance windows. Compare only identical drivers;
report all windows, variability and regressions without claiming production SLOs.

Qualify every prefix split, complete-frame single read, coalesced frame reuse,
negotiated grants, zero/oversized prefix, fragmented bodies, EINTR/EAGAIN/EOF,
fresh deadlines before buffered completion, malformed buffered responses,
authoritative rejection/reuse, invalid outgoing preflight and incomplete nonlocal
exits. Cover both formats and storage modes through real service/reopen tests.
Run all affected local/CBOR suites on SBCL 2.6.9 and 2.6.10, static, trace, docs,
CI self-tests and all relevant spikes. Complete two C1 readings and a decision
table. Preserve exact source identities, failed variants, terminal receipts and
verified compressed evidence before scoped cleanup and non-forcing publication.
Other worktrees, branches, processes and shared Git maintenance are excluded.

A counterbalanced calibration also compares the immutable base receiver and the
product receiver within the same process, connected clients, server and public
GET-INTO API. Only C4 replaces the receiver function while workers are parked.
The base function is read from the fixed base commit, not reconstructed from a
new implementation. Both selectors pay a common guard rejecting unexpected
network read-ahead across requests, so the base receiver cannot silently discard
new buffered bytes. Warm calls alternate; five pairs per case alternate order.
Receiver tags BASELINE/CANDIDATE identify raw rows; both call GET-INTO. Full runs
have 80 windows and 180,000 reads. Record all four driver hashes, base commit/blob,
all client ID/CSN outcomes and exact raw quantiles; repeat to expose variation.
This calibration includes its common dispatcher overhead, unlike standalone
product timing. The server and its arrival policy are unchanged.

The first bulk receiver retains a duplicate clock query on the empty-input path;
its paired runs are diagnostic, with mixed timing outcomes. Two C4 readiness-first
spikes isolate an initial poll, with and without bulk receive. These add no product
policy. The selected receiver removes the duplicate clock only when there are no
unread bytes: the prefix-attempt clock already checks the same deadline. Retained
bytes still receive a fresh pre-compaction check. Repeat the matched campaigns on
this final source before interpreting timings. The initial final-candidate run
started while the focused process was still finishing; it is retained as a
diagnostic. The standalone final-candidate-repeat runs alone after both finish.
