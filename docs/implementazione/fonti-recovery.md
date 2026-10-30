<a id="fonti-possedute-per-il-recovery-della-serie"></a>

# Owned sources for Serie recovery

`arcdocdb.recovery.manifest:apri-fonti-recovery` connects directory planner
to relative read-only opening. Returns two values: owned live-segment
set and complete plan, with anomalies/removals still explicit.
The [preregistered method](fonti-recovery-metodo.md) defines responsibilities,
decisions, and tests before code. No new format or durable point.

| API | Contract |
|---|---|
| `apri-fonti-recovery(manifest, directory, …)` | One complete enumeration; all and only ACTIVE/CLOSED in u64 order, READY plan required |
| `numero-fonti-recovery(set)` | Immutable source count, even after close |
| `fonte-recovery(set, index)` | Five values: ID, state, form, borrowed read-only capability, EOF from same FD |
| `chiudi-fonti-recovery(set)` | Invalidates first, attempts every child, repeat without syscall |

One owner retains set and finishes readers before closing.
Does not close individual children; parent and manifest remain caller's and are
not retained in result. Configuration and callbacks checked before
enumeration. Namespace must remain exclusive and stable; no
asynchronous cancellation during acquisition/close. POSIX opening is not
a file-system snapshot. Live temporary files opened by their names;
REMOVED, UNKNOWN, and orphan temporary files intact.

Five [inventory](inventario.md#raccolta-dalla-directory) budgets and
two [relative-opening](io-apertura-relativa.md) budgets retain
semantics/defaults. `max-total-file-bytes` adds cumulative live EOF
budget (default 4 GiB−1, `index` integer, zero allowed). Acquisition
budget without RSS promise; equality valid and sum without wrapping.
Set also owns child exceeding budget so it can close it.

On error, all already acquired closes attempted. If successful, same
primary condition propagated. `recovery-sources-cleanup-error`
retains initial cause through `recovery-sources-primary` (NIL for explicit
close), first cleanup IO-FAULT through `recovery-sources-cleanup`,
and failed-close count through `recovery-sources-cleanup-count`.
Failure while opening current child already cleaned by I/O layer,
which preserves any `cleanup-errno`. Close not retried:
FD may have been reused. Set remains invalidated even after error.

`:ready` certifies name availability only. Headers, logical segment
identity, CRCs, prefix, ACTIVE closing, index replay, CSNs, and
admission remain reader and future Recovery Manager responsibilities. No
rename, deletion, write, flush, reservation, or CSN allocation.

[Semantic Serie coordination](recovery-serie.md) now uses this
borrowed set to recover ACTIVE and all CLOSED after overall
preflight and with one scratch. Physical set management remains caller's.

Vertical test uses set for ACTIVE/CLOSED and closes it after all
readers; eliminates manual CLOSED ID scan 1…8. Limit eight
remains C4 fixture capacity. Results do not qualify whole
engine; C1 coverage, MC/DC, second reviewer, and platform remain open.

<a id="due-letture-c1-dellautore-prima-dei-run"></a>

## Two author C1 readings, before runs

First reading: REQ/ADRs and INV-A7/A8/A9/A10/A11/P6 consistent; no durable
change; borrowed parent and owned children; configuration checked before
I/O. Second: complete cleanup even after multiple errors, original primary
condition and total without overflow; loops bounded by plan/vectors;
no partial data published, lock, or write between Serie; allocations only
on cold path. Decisions FRS-D01…D07 in method and named FI tests;
compilation, trace, lint, links, and full check to run and preserve.
Both readings by author do not satisfy independent review.

<a id="esiti-conservati--2026-10-17"></a>

## Preserved outcomes — 2026-10-17

The [local campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-17-recovery-sources/report.md)
preserves 17 records, all STABLE, including failures and one check interrupted
to correct two nested tests. Final baseline has 16 standalone tests;
11/11 mutants detected at runtime with four isolated processes, zero compilation/
pre-test/worker errors. Runner now rejects nested DEFTESTs.

`make check` passed on commit `8aaa0621`: 2,054 named tests plus two smoke tests,
170 recovery, four vertical tests with 16 positive scenarios and two negatives, ten
spikes; 321 product files without violations, 135 requirements/69 invariants/
13 FI/55 ADR without errors, 564 Markdown files and 3,903 links without breakage. Includes
full-text and cache checks; these qualify neither full-text visibility nor recovery.

Raw coverage of four files: 293/327 forms and 22/26 branches, all
22 branches of three operational files marked. Residual declarations, slots, and
keywords remain in denominator; no approved exclusion. Native/HTML
and missing paths preserved, along with manual-helper limits and test
variants. Second reviewer, MC/DC, and C1 qualification remain open.

The [collection receipt](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-17-recovery-sources-collection/README.md)
preserves collector and closed-inventory checker. Four product
files unchanged from first implementation; later corrections
concern fixtures, runner, integration, and documentation.
