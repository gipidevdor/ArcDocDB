<a id="manutenzione-a-soglie-dellindice-m1"></a>

# Threshold maintenance of the M1 index

> **Decided (authorized incremental integration → ADR-0069)** — C1,
> REQ-IDX-010, REQ-LIM-003, INV-I8, INV-I1, INV-A8, INV-P6.

```lisp
(defparameter policy
  (arcdocdb.engine:crea-politica-rinnovo-indice :soglia-percentuale 75))
(arcdocdb.engine:rinnovo-indice-richiesto-p engine policy)
(arcdocdb.engine:mantieni-indice-paginato-motore engine policy fresh-option
  :max-maintenance-payload 67108864 :max-pages 65536)
```

Immutable configuration, integer threshold 1..100, default 75. Requires a paged
view with active delta, READY owner, and healthy controller. Decision is
true if `count*100 >= key-limit*percent` or
`used*100 >= arena-bytes*percent`. Products, even from u32 slots, remain
within SBCL64 fixnums. No division, rounding, or file access.
With quota three and threshold 75, two keys are insufficient: the third reaches it.
Threshold 100 requires at least one quota full.

The explicit API below remains available. [Automatic M1 renewal](rinnovo-automatico-m1.md)
now connects this policy and next-key capacity to PUT/DELETE through an optional,
finite configuration. RAM-based backend selection remains separate.

Probe is read-only on valid path; it checks counters within capacity,
bytes at least equal to keys (nonempty keys), and consistent empty state.
Corrupt counters or delta without view cause FAULTED. A mode without delta
produces INVALID-ARGUMENT without effects. It consults no OS memory
estimate or reserves the next key: normal PUT/DELETE preflight remains
mandatory and may still reject an oversized key.

Maintenance returns `:mantieni` below threshold. It neither checks
namespace, consumes name, nor modifies image, FD, delta, or CSN.
The candidate may be proposed again until the first successful renewal. Budget
domain (0..512 MiB) and pages (1..65536) are validated even for no-op.
When needed, [serial renewal](rinnovo-indice-m1.md) checks fresh name
and total payload, builds from current canonical source, and publishes an empty
delta with the same key/byte limits. Candidate is then consumed:
next renewal requires another fresh name. `:rinnovato` is not a document-write
acknowledgment and does not advance CSN.

No callback between decision and delegation; M1 serialization excludes concurrent
mutations. After renewal admission, ADR-0068 BUSY, source verification,
close, and FAULTED apply. Policy adds no new loops, waits,
I/O resources, or shared writes across Serie. It implements neither timer, retries,
automatic startup, nor automatic backend selection; controller decides
when to call it and which name/configuration to offer.

<a id="decisioni-e-revisione-c1"></a>

## C1 decisions and review

| Compound decision | Tests |
|---|---|
| Fixnum threshold and 1..100 | 0, 101, NIL, float, rational; valid 1, 75, 99, 100 |
| Counters within limits: keys <= quota and keys <= bytes <= arena | every comparison falsified separately; inconsistent empty state |
| Key threshold or byte threshold | independent cases on real engines; equality and adjacent bytes, maximum quotas |
| Budget domain and page domain | individual limits and nonintegers; validation even for no-op |

Other choices are single branches: delta/view presence, need for
renewal, and error boundary. Six dedicated cases include both formats,
three page sizes, exact/insufficient total quota, occupied name,
reentry/nonlocal exit before and after swap, wrong owner, and two engines
sharing the same policy without mutual mutation.

Two C1 readings: thresholds, independence of both counters, and canonical source;
then numeric domain, no-op, delegated ownership/errors, and cross-Serie isolation.
Internal renewal decisions retain their table and existing SIGKILL
tests. [Evidence and limits](../../spikes/results/2026-10-30-engine-image-maintenance/report.md).

Resident index remains complete; no qualification of RSS memory, throughput,
independent paged writer, durable catalog, or concurrent scheduler.
