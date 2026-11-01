# Explicit conditional groups — preregistered method

Base: `636166661e638855e5c512165d61f38e5c1a796a`, 2026-11-01. Record the
unchanged-code baseline before product edits. Extend the synchronous Unix client
with an explicitly negotiated opcode 7, not another writer or persistent format.
Reuse the internal independent-conditional projection and strong group writer.

One frame contains 1..8 conditional PUT/DELETE operations on distinct binary
keys: `[[1,key,expected,document] or [3,key,expected], ...]`. Every expected token
is u64; zero tests absence. All shape, document, capacity and duplicate-key
validation precedes copies/probes/admission. The administrative write-group
bound applies. Return per-member `[applied:boolean, token:u64]`, retaining order;
only applied entries acquire increasing positive CSNs. Conflicts return current
live tokens and consume no CSN. All conflicts skip the writer. No transaction,
automatic split/fallback, exactly-once claim or implicit retry.

Offer/require capability 7 through `:conditional-groups t`, independently of the
existing 4/5/6 flags. Retain every old/default handshake byte. Validate the whole
response into fixed private scratch, check correlation and the original deadline,
then copy complete output prefixes. Input/frame/capability refusal precedes send;
known server rejection preserves outputs and READY, other mutating exchange
failures close and signal OUTCOME-UNKNOWN. Clear all private scratch on every exit.
Requests are barriers after earlier collected writes and before later reads.

Test independent raw CBOR fixtures, all sixteen capability combinations, malformed
last members, maximum tokens, duplicate/alias rejection, bounded outputs, mixed
and all conflicts, capacity/deadline/encoding failures, short I/O, nonlocal exits,
actual single-client SIGKILL/reopen and response loss. Reuse all prior engine and
collector tests, sealed-prefix crash models and relevant SPK-03/07/11 checks.
Freeze final source inventory before complete 2.6.9, strict 2.6.10 and docs checks.

Benchmark serially outside functional campaigns. One real synchronous Unix client,
formats 1/2, resident/paged storage, widths 1/2/4/8; five windows of eight groups
each, 128-byte documents. Baseline performs WIDTH existing conditional requests;
candidate sends one explicit group. The same hashed parent/server drivers run
both variants. Check each exact CSN, current value and real flush count. Report
median window cost divided by operation count, not individual RPC latency or P99.
No C4 cohort gate, production wait, natural-load, power-loss or reference-platform
qualification claim. Preserve anomalies and failures; retain raw bytes and hashes
before owned cleanup.

After the full functional campaigns and conditional comparisons, refresh the
60,000-byte Unix GET figures on final 2.6.9 sources. Copy the preceding
`2026-10-31-engine-record-cache/local-bench.lisp` byte-identically into this own
result root; verify its Git blob against base `6361666` and its SHA-256 before
and after each run. Use the existing self-test and full eight configurations:
v1/v2, resident/paged (1,200 seed keys at the existing low quota), cache zero/4 MiB,
five windows of 1,024 checked warm GETs. Preserve complete latency vectors and
actual operation/window time; compute useful MB/s and MiB/s from counted
throughput, not reciprocal P50. Startup/seeding remain untimed. This is a current
measurement, not a paired attribution of read improvement to conditional groups,
physical-disk bandwidth or natural concurrent load. Client allocation remains
separate from server allocation. Copy logs before successful fixture removal;
the wrapper propagates any child failure, retaining the command's original output.

The first final-source GET refresh has seven case medians at 273–302 MB/s and
one at 430 MB/s. Before interpretation, repeat all eight cases once with identical
driver/wrapper/analyzer bytes in the separate `get-repeat/` output namespace.
Keep both complete campaigns, rather than selecting the faster run. This repeat
addresses observed variability; it does not isolate a cause or qualify load tails.
