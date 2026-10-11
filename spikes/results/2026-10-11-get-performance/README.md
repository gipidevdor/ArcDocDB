# Prestazioni e stress integrati del percorso GET

Campagna locale del 2026-10-11 su GET corrente, indice con seme XXH64,
cache e file readonly. Il nucleo era già integrato su `65972a4`.
Le esecuzioni avvengono dopo un commit che congela prodotto, suite e strumenti.
Ogni processo è avvolto dal registro strutturato; fallimenti e sorgenti cambiati
restano conservati e non diventano risultati positivi.

## Piano preregistrato

- Suite prestazioni GET complementare alla verifica funzionale separata, con record v1/v2,
  cache opzionale, CSN interi a 64 bit e controlli degli oracoli.
- Esiti correnti e snapshot, frontiere, identità, ordine delle fasi e alias.
- Cleanup su errori e uscite non locali; scratch esclusivi e letture parallele.
- Compilazione senza avvisi, controlli del repository, copertura SBCL e mutanti
  isolati che distinguono fallimento semantico da errore di infrastruttura.
- [Metodo dei benchmark](../../../docs/implementazione/get-performance-metodo.md):
  conteggi fissati prima delle misure, finestre seriali e gruppi 1/2/4 worker,
  cache hit, file con page cache calda e assenza della chiave.
- Revisione indipendente statica e registro esplicito dei limiti rimasti.

## Conservazione

`catalogo.lisp` conserva i record e i file grezzi con SHA256. Oltre 1 MiB,
i dati grezzi vengono compressi senza perdita e verificati dopo espansione.
Cache compilate e copie complete ricostruibili del checkout sono escluse.
Queste prove riguardano il nucleo GET: resolver storico, scheduler, protocollo,
durability del database e qualifica completa C1 rimangono integrazioni distinte.

## Risultati e chiusura

[Risultati](risultati.md): regressione riprodotta prima della correzione,
19 test dedicati, sette mutanti e 14,4 milioni di GET misurati.
I sorgenti del commit misurato `df8b98e` sono identici a quelli integrati con
main, esclusi gli artefatti in `spikes/results/`; il confronto statico è registrato.
Gli audit conclusivi del catalogo e delle dimensioni sono conservati anche
come registri separati: osservano il catalogo già chiuso, senza autoriferirsi.
