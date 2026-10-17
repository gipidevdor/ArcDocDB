# Acquisizione posseduta delle fonti recovery — 2026-10-17

Il prodotto acquisisce da una sola enumerazione tutti e soli ACTIVE/CLOSED
in sola lettura, con budget cumulativo e cleanup dell'intero insieme.
Il namespace resta esclusivo e stabile; non vengono eseguite rinomine,
eliminazioni, letture dei contenuti o ammissione del traffico.
La fixture verticale usa queste capacità per ACTIVE e CLOSED.

Il metodo è stato preregistrato nel commit `c7a40bf4`; il prodotto è nel
commit `30bb0fe3`. I quattro nuovi file di prodotto restano invariati
nelle correzioni successive delle fixture. Il controllo completo è riferito
al commit di integrazione `8aaa0621`, con adozione CLOSED e prove cache
entrate da main. Non si estende automaticamente al futuro main finale.

## Prove finali

- 16 test autonomi dell'acquisizione, nei due formati e con nomi permutati,
  frontiere u64, budget esatti/insufficienti, doppio cleanup, uscite nonlocali,
  directory invalidata, guasti annidati e identità alias/link.
- Quattro thread con backend privati, 16 acquisizioni ciascuno; gate e join
  limitati. Le prove native conservano identità, EOF e byte degli originali.
- Baseline mutation di 16 test, 11/11 mutanti rilevati a runtime; zero
  sopravvissuti, errori di compilazione, pre-test o worker. Quattro processi
  isolati; nessun errore di compilazione contato come rilevamento.
- `make check`: superato, 2.054 test nominati e due smoke; 170 recovery,
  quattro test verticali con 16 scenari positivi e due negativi, dieci spike.
  Sorgenti STABLE (1.189 file), 746,206849 secondi; nessun warning/style-warning.
  Conservati anche 1.924.679 caratteri di stderr, incluse le note del compilatore.

Le durate dei comandi includono compilazione e fixture, con carico esterno
non controllato; non sono benchmark del database o misure di scalabilità.

## Copertura nativa, senza esclusioni

| File nuovo | Forme marcate / totali | Rami marcati / totali |
|---|---:|---:|
| inventory-sources-types.lisp | 2 / 13 | 0 / 4 |
| inventory-sources-query.lisp | 87 / 93 | 6 / 6 |
| inventory-sources-build.lisp | 131 / 136 | 14 / 14 |
| inventory-sources.lisp | 73 / 85 | 2 / 2 |
| Totale grezzo | 293 / 327 | 22 / 26 |

Il reader C4 verifica la concordanza dei conteggi con HTML e ha due controlli
negativi sui dati sintetici. Si conservano database SB-COVER originale,
HTML completo ed elenco di ogni missing path, anche della prima campagna.
Le 34 forme residue comprendono 18 dichiarazioni top-level, otto
inizializzatori degli slot e otto default keyword non marcati dallo strumento.
I quattro rami residui sono associati alle dichiarazioni MEMBER dei tipi
state/form. Nessuna esclusione è approvata, nessun bit modificato, nessun
reload artificiale per alzare la percentuale. I tre file operativi hanno
22/22 rami marcati; questo non dimostra MC/DC né chiude la qualifica C1.

## Tentativi e limiti conservati

L'archivio conserva 17 record di comandi, inclusi i fallimenti. La prima
compilazione ha trovato una parentesi mancante nella fixture; sono stati
corretti anche la delimitazione del worker e nomi/tipi degli errori I/O
attesi. La prima baseline conteneva 14 test: due DEFTEST erano annidati
nel primo e non eseguiti autonomamente. Sono stati separati e il runner
mutation ora rifiuta DEFTEST annidati, con self-test negativo. La storia
manifest del test u64 è stata poi corretta: MAX è raggiunto come nuovo
ACTIVE tramite EDIT, senza un high-water wire non rappresentabile.

Il primo controllo completo è stato interrotto volontariamente dopo avere
trovato i test annidati; è FAILED, non una baseline qualificata. La seconda
campagna conserva 16 test effettivi e il controllo completo ripetuto.
Un self-test eseguito durante il merge è soltanto diagnostico; quello
qualificato è ripetuto dopo il commit pulito. Tutti i record hanno sorgenti
STABLE prima/dopo, distinguendo il working tree del diagnostico.

Il helper manuale targeted inizialmente mostrava un conteggio terminale
errato per NREVERSE senza riassegnazione, pur eseguendo tutti i test letti.
Il reader mutation conserva il conteggio autorevole 16; l'ultima ripetizione
manuale corregge anche la stampa. La versione del helper prima di questa
correzione è conservata. Le versioni precedenti del solo helper ignorato
non erano state copiate al momento del run; questo limite è dichiarato
in `raw/audit/helper-history.lisp.txt`. Tutte le varianti dei file tracciati
di prodotto e test sono invece estratte dai commit e conservate.

Le due letture C1 sono dell'autore, senza revisore indipendente. Recovery
Manager completo, riconciliazione fisica, verifica integrale dei contenuti,
CSN/radici e ammissione restano aperti. Nessuna esclusione, approvazione
indipendente, firma della baseline o qualifica della piattaforma è implicita.

Il manifest del collector enumera esplicitamente ogni input. Le ricevute
originali, gzip e stderr restano intatti, compresi i tentativi falliti.
Il controllo finale dell'inventario chiuso è distinto dalla revisione C1.
