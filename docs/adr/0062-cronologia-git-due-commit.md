<a id="adr-0062--cronologia-git-ridotta-a-due-commit"></a>

# ADR-0062 — Git history reduced to two commits

- **Status:** Accepted at the author's request on 2026-10-23
- **Date:** 2026-10-23
- **References:** REQ-AFF-012, INV-X2;
  [evidence preservation](0061-conservazione-esterna-delle-prove.md).
- **Relationship to ADR-0061:** for this authorized operation, supersedes
  the choice not to rewrite history. Assets and evidence originals remain unchanged.
- **Relationship to the specification:** no change to the product or persistent formats.

<a id="decisione"></a>

## Decision

The two latest states are retained: CRC32C verification and subsequent evidence
cleanup. The first becomes a root commit with **the same original Git tree**;
the second is its only child. Only links and maintenance metadata
required for the rewrite change in the second. Executable code
remains identical. New hashes are not attributed to historical runs:
results retain their original identifiers.

Before replacement, a complete Git bundle of the three previous public refs
is created, verified, published in the external asset, and reread
with SHA-256. The local Codex checkpoint matches a tree already present
in the saved history; no additional content to integrate.

`main` and the release tag are updated together with leases on the observed
hashes. The obsolete remote branch is deleted in the same operation.
The tag points to the new root commit; assets retain original names and hashes.
The CI publisher is suspended during maintenance and then reenabled.

<a id="verifica-e-conseguenze"></a>

## Verification and consequences

- Equality of the first commit's tree before and after the rewrite.
- No executable-code changes in the second commit.
- Historical-link targets verified in the preserved tree.
- Two commits reachable from `main`, one parent for the second, none for the first.
- Local and remote refs aligned, catalogs and local links verified.
- After push, expiration of local reflogs and garbage collection of orphaned objects.

The first preserved state still includes historical raw data: those blobs remain
reachable and continue occupying Git space. The request concerns history,
not changing the two preserved states. Removing unreachable
objects on GitHub servers depends on the service. Future commits,
including those from the CI publisher, may increase history again.
Full rollback is possible by importing the verified bundle.
