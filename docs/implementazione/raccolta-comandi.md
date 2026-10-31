<a id="raccolta-degli-archivi-di-comandi"></a>

# Collecting command archives

The C4 tool `tools/collect-command-archive.lisp` collects already-completed
command records into a new archive. It applies the evidence register
under [ADR-0035](../adr/0035-strategia-di-verifica-e-tracciabilita.md) and
COD-60/COD-61 checks from [standard](../affidabilita/standard-di-codifica.md).
It does not affect the engine or persistent formats.
[Preserved verification](raccolta-comandi-risultati.md) reports attempts,
results, and limits of the first campaign.

The input list is explicit. The caller selects every file and
record; a file next to a record is not automatically included in the archive.
Descriptor and gzip payload must both be listed. This allows
preserving sources, outputs, and failures without cleaning or reinterpreting
contents.

## Manifest

Manifest is one plist, read as data with READ-EVAL NIL and mandatory
EOF. Relative SOURCE paths start from manifest
directory. PATH and RECORD-PATH are relative to the new archive root.
The DATE field contains collection date, without dates in tool
source.

```lisp
(:schema-version 1 :kind :command-archive-manifest :date "2026-10-15"
 :files ((:source "runs/build/report.lisp"
          :path "processes/build/report.lisp")
         (:source "runs/build/report.lisp.gz"
          :path "processes/build/report.lisp.gz")
         (:source "review.txt" :path "raw/review.txt"))
 :processes ((:label "build" :record-path "processes/build/report.lisp")))
```

List gzip payload only when record actually has compression
descriptor. Each LABEL is one unique segment;
every RECORD-PATH must appear in FILES. Files
`collection-manifest.lisp` and `collection-source.lisp` are added by
the tool. Those names, `archive-index.lisp`, and `catalogo.lisp` are reserved.
Duplicates and file/directory collisions are rejected.

Records must have schema 1, kind COMMAND-VERIFICATION, recorded end,
and terminal state. OK, FAILED, and SOURCE-CHANGED remain distinct. A failed
command can be preserved too: collection success attests archive
copying and verification, not success of copied command.
COMMAND, STATUS, EXIT-CODE, and SOURCE-CONSISTENCY must be present;
infrastructure error may have EXIT-CODE NIL.

<a id="esecuzione"></a>

## Execution

```bash
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- \
  sbcl --noinform --no-userinit --no-sysinit \
  --script tools/collect-command-archive.lisp \
  --collect spikes/out/campagna/manifest.lisp \
  spikes/results/campagna/ \
  --observations spikes/out/campagna/raccolta/ --jobs 4
```

Destination and observation directory must be new and
separate, neither containing the other. Observations remain external
to archive: including them in same collection would change just-verified
set. To preserve collection outcome, completed command
record can be input to a later archive.

Common Lisp `collect-archive` API accepts strings or pathnames for
manifest, destination, and observations. Paths inside manifest
remain strings, as schema requires.

Preflight checks manifest, paths, sizes, and records before
creating destination. Copies use four workers, with first private
copy per worker when at least four files and shared queue
protected by mutex. Every result
has one owner; the index and catalog are built after joins.
SHA256 hashes compare inputs before and after copies and
destinations. Copied-record metadata are reread and compared with
originals; SHA256 verification covers entire contents.

Final verification starts `tools/check-command-archive.lisp` in a separate
process. It checks the closed inventory, hashes, and process metadata;
output remains in observation directory. No append
follows verification.

On error, command ends with nonzero code and reason.
Partial copies and observations remain available; existing archives are neither deleted
nor overwritten. A new run requires new names.

<a id="verifica-e-limiti"></a>

## Verification and limits

```bash
sbcl --noinform --no-userinit --no-sysinit \
  --script tools/collect-command-archive.lisp --self-test
```

Self-test uses local fixtures and rejections with expected reasons, including
concurrent copies, compressed records, failed commands, invalid paths,
existing destinations, and altered copies. It runs no product
campaigns. Part of preservation checks in `make check`.

Published-file limits: 1 MiB per ordinary file, 8 MiB per gzip,
128 MiB per expanded record. Plan has declared maximum entry
count. Observation remains local and per file: neither filesystem
transaction nor atomic durable publication. Inputs must
stay fixed during collection. Four workers do not constitute
database-scalability or performance measurement.

Collection promotes neither requirements, benchmark results, nor release
gates. Engine C1/MC/DC qualification remains separate.
