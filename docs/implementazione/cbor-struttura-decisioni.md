<a id="decisioni-della-scansione-strutturale-cbor"></a>

# CBOR structural-scanning decisions

Static inventory on kernel frozen before campaigns. The 20 new compound
decisions are listed below; unchanged CBOR headers and UTF-8 retain
their own inventories. Lines refer to the snapshot from the
[second reading](cbor-struttura-revisione.md). No guard is removed from the
coverage denominator. Fixtures indicate verification intent;
condition and branch outcomes remain to be acquired. This is not
MC/DC qualification and no exclusions are approved.

Fixtures are in `tests/codec/cbor-structure.lisp`; name prefix is
`test-REQ-AFF-004-cbor-structure-` or `test-REQ-AFF-008-cbor-structure-`.
"Internal defense" indicates a state that must not be produced by the public
path when respecting types, ownership, and helpers; this classification does not prove
unreachability or replace raw coverage.

| ID | File, function, and line | Decision conditions | Fixture or limit |
|---|---|---|---|
| D01 | `cbor-space.lisp`, `crea-spazio-cbor`, 40 | kinds length 102; remaining length 102 | Factory exercised by every fixture; incorrect capacity outcome is internal defense, still in denominator. |
| D02 | same file/function, 43 | top zero; depth zero; distinct arrays | Factory and private workspaces; incorrect initial state is internal defense. |
| D03 | `cbor-scan-input.lisp`, `check-limiti-struttura-cbor`, 11 | max-bytes index; max-bytes within 16 MiB | `limit-configuration-and-order`, `byte-budget-and-exact-16-mib`: type, negative, maximum, and maximum+1. |
| D04 | same function, 13 | max-nodes index; 1 <= max-nodes <= 16 MiB | `limit-configuration-and-order`, `node-boundaries-chunks-and-breaks`: type, zero, maximum, and maximum+1. |
| D05 | same function, 15 | max-depth index; max-depth <= 100 | `limit-configuration-and-order`, `depth-100-and-map-keys`: type, negative, zero, 100/101. |
| D06 | `check-input-struttura-cbor`, 26 | simple octets buffer; start index; end index; start <= end <= length | `invalid-range-and-type-priority`: generic, signed, adjusted, fill-pointer, displaced buffer; every invalid endpoint, reversed range, zero offset, and empty span. |
| D07 | `cbor-scan-stack.lisp`, `tipo-frame-cbor`, 13 | kind <= 6; kind zero iff top zero | Corpus with all frames; incompatible kind/position is internal defense. |
| D08 | `depila-frame-cbor`, 25 | array/map kind 1..4; depth zero | Array/map and string closure, depth 100, and string supplement in slot 101; inconsistent depth is internal defense. |
| D09 | `empila-frame-cbor`, 39 | kind <= 4; depth >= fixed maximum 100 | `depth-100-and-map-keys`; public guard precedes push, invariant outcome is internal defense. |
| D10 | `inizia-figlio-cbor`, 60 | root/definite kind <= 2; remaining zero | `tags-charge-parent-once`, definite and indefinite arrays/maps; consumption beyond arity is internal defense. |
| D11 | `svuota-frame-cbor`, 102 | definite kind <= 2; remaining zero | Empty/nonempty containers and root, indefinite forms closed with break; `rfc-definite-vectors`, `rfc-indefinite-vectors`. |
| D12 | `cbor-scan-items.lisp`, `check-contesto-cbor`, 15 | form break; major other than 7 | Break and ordinary items; inconsistent header combination is internal defense of header contract. |
| D13 | same function, 18 | indefinite-string frame kind >= 5; non-break form | `chunks-same-type-and-header-first`, `node-boundaries-chunks-and-breaks`: chunks and breaks in strings; items outside strings. |
| D14 | same function, 19 | form argument; major equals kind-3 | Valid definite bytes/text chunks, wrong major, and nested indefinite string; `chunks-same-type-and-header-first`. |
| D15 | `chiudi-break-cbor`, 36 | indefinite-map kind; positive remaining | `break-context-and-tag-priority`: even/odd maps, arrays/strings; pending tag rejected first. |
| D16 | `apri-contenitore-cbor`, 77 | high zero; low <= minimum remaining bytes (array: room, map: floor(room/2)) | `container-minimum-remaining-bytes`, `payload-width-and-huge-unsigned-lengths`: exact arity, missing, and nonzero high. Depth checked first. |
| D17 | `verifica-stringa-cbor`, 100 | high zero; low <= end-next | Empty/full strings, truncated payload, and huge u64 words; `valid-unicode-and-chunk-locality`, `payload-width-and-huge-unsigned-lengths`. |
| D18 | `cbor-scan.lisp`, `passo-struttura-cbor`, 26 | lead < cursor after step; cursor <= end | All public fixtures, truncations, fuzz, and corpus; violations are internal defense. |
| D19 | `risultato-struttura-cbor`, 38 | 1 <= nodes <= max-nodes; peak-depth <= max-depth | `node-boundaries-chunks-and-breaks`, `depth-100-and-map-keys`, depth-zero scalar; over-budget result is internal defense. |
| D20 | same function, 41 | top zero; depth zero; no pending tag | Completed items and mixed tags/chunks/containers; residual state on success is internal defense. |

Simple selections also preserve contractual precedence:

| Sequence | Observable order to verify |
|---|---|
| Preflight | range → workspace → alias EQ kinds → byte-limit → node-limit → depth-limit → byte-budget; before reset, even on empty span. |
| Item | header → chunk context → break or node-budget → child consumption → payload/container. |
| Break | pending tag → non-indefinite frame → map with missing value → close one frame. Break does not count as node. |
| Container | node-budget already checked → depth-budget → high/low/minimum arity → push. For map, multiplication 2N follows comparison with floor(room/2). |
| Text | complete payload available → UTF-8 per chunk → advancement. Header and UTF-8 propagate primitive reason/offset. |
| Root | drain definite frames → trailing check without reading next byte → three values after postconditions. |
| Tag | node counted and pending; no frame or child charged until non-tag terminal begins. |

Simple guards, `otherwise` in `case`, loop fallback, and capacity/progress
conditions also remain in source and denominator. Inventory
does not restrict future coverage to public errors or the 20 decisions.
