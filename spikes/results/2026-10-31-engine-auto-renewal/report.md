# Automatic M1 delta renewal — local verification

2026-10-31 · REQ-IDX-012 · [ADR-0072](../../../docs/adr/0072-rinnovo-automatico-delta-m1.md)
· [Contract](../../../docs/implementazione/rinnovo-automatico-m1.md)
· [Preregistered method](../../../docs/implementazione/rinnovo-automatico-m1-metodo.md)

Configured PUT/DELETE now renew the paged image automatically at the delta
threshold or before a new key would exceed its capacity. Full renewal
preflight precedes admission. One BUSY scope covers renewal, publication, and
the pending document commit; the derivative consumes no CSN or document ACK.
An oversized-for-empty key rejects without building an image. The resident
path and commit protocol are preserved.

## Results

| Check | Result | Original record |
|---|---|---|
| Complete pinned `make check`, SBCL 2.6.9 | exit 0, source STABLE; 104 engine cases, all standard checks and 11 spikes | [Full](full-final-2.6.9.lisp) |
| Unmodified CI self-test in that run | 364/364 passed across seven modules | [CI](ci-final-2.6.9.lisp) |
| Targeted final sources, SBCL 2.6.10 | 37 cases passed, source STABLE | [Targeted](targeted-final-2.6.10.lisp) |
| Allocation, final sources, SBCL 2.6.9 | all 20 windows observed 0 Lisp bytes-consed; 2,000,000 preflights | [Allocation](allocation-final-2.6.9.lisp) |
| Allocation, final sources, SBCL 2.6.10 | same fixed workload and result | [Allocation](allocation-final-2.6.10.lisp) |

The full run also checked 460 Lisp sources with zero lint violations,
140 requirements, 71 invariants, 13 fault-injection scenarios and 72 ADRs
with zero traceability errors, and 3,437 links with zero broken targets.

Eleven new engine cases cover configuration, repeated automatic writes,
independent threshold/capacity triggers, invalid-write non-effects, exact
reservation and one-byte-short rejection, collision, finite sequence and ID
endpoints, disabling, independent engines, errors/exits, admission guards,
late page/file exhaustion, postconditions, and process crashes.

Six real engines (v1/v2 × 4/16/64 KiB pages) each execute 24 document writes
without manual maintenance, compare all eight keys after every operation to
an independent value model, and check exact CSNs. Each completes seven
automatic renewals. The old image remains byte-identical. Threshold-only
renewal of a tracked key and below-threshold next-key arena saturation are
tested separately.

Eight new SIGKILL scenarios run in independent processes: image creation,
after image swap, after renewal before document WAL, and after document
commit, in both formats. Restart checks known CSNs and values. A completed
pre-document image is accepted only when still current; it is rejected after
the later document commit. Incomplete images are rejected. Existing location
delta and renewal crash checks also run in the targeted suite. Process
crashes do not qualify power loss.

## Allocation and resource scope

Each runtime has five warmed windows of 100,000 no-renewal preflights for
tracked/untracked keys in both formats. The input is preallocated; expected
NIL is checked inside the window. Setup, warmup, full GC, and reporting are
outside it. CSN, delta identity/count, ordinal, and file bytes are checked after
the windows. Keys are 16 bytes, the delta has a four-key quota and a 128-byte
arena, and policy is 100%. This measures the common preflight, not document
commit, renewal, GET latency, RSS, native allocations, or throughput.

The configured maintenance quota uses the existing complete old/new array
reservation. Runtime objects, strings, headers, GC and the retained resident
index need separate allowance. Names are consecutive with no wrap or retry;
1..65,536 renewals per configuration (default 64) bound generated image count.
Old derivatives are retained and disk capacity must be reserved separately.
An exhausted sequence or occupied name rejects before document admission.

## Method, environment and retained failures

Apple M4, ARM64, 16 GiB RAM, Darwin 27.2.0; external load uncontrolled.
Pinned full verification uses SBCL 2.6.9 with coherent PATH and SBCL_HOME.
SBCL 2.6.10 has the separate targeted/allocation results above. No Linux or
x86-64 execution is claimed. Base commit:
`5eef14ffeb0329a04a2c55a0e3a7c63c6a076ca4`, plus the working-tree source blobs
in each record. Implementation changes were uncommitted during verification.

Two C1 readings covered preflight non-effects, naming and publication/commit
ordering, then numeric bounds, ownership, resource accounting, errors and
complexity. A helper keeps admitted index preparation separate from the
write boundary. The final full run starts after that review; canonical
sources remain frozen during it. All 1,512 recorded source blobs matched
the current working tree again after completion. Its 662.50-second duration
includes compilation and all checks; it is not an engine performance metric.

All original command outcomes are preserved in the [archive index](archive-index.lisp).
An early strict run checked the existing cases before adding the new suite.
The first new-suite attempt failed on two extra parentheses in the test file.
A print-only syntax diagnostic recorded balance −2; its successful process
exit is not a passed syntax validation. After repair, the next run exposed a
fixture that incorrectly required the actively appended WAL to remain
unchanged across document writes. The assertion was corrected to compare
the old immutable image; independent document/CSN checks remain. The next
targeted run passed 37 cases before the final C1 additions. No product
condition or CI assertion was weakened to obtain a pass.

[Historical source identities](snapshots/source-identities.lisp) identify exact
failed test blobs and earlier changed runtime/fixture sources. Every retained
snapshot was checked against the original record's Git blob. Large originals
are losslessly compressed with byte counts and SHA-256; use
`tools/evidence-storage.lisp` to resolve descriptors. The closed collection
excludes FASLs and disposable data files. Collection does not promote gates.

## Reproduction and remaining work

From the repository root:

```sh
env PATH="/opt/homebrew/Cellar/sbcl/2.6.9/bin:$PATH" \
  SBCL_HOME=/opt/homebrew/Cellar/sbcl/2.6.9/lib/sbcl \
  make check SBCL=/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl
sbcl --script tools/record-command.lisp -- sbcl --noinform --no-userinit --no-sysinit --script spikes/results/2026-10-31-engine-auto-renewal/targeted.lisp
sbcl --script tools/record-command.lisp -- sbcl --noinform --no-userinit --no-sysinit --script spikes/results/2026-10-31-engine-auto-renewal/allocation.lisp
```

The original targeted/allocation commands used the identical copied drivers
under `spikes/out/m1-auto-renewal/`. Substitute installed pinned runtime/core
paths when reproducing. The full wrapper records its effective `make check-core`.

This automates maintenance of an explicitly configured paged overlay. It
does not release resident RAM or implement automatic resident/paged selection.
Independent paged writes/production, bounded beyond-RAM startup, a durable
catalog, snapshots/concurrent readers, and formal lock-free progress remain
open. Renewal can block on existing synchronous I/O; no latency improvement
is inferred from zero observed preflight allocations.
