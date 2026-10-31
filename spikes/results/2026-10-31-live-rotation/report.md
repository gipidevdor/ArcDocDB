# Serial M1 live rotation — 2026-10-31

Integrates [ADR-0076](../../../docs/adr/0076-rotazione-live-m1.md) into the
production engine and existing Unix service. Byte or record saturation now
closes the old ACTIVE through canonical CONTROL publication and continues in a
fresh segment before assigning the next data CSN. The CSN/snapshot/epoch family,
primary backend and logical source identity stay unchanged.

## Qualification

Targeted checks cover repeated rotations across v1/v2 and legacy/resident/paged
indexes; exact CSNs, closed-byte immutability, stable explicit-FD/source-set counts;
known segment exhaustion without effects; declared faults at five publication
phases and nonlocal exits; sealed images with location deltas and automatic image
renewal; closed-source corruption before checkpoint. Real children execute ten
SIGKILL points (five phases for each format), followed by two distinct reopen
passes using only product APIs. The real Unix service writes 300 distinct 60000-byte
CBOR values per format, crosses its default 16-MiB segment limit, verifies values
on both sides, receives SIGKILL, then recovers and continues at CSNs 301/302.

The first core campaign passes four cases. An expanded attempt passes engine
checks but rejects a test document whose CBOR length was encoded little-endian;
the fixture was corrected to CBOR big-endian. The next complete eight-case
campaign passes, including real engine and service processes. No product decoder
or integrity check was relaxed. [The final corruption case](corruption-2.6.9/report.lisp) also passes.
The [complete SBCL 2.6.9 gate](full-2.6.9/report.lisp) and
[independent strict SBCL 2.6.10 all-suite build](strict-2.6.10/report.lisp) pass
with exit code zero and stable before/after source inventories. No warnings were
suppressed. Lint, links, traceability, evidence self-tests/validation, SPK-01–11
correctness and CI self-tests are included in the complete gate.

After qualification, an unrelated chat's uncommitted documentation work reserved
ADR-0075. This integration's unpublished draft was assigned ADR-0076 before
publication, and only the decision's documentation references/matrix were updated.
[Source-identity verification](post-qualification-code-identity.lisp) checks every
product, test, tool and ASDF blob from the successful gate unchanged. Traceability
and links are rerun on the final documentation. The other chat's files are untouched.

This is local C4/macOS ARM64 evidence. Whole-engine completion, concurrent readers,
multiseries, compaction, power loss, reference-platform performance and C1/MC/DC
qualification remain separate. A full bounded canonical scan on rotation is an
explicit latency tradeoff, not a benchmark claim. Total segment capacity still
requires operator intervention until compaction is integrated.

[Final traceability and link checks](final-doc-checks/report.lisp) pass after
correcting one remaining implementation-index link; the failed link-check
record is retained separately. The other chat's primary checkout has overlapping
uncommitted ADR/matrix and documentation-tool changes. This integration is
qualified and published from its isolated worktree; the dirty primary files
are neither stashed nor rewritten to force an alignment.

[Original qualified documentation](qualified-documentation.lisp) preserves every
original document changed by the draft-number correction, with byte-exact Git
blob verification; these snapshots remain reconstructable after Git garbage collection.
