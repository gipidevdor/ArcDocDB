<a id="testate-cbor-minime--lettura-dei-driver-c4"></a>

# Minimal CBOR headers — C4 driver reading

Coordinator reading of the two tools, independent of their author.
The benchmark is frozen at eight fixtures, five replicates of 4096 calls,
warmup 128; the mutator at eight unique targets, before campaigns.

In the benchmark, loading and warmup precede clock and heap counter.
The six values are compared with independent constants before
feeding the sink; the sink uses all values and the call index.
Inputs and sentinels are preallocated and compared after the campaign.
Zero baseline and deliberate allocation with a live object verify the
sensor. An error produces a failed report and nonzero exit. The serial
measurement does not attest rejection-path heap allocation, scaling, or database throughput.

The mutator copies ASDF, build, sources, and tests into new directories and private
caches. Replacement has a unique target in the frozen file.
Baseline requires zero exit, smoke marker, and completion on exact
lines; a mutant with zero exit without completion is INVALID.
Failed compilation, merely quoted markers, or error before smoke
are INVALID. A runtime error after smoke counts as DETECTED; normal
completion counts as SURVIVED. Negative checks are in the self-test.

The eight defects concern thresholds 24/256/65536, u64 high word,
binary16 normal maximum, binary16 subnormal alignment,
binary64 special exponent, and binary32 subnormal minimum. They are not
exhaustive mutations of every compound condition: no MC/DC claim.
Actual compilability and detection are verified in preserved logs,
without counting them from the static reading's result alone.

No open static findings in the drivers. Coverage scope and collection
utility receive a [separate reading](cbor-minimo-strumenti-review.md).
