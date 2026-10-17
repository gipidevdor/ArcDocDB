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
