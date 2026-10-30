<a id="risultati-della-scansione-strutturale-cbor"></a>

# CBOR structural-scanning results

Local campaigns of October 9, 2026 on the frozen kernel in the
[C1 report](cbor-struttura-revisione.md), with the stack supplement
declared separately. Commands, output, and attempts are preserved in the
[catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-cbor-structure/catalogo.lisp).
Static readings are local and do not constitute human approval.

| Targeted verification | Observed outcome |
|---|---|
| Strict build, lint, and traceability | PASS; zero warnings, 57 product files without violations, zero traceability errors. |
| New scanner suite | 24 nominal tests PASS, including 16MiB spans and last stack slot. |
| AST corpus | 256 generated items and 256 incorrect trailing suffixes verified. |
| All leads on two spans | 512 cases: 41 accepted and 471 rejected. |
| Finite fuzz | Seed `49CBA017`, 4096 spans of 1..64 bytes: 30 accepted, 4066 rejected. |
| Two private workers | 48 scans, 2,359,344 nodes, 5,505,168 bytes; sinks 4,718,784 and 3,145,920; all three values and buffers intact. |
| Heap on success | 6 fixtures ×5 replicates ×32 calls, warmup 128: all thirty samples at zero observed bytes. |
| Heap sensor | Baseline 0; positive control 16×1MiB observes 16,777,472 bytes, in both self-test and campaign. |
| Targeted mutations | Full baseline PASS, 10/10 compilable mutants DETECTED after exact smoke; zero INVALID and zero SURVIVED. |
| Focal raw coverage | 742/956 expressions and 144/200 branch outcomes; no exclusion from denominator. |

Complete SB-COVER state also contains modules and tests outside scope;
the focal report includes only the six package/space/scan files.
The 214 unobserved expressions are associated with 33 declarative forms,
8 forms in `defstruct` slots, 170 forms in 42 internal-error sites, and
3 default forms. The 56 missing branch outcomes are associated with 10 slot
forms and 46 internal guards. The audit compares raw-state paths
with HTML and sources; precise instrumentation causes for slots and defaults remain
unestablished. This association proves neither unreachability nor full
coverage and grants no exclusions or MC/DC qualification.

Work overlap is positive after the barrier: 79,346 ticks in the preliminary
build and 212,802 ticks in coverage, on a 1,000,000 ticks/s wall clock.
This does not measure CPU time or simultaneous execution on distinct cores and does not
establish pool scaling. Workers keep exclusive input and scratch;
the kernel creates no threads and uses no locks, waits, or per-operation I/O.

Mutant `tag-child-consumption` changes the tag/non-tag partition; its
first observed failure concerns simple value F4 ceasing to
consume the child. The log is not presented as a kill of a tag vector.
Full baseline includes tag-chain-specific oracles;
the ten-mutant campaign remains targeted, not exhaustive.

Measurements use safety3, cold-prepared fixtures and scratch, three verified
results, and an independent sink. Setup, warmup, GC, and reports are outside
counters. Costs include driver checks; external load is
uncontrolled. Zero observed heap concerns these successful calls, not
factory, errors, or absolute proof of no allocation.

The block checks structure and UTF-8 without establishing tag semantics,
duplicate keys, deterministic representation, writer admission,
durability, or the whole engine. Full `make check` is PASS: 320 ASDF tests, including two
smoke tests, and all 10 spikes with exit 0. Identical before/after snapshot and nine product/test
blobs matching freeze. The compressed master is reread
with expanded-byte verification; audits and originals are preserved in the catalog.


<a id="integrazione-con-il-ricircolo-dei-writer"></a>

## Integration with writer recycling

After campaigns, `main` advanced to `75ada9d` with ready-writer
recycling. Rebase without conflicts; all six kernel blobs and three CBOR test
blobs remain identical. ASDF and module index retain both blocks.
New `make check` is PASS: 335 ASDF tests, including 24 from the new scanner,
and all ten spikes. Identical before/after snapshot; separate audit, wrapper,
and master are added to the catalog without rewriting earlier outcomes.

The second master retains original descriptor and gzip in subfolder
`writer-recycle-integration-master/`. A derived descriptor changes only
the PAYLOAD basename for the root copy, retaining gzip bytes and checksum;
this derivation avoids collision with the first `report.lisp.gz`.
Earlier targeted measurements remain relative to the unchanged kernel and their
snapshot; integration introduces no new heap or scaling claims.
