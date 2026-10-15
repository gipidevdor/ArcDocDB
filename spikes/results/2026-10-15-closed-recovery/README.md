# CLOSED readonly — evidenze locali

Campagna del 2026-10-15 per [codice](../../../src/recovery-closed/)
e [contratto](../../../docs/implementazione/closed-recuperato.md).

## Metodo preregistrato

Compilare il solo prodotto senza avvisi; registrare stile, tracciabilità,
collegamenti, disassemblato senza chiamare le nuove API e controllo strutturale
delle evidenze. Nessun test funzionale, fault injection, modello o benchmark
locale in questa campagna. Solo Common Lisp/SBCL e strumenti di sistema;
nessun uso o installazione di Node.js.

La prima variante `fa2747f2` compila senza avvisi. La lettura statica rileva
però che il budget byte sopra il massimo del formato sarebbe rifiutato dal
decoder compaction dopo la lettura del file. Il preflight comune viene
allineato al vincolo del decoder; la variante iniziale e il finding restano
conservati separatamente dai controlli della correzione. Non è una prova
funzionale o una verifica dinamica del caso.

Due letture dell'autore sono ispezioni statiche, senza indipendenza o qualifica.
CDR-D01…D07 e CDR-G01…G05 nel contratto elencano i casi da coprire. Le prove
dei parser ACTIVE/compaction non qualificano automaticamente il lettore CLOSED,
la risoluzione EDIT e l'ingresso al publisher. C1, revisione indipendente,
casi funzionali/FI, memoria e prestazioni dei nuovi ingressi restano aperti.

## Conservazione

Il [catalogo](catalogo.lisp) conserva report originali, comando, ambiente,
blob dei sorgenti, stdout/stderr, codici d'uscita e sidecar di conservazione.
Gli helper C4 sono dati testuali; i record si leggono con `*read-eval* nil`.
L'audit confronta lunghezza e SHA256 di report e sidecar con gli originali
prima dell'archiviazione del worktree. Fallimenti e varianti restano distinti.
La CI automatica del commit pubblicato verifica le suite presenti e rimane
distinta dalla qualifica dedicata; nessuna misura del database completo.

## Integrazione

La variante successiva integra `7f1cc544` senza riscrivere gli antenati:
nuove prove ACTIVE native e pool, con sorgenti di prodotto invariati.
Conserva tutte le voci del changelog e i collegamenti delle campagne.
Ripete compilazione del prodotto e controlli statici, registrati separatamente.
Le suite importate non sono eseguite localmente in questa campagna e non
qualificano il nuovo lettore CLOSED; la CI del commit pubblicato resta distinta.

Un'integrazione successiva comprende `b2536f61`, qualifica del lettore
Archivio e bridge ACTIVE. I controlli registrati prima restano attribuiti
ai loro sorgenti congelati: il controllo del catalogo non copre queste
aggiunte successive. Il record CI finale è distinto. Il lettore Archivio
separa ora chiamate I/O e verifiche dei ritorni, senza cambiare le API.

Anche il nuovo lettore CLOSED adotta questa separazione (COD-25): prima
memorizza il ritorno I/O, poi esegue il controllo puro. Non cambiano API,
frontiere, condizioni o ordine delle operazioni. La lettura statica aggiuntiva
e i controlli finali restano una variante distinta delle prove precedenti.
