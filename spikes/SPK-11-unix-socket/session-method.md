<a id="sessione-m16--metodo-preregistrato"></a>

# M16 session — preregistered method

SPK-11 variant, October 17, 2026. Preparatory verification of contract proposed in
[ADR-0056](../../docs/adr/0056-sessione-locale-m16.md), before product M16 code.
REQ-IPC-002/004 and REQ-VAL-001. Code remains C4.

<a id="domande-e-oracoli"></a>

## Questions and oracles

1. HELLO/WELCOME: independent binary fixtures, exactly five elements,
   version/kind/ID/code, maps with exact ordered keys, minimum/maximum capacities.
   Negotiation is minimum of limits, without amplification.
2. Validation: product minimal codec for syntax/UTF-8; separate pass for lexicographic
   key-byte order, including nested maps. No Lisp reader on external input.
   Checked profile uses control messages within 4096 bytes; defines no data command.
3. Session: no request before WELCOME sent; positive strictly increasing u64 IDs,
   including after completion. Reversed responses, one terminal response, credit
   retained until complete send. Maximum ID permits only draining before reconnection.
4. Limits: prefix before body, in-flight capacity, result budgets, two independent
   owners. Saturation changes neither ID nor admitted state. Injected logical clock:
   absolute deadlines, partial progress without renewal.
5. Gate: simulated indicator rejects PING with `unavailable` and performs no work;
   C4 oracle only. Not a recovery attestation.
6. Two real processes: fragmented HELLO, negotiation, coalesced requests, reversed
   responses; invalid sessions closed without application response.
   Retain argv, PIDs, outcomes, stdout/stderr as in existing exchanges.

<a id="controlli-negativi-e-conservazione"></a>

## Negative controls and preservation

Every rejection family requires expected reason. Known mutations must show oracle
sensitivity to announced capacities, response ID, credit released before send,
and renewed deadline. Retain compilations and failed attempts with actual sources.
Results separate from previously closed campaign.

<a id="confini"></a>

## Boundaries

Test concerns session control, without document AST or GET/PUT commands, publication,
commit, EBR retirement, or product dispatcher. Map pass checks order and duplicates
of encoded bytes; no application key/tag semantics inferred.
Maximum depth 8 concerns arrays/maps; tag sequences traversed iteratively.
No native-heap, RSS, latency, or throughput measurement. ADR-0056 acceptance,
preallocated I/O adapter, real engine gate, distinct-UID access, and Linux qualification
remain pending. IPC requirements remain designed.
