# Verifica documentale della ricerca full text — 2026-10-15

La richiesta dell'autore è registrata in
[ADR-0053](../../../docs/adr/0053-ricerca-full-text-indici-invertiti.md): ricerca
full text con indici invertiti dedicati, nella progettazione della v1 e nel
caso d'uso NNTP. La modifica non introduce implementazione o test del full text.

Il [record originale](report.lisp), copiato senza modifiche da
`spikes/out/4001083007-command-12679-0/`, conserva comando, ambiente, revisione
di base `4ea3dd49`, impronte dei sorgenti e output integrale. Comando eseguito:
`make lint trace links`, tramite il wrapper del registro delle prove.

Esito `:OK`, exit 0, sorgenti `:STABLE`, durata 33,320517 secondi:

- linter: 245 file e zero violazioni;
- tracciabilità: 126 requisiti, 66 invarianti, 13 scenari FI, 53 ADR e zero errori;
- collegamenti: 706 file, 3.368 link e zero rotti.

La matrice è stata rigenerata con `make trace-write` prima del controllo.
Il [record di conservazione](conservazione.lisp) è quello originale del wrapper.
Queste verifiche attestano la coerenza documentale; correttezza, prestazioni,
recovery e comportamento sotto carico della ricerca full text restano da provare.
