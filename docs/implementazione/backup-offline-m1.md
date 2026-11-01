# Offline M1 backup and verified restore

Scoped implementation of REQ-AFF-014, ADR-0030 and ADR-0033 §7. This is a stopped,
single-Serie M1 operation; complete Archivio/catalog, online/incremental backup,
historical snapshots and multiseries transactions remain separate requirements.

## Operator commands and Lisp API

Stop the source engine and keep the backup directory immutable. Substitute the
two real 32-digit hexadecimal UUIDs for `ARCHIVE32` and `SERIES32`. Both output
parents must already exist, outside the source tree; output and output.tmp must
be absent, including files, empty directories and symlinks.

```sh
sbcl --noinform --no-userinit --no-sysinit --script tools/arcdocdb-backup.lisp create /data/serie/ /copies/run-01/ ARCHIVE32 SERIES32
sbcl --noinform --no-userinit --no-sysinit --script tools/arcdocdb-backup.lisp verify /copies/run-01/ ARCHIVE32 SERIES32
sbcl --noinform --no-userinit --no-sysinit --script tools/arcdocdb-backup.lisp compare /data/serie/ /copies/run-01/ ARCHIVE32 SERIES32
sbcl --noinform --no-userinit --no-sysinit --script tools/arcdocdb-backup.lisp restore /copies/run-01/ /data/restored/ ARCHIVE32 SERIES32
```

Exit 0 means a completed operation (or identical comparison), 2 a valid but
different comparison, 1 a rejected/failed operation. A single schema-1 Lisp
plist is printed to stdout; loader diagnostics stay on stderr. `--help` and
`--self-test` do not open a database. There is no external Lisp-reader input.

Library equivalents in `arcdocdb.backup`: `crea-backup-m1`, `verifica-backup-m1`,
`confronta-backup-m1`, `ripristina-backup-m1`. The source and UUID arguments match
the CLI, with destination for create/restore and backup for compare. Accepted
budgets/defaults: `:max-file-bytes` 256 MiB (4 KiB..256 MiB), `:max-segments` 64
(1..65,536), `:max-records` 65,536 per segment, `:max-total-bytes` 16 GiB (positive
fixnum), `:buffer-bytes` 1 MiB (4 KiB..8 MiB). These are offline inspection/copy
budgets, not changes to database limits. Two transfer buffers, canonical reader
scratch/metadata and a bounded manifest are used; no complete document index.

Exact comparison uses Common Lisp `EQUALP` for complete typed octet buffers and
the scalar loop for a final partial prefix, so stale scratch bytes are excluded.
The [comparison campaign](../../spikes/results/2026-11-01-backup-comparison/README.md)
records the local gain and the rejected, slower `MISMATCH` variant. It measures
this comparison with cached file reads, separately from complete backup throughput.

Library-only `:backend` and trusted `:observer` inject I/O and phase observation.
Observer receives phase and a private copy of the optional filename, returns NIL,
and may inject an error or foreign exit. `backup-error` retains original primary,
cleanup conditions, phase/file, publication state NIL/T/:UNKNOWN and whether the
parent flush returned successfully. Canonical source cleanup retains the existing
recovery aggregate (first close cause plus total count). No successful report is
returned after any cleanup error.

Comparison means exact canonical file inventory, version, counts, CSN and bytes;
optional derivatives are ignored. It is not logical equivalence between different
compactions. A complete backup containing an already observed uncommitted suffix
is valid: `:canonical-status :attention`, `:noncanonical-bytes` and pending source
actions report it. A later change to any suffix fails the stored file checksum.
Restore preserves it for ordinary nondestructive recovery. Runtime configuration
and catalogs are outside this profile; reopen with matching UUIDs/data version and
appropriate existing engine resource configuration.

## Contract registered before implementation tests

The source is opened read-only and held under the engine's nonblocking directory
lock for verification, copying and comparison. Canonical CONTROL, decisions and
live segment files are copied byte for byte, including observed noncommitted
suffixes. Derivative indexes, orphan files and obsolete files are not copied;
omissions and canonical attention are reported. No recovery, new ACTIVE or CSN
is produced on the source. Existing canonical decoders remain authoritative.

Backup is a directory with those canonical files and `backup.manifest`. The
manifest records UUIDs, data version, record count, maximum CSN, exact filenames,
byte lengths, authoritative prefixes and CRC32C of every copied file. CRC32C is
an accidental-corruption check, not authentication against malicious changes.
Restore rejects missing/extra files, wrong identity, malformed manifest, checksum
or canonical inconsistencies. The manifest itself has fixed-size bounded binary
encoding, lengths and CRCs, never a Lisp reader on external input.
During restore the copy pass compares its CRC again against the stored expected
value; it never replaces that expectation with a newly computed checksum. This
also rejects damage injected after the initial backup verification gate.

Both backup and restore create exactly `DEST.tmp` with exclusive creation and
0700 requested permissions, inside an existing caller-controlled parent. Files
are new 0600 append-only temporaries, flushed and verified before exclusive
publication. After complete content verification and directory fsync, exclusive
directory rename publishes DEST without replacing any existing entry; parent
fsync completes durability. The rename is the publication point, parent fsync
the durable-success point. A failure or crash leaves the stage or an uncertain
published result intact; there is no retry, rollback, automatic deletion or
overwrite. A lost return requires inspecting names, not repeating into them.

Restore writes only the canonical files into its stage; the resulting final
directory is a normal M1 store. Verification occurs before publication. A backup
directory is immutable by contract and is not a database to open for writes.
The compare operation verifies both sides and compares canonical file bytes,
version, record count and CSN, without materializing a complete primary index.

Namespaces, identity buffers and existing ancestor directories are trusted and
stable; no asynchronous cancellation during capability acquisition. Destination
parents must lie outside source/backup trees. Direct physical alias and lexical
descendant checks reject ordinary configuration errors; hostile ancestor changes
are outside the existing I/O capability contract. All time/fault observation is
injectable; no new writer, protocol or per-request shared state is introduced.

## Manifest v1

Little endian, header 96 bytes, entries 64 bytes, no trailing bytes. Header:
magic `ARCBKP01` at 0, format u32=1 at 8, header-size u32=96 at 12, Archivio UUID
at 16, Serie UUID at 32, record-count u64 at 48, maximum-CSN u64 at 56, file-count
u32 at 64, data-version u8 at 68, CSN-present u8 at 69, zero bytes 70..71,
body-size u64 at 72, body CRC32C u32 at 80, CRC32C of bytes [0,84) at 84,
zero bytes 88..95. Each entry: name-length u8 at 0, zeros 1..7, length u64 at 8,
file CRC32C u32 at 16, zeros 20..23, valid-prefix u64 at 24, ASCII name in
32..55 with zero padding, zeros 56..63. Names sorted and unique, limited to
CONTROL, decisions and canonical M1 segment names. File count is bounded by
the configured segment count plus two logs; total byte and record budgets apply.

## Registered verification

- Pure manifest known-byte fixtures, exact decoding, identity, CRC, reserved bytes,
  truncation, trailing bytes, names/order/duplicates and every resource budget.
- Native and injected directory creation/open/publication: FD zero, symlinks,
  aliases, existing file/directory targets, errno and cleanup failures, no fallback.
- v1/v2 engine-created stores with overwrites and tombstones; rotation, compaction,
  grouped writes, paged derivatives and incomplete tails; exact source preservation.
- Backup, check, compare and restore through API and actual CLI processes; restored
  GET/tombstone/next-CSN checks using the engine as an independent replay oracle.
- SIGKILL before/after file flush, before directory publication, after publication
  before parent fsync; no incomplete final target or overwrite, restart inspection.
- Corrupt/missing/extra backup files, corrupt manifest including valid CRC but
  invalid semantics, held source lock, exhausted budgets, injected read/write/flush
  and close failures; preserve primary/cleanup and uncertain publication state.
- Warning-as-error build, existing verifier regressions, lint, traceability, links
  and repository checks through the command recorder. Preserve failed attempts.

Commands and their source-eligible drivers are recorded separately; no local
measurement certifies physical power loss, Linux, complete C1/MC/DC, performance
targets or the full REQ-AFF-014. Two static readings and a decision/test map are
recorded before campaign closure. Existing accepted ADRs are unchanged.

## Static readings and decision map

Two readings by the same author cover capability acquisition/closure and durable
publication, then manifest/checksum authority, comparison and API/CLI integration.
No independent review or full C1 decision/MC/DC qualification is claimed. During
the second reading, a targeted reproduction showed restore approving late suffix
damage because the expected CRC was overwritten by the copy pass. Its failed
reproduction is retained separately; the corrected copy pass preserves and checks
the stored CRC. Observer names are private copies, and complex validation/open
steps are split into bounded functions. No request-path allocation is introduced;
the deliberately allocating offline path has explicit scratch/transfer/file limits.

| Compound decision or boundary | Executable coverage |
|---|---|
| UUID/configuration budgets; path shape and tree overlap | `held-lock-budgets-identity-and-overlap-before-effects`, `invalid-configuration-precedes-every-backend-call`; zero backend calls on invalid budgets; dot-normalized overlap |
| Manifest envelope, length, CRC, flags and reserved bytes | Independent literal wire/bitwise CRC fixture; truncation/trailing bytes; valid-CRC damaged header/rows; max-file/total/record/count rejection |
| Canonical row names, order, duplicate identities, required logs | `manifest-segment-alias-order-and-missing-log`; no arbitrary input filename reaches I/O |
| Backend callbacks, FD result/zero/parent alias and directory identity | Native/injected directory cases, missing callback without native fallback, wrong/aliased FD and exact propagated entry failure |
| Inventory/CRC/canonical gates before restore stage | Corrupt, missing, extra and changed suffix files; wrong UUID, exhausted budgets, held source lock; rejected backups create no destination stage |
| Stored expected CRC remains authoritative during restore copy | `restore-checks-stored-CRC-against-corruption-after-verification`, with data damage injected after the initial gate |
| Exact copy reads/EOF and CRC independent of chunk size | Large record across 4/8/16 KiB buffers, whole-file independent bitwise CRC, exact source/copy images, explicit read/write failures |
| Complete-buffer comparison versus final partial prefix | Known equal and single-bit-different native files at byte/word/chunk edges; poisoned unused suffixes; short left/right files both reject |
| Comparison requires both summaries and all bytes | Later legitimate source commit reports DIFFERENT; equal counts/CSN/length with different values also reports DIFFERENT |
| Existing destination/stage and exclusive rename | File, empty directory, symlink, stage and a target created just before publication remain intact |
| Primary or cleanup blocks success; publication state distinguishes outcomes | Exact injected write/read/flush/rename/close causes; recovery cleanup aggregate; parent-flush error retains published T/durable NIL; resources released, no retry |
| Borrowed verifier directory and optional observer | Borrowed FD remains open/locked; default/valid callbacks, private mutable name copies, rejected non-NIL callback; existing verifier suite rerun |
| Crash before/after publication and durable completion | 24 actual SIGKILLs for backup/restore × v1/v2 × six phases, plus two paged-source SIGKILLs; independent restored engine values/tombstones/next CSN |

The source-eligible drivers and all attempts, including fixture/compiler failures,
are retained in the [campaign record](../../spikes/results/2026-11-01-offline-backup-m1/README.md).
