<a id="caso-duso-di-riferimento-server-nntp-in-common-lisp"></a>

# Reference use case: NNTP server in Common Lisp

> **Decided (author direction, 2026-10-15; priority confirmed on 2026-10-16)** —
> ArcDocDB's first use will be as the database for a Usenet NNTP server
> written in Common Lisp. This is the priority application case for implementing
> and validating the general-purpose engine.

<a id="obiettivo-applicativo"></a>

## Application objective

The future server stores articles, newsgroup memberships, overview
information, and retention metadata. ArcDocDB provides storage, transactions,
indexes, scheduling, and recovery; the NNTP application owns protocol,
connections, and publication rules. The use case helps assess existing
contracts and remaining [roadmap](../roadmap.md) work.
API, index, concurrency, and recovery choices must first be assessed against
the NNTP workloads described here: publication, Message-ID lookup, overview,
cross-posting, text search, and retention.

ArcDocDB retains its general-purpose nature. NNTP direction alone
does not change formats, invariants, durability levels, or accepted ADR
scope; contract changes follow the normal ADR process. The author's subsequent
full-text search request is recorded in
[ADR-0053](../adr/0053-ricerca-full-text-indici-invertiti.md).
The subsequent request on 2026-10-16 establishes the local Unix socket as the default
and priority interface in [ADR-0055](../adr/0055-interfaccia-locale-unix-socket.md).
NNTP protocol, daemon, TLS, authentication, and application benchmarks are
future work: this document does not introduce them into the current implementation.

<a id="esigenze-da-considerare-nelle-scelte-del-motore"></a>

## Needs to consider in engine choices

| NNTP need | Implication to assess for ArcDocDB |
|---|---|
| Normally immutable articles and Message-ID reads | Append-only, point lookup, byte preservation, and read validation |
| Article present in multiple newsgroups | One content copy and multiple memberships; consistent publication across Serie |
| Overview for a group's article-number range | Ordered scans, secondary indexes, and visibility consistent with articles |
| Word and phrase search in subject, author, and body | Dedicated inverted indexes on text fields, combined with group and date filters in same view |
| Many readers and new-publication bursts | Parallelism, bounded queues and buffers, admission control, and Serie isolation |
| NNTP daemon and database on same machine | Local Unix socket as default interface, priority for first client/server integration, protected runtime directory |
| Article expiration and already active readers | Tombstones, membership retention, CLEAN/MERGE, and reclaim after quiescence |
| Restart after forced shutdown | Recovery of acknowledged publications with explicit durability, rebuildable index, and application retries without duplication |

The protocol reference is [RFC 3977](https://www.rfc-editor.org/rfc/rfc3977.txt),
particularly §§3.6, 6, and 8.3. Message-ID and article number within a group
are distinct identities: the former is compared as an opaque byte sequence;
the latter belongs to an individual group. An article published in multiple groups
can have different numbers in each. The database CSN remains a version
and commit order separate from NNTP numbering.

<a id="modello-applicativo-da-valutare"></a>

## Application model to assess

> **Proposal** — Separate content and memberships: `Message-ID → articolo`
> and `(gruppo, numero) → Message-ID + overview`. Group metadata and retention
> policies have separate responsibilities. The concrete schema and partitioning
> remain to be decided with available engine contracts.

One Serie for all articles concentrates writes on one writer;
the same applies to a global overview or counter Serie. Parallelism
assessments must consider partitioning and
very active groups. Cross-posting adds multiseries
coordination: desired atomic visibility is an application choice to
implement using engine transactions, not a guarantee already demonstrated
by the decision-log format alone.

Retention may remove a membership without deleting content still
used by other groups. Physical removal must also respect
snapshots and active readers. Retry after successful commit and a
lost response must have explicit deduplication and numbering semantics.

<a id="ricerca-full-text-degli-articoli"></a>

## Full-text article search

> **Decided ([ADR-0053](../adr/0053-ricerca-full-text-indici-invertiti.md))** — The engine
> plans dedicated full-text indexes. The NNTP application guides their assessment;
> the first [general-purpose core](../implementazione/full-text.md) implements analysis,
> positional runs, and framing; complete integration remains in phase 8.

The application extracts searchable text from `Subject`, author, and body: MIME decoding,
charset handling, and part selection are NNTP-server responsibilities. Indexed fields
are explicit strings in the document; original article bytes remain preserved.
Message-ID remains an opaque key for point lookup; text search uses the
index's versioned profile without changing group identity or numbering.

One article copy can be indexed once and linked to its memberships.
A group-restricted search combines text results with memberships and retention
visible in the same snapshot, even across Serie; it must not find an
article through an expired membership. Application results are deduplicated
by Message-ID. Partitioning and combination cost remain to assess.

`ARTICLE` continues to require point lookup and `OVER` ordered ranges: the full-text
index adds to these paths. Exposing search to clients will require
an explicit application choice; this document defines no new NNTP command
and does not attribute full-text search to the RFC 3977 standard protocol.

<a id="integrazione-con-il-futuro-demone"></a>

## Integration with the future daemon

> **Decided ([ADR-0055](../adr/0055-interfaccia-locale-unix-socket.md), 2026-10-16)** —
> The future NNTP daemon communicates with ArcDocDB through a local Unix
> stream socket. This path has development priority; TCP is optional and later.

The [architecture](../architettura.md#interfacce) retains the library engine with a
“request plus continuation” interface. The reference NNTP path uses
two processes on the same machine and CBOR frames with request IDs;
socket path, directory, and local access are configured per instance.
TCP listener is disabled by default and a local error does not activate it.
Embedding remains possible for the engine, but NNTP integration
is now fixed on the Unix socket. Listener and client remain to implement.

First local integration follows engine startup, recovery, and admission,
without waiting for completion of Query Engine or TCP. NNTP commands and
advanced queries still depend on their respective product contracts.

Connection handling preserves state and order required by NNTP,
uses bounded capacities, and respects engine admission control.
ArcDocDB workers retain queue and storage-task ownership;
EBR sections end before waiting for the network or a slow client.
Task distribution, buffer copies, and GC cost must be
assessed on the complete path.

A disconnection can leave the daemon uncertain about the outcome of an already
committed write. Reconnection does not automatically repeat requests, and multiplexing
IDs do not deduplicate across connections. Application tests must
include this condition along with Message-ID checking.

<a id="criteri-per-le-valutazioni-future"></a>

## Criteria for future assessments

> **Proposal** — Use application operations `POST`, `ARTICLE`, and `OVER`
> to assess engine paths when the necessary contracts become
> available. Correctness tests precede performance measurements.

Assessments must distinguish point lookup, ordered ranges, and full-text
search with group/date filters;
single publication and cross-posting; warm cache and device access;
acknowledgment durability; membership deletion and physical reclaim.
Relevant fault cases include commit before response loss,
restart with in-flight transactions, and retention during already admitted reads.
Future measurements include throughput, p50/p99, index memory,
compaction/GC interference, and recovery duration, with parameters and limitations
recorded according to the [testing method](registro-delle-prove.md).
The reference path includes client and server in separate processes connected
through the Unix socket: framing, copies, buffers, admission, and response sending are
part of measurement. Engine-only measurements remain distinct.
The [full-text campaign](../13-benchmark.md#ricerca-full-text) adds text corpora,
reproducible analyzers, posting/position memory, and comparison with scanning;
no performance is already demonstrated for this use case.

The [existing vertical test](../implementazione/prova-verticale.md) verifies
generic single-Serie components with crash and reopen. Its coordination
is in the C4 fixture; it does not exercise NNTP protocol, an ordered index for
`OVER`, or the complete multiseries transaction path. Future server feasibility
also depends on completing these connections.
