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
