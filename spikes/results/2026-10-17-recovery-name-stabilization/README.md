# Nomi recuperati — metodo preregistrato, 2026-10-17

[Contratto e decisioni](../../../docs/implementazione/stabilizzazione-nomi-recovery.md).

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
