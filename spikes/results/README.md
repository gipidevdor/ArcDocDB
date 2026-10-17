# Evidenze conservate

[Registro delle prove](../../docs/valutazione/registro-delle-prove.md) ·
[Risultati 2026-10-08](../../docs/valutazione/risultati-2026-10-08.md)

La [prova locale del socket Unix](2026-10-17-unix-socket/report.md) conserva
framing, documento/chiave massimi, nomi occupati, fallimenti e controlli intermedi
con CI, cache e riserve full text. Non attesta la chiusura del nuovo PUT/WAL in corso.

La [conservazione dell’integrazione del 2026-10-16](2026-10-16-main-integration-preservation/README.md)
verifica i branch originali e tutte le HEAD dei worktree; conserva le quattro
copie locali e confronta gli ingressi del prodotto con i registri locali, Linux e macOS.

L'[adozione ACTIVE del 2026-10-16](2026-10-16-runtime-active/report.md)
conserva 19 nuove prove, 147 test runtime/Serie, controller unico per log,
due Serie con commit durevoli e snapshot comune, copertura e due fallimenti
corretti. [Raccolta e copie](2026-10-16-runtime-active-raccolta/README.md).

Il [bootstrap runtime Archivio del 2026-10-16](2026-10-16-runtime-bootstrap/report.md)
conserva 27 test composti, famiglia unica CSN/snapshot/epoche, concorrenza,
GET e catena nativa, con copertura e controllo completo. Ammissione e C1/MC/DC aperte.

Il [piano CSN Archivio del 2026-10-16](2026-10-16-archivio-csn-verifica/report.md)
conserva 54 test composti, provenienza dei replay, gate delle Serie e ponte
di prova al registro CSN, con catena nativa e limiti C1/MC/DC espliciti.

Il [recovery CLOSED del 2026-10-16](2026-10-16-closed-verifica/report.md)
conserva 69 test composti, pubblicazione nativa, FI, copertura grezza e
correzione delle prove OUTCOME/EDIT orfane discordanti; C1/MC/DC aperte.

L'[inventario della directory della Serie](2026-10-15-serie-inventory/README.md)
conserva i 19 nuovi test, il controllo completo locale, le due correzioni
e i registri originali della raccolta readonly nel prodotto.

La [prova verticale 2026-10-15](2026-10-15-vertical-crash/README.md)
conserva sviluppo e verifica di scrittura, SIGKILL, recovery e riapertura
di una Serie, con confini C4 espliciti.

La [ripresa delle scritture](2026-10-15-vertical-resume/README.md) estende
la fixture con base CSN ricostruita, nuovi commit e secondo SIGKILL;
conserva i tre tentativi e le loro varianti sorgente.

Ogni directory datata conserva report originali, importazioni strutturate dei
report precedenti e diagnostiche. Il [catalogo 2026-10-08](2026-10-08/catalogo.lisp)
identifica varianti, tipi di prova e artefatti originali, senza duplicarne i
metadata. Sono **dati**, da leggere con `*read-eval* nil`;
non si caricano con `load` e non si valutano. `:schema-version 1` è lo schema
del registro, distinto dalla versione v1/v2 del formato documentale.

`make evidence`, incluso in `make check`, verifica che i riferimenti del
catalogo esistano e restituiscano una sola plist; gli artefatti principali
devono dichiarare schema 1 (`:schema-version` o il campo storico `:schema`).
Controlla struttura, presenza, dimensioni e integrità dei payload compressi, senza
reinterpretare i risultati o dedurne nuove garanzie.
Il primo controllo rifiutava il campo storico dei record modulari: quel run
è conservato in `evidence-check-failed.lisp`. La compatibilità con l'alias
conserva gli originali e non ne cambia il risultato.

I file grandi usano un descriptor `:compressed-evidence` al percorso originale
e un payload `.lisp.gz` accanto. Il contenuto originale è conservato byte per
byte, con dimensione e SHA-256. Si consulta con
`sbcl --script tools/read-evidence.lisp percorso-del-record.lisp`;
il [metodo e i limiti](../../docs/valutazione/conservazione-compatta.md)
descrivono verifiche e ripristino. Per pubblicare nuovi registri grandi si
esegue `make compact-evidence`. Il controllo rifiuta file non gzip oltre 1 MiB
e payload gzip oltre 8 MiB, anche quando non ancora catalogati.

Gli originali non vengono riscritti per aggiornarne il commit o completare
metadata mancanti. Le varianti hanno file distinti. I report locali `spikes/out/`
sono ignorati da Git; i risultati pubblicati e le relative prove vengono copiati
qui. In CI i report locali sono conservati come artefatti del run.

`record-command-expected-failure.lisp` è il controllo negativo del registratore:
il comando `false` deve terminare con exit code 1 e produrre un record `:failed`
con stdout/stderr. Il fallimento atteso non è un errore del database.
