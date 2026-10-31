# Local service index discovery — 2026-10-31

[Contract and preregistered checks](../../../docs/implementazione/scoperta-indice-local-m1.md).
Changes are isolated in a dedicated managed worktree from commit `5eef14f`;
no parallel uncommitted engine or document changes were copied or edited.

## Dedicated checks

[Driver](targeted.lisp), [complete command record](targeted-run/report.lisp):
SBCL 2.6.9, macOS ARM64, exit 0, status OK, SOURCE-CONSISTENCY STABLE.
Four cases passed: CLI domains/default profile, invalid library configuration
before clock/namespace, real product CLI GET/PUT/DELETE with restart after the
startup image becomes stale, and corrupt selected image refusing startup
without socket/READY. Both canonical formats v1/v2 are exercised.

The library observer sees RECOVERING, an adopted private paged view and no
socket; the later READY callback sees the listener. A custom immutable profile
(frames 1, candidate limit 1) reaches the engine. Normal cleanup removes its
owned socket. Distinct CLI processes read/write exact CBOR documents and CSNs;
the derived image remains byte-identical. Selected-image body corruption
preserves the footer so the full verification path is required. Default
resident service startup can still recover the canonical data afterwards.

The same four cases also passed on the installed SBCL 2.6.10, including all
server/client child processes: [record](sbcl-2.6.10-targeted/report.lisp), exit 0,
status OK, SOURCE-CONSISTENCY STABLE.

## Development failures retained

- [Compile attempt](attempt-1-compile/report.lisp): a test referenced a UIOP
  helper unavailable in this runtime. Replaced with the existing bounded fixture
  reader; no product-code workaround.
- [Admission test attempt](attempt-2-test-ready-gate/report.lisp): the observer
  called a public READY-only probe while RECOVERING. The engine correctly
  rejected it; the test now inspects its private view solely as an oracle.
- [Observer contract attempt](attempt-3-observer-contract/report.lisp): test
  callback returned T instead of required NIL. Corrected the fixture callback.

These failed attempts are not passing qualification. The two failed test fixture directories were removed after preserving these
diagnostic records; no user database directory was removed.

## Full verification

[Recorded `make check`](check-run/report.lisp) passed on SBCL 2.6.9/macOS ARM64:
exit 0, status OK, SOURCE-CONSISTENCY STABLE. Strict build and all suites passed,
including 83 engine tests, 70 paginated-index tests and the new local-service
cases. Lint: 455 source files, zero violations. Links: 715 Markdown files,
3409 links, zero broken. Traceability: 138 requirements, 71 invariants, 13 FI
scenarios, 70 ADRs, zero errors. Eleven [experiment checks](check-run/spikes/report.lisp)
and the [recorded CI self-test](check-run/ci-selftest/report.lisp) passed.

The worktree remains available for review. Only regenerable self-test fixtures
and byte-verified duplicate command outputs were removed after retaining all
unique command records here. This campaign does not qualify remote CI,
Linux, power loss, throughput, RSS bounds or capacity beyond RAM. It introduces
no delta scheduler, file deletion, image builder command, wire opcode or
backend selection based on available RAM.
