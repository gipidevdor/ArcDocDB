<a id="immagini-sigillate-e-adozione-della-root-paginata"></a>

# Sealed images and adoption of the paged root

Increment authorized on 2026-10-28: [ADR-0063](../adr/0063-immagini-sigillate-indice-primario.md),
REQ-IDX-010, REQ-REC-001, INV-I8, INV-A2, INV-A8, INV-P6. Connects
[builder](costruzione-indice-paginato.md), codec, cache, and
[reader](lettura-indice-paginato.md) to read-only verification and an adoptable
serial view. **M1 continues using the resident index.** Canonical inventory/name,
catalog, and startup/writer/GET wiring remain to be integrated.

<a id="fonte-canonica-e-responsabilita"></a>

## Canonical source and responsibilities

`crea-fonte-indice(archive-uuid, series-uuid, token32, csn, count)` copies the
binding to the already recovered source. 16-byte UUIDs, 32-byte token, u64 CSN,
exact cardinality 0..29360128 live keys. The controller supplies the token:
it is neither randomly generated, a codec-calculated hash, nor
inferred from the footer. The controller guarantees exact canonical-plan
identity without reuse across different sources even at the same CSN after
compaction. No coordination or counter across Serie is added here.

The validator for every entry must certify exact membership and candidate
against the authoritative source, independently of the candidate image.
It must not use the same footer/index as its oracle. That callback
and exact source count are trusted inputs: if false, the component
cannot demonstrate committed coverage. Sources and lifetimes
remain the responsibility of controller recovery/MVCC protocols.

<a id="layout-arcirf01-versione-1"></a>

## ARCIRF01 layout, version 1

```text
page zero | contiguous ARCIPG01 pages | footer ARCIRF01
```

Uniform size 4096/16384/65536 bytes. First page entirely zero,
reserved by caller; data pages from offset SIZE. Uniform generation and
positive image in ADR-0058 domain. Root is the last data page.
Footer at exact EOF: `(page-count + 2) * SIZE`, no tails allowed.
I/O quota also includes prefix and footer; builder page quota
instead concerns only data pages.

| Offset | Bytes | Field |
|---:|---:|---|
| 0 | 8 | ASCII magic `ARCIRF01` |
| 8 | 2 | LE version, 1 |
| 10 | 1 | Log2 size: 12, 14, 16 |
| 11 | 1 | Zero flags |
| 12 | 4 | Reserved zero |
| 16 | 16 | Archivio UUID |
| 32 | 16 | Serie UUID |
| 48 | 8 | Image ID, 1..2^60-1 |
| 56 | 8 | Uniform generation, 1..2^60-1 |
| 64 | 8 | Root offset = page-count * SIZE |
| 72 | 8 | Root generation = uniform generation |
| 80 | 8 | Data page count, 1..65536 |
| 88 | 8 | Canonical source CSN |
| 96 | 8 | Source live-key count |
| 104 | 4 | XXH64 high-u32 seed |
| 108 | 4 | XXH64 low-u32 seed |
| 112 | 32 | Canonical source token |
| 144 | SIZE-148 | Reserved zero |
| SIZE-4 | 4 | CRC32C of bytes [0,SIZE-4) |

CRC is checked before metadata. An intact unknown version produces
`unsupported-format`; inconsistent geometry, CRC, identity, reserved fields,
source, or seed produce `corruption-detected`. This is not authentication against an
attacker and creates no new source of truth.

<a id="completamento-del-derivato"></a>

## Completing the derivative

`sigilla-immagine-pagine(builder, root-proof, append-file, source,
:observer nil)` requires the builder's exact file, start at SIZE,
last root, and consistent count. Preflight before effects; footer
prepared in a private buffer. Then exact append and durable flush to expected
EOF. Only then does the builder enter SEALED and return a seal.
A seal **is not** proof of an adoptable image: complete reading
remains mandatory. No pages added after SEALED. Error/nonlocal
exit after admission causes FAULTED; ambiguous offsets are not reused.

Injectable observer at boundaries `:before-footer`, `:after-footer`,
`:after-flush`; must return NIL. It is not commit acknowledgment. Footer
only completes a derivative of already committed sources. If a process
dies after writing footer but before flush/ACK, restart may
accept surviving bytes only after the same complete verification.
This does not promise survival of power loss.

No rename implicitly uses `io:pubblica-temporaneo`: that API
requires a caller's durable decision. This increment neither introduces
that decision in the catalog nor assigns a canonical derivative name.

<a id="recupero-readonly-con-memoria-limitata"></a>

## Read-only recovery with bounded memory

`recupera-immagine-pagine(file, eof, size, source, seed-high, seed-low,
validator, :frames 2, :max-visits 16777216)` borrows an immutable read-only FD
and exact EOF observed by the controller. Use, for example,
`io:apri-lettura-nella-directory`, with sufficient explicit file budget.
The caller keeps file/namespace stable and prevents concurrent
appends/modifications until view retirement. The function neither opens, closes,
truncates, renames, deletes, nor modifies existing files.

First verify footer against trusted source and seed, then zero prefix.
Scan all physical pages with exact identity/generation and complete local
codec. Even empty/unused edges are checked: child types,
radix order, and key-chain contiguity. Root must
contain a bucket or directory, never a key fragment.

For every entry, reconstruct key, verify digest with canonical seed,
nonfuture CSN, and complete candidate. Lookup from root must find
**the same page offset and physical slot**. A duplicate with identical payload
can allow at most one copy to be accepted: the other does not match
resolved origin and is rejected. Unreachable or misrouted
entries are also rejected. Comparing payloads alone is insufficient.

Callback `validator(key, start, end, words)` receives read-only scratch,
retains/modifies none of it, and is non-reentrant. T certifies exact membership
in source; NIL rejects derivative; non-Boolean returns are contract
errors. Finally exact count is checked. Uniqueness, membership, and
source cardinality give **entry** coverage. Unused pages without entries
may remain; not every physical page is certified reachable
from root. The file is rechecked open even after the last
callback: no valid proof is returned on a closed capability.

Footer, prefix, scan, edge, reconstruction, and lookup visits are
charged to the cumulative budget. Cache hits included. Budget measures derivative visits; the
source validator retains its own controller-supplied limits. No derivative I/O after
exhaustion;
a limit is not an ABSENT result. Every lookup also has local
page/key-byte limits. Scanning is iterative, without recursion, bitmap, or
resident set of all keys/PageRefs. Scratch: cache of 1..64 frames,
five working pages during verification (including footer/prefix buffer),
key <=65535 bytes, fixed metadata.
Preparation allocations and GC must be included in controller
reservation: no measured RSS limit or qualification beyond RAM.

<a id="adozione-della-vista-seriale"></a>

## Adopting the serial view

`crea-vista-indice-paginato(source)` starts without a root. Only
`pubblica-immagine-verificata(view, image)` accepts the opaque proof produced
above, checking owner, complete source, and open file before swap.
Rejection preserves previous root. Swap is only a reference
in the actor's private view, without new commit, catalog, close/reclamation,
or concurrency guarantee.

`leggi-vista-indice-paginato(view, key, start, end, words)` calculates digest
with verified seed and returns a LIVE/ABSENT candidate. It does not yet authorize
a document: pinning, MVCC, and record CRC/key verification remain with existing
GET. Borrowed file is checked open even on cache hit.

`invalida-vista-indice-paginato(view, new-source)` retires root before the
new binding. Different UUIDs or regressive CSN are rejected without effects;
same CSN with different token is allowed for a physical source change.
A rootless view rejects reads with `resource-exhausted`, without false
miss. The controller keeps old capabilities live as long as necessary.
No shared state across Serie, lock, or global per-request counter.

<a id="verifica-e-limiti-residui"></a>

## Verification and remaining limits

Independent wire footer fixture, all sizes, maximum keys,
multilevel directories, overflow, and only one frame. CRC-valid mutations
separate physical corruption from source, seed, geometry, digest, and topology.
Missing coverage, identical duplicates, unreachable entries, incorrect empty
edges, changed source, closed FD, and budgets are rejected. Before swap,
every error preserves previous view.

Separate processes with SIGKILL before footer, after footer, and after
flush; a new process verifies image and oracle without changing one
file byte. These are process crashes and native reopenings, not power loss,
filesystem corruption, or qualification of complete engine recovery.
Driver `tools/index-image-crash.lisp --self-test` exercises all three pairs.

| C1 decision | Conditions and cases |
|---|---|
| Source | UUID, token, cardinality in domain; invalid values separately |
| Footer | CRC, magic/version, size/flags/reserved, source/seed; isolated mutations and truncation/tail |
| Root | count, exact EOF, last page, image/generation in domain, equal root generation; CRC-valid semantic corruption |
| Seal | exact capability, consistent prefix/counters, last root, count and Serie; different file, old root, wrong source |
| External key | type, total and position before copy; maximum-key test and inconsistent edges |
| Origin | LIVE, same page, slot and payload; hit, identical duplicate, unreachable entry |
| Edges | bucket->bucket, ordered directory->bucket/directory, contiguous key->key; including empty source |
| Adoption | owner and exact source; different source/foreign thread preserve root |
| Invalidation | exact UUIDs and nonregressive CSN; rejected regression and changed token at same CSN |
| Visits | domains, initial budget and global/local credits; sufficient minimum and adjacent insufficient byte/page |

Two readings by the same author: first format/budget/authority; then lifetime,
effect ordering, scratch reset, errors, and candidate copies.
They are not independent review or complete MC/DC. No global requirement
is promoted to verified. Rollback removes only a derivative; committed
sources and SEAL/EDIT/DECISION points stay unchanged.

The subsequent [M1 connection](indice-paginato-m1.md) implements canonical source,
private startup selection, GET, and retirement before writes; durable catalog
and automatic selection remain separate.
