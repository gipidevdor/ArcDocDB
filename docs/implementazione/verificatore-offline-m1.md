# Offline canonical verification for M1

Implements the first executable part of [ADR-0033 §7](../adr/0033-fail-stop-e-integrita-end-to-end.md#7-verificatore-offline-arcdocdb-verify)
and REQ-AFF-010. The full Archivio verifier remains open: this profile covers the
single-Serie M1 canonical files, with explicit caller-supplied Archivio/Serie UUIDs.

## Contract

`arcdocdb.verify:verifica-storage-m1` opens only read-only capabilities and acquires
the same nonblocking directory lock as the engine. Verification fails while a
cooperating engine owns the directory. Keep the namespace and identity buffers
stable; asynchronous cancellation is outside the capability-acquisition contract.

The existing readers validate CONTROL, `multiserie.log`, inventory, every live
ACTIVE/CLOSED header and authoritative prefix, CRCs, transaction restrictions,
and the complete Serie maximum CSN. A separate traversal checks positive, strictly
increasing ordinary M1 CSNs, including after rotation and compaction. No complete
document index is allocated. One bounded scratch buffer is reused between files;
the extra traversal deliberately rechecks bytes rather than treating CRC metadata
as a substitute for reading.

Verification does not call engine startup/recovery, reserve a new ACTIVE, assign a
CSN, rename, truncate, unlink, append, flush or repair. An exact segment budget
can therefore be inspected without reserving recovery headroom. Results are
returned only after cleanup succeeds; the directory is closed last. Failures
preserve original condition, stage, file, inventory actions and cleanup errors.
The canonical Serie reader's optional `:before-source` diagnostic observer reports
the source ID/state/form before decoding. Its default is NIL; existing engine
callers retain their behavior, and no file capability or buffer is exposed.

The schema-1 result uses `:profile :m1-canonical`:

| Status | Meaning | CLI exit |
|---|---|---:|
| `:clean` | Covered canonical files verified, no observed suffix, pending inventory action or unverified file | 0 |
| `:attention` | Canonical prefixes verified, but tails, pending names/removal or unverified files remain | 2 |
| `:failed` | A blocking verification, configuration, budget, lock or cleanup error | 1 |

Unsealed ACTIVE/log tails and bytes beyond a CLOSED prefix remain intact and are
reported separately from committed data. A later durable SEAL proving corruption
causes failure. Unknown final segments, missing sources and physical aliases
reject the inventory. Orphan temporaries are reported without deletion. Other
files, including index derivatives and unpublished CONTROL, prevent `:clean`;
their contents are not claimed verified.

This profile does not certify a catalog, hints, derived indexes, full multiseries
transactions, application CBOR/schema, snapshots, physical durability or backup
correctness. It provides a read-only canonical-data prerequisite for later backup
and complete verifier integration. REQ-AFF-010 is not promoted to globally verified.

## Use

Run with the engine stopped:

```sh
sbcl --noinform --no-userinit --no-sysinit --script tools/arcdocdb-verify.lisp \
  DATA ARCHIVE32 SERIES32
```

Optional single-occurrence flags: `--max-file-bytes`, `--max-segments`,
`--max-records`. Defaults are 16 MiB, 64 and 65,536; accepted configuration is
4 KiB–256 MiB per file, 1–65,536 segments and 1–65,536 records per segment.
Existing CONTROL/inventory/name budgets also apply. These are inspection budgets,
not revised on-disk limits. Numeric arguments are bounded unsigned ASCII decimal;
UUIDs are exactly 32 ASCII hexadecimal digits. No external input uses the Lisp reader.

The Lisp API accepts the same budgets and an injectable `:backend` for the existing
I/O interface. A `verification-error` retains `verification-primary`,
`verification-stage`, `verification-file`, `verification-actions`, and
`verification-cleanup`. Configuration errors precede resource acquisition.

## Registered verification method

Registered before execution, on base `17621d4` in an isolated worktree:

- v1/v2 stores, repeated inspection, exact namespace/byte comparison, lock release
  and unchanged next CSN; exact segment capacity without startup effects;
- real live rotation and full-prefix compaction before verification;
- incomplete ACTIVE, CONTROL, decision and CLOSED suffixes, without truncation;
- missing/unknown final files, orphan temporaries and unverified derivatives;
- corrupted headers and committed bodies, including later durable witness;
- individually valid frames and CRCs with duplicate ordinary CSNs;
- mixed log and empty-ACTIVE format versions, without silently accepting them;
- injected lock/cleanup failure preserving both exact conditions, without native
  fallback or repeated close;
- actual CLI processes, invalid arguments, parser self-test and exit codes 0/1/2;
- inspection before recovery after two real SIGKILLs, v1/v2, with and without an
  incomplete 13-byte tail; independent existing engine value/tombstone oracles;
- warning-as-error compilation, lint, traceability, links, evidence and complete
  repository checks after focused failures are corrected.

Commands run through `tools/record-command.lisp`; the focused driver is
`spikes/verify-m1-check.lisp`, included in before/after source snapshots. Failures
and follow-ups remain distinct. Results cover the executed platform and fixtures;
no full C1/MC/DC, weak-memory, power-loss, performance or release qualification is
inferred. No engine write/group-commit path is changed by this increment.

## Static review and decision map

Two readings by the same reviewer cover resource lifetime and validation order,
then report semantics and integration. This is not independent reviewer approval.
REQ-AFF-010/004/008/011, REQ-REC-004 and the existing canonical invariants apply.
The verifier is a cold, exclusive inspection path: bounded lists/scratch allocation
is intentional, and no allocation or throughput claim is made for engine requests.
The optional observer defaults to NIL and neither publishes data nor changes
canonical decoding. No durable operation or new inter-Serie shared state is added.

| Decision | Checked outcomes / focused test suffix |
|---|---|
| UUID lengths and byte/segment/record budgets | Valid defaults/exact capacity; invalid fields and exhausted segment capacity: `config-and-resource-refusals`, `exact-segment-budget-without-recovery-headroom` |
| M1 decisions and identical format | Empty v1/v2 accepted; wrong identity rejected; mixed decision/empty-ACTIVE version rejected: `config-and-resource-refusals`, `mixed-format-empty-active-and-decisions` |
| Required inventory ready with no anomalies | Valid inventory; missing source; unknown final; orphan temporary reported only: `missing-source-and-unknown-final-preserved`, canonical suffix/extra-file cases |
| Ordinary record frame, version, ID and increasing CSN | Real PUT/delete/compaction and canonical frame validation; independently encoded duplicate CSN rejected: `valid-crcs-do-not-hide-duplicate-csn` |
| Complete traversal/count and maximum | Empty stores, rotated stores, compacted terminal tombstone, both versions and post-crash sources; token/cardinality contradictions are internal invariant guards |
| Clean requires no suffix, no actions and no extras | Clean store, individual suffixes, orphan temporary, unpublished CONTROL and derivative file; CLI confirms exits 0/2/1 |
| Primary error or cleanup failure blocks report | Normal cleanup, active lock, exact injected primary plus cleanup failure, foreign exit: cleanup/observer fixtures |
| Optional observer returns NIL | Default NIL, valid observer, non-NIL return and exact propagated condition: `source-observer-contract` |

This table maps executable boundaries and defensive guards. It does not claim
complete C1 decision coverage, integrated multiseries verification or MC/DC.
