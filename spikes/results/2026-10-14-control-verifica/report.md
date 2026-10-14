# Pubblicazione CONTROL e completamento I/O

## Incremento

Il percorso ACTIVE→checkpoint CONTROL→rinomina verificata→fsync directory→manifest riletto riceve fixture backend autonome e file nativi v1/v2. Il prodotto non aggiunge un punto di commit, un lock tra Serie, un rollback o una conferma al client. Inventario dei segmenti CLOSED, idempotenza del recovery completo, indici e ammissione del traffico restano al controller.

La lettura indipendente C1 ha trovato due difetti nel confine usato dai preparatori: append incompleta fuori da syscall-error restava riutilizzabile; short I/O poteva continuare dopo una capacità chiusa dal callback. La correzione installa cleanup di append e flush, conserva CLOSED terminale e progresso noto, ricontrolla la capacità dopo ogni frammento e richiede frontiere immutate durante i callback. Le invalidazioni del callback sono sonde fuori contratto di ownership, non prove di race nell’uso conforme. Le condizioni originali propagano.

## Metodo e perimetro

Sono stati scritti 62 test backend CONTROL, 12 test nativi e 21 test del delta I/O. La prova parallela nativa usa quattro worker per quattro round, con fixture e FD distinti e cleanup soltanto dopo join. Questi conteggi sono inventario dei test; gli esiti accettati vengono riportati dopo i produttori centrali.

Copertura su tredici file esatti, suite CONTROL+IO, cache privata: il numero misura interi file e include percorsi antecedenti al delta. Nessuna promozione MC/DC o requisito del motore. La lettura C1 e quella C4 sono persistite separatamente dagli esiti runtime in revisione.json.

Il profilo di mutazione del completamento I/O riusa l’engine della rinomina, con quattro target di asserzione esatti sui 21 nuovi test IO. Le compilazioni e i driver/source/FASL delle copie sono attestati da digesti canonici; il profilo precedente mantiene i suoi file e marker. Un timeout/crash/IO-FAULT/errore di compilazione non conta come rilevamento. Nessuna inferenza sulle altre decisioni CONTROL.

Il [metodo delle misure](../../../docs/implementazione/control-verifica-metodo.md) preregistra 30 finestre: due formati, uno/due/quattro worker, cinque repliche, otto pubblicazioni per worker. 560 pubblicazioni previste. Preparazione e rilettura dei file più pubblicazione e fsync sono nel clock; setup delle fixture ACTIVE/piani/precedente e oracoli finali sono fuori. Le finestre parallele includono startup/gate/join. Heap del processo, nessuna inferenza zero heap/per-call/DB. Carico esterno, cache OS e ordine fisso non controllati.

Produttori chiusi e raw conservati con digesti, inclusi i tentativi falliti. Le copie rigenerabili e i FASL sono esclusi dagli artefatti, i manifesti/digest di compilazione sono conservati. Compressione senza perdita e nomi dei payload relativi invariati. L’ultimo produttore di chiusura è conservato separatamente senza autocertificazione.

## Tentativi conservati

Il primo self-test del benchmark ha rilevato un EOF nel sorgente: mancava la chiusura della decisione sull’inode installato. Il sorgente originale e il record fallito sono conservati; è stato corretto soltanto lo strumento C4 prima della misura nativa. Gli altri tre self-test iniziali sono riusciti.

## Copertura A e prove funzionali

La campagna di copertura A ha completato CONTROL e IO su cache privata, incluse le 95 nuove definizioni di test. Il record produttore è riuscito e i sorgenti sono stabili. I conteggi dei file completi sono:

| File | Espressioni | Rami |
|---|---:|---:|
| active/preflight | 70/94 | 8/16 |
| active/prepare | 87/114 | 6/12 |
| control/build | 181/213 | 14/22 |
| control/dependency | 44/49 | 6/6 |
| control/preflight | 107/111 | 14/14 |
| control/prepare | 74/91 | 3/6 |
| control/publication-read | 13/19 | 0/0 |
| control/publication | 105/114 | 18/20 |
| control/transfer | 53/77 | 4/8 |
| control/types | 12/33 | 0/4 |
| io/flush | 75/78 | 12/12 |
| io/transfer | 283/304 | 33/36 |
| io/types | 61/92 | 12/18 |

Questi valori non soddisfano tutti i gate C1 e non misurano MC/DC. Il successo locale del publisher non attesta il Recovery Manager completo.

## Mutazioni concluse e integrazione finale

La campagna A ha completato baseline dei 21 test IO e rilevato 4/4 mutanti nel primo target di asserzione previsto, dopo compilazione e attestazione delle copie; nessun errore o timeout promosso a rilevamento. Il freeze A è 128955e6; le fixture/control e il contesto ASDF restano quelli originali.

La correzione C4 successiva al run A subordina il ripristino di funzione globale e hook della sonda CAS alla quiescenza di entrambi i worker. La qualifica funzionale sul freeze A non attestava il ramo di cleanup scaduto. La versione finale integra main 55149bfd (ricircolo pool/Serie) in ec2efddf; controlli completi e copertura vengono ripetuti. IO, i 21 test e il driver/engine di mutazione mantengono gli stessi blob, elencati in provenienza.json; il contesto originale della campagna A non è sostituito retroattivamente.

Il check completo B su ec2efddf e la copertura B sono riusciti, con sorgenti stabili. Sono inclusi i 95 nuovi test e i moduli del grafo integrato. Il record B sostituisce A soltanto come prova del grafo finale; i produttori A e il contesto della mutazione restano conservati. La sonda CAS completata non attesta uno sblocco universale dei worker/kernel né una campagna asincrona immediatamente dopo il CAS.

## Misure native concluse

**30 finestre OK, 560/560 pubblicazioni completate**, worker conclusi e tutti gli oracoli finali validi. I tre produttori di benchmark, mutazioni e check B sono chiusi con exit zero e sorgenti stabili. I [dati derivati](derived.lisp) conservano minimi, mediane, massimi e digesti dei cinque input.

| Formato | Worker | Pubblicazioni/s, mediana | Heap del processo, mediana (byte) |
|---|---:|---:|---:|
| v1 | 1 | 244,61 | 0 |
| v1 | 2 | 247,17 | 393.184 |
| v1 | 4 | 302,84 | 786.368 |
| v2 | 1 | 243,60 | 0 |
| v2 | 2 | 248,86 | 393.184 |
| v2 | 4 | 302,85 | 786.368 |

Ambiente locale: SBCL 2.6.9 su Apple M4/Darwin, carico esterno non controllato. Lo zero del contatore nei campioni seriali brevi non attesta zero allocazioni: il percorso costruisce wrapper/associazioni/copie dei nomi e usa oggetti stat del runtime. Nei campioni paralleli l’heap include startup/gate/join. Non si normalizza questo heap in costo per chiamata e non si inferiscono throughput del DB o durata sotto power loss.

La crescita locale con quattro worker è contenuta per questo carico con sincronizzazioni forti; nessuna garanzia di scalabilità o isolamento sotto carico reale deriva da queste finestre. Il confronto v1/v2 riguarda lo stesso carico e cinque repliche, senza soglia prestazionale o stima di percentili.

Prove: [benchmark nativo](control-checkpoint-bench-B/report.lisp), [mutazioni I/O](control-verifica-mutations-A/report.lisp), [check finale](4000986784-command-88616-0-report.lisp), [copertura finale](control-verifica-coverage-B/cover-index.html), [catalogo](catalogo.lisp). I record falliti, il sorgente C4 originario e le letture indipendenti restano conservati; nessuna promozione della qualifica C1 incompleta.
