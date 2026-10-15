# Lettura del coordinatore — 2026-10-15

Ambito statico: `src/recovery-active/`, fixture dedicate, integrazione ASDF,
guardie CONTROL e driver C4. Le esecuzioni sono registrate separatamente;
questa lettura non le anticipa. Il codice C1 di prodotto resta quello della
base `5be241d8`; questa consegna aggiunge verifica e strumenti.

1. **Requisiti/ADR:** REQ-REC-001, TXM-005/007, AFF-008/009 e ADR-0037,
   0040/0041 coerenti con lettura readonly, prefisso e chiusura.
2. **Invarianti:** niente troncatura; scanner a EOF prima della semantica;
   esiti derivati esatti. Fixture positive, code e rifiuti dedicati.
3. **Errori:** condizioni tipizzate; FI private seriali ripristinate,
   originale fsync conservato e nessun risultato parziale consegnato.
4. **Limiti:** file/eventi finiti; scanner e attraversamento bounded;
   attese del solo benchmark cooperative, quiescenza prima di cleanup.
5. **Allocazioni:** percorso di apertura con workspace e array. Misura
   heap dell'intero processo pianificata; nessuna promessa di heap zero.
6. **Dati verificati:** header writer e file distinti precedono il corpo;
   scanner precede risoluzione, risultato possiede gli esiti ordinati.
   EOF, completezza e appartenenza della tabella restano precondizioni.
7. **Decisioni:** tabella ARV-D01..14 preesistente; casi nelle tre suite.
   Restano guardie interne e condizioni senza campagna MC/DC completa.
8. **Ownership:** backend/FD/scratch per fixture; risultati immutabili;
   nel benchmark solo gate e canale errori sono condivisi.
9. **Tracciabilità:** nomi REQ nei test, `trace-write` registrato;
   compilazione e `make check` da giudicare dai produttori conclusi.
10. **Regole:** safety 3, nessuna modifica del formato o dipendenza.
    Costruttore CONTROL privato usato soltanto per prove dei tipi.
11. **Parallelismo:** fixture indipendenti, nessun lock tra Serie nel
    prodotto. Mutex del solo harness comunica condizioni del benchmark.
12. **Durability:** bridge verifica CLOSED/P/esiti prima del claim;
    publisher canonico decide con rename e conferma con fsync parent.

Durante la lettura sono stati corretti refusi di package, percorso output
del driver e stamp delle PUT ordinarie della fixture benchmark. Non sono
fallimenti eseguiti: i primi runtime avvengono dopo questo freeze.

La revisione indipendente richiesta all'agente non è stata consegnata:
vedi `revisione-indipendente.md`. Nessuna chiusura del gate C1 è dichiarata.
