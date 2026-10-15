# Integrazione finale del recovery Archivio — 2026-10-15

Integra `main` `7f1cc544` con la
[campagna Archivio](../2026-10-15-decisioni-verifica/report.md), mantenendo
le suite indipendenti checkpoint ACTIVE e pool/Serie. Nessun nuovo benchmark.

## Metodo ed esiti

**`make check` completo passato sul merge `1f0b467d`**, con sorgenti stabili:
[produttore originale](4001077549-command-45633-0-report.lisp).
Passati anche i 54 test Archivio, le suite integrate, i controlli di
tracciabilità/evidenze e i dieci spike in modalità check. Nessuna
qualifica C1 completa dichiarata.

Il [confronto registrato](4001077579-command-46023-0-report.lisp) verifica
l'identità esatta di `src/recovery-archive/` e `tests/recovery-archive/`
rispetto a `5cb13ca3`, già verificato nella prima campagna. Restano quindi
attribuiti a quella campagna i 54 test, la copertura read 22/22, build 6/6,
bridge 4/4, le forme residue e i tipi 2/4. Non è una nuova misura di copertura.
L'integrazione aggiunge suite e registrazioni ASDF; i conflitti conservano
entrambe le voci del changelog ed entrambe le suite.

Il [self-test della raccolta](4001077578-command-46006-0-report.lisp) passa
21 controlli. Il collector riusa la versione corretta della prima campagna:
ordine non distruttivo, contatore preservato, copie canoniche e digest.

## Conservazione

Il [catalogo finale](catalogo.lisp) conserva produttori conclusi, output originali, report
individuali dei dieci spike e log/runner delle fixture negative. Il publisher
controlla SHA-256, uguaglianza dei record risolti e limiti 1 MiB plain/8 MiB
gzip. I record di pubblicazione, audit e collegamenti sono conservati
separatamente in `chiusura/`, con ricevuta di copia e digest; nessuna
catena di autocertificazione. I FASL sono esclusi e ricostruibili.

La prima campagna, i suoi fallimenti e i cataloghi storici restano immutati.
Il carico esterno non è controllato. Nessuna conclusione su throughput DB,
scalabilità o heap zero; C1 completo, MC/DC e Recovery Manager restano aperti.
