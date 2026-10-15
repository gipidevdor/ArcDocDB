# Campagna: massimo CSN osservato

## Metodo prima delle esecuzioni

Incremento C1 descritto nel [contratto](../../../docs/implementazione/recovery-csn.md).
Letture dell'autore: prima flusso dei valori e identità, poi confini di
prefisso, fonti omesse, limiti e costi. Non sono revisione indipendente.
La variante è identificata dai commit e dai blob nei record originali.

Esecuzioni locali previste:

1. compilazione forzata del solo sistema di prodotto, warning/style-warning
   fatali; nessun caricamento del sistema dei test o `test-op`;
2. linter del prodotto, rigenerazione/controllo della matrice di tracciabilità
   e controllo dei collegamenti;
3. disassemblaggio dei nuovi calcoli e del parser modificato senza invocare
   le nuove API su dati funzionali;
4. controllo di schema, hash e integrità delle evidenze.

Ogni processo passa da `tools/record-command.lisp`; exit code, stdout,
stderr e varianti fallite sono conservati. L'archivio degli originali viene
creato dal collector ufficiale, con ingressi espliciti, quattro worker,
confronto di dimensioni/SHA256 e inventario chiuso in un processo separato.
Il suo rapporto esterno può essere conservato in una seconda raccolta;
nessun file viene aggiunto all'archivio già chiuso.

Non sono pianificati test locali, fault injection, coverage o benchmark.
CSR-D01…D10 restano obblighi di qualifica, non esiti dimostrati.
Il successo di compilazione/statica o della CI automatica non chiude C1.

## Risultati

In attesa delle esecuzioni sul sorgente congelato.
