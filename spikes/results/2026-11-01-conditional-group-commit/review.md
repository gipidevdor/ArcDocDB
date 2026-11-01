# Review before frozen-source qualification

Checked engine validation/projection/scatter and actor collection/expiry/fallback
in two readings before the final campaigns. One serial actor and no asynchronous
API reentry remain explicit M1 preconditions.

No condition may depend on any earlier queued key. Engine validation enforces
the same restriction before all lookups, so comparisons can precede the existing
group without a CSN prediction or speculative overlay. Later ordinary writes
retain FIFO semantics. Output prefixes remain untouched on input/capacity refusal
and admitted failure, and all-conflict cohorts bypass writer maintenance entirely.
The projection survives ACTIVE rotation; only the old writer allocates CSNs and
makes independent SEALs durable. All caller references/results clear on exit.

The actor compacts condition flags and expected versions with their connection
owners on expiry. Full/dependent queues drain before enqueueing, with a fresh
deadline check afterward. Known unadmitted capacity refusal alone permits
individual fallback with original conditions rechecked. The resource catch does
not enclose response encoding. Fresh deadline sampling before queueing also
closes a response that expires during encoding, without undoing a completed write.
Old opcode/handshake/client methods are unchanged. Ordinary-only groups keep the
existing direct writer path. A partial peer contributes no queued work or wait.

New serial model histories exercise 576 operations across both formats and
legacy/resident/paged profiles, plus exact file/frontier/flush, alias, fallback,
nonlocal and post-flush oracles. Actual peer tests cover mixed/all conflicts,
same-key races, SIGKILL and dropped strong responses. Public-client loss tests
reuse each owning thread's connection, reconnecting only the deliberately closed
peer, keeping both waves within the eight-connection bound.

Development failures are retained separately: unsupported UIOP SETENV was replaced
with the existing SB-POSIX tool interface; cohort diagnostics moved to stderr to
preserve the runner's sole READY stdout contract; a PING test supplied its key
default instead of NIL; mode variants originally reused a retained Unix socket
name. Reader-only checks also caught test-form balance before compilation.
These failures do not qualify product sources. The final focused record and
complete campaigns use the frozen final inventory.

The measurement/cohort definitions and server driver are identical before/after.
The final driver's untimed log-copy naming also includes completed-window count
to prevent fixture-name reuse within one clock second. Preserve the original
baseline driver/hash; the analyzer verifies its timed definitions against final.
A C4-only fixed cohort gate
makes complete requests simultaneously available; the product adds no wait.
Paired speedup is reported only for the same 2.6.9 runtime; 2.6.10 is supplementary
final measurement without its own old-code baseline. Counter/log/source identities
must pass before cleanup or performance interpretation. Full allocation/RSS,
natural arrivals, tail latency, historical MVCC, transaction atomicity and
power-loss qualification remain outside this increment.

Final measurement review retained the slower v1/resident singleton result rather
than excluding it. A separate same-process alternating old/new diagnostic checks
the old dispatcher sources against the base commit, records each flush and joins
its sequence to parent timing. It does not reproduce the original doubling;
almost all elapsed time is inside durable-flush, with similar residual medians.
The diagnostic uses runtime function replacement and is not part of frozen-source
product qualification. Host/flush variability remains a limitation, not a proved
cause or a guarantee against singleton latency regression.
