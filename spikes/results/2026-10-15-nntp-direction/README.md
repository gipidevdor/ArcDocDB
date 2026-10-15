# Obiettivo NNTP e verifica dell'integrazione — 2026-10-15

L'autore conferma ArcDocDB come database di un futuro server NNTP scritto
in Common Lisp. Il [caso d'uso](../../../docs/valutazione/caso-duso-nntp.md)
registra esigenze e confini; il lavoro NNTP di questa modifica è documentale.
La [prova verticale](../../../docs/implementazione/prova-verticale.md) e le
sue evidenze sono conservate separatamente nella campagna precedente.

Prima del push sono integrati gli aggiornamenti remoti fino a
`7c7255fad65336f7a7fff361ba569ad12fec1537`, mantenendo il lavoro locale
`68443df4`. Il conflitto del changelog viene risolto conservando entrambe
le serie di voci. Il grafo include il recovery CLOSED e il collector di
comandi importati da `origin/main`, oltre alla suite verticale preesistente.

## Esito

[`make check`](integration-report.lisp) sul grafo integrato è **OK / exit 0 /
STABLE**. Il record nomina il parent locale e contiene i blob prima/dopo
delle sorgenti effettive durante il merge ancora da committare. Passano
compilazione stretta, suite di prodotto e fixture, gli otto scenari verticali
v1/v2 e il controllo negativo, linter, tracciabilità, collegamenti, conservazione,
self-test del collector e dieci esperimenti in modalità check.

Tracciabilità: 122 requisiti, 65 invarianti, 13 FI e 52 ADR, senza errori.
Collegamenti: 699 file, 3.288 link, nessuno rotto. Tempo dell'intero comando:
499,448968 secondi, non una misura delle prestazioni del database.
Gli output originali includono diagnostiche di errori intenzionali delle fixture.

Il successo non qualifica un'implementazione NNTP, gli indici ordinati per
`OVER`, le nuove API CLOSED non esercitate dalle suite esistenti o il motore
completo. Restano i limiti delle singole campagne; nessuna misura precedente
viene attribuita retroattivamente al grafo integrato.

## Conservazione

Il [catalogo](catalogo.lisp) riferisce il record originale, il payload gzip
e il sidecar del registratore, copiati byte per byte dalla directory
`spikes/out/4001080515-command-96532-0/`. Il descriptor conserva lunghezze
e SHA-256 dei byte compressi ed espansi; comandi, ambiente, stato del checkout
e output restano nel record. Nessun file di evidenza viene caricato come codice.
