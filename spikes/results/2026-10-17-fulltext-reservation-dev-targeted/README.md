# Riserve full text del writer — 17 ottobre 2026

Perimetro: [riserve locali](../../../docs/implementazione/full-text-riserve.md),
[metodo e decisioni](../../../docs/implementazione/full-text-riserve-metodo.md).
Il riferimento applicativo rimane NNTP Usenet in Common Lisp, con fixture subject/body.

Il [primo registro mirato](report.lisp), `make fulltext-check lint trace`, ha stato
`:ok`, sorgenti `:stable`, exit code 0 e 38,688033 secondi. Include 56 test precedenti
e 18 nuovi test, dieci mutanti semantici e 323 file di prodotto senza violazioni.
Due misure di 1000 prenotazioni/copie/query/cancellazioni dopo 100 warm-up hanno
zero byte consed su SBCL 2.6.9 arm64, con ID 1 e UINT64_MAX. Non sono misure di latenza o RSS.

Questo registro precede la seconda lettura: nomi e larghezze della copia sono stati
allineati alle costanti esistenti e si e aggiunto un diciannovesimo test per il rifiuto
dell'ultima configurazione, dopo che la prima entra, su token e bound del file.
Le verifiche finali vengono conservate separatamente.

La prima esecuzione di [make check](../2026-10-17-fulltext-reservation-check-syntax-failure/catalogo.lisp)
e la raccolta di [copertura](../2026-10-17-fulltext-reservation-coverage-syntax-failure/catalogo.lisp)
si sono fermate sulla stessa parentesi in piu nel nuovo diciannovesimo test.
Entrambi i registri originali, con sorgenti stabili ed esito fallito, sono conservati.
Corretto soltanto il test; nessun errore del prodotto e stato nascosto o riclassificato.

La [copertura diagnostica finale](../2026-10-17-fulltext-reservation-coverage/catalogo.lisp)
ha stato `:ok`, sorgenti `:stable`, exit code 0, 35,838443 secondi, sul commit `8363286c`.
Lo stato SB-COVER e gli HTML sono conservati come stringhe originali in un payload
compresso verificabile: scope `src/fulltext/` e `src/fulltext-admission/`.
Cinque test di allocazione sono esclusi dalla strumentazione e misurati separatamente.
Non si dichiara copertura MC/DC completa; le righe non percorse rimangono visibili.

La [verifica completa finale](../2026-10-17-fulltext-reservation-final-check/report.lisp),
`make check`, ha stato `:ok`, sorgenti `:stable`, exit code 0, 748,601166 secondi,
sul commit `8363286c`. Superati 75 test full text (19 delle riserve), dieci mutanti,
compilazione senza avvisi, lint, tracciabilita, link, autocontrolli delle evidenze e
dieci spike. Il controllo ha verificato 235 cataloghi, 3940 riferimenti, 46782 file
e 1250847081 byte conservati; il catalogo della stessa esecuzione viene aggiunto dopo.
Confermati anche zero byte consed per le mille operazioni con ID 1 e UINT64_MAX.
I blob completi dei sorgenti coincidono con quelli della copertura finale.

Il commit conclusivo aggiunge solo conservazione e riepilogo. Questa raccolta non
contiene una nuova esecuzione CI Linux/macOS delle riserve: la pubblicazione completa
e la verifica del ramo integrato restano alla chiusura coordinata in main.

Oracoli: fixture CBOR/attesi manuali, confronto delle tre regioni copiate dei run,
256 confronti indipendenti dei bound su 128 operazioni, budget cumulativi a limite e
limite meno uno, sedici generazioni, 64 punti di cancellazione e quattro writer
indipendenti con rendezvous limitato. Fonti perse e interruzione durante l'adozione
portano FAULTED e conservano i riferimenti; non si dichiara fault injection completa.

La riserva e la copia non dimostrano binding agli esatti byte PUT, validazione generale
di Serie, append/SEAL/PREPARE, risoluzione dei prepared, H/ACK, MVCC o quiescenza.
I costi trasferiti non sono cancellabili o recuperabili da questa API. Il caller
mantiene la canonicalita del pool e deve contare anche tutte le altre viste/pool.
Requisiti complessivi ancora progettati, nessuna qualifica C1 o MC/DC completa.
