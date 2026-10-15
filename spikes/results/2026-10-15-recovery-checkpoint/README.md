# Checkpoint dal recovery — evidenze locali

Campagna del 2026-10-15 per il [builder](../../../src/recovery-checkpoint/)
e il [contratto](../../../docs/implementazione/checkpoint-recovery.md).

## Metodo preregistrato

Compilare il solo sistema di prodotto senza avvisi. Registrare separatamente
stile, tracciabilità, collegamenti, disassemblato senza eseguire nuove API e
controllo strutturale delle evidenze. Nessun test funzionale, fault injection,
modello o benchmark locale in questa campagna. La CI automatica verifica le
suite presenti e resta distinta dalla qualifica del nuovo ingresso.

Le due letture dell'autore sono ispezioni statiche, senza indipendenza o
qualifica C1. CRB-D01…D06 e CRB-G01…G04 nel contratto descrivono i casi ancora
da coprire. Restano aperte prove funzionali/FI, copertura, revisione
indipendente e misure di memoria/prestazioni del builder.

## Conservazione

Il [catalogo](catalogo.lisp) conserva report originali, comando, ambiente,
blob dei sorgenti, stdout/stderr, codici d'uscita e sidecar di conservazione.
Gli helper C4 sono salvati come testo dati, non codice di prodotto eseguito.
Un audit confronta byte, lunghezza e SHA256 di report e sidecar con gli
originali prima dell'archiviazione del worktree. Nessuna sintesi sostituisce
fallimenti o varianti precedenti; nessuna misura di database completo.
