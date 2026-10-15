# Verifica del contratto full text — 2026-10-15

L'autore ha confermato di completare la progettazione senza sviluppare codice.
[ADR-0054](../../../docs/adr/0054-contratto-e-formato-full-text.md) introduce il
[contratto operativo](../../../docs/full-text.md) e il
[formato binario](../../../docs/formato-indice-full-text.md): profilo Unicode,
query, ownership, generazioni, pubblicazione, riserve, budget e accettazione.
I quattro requisiti aggiuntivi restano `:progettato`.

Il [record del controllo completo](report.lisp) è la copia originale prodotta
da `make check`, che registra l'esecuzione di `make check-core`. Conserva
ambiente, comando, impronte dei sorgenti e output integrale, inclusi i casi
negativi dei controlli esistenti. Il descriptor e il payload gzip mantengono
i nomi e i byte originali; anche [conservazione.lisp](conservazione.lisp)
è copiato senza modifiche.

- Base Git: `61941edb27807f644127614b8a23d782e83328b2`, con le modifiche
  documentali elencate nel record.
- Origine: `spikes/out/4001084944-command-30723-0/`.
- Esito `:OK`, exit 0; 1.008 sorgenti `:STABLE` fra inizio e fine.
- Durata complessiva: 558,323313 secondi, non una misura del motore.
- Linter: 245 file, zero violazioni.
- Tracciabilità: 130 requisiti, 68 invarianti, 13 scenari FI, 54 ADR; zero errori.
- Collegamenti: 714 file, 3.476 link, zero rotti.
- Eseguiti anche test esistenti, controlli degli strumenti e delle evidenze,
  esperimenti in modalità di correttezza; nessun benchmark full text.

La matrice era stata rigenerata con `make trace-write`. Nessuna modifica
a codice di prodotto, test, strumenti o registrazione ASDF fa parte di questa
campagna progettuale. Il controllo completo attesta lo stato del repository,
non l'implementazione o la qualifica del full text. Fixture binarie, corpus
Unicode, modelli di concorrenza, fault injection e misure della fase 8 restano
da realizzare secondo il contratto e il piano di verifica.
