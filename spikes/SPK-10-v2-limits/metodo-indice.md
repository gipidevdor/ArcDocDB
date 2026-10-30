<a id="spk-10--metodo-del-frammento-primario-v2"></a>

# SPK-10 — v2 primary fragment method

> **Decided (limits and layout → ADR-0048)** — binary `_id` of 1–65,535
> bytes; five-u64-word slots and one control byte; u32 key offset,
> u16 key length, and u32 record length. Sources: ADR-0032, ADR-0043,
> ADR-0050; REQ-LIM-001/003 and REQ-IDX-003/005/007.

> **Proposal** — independent Common Lisp/SBCL experiment, `safety 3`,
> in `indice.lisp`, package `arcdocdb.spk10.indice`. This method is registered
> before compilation and execution. Scope covers the experimental primary
> fragment and its method.

<a id="domanda-e-ambito"></a>

## Question and scope

Does the v2 layout represent arbitrary keys and records containing 16 MiB of
document data without truncation, while bounding probing, attempts, arena,
and maintenance? Does rejected insertion leave root, arrays, metadata,
and counters identical?

> **Proposal** — scalar Swiss fragment, probed in groups of eight,
> `ctrl[C]` and `slots[5*C]`. One owner writer; readers with seqlock and
> root/generation recheck even on miss, at most eight attempts.
> Rebuild and root CAS are implemented. Extendible directory, split,
> retained versions, and actual forwarding to writer after `:retry-limit`
> are pending. Benchmark capacity holds the entire requested load.

<a id="preparazione-e-budget"></a>

## Preparation and budgets

> **Proposal** — arena starts at zero bytes and grows geometrically with
> used bytes, with a configured cap; no `C*65535` reservation.
> Published keys are private copies; updating an entry reuses the existing
> immutable copy. New insertion prepares a private copy before modifying
> the fragment. Rebuild and growth prepare new arrays outside the root.
> All expected rejections precede publication.

Distinct budgets: capacity and 7/8 load, maximum individual key, maximum
arena, key bytes copied per operation (includes staging and final copy,
in addition to existing bytes moved), transient old + new + staging payload,
cooperative preparation time. Rebuild visits at most C source slots;
the directory represented by the root contains one reference.
Generation and seqlock do not wrap; near the threshold, seqlock requires rebuild.

Time uses `get-internal-real-time`, injectable only in the harness: checks
between bounded copy blocks and before publication. This is a cooperative
wall-time budget: allocations, GC, scheduling, and final publication phase
are not interruptible and may exceed it. Counted memory is array and reference
payload, **not RSS**; Lisp headers, runtime, garbage, and roots retained by
readers require additional resources. The single writer serializes index
preparation and publication; no shared state between Serie.

<a id="verifica-corta"></a>

## Short verification

1. Compile only `indice.lisp` into a temporary FASL; every warning or
   style-warning is fatal, as are `compile-file` warnings/failure values.
   Retain `out/indice-check.lisp` (ignored) as a schema 1 plist readable
   with `*read-eval* = nil`: command, environment, source Git blobs,
   compilation status, decoded result, limits, times, stdout/stderr, and failures.
2. `(check)` returns a plist with `:status :ok`, counts, and actual limits.
3. Boundary fixtures 0/1/255/256/65,535/65,536; layout and reserved fields;
   maximum record 16,842,775 bytes, configurable document limit and u32 limit;
   high u64 CSN/location; complete comparison of keys with common prefix
   and equal fingerprint; input mutation after insertion.
4. Arena, copy, and transient saturation; time exhausted through deterministic
   clock. Every rejection compares complete before/after snapshots.
   Churn and rebuild reclaim dead bytes and tombstones. Slot saturation
   produces an explicit rejection.
5. Streaming FNV-1a u64 hash with fixed seed: golden and comparison with
   independent calculation; deterministic workload against `hash-table :test 'equalp`.
   Oracle copies are not used by the index.
6. Deterministic injections: fields changed under seqlock, odd counter,
   hit/miss on retired root, repeated changes up to `:retry-limit`.

<a id="benchmark-nellharness-integrato"></a>

## Benchmark in the integrated harness

> **Proposal** — `(benchmark)` uses keys of 16/256/65,535 bytes and document
> maxima of 10,000/1,000/64; one shared wall-time deadline, default 3 seconds,
> configurable maximum 3 seconds; maximum transient payload 128 MiB.
> Reports actual documents inserted, reads and modifications completed,
> duration, and statistics. Every phase checks the deadline between operations:
> time limit is cooperative. The harness runs measurements serially;
> local verification includes only strict compilation and short check.

## API

> **Proposal** — English keywords match the harness; domain terms in the
> module are Italian. Only one writer calls mutations and `statistiche`;
> the caller keeps the key buffer stable during each call. After insertion,
> it may modify it: the index retains the private copy.

| Function | Contract |
|---|---|
| `make-indice` | Keywords and defaults: `:capacity 16384` (power of two, 8–32768), `:max-key-bytes 65535`, `:max-document-bytes 16777216`, `:max-arena-bytes 8388608`, `:copy-byte-budget 16777216`, `:transient-byte-budget 134217728`, `:maintenance-seconds 1/2`, `:clock #'get-internal-real-time`. Initial arena is empty. |
| `inserisci indice chiave csn segmento offset lunghezza` | `csn` u64; segment, offset, and length u32. Total record length: 24-byte header + key + document, configured document maximum. Returns `t` for new entry, `nil` for update. |
| `elimina indice chiave` | `t` if deleted, `nil` if absent; makes nothing durable. |
| `leggi indice chiave` | Five values: CSN u64, location u64 (`segmento` in high 32 bits), record-len u32, status `:hit/:miss/:retry-limit`, discarded attempt count. On miss/limit, fields are zero. Keyword `:attempts` 1–8; test-only hooks `:after-fragment` and `:after-fields`. No implicit forwarding to writer. |
| `statistiche indice` | Plist with payload, used/capacity/live bytes, counts, maximum costs, and actual budgets; does not count RSS. |
| `check` | Plist `:status :ok`, eight fixture groups, counts, limits, and pending work; signals error if a fixture fails. |
| `benchmark &key (seconds 3)` | Cooperative global deadline, real `seconds` 0–3. Actual counts per workload and phase, including churn delete/reinsert separately; final documents in statistics. Also reports any deadline overrun. |

Expected rejections: `limite-indice`, with `limite-motivo` for arena, copied
bytes, transient memory, time, capacity, key/record length, and generation.
A value outside its declared type signals `type-error`; no truncation.
Preparation clock costs exclude initial validation, hashing, and probing;
these have work bounds from key length and capacity. Comparison is scalar
and hash is not cryptographic: no defense against adversarial collisions
or guaranteed average performance. The fixture measures inline hash kernel
allocations, without claiming absence of allocation in all APIs.
The document limit is checked against numeric record total; this module
neither allocates nor validates a CBOR document and does not duplicate
the codec or offline migration.

<a id="ambiente-e-risultato"></a>

## Environment and result

Environment observed before execution: macOS Darwin ARM64, Apple M4,
SBCL 2.6.9, `internal-time-units-per-second = 1000000`.

Local result: strict compilation without warning/style-warning; `(check)`
returns `:status :ok` for eight groups, 600 differential operations and
664 comparisons with `hash-table equalp`, 64 cycles with 384 insertions
and 384 deletions. Seven budget fixtures compare complete state before/after
rejection. Two keys of 255 and 256 bytes, with a common 255-byte prefix and
equal fingerprint, remain distinct. In the local fixture, the inline hash
kernel allocated zero bytes for 256 traversals of a 256-byte key.
Churn ends with an empty arena; differential testing exercises rebuilds
that also copy live entries.

Artifact `out/indice-check.lisp` retains all local executions, with results,
blobs, and actual times. The first attempt failed because SBCL detected
intentional negative fixture data at compilation; the harness-only dynamic
boundary now exercises those typechecks at runtime. Benchmark was not run locally.

No evidence from this fragment completes the v2 gate, validates concurrency
on both architectures, or confirms a production commit; it implements
neither storage nor offline conversion.
