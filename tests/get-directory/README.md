<a id="test-della-directory-get-closed"></a>

# GET CLOSED directory tests

Package `arcdocdb.get.directory.tests`, entry `run`, registry `*get-directory-tests*`.
Source order: `support`, `construction`, `read`, `threads`. ASDF integration,
compilation, and all executions are the parent's responsibility after freeze.
This delivery loaded no Lisp sources and ran no tests, benchmarks, mutants, or checks.
Cases described are prepared code, without execution outcomes.

<a id="contratto-condiviso-della-fixture"></a>

## Shared fixture contract

`support.lisp` contains only package, condition, fixture, and encoding definitions;
no `deftest`, case registrations, runner calls, or automatic setup.
Benchmark may load it after `arcdocdb/tests`, outside measured windows.

```lisp
(make-directory-fixture :count 1 :value-bytes 16 :workers 4 :version 2
                        :csn #xffffffffffffffff :cache-p t)
(close-directory-fixture fixture)
```

Public signature/accessors defined in `support.lisp`. Read `view`, `directory`,
`maps`, `keys`, `values`, `contexts`, `outputs`, `epochs`, `index`, `files`, `paths`,
`ids`, `ends`, `images`, `manifest`, `scope`, `cache`, `snapshots`, `snapshot`, and
`generation` with prefix `directory-fixture-`.

- `keys` and `values`: simple-vectors of N elements; each key is a simple 16-byte u8 array.
- `maps`: simple-vector of N native maps built through public resolver API.
- `contexts`: simple-vector of `workers` contexts, 1 to 4; exclusive scratch.
- `outputs`: **always** simple-vector of four distinct u8 arrays of `value-bytes+6`,
  initialized to `#xcc`; copy from offset 3, three sentinels each side.
- Increasing noncontiguous IDs: `17+2*i`, last ID `#xffffffff`, including N=1.
- Primary with fixed seed `#x12345678/#x9abcdef0`; digest/publication through public APIs.
  Key arena `16*(N+4)` bytes: four extra FI requests without profile changes.
- Cache: one class, minimum 1024, first power of two containing `40+value-bytes`,
  **256 sets and eight slots per set**, one stripe. Authorized payload
  `256*8*(class-size+29)+256+16`: 2,156,816 bytes for class 1024.
  Routing uses u32 segment and 64-bit offset; cache64 compares independent oracle,
  verifies occupancy at most eight, warms all 64 keys, requires HIT on every read.
- Snapshot created but unregistered; `directory-register-snapshot` registers at time
  10, entry at 11, ordinary finish at 12, deadline 30.

Fixture supports count 0..32768; benchmark profiles use only N<=64. Fixture limit
comes from single primary with maximum capacity 65536 and load at most half.
Native resources depend on process FD limit: geometric 65536 case does not need
that many FDs. Each call acquires a namespace via exclusive mkdir with at most
1000 attempts; cleans only its own files. Close in `unwind-protect`, **after all joins**.
Closure is idempotent and does not implicitly terminate workers.

Extra setup/FI keywords: `prepared-p`, `record-csn`, `record-bytes`, `observe-io-p`,
and `image-mutator(image, ordinal)`. I/O observation disabled by default, letting
benchmark use native backend without event list or extra mutex.
With observation enabled, `directory-read-events` returns `(id offset count)` triples;
setup/header reads excluded from operation counters. `directory-checked-read` is
an allocating correctness driver, not a timed benchmark body.

<a id="file-e-oracoli-indipendenti"></a>

## Files and independent oracles

Every native map originates from a file actually written, synchronized, closed,
and reopened read-only. `ARCDSEG1` header, PUT, complete EDIT, and SEAL encoded
byte by byte; bitwise CRC32C independent of product primitives.
Manifest rebuilt through public API over valid EDIT+SEAL and holds authoritative
CLOSED frontiers. Manifest format's required u64 ACTIVE differs from CLOSED and
remains outside directory: no ACTIVE capability constructed or exercised.

Ordinary origin is compaction, PUT without PREPARED. Writer-prepared case produces
PUT with TXID, OUTCOME with same TXID/CSN, and batch SEAL: no extra EDIT outcome.
Resolver validates prefix and derives proof offset; prepared cache reads must also
reread OUTCOME from same FD. Eleven invalid bytes beyond CLOSED frontier distinguish
authoritative prefix from EOF. Resolver buffer covers only END; `max-batch-bytes`
is at least 56 and within `max-bytes`; header read uses exactly 64 bytes.

<a id="casi-predisposti-e-limiti"></a>

## Prepared cases and limits

| Source | Cases and method |
| --- | --- |
| construction | Empty; 12*N payload; exact/one-short budget; maximum 65536 and rejected 65537; input-array copy; simple-vector shape; duplicates/order; canonical EQ owner; zero/highbits ID; closed or append FD. |
| read | V1/v2 files and 16/256/4096 values; maximum ID; enum and five core values; cache64 without eviction; corrupt cache with VERIFY-FAILED and native reread; prepared+OUTCOME+SEAL; published candidate without segment => FAULTED, never ABSENT; low/high CSN, size, reserved word; mismatched file key; FI shape of lengths, maximum, and private NIL entry across all four inputs, zero I/O and pins; expired FD; reentrancy/order; throw during pread; final snapshot; true primary absence; small buffer and restart on new worker. |
| threads | Four readers sharing view/directory/FD, 28 distinct buffers, complete response and sentinels, zero pins after all joins; file/cache v1/v2; gate/join timeouts, conditions transported to controller. |

Every test has `REQ` in name. Product conditions checked by type/reason;
fixture timeouts use dedicated conditions. Every loop has explicit cardinality
or budget; gate waits precede EBR. Tests observe product cleanup before invoking
external safety cleanup.

**65536 case is synthetic geometry and selection only.** FI capabilities share
fixture's one real FD: they do not certify CLOSED for 65,536 files.
First element requires 17 binary-search steps over 2^16 elements; case selects
first/last and invokes no resolver, cache, or read on synthetic maps.
Shape, capacity, and scratch FIs are serial/local; they do not modify product sources.
Controller publication/reclaim, performance, zero heap, ACTIVE, and real pool
transfers remain outside this suite. Restart on second worker retains only request
and repeats lookup/directory acquisition under a new epoch.
