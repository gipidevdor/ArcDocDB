<a id="prima-lettura-degli-header-cbor"></a>

# First reading of CBOR headers

Coordinator reading after the three independent test files
(17 nominal tests) and two product sources were frozen. The coordinator established the
contract and connected ASDF; they did not write the two sources. The second reading
is attributed to the oracle author in the [separate report](cbor-header-revisione.md).
These are local automated readings, without human release approval.

No kernel defect found in the static reading. The public range
checks types before length and numbers before bytes. Empty spans and reserved
AI have distinct reasons and offsets. AI31 returns before width
calculation; the major7 case remains a marker without structural attestation.
The width<=end-start guard precedes all argument bytes and guarantees
that next=start+width is an index. At most four bytes are accumulated per
word: BE rotations do not construct a 64-bit integer. F8 checks the
simple value after the second byte is available; F9/FA/FB also preserve
NaN and infinity. The six values match the frozen contract.

The module has four short functions, complete FTYPEs, safety3, typed
conditions, caller-owned input, and no global mutable state.
Internal range/progress guards defend dependencies among helpers;
no correct public input makes them false. The [decision register](cbor-header-decisioni.md)
keeps them explicit. They are not excluded from coverage.

Cold oracles can build lists and bignums; the kernel and measurement
do not use them as hot results. The thread test verifies all six values before
the sink, full contents, and overlap of work intervals only.
Semaphores, joins, and cleanup have timeouts and check termination. These
tests establish compatibility with concurrent reads of private buffers;
pool runtime and the complete parser remain later work.

Build, coverage/mutation campaigns, and allocations are planned in the
[method](cbor-header-metodo.md), still pending at the time of this reading.
The static report does not anticipate outcomes. Integration does not promote complete
C1 gates, MC/DC, decoder requirements, or engine qualification.
