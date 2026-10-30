<a id="spk-03--append-e-flush-a-lotti"></a>

# SPK-03 — Batched append and flush

> **Proposed** — Phase-0 experiment limited to append/flush cost and octet verification.
> This spike is not the production WAL.

<a id="domanda"></a>

## Question

What does `write` followed by flush cost for batches of 1, 32, or 128 records of
2 KiB and 1, 4, or 16 independent files on the same device? What difference is
measured between `fsync` and the primitive required by
[ADR-0017](../../docs/adr/0017-piattaforma-e-io.md) (`F_FULLFSYNC` on macOS,
`fdatasync` on Linux), with one append/flush at a time per file
([ADR-0037](../../docs/adr/0037-lotto-sigillato.md))?

<a id="metodo"></a>

## Method

Code uses only Common Lisp, SBCL, and `sb-posix` contrib, without dependencies.
Package `arcdocdb.spk03`, APIs `(check)` and `(benchmark &key ...)`.
Compilation policy: `safety 3`, no `warning` or `style-warning` allowed.

Each worker owns its file, descriptor, specialized octet buffer, and samples.
Files opened with `O_CREAT | O_EXCL | O_APPEND`, permissions `0600`.
`write` uses `SB-ALIEN`, with buffer pinned for the call duration.
Code completes partial writes, retries only `EINTR`, and rejects errors, zero
returns, and inconsistent advancement. Consecutive interruptions are bounded.
Descriptors close on errors too. Failed flush never falls back or retries.
An absent primitive or one explicitly rejected as unsupported produces
`:unsupported` with reason; other errors fail execution.

Every record contains file number and absolute record number, each 64 bits,
then a pattern depending on both numbers and position. Before common start,
each worker performs one warmup batch with the same primitive on its file;
that batch remains in file and is verified but excluded from samples and
throughput. All case payloads are prepared before warmup. Sink is full verification
after closure. After write-descriptor closure, reopen file read-only: check exact
length, record count, and every octet. Buffer preparation and reread are excluded
from `write`/flush timings; throughput uses workers' actual common interval.
Workers start from one gate, used once per case, then share no counters or locks
per append/flush. Matrix cases run sequentially; only files in the same case work
in parallel. One file's append/flush remain serial under REQ-WAL-002;
REQ-CON-003 and REQ-CON-005 guide independent ownership; REQ-AFF-001 guides explicit errors.

Measurements return a plist with parameters, environment, actual counts, verified
octets, raw per-worker timings, minimum/median/P95/P99/maximum, and throughput.
Percentiles use upper rank (`ceiling(p*n)`); 16 samples do not characterize a P99 tail.
Synchronized-record rate is called durable throughput only for the ADR-0017-required
primitive, within limits below.
`io-wall-seconds` spans first I/O start to last completion;
`workers-wall-seconds` includes thread startup, open, warmup, gate, and close;
`preparation-wall-seconds` and `verification-wall-seconds` are separate;
`case-wall-seconds` also includes reporting and cleanup, and
`matrix-wall-seconds` measures the whole matrix after check.

Directories are created only under Git-ignored `out/data/`, with unique names
from `mkdtemp`. Every created file is registered by its owner; cleanup deletes
only those files and their exact directory, without recursive paths or removal
of preexisting files.

<a id="ambiente-e-primitiva-macos"></a>

## Environment and macOS primitive

Prepared environment: macOS 27.0.1 (26A434), ARM64, Mac16,3, 10 logical CPUs,
16 GiB RAM, SBCL 2.6.9. Result reports information exposed by SBCL.
Record media, filesystem, and load during measurements.
Reference platform remains Linux x86-64 (ADR-0017).

`F_FULLFSYNC = 51` was checked before execution in Apple's SDK header:
`/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/sys/fcntl.h`,
line 260, comment ‘ fsync + ask the drive to flush to the media ’.
The contrib does not export `ENOTSUP` on this SBCL: classification also uses
Darwin value 45 verified in the same SDK, `sys/errno.h`, line 144;
`EOPNOTSUPP` may differ with UNIX03. The symbols are not assumed synonymous on macOS.
Code uses `sb-posix:fcntl` only on Darwin. FFI and pinning follow the
[official SBCL manual](https://www.sbcl.org/manual/#Foreign-Function-Interface).

<a id="comandi"></a>

## Commands

From repository root, quick verification only:

```sh
sbcl --noinform --no-userinit --no-sysinit --script spikes/SPK-03-group-commit/run.lisp --check
```

Runner finds `core.lisp` relative to `*load-truename*`, compiles to
`out/core.fasl`, turns warnings into errors, and emits one readable s-expression
plist. Errors produce explicit status and nonzero exit code.
Numeric options are parsed without the Lisp reader.

Measurements to run **serially with other spikes**:

```sh
sbcl --noinform --no-userinit --no-sysinit --script spikes/SPK-03-group-commit/run.lisp --bench
sbcl --noinform --no-userinit --no-sysinit --script spikes/SPK-03-group-commit/run.lisp --bench --files 1,4,16 --batches 1,32,128 --samples 32 --seconds 15
```

Defaults: `--files 1,4`, `--batches 1,32,128`, `--samples 16`,
`--record-bytes 2048`, `--seconds 15`. `--bench` is default and includes `check`.
`--flush fsync,fullfsync` on macOS or `--flush fsync,fdatasync` on Linux selects
primitives. Explicit buffer/sample memory is bounded; parameters exceeding
256 MiB of explicit memory per case are rejected. No zero-allocation property
is claimed or measured. Time budget is checked between operations and cases:
a stalled syscall is not interrupted and verification/cleanup may exceed budget.
This is an intended work budget, not a real-time guarantee.

<a id="limiti-e-risultato"></a>

## Limits and result

**Checks run on 2026-10-08:** `--check` completed with exit 0 and `:status :ok`,
warning/style-warning-free compilation. Verified short writes and offsets,
`EINTR` and its limit, zero/oversized writes, EIO, failed flush without fallback,
`:unsupported` state, close after write/flush errors, failed exclusive open without
deleting preexisting file, detection of altered length/payload (including file
and record IDs). Real fragmented test verifies 3 records, 6144 bytes;
`F_FULLFSYNC` test verifies another 18432 bytes including a warmup batch.
Absolute command also works from `/tmp`, always with data under this spike.

Only this short matrix diagnostic ran, with one-second budget and two samples
per file, without using default benchmark:

```sh
sbcl --noinform --no-userinit --no-sysinit --script spikes/SPK-03-group-commit/run.lisp --bench --files 4 --batches 1 --samples 2 --seconds 1 --flush fsync,fullfsync
```

Both cases return `:ok`: 8 measured flushes, 4 warmups, and 24576 verified bytes
per case. Result retained locally in Git-ignored `out/diagnostica.lisp`.
Result verification confirmed one readable plist, consistent counts, expected
sample lengths, and consistent wall intervals. `out/data/` is empty afterward.
These few samples verify mechanics, not product targets. Full measurements and
representative percentiles remain pending.
Selecting `fdatasync` on Darwin was checked with one case: `:unsupported`,
reason `:platform`, exit 2. `--samples 0` produces `:error` and exit 1 before I/O.

Reread passes through filesystem/page cache; it does not prove power-loss
persistence. Power cuts, system crashes, recovery, SEAL/CRC format, index,
CSN, rotation, directory synchronization, double writing, batch formation during
flush, and client latency are not modeled. The spike covers the I/O primitive
and its discipline. Measurements do not establish ADR-0028 minima; repeat on
reference platform under controlled load. Bounded-injection checks cover only
exercised branches, not all system errors or interleavings.
Syscall completion alone does not verify media behavior (FM-03).
Flush cost and queuing on the shared device remain architectural limits to measure;
this spike adds no serialization between Serie beyond the individual experiment
case's preparation/start/aggregation. No new architectural defect is demonstrated.
