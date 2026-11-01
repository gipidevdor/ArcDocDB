<a id="risultati-attuali"></a>

# Current results

The [main integration campaign](2026-11-01-metrics-main-merge/report.md) verifies
the combined observability, offline backup and Unix-group catalog, including
preservation of pre-existing work in the primary checkout.

The [counter and aggregation campaign](2026-11-01-metrics-counters/report.md)
retains coherent event accounting, original-source checks, allocation/cost data
and the C4 runtime-selection failures and their verified resolution.

The [latency histogram campaign](2026-11-01-metrics-histograms/report.md) retains
the owner-local component checks, full product regression, repeated update-loop
measurements and original failures. Its scope excludes engine instrumentation.

The [campaign selection](2026-10-23-attuali/README.md) collects summaries and hashes.
CI results are indexed under [ci/](ci/README.md). Raw data, compiled files and
temporary files from earlier campaigns are retained in the [external historical archive](../evidence/README.md).

`make evidence` checks the catalogs and data in the checkout. It does not
automatically download or recheck external originals. Use the historical archive's
commands for full verification. References to earlier evidence identify its
original Git revision without changing the recorded results.

New published results must include a readable summary, parameters, source
identity and hashes. Large raw data belongs in a verified external asset.
`spikes/out/` contains only disposable local experiment output.
