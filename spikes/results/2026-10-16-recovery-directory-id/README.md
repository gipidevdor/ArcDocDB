# ID recovery dalla directory posseduta — 2026-10-16

[Contratto, metodo e risultati](../../../docs/implementazione/id-directory-recovery.md) ·
[Inventario chiuso](archive-index.lisp) ·
[Copertura grezza](raw/audit/coverage-audit-result.lisp) ·
[Mutazioni](raw/mutation/report.lisp)

La nuova API compone una sola enumerazione attestata e il planner canonico,
poi sceglie ID e successore dal piano. Cinque budget e condizioni originali
conservati; parent prestato, nessuna prenotazione, mutazione o ammissione.
La selezione comune serve anche l'API logica preesistente. La prova verticale
usa nomi canonici .seg/.seg.tmp e questo ingresso dalla directory.

Metodo preregistrato nel commit 8e69701f. Sorgenti iniziali 1b7e7f77;
correzione del test 4ebde6fc9ad1395b94e614049593ad4821079319. Il primo tentativo
è FAILED per parentesi in eccesso nel test high-water: non è una copertura.
Le varianti sono conservate, insieme ai nove registri originali STABLE.

154 test recovery, dieci nuovi: 6.144 confronti con oracolo indipendente,
una enumerazione per chiamata, cinque budget, u64, ownership, errori,
64 chiamate concorrenti su quattro backend iniettati privati. Le prove native
verificano riuso del parent, byte/FD immutati e ancoraggio dopo rename.
Campagna finale: baseline passata, 17/17 mutanti rilevati a runtime,
zero sopravvissuti, errori di compilazione, pre-test o worker. Cinque budget
allentati e doppia enumerazione falliscono nei test dedicati. Quattro
processi isolati al massimo; copie, runner e log sono conservati.

Copertura del solo nucleo di selezione e adattatore:
- inventory-id.lisp: 74/81 forme, 10/10 rami.
- inventory-directory-id.lisp: 18/26 forme, 0/0 rami.
Totale grezzo 92/107 forme, 10/10 rami. Otto forme di package/declaim e
sette default keyword non marcati, anche quando esercitati. Nessuna
esclusione o ricarica artificiale. Dati nativi completi in gzip senza perdita,
HTML originali e lettore C4 con self-test e concordanza dei contatori.
Nessuna estensione del risultato al planner, I/O o altro codice del motore.

Prova verticale: 16 scenari positivi e due negativi, 71 processi e 26 SIGKILL,
nomi canonici e temporaneo orfano conservato. Oracoli dati/CSN e confronto
bytewise invariati; nessuna azione di rimozione eseguita dal nuovo ingresso.

make check sul commit 4ebde6fc: OK / exit 0 / STABLE, 507,29757 s,
1.037 sorgenti, 1.780 test nominati e due smoke, 254 sorgenti senza violazioni,
tracciabilità/link, strumenti di conservazione e dieci spike. Tutti i 14
file originali del run degli spike sono conservati. Lo stderr originale,
1.474.625 caratteri, resta nel registro: compilazione rigorosa riuscita senza
warning o style-warning. Il tempo è quello dei controlli locali, non un benchmark.

Il piano CSN dell'Archivio arrivato su main è integrato in 4031944b:
make test lint trace links è OK / exit 0 / STABLE, 103,492679 s, 1.044 sorgenti,
ancora 1.780 test e 260 sorgenti di prodotto senza violazioni. Il successivo
make evidence è OK / exit 0 / STABLE, 217,32933 s: 152 cataloghi, 3.754 riferimenti,
44.717 file e 1.192.504.390 byte, prima delle nuove raccolte CI e di questa.

L'ulteriore correzione CI della fixture clock CBOR è integrata in 4c7a0ca7:
nessun codice di prodotto cambia rispetto al controllo integrato. Compilazione
rigorosa, 17 test CBOR e make trace links ripetuti, OK / exit 0 / STABLE,
37,203664 s e stderr vuoto. 131 requisiti, 68 invarianti, 13 FI, 54 ADR:
zero errori; 521 Markdown e 3.559 link, nessuno rotto prima di questa raccolta.
Le verifiche restano distinte e il confronto del codice è conservato.
La selezione ID, i suoi test, il driver verticale e i mutanti restano identici
alla variante 4ebde6fc misurata. I risultati documentali vengono aggiornati dopo.

Due letture dell'autore con lista C1, nessuna revisione indipendente dichiarata.
Qualifica complessiva, Recovery Manager, calcoli CSN dell'Archivio e full text
restano nei rispettivi perimetri aperti; nessuna promozione di gate.
Manifest esplicito, quattro worker, inventario chiuso e checker indipendente.
I registri Lisp sono dati da leggere con READ-EVAL NIL, mai da valutare.
