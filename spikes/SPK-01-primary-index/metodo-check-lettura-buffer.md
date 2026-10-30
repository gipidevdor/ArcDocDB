<a id="metodo-preregistrato--check-lettura-buffer-fase-0"></a>

# Preregistered method — buffer-read CHECK, Phase 0

> **Proposed** — Experimental verification preregistered before compile/CHECK;
> references REQ-IDX-001, REQ-IDX-007, REQ-VAL-001. Not production code.

Exclusive owner: `check-lettura-buffer.lisp`, this method, new
`out/check-lettura-buffer-*/`. Checkout: indice-lettura/ArcDocDB.
No changes to core, agent A's kernel, runner, tools, shared documents.
Common Lisp/SBCL only, safety 3; warnings/style-warnings are errors.
No BENCH, commit, push. Measurement/integration belong to parent.

<a id="ipotesi-e-criteri-registrati-prima-di-compilecheck"></a>

## Hypotheses and criteria recorded before compile/CHECK

API under test: `ARCDOCDB.SPK01.LETTURA-BUFFER:LEGGI`, private destination
simple-array u64 of exactly length 4; two values, status keyword and retry fixnum.
V1 words4 / words5-extra-end layout. HIT publishes CSN, location, length, end-CSN
only after seqlock/root validation; MISS, retry-limit, every error preserve all
destination words. Callbacks follow core: after-fragment on every attempt,
after-fields for every control candidate with initially even sequence, even
if key does not match.

Model is EQUAL map of 16-octet lists, with independent PUT/DELETE journal and
final replay. Key generation, tuples, location arithmetic in CHECK, without
using core patterns/LEGGI for expectations. Every ordinary read compares kernel,
model, baseline; baseline adapted into destination only after returning HIT.
Interleavings use fresh fixtures per reader and same callbacks, without scheduler.

Per layout: 64 initial keys; LCG32 seed 424242, 128 eight-operation blocks (1024):
PUT, overwrite, hit, delete, miss, reinsertion, hit, absent miss.
Exact assertions: 384 PUTs, 128 DELETEs, 512 campaign reads, 64 initial/384 final
reads (960 kernel/model/baseline comparisons). Journal has 576 events per layout,
complete replay, no exhausted limit treated as success. Split must actually occur.

Separate main cases: values 0/1/fixnum-max/fixnum-max+1/2^63/max64,
location with max32 segment/offset, length 0/1/max24, zero/all-FF keys;
tombstone/seqlock-threshold rebuild; seven keys with control 53 and initial probe
15 at capacity 16, search bounded to 131072 candidates. Six occupied slots must
be 15,0,1,2,3,4; seventh is MISS visiting six candidates.
Callback traces must match baseline exactly.

Witnesses, both layouts/readers: retired-root HIT/MISS; update/delete in
after-fields; persistent odd introduced after fields; root swap on all eight
attempts; update on all eight attempts; original errors in both callbacks.
Each callback checks buffer before/after writer; HIT after retry checks current
tuple, not retired one. Retry-limit requires exact count/intact destination.
Budgets 1..8 including preexisting odd: eight distinct cases, not one default test.

Separate negative checks: invalid index/key/destination/attempts/callbacks,
unknown keyword, writer rejection of u64 beyond max64 and length beyond max24,
CHECK budget exhaustion with explicit condition. Arrays, including backing regions
of views/displaced arrays, compared in full.
Structural budgets: seven records at capacity 8/maximum depth 0, eighth PUT rejected
for depth with seven retained; capacity 32768 with 1 MiB rejected for initial payload.
Expected totals: 54 main cases, 79 negative controls (46 inputs, 16 writer/structural
budget rejections, 1 assertion budget, 16 mutants), 2032 reads against map/baseline.

CHECK-local mutants without redefining/modifying kernel/core: omit root recheck
(HIT/MISS witnesses), omit second seqlock (update, delete, odd), truncate u64 to
fixnum (boundary), write before validation (update/delete). Eight rejections
required per layout with relevant reason verified; generic error does not count
as mutant rejection. Not a universal memory/hardware-model proof. No threaded
stress: witnesses are synchronous interleavings with one writer.

CHECK has finite 200000-assert budget, finite searches, separate campaign counts/
categories. `:status :ok` constructed only after every test and final assertion.
Output uses lists, keywords, strings, numbers; types/functions/conditions described
as strings.

<a id="registrazione-schema1-di-ogni-esecuzione"></a>

## Schema1 recording of every execution

Before each compile/CHECK, write numbered plan in fresh exclusive out with exact
argv/stdin and reference to this method. SBCL driver separate from existing runner:
source-before/after snapshots (contents and declared MD5 for core, kernel, CHECK,
method, driver); original stdout/stderr files, exit code, decoded result in schema1
record. Driver promotes warnings/style-warnings to errors, checks compile-file.
Errors/failures retained, never overwritten. Every method revision precedes its execution.

Second SBCL process, without spike packages, reads result/record with
`*read-eval* = nil`, rejects nonkeyword symbols/disallowed objects, saves readable
data. No CHECK before complete kernel; kernel existence is no correctness/readiness claim.

<a id="esecuzione-k1-preregistrata"></a>

### Preregistered K1 execution

New drivers in `out/check-lettura-buffer-campagna-20261008-01/`: `record.lisp`,
`child.lisp`, `decode.lisp`. K1 compiles core, complete kernel, CHECK in order,
loads FASLs, calls CHECK. Start only after A confirms frozen kernel.
Budget: 1024 MiB heap, child timeout 90 seconds, recorder 105 seconds,
cleanup 5 seconds, 200000 asserts. At most six compiled revisions; each requires
new plan and retains earlier failures. Timer protects against hangs; not used
for interleaving correctness. Every snapshot also includes three drivers.
Changed source-after implies error.

Exact command from isolated checkout root:

```sh
/opt/homebrew/bin/sbcl --noinform --no-userinit --no-sysinit --script spikes/SPK-01-primary-index/out/check-lettura-buffer-campagna-20261008-01/record.lisp k1
```

Recorder loads no spike packages and writes preregistered.sexp before launch;
stdout/stderr retained verbatim, including compiler diagnostics on stderr.
After record, further process without spike packages verifies record/decoded.sexp
with read-eval disabled. Recorder requires A's `:ready`/`:frozen` handoff,
retaining it in plan/record; parent requested REQ comments before C3.

<a id="esito-k1-e-consegna-congelata"></a>

### K1 outcome and frozen handoff

K1 completed first attempt: compile/load core, C3 kernel, CHECK without warnings/
style-warnings; empty stderr, exit 0, CHECK `:status :ok`.
Before/after snapshots identical for every recorded source. Schema1 record:
`out/check-lettura-buffer-campagna-20261008-01/k1/record.sexp`; readable data
in `decoded.sexp`, original stdout/stderr in `stdout.raw` and `stderr.raw`.
Independent readback exit 0 / status ok, read-eval false, spike packages absent;
no foreign symbols in decoded data.

Verified counts: 54 main cases, 79 negative controls (46 inputs, 16 writer/structural
budgets, 1 exhausted CHECK budget, 16 mutants), 2032 map/kernel/baseline comparisons,
18 witnesses, 16 retry budgets. Per layout: 1024 seeded operations, 576 journal
events, replay, final population 64; 6 splits, 18 rebuilds in campaign.
Collisions found in 11870 candidates within 131072 budget.
26227 of 200000 assertions consumed. No partial outcome.

Tested/frozen CHECK Git blob hash:
`fd32c5260ffb7c6e96cf1a420765eb01effe70bc`; C3 kernel
`28002439f931387cd6baebcf57adde7e88e2961b`; core
`c019f6ad53e173a0d336a4dbfaf903e274a66f08`.
Handoff note added after K1; Lisp source unchanged. CHECK/method remain frozen
for parent integration/measurements. B ran no BENCH, commit/push, or runner/tools changes.
