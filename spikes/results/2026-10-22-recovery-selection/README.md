# Selezione delle versioni — metodo preregistrato, 2026-10-22

[Contratto e decisioni](../../../docs/implementazione/selezione-versioni-recovery.md).

Incremento isolato da pubblicazione dei temporanei, CI e full text:
workspace per worker che seleziona una versione committed della chiave
secondo ADR-0042, con tombstone provvisorio e ambiguità non consegnabile.
Nessun cambiamento delle decisioni o dei formati persistenti.

Sorgenti e metodo vengono committati prima delle esecuzioni. Compilazione
forzata del **solo prodotto**, warning/style-warning fatali. Trace-write
prima di trace; lint, trace, link e disassemblaggio dopo la compilazione.
Nessuna API nuova viene chiamata funzionalmente. Ogni processo viene
registrato con sorgenti prima/dopo; report, sidecar, helper e fallimenti
saranno conservati tramite collector ufficiale e inventario chiuso.

Due letture dell'autore: (1) selezione, tombstone, CSN/TXID e offset
fisici; (2) budget, ownership, stati terminali e consegna degli output.
Non sono revisione indipendente. Nessun test nuovo aggiunto o eseguito
localmente, nessuna FI, MC/DC, copertura o misura di prestazione.
SVR-D01…D10, qualifica C1 e integrazione del motore restano aperti.
Eventuale CI automatica del push osservata separatamente, senza
promuoverla a prova funzionale dedicata.
