<a id="integrazione-dei-worker-nella-base-comune"></a>

# Worker integration into the common base

Merge `a185aee95b2e40f267df26ec41024dafc0fb9b7a` combines published
worker `9f9f6bd3b7a219211c8f08fe9e5f2b669b849796` with base
`edb043b1234479cadab0f39b7adf1918786fa91e`. This code version
verified by full check of October 9, 2026.

[Scope check](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-worker-main/scope-integrazione-processo.lisp)
preserves three Git-tree exports/blob comparisons. All
4,100 base paths present: 4,096 identical bytes. Four changed common
files ASDF, documentation index, execution package,
coverage-exception inventory. Twenty execution/worker test/tool files
identical to published version; 140 added paths against base
also match it.
[Adapter bundle](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-worker-main/integrazione-adattatori.lisp)
preserves full comparison, adapter sources, hashes.

[Full record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-worker-main/check-integrazione-processo.lisp)
OK/STABLE, exit 0: 459 tests in twelve suites plus smoke, warning-free
compilation, lint 111 files without errors, error-free traceability, 2,173 links
checked. Evidence checker uses Makefile default
2,048 MiB; external recording process's 4,096 MiB does not replace
it. [Spike master](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-worker-main/spikes-integrazione.lisp)
COMPLETE: ten spikes completed exit 0 with stable sources. Catalog
of [original copies](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-worker-main/catalogo.lisp)
also preserves preservation records/original gzip payload.

Independent static scope/contract readings confirm workers'
coexistence with Serie, WAL, index, snapshots, epochs, reads
in ASDF assembly. Full check qualifies assembly.
Worker-specific qualification remains from
[original results](writer-worker-risultati.md): 23 dedicated tests,
12 detected mutants, twenty local samples without measured heap allocations.
Dedicated campaigns not repeated for integration; limits
and coverage denominators unchanged.

Operational worker-lease/Serie-lease connection remains open.
Next increment must acquire both before first pop,
release Serie before closing writer, retain obligations
when second acquisition or closing returns busy. Verified
assembly proves neither protocol, engine throughput/scaling,
nor full C1-gate closure or MC/DC.

On resumption October 11, primary checkout contains further CBOR
scanner changes. Publication thus makes qualified base
`edb043b` explicit: preserved outcome does not automatically qualify new
sources.

<a id="verifica-dellinsieme-aggiornato"></a>

## Updated-set verification

Merge `68890dea18f1b010b582be338fbbfaf0361a39fd` combines previous
delivery `e96f99b` with primary `f16e978ad026e9307fde67425c35b2a8dbd1e731`.
Includes minimal CBOR scanner, index rebuilding, all related
runners. [Recorded native Git comparison](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-writer-worker-latest/identita-worker-processo.lisp)
confirms execution/worker test/tool files identical to previous
delivery. Independent reading preserved in
[complete bundle](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-writer-worker-latest/integrazione-adattatori.lisp)
also confirms CBOR/index sources identical to `f16e978`
and joint ASDF registration. No contract conflicts emerged.

[Full check of October 11](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-writer-worker-latest/check-completo-processo.lisp)
OK/STABLE, exit 0 on frozen merge copy: 600 tests in fifteen
suites plus smoke, warning-free compilation, lint 116 files without errors,
error-free traceability, 2,230 links verified. Evidence checker
passed with Makefile default 2,048 MiB budget.
[Spike master](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-writer-worker-latest/spikes-completi.lisp)
preserves ten experiments/original gzip payload;
[catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-writer-worker-latest/catalogo.lisp)
records intact copies/completed processes.

Verification qualifies assembly with CBOR/index rebuilding
on `f16e978` base; resolves previous delivery's limitation regarding
those sources. Operational worker–Serie protocol and overall
engine gates described above remain open. Dedicated worker campaigns
retain original scope, not repeated.
