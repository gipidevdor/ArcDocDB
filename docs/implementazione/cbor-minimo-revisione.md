<a id="seconda-lettura-delle-testate-cbor-minime"></a>

# Second reading of minimal CBOR headers

C1 reading on 2026-10-09, completed after freezing the three oracle files and
before campaigns. The reader wrote the new tests without reading
`cbor-minimal.lisp` or `cbor-float-minimal.lisp`; they are the historical author
of header/structure primitives, but not the new filter. No test, build, or
measurement was performed during this reading. This is not human approval.

No open static defect in the new kernel. MT0..6 thresholds match
minimal widths; floats are treated as IEEE fields and separate
words, without native conversion. Normal/subnormal boundaries and
alignments exactly represent binary16/binary32 units. Sign
does not change narrowability; NaN preserves significand and
quiet/signaling position. Unchanged reader syntax precedes every
`:cbor-nonminimal` rejection. The local ban on indefinite forms is consistent with
[RFC 8949 §4.2.1](https://www.rfc-editor.org/rfc/rfc8949.html#section-4.2.1);
the preference in §4.1 alone does not prohibit every indefinite form.

<a id="checklist-c1"></a>

## C1 checklist

| Point | Static finding and limit |
|---|---|
| 1. Requirements/ADRs | AFF-004/008 and partial LIM-002 support; ADR-0014/0048 and local contract consistent. No certification of the complete document profile. |
| 2. Invariants | Fields, words, alignment, and progress checked; blind corpus and supplement described below. Internal guards remain in the denominator. |
| 3. Errors | Range/reserved/truncated/indefinite/simple propagated; nonminimal at lead; typed defenses. The kernel does not own the Serie or decide FAULTED. Runtime pending. |
| 4. Limits | No new loop or recursion; base bounded to nine bytes, filter to comparisons/masks. No waits. |
| 5. Heap | No constructor or u64 union in new success path; maximum shift 32, immediate words on the 64-bit target. Heap measurement and positive sensor pending. |
| 6. Output data | Six original values only after syntax and filtering; payload, tags, and containers are not interpreted. |
| 7. Decisions | D01…D10 in the table match code. D03/D06 have the declared public supplement; coverage and MC/DC not certified. |
| 8. Ownership | Caller-owned immutable buffer, locals only; no scratch or mutable global. |
| 9. Integration | Export and ASDF order present; strict compilation, trace, and snapshot `make check` still to be acquired. |
| 10. Standard | Six functions with FTYPE/docstrings and at least two guards, safety3, within 60 lines/10 paths at reading. No static deviation found; build/lint pending. |
| 11. Parallelism | No lock, wait, or shared write per operation. Two private workers planned; real intervals do not prove separate cores or scaling. |
| 12. Durability | No write, publication, or deletion; atomicity point not applicable. |

<a id="provenienza-del-corpus-e-supplemento"></a>

## Corpus provenance and supplement

The blind corpus contains 14 tests: all 65536 half values and 131072 expansions,
IEEE vectors and adjacent values, lead/simple, integer thresholds, 152 truncations,
precedence, immutability, fuzz of 12288 cases seed `4D494E43`, and two workers.
The three blobs frozen before reading remain unchanged:

| File | Git blob |
|---|---|
| `tests/codec/cbor-minimal-support.lisp` | `774e6cd0bec4a9d2242ad4dede878ffa2afca90c` |
| `tests/codec/cbor-minimal.lisp` | `b863ace9a22e8b7508b7c9d8f91465ebfbcd4e98` |
| `tests/codec/cbor-minimal-threads.lisp` | `e613ea025c2a886cdae7fd5e119cf80593c6b72e` |

After reading, with coordinator authorization, only
`tests/codec/cbor-minimal-edges.lisp` was added, blob
`c6f891dff335a37689ddbfabccf793d2e9f2f143`. The test uses the general rational
oracle, not product helpers: HIGH/LOW pairs for subnormals with
shift32/33/52 and the HIGH-only binary64 subnormal. There are 13 values with two signs,
26 public calls. The supplement derives from reading D03/D06 and
is not presented as part of the original blind corpus. Total: 15 tests.

The product snapshot read is `cbor-package` `0d014e499f0862f13674bd934070c166c286f256`,
`cbor-float-minimal` `ca6215b30010d3d2eb90eaa6fd09dd5a9ac7778f`,
`cbor-minimal` `761302dad1073c841397f6c88d595b114af8d9ef`.
The schema 1 datum is preserved in `spikes/out/cbor-minimal-independent-review.lisp`.
