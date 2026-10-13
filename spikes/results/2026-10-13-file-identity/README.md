# Associazione fisica dei file — 2026-10-13

Campagna locale di compilazione del prodotto e controlli statici. Le due letture
sono dell'autore, senza indipendenza o qualifica C1. Non contiene esecuzioni di
test funzionali, fault injection o benchmark del nuovo componente.

Il [catalogo](catalogo.lisp) conserva i report di processo e i relativi sidecar
con argv, ambiente, snapshot dei sorgenti e output. Gli helper sono conservati
come testo Common Lisp, senza dipendenze dall'esistenza futura dei file `/tmp`.
Il disassemblato descrive la compilazione locale; non misura allocazioni,
latenza o il costo transitivo di funzioni chiamate.

I [contratti e le decisioni](../../../docs/implementazione/associazione-file.md)
mantengono espliciti i casi da qualificare e l'adozione nel server ancora aperta.
