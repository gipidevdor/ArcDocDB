# ADR-0087 — Explicit conditional Unix groups

- **Status:** Accepted for incremental integration under the author's instruction.
- **Date:** 2026-11-01
- **References:** [ADR-0083](0083-explicit-unix-write-groups.md),
  [ADR-0085](0085-conditional-current-writes.md),
  [ADR-0086](0086-conditional-same-turn-group-commit.md), REQ-IPC-002,
  REQ-TXS-002/003, REQ-WAL-002/006, REQ-LIM-003, REQ-AFF-004/008.

## Decision

Expose independent conditional writes to one synchronous Unix client through
`connect-local :conditional-groups t`. Offer opcode 7 independently of existing
4/5/6 options, as the ordered optional subset of `[4,5,6,7]`. Require exactly the
offered capabilities before READY; keep all previously valid handshake bytes
and the public handshake decoders' two return values unchanged.

Opcode 7 carries an array of 1..8 members: `[1,key,expected,document]` or
`[3,key,expected]`. Keys are distinct binary strings under the existing 1..1024
byte limit; documents retain the minimal CBOR and 1..60000 byte limits. Expected
tokens are unsigned u64, with zero meaning absence. Validate the whole frame,
every member and duplicate keys before copies or engine admission. The negotiated
frame and administrative `max-write-group` limits apply. Invalid input returns
status 1, budget refusal 5, unnegotiated operation 4, and unavailable engine 3.

The explicit request is a barrier, draining earlier collected writes. Recheck
the absolute deadline after draining and immediately before engine admission.
Reuse ADR-0086's private conditional projection and existing cumulative strong
writer. A READY unadmitted capacity refusal returns status 2 for the whole
request; never split or retry it. Admitted faults and response-encoding errors
propagate uncertainty. All-conflict groups skip writer maintenance and flushing.

A status-0 response contains exactly one `[applied:boolean,token:u64]` per member,
in request order. Applied tokens are positive and strictly increasing among
applied entries. Conflicts carry current live CSNs or zero for absence, with no
CSN consumption. The public `client-write-group-if` takes stable existing write
descriptors, expected-u64 input, exclusive token-u64 and applied-u8 outputs, and
an optional `:count` prefix. Return the applied count. Validate in private
scratch, check correlation and the original deadline, then copy both complete
prefixes. Refusals preserve outputs; malformed/lost/late mutating responses close
the client with `outcome-unknown`. An incomplete exit authorizes no results.

Reserve 80 additional array-payload bytes per server connection (expected tokens,
condition and result bytes) and eight result bytes per client. New flag slots,
object and array headers are additional. Reuse the existing descriptor/span/CSN
workspace; clear all request references and scalar scratch on every exit. This
does not establish a complete allocation or RSS bound.

Each applied operation retains its independent SEAL as atomicity point, followed
by the covering strong flush and FIFO publication before acknowledgment. A crash
may recover a sealed prefix; a lost response may hide complete success. Conflict
tokens identify this serial comparison point, not a future stable value. This
is not an all-or-nothing transaction, historical MVCC or exactly-once delivery.

## Evidence

Reuse SPK-03 flush sharing, SPK-07 prefix/publication models and SPK-11 partial
I/O and ownership checks. Preserve the preregistered
[method](../../spikes/results/2026-11-01-local-conditional-groups/method.md),
unchanged-driver baseline, exact wire fixtures, failure tests, SIGKILL/reopen,
single-client response loss and qualified final source identities. Separate
controlled serial measurements from P99, natural load, power-loss and whole-engine
qualification. [Results](../../spikes/results/2026-11-01-local-conditional-groups/report.md).
