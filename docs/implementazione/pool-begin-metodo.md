<a id="metodo-dellavvio-poolserie"></a>

# Pool/Serie startup method

Preregistration on 2026-10-14, base
`ad829a40f6ce72837b59982d2e4f83e8c9ca9f3e`, before formal campaigns.
C3 scope: all six `src/dispatch/` files, including `begin.lisp` and five
already qualified files. No C1 change; [contract](pool-begin.md).

<a id="prove-funzionali-e-revisione"></a>

## Functional tests and review

- Real startup: link/token/phase/reason, dual leases, explicit pop/ack/end.
- Full A→B exchange: begin on current link B, never previous A.
- CLAIMED with inactive port, pending retirement, or inconsistent commands: no
  gate access, ACK, second acquisition, or recycling.
- Actual writer busy: CLAIMED, IDLE, and bridge generation retained.
- Serie busy and exhausted generation: CLOSING with token, no pop or
  reacquisition; explicit end through original bridge.
- Exhausted bridge-token generation: rejection before begin, distinct
  from Serie-lease exhaustion after writer acquisition.
- Foreign owner and inconsistent binding before routing/acquisition.
- Disallowed phases, debt, lease, and first cause retained; invalid
  routing and begin failures propagate original C1 condition.
- Independent C3 reading with checklist; strict compilation,
  safety 3, lint, traceability, and full regression.

<a id="copertura-misura-e-conservazione"></a>

## Coverage, measurement, and preservation

C3 gate at least 95% expressions and branches across the entire package without
manual exclusions. Preserve native SB-COVER, HTML, and agreeing audit,
with denominators and all missing entries; no MC/DC inference or C1 qualification.
Verified C4 reader reused with explicit scope adaptation.

Local sensor with five replicates of 4096 cycles and 128 warmup. Fixtures,
factory, API lookup, and GC outside clock. One cycle includes bridge startup
and explicit ending, recycling and new execution acquisition needed to
repeat the slice; four results and identities enter the oracle.
No private reset, callback, or payload application. The C1 protocol
is part of cost: no attribution to adapter alone or conclusion on
engine throughput. Preserve completed cycles, sink, ticks, and heap;
observed zero heap does not demonstrate universal nonallocation.

Single ACTIVE campaign: one actual symbolic payload stays queued without
pop inside clock. Final drain outside clock consumes and acknowledges it through
the bridge, then ends both leases. CLOSING and busy rejections are
covered by functional tests and not measured by sensor.

Positive/negative sensor self-tests: wrong returns, sink, below-resolution clock,
deliberate allocation, CLI, partial raw data, and existing destination.
External load uncontrolled; no threshold or tuning.
Campaigns on frozen copies with `record-command.lisp` and dedicated caches:
argv, output, exit, and initial/final identities. Preserve failures
and preliminary versions too, bytewise copies, and new exclusive manifests.
