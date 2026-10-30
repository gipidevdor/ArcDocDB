<a id="raccolta-degli-archivi-di-comandi"></a>

# Collecting command archives

C4 tool `tools/collect-command-archive.lisp` collects already-completed
command records into a new archive. Applies evidence register
under [ADR-0035](../adr/0035-strategia-di-verifica-e-tracciabilita.md) and
COD-60/COD-61 checks from [standard](../affidabilita/standard-di-codifica.md).
Does not affect engine or persistent formats.
[Preserved verification](raccolta-comandi-risultati.md) reports attempts,
results, and limits of first campaign.

Input list explicit. Caller selects every file and
record; file next to record not automatically included in archive.
Descriptor and gzip payload must both be listed. Allows
preserving sources, outputs, and failures without cleaning or reinterpreting
contents.

## Manifest

Manifest is one plist, read as data with READ-EVAL NIL and mandatory
EOF. Relative SOURCE paths start from manifest
directory. PATH and RECORD-PATH relative to new archive root.
DATE field contains collection date, without dates in tool
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
descriptor. Each LABEL one unique segment;
every RECORD-PATH must appear in FILES. Files
`collection-manifest.lisp` and `collection-source.lisp` added by
tool. Those names, `archive-index.lisp`, and `catalogo.lisp` reserved.
Duplicates and file/directory collisions rejected.

Records must have schema 1, kind COMMAND-VERIFICATION, recorded end,
and terminal state. OK, FAILED, and SOURCE-CHANGED remain distinct. Failed
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
separate, neither containing other. Observations remain external
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
has one owner; index and catalog built after joins.
SHA256 hashes compare inputs before and after copies and
destinations. Copied-record metadata reread and compared with
originals; SHA256 verification covers entire contents.

Final verification starts `tools/check-command-archive.lisp` in separate
process. Checks closed inventory, hashes, and process metadata;
output remains in observation directory. No append
follows verification.

On error, command ends with nonzero code and reason.
Partial copies and observations remain available; existing archives neither deleted
nor overwritten. New run requires new names.

<a id="verifica-e-limiti"></a>

## Verification and limits

```bash
sbcl --noinform --no-userinit --no-sysinit \
  --script tools/collect-command-archive.lisp --self-test
```

Self-test uses local fixtures and rejections with expected reasons, including
concurrent copies, compressed records, failed commands, invalid paths,
existing destinations, and altered copies. Runs no product
campaigns. Part of preservation checks in `make check`.

Published-file limits: 1 MiB per ordinary file, 8 MiB per gzip,
128 MiB per expanded record. Plan has declared maximum entry
count. Observation remains local and per file: neither filesystem
transaction nor atomic durable publication. Inputs must
stay fixed during collection. Four workers do not constitute
database-scalability or performance measurement.

Collection promotes neither requirements, benchmark results, nor release
gates. Engine C1/MC/DC qualification remains separate.
