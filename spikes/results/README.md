<a id="risultati-attuali"></a>

# Current results

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
