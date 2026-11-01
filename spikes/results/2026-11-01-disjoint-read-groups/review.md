# Independent ordinary GETs — two C1 readings

REQ-IPC-002, REQ-IDX-001, REQ-WAL-002/006, REQ-LIM-003, REQ-AFF-004/008;
ADR-0088 refines the physical barriers of ADR-0080/0086. INV-A11 strong
publication, INV-V4 exclusive ownership, INV-A9 recovery without truncation,
GET verification/pin release and bounded peer deadlines remain applicable.

## First reading: dependencies, values and resource bounds

The classifier is a pure predicate with a complete FType, requirement tags,
pre/post/ownership contract and safety 3 / speed 2 / debug 2. It reuses exact
binary key equality across at most eight immutable operation descriptors.
It adds no managed allocation, persistent state, lock, wait, timer or mutation.
Only the following conditional queue drain changes. Nonempty queue and full
ordinary-GET admission gates are required. Empty-queue reads retain the prior
path. Normal decoding still owns its copied key; ordinary GET still uses the
same canonical engine API and private output/value arrays. No CRC, key, epoch,
cache, absence or RAM/paged check is bypassed. Existing M1 decode/descriptor
allocation remains a documented qualification limit, not zero-allocation M1.

Preceding independent mutations cannot alter the read key. Reading before their
physical publication is equivalent at the original logical slot. A later write
to the read key follows the read; encoded bytes survive scratch reuse, group
preflight, rotation and individual capacity fallback. Conditional/conflicting
and DELETE descriptors still count as dependencies, even when no write would
ultimately apply. No projected value or predicted CSN is introduced.

## Second reading: errors, deadlines, cleanup and recovery

All socket sends occur in a later actor step. Successful dispatch drains the
whole collector strongly before returning. A canonical read fault may now stop
unadmitted preceding independent writes; no CSNs or durable prefix are promised
to their unacknowledged requests. A later strong fault or nonlocal exit may
leave the read encoded, but aborts the turn and closes peers in outer cleanup.
No response can escape that failed turn. Independently sealed records remain
recoverable; response loss retains unknown outcomes and never permits an
implicit retry. This changed physical diagnostic/fault order is explicit in ADR.

Clock checks before lookup, after copying/encoding, before queue admission and
at each fallback remain fresh. Encoding starts the response deadline once;
strong completion does not renew it. Expired writes are removed before admission
with every descriptor/condition/version column compacted stably. Every turn exit
clears all references/results. Only READY, unadmitted resource refusal may split
the group. Admitted or encoder faults retain the existing fail-stop behavior.
No new durable operation, atomicity point or deletion is introduced.

## Decision table and detection

| Decision term or boundary | Detection |
|---|---|
| Status zero / nonzero | valid independent GET versus malformed GET; both write/response histories checked |
| Opcode 2 / other | GET versus PUT and PING; version/explicit suites retain their barriers |
| Negotiated frame >=60032 | 60031 rejected and drains; exact threshold qualifies |
| Engine READY / unavailable | false term independently exercised before any engine operation |
| Queue nonempty / empty | both classifier cases; isolated/pure-read transport controls |
| Key present / NIL | independent false term; no call to exact matcher with NIL |
| No exact preceding key match | different-length prefix qualifies; same-key PUT/DELETE/applied/conflicting condition drains |
| Later write to read key | present and absent old values retained; later CSN/value checked |
| Group limit / capacity refusal | limit 1 retains individual flushes; max-records 1 fallback rotates without changing copied read |
| Deadline before / after GET / before queued write admission | lookup count, closed peer, no expired write CSN |
| Strong success / error / nonlocal exit | encoded read at observer, no send, queue cleared, no retry |
| Read fault before write admission | exact cause, FAULTED engine, no ACK; reopen retains only seeded strong value |
| Real process success / pre-flush fault / post-flush fault | both formats and primary modes, actual sockets/strong I/O, no response on failure, SIGKILL/reopen and next CSN |

The new tests supplement all previous engine, framing, conditional, group-crash
and process campaigns. Final command/source evidence is recorded separately.
These are serial local M1 checks, not concurrent-reader, power-loss or production
reference-hardware qualification. Traceability and full checks must pass before
publication; this reading alone does not certify a completed run.
