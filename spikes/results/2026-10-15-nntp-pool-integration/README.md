# Integrazione finale dell'obiettivo NNTP con il pool — 2026-10-15

Prima del push di `b7249be8`, `origin/main` è avanzato a
`d77c455877220e0c515fa3d35ca533034e4f7a67`, aggiungendo la preparazione
del tratto pool/Serie, i suoi test e le rispettive evidenze. Il nuovo merge
conserva quelle modifiche e la suite verticale; il conflitto del changelog
è risolto mantenendo entrambe le serie di voci. Nessun nuovo codice NNTP.

Il precedente [`make check` completo](../2026-10-15-nntp-direction/README.md)
rimane attribuito al proprio grafo. Sul nuovo grafo il
[controllo di integrazione](integration-report.lisp) esegue **`make test lint
trace links`**, con esito **OK / exit 0 / sorgenti STABLE** in 93,900064 s.
Comprende compilazione stretta, intera suite e nuova suite pool, gli otto
scenari verticali e il controllo negativo, linter, tracciabilità e collegamenti.
Non è una nuova esecuzione degli spike o dell'intero archivio delle evidenze;
le loro campagne precedenti restano distinte. Nessuna qualifica NNTP o nuova
misura delle prestazioni.

Il [catalogo](catalogo.lisp) conserva il report, il payload gzip e il sidecar
originali di `spikes/out/4001081247-command-3425-0/`. Copie byte-identiche,
comandi, ambiente e blob delle sorgenti effettive nel record. Il descriptor
consente la verifica dei byte compressi ed espansi senza eseguire i dati.
