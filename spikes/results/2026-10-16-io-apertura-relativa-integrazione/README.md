# Apertura readonly relativa — integrazione S2

[Contratto](../../../docs/implementazione/io-apertura-relativa.md) ·
[Metodo](../../../docs/implementazione/io-apertura-relativa-metodo.md) ·
[Revisione](../../../docs/implementazione/io-apertura-relativa-revisione.md) ·
[Inventario chiuso](archive-index.lisp)

La verifica locale [R2](processes/r2/report.lisp) è OK, exit 0, STABLE sul
freeze `357345fe423117c07da11b6149df803793e7f226`. Il comando è
`make test lint trace links`, con cache nuova: non è un nuovo `make check`.
L'integrazione incorpora main `110e` e collega la prova verticale agli ID
con nomi canonici nella directory. I 19 test I/O (13 iniettati e sei nativi)
e i relativi sorgenti prodotto restano invariati rispetto alla PR1.
Gli attesi verticali v1/v2, compresi gli oracoli negativi, sono superati.

La [CI PR1](ci/pr1-run-completed.json), run `38930450007`, è distinta:
head pubblicata `14d4420213471faa155b51509ef596ed7d9914c1`, commit GitHub
realmente provato `25c8ddad4f0c5d0c871a5f46a2234c19b74584d4`.
I registri nativi [Linux](processes/pr1-linux/report.lisp),
[documentazione](processes/pr1-documentation/report.lisp) e
[macOS](processes/pr1-macos/report.lisp) sono OK, exit 0, STABLE.
Linux e macOS riportano gli stessi 19 nomi I/O unici. Le osservazioni
[Linux/docs](ci/pr1-linux-docs-verification.lisp) e
[macOS](ci/pr1-mac-verification.lisp) conservano le rispettive letture;
il pending macOS nel primo dato è storico, chiuso dal secondo.
Il [controllo postpubblicazione P1](processes/post-publication-p1/report.lisp)
è conservato separatamente. La futura CI della nuova integrazione non è
attestata da questi risultati precedenti.

Questo supplemento non modifica l'archivio S1. Le cinque copie in
`inputs/frozen-S2/` provengono da Git S2; [provenance.lisp](inputs/provenance.lisp)
registra blob, SHA-256 e momento della ricostruzione da Git; queste copie
non sono attribuite come snapshot acquisiti nei run originali.
Il manifest elenca esplicitamente cinque processi e ogni file, inclusi i
payload compressi originali e le conservazioni. Il collector esistente
controlla le copie con quattro worker e un checker indipendente; output e
osservazioni della raccolta restano esterni. Non vengono introdotti contatori
globali, nuove campagne, promozioni C1/MC/DC o misure di prestazione.
I dati si leggono tramite `tools/evidence-storage.lisp`, READ-EVAL NIL ed
EOF obbligatorio, senza caricarli come codice. Le cache restano nel backup
esterno, fuori da questa raccolta.
