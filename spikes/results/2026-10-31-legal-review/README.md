# Licensing review — October 31, 2026

[Scope and unresolved legal matters](../../../docs/legal/review-2026-10-31.md) ·
[Distribution policy](../../../docs/legal/distribution.md)

[Closed original archive](../2026-10-31-legal-review-originals/archive-index.lisp) ·
[Command collection](collector-observations/report.lisp) ·
[Retention audit](retention-audit.lisp)

## Method

Inspect the license boundaries of project code, UCD data/derived tables, SBCL,
the 71 declared browser components, 61 pinned documentation archives and tracked
assets. Inspect the site's privacy/contact statements against its own source.
Consult primary legal sources for Unicode, SBCL, Apache, GitHub, GDPR and EU
product/security rules. Preserve original terms and first failures.

The upstream archive inspection is a temporary Python analysis helper, not a
product or runtime dependency. No Node.js, npm or npx is used. Archive bytes are
rehashed; source licenses are not executed. The initial strict comparison and
follow-up permitting only CRLF/edge-newline differences remain separate records.
Temporary caches and downloaded source archives are not published as project code.

Before command execution, commit the notice changes and this method. Run only
the scoped C4 notice checks and negative fixtures, table regeneration comparison,
documentation bootstrap/build and rendering/notice fixtures, source lint,
traceability and links. Do not run database functional tests, performance
benchmarks, engine examples or qualification campaigns for this licensing change.
Register command argv, source identity, outputs and failures with record-command.

The generated-table comparison preserves every byte from IN-PACKAGE through EOF;
only initial attribution comments change. The artifact checker verifies declared
notice copies and stale/missing/altered files; it does not discover dependencies,
attest binary contents or provide legal approval.

The maintainer confirmed a private-individual project and GitHub contact. No
additional personal address, company identity or copyright ownership attestation
is inferred. Patent/brand clearance, actual commercial applicability, adequate
private rights-request handling and artwork/contributor rights remain open.
The review is not a certification of comprehensive legal compliance.

## Results

Initial notice changes and method were frozen in `62a9474`. The Unicode
regeneration comparison failed because the generated source had English
docstrings while the generator still emitted Italian. `aa53a57` aligns that
literal output without changing the table's code/data bytes. `b548595` merges
the remote compaction/documentation changes, preserving upstream versions of
unrelated files. No engine behavior is changed by this licensing scope.

The first site check on the merged tree failed because product and browser
notice destinations differed only by capitalization. On the local macOS file
system one replaced the other. `f0cf94b` gives them distinct names and adds a
case-insensitive uniqueness guard and fixtures. It also pins original BSD,
Unicode and reference SBCL notice hashes. `12684cce` adds the xxHash algorithm
reference notices to the final five-file distribution inventory and site copies.
All executed revisions remain in history; original failed reports are retained.

The closed archive preserves **23 command records**, 21 OK and two FAILED,
all STABLE. The earlier upstream inspection is separate: its original JSON
records two strict substring mismatches, resolved by the documented CRLF and
edge-newline comparison. It was an unregistered inspection, not a retroactively
created record-command run. Original archive and notice hashes remain available
with the temporary helper and request inventory. No downloaded toolchain archive
or source cache is published as ArcDocDB code.

Final results on `12684cce3c4745e1b4a7617fac01a3338ccacfc4`:

- Notice source/artifact checks: five declared notice files; 16 path, staging,
  existing-directory and damaged/missing/stale artifact checks passed.
- Complete Unicode regeneration matches the current generated file. A separate
  literal-byte comparison confirms that attribution changes preserve the original
  table from IN-PACKAGE through EOF. Algorithm reference notices preserve the
  original library license and the explicitly delimited specification notice.
- Documentation: 552 Markdown documents, 1,104 HTML pages and 84,174 local links
  and anchors verified; seven exact license/notice copies, 46 documentation
  regression checks, 24 code-reference checks and 14 damaged-artifact fixtures.
  Renderer warnings are preserved in stderr; no zero-warning claim is made.
- Source lint: 494 files, zero violations. Trace: 141 requirements, 71 invariants,
  13 FI scenarios and 78 ADRs, zero errors. Repository links: 776 Markdown files,
  3,718 links, zero broken. The exact variant and output are in each record.
- GitHub private vulnerability reporting was read back as enabled. The security
  route is not represented as a general confidential legal or privacy inbox.

The collector used four workers: 55 planned files, 57 actual files including
the closed index/catalog. The separate closed-inventory checker exited 0.
Nothing is added to that closed archive afterward. Four external copies retain
the collector process/sidecar and its two observations. Their audit compares
lengths and SHA256 before and after copying and embeds the retention helper;
it does not claim a literal byte comparison or legal approval.

Concluding link and targeted catalog checks remain outside the closed archive.
The first targeted catalog check failed: generic catalog references must be flat
filenames, while the first retention layout used subdirectories. The rejected
catalog is preserved. Five additional verified copies retain that catalog and
four flat aliases for the collector records; `flat-retention-audit.lisp` records
their hashes and the helper. The replacement catalog uses the required flat
references. The failed and successful catalog-check records remain separate.
The external catalog is extended after its check to name those final records;
that is not self-attestation. Historical catalogs are not all rerun.

No database functional suite, engine example, performance benchmark, FI or
qualification campaign was run locally for this licensing change. No numerical
command duration is used as a database performance measurement. Copyright
ownership, artwork/font provenance, brand/patent clearance, private rights-request
handling and actual commercial/regulatory applicability remain the explicitly
open matters in the legal review. Read evidence as data with READ-EVAL NIL.
