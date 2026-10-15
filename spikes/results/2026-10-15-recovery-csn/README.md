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

- `a25a2dab`: compilazione fallita per una parentesi di chiusura mancante
  nel builder ACTIVE. Il record originale resta conservato.
- `09ba03fb`: corretto il builder; compilazione fallita per un riferimento
  al simbolo interno `+stamp-offset+` con qualificazione esterna.
- `85cb6f52`: riferimento corretto; compilazione del solo prodotto riuscita,
  disassemblaggio, linter, tracciabilità, collegamenti ed evidenze riusciti.
  Il controllo completo delle evidenze riguarda l'insieme disponibile prima
  della nuova raccolta, non certifica gli archivi aggiunti successivamente.

Le ultime modifiche allineano l'indentazione e aggiungono esplicitamente
REQ-MVC-006, che richiede versioni non riutilizzate. Sono previste nuova
compilazione e statica sul contenuto definitivo; esiti e blob effettivi sono
nei record degli originali.

## Due letture dell'autore

1. **Flusso e autorità.** Lo stamp prepared non entra nel massimo; il
   CSN di OUTCOME viene raccolto dopo forma/CRC e controllo dei duplicati.
   La DECISION contribuisce alla risoluzione ACTIVE dopo partecipante e
   confronto con OUTCOME; la query completa delle decisioni include anche
   quelle senza prepared locale. Il CLOSED include tutti gli esiti canonici
   del proprio EDIT. Nessun aggiornamento del registro o punto di atomicità.
2. **Confini e costi.** SEAL writer e prove senza documento locale devono
   contribuire. Header e ordini di controllo restano esclusi. Coda dopo P
   esclusa, compaction vuota con esiti inclusa, presenza separata da zero,
   u64 senza incremento o troncamento. Insieme Serie verificato dal gate
   esistente, loop limitati; nessuna scansione/I/O aggiuntivi sul writer,
   un passaggio di header sul compattato e passaggi su esiti/decisioni.
   Nessuna misura di allocazioni o latenza; nessuna revisione indipendente.

I dieci gruppi CSR-D01…D10 rimangono aperti. I casi non vengono dichiarati
coperti dal solo disassemblaggio o dai test preesistenti dei reader.
