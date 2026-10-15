# Decision log dell'Archivio — evidenze locali

Campagna del 2026-10-15 per
[`recovery-archive`](../../../src/recovery-archive/) e
[contratto](../../../docs/implementazione/decisioni-recuperate.md).

## Metodo e limiti

Registrare compilazione del solo prodotto senza avvisi, controlli statici
di stile/tracciabilità/link, disassemblato senza chiamare le nuove API e
validazione strutturale delle evidenze. Non eseguire test funzionali,
fault injection, modelli o benchmark locali in questa campagna. La CI
automatica resta una prova distinta delle suite già presenti.

Due letture dell'autore sono dati di ispezione statica, senza indipendenza
o qualifica. Le decisioni DAR-D01…D03 e i confini DAR-G01…G04 sono elencati
nel contratto; casi funzionali, copertura, errori iniettati, memoria,
prestazioni e revisione indipendente dei nuovi ingressi restano aperti.

## Conservazione

Il [catalogo](catalogo.lisp) nomina i record di processo e le rispettive
conservazioni originali. Ogni report conserva stdout, stderr, codice d'uscita,
comando, ambiente e provenienza del sorgente; nessuna sintesi sostituisce i
byte originali. Gli helper sono conservati come testo dati C4, non come
codice di prodotto eseguito. L'audit confronta lunghezza e SHA256 di ogni
report e sidecar con l'originale prima di archiviare il worktree.

Le qualifiche del replay DECISION e del recovery ACTIVE preesistenti non
qualificano automaticamente il nuovo lettore, l'identità dell'Archivio o
il nuovo collegamento ACTIVE. Nessuna misura di database completo è prodotta.
