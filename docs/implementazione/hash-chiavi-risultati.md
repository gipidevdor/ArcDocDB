<a id="hash-delle-chiavi--prove-e-misure"></a>

# Key hashing — tests and measurements

[Results and structured records](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-key-hash/risultati.md):
706 integrated tests plus two smokes, 46 new regressions, seven mutants,
240 serial windows without heap and 360 parallel groups.

On SBCL/macOS ARM64: about 38.6 million hashes/s for 16-byte keys
serially; 75.7–113.1 million aggregate with four workers, depending on
fixture/seed. Medians of five replicates; all lengths and seeds
are preserved. The parallel path measures positive global heap.

These figures concern the primitive with harness validation and sink.
Incomplete coverage of inline helpers/guards, MC/DC, complete engine,
P99, seed lifecycle, and x86-64 remain declared limits.
