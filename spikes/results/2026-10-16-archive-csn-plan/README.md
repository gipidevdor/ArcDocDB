# Campagna: piano CSN dell'Archivio

## Metodo preregistrato

Contratto: [piano CSN](../../../docs/implementazione/csn-archivio-recovery.md).
Sorgente congelato prima delle esecuzioni; ogni record conserva commit,
blob prima/dopo, stato, exit code e output originali.

Controlli locali pianificati:

1. Compilazione forzata del solo prodotto, warning/style-warning fatali;
   nessun caricamento del sistema dei test o `test-op`.
2. Linter del prodotto, rigenerazione/controllo della matrice e link.
3. Disassemblaggio dei nuovi calcoli e del costruttore del risultato
   ACTIVE; nessuna invocazione funzionale delle nuove API.
4. Controllo delle evidenze presenti al momento dell'esecuzione.
5. Collector ufficiale su ingressi espliciti, quattro worker, hash e
   inventario chiuso verificato in un processo distinto. Osservazioni e
   record del collector conservati fuori dall'archivio chiuso.

Due letture dell'autore: autorità/provenienza e confini/costi. Non sono
revisione indipendente. ACR-D01…D11 restano obblighi aperti. Nessun test
locale, MC/DC, mutante, fault injection o benchmark pianificato.
Esecuzioni fallite conservate; nessuna promozione C1 dal successo della
build, della statica o della raccolta.

## Risultati

In attesa delle esecuzioni.
