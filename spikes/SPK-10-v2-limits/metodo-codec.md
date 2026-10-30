<a id="spk-10--metodo-del-codec-v1v2"></a>

# SPK-10 — v1/v2 codec method

> **Proposal** — Isolated experiment, registered before execution. The method verifies the codec; it does not certify the v2 gate or engine.

<a id="domanda-e-riferimenti"></a>

## Question and references

Do the 24-byte frame and 24-byte hint entries preserve the distinct v1/v2 layouts, check ADR-0048 limits, and reject inconsistent data before returning a value offset?

References: [CONTRIBUTING.md](../../CONTRIBUTING.md), ADR-0039, ADR-0047, ADR-0048, `docs/formati-su-disco.md`, coding standards. Traceability: REQ-LIM-001/003, REQ-FOR-003/004, REQ-AFF-002/008. Parts of these requirements concerning index, CBOR, migration, and durability belong to other modules.

<a id="ambiente-e-perimetro"></a>

## Environment and scope

Common Lisp, SBCL 2.6.9, `safety 3`, no external library. The runner first loads `arcdocdb.spk09`, from which this module uses only the exported kernel `crc32c-slicing8-safety3`. Independent package `arcdocdb.spk10.codec`; code in `codec.lisp`. No persistent I/O, lock, or shared mutable state. Serialization is exclusively that of the individual local check; the harness measures modules serially.

The caller supplies the version from the already verified file header: only integers 1 and 2, no inference from bytes. Documents are simple octet vectors; CBOR validation is the CBOR module's responsibility before the writer. Prepared records are rejected with `:prepared-not-supported`, without returning a value. Prepared hints can be represented as metadata and do not constitute OUTCOME proof.

<a id="api-proposta"></a>

## Proposed API

```lisp
(costruisci-record versione chiave valore csn
  &key (tipo :put) (flag 0)
       (massimo-chiave 65535) (massimo-valore 16777216)
       (massimo-record nil))
;; => simple octet vector, complete record

(verifica-record versione buffer inizio fine chiave csn totale-atteso
  &key (tipo :put) (flag-entry 0)
       (massimo-chiave 65535) (massimo-valore 16777216)
       (massimo-record nil))
;; => values inizio-valore fine-valore csn-verificato
;; INIZIO/FINE delimit exactly one record, interval [inizio,fine).
;; FLAG-ENTRY is 0 or 1 (prepared); the versioned contract is in the record.

(costruisci-hint-entry versione offset lunghezza csn key-off key-len
  &key (tipo :put) (flag 0)
       (massimo-chiave 65535) (massimo-valore 16777216)
       (massimo-record nil))
;; => vector of 24 octets

(verifica-hint-entry versione buffer inizio fine
                     lunghezza-chiavi lunghezza-segmento
  &key (massimo-chiave 65535) (massimo-valore 16777216)
       (massimo-record nil))
;; => plist :offset :lunghezza :csn :key-off :key-len :tipo :flag :prepared
;; The caller supplies sizes of already verified sections.

(check) ;; => plist :status :ok, counts and limits actually verified
(benchmark &key (secondi 0.25d0)) ;; => plist, requested duration <= 3 seconds
```

Exported conditions derive from `codec-error`: `parameter-invalid`, `limit-exceeded`, `record-invalid`, `hint-invalid`, `check-failed`. `codec-error-reason` exposes a stable keyword. Unknown version, reserved flags, and prepared records also have explicit rejections. For v1, effective maximum key length is `min(massimo-chiave,255)` and maximum record length `#xffffff`; for v2, they are 65,535 and 16,842,775. A configured record maximum cannot exceed the format maximum. Before allocating a record, value length, key, total, and semantics are checked. PUT requires at least one document byte; TOMBSTONE an empty value. Allowed record flags: 0/4; 1/5 recognized but prepared rejected; compression and other bits rejected. Hint: flags 0/1, PUT/TOMBSTONE types.

v1 hint layout: offset at 0, len at 4, csn at 8, key-off at 16, u8 key-len at 20, type at 21, flag at 22, reserved zero at 23. v2 layout: same first four fields, u16 key-len at 20, type at 22, flag at 23. Entries have no individual CRC: this API does not replace hint file section verification.

<a id="verifiche-bounded-pianificate"></a>

## Planned bounded checks

- Keys 1/255/256/65,535 accepted in v2; 65,536 and zero rejected. V1 accepts 1/255 and rejects 256/65,535/65,536. Lower configured limits checked in both construction and reading.
- Maximum fixture: deterministic CBOR bytestring `5a 00 ff ff fb`, 16,777,211-byte payload, total CBOR 16,777,216. Construction and reading with full CRC, key 65,535 and total 16,842,775. A 16 MiB + 1 document rejected; construction checks the limit before record allocation. V1 retains its total limit, including a case exactly `#xffffff`.
- Golden records with fields and positions fixed independently of the encoder for record and hint in both versions. Kernel CRC compared with local bitwise implementation and known vector `123456789`, on short intervals with different alignments. Bitwise reference remains bounded and does not scan maximum fixtures.
- Corruption of header/body CRC, v1 reserved byte, type, flags, lengths, key, and CSN; altered lengths with recalculated header CRC to reach semantic checks. Truncation at header/field/key/value boundaries and subvectors in buffers with prefix/suffix. Observable priority: header CRC before lengths; no offset returned before all comparisons.
- v1/v2 hints: fixed packing, v1 reserved zero, type/flags, overflow and offset/arena/segment boundaries, PUT/TOMBSTONE lengths, and configuration limits.

<a id="esecuzione-e-risultato"></a>

## Execution and result

CRC bytes for fixed golden records were precalculated with an independent bitwise Common Lisp script: short record header `(151 17 18 68)`, body `(114 157 69 8)`; v2 record with key 256 header `(245 56 11 210)`, body `(245 240 17 235)`. The script runs neither the module check nor a benchmark.

One SBCL process planned for strict check: strict compilation of SPK-09 support and `codec.lisp`, FASL loading, one `(check)` call. Warning and style-warning are fatal; all `compile-file` values are checked. FASL and temporary runner outside the repository; runner text included in the record to reproduce the command. No benchmark during this execution. The local result is reported in the next section.

Before execution, structured recording is prepared in `out/codec-check.lisp` (ignored artifact): plist with `:schema 1`, `:command`, `:environment`, `:source-blobs` (source Git blobs, without inserting them into the object database), `:compile-status`, `:result`, `:limits`, `:time`, `:stdout`, `:stderr`, `:failures`. Command and runner text are retained; warnings, failures, or conditions are recorded before exiting nonzero. The plist is reread with `*read-eval* nil`. The integrated record is versioned separately from the local report.

<a id="risultato-locale-del-2026-10-08"></a>

### Local result on 2026-10-08

> **Proposal** — Local experimental evidence: does not declare the v2 gate complete.

Only one strict check run. SBCL 2.6.9, SPK-09 and codec compilation without warning/style-warning (both counts zero), successful FASL loading. `(check)` returns `:status :ok` and **416 cases**:

| Group | Cases |
|---|---:|
| Differential CRC and known vector | 122 |
| v1/v2 golden records | 9 |
| Keys and TOMBSTONE | 21 |
| Maximum documents, caps, and large truncations | 27 |
| Malformed fields and CRC | 51 |
| Intervals and expected entry | 43 |
| v1/v2 golden hints | 6 |
| Hints, limits, and truncations | 101 |
| Unknown versions and parameters | 36 |

Accepted and verified with full-body CRC: **16,777,216-byte** CBOR document with **65,535-byte** key, **16,842,775-byte** v2 record; **16,777,215-byte** v1 record. The maximum CBOR fixture contains the five bytes `5a 00 ff ff fb` followed by 16,777,211 payload bytes. Rejected: 16 MiB + 1 document, declared length of 16 MiB + 1, key 65,536, lower caps, and prepared records.

Oversized document rejection precedes record `make-array`; the dedicated check also imposes a rejection allocation budget below 1 MiB. The SBCL counter reported `:rejection-bytes-consed 0` in this execution: this counter does not prove absence of every small allocation.

Retained record: [v2-codec-check.lisp](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/v2-codec-check.lisp), unchanged copy of local report `out/codec-check.lisp`, schema 1, faithfully reread with `*read-eval* nil`, no failures. Recorded process time **0.846542 s**, including metadata collection, compilation, and check: not a benchmark. Command: `sbcl --noinform --script /private/tmp/arcdocdb-spk10-codec.DFuRp6/strict-check.lisp`; complete runner text, environment, and Git hashes of both sources retained in the artifact. No benchmark run.

<a id="limiti-residui"></a>

## Remaining limits

CRC makes exercised alterations detectable and does not guarantee absence of collisions. Durability, file header, SEAL, OUTCOME, CBOR semantics, concurrent writer, and migration publication are not verified. Versions are selected exclusively by the caller; a v1 record with a zero reserved byte may have the same bytes as v2 with a short key. Version provenance is therefore essential and cannot be derived from the frame alone.

Integration obligations remain explicit: prepared unsupported by codec; hint section CRCs and file header verified by caller; CBOR validation in dedicated module; TOMBSTONE reading uses `:tipo :tombstone`, ordinary reading `:put`. The optional benchmark defaults to 0.25 s, maximum requested 3 s, and cap of 1,000,000 iterations; actual time may include the last operation and runtime. It expresses no timing guarantee or engine capacity.
