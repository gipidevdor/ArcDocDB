<a id="delta-seriale-dellindice-m1"></a>

# Serial M1 index delta

> **Decided (authorized incremental integration → ADR-0067)** — REQ-IDX-010,
> INV-I8, INV-I1, INV-A8, INV-P6. C1, sole M1 owner, no new state across Serie.

The original membership-only contract below is superseded in representation
and lookup by [ADR-0071](../adr/0071-delta-location-indice-m1.md):
the [location delta](delta-location-m1.md) owns complete committed descriptors
and tombstones. Current array payload is `57*C + delta-key-bytes`.
Admission, WAL atomicity, renewal, and restart obligations below still apply.

```lisp
(arcdocdb.engine:attiva-indice-paginato-motore engine option
  :delta-keys 1024 :delta-key-bytes 65536
  :max-activation-payload 16777216)
```

The image is verified against the current source as in
[ADR-0066](../adr/0066-attivazione-seriale-immagini-m1.md). With delta enabled,
PUT and DELETE keep it open. GET uses the resident index for touched keys,
the paged index for all others. DELETE retains membership even if the
key did not exist, so the old value cannot reappear. The full copy
distinguishes collisions, lengths, and prefixes; a digest is not proof.
`modo-indice-motore` returns `:paged` while the image is active,
even if a specific GET is resolved by the resident delta.

Options are pairs zero/zero (default, previous behavior) or
1..65536 keys and 1..16777216 bytes. Let C be the smallest power of two at least
2 * delta-keys: additional payload is `16*C + delta-key-bytes`.
Preflight includes the still-live previous delta and the new one;
headers, objects, GC, and RSS remain in the controller reservation, not qualified here.
Two preallocated arrays, no caller copy retained or intentional allocation
in probes and registrations. At most C probes, each comparing
at most key length (65535 bytes); no waiting or recursion.

Exhausting a quota raises RESOURCE-EXHAUSTED before CSN/WAL, without mutating
membership. An already touched key may update even at full quota.
To free quota the controller builds a new name with the M1
producer and activates it: verifies current source and publishes an empty delta.
An old derivative cannot be reactivated after a write.

Commit registers the key only after BUSY, before WAL; it lends no
locations. SEAL is the durable point. Errors or nonlocal exits after admission
cause FAULTED; partial membership is unreadable. After SIGKILL,
canonical replay rebuilds PUTs and tombstones; the volatile delta is discarded.
Startup without a candidate stays resident; startup with a stale candidate fails.
Retirement and cleanup invalidate delta, view, and FD together; swap is private only.

<a id="decisioni-c1-e-verifica"></a>

## C1 decisions and verification

| Decision | Coverage |
|---|---|
| Shape of both quotas, inclusive limits and zero/zero | out-of-range values, nonintegers, mismatched pairs, default and valid activation |
| Digest high/low, length and byte comparison | forced-equal digest with different bytes, different high/low, different length, internal span |
| Empty slot or key found | new keys, repeated updates, bounded artificial saturation |
| Key or byte quota exceeded | two separate fixtures, no CSN/WAL/file effect; updates at full quota |
| Delta present and image present | default without delta, active, violated invariant with FAULTED |
| GET on paged index and untouched key | PUT, DELETE/resurrection, original absences and intact keys |
| BUSY admission for publication and reading | direct guards and public requests; errors/nonlocal exits at commit |
| Old delta in activation quota | exact quota, one byte insufficient, disabling and replacement |

Two C1 readings: first on source, collisions, tombstones, preflight, and
membership/SEAL order; second on ownership, loop bounds, memory, and failures.
No canonical format change or new durable point. Membership
does not solve resident capacity and is not an independent paged writer
backend. Reproducible tests and limits in the
[record](../../spikes/results/2026-10-29-engine-image-delta/report.md).

<a id="rinnovo-della-quota"></a>

## Quota renewal

The [single renewal request](rinnovo-indice-m1.md), introduced by ADR-0068,
builds and activates a new image with empty delta under continuous BUSY.
Preflight reserves payload for all phases before creating the file.

ADR-0069's [threshold maintenance](manutenzione-indice-m1.md) lets
the controller probe key/byte occupancy and renew only when
the threshold is reached. It does not automatically admit a future write.
