<a id="archivio-storico-esterno"></a>

# External historical archive

> **Decided — [ADR-0061](../../docs/adr/0061-conservazione-esterna-delle-prove.md),
> later Git reduction in [ADR-0062](../../docs/adr/0062-cronologia-git-due-commit.md).**

The snapshot at revision `fea3c113514c804a0daf13251a146c687cc3953c` retains
**52,277 original files**, including byproducts included in closed inventories.
Bytes were not rewritten. Summaries and references remain in the checkout;
originals are recovered from verified assets. Commit hashes in metadata identify
historical executions even when Git history has been reduced.

[Release with archive and SHA-256 inventory](https://github.com/gpicchiarelli/ArcDocDB/releases/tag/evidence-2026-10-23-fea3c113).
The [local manifest](snapshot.lisp) records identity, sizes, and hashes.

| Object | SHA-256 |
|---|---|
| `results-fea3c113.tar.zst` | `aa1ac178eb931e97cdf45e596d7ff85c5f3114ef94635fbe857bcdf55a36f182` |
| `inventory.sha256` | `61514c583a88afe90890bbb4483f1db539e36aaac86c1f118c8b2d7e9aaba071` |
| Decompressed TAR | `5a2df702ef3f0864e88ed21d800f7af321ea67f8b774bd8f1a6d9d26738a9a40` |

<a id="recupero-e-verifica"></a>

## Recovery and verification

Requires `gh`, `zstd`, `tar`, `shasum`, and SBCL. Use a directory separate from the
checkout: full extraction recreates approximately 1.4 GiB and over 52,000 files.
Download and extraction do not happen during `make evidence`.

```sh
mkdir -p /tmp/arcdocdb-evidence-download /tmp/arcdocdb-evidence-restored
gh release download evidence-2026-10-23-fea3c113 --repo gpicchiarelli/ArcDocDB --pattern results-fea3c113.tar.zst --pattern inventory.sha256 --dir /tmp/arcdocdb-evidence-download
cd /tmp/arcdocdb-evidence-download
shasum -a 256 results-fea3c113.tar.zst inventory.sha256
```

Compare both hashes with the table **before extraction**. Then:

```sh
zstd -dc results-fea3c113.tar.zst | tar -xf - -C /tmp/arcdocdb-evidence-restored
cd /tmp/arcdocdb-evidence-restored
shasum -a 256 --strict --status -c /tmp/arcdocdb-evidence-download/inventory.sha256
```

Zero exit status verifies all files against the inventory. From your ArcDocDB copy,
you can then run the historical verifier on the extracted directory:

```sh
sbcl --script tools/check-evidence.lisp --root /tmp/arcdocdb-evidence-restored/spikes/results/
```

Lisp records are **data**, never `load` arguments. The `tools/read-evidence.lisp`
reader handles original gzip descriptors.
The asset was reread from GitHub and its hashes compared with the verified local
copy. This protects integrity; it does not guarantee perpetual availability of the
external service. Retain a separate copy for offline work.

<a id="nuove-pubblicazioni"></a>

## New publications

Keep summaries, parameters, source identities, and raw-data SHA-256 hashes in the repository.
Publish and reread the asset before deleting the local copy. Do not force `.fasl`, `.tmp`,
`.bytes`, ASDF caches, or full working-directory copies into Git.
Existing C4 collection continues creating closed local archives: publication selection
happens after verification without changing originals.

<a id="cronologia-git-precedente"></a>

## Previous Git history

The [maintenance manifest](history.lisp) records the earlier reduction to two commits.
A later intervention retained only the latest state without changing its files;
[release notes](https://github.com/gpicchiarelli/ArcDocDB/releases/tag/evidence-2026-10-23-fea3c113)
document payloads needed to recover intermediate commits.
Evidence metadata retain original execution SHAs.

Complete previous history is in asset `history-before-e97b823d.bundle`,
225,295,869 bytes, SHA-256
`94b1a368a35ffef76b64ca4474a0c63b388ae57bd2e16b0bc7372a96e6c6d1dd`.
Bundle and hash were reread from GitHub before ref replacement.
To restore in a new directory:

```sh
mkdir -p /tmp/arcdocdb-git-history
gh release download evidence-2026-10-23-fea3c113 --repo gpicchiarelli/ArcDocDB --pattern 'history-before-e97b823d.bundle*' --dir /tmp/arcdocdb-git-history
cd /tmp/arcdocdb-git-history
shasum -a 256 -c history-before-e97b823d.bundle.sha256
git clone --branch main history-before-e97b823d.bundle restored
```

The external backup permits recovery even when old commits are unreachable from
current refs. Asset names and hashes identify the archived snapshot independently
of the commit targeted by the release tag.
