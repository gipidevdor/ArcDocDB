# Pubblicazione del control log — 2026-10-13

Compilazione e controlli statici. Le letture sono dell'autore, senza
indipendenza o qualifica C1. Nessuna esecuzione locale dei nuovi casi
funzionali, syscall, fault injection, stress o benchmark.

Il [catalogo](catalogo.lisp) conserva report, sidecar e sorgenti degli helper
come dati. Ogni record identifica ambiente, argv, snapshot sorgenti e output.
Il disassemblato non misura heap, latenza, contesa o costi transitivi.

La compilazione iniziale precede il commit dei sorgenti `0c40d22`:
quel commit conserva gli stessi sorgenti di prodotto e ASDF della fotografia,
con la documentazione della base ancora invariata. I record successivi
distinguono la documentazione aggiornata e le eventuali integrazioni.

[Contratti e decisioni](../../../docs/implementazione/pubblicazione-control.md).

## Risultati della versione integrata

- Compilazione SBCL riuscita; warning trattati come errori salvo ridefinizioni
  previste dal caricamento forzato.
- Stile: 198 file, zero violazioni.
- Tracciabilità regolare; gli scenari FI sono riferimenti, non esecuzioni locali.
- Documentazione: 382 file, 2.806 link, zero collegamenti rotti.
- Evidenze: struttura, presenza, dimensioni e integrità compressa regolari.
- Sette record di processo con sorgenti stabili. L'[audit](audit-byte.lisp)
  confronta quattordici copie di report/sidecar: stessi byte e SHA256 degli originali.

La versione integrata conserva il bootstrap ACTIVE vuoto delle altre chat.
Il disassemblato mostra il CAS locale del publisher e il confine nativo
`fstatat`; contiene anche percorsi di allocazione del runtime. Non ne deriva
una misura di costo o una qualifica delle nuove syscall.

## Chiusura dopo integrazione della suite GET ACTIVE

La suite GET ACTIVE delle altre chat è integrata conservando le due voci del
changelog. Non aggiunge esecuzioni locali dei nuovi casi del publisher.
Compilazione finale, collegamenti (390 file, 2.828 link) e controllo delle
evidenze sono riusciti, con snapshot sorgenti stabili. L'
[audit finale](audit-finale-byte.lisp), datato 2026-10-14, verifica tutte le
venti copie dei dieci record di processo: stessi byte e SHA256 degli originali.
