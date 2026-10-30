<a id="conservazione-compatta-delle-prove"></a>

# Compact evidence retention

<a id="metodo-registrato-prima-dellesecuzione--2026-10-09"></a>

## Method registered before execution — 2026-10-09

The campaign reduces record storage without changing original bytes.
It does not measure database performance. It does not rewrite Git history.

1. Selects `.lisp` files larger than 1 MiB in `spikes/results/`.
2. Runs `gzip -n -9 -c` without a shell, with four independent workers.
   Original name and timestamp do not enter the gzip header.
3. Retains a schema 1 descriptor of type `:compressed-evidence` at the same
   path, with the `.lisp.gz` payload beside it.
4. Records sizes and SHA-256 of compressed and original bytes. Reconstructs
   content with a 128 MiB limit, verifies hashes, rechecks that the original
   has not changed, and publishes the descriptor by rename in the same
   directory. On error, preserves the original and removes only temporary
   files created by the attempt.
5. Verifies that every catalog reference still returns only one plist,
   read with `*read-eval* nil`. Checks links, structure, integrity, and sizes.
   Retains every failed attempt as well.

The original must be immutable during compaction. The lock coordinates
only compactors; it does not block other programs writing the record.
Rename publication promises no persistence after power loss. The expansion
limit bounds bytes, not Lisp reader cost. A malformed file is rejected.
Records are repository data, not an import format for arbitrary input.

<a id="controlli-preregistrati"></a>

## Preregistered controls

Controls include plain/gzip data equivalence, UTF-8 bytes, wrong hashes
and sizes, missing payload, truncated archives, over-budget expansion,
paths outside the directory, reader evaluation, multiple forms, and nested
descriptors. The reader verifies payload before interpreting its data.
It removes temporary files even when the callback fails.

`make evidence` rejects any published non-gzip file over 1 MiB and any
gzip payload over 8 MiB, including uncataloged ones. The catalog keeps
previous paths, so links remain valid. A descriptor is not a test result:
it must be resolved with the reader.

<a id="comandi-e-consultazione"></a>

## Commands and access

```sh
make compact-evidence
make evidence-selftest evidence links
sbcl --script tools/read-evidence.lisp spikes/results/2026-10-08-lettura/spikes-verifica.lisp
```

The reader requires SBCL, `gzip`, and `shasum`. To obtain original bytes
without interpreting them, decompress the payload with `gzip -dc`, then
verify the size and SHA-256 declared in the descriptor. Function
`arcdocdb.evidence:call-with-evidence-bytes` automates these checks.

`record-command.lisp` and `run-spikes.lisp` automatically compact their own
directory at run end, after the last write and outside measured windows.
Record `conservazione.lisp` retains compactor argv, outcome, and stdout/stderr.
On error, verification ends negatively and retains diagnostics and originals;
it does not lose the command result.

Already completed local results may also be compacted. First verify that no
process is writing selected files; the age filter alone does not prove a
campaign has ended. The compactor also excludes standard run directories
whose PID still exists. Only the owning recorder can declare its own directory
finished before terminating; the exception checks the parent process PID.

```sh
sbcl --script tools/record-command.lisp -- sbcl --script tools/compact-evidence.lisp --root spikes/out/ --jobs 4 --minimum-age-seconds 3600
```

Local compaction retains bytes even when a historical report contains
symbols from unloaded packages. Later interpretation of those symbols
requires the same context as the previous report; no package is automatically
loaded by the evidence reader.

<a id="dimensioni-e-cronologia"></a>

## Sizes and history

The report records file count, original bytes, retained bytes including
descriptor, and wall time. The wrapper retains environment, argv, source
hashes, and stdout/stderr. Time includes compression and checks and is
affected by external load; it is not an engine benchmark.

Objects from previous commits remain in history. Git already stores them
compressed: extracted file sizes and `.git` sizes differ. Compaction reduces
checkout and new artifacts, retaining already published commits and their
identifiers.

<a id="risultati-locali--2026-10-09"></a>

## Local results — 2026-10-09

| Campaign | Files | Original bytes | Retained bytes, including descriptor | Workers |
|---|---:|---:|---:|---:|
| [Published records](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-conservazione/compattazione-pubblicati.lisp) | 23 | 450,439,355 | 16,140,279 | 4 |
| [Completed local runs](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-conservazione/compattazione-locali.lisp) | 30 | 680,385,168 | 21,184,119 | 4 |

1,093,500,125 bytes were removed from uncompressed representations,
retaining all original bytes in verified payloads. The two records of
58,455,285 and 58,455,167 bytes have gzip payloads of 935,253 and 935,119
bytes, with descriptors of 327 and 335 bytes respectively. These are not
Git history sizes. New records of this campaign occupy additional space.

The [complete final check](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-conservazione/verifica-finale.lisp)
has stable sources and `:ok` outcome: 151 engine tests, 40 cases and 123
reader assertions, two negative publication-limit checks, linter, traceability,
links, and catalogs. The
[ten-spike campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-conservazione/spikes-verifica-finale.lisp)
retains argv, sources, output, and process outcomes. Its
[automatic retention](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-conservazione/conservazione-spikes-finale.lisp)
is recorded separately; the master retains all child results without
another composite duplicating their reports.

Failed attempts remain in the
[catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-conservazione/catalogo.lisp): syntax
error in the first control harness, heap exhaustion in the reader duplicating
all text, and two errors in temporary publication tools. The corrected reader
interprets reports directly from file; it no longer creates a full UTF-8
string before parsing. Added checks also verify six-byte records, exact
budget, and a plain file with tokens imitating a descriptor marker.
Original diagnostics are not abbreviated in retained records.

Importer `normalize-spike-report.lisp` uses the same reader for plain and
compressed input. Compatibility checking also verifies that `RESULT` and
`STATUS`, added during import, remain in published plists; the previous
iteration lost the new plist head. Six additional assertions compare results
and metadata of both paths. They are included in `make evidence-selftest`
and the full check.

The [check after writer queue integration](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-conservazione/verifica-integrazione.lisp)
runs on commit `4362110`, with stable sources: 168 engine tests,
123 reader assertions, six importer assertions, two limit checks,
all repository checks, and the
[integrated ten-spike campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-conservazione/spikes-integrazione.lisp).
The [initially failed import](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-conservazione/importazione-fallita.lisp)
and [check after correction](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-conservazione/importazione-verificata.lisp)
also retain the plist-head regression.

The [final merge check with radix recovery](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-conservazione/verifica-main.lisp)
passes on commit `4fa8df2`, with stable sources: 186 engine tests and all
previous checks, including the
[final campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-conservazione/spikes-main.lisp).
New radix records and local runs completed during parallel development are
also compacted; their reports are in the catalog.

<a id="conservazione-esterna--2026-10-23"></a>

## External retention — 2026-10-23

[ADR-0061](../adr/0061-conservazione-esterna-delle-prove.md) moves the
historical snapshot to a verified external asset and keeps recent summaries
locally. The gzip procedure above remains the format for historical originals
and local records. [Recovery instructions](../../spikes/evidence/README.md)
describe full verification; `make evidence` now checks only what is published
in the current checkout, without automatically downloading historical raw data.
