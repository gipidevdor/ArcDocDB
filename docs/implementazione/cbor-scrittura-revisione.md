<a id="prima-lettura-c1-delle-testate-cbor-in-scrittura"></a>

# First C1 reading of CBOR header writing

Independent reading of blob `61f0d6e2783e4790ed7e19a45bba6407d6e5b3de`
before campaigns. The previous `02c5313d…` exceeded COD-13 in the public
wrapper: 11 paths. Preflight was extracted before compilation,
preserving the contract. No open static functional findings.

| C1 checklist | Static finding and dynamic verification required |
|---|---|
| 1. Requirement and ADR | REQ-CBR-001 derives from ADR-0014, AFF-004/008 for errors and boundaries; MT0..6 domain. |
| 2. Invariants | INV-F1/P6, exclusive destination and standard header; preflight and sentinels in independent corpus. |
| 3. Errors | Range/major/high/low/capacity before writing, offset NIL; internal invariant-violation without rollback. No handler. |
| 4. Limits | One dotimes of at most four steps, at most two words, nine bytes; no recursion or wait. |
| 5. Memory | No constructor, closure, or reassembled u64; heap allocation and positive sensor still to be measured. |
| 6. Output data | NEXT after range/progress, capacity before addition, lead within u8. |
| 7. Decisions | Four forms in the [inventory](cbor-scrittura-decisioni.md), without exclusions or MC/DC attestation. |
| 8. Ownership | Explicit OWNER/SHARED, exclusive buffer until return, no retained reference or global state. |
| 9. Integration | Export/ASDF/runner/requirement/matrix prepared; build/lint/trace/check to be acquired. |
| 10. Standard | safety3, FTYPE/docstrings/REQ; functions below 60 lines. Paths: selection9, word8, preflight8, public7, counting compound decisions and loop. |
| 11. Parallelism | No lock/wait/shared write between Serie; private workers verify concurrency, without scaling. |
| 12. Durability | No durable publication or deletion. Writing to exclusive buffer without atomicity promise. |

The physical-capacity mutation is expected to be detected as an incorrect
condition: the internal guard still prevents overrun. This is not a
test of writing outside span. MT1 receives wire argument `-1-n`; a valid empty
span reaches capacity checking. No implicit document limit.

The [second reading](cbor-scrittura-lettura.md) also evaluates the blind corpus.
The [results](cbor-scrittura-risultati.md) complete dynamic items;
static reading alone neither qualifies the product nor closes a gate.
