# Source cleanup and rejected key-sharing experiments

The accepted source cleanup removes six private adapters or unused paths:
`check-outcome`, `chiave-nel-delta-motore-p`, `new-local-socket`,
`handle-socket`, `native-open-listener` and the separate queued read-group
dispatcher. Active word-based record verification, committed-location lookup
and real engine startup remain. Eight client call sites share one nonconsuming
u64 ID preflight. Immediate and queued read groups share decoding and cleanup.
See the [source readings and regression method](../../../docs/implementazione/letture-gruppo-indipendenti.md#decoder-and-cleanup).

## Rejected experiments

Both experiments compared the original copy-every-key policy and request-local
key sharing under the same decoder, not two complete service versions. Each
used eight keys, lengths 1/32/1,024, identical/mixed/distinct/near-identical
patterns, 500 warmup calls, and three windows of 2,000 decodes for each policy:
72 original measurement rows per prototype. Copy counts and decoded bytes were
asserted. The driver, runtime, current source blobs, timings, allocation counts
and original diagnostics are retained without inferring production latency.

- The generic-span prototype reduced identical-key copies from eight to one,
  but regressed comparison time, especially for long near-identical keys.
- The typed-vector prototype used dynamic-extent scratch. This specific build
  allocated that variable-size scratch on the managed heap; total allocation
  increased even for identical keys. It also failed to justify its timing cost.

Both prototypes were removed from product code. Independent private key copies
and per-member canonical GET remain. Successful experiment execution is not an
accepted optimization or a closed qualification gate.

The [original archive](originals/archive-index.lisp) contains both command
records, the interrupted verification record, the frozen driver and the exact
prototype source bytes. Each source's Git blob was checked against its command
record before collection. The collection independently verifies byte hashes.
To repeat a prototype, load `arcdocdb/local`, then its archived
`read-group-wire.lisp.source`, and run the archived `bench.lisp` in that same
isolated SBCL process. The records distinguish their original uncommitted source
states from the accepted code. External machine load was uncontrolled.

## Accepted-source verification

The complete `make check` passed on the accepted source with source consistency
`:stable`. The Unix suite completed 25 cases, 98 scenarios, 265 processes and
54 verified SIGKILLs, with no cleanup errors. The full command also passed the
warning-free build, legal notices, lint and its self-tests, traceability, links,
full-text fixtures, evidence and archive self-tests, preserved-data verification,
spike correctness checks and CI-tool self-tests.

The [final original record](final-verification/archive-index.lisp) preserves
the exact command, runtime, source hashes and raw output separately from the
rejected prototypes and interrupted run. Local SBCL 2.6.10/macOS ARM64
verification does not establish Linux, power-loss or complete C1/MC/DC results.
