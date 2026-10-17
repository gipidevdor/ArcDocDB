# Legame PUT/WAL full text — 17 ottobre 2026

Perimetro: [API e limiti](../../../docs/implementazione/full-text-put.md),
[metodo e decisioni](../../../docs/implementazione/full-text-put-metodo.md).
NNTP Usenet in Common Lisp resta il primo impiego; fixture con Message-ID e subject/body.

Due tentativi di sviluppo si sono fermati in compilazione: il
[primo](../2026-10-17-fulltext-put-package-failure/catalogo.lisp) per l'uso esterno
di un simbolo interno del codec, il [secondo](../2026-10-17-fulltext-put-reader-failure/catalogo.lisp)
per una parentesi in piu nel test concorrente. Registri originali, senza modifiche,
con esito fallito e sorgenti stabili, conservati entrambi.

La [prova mirata](report.lisp), `make fulltext-check lint trace`, ha stato `:ok`,
sorgenti `:stable`, exit code 0 e durata 35,891765 secondi. Superati 91 test full text,
di cui 16 nuovi PUT/WAL, dodici mutanti semantici e lint. Due misure separate,
ID 1 e UINT64_MAX, hanno zero byte consed per mille operazioni
preparazione/riserva/append/query dopo cento warm-up su SBCL 2.6.9 arm64.
Non sono misure di latenza, throughput o RSS.

La seconda lettura ha poi portato la saturazione dell'incarnazione nel preflight
pubblico di riuso del lotto, prima della mutazione del controller di Serie.
Le verifiche finali sono conservate separatamente a completamento della raccolta.

Il [primo controllo completo](../2026-10-17-fulltext-put-check-interrupted/catalogo.lisp)
e stato interrotto esplicitamente dopo la segnalazione di tre aspettative fisse del
self-test CI ancora ferme a 49 suite, cinque suite full text e cinque esclusioni.
Il registro conserva exit 143, stato `:failed`, sorgenti `:stable` e 136,166153 secondi;
non e un controllo completo riuscito. Aggiornati i tre valori e i nomi dei casi a
50/6/6 senza eliminare suite, misure o controlli. Prodotto e test PUT invariati.

La [copertura diagnostica](../2026-10-17-fulltext-put-coverage/catalogo.lisp) sul commit
`d1b5363f19a17f1a99afc74122a9b41799194825` ha stato `:ok`, sorgenti `:stable`, exit 0
e 30,453031 secondi. Stato SB-COVER e HTML originali sono stringhe in un payload
compresso con hash e dimensioni verificabili. Include fulltext, admission, put e
WAL frame/builder/types; sei misure di allocazione escluse dalla strumentazione.
La correzione CI non modifica quei sorgenti, i test o il metodo di copertura.
Questa raccolta precede pero la successiva correzione del percorso CRC e non e la
copertura del prodotto finale.

Il [secondo controllo completo](../2026-10-17-fulltext-put-check-writer-crc-interrupted/catalogo.lisp)
e stato interrotto esplicitamente sul rilievo del body-CRC sotto lease writer:
exit 143, stato `:failed`, sorgenti `:stable`, 359,605769 secondi. Anche questo
registro originale resta conservato e non costituisce una verifica completa riuscita.
L'attestazione CRC/spans e stata spostata nel worker prima della consegna, con
generation privata richiesta sia dalla riserva sia dall'append. Il writer ora
controlla metadati e capacita e copia il frame senza scansioni del body.

La [prova mirata dopo la correzione](../2026-10-17-fulltext-put-worker-crc-targeted/report.lisp),
`make fulltext-check lint trace`, ha stato `:ok`, sorgenti `:stable`, exit 0 e
33,850694 secondi. Superati 93 test full text (18 PUT/WAL), tredici mutanti semantici,
lint di 339 file e tracciabilita. Il probe CRC dimostra il calcolo nel worker e
intercetta il vecchio percorso come controllo negativo; append di fixture con
padding 0/32768 byte senza scansioni CRC sotto lease. Confermati zero byte consed
nelle due misure di mille operazioni con ID 1 e UINT64_MAX.

L'incremento prepara memoria del lotto, senza I/O, assegnazione CSN, pubblicazione
documento/posting prima di H/ACK, esiti 2PC, vista MVCC o reclaim. Pool/log/configurazioni
canonici restano obbligo del runtime. Requisiti complessivi progettati;
nessuna qualifica C1, MC/DC o fault injection completa, nessuna nuova CI remota
in questa raccolta. Integrazione e pubblicazione spettano alla chiusura coordinata.
