# Esiti della verifica CONTROL

## Ambito e risultato

**84 nuovi test passati**: 47 della lettura readonly, 15 della pubblicazione
validata su file reali e 22 del confronto dei manifest. Le suite eseguite
nella copertura hanno superato 136 test CONTROL e 117 recovery. Il controllo
completo prima dell'integrazione è passato. I quattro file del prodotto e
le tre nuove suite sono identici dopo l'integrazione degli aggiornamenti
ACTIVE e pool/Serie; il controllo del grafo combinato viene conservato
separatamente tra i produttori di chiusura.

La matrice finita comprende 72 transizioni valide e 564 rifiuti attesi,
con tutti i congiunti CRV-D03..06 isolati. File e header v1/v2, CSN zero
presente, TXID/CSN u64 completi, high-water esaurito, sostituzioni con uguale
cardinalità, condizioni originali e uscite non locali sono esercitati.
La pubblicazione parallela usa quattro Serie indipendenti per due round;
tutti i worker terminano prima del cleanup dei FD e namespace.

Due letture C1 sono conservate: autore e agente indipendente Franklin.
Darwin ha rilevato due P2 nello strumento di misura; sono corretti e i
relativi casi di classificazione sono nei self-test. La lettura indipendente
iniziale è statica: non viene trasformata retroattivamente in una revisione
esecutiva o in chiusura del gate C1.

## Copertura dei quattro file

Dati da [coverage.lisp](coverage.lisp), derivati dal produttore concluso.

| File | Forme coperte/totali | Rami coperti/totali |
|---|---:|---:|
| control/recovery-publication | 23/26 | 2/2 |
| control/recovery-read | 196/212 | 19/20 |
| control/recovery-types | 9/20 | 0/2 |
| recovery/manifest-transition | 113/118 | 16/16 |

Copertura delle forme e dei rami SBCL, distinta da MC/DC. Rimangono forme
non raggiunte, anche nel costruttore privato e nelle guardie generate;
nessuna eccezione di copertura o promozione C1 viene dedotta da queste
percentuali. Le FI sulle dipendenze private sono outside-contract e
ripristinate serialmente; non provano che il decoder produca frontiere
impossibili. Mutazioni degli operatori logici e qualifica completa restano
fuori da questa campagna.

## Misure

Il [metodo preregistrato](../../../docs/implementazione/control-transizione-metodo.md)
separa build, decoder e oracoli dal confronto misurato. Il campione ha
**216 finestre, 72 celle, tre repliche e 504 record worker**, con uno/due/quattro
worker, due versioni di decodifica, CLOSED=0/16/256, esiti=0/4 e regimi
fixnum/u64 alto. REMOVED è 0 con CLOSED=0, altrimenti 4.

Completati **382.380 guard** e **2.191.752 lookup logici**, oltre al warmup
escluso. I lookup derivano dalle chiamate completate e dalla forma del
percorso; non sono contatori strumentati dei GETHASH interni. Le 72 righe,
con min/mediana/max, costo CPU e heap, sono in
[benchmark.lisp](benchmark.lisp). Il report originale occupa **223.950 byte**.

Esempio dichiarato, formato di decodifica v2, 256 CLOSED, quattro esiti,
u64 alto: mediana CPU per guard 78.182,375 ns con un worker,
81.567,625 ns con due e 127.755,375 ns con quattro. Il wall aggregato
include avvio e join; ogni finestra di questa cella ha solo otto guard.
Questo campione non dimostra accelerazione lineare. L'heap è del processo,
compreso il coordinamento; una differenza zero non certifica zero allocazioni.
Non misura throughput DB, I/O, persistenza o percentili di latenza.

## Fallimenti conservati e riparazioni

Tre produttori falliti restano nel catalogo e non sono prove positive:

1. Self-test A: EOF del sorgente, parentesi mancante nel ciclo del guard.
2. Self-test B: secondo EOF nel caricamento e warning su timeout zero del
   semaforo. Corretti la chiusura e il polling con TRY-SEMAPHORE; il bootstrap
   rende fatali anche gli avvisi delle definizioni prima di MAIN.
3. Benchmark A: ridefinizione di macro dell'helper durante COMPILE-FILE/LOAD.
   L'helper ora viene caricato una sola volta dalla copia congelata e
   attestato con il lettore SHA canonico prima/dopo la campagna.

I sorgenti esatti dei tentativi sono conservati come testo; i blob dei
produttori conservano l'intero contesto. Self-test C/D del driver passati:
472 controlli puri, senza eseguire prodotto o benchmark. Passati anche
raccoglitore (32), supervisore con processo reale/timeout (7), sintesi
copertura (8), sintesi benchmark (9) e fixture del ramo di copertura.

## Conservazione e limiti

[Catalogo](catalogo.lisp): produttori conclusi, output originali, sidecar e
raw attestati dal produttore. La copertura grezza oltre 1 MiB viene compressa
senza perdita, con byte e SHA-256 originali. Cache, FASL e copie ricostruibili
sono esclusi. [Manifesto di pubblicazione](publication-roots.lisp) e sorgenti
degli helper dichiarano la selezione; audit e controlli di chiusura rimangono
record distinti, senza autoreferenziale certificazione del catalogo.

EOF e namespace congelati restano precondizioni del chiamante. Questa
campagna non qualifica il lettore/chiusura del vecchio ACTIVE aggiunti in
parallelo, inventario completo, adozione degli indici, admission gate,
Recovery Manager multiserie, crash/power loss o chiusura della Fase 0.
Carico esterno non controllato; deadline cooperative e supervisore
presuppongono un host sano, senza garanzia di sblocco di attese kernel.
