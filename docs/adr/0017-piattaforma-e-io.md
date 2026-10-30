<a id="adr-0017--piattaforma-di-riferimento-e-primitive-di-io"></a>

# ADR-0017 — Reference platform and I/O primitives

- **Status:** Accepted; **item 5 clarified by [ADR-0045](0045-modello-di-esecuzione.md)**: every blocking call (including log writes) is an I/O pool task; a read that misses the cache migrates by restarting from the beginning.
- **Date:** 2026-10-03
- **Relationship to the specification:** closes QA-19
- **References:** [architecture](../architettura.md#thread-pool), RSK-11, RSK-16

<a id="contesto"></a>

## Context

The specification fixes the hardware but not the operating system; development takes place
on macOS/ARM64; the “Common Lisp only” constraint excludes C libraries for I/O.

<a id="decisione"></a>

## Decision

1. **Reference platform:** Linux x86-64. Benchmarks and exit criteria are measured
   there. macOS/ARM64 is a supported development platform; I/O measurements on macOS are
   indicative.
2. **System calls** through SBCL contribs (`sb-posix`, `sb-unix`) and `sb-alien` into
   the system libc: this is Common Lisp invoking the operating system, not foreign code in
   the project. No external C library.
3. **Durable flush:** `fdatasync` on Linux; `fcntl(F_FULLFSYNC)` on macOS. A single
   `durable-flush` function in the `io` module hides the difference; directories are synchronized
   with `fsync` after file creation/rename.
4. **Reads:** positional `pread` into reused buffers from the cache arena; no
   memory mapping (avoids unpredictable double accounting and page faults in readers).
5. **I/O model:** blocking, executed by an **I/O pool** separate from the compute pool
   ([ADR-0011](0011-thread-pool-dinamico.md)): there may be many more I/O workers than
   cores because they spend their time waiting. Asynchronous I/O (io_uring) is not adopted: under
   the Common Lisp only constraint, it would require a complex interface without the upper end
   of the targets requiring it ([estimates](../valutazione/stime-ordine-di-grandezza.md#letture-puntuali)).
6. **Fault injection:** all writes, reads, and flushes go through the `io` module, which
   tests can replace with an implementation that simulates crashes and partial writes.

Pattern: blocking I/O thread pool with pread/fdatasync (RocksDB, PostgreSQL).

<a id="conseguenze"></a>

## Consequences

- Only one module knows the operating system.
- Correct durability on macOS depends on `F_FULLFSYNC`: tests use it.
- The number of I/O workers is a controller parameter, not a code parameter.

<a id="alternative-considerate"></a>

## Alternatives considered

- *mmap of segments:* reads without copying, but page faults inside read sections (holding
  the epoch), double accounting of memory, and behavior that differs by platform.
- *io_uring:* maximum I/O concurrency; deferred until a measurement calls for it; a
  future ADR could add it inside the `io` module without changing the rest.

<a id="valutazione"></a>

## Evaluation

- Verification: SPK-03 (flush), SPK-05 (concurrent pread, scan GB/s).
- Revisit if: the upper-end “GET NVMe” target cannot be reached with the I/O pool.
