<a id="preparazione-full-text-dai-documenti-cbor"></a>

# Full-text preparation from CBOR documents

`arcdocdb.fulltext.document` connects [CBOR documents](../adr/0014-formato-record-documento-id.md)
to the [analyzer](full-text.md) and [index codec](full-text-codec.md).
It performs preparation in the worker before writer admission under
[ADR-0054](../adr/0054-contratto-e-formato-full-text.md). It produces a sealed run
and the upper bound to reserve for the future file. It assigns neither CSNs nor IDs,
writes no WAL, reserves no Serie delta, and publishes neither commits nor READY.

The first use remains a Usenet NNTP server in Common Lisp: `subject`, `body`,
or `headers.subject` are configurable paths. The application interprets NNTP/MIME
and supplies decoded UTF-8 text; it may preserve the original article in an unindexed
binary field. Message-ID, keys, and original document are not modified.

<a id="configurazione-posseduta"></a>

## Owned configuration

`crea-configurazione-full-text(fields, index-id, generation-id, contract-version)`
receives positive u64 IDs already assigned by the caller. It is not the catalog allocator.
The API's Lisp data format, without reading or evaluating code, is:

```lisp
;; Each text is a UTF-8 u8 simple-array; outer vectors are simple-vectors.
(vector (vector 1 subject-alias (vector headers-key subject-key))
        (vector 7 body-alias    (vector body-key)))
```

Example variables already contain UTF-8 byte arrays.
Allowed: 1…16 fields sorted by positive u16 ID, aliases of 1…64 bytes, and paths
of 1…100 UTF-8 keys, including empty keys. Aliases and paths must be bytewise unique;
field names are not normalized. Every buffer and vector is copied.
The only allowed profile is `unicode-word-18.0.0-v1`.

`:limits` is a simple-vector of five positive u64s in META order:
total text input, bytes per term, total tokens, prepared payload,
work. Defaults: 16 MiB, 1024, 1048576, 64 MiB, 268435456.
Token limit is still within u32. Declared values are retained in full;
the hot path uses effective limits within fixnum. IDs are encoded once
in 24 bytes, without raw u64 slot reads during preparation.

Before copies, the constructor checks memory and the 64 KiB META limit.
It uses conservative bound `256 + 32*campi + 9*chiavi + byte(alias e chiavi)`:
this covers CBOR headers and maximum physical-metadata values still unknown.
A declaration that does not fit is rejected before build or commit.
The cold-memory budget includes copies, vectors, objects, and conservative overhead;
it does not measure RSS or shared Unicode tables.

<a id="scansione-ed-esecuzione"></a>

## Scanning and execution

`crea-preparazione-full-text(config)` preallocates a private context with CBOR scanner,
path masks, Unicode analysis, and run. Defaults: 65536 scalars, 65536 tokens,
4194304 bytes for each of two analysis/run buffers, 64 MiB total memory.
Capacities are configured with `:max-scalars`, `:max-tokens`, `:token-bytes`, `:max-memory`.
A valid document may require more scratch: rejection is for resources.

`inizia-preparazione-full-text(task, input, start, end, row)` borrows
the immutable document, at most 16 MiB long. ROW is the proposed u32 ordinal,
not proof of hint membership or commit. Argument,
state, and alias checks precede invalidating the previous result.

`passo-preparazione-full-text(task, quantum)` returns `:running` or `:done`:

1. Full scan with the existing minimal CBOR kernel, without ASTs or document copies.
   A mask of up to 16 paths accompanies each frame; submaps are not
   reanalyzed separately for every field. Unindexed UTF-8 is checked too.
2. Analysis of present fields in field-id order, using already implemented NFC/folding/NFC
   and Word_Break; copy into the private run. Missing and present-empty remain distinct.
3. Resumable run sorting, distinct-term counting, and final measurement.
   No partial result returned before all checks complete.

The root document must be a map. Paths traverse only maps and
select simple text keys: tags and complex keys are not aliases for
the same text keys. A present non-map ancestor or present non-string
leaf is an error; `null` and arrays are not silently skipped. Duplicate
selected keys, including ancestors, are rejected.

This module verifies minimal structure, UTF-8, and relevant paths. It does not verify
deterministic ordering of all maps, uniqueness of keys outside the paths,
tag semantics, or the general Serie contract: these checks remain
with the document validator. It does not replace record/hint verification or independent
reanalysis of a segment's data.

Quantum is 1…65536 steps. Normalization, copying, sorting, and measurement are resumable.
The CBOR kernel may verify an entire string in one step within the 16 MiB span:
quantum is not a byte limit or real-time guarantee. Work charges nodes,
payload, comparisons, analysis, and run operations; `:max-work` may lower the declaration's
limit. `:max-nodes` bounds CBOR; `:max-file-bytes` the final bound.
The caller checks deadline at boundaries and may cancel the task.

Text input, tokens, and staging are summed over all index fields.
Used prepared payload is `20*token + byte(termini ripetuti) + 12*campi presenti`:
this limit is distinct from the worker's preallocated physical memory, accounted for by the
constructor. Reaching all configured maximums together is not promised.

<a id="risultato-riserva-e-ownership"></a>

## Result, reservation, and ownership

`risultati-preparazione-full-text(task)` requires DONE and returns five values:
SEALED run, `U(documento)`, file bound for that document alone, used prepared
payload, and input text bytes. The run is borrowed until the next start:
before reusing the task, the owner must finish using it or copy data
into writer-owned reservations. Configuration remains immutable and shareable.

The bound uses the [normative formula](../formato-indice-full-text.md#limite-superiore-e-rotazione):

```
U = 16*present-fields + sum_distinct(32 + term-bytes + 16) + 4*token
file <= limite-fisso-indice-full-text(config) + sum_documents U
```

Fixed cost includes header/directory, declaration META bound,
35 padding bytes, and footer; it is reserved once per segment. Physical committed
versions count even if historical. Measurement does not subtract space based on
query visibility. An insufficient file budget prevents DONE.

`annulla-preparazione-full-text` is idempotent on active/canceled tasks and releases
input and analysis. Domain errors propagated by `passo` make the task FAILED;
partial runs are inaccessible. A new start may reuse scratch. Internal
errors require fail-stop at the worker boundary; they do not become commit retries.
`stato-preparazione-full-text` exposes only IDLE/RUNNING/DONE/FAILED/CANCELLED.

[Writer reservations](full-text-riserve.md) may now borrow the DONE
run during owned copying. The task stays DONE but a new start rejects with
`:fulltext-document-borrowed` until copying finishes or the reservation is canceled.
The caller-borrowed result does not authorize bypassing this ownership.

<a id="verifica-e-limiti"></a>

## Verification and limits

The 17 document tests add to the previous 39. A 25-byte CBOR fixture
and manual expected values fix the two NNTP fields: U=145, staging=73, text=9 bytes.
Checks cover 32 prefixes, 25 truncations, wrong types, duplicate paths,
cumulative budgets, and file rejection at bound minus one. Cancellation in seven phases,
reuse, 100 levels, 16 fields with IDs through 65535, and maximum u64 IDs/generations.

On 128 generated documents, scanning independently built word lists
compares 115200 answers on runs and files, and checks 128 bounds against serialized files.
Four workers have separate contexts and a bounded rendezvous. After warmup,
1000 preparations with lookup allocate no bytes on measured heap on SBCL 2.6.9 arm64,
even with maximum u64 IDs/limits. Two new semantic mutants concern key
selection and cost deduplication; instrumented coverage excludes allocation measurements.

The [decision review](full-text-documenti-decisioni.md) makes scope explicit.
The [original records and attempts](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-16-fulltext-document-dev-targeted/README.md)
preserve sources, commands, results, and limits.
Local reservation and owned copies in writer reservations are available.
The [PUT/WAL bridge](full-text-put.md) owns the same bytes for analysis and append.
Remaining work includes the complete gate, transfer into the published delta view,
publication before H/ACK, generation catalog,
durable I/O, MVCC, and Query Engine. Overall requirements remain designed;
this preparation does not make the database ready for NNTP traffic.
