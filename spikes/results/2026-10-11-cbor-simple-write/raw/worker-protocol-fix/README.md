# Correzione del protocollo delle due ondate

Revisione statica del 2026-10-11, autorizzata dal coordinatore dopo il
congelamento del nuovo corpus REQ-CBR-003. Non sono stati eseguiti reader,
compilazioni, test o campagne per questa correzione. Questo record non
aggiunge risultati runtime ai precedenti archivi, che restano immutati.

Nel precedente test delle stringhe, GO e DONE erano condivisi tra le due
ondate. Dopo il rilascio di due permessi, un worker veloce poteva terminare
l'ondata zero e consumare il secondo permesso iniziando l'ondata uno,
prima che l'altro worker iniziasse l'ondata zero. Due DONE dello stesso
worker potevano quindi essere conteggiati dal padre come completamento
della prima ondata, provocando falsi fallimenti o timeout dipendenti dallo
scheduling. Le verifiche delle celle di entrambi i worker non giustificano
un'affermazione di falso PASS: il rilievo riguarda il protocollo della fixture.

La modifica minima sostituisce READY/GO/DONE con vettori di due semafori,
uno per ondata. Worker e padre accedono solo al semaforo della propria
ondata. Il cleanup rilascia entrambi i GO prima del cleanup limitato già
esistente. Fixture, sorgente condivisa, destinazioni, sink, numero di
worker/ondate/item, confronti, attese e join restano uguali.

Gli originali esatti `.before.lisp`, le copie `.after.lisp` e il diff
`worker-protocol.patch` sono conservati in questa directory ignorata.

| File tracciato | Blob prima | Blob dopo |
| --- | --- | --- |
| tests/codec/cbor-string-write-support.lisp | e45437a508fc7893c4df06f3129ab064d3a4dbdd | 5a7f38de22be659787305441b65c689de4bd6dba |
| tests/codec/cbor-string-write-threads.lisp | 33c7e6a9a0d6bbd551d4171ece6681b66bf87657 | 43c4b1ffe8c3dee1a37e9f7b07f655ec3959896b |

SHA256 delle copie, coincidenti con i file tracciati corrispondenti:

- support prima: 611ec1d825855d9df27988821ee45f0ecf81fbd3128a38df6ee5c727551cd9f2
- support dopo: 2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39
- threads prima: d45b4dda658a96b9af9051b152df2b17859aecdbb9131505d1a2689b27ffb88a
- threads dopo: 8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d
- diff: 7a1852177f1e84101406dd15e9e0e67995d3fc7e384d9004bb81496888785481

Il precedente `tests/codec/cbor-write-threads.lisp` ha una sola ondata:
ogni worker consuma una volta GO, poi termina. Non ha il rischio sopra e
non è stato modificato: blob 878f0fa10825ae3d49e9cac2f94d9992c06f2d20,
SHA256 7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb.

I tre nuovi file ciechi REQ-CBR-003 sono rimasti immutati durante il fix:
support 10979b4a89af0b00d48abbc7bf6760afc3b5aa9b,
seriale efaa31b8ea2d74af162fd00a3b4e923ae5f60cdd,
threads a7bee65793fc3a3e0c89c9c73871d7c183669a3e.

La lettura del diff conferma soltanto la separazione dei semafori per
ondata; la verifica runtime del protocollo corretto resta pendente e
appartiene alle campagne del nuovo incremento.
