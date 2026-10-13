# Nuovo segmento writer — 2026-10-13

Compilazione del prodotto e controlli statici locali. Le due letture sono
dell'autore, senza indipendenza o qualifica C1. Nessuna esecuzione locale di
test funzionali, fault injection o benchmark del nuovo componente.

Il [catalogo](catalogo.lisp) conserva report e sidecar dei processi, con argv,
ambiente, snapshot dei sorgenti e output. Gli helper sono conservati come testo
Common Lisp. Il disassemblato descrive il codice locale; non misura allocazioni,
latenza o costo transitivo delle chiamate.

## Risultati della versione integrata

- Compilazione SBCL del prodotto: riuscita, con warning trattati come errori
  salvo quelli di ridefinizione previsti dal caricamento forzato.
- Stile: 178 file, zero violazioni.
- Tracciabilità: 118 requisiti, 65 invarianti, 13 scenari FI e 52 ADR,
  zero errori di collegamento. Gli scenari non sono stati eseguiti localmente.
- Documentazione: 361 file e 2.683 link, zero collegamenti rotti.
- Evidenze: struttura, presenza, dimensioni e integrità compressa regolari;
  nessuna reinterpretazione dei risultati o promozione dei requisiti.
- Undici record di processo conservati; [audit dei byte](audit-byte.lisp)
  su 22 copie di report e sidecar: lunghezze e SHA256 identici agli originali.

Il controllo finale del catalogo e dei link, dopo questa conservazione, è
riuscito. I due report aggiuntivi portano a tredici i record di processo:
l'[audit finale](audit-finale-byte.lisp) verifica le 26 copie complessive,
con gli stessi criteri di lunghezza e SHA256.

I record identificano gli snapshot dei sorgenti prima e dopo ogni comando,
risultati stabili in entrambe le campagne. La
[ricostruzione iniziale](ricostruzione-iniziale.lisp) conserva il diff esatto
rispetto alla base precedente all'integrazione delle altre chat. La versione
integrata include l'ordine alias-prima-dei-range e il legame al registro CSN
canonico dell'Archivio.

I [contratti e le decisioni](../../../docs/implementazione/inizializzazione-active.md)
distinguono preparazione durevole, EDIT autorevole e integrazione del server.
