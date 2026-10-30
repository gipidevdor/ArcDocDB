<a id="registro-strutturato-di-prove-e-benchmark"></a>

# Structured test and benchmark record

> **Decided (author request, 2026-10-08)** — every test, diagnostic, and
> benchmark is recorded in structured form, including failures, partial
> campaigns, and disproven optimization hypotheses. Implements REQ-VAL-001 and INV-X2.

<a id="record-della-campagna"></a>

## Campaign record

`tools/run-spikes.lisp` retains a Common Lisp plist with `:schema-version 1`.
Read it with `*read-eval* nil`, without loading or executing the file.
The report includes:

- `--check`, `--bench`, or `--profile` mode, campaign status;
- SBCL/OS/CPU/RAM environment, process heaps, universal-time date;
- Git commit, tree state, and Git blobs of actual sources;
- per process: exact argv, start/end, wall time, exit code, and outcome;
- `:result` decoded as data, with parameters, quantities, units, results,
  sink, limits, and omitted parts returned by the individual experiment;
- original stdout/stderr, failure diagnostics, and record paths.

Each process records blobs only for the sources it loads, before and after
execution. If they change, the harness retains the record with `:source-changed`
and fails: that measurement cannot be attributed to a stable variant.
Commit identifies history; blobs also identify uncommitted changes.
`:stable` compares two snapshots; it does not monitor every file opening.
Selected sources must remain unchanged during the test.

The campaign writes its state before starting and after every process.
The process record is saved **before** validating its output. A compilation
or parsing error remains a retained failed test; it does not disappear
from the record. `:complete` means all selected processes have ended;
any `:unsupported` or exhausted budgets remain distinct outcomes.
No product test is promoted solely by experiment success.

The directory is created with exclusive `mkdir` and bounded attempts:
a run does not overwrite its predecessor, even if it starts in the same
second. Compilation and checks are included in process time; microbenchmarks
separately expose actual measured windows. Measurements run serially.

<a id="comandi"></a>

## Commands

```sh
make spikes-check
make spikes-bench
make check
sbcl --script tools/record-command.lisp -- make lint
sbcl --script tools/run-spikes.lisp --check SPK-10
sbcl --script tools/run-spikes.lisp --bench SPK-01 -- --documents 10000000 --seconds 60 --memory-mib 2048
sbcl --script tools/run-spikes.lisp --profile SPK-01
```

The harness sets 4 GiB heaps and disables user/system initializations in
children. Options after `--` are allowed only for one selected benchmark;
they are process arguments, never shell code. SPK-07 runs its model even
in benchmark mode, without inventing engine throughput.

`make check` runs `make check-core` through `tools/record-command.lisp`:
a schema 1 record of type `:command-verification` retains argv, environment,
blobs before/after, exit code, and stdout/stderr of the entire check.
Check text remains raw output, without inferring counts or promoting
requirements. The wrapper can also record other commands with `-- argv...`,
always without a shell. Individual spikes also produce their decoded results.
CI retains `spikes/out/` as an artifact even when a check fails;
its Linux/macOS execution remains distinct from local verification.

<a id="conservazione-e-interpretazione"></a>

## Retention and interpretation

Local runs remain in `spikes/out/`. Every number published in documents
links to data retained in `spikes/results/<data>/`: original output and
structured records, with provenance and format version. An imported record
does not invent absent metadata; missing fields are declared.
The [evidence catalog](../../spikes/results/README.md) keeps checks, benchmarks,
profiles, failures, and variants distinct; environment and commands remain
in individual original records.

[Command archive collection](../implementazione/raccolta-comandi.md) uses a
manifest with explicit files and records, verified copies on four workers,
and independent checking of the closed inventory. It also retains failed
command records, with their original outcomes. The collection report remains
outside the archive just verified.

Records over 1 MiB are retained losslessly under the
[compact retention method](conservazione-compatta.md): the original path
contains a descriptor and the gzip payload is beside it. Sizes and SHA-256
allow original-byte verification. `tools/read-evidence.lisp` resolves the
descriptor without executing the record. `make compact-evidence` records
compaction, with four independent workers; `make evidence` checks integrity
and size limits, including uncataloged files.

Methods are registered before execution. Sample, clock, measured allocations,
and scope are stated; array memory is not RSS. P99.9 is not estimated from
few samples and a zero counter does not demonstrate universal allocation
absence. Uncontrolled external load and source changes during a run must
be declared. A blob identifies recorded content, not proof of compiler
or medium reliability.
