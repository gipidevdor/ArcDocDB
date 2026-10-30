<a id="lettura-c4-dei-driver-dello-scanner-minimo"></a>

# C4 reading of minimal scanner drivers

Coordinator's static reading, before any product execution or
campaign. The frozen benchmark has blob
`3cdd34a3dd5747f7fd0e513a1f2daeb7e2c2bbfb`; blind tests remain unchanged.

The eight fixtures are built from preregistered bytes, with private input and
scratch prepared outside measurement. Nodes, depth, END, and token are independent
constants; the cold check requires exactly three values. The measured
loop checks all three and uses them all in the sink. Warmup, GC, and
report allocation are outside heap and clock deltas. Null baseline,
deliberate live allocation, five replicates, and immutability are checked.
Fingerprint stability is distinct from authenticity; no throughput threshold,
scaling, or absolute proof of nonallocation is planned.

The first reading found that MULTIPLE-VALUE-BIND alone did not check
exact arity. The correction adds a cold MULTIPLE-VALUE-LIST before
warmup. Bytewise original `d0e85c152006e7949f9bdc80cbfebc1d15484650`
and finding/fix datum are preserved in the collection; no measurement precedes
the correction.

The scanner's eight mutants are fixed before reading the new tests.
Private copies, complete baseline, and unique fragments prevent ambiguous
substitutions. The catalog and dispatcher extend the existing runner;
integration preserves upstream classifications for OS signals and
failures after completion. These failures are WORKER-ERROR and
compilation errors INVALID, never mutant detections. Self-tests
also exercise real children and four valid/twelve invalid syntaxes.
Actual compilability and detection remain to be acquired in reports.

Coverage has a [separate reading](cbor-minimo-struttura-strumenti-review.md).
No open static finding in the final benchmark or catalog; runtime
results and preservation must be verified against original data.
