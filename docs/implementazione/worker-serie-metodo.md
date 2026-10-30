<a id="metodo-preregistrato-del-collegamento-workerserie"></a>

# Preregistered worker/Serie connection method

Initial base `2a0011f9d2bef104b22f7ad1eb86d7e5d60d5e11`.
Final qualification incorporates `main` through
`8101eb856cbe9d7540682babb53afb00fde30f70`, including hash foundation:
two preliminary tests on first scope remain separate from integrated verification.
Method fixed before new-connection campaigns and measurements.
Scope: four late sources in `src/series/worker-*.lisp`, ASDF, Serie-suite
tests, and C4 tool `tools/worker-series-bench.lisp`.
Contract and limits in [module document](worker-serie.md).

Planned verification, with preallocated inputs and objects:

- Complete slice, FIFO order and payload identity, sentinel buffers,
  monotonic tokens/leases over successive waves, and ack before end.
- Busy writer before acquiring Serie; busy second lease and exhausted
  Serie generation, distinct in three begin values. No pop, and schedule
  obligation preserved until recirculation and new slice.
- Busy end after Serie release: CLOSING/FINISHING, only end retryable,
  controller immediately acquirable, and no second release on retry.
- Invalid binding, phase, owner, token, and generations before mutations;
  batch debt, stale ack, alias/span, and wrong-thread without poisoning.
- Fault during Serie release: same condition, reference and lease
  preserved, worker not ended; fault after release without writing to handed-off
  controller. Bypass of captured leases rejected before pop.
- Compound fault-marking decision: three scalar conditions, each
  independently false with others true, and all true. Manual condition
  coverage, without inferring MC/DC from sb-cover.
- Competition on same Serie and two simultaneously active Serie with
  real threads, semaphores, and harness-only deadlines; no product thread.
  FAULTED-Serie acquisition permitted for draining already planned by controller.
- Macro boundary: expansion, single evaluation, multiple values, EQ error,
  and owner/faulted gate before handler. Exact type and reason allowlists.
  Serie acquisition and release substeps isolated with empty allowlists:
  a reason allowed only by writer does not hide a Serie error,
  and underlying worker fault does not become recoverable in bridge.
- Two C1 readings with twelve points and inventory of all decisions; raw
  sb-cover and HTML for entire Series scope, late files included, full
  denominator and gaps preserved. No approved exclusion.
- Local allocation: warmup128, five samples of4096 complete cycles on
  preallocated connection/worker/controller/target; GC and printing outside measurement.
  Every cycle enqueues a payload, adopts obligation, begins, reads lease, pops, acks,
  ends idle, and checks identities/outcomes/generations. Independent fixed sink
  per cycle in driver, not derived from product functions:
  `12+7+11+13+3+25+7+23=101`, sample sink `4096*101+4096*4095/2=8800256`.
  Positive
  heap and incorrect-sink checks demonstrate C4 detection.
- Full strict COMPILE-FILE of tool and FASL self-test with fatal warnings
  and style-warnings; ASDF loading applies only the exception for
  `sb-kernel:redefinition-warning` already declared by `tools/build.lisp` for
  loader rereads/redefinitions. No exclusion of C4 compilation
  warnings. Build and targeted tests before full check.
  `make check` once on final frozen code, unless changes or failure.

Every campaign recorded with `tools/record-command.lisp`, preserving
stdout/stderr, argv, environment, original reports, initial/final snapshot, and
failed attempts. Campaigns use frozen copies and separate caches. Large
data losslessly compressed with conservative catalog.
No throughput, P99, fairness, scalability, or universal zero heap allocation inferred
from these samples. No Phase0 gate closed by this foundation.
