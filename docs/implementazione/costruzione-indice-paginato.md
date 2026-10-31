<a id="costruzione-incrementale-delle-pagine-dellindice"></a>

# Incremental index-page construction

This increment was authorized on 2026-10-28, ADR-0057/0058, REQ-IDX-001,
REQ-IDX-009, REQ-LIM-003; INV-I8, INV-A2, INV-A8, INV-P6. It connects the codec
to an append sink and [paged reader](lettura-indice-paginato.md).
The M1 engine remains resident: the component prepares a derivative;
it publishes no root and changes neither WAL, SEAL, EDIT, nor DECISION.

<a id="api-e-sorgenti"></a>

## API and sources

`crea-costruttore-pagine(start, size, sink, seed-high, seed-low,
:max-pages 65536, :preflight callback)` prepares two buffers and a bucket-capacity
plan. START is the identity of the first free offset, positive and
aligned, in the private image. The caller already owns any
prefix. No container format or implicit header is introduced.
Sizes 4/16/64 KiB; quota 1..65536 pages per builder. Domain and
XXH64 seed are fixed before effects.

`crea-costruttore-pagine-file(file, start, size, seed-high, seed-low, ...)`
connects `io:append-esatto`, checking initial and current position.
Whole-batch preflight goes through `io:verifica-capienza-append`, before
the first page. The append file is borrowed and maintained by the caller:
no hidden open, close, rename, or deletion. An existing file
is not truncated. The caller creates a temporary file through existing
I/O primitives and retains ownership.

`crea-entry-costruzione(builder, key, words)` copies a 1..65535-byte
key and ordinary candidate in five resident-compatible words.
It checks length/flags, positive CSN, zero END, and record limits; calculates
digest with builder seed. Entries have no exported accessors/setters.
A later change to caller input does not change the owned copy.
The function reads no document and proves neither commit, CRC, nor visibility.
Prepared, history, and tombstone are not represented by this API.

<a id="lotti-e-append"></a>

## Batches and append

`costruisci-bucket-pagine(builder, entries, :next reference)` accepts at
most 7/8 page capacity and already-built overflow.
It prepares a canonical flat probe with groups of 16 and rejects local duplicates,
foreign entries, overflow from another builder/type, and insufficient quota.
It then traverses slots in physical order: keys fitting the arena
are inline; others have external fragments. It plans the exact page
count before any batch append.

External keys are emitted tail to head; the bucket is then
written. Each child has a lower offset than its parent, a nonfuture generation,
and the same Serie/image domain. Bucket control bytes, entry
fields, and arena are packed without holes. Every page goes through both codec
writer and verifier before being lent to the sink.

The synchronous sink receives `(buffer, offset)`, retains no buffer, and
returns exactly `offset + size`. This is trusted code: the return value
alone proves no physical write. File adapter uses
I/O module's exact append, completing partial transfers and
propagating errors without retry.

`costruisci-directory-pagine(builder, bits, shift, children)` accepts exact
fanout of already-built references or NIL. Proofs carry
AND/OR digest summary and child radix frontier. The directory
checks that all digests of each child follow the indicated slot,
including a field crossing both u32s. Child radix range must
be below the parent's; overlapping geometry and incorrect routing
are rejected before I/O. Individually valid pages
are insufficient.

Operations return `riferimento-costruito` only after every
planned append. `identita-riferimento-costruito` returns a private
copy for the reader. Proofs retain neither keys nor child
references; no resident inventory of all built pages.

<a id="errori-risorse-e-autorita"></a>

## Errors, resources, and authority

One I/O actor owns the builder; reentry and foreign threads
are rejected. Incorrect preflight does not write and preserves OPEN. Once a batch
is admitted, error or nonlocal exit makes it FAULTED even if the sink
confirmed no bytes: no retry or ambiguous-offset reuse.
Only cleanup releases BUSY and plan references. Previously completed
pages are neither rewritten nor deleted. Positive completion is not
a durable atomicity point and implies no flush.

Builder memory is O(page-size + capacity). Batch entry
copies belong to the caller and must be counted separately:
at most 448 keys of 65535 bytes per 64 KiB batch. The caller must
bound retained entries and proofs and include transients/GC in
quota. This is maintenance code, with batch-bounded allocations;
it declares neither zero hot-PUT allocations nor a measured RSS limit.
No wait, lock, or shared write between Serie.

Data authority remains in existing segments and decisions. The caller
must supply a logically unique set, including across buckets and
overflow chains: the duplicate check is local to the batch. Proofs
certify origin, completion, and routing, but not completeness
relative to WAL, global uniqueness, or MVCC visibility. [Container and read-only recovery](immagini-indice-paginato.md) now add
completion and verification before serial adoption. External partitioning,
reconstruction beyond RAM, nonreused identities across restarts, and publication
wiring into engine startup/writer remain to be integrated.
An incomplete image is not declared usable by the engine.
Rolling back this increment removes the derivative generator without migrating
user data; no file is deleted without I/O-module proofs.

<a id="verifica-c1"></a>

## C1 verification

In-memory fixtures for three sizes with codec verification and complete reading;
maximum keys, mixed inline/external, overflow, full bucket with H2/group
collisions, multilevel directory, and field crossing u32. Native test:
append to temporary, explicit flush, close, and read-only reopen with one
cache frame. Pre-effect errors: local duplicates, capacity,
page/file quota, identity exhaustion without wrap, child domain/owner/type/routing,
geometry, preflight callback. Interruptions at three boundaries of a
5000-byte key and bucket: no proof returned and FAULTED. Short
write, I/O error, and nonlocal exit checked separately.

| Compound decision | Conditions/cases |
|---|---|
| Configuration | size, sink, preflight, integer quota 1..65536; individual domain rejections |
| Entry | length 1..65535, zero END, key metadata, length word; valid/incorrect candidate and zero CSN |
| Child proof | exact owner, preceding offset, required or any type; foreign/wrong type rejected |
| Duplicate | equal high and low, equal bytes; different digests, H2 collisions, repeated key |
| Quota | positive number, remaining quota, representable ending offset; bucket, external key, exhaustion, and frontier without wrap |
| Directory | bits within size limit, shift and sum <=64, exact fanout; incorrect geometry and valid multilevel |
| Routing | AND and OR field equals slot, bit order; child in wrong branch, overlapping field, field crossing u32 |
| Batch boundary | effects admitted and incomplete => FAULTED; failed preflight OPEN, failed sink FAULTED, valid completion OPEN |

Two readings by the same author: contracts/formats/quota first; ownership,
child/parent order, error propagation, proof lifetime, and authority
limits second. Neither independent review, full MC/DC,
beyond-RAM qualification, nor complete-engine qualification.
