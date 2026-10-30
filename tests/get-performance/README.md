<a id="contratto-get-per-il-benchmark"></a>

# GET contract for benchmarking

Standalone suite of **19 tests**, package `arcdocdb.get.performance.tests`, registry
`*get-performance-tests*`, entry point `run`. ASDF module `get-performance` loads
`support`, `paths`, `guards`, `threads` in order. Suite depends neither on `tests/get`
nor its fixtures.

Sources delivered **without compilation or execution**. Parent runner freezes sources
and records every test. Cases/assertions described here are prepared coverage,
not already obtained results or MC/DC coverage. No zero-heap, latency, or throughput claim.

<a id="fixture-e-oracoli"></a>

## Fixtures and oracles

- Binary 16-byte key, deterministic 16-, 256-, 4096-byte values.
- Segment header and PUT v1/v2 encoded with little-endian and bitwise CRC32C independent
  of product writers/CRC. Values are opaque storage payloads; suite does not qualify CBOR codec.
- Native read-only segment, ID 17, PUT at offset 64, frontier `104 + V`.
  Eleven bytes physically present beyond frontier: file length does not prove committed prefix.
- Real index with seed `12345678:9abcdef0`, CSN 7 or `ffffffffffffffff`;
  expected candidate payload built independently of lookup.
- Optional cache with class 8192 and one eight-slot set; real EBR/snapshots.
  Snapshot at time 10, GET at 11, finish at 12, deadline at 30.
- Every driver GET checks candidate status, five words, source/cache/insertion,
  verified/copied status, copy end, every response byte, sentinels, result/length,
  and zero pins. No last-iteration-only or accumulated-checksum-only verification.
- I/O observer intercepts pread attempts but delegates to native POSIX backend.
  Normal file cases require one full PUT read; cache hit and current miss require
  zero reads after header setup.

<a id="casi-e-selezione-dei-mutanti"></a>

## Cases and mutant selection

| Test function name | Main contract/oracle |
|---|---|
| `test-REQ-AFF-002-performance-file-v1-value16` | v1, file, CSN 7, value 16, three verified operations |
| `test-REQ-AFF-002-performance-file-v1-value256` | v1, file, value 256 |
| `test-REQ-AFF-002-performance-file-v1-value4096` | v1, file, value 4096 |
| `test-REQ-AFF-002-performance-file-v2-value16` | v2, file, value 16 |
| `test-REQ-AFF-002-performance-file-v2-value256` | v2, file, value 256 |
| `test-REQ-AFF-002-performance-file-v2-value4096` | v2, file, value 4096 |
| `test-REQ-CCH-002-performance-cache-hit-v1` | three sizes, hit through probe and leggi-record, zero pread |
| `test-REQ-CCH-002-performance-cache-hit-v2` | as above for v2 |
| `test-REQ-IDX-001-performance-absent` | current miss v1/v2, cache present/absent, response intact, zero pins |
| `test-REQ-MVC-005-performance-snapshot-boxed-late` | snapshot limit 7/max-u64, visible hit; numeric snapshot API consulted after GET |
| `test-REQ-MVC-004-performance-snapshot-final-authorization` | future and miss require history; deadline after copy does not authorize response |
| `test-REQ-AFF-002-performance-output-copy` | **copy mutant**: all bytes, output offsets 0/3/8, three sizes, sentinels |
| `test-REQ-AFF-002-performance-prefix-boundary` | **frontier mutant**: exact end allowed; end minus one byte rejected even with warm cache, zero I/O |
| `test-REQ-AFF-002-performance-max-u64-verification` | **CSN mutant**: positive max-u64; mismatches in bits 0 and 63 with valid CRCs rejected |
| `test-REQ-CCH-004-performance-cache-crc-fallback` | **cache CRC/fallback mutant**: altered cache-value bit, verify-failed, real pread, intact response |
| `test-REQ-AFF-002-performance-persistent-crc-guard` | **persistent CRC mutant**: corrupt header/body, two rejected GETs, response intact, zero pins |
| `test-REQ-CMP-007-performance-cleanup` | **cleanup mutant**: error/throw in candidate/verified/copied, no authorization, zero pins, healthy reuse |
| `test-REQ-CCH-004-performance-cache-repair-hit` | regression: new copy reachable after fallback even with old rejected/disabled slot |
| `test-REQ-CON-004-performance-shared-readers4` | four readers, 28 distinct buffers, file/cache, v1/v2, 16 verified GETs per worker, zero pins after all joins |

Six bold names identify recommended runner tests for 4–6 mutants.
Ability to kill a particular mutant must be recorded by runner; no claim without execution.

Parallel test synchronizes only start before EBR. Introduces no waits under pin
and claims neither particular syscall overlap nor verification of all internal
concurrency windows. Observer lock belongs only to fixture; disabled in parallel case.

<a id="api-riusabile-facoltativa"></a>

## Optional reusable API

`make-get-performance-fixture` accepts keywords:

- `:version` 1/2; `:value-bytes` 16/256/4096; `:csn` (default 7).
- `:cache-p` Boolean; `:workers` 1..4; `:record-bytes` (default `40 + V`).
- `:snapshot-p`; `:snapshot-csn` (default candidate CSN).
- `:observe-io-p` (default T). Use NIL for measurements: no observer events or lock
  on timed path.
- `:record-csn` and `:image-mutator` are setup FIs for negative tests.

`close-get-performance-fixture` is idempotent and requires all readers already joined.
`with-get-performance-fixture` installs that cleanup.

Exported `get-performance-fixture-{key,missing-key,value,view,
segment,valid-bytes,contexts,outputs,epochs,snapshot,generation,cache,version,csn}`
accessors expose setup resources. Each worker uses only `contexts[i]` and `outputs[i]`;
controller observes contexts/announcements after join. Key, expected value, and view
remain stable. Creation starts no thread and implicitly warms no cache.

`performance-checked-get` is a correctness driver allocating oracles/assertions;
**not the timed body**. Keywords `:worker` (default 0), `:path`
(`:file`, `:cache-hit`, `:cache-record`, `:absent`), `:expected-cache`,
`:expected-insertion`, `:finish-now` (default 12). For first GET with empty cache,
pass `:expected-cache :miss :expected-insertion :inserted`.
For warm GET, use `:cache-hit` or `:cache-record`.

`performance-read-events` returns a copy of `(offset count)` events;
`performance-clear-read-events` clears them with no readers in flight.
Initial counters exclude header read. These APIs are unnecessary for a benchmark
already owning independent fixtures.

<a id="limiti"></a>

## Limits

Suite focuses on benchmark operations; prepared/OUTCOME, historical resolver,
full alias/owner/order matrix, and controller fault injection belong to separate
functional suite. ‘Boxed late’ checks semantics and final numeric-API consultation:
it does not prove where SBCL allocates bignums. Correctness driver materializes
candidate too and must not serve as GET-kernel allocation evidence.

<a id="riparazione-e-concorrenza"></a>

## Repair and concurrency

Previous finding about rejected tag hiding reinserted copy is already fixed:
`cerca-record-cache` skips rejected/disabled slots before tag comparison.
`test-REQ-CCH-004-performance-cache-repair-hit` requires HIT after fallback
and also verifies old disabled slot.

Concurrent reads in this fixture start from an already populated cache.
The [cache suite](../cache/README.md) adds contention, concurrent insertion,
and replacement; scopes remain separate.
