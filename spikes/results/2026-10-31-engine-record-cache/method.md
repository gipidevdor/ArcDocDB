# Preregistered record-cache integration experiment

Compare identical strong-write/recovery/GET workloads with zero record cache and
4 MiB of separately granted record-cache payload. Use v1/v2 and legacy resident,
automatic resident, automatic paged primary storage; 2,048/60,000-byte values,
eight hot keys, 128 durable overwrites. Each case verifies active reads, explicit
canonical compaction, and fresh recovery. Five repetitions of 4,096 warmed reads
per phase, exact value/CSN assertions, original per-operation clock ticks, counted
I/O API calls/bytes and observed managed allocation. Timings include the checked
GET oracle and instrumentation, exclude preparation/warmup/full GC and reporting.
Cache is never used to bypass canonical membership or CLOSED row reconstruction.
Thus cross-segment map thrashing remains outside any claimed improvement.

Relevant prior experiments: SPK-05 pread/verification/GC, SPK-09 read integrity,
SPK-06 relocation/cache warmth and SPK-07 source-publication/reclamation models.
Use existing product cache and canonical verifiers; no spike implementation is
promoted. Full `spikes-check` reruns correctness, benchmarks above target the newly
integrated path. These local warm-cache samples do not qualify power loss, Linux,
beyond-RAM operation, physical device traffic, RSS, or loaded socket latency.

## Unix service follow-up

After all qualification and engine measurements, run a separate paired campaign
through the production Unix CLI server in another process. v1/v2, normal RAM
and 3,400,000-byte automatic primary quota, cache zero/4 MiB, eight 60,000-byte
CBOR hot documents, five repetitions of 1,024 checked synchronous GET round trips.
The paged case seeds 1,200 independent keys and asserts the derived paged file
exists. Server startup, durable seeding, warmup and orderly cleanup are excluded
from timing. Client-side allocation is explicitly distinct from server allocation.
This single-client comparison does not measure loaded concurrent-service tails.
