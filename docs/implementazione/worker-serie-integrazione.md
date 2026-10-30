<a id="integrazione-delle-verifiche-reader-dopo-il-primo-controllo-generale"></a>

# Integrating reader verification after the first general check

After PASS on freeze `96c0f4f`, `main` incorporated PR 8 through
`65972a4e6e84bd4c31d1d654c9a9a29bf6c44eb0`. Tree comparison
detects no changes in any `src/` file or existing tests.
64 EBR/read tests, their mutation self-test in
Makefile, reader-mutation tool, documents, and evidence are added.
ASDF additions for new suites are preserved alongside bridge.

The bridge's four sources, its 26 tests, and C4 are byte-identical
to qualified freezes. Foundation-coverage change adds
only CLI selection, dispatch, and epochs/read scope self-tests;
Series-scope selection and execution remain unchanged.
Serial measurements and native coverage are not repeated: outcomes remain
attributed to v3 on `8101eb8`, with original denominators and limits.

New `make check` verifies integration on `65972a4`, including
64 tests and added self-test. First general PASS on `96c0f4f` and
its document/evidence gate remain preserved as preceding outcomes;
they are neither renamed nor replaced by subsequent check.
Updated check passes in
[record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series/full-check-reader-integration.lisp)
`4000710249-command-34111-0`, `:OK/:STABLE`, exit 0: 641 unchanged sources and
documents, 796 named tests and two smoke tests. Both new suites
comprise 34 epoch tests and 30 read tests. Snapshot and reader mutation
self-tests also pass, with intentional errors preserved
in the [bundle](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series/reader-integration-selftests.lisp).

The [Phase 0 master](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series-reader-spikes-check/report.lisp)
`4000710392-check-37003-0` is `:COMPLETE`: all ten processes are
`:STABLE`, exit 0, empty stderr; SPK-07 `:PASS`, others `:OK`.
Command and spike preservation `:OK`, exit 0; no warning or
style-warning in original command stderr. Frozen sources and documents
are in the
[bundle](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series/source-reader-integration.lisp).
Corrected auxiliary reading and extracted outputs are preserved;
no new syntax probe or new C4 measurement.

Insertion of these results and new catalogs is followed by document,
traceability, and preservation checking. Its raw
data is added to catalog without repeating unchanged tests or benchmarks.

The [campaign result](worker-serie-risultati.md) and
[two readings](worker-serie-revisione.md) keep these scopes separate.
