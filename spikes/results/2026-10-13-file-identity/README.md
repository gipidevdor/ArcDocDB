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

## Esiti locali

Undici processi conclusi `:OK`, con snapshot dei sorgenti `:STABLE`. Alla revisione
`2795934`: compilazione del prodotto senza warning/style-warning; 165 file di
prodotto senza violazioni di lint; 117 requisiti, 65 invarianti, 13 scenari FI e
52 ADR senza errori di tracciabilità; 341 file e 2583 collegamenti senza link rotti.
Il controllo delle evidenze ha letto 75 cataloghi e 2567 riferimenti.

[Audit dei byte](audit-byte.lisp): i 22 report/sidecar conservati hanno la stessa
dimensione e SHA256 degli originali locali. Verifica la conservazione delle
evidenze, senza eseguire API del prodotto o qualificare il nuovo componente.
