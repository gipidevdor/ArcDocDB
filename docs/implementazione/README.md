<a id="implementazione"></a>

# Implementation

[Documentation](../README.md) · [Roadmap](../roadmap.md) · [Code](../../src/)

The executable profile is **M1 — Single-Series Durable Core**. One owner manages
one Serie, from opening and recovery through admitted requests. The local
service exposes PING, PUT, GET and DELETE over a Unix socket.

<a id="provare-m1"></a>
## Try M1

1. [Build and verify](../../CONTRIBUTING.md#verifica).
2. [Start the server and client](production-unix-m1.md#ingressi-eseguibili).
3. Read the [startup and recovery](production-engine-bootstrap.md)
   and [Unix service](production-unix-m1.md) contracts.

<a id="componenti"></a>
## Components

| Area | Starting point |
|---|---|
| Engine and local service | [M1 core](production-engine-bootstrap.md), [Unix socket](production-unix-m1.md) |
| Primary index | [Resident index](indice-primario.md), [automatic M1 backend](indice-automatico-operativo.md), [pages in the M1 GET path](indice-paginato-m1.md) |
| Index images | [Building](costruzione-indice-m1.md), [activation](attivazione-indice-m1.md), [renewal](rinnovo-indice-m1.md), [maintenance](manutenzione-indice-m1.md) |
| Committed overlay | [M1 location delta](delta-location-m1.md): bounded locations/tombstones and paged GET independent of resident lookup |
| Automatic maintenance | [M1 delta renewal](rinnovo-automatico-m1.md) before PUT/DELETE at threshold or next-key saturation, with finite fresh names and one admission |
| Reads and recovery | [GET](get-record.md), [Serie recovery](recovery-serie.md), [Archivio recovery](recovery-archivio.md) |
| Concurrency | [Pool/Serie chain](pool-catena-risultati.md), [snapshots](snapshot-csn.md), [epochs and reclamation](epoche-e-reclaim.md) |
| Full text | [Analysis and queries](full-text.md), [codec](full-text-codec.md), [PUT/WAL binding](full-text-put.md), [rows](full-text-righe.md) |
| CRC32C | [Backends and platforms](crc32c-piattaforme.md), [measurements and kernel selection](crc32c-unroll32.md) |

The [module catalog](moduli.md) retains all component contracts, code links,
methods and verification records.

<a id="limiti-attuali"></a>
## Current limits

- M1 exposes one Serie and one serial actor. Historical MVCC, multiseries
  transactions and concurrent/background compaction remain outside this profile.
  [Current-only compaction](../adr/0078-compattazione-prefix-m1.md) reclaims obsolete
  segment bytes automatically while preserving logical RAM/paged storage. Live segment rotation uses
  [canonical checkpoints](../adr/0076-rotazione-live-m1.md) before the next data CSN.
- M1 selects resident/paged storage automatically, including writes, bounded
  replay and return to RAM. A paged handle retains no complete resident index.
  The managed-heap stress is documented; physical-RAM scale and concurrent
  snapshot qualification remain open.
- Full text includes Unicode analysis, a codec, document preparation and writer
  bindings. Durable publication, MVCC and Query Engine integration remain open.
- Each campaign states its platform and scope. Local tests do not automatically
  qualify Linux, power loss, C1/MC/DC or whole-engine performance.

The [evaluation](../valutazione/README.md) distinguishes available measurements from
targets; the [verification plan](../affidabilita/piano-di-verifica.md) defines the remaining gates.
