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
| Primary index | [Resident index](indice-primario.md), [automatic selector](indice-automatico.md), [pages in the M1 GET path](indice-paginato-m1.md) |
| Index images | [Building](costruzione-indice-m1.md), [activation](attivazione-indice-m1.md), [renewal](rinnovo-indice-m1.md), [maintenance](manutenzione-indice-m1.md) |
| Reads and recovery | [GET](get-record.md), [Serie recovery](recovery-serie.md), [Archivio recovery](recovery-archivio.md) |
| Concurrency | [Pool/Serie chain](pool-catena-risultati.md), [snapshots](snapshot-csn.md), [epochs and reclamation](epoche-e-reclaim.md) |
| Full text | [Analysis and queries](full-text.md), [codec](full-text-codec.md), [PUT/WAL binding](full-text-put.md), [rows](full-text-righe.md) |
| CRC32C | [Backends and platforms](crc32c-piattaforme.md), [measurements and kernel selection](crc32c-unroll32.md) |

The [module catalog](moduli.md) retains all component contracts, code links,
methods and verification records.

<a id="limiti-attuali"></a>
## Current limits

- M1 exposes one Serie and one serial actor. Historical MVCC, multiseries
  transactions, complete compaction and hot rotation remain outside this profile.
- Pages can serve the optional M1 GET path; the resident index is still present.
  Automatic switching between resident and paged modes remains incomplete;
  capacity beyond RAM remains unqualified.
- Full text includes Unicode analysis, a codec, document preparation and writer
  bindings. Durable publication, MVCC and Query Engine integration remain open.
- Each campaign states its platform and scope. Local tests do not automatically
  qualify Linux, power loss, C1/MC/DC or whole-engine performance.

The [evaluation](../valutazione/README.md) distinguishes available measurements from
targets; the [verification plan](../affidabilita/piano-di-verifica.md) defines the remaining gates.
