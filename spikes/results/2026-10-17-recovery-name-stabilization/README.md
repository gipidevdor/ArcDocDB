# Nomi recuperati — 2026-10-17

[Contratto e decisioni](../../../docs/implementazione/stabilizzazione-nomi-recovery.md).

[Originali chiusi](../2026-10-17-recovery-name-stabilization-originals/archive-index.lisp) ·
[Riletture dell'autore](riletture.lisp)

Incremento: completamento di un nome vivo dopo il recovery semantico,
con identità FD/nome, collisioni preservate, ramo già definitivo e fsync
parent; nessuna modifica ad ADR o formati. Sorgenti e metodo vengono
committati prima delle esecuzioni. Il commit preciso sarà riportato nei
record e nel consuntivo, senza riscrivere la storia.

Compilazione forzata del **solo prodotto**, warning/style-warning fatali.
Trace-write precede trace. Lint, trace, link e disassemblaggio delle
funzioni aggiunte seguono la compilazione; nessuna nuova API chiamata
funzionalmente. Comandi registrati con sorgente prima/dopo, originali e
sidecar conservati tramite collector ufficiale e inventario chiuso.

Due letture dell'autore: (1) autorità, identità, errno e collisioni;
(2) punti durevoli, interruzioni, ownership e costi. Non sono revisione
indipendente. Nessun test nuovo aggiunto o eseguito localmente; nessuna
FI, MC/DC, copertura o misura di prestazione programmata in questo
incremento. SNR-D01…D09 e qualifica C1 restano aperti. La CI automatica
del push sarà osservata separatamente, senza promuoverla a prova dedicata.

## Sorgenti e risultati

Primo sorgente e metodo congelati in `304c8c11`; prima compilazione
conservata. Il successivo `873e4ca9608984c04722b46e5e831ca0f8897794`
precisa soltanto la docstring del punto durevole, distinguendo la
decisione EDIT dal completamento rename/fsync. Compilazione forzata
nuovamente eseguita su questa revisione, poi gli altri controlli.

Sette processi OK / exit 0 / STABLE: due compilazioni, trace-write,
lint, trace, links e disassemblaggio. Entrambe le compilazioni del solo
prodotto hanno stdout/stderr vuoti. Lint: 353 file, zero violazioni.
Trace: 135 requisiti, 69 invarianti, 13 FI e 56 ADR, zero errori.
Link: 589 Markdown, 4047 collegamenti, zero rotti. Disassemblaggio
ARM64 conservato di tutte e sette le funzioni aggiunte, senza chiamarle
funzionalmente. Nessuna misura di latenza o heap del motore.

Il collector ufficiale con quattro worker ha conservato sette report,
sette sidecar e tre helper, oltre ai due file automatici: 19 file
pianificati e 21 effettivi con indice e catalogo. Checker separato
dell'inventario chiuso con exit 0; nessuna aggiunta successiva a
quell'archivio. Quattro copie esterne conservano record/sidecar del
collector, rapporto e output del checker, con
[dimensioni e SHA256 prima/dopo](conservazione-verifica.lisp) e helper
letterale. Non è dichiarato un confronto letterale byte per byte.

Due controlli conclusivi separati riguardano link e catalogo esterno.
I report/sidecar e il relativo audit vengono conservati fuori
dall'archivio chiuso; il catalogo viene poi esteso per nominarli.
Questa verifica non è un punto fisso sul proprio record aggiunto e non
riesegue l'intera collezione dei cataloghi storici.

Le due riletture dell'autore hanno controllato separatamente autorità/
identità e completamento durevole/ownership. La durata delle capacità e
l'esclusione dei mutatori esterni restano precondizioni esplicite.
Qualifica dedicata, revisione indipendente, confine COD-24 generale e
ammissione restano aperti. I dati Lisp si leggono con READ-EVAL NIL,
mai caricandoli come codice.
