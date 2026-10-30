<a id="spk-01--integrazione-della-lettura-in-buffer"></a>

# SPK-01 — Buffer-read integration

> **Proposed** — Recorded before integrated verification and measurements.
> Phase-0 Common Lisp/SBCL experiment: ADR-0043 v1 layout, four words or five
> with end CSN. Qualifies neither v2 nor production engine.

<a id="domanda"></a>

## Question

Does transporting four u64 results into a private caller buffer reduce observed
allocations while preserving seqlock, barriers, root recheck, and all read results?
Directly compare both paths, including beyond `most-positive-fixnum`, without
changing original kernel.

<a id="metodo-e-ordine"></a>

## Method and order

Baseline before launcher change uses `--profile SPK-01`: fixed key, one million
reads; key generation and hashing checked separately. Profile method already
recorded in spike README.

New launcher validates CLI before tests, compiles every module with warnings
promoted to errors, and requires complete original CHECK and buffer CHECK.
Buffer CHECK becomes part of `make check`; benchmark is explicit:

```sh
sbcl --noinform --no-userinit --no-sysinit --script tools/run-spikes.lisp --check SPK-01
sbcl --noinform --no-userinit --no-sysinit --script tools/run-spikes.lisp --bench SPK-01 -- --variant buffer
```

[Kernel](metodo-lettura-buffer.md), [test](metodo-check-lettura-buffer.md), and
[matrix](metodo-bench-lettura-buffer.md) methods precede respective experiments.
Measurements serial; preparation/warmup excluded. External load uncontrolled:
every value remains local measurement. No assumed zero allocation or universal
compiler improvement. Comparison concerns full variant: buffer, typed intermediates,
and probing expansion with `speed 3`; core retains `speed 2`.
Does not isolate API-change effect alone. Both retain `safety 3`.

Also record CLI rejections (unknown variant, duplicate option, unrelated matrix
options) and rejection of zero-operation benchmark. Expected rejection is a
negative control, distinct from passed CHECK. Compilations, generated-code
inspections, every error, and subsequent attempts retained; failed attempt never overwritten.

<a id="registrazione-e-limiti"></a>

## Recording and limits

Harness records command, environment, before/after source hashes, original stdout/
stderr, decoded result. Agent records add complete local-driver sources.
Published reports are portable data with `:schema-version 1`, read using
`*read-eval*=nil`. Catalog separates diagnostics, negative controls, campaign,
and integrated verification.

References: REQ-VAL-001, REQ-AFF-012, REQ-IDX-001, REQ-IDX-007, REQ-BEN-001.
No requirement changes state based on spike. No new shared lock/state between Serie:
one index writer serializes updates; each reader owns output. Weak memory on both
CPUs, MVCC, persistence, P99, and beyond-cache scale not tested.

<a id="revisione-preregistrata-dopo-la-prima-matrice"></a>

## Preregistered revision after first matrix

Campaign `4000484172` completes 80 samples but observes roughly 47.6 B/op in buffer
too. Kernel calls `intero-limitato`, constructing type `(integer minimo massimo)`
on every call. Hypothesis to isolate with recorded Common Lisp driver: comparison
of one million dynamic/static checks over values 1..8, same results and boundary
rejections, attributes residual to list construction. Preparation/report excluded.
No exact header or garbage-collector measurement assumed.

Revise buffer kernel only: use `typep` with literal `(integer 1 8)` and signal same
`type-error` without generic validator. Core remains baseline; seqlock, barriers,
root unchanged. Recompile strictly, repeat full CHECK and same serial matrix
without changing parameters. First campaign remains published.
Diagnostic budget: 1,000,000 checks per method, 1 GiB heap, separate 10,000 warmups;
no partial outcome. New matrix retains method's finite limits. Revision accepted
only after functional tests and all 80 samples recorded.
Final diagnostic strictly recompiles core/kernel, retains full disassembly,
verifies absence of generic-validator call on ARM64.
