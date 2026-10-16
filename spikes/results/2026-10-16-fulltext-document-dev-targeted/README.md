# Preparazione full text dei documenti — 16 ottobre 2026

Perimetro: [API documentali](../../../docs/implementazione/full-text-documenti.md)
e [decisioni C1](../../../docs/implementazione/full-text-documenti-decisioni.md).
Il primo impiego rimane il database di un server NNTP Usenet in Common Lisp;
la fixture usa subject e body, con ulteriori prove su headers.subject.

Il [registro mirato di sviluppo](report.lisp) di `make fulltext-check lint trace`
ha stato `:ok`, sorgenti `:stable`, exit code 0. Precede l'ultima lettura, che
ha aggiunto la guardia pubblica del bound fisso e il relativo controllo negativo,
contabilizzato entrambi i passaggi sulle testate CBOR e verificato il file con ID
di generazione massimi. Le prove finali sono conservate separatamente.

I 17 nuovi test, aggiunti ai 39 precedenti, includono:

- Fixture CBOR manuale di 25 byte, congelata prima del primo parsing: U=145,
  staging=73, testo=9 byte. Identita di output su 32 prefissi; 25 troncamenti rifiutati.
- Percorsi annidati, chiavi vuote, tipi presenti errati, duplicati selezionati,
  Unicode, chiavi complesse e tagged; validazione UTF-8 anche fuori dagli indici.
- Budget cumulativi su tutti i campi, staging e limite del file; cancellazione
  in sette fasi, rilascio dei prestiti e riuso dopo errore.
- Profondita 100, 16 campi con ID fino a 65535, configurazione copiata e ID u64 massimi.
- 115200 confronti indipendenti su run e file; 128 bound confrontati con il serializzato.
- Quattro task con configurazione/input readonly condivisi, contesti privati e rendezvous limitato.
- Mille preparazioni con ricerca, dopo warm-up, a zero byte consed sullo heap
  misurato su SBCL 2.6.9 arm64, anche con ID e limiti u64 massimi.
- Otto mutanti semantici rilevati in totale, due nuovi su selezione e costo dei duplicati.

## Prove sul prodotto finale

- [Verifica mirata finale](../2026-10-16-fulltext-document-targeted/report.lisp):
  `make fulltext-check lint trace links`, stato `:ok`, sorgenti `:stable`,
  39,444105 secondi. Tutti i 56 test e gli otto mutanti; 314 file di prodotto
  senza violazioni del linter. Precede la sola integrazione documentale di ADR-0055.
- [Copertura diagnostica](../2026-10-16-fulltext-document-coverage/catalogo.lisp):
  stato `:ok`, sorgenti `:stable`, 39,994756 secondi, sul commit `fd4ffcb2`.
  Conservati stato SB-COVER e HTML originali come dati compressi, senza caricarli
  come codice. Quattro test di allocazione esclusi dalla strumentazione e misurati
  separatamente. Le righe non percorse, inclusi errori interni e costruttori,
  restano visibili: non si dichiara MC/DC completa o qualifica C1.
- [Verifica completa locale](../2026-10-16-fulltext-document-final-check/report.lisp):
  `make check`, stato `:ok`, sorgenti `:stable`, exit code 0, 579,497503 secondi
  sul commit `fd4ffcb2`. Inclusi 56 test full text, otto mutanti, compilazione,
  lint, tracciabilita, link, autocontrolli delle prove e dieci spike. Verificati
  222 cataloghi, 3901 riferimenti, 46686 file e 1243930320 byte conservati;
  il catalogo di questa stessa esecuzione viene aggiunto dopo il controllo.
- [CI Linux](../2026-10-16-fulltext-document-ci-linux/report.lisp),
  [esecuzione GitHub](https://github.com/gpicchiarelli/ArcDocDB/actions/runs/38947465706):
  `make check`, stato `:ok`, sorgenti `:stable`, exit code 0, 306,049575 secondi.
  Confrontata per uguaglianza l'intera lista dei blob sorgente con la prova locale.
  Verificati nel registro anche zero byte consed per 1000 preparazioni/query
  con ID 1 e UINT64_MAX, 115200 confronti e tutti gli otto mutanti.
- [CI macOS](../2026-10-16-fulltext-document-ci-macos/report.lisp):
  stessa esecuzione GitHub, `make check`, stato `:ok`, sorgenti `:stable`,
  exit code 0, 529,092237 secondi. Stesso confronto completo dei blob e degli
  attesi su allocazioni, confronti indipendenti e mutanti, tutti riusciti.

I registri CI riguardano il prodotto al commit `fd4ffcb2`; il commit conclusivo
di conservazione aggiunge soltanto prove e questo riepilogo. Nessuna nuova
campagna di prodotto e stata avviata durante la chiusura coordinata.

## Tentativi conservati

| Catalogo | Esito e causa |
|---|---|
| [Build iniziale](../2026-10-16-fulltext-document-build-syntax-failure/catalogo.lisp) | Fallito: parentesi mancante nel selettore dei valori; corretta |
| [Build prodotto](../2026-10-16-fulltext-document-build/catalogo.lisp) | Riuscito |
| [Lambda helper](../2026-10-16-fulltext-document-test-lambda-failure/catalogo.lisp) | Fallito: style-warning per optional/key insieme nell'helper C4; corretto senza modificare il prodotto |
| [Sintassi test](../2026-10-16-fulltext-document-test-syntax-failure/catalogo.lisp) | Fallito: parentesi mancante nel test del costo; corretta |
| [Prime prove](../2026-10-16-fulltext-document-first-tests/catalogo.lisp) | Tredici test iniziali riusciti |
| [Fixture concorrente](../2026-10-16-fulltext-document-thread-fixture-failure/catalogo.lisp) | Fallito: closure dei thread catturava la stessa variabile di LOOP e condivideva un task; corretto con binding privato e rendezvous prima dell'avvio |

Nessuna di queste prove certifica ammissione del writer, legame ai byte del PUT,
pubblicazione prima di H/ACK, durata del task, MVCC o Query Engine. Il modulo non
verifica il contratto completo della Serie, l'ordine di tutte le mappe o le chiavi
duplicate estranee ai percorsi. Il run restituito e preso in prestito, non un delta
pubblicato. Nessun benchmark NNTP o promozione dei requisiti complessivi.
