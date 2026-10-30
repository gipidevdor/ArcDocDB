<a id="adr-0061--conservazione-esterna-delle-prove-storiche"></a>

# ADR-0061 — External preservation of historical evidence

- **Status:** Accepted for the cleanup authorized on 2026-10-23
- **Date:** 2026-10-23
- **References:** REQ-VAL-001, REQ-AFF-012, INV-X2, INV-X3;
  [evidence register](../valutazione/registro-delle-prove.md).
- **Relationship to the specification:** no change to the engine or document formats;
  clarifies C4 preservation and supersedes local residency of all historical evidence.

<a id="contesto"></a>

## Context

Published results comprise 52,277 files: source copies, SBCL compiled files,
fixtures, logs, and structured registers. Compressing each register individually retains
the high file count. Deleting items from sealed archives would break
their inventory; the author requires keeping only relevant recent results locally.

<a id="decisione"></a>

## Decision

1. Before removal, create a complete snapshot of the published bytes, a
   per-file SHA-256 inventory, and a compressed external asset. Extract it into an
   independent directory and compare inventory and contents with the originals.
2. Publish archive and inventory in the repository release, reread them, and
   compare hashes. Record revision, hash, and recovery instructions
   in the checkout. Sealed-archive originals remain unchanged in the asset.
3. Keep a summary of relevant recent campaigns and the three most recent
   CI publications locally. Redirect earlier citations to the
   original Git revision. No force-push or history rewrite.
4. `make evidence` verifies local data and catalogs; it does not recertify
   external raw data. Full auditing is performed explicitly after verified
   retrieval. An external reference does not represent a new run.
5. Compiled files, temporary files, and working copies do not belong in new publications.
   CI logs over 4 KiB are losslessly compressed; aggregate budgets remain unchanged.

<a id="verifica-conseguenze-e-rollback"></a>

## Verification, consequences, and rollback

The migration preserves 52,277 original byte streams, including failures and fixtures.
Hashes of the TAR reconstructed from gzip and zstd match; the asset downloaded from GitHub
matches the local one. Checkout and ordinary CI avoid bulk restoration.

External-service availability is necessary to retrieve raw data if no offline
copy exists. Git history retains previous objects: savings
in the checkout do not amount to a reduction in history or in the download of a full
clone. Rollback restores directories from the original commit or the verified
asset, without reinterpreting results or changing the product.
