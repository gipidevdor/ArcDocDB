# Automatic index completion — preregistered verification

Registered 2026-10-31 before code or execution of ADR-0073. C1:
REQ-IDX-008, REQ-IDX-013, INV-I1/I7/I8/A2/A8/A10/P6.

1. Differential AVL insert/update/delete against an independent hash table:
   monotone and randomized orders, all rotation/deletion shapes, identical
   digests, long common-prefix keys, empty tree, u64 boundaries and corruption.
   Verify order, balance, subtree counts, key bytes, references and CRCs.
2. Fixed-cache saturation and tail invalidation; no invalid buffer escapes.
   Bounded batch/path/file quotas; partial I/O and ownership cleanup.
3. Flat resident growth and automatic migration before exceeding the assigned
   quota; exact boundary and one byte below. Prefer resident when it fits.
   DELETE/shrink and changed quotas trigger verified return with hysteresis.
4. PUT/GET/DELETE in both formats and 4/16/64 KiB frames across repeated
   transitions, compactions and restarts. Preserve independent values and CSNs;
   no complete resident index or CLOSED record table in paged mode.
5. Canonical replay exceeds both the configured index quota and a bounded
   child Lisp heap using streamed long-key fixtures. The fixture generates
   keys on demand and retains no full model in that child. Record live-index
   bytes, owned buffers, heap limit and actual outcomes separately from RSS.
6. Faults/nonlocal exits before/after migration, compaction, canonical SEAL,
   disk-root publication and admission. Independent SIGKILL restart checks;
   no incomplete ACK, stale derivative adoption or deletion of canonical data.
7. Owned-temporary removal: foreign grammar, wrong identity/directory,
   replaced entry, symlink, consumed proof and missing backend rejected.
8. Five warmed allocation windows of at least 100,000 resident and resident-page
   lookup operations with preallocated keys/output; checks included explicitly.
   Measure misses/maintenance separately; no throughput or lock-free inference.
9. Strict safety-3 compilation, all C1 compound decisions and two readings,
   differential legacy regressions, pinned full `make check`; preserve failed
   attempts and source identities. Record unsupported platform execution.

The complete implementation and evidence must precede any claim that automatic
selection is finished. Physical-RAM scale, power loss, concurrent snapshots,
and formal nonblocking progress require their own qualification.
