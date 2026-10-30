<a id="get-fonti-serie--metodo-e-revisione-statica-c4"></a>

# GET Serie sources — C4 method and static review

Review dated 2026-10-13 in checkout
`/Users/gpicchiarelli/.codex/worktrees/get-controller/ArcDocDB`.
Exclusive write scope: this document. No benchmark, helper,
compilation, test, or child process run. No runtime result
attested. Parent freezes sources and performs verification.

<a id="blocker-comunicati-durante-la-lettura"></a>

## Blockers communicated during reading

- **C4-01 — collector and mutation runner disagree on schema.**
  `collect.lisp`, SHA-256
  `616e5cef87f30d78f365035837555ce5a2342f29501f9d482801a16798e6df97`,
  lines 198–204, looks for `:directory` in mutants and tries constructing
  changed-source path. Runner appearing at second
  observation, `get-series-mutation.lisp`, SHA-256
  `effe04cc8f2db9f93c51fe1642cb541bc0d2a813038e6f374b60c1bec0353948`,
  lines 291–299, writes `:copy-directory` and `:evidence-directory`.
  Directory expected by collector therefore absent. Mutant
  publication statically incompatible: contract must be aligned
  before central verification. Runner already preserves mutated source,
  patch, driver, config, and log under `raw/evidence/<nome>/`.
- **C4-02 — incomplete raw/producer binding.** `collect.lisp`,
  same version, lines 147–165 and 226–231: a raw root can name
  any producer listed in manifest; terminal status and
  state checked, without comparing command and root or a digest
  inventory emitted by producer. Catalog digests attest copies at collection
  time, not origin in named process. These properties must be distinguished
  and required binding completed.
- **C4-03 — helpers excluded from wrapper snapshot.**
  `tools/record-command.lisp`, SHA-256
  `fae7e2a630e10ae6a1073d072065f9ae0ccef132f6221cb8b91c75124537cb16`,
  lines 17–34, excludes all `spikes/results/`, including executed Lisp
  helpers. At reading time 18:35:08 UTC, each helper TXT copy
  matches its Lisp byte for byte. This preservation alone does not
  prove which version ran: separate frozen
  registration of helper-source digests required.

`get-series-mutation.lisp` absent at 18:35:08 UTC and present at
18:36:06 UTC. Initial absence is historical observation, not an open
finding on later version. Reviewer was interrupted and closed
before freeze without delivering final rereading. Complete independent
C4 reading is not attested.

<a id="integrazione-dellautore-prima-delle-esecuzioni"></a>

## Author integration before runs

This section is by integrator after reviewer closure. Does not
attribute closure of later corrections to reviewer.

- C4-01: removed collector branch assuming `:directory`.
  Recursive collection preserves `raw/evidence/`, including patch, modified
  source, configuration, driver, and log; excludes `isolatedtests` and cache.
- C4-02: `tools/get-series-capture.lisp` produces raw SHA256 inventory
  at closure. Its terminal line is in producer-record stdout.
  Collector compares command/root, exit-code, and complete inventory
  before copy. Its own digests still observe copy;
  comparison with closed producer record establishes binding.
- C4-03: same wrapper captures helper `.lisp` digests before
  and after invocation. Line preserved by general recorder;
  TXT copies permit reconstruction of invoked version.

Collector self-tests added: capture round trip, missing marker,
extra final form, forbidden reader dispatch, and raw modification after
producer digest. Capture has its own negative helper-mutation
check. Runtime outcomes remain in
[campaign report](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-get-fonti-serie/report.md).

Benchmark: matrix N=1/8/64, two cycles, five replicates, serial and one/two/
four readers started through gate. Total 120 windows, 4,800,000 measured
cycles and 240,000 warmup cycles. Cache cycle includes resolution and probe,
therefore two root acquisitions; oracles and pin checks remain
inside clock. Startup/gate/joins included in parallel measurement. Heap allocation is process
allocation, not RSS; gate does not prove temporal overlap of every
cycle. No database throughput, P99, or durability cost measured.

Campaign mutates only both preregistered reads: isolated baseline and
four mutants. Crashes, warnings, type/fixture/I/O errors, and timeout are not kills.
Suite sensitivity and classifier outcomes require execution.
