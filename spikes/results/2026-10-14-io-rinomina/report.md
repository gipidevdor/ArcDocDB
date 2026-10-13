# Rinomina comune: prove e misure locali

## Incremento e integrazione

Il confine I/O offre `rinomina-nella-directory` e centralizza l'effetto usato anche da `sostituisci-temporaneo`. Un solo wrapper `native-replace` chiama renameat sul medesimo FD parent. Il percorso verificato mantiene confronto FD/nome, regolarità, disgiunzione degli inode e verifica del nome installato, inclusa nel cleanup protetto.

Nomi ASCII bounded e due copie simple-base-string prima dell'effetto; nessun retry, rollback, close o fsync implicito. Le frontiere restano ferme. Soltanto capacità OPEN diventano FAULTED; quelle già CLOSED non sono riaperte. Le brevi transizioni sono protette dalle interruzioni, senza syscall o attese in quella sezione. La decisione EDIT e il fsync parent restano distinti dalla rinomina atomica; l'API generale mantiene la semantica POSIX del successo senza spostamento su hardlink già alias. Identità e autorizzazione autorevole restano al caller nell'API generale.

La lavorazione è partita da 14fd773 e ha integrato e599703 con il publisher CONTROL. La libreria conserva entry-identity e rename; ASDF carica native-namespace, poi rename, poi namespace. Il freeze del prodotto e dei test è 71413450ff8ac9bfdf0c515bdbbf9bd41a258cd4. Le correzioni C4 portano il freeze a 78c2a107890eb13365410280e0ff3f25710c1502, senza variazioni del prodotto/test/copertura. Tutti gli agenti scriventi erano chiusi prima delle esecuzioni.

## Prove funzionali e copertura

**68 nuovi test distinti: 56 backend e 12 nativi.** Coprono limiti e nomi invalidi, callback assente, risultato nonzero, errno/EINTR, condizioni originali, uscita non locale, callback che chiude la capacità, stringhe adjustable/displaced/fillpointer, postchecker e FD invalidati. Su file reali: vecchio FD leggibile sul vecchio inode, nuovo nome legato alla fonte, append ancora valido, fsync separato, parent spostato, fonte mancante, mismatch e hardlink alias. La prova concorrente usa quattro directory/worker per otto round e chiude i FD dopo la terminazione. I timeout sono tipizzati, non kill.

Probe sincrone delle interruzioni osservano i confini del callback, del segnale e del cleanup. Non costituiscono una campagna di interruzioni asincrone nello store interno.

La copertura C ha eseguito l'intera suite I/O con cache privata sui cinque file dichiarati:

| File | Espressioni | Rami |
|---|---:|---:|
| rename.lisp | 155/163 | 26/26 |
| namespace.lisp | 203/244 | 19/34 |
| native-namespace.lisp | 55/86 | 7/12 |
| lifecycle.lisp | 161/172 | 23/24 |
| types.lisp | 55/86 | 8/14 |

I numeri si riferiscono ai file completi. Nessuna attestazione MC/DC, né qualifica complessiva del publisher CONTROL o del database. Le letture C1 e C4 sono sintetizzate separatamente in revisione.json.

## Tentativi conservati

- Check A: fixture del postchecker costruiva simple-character-string con COPY-SEQ; correggere MAP simple-base-string ha allineato la fixture al contratto interno.
- Check B: due callback della fixture nativa usavano il wrapper native-rename eliminato nel merge; allineati a native-replace.
- Check C: prodotto compilato senza avvisi e test passati; il linter applicava COD43 anche dentro IO, contrariamente allo standard. Corretto selettore con sei negativi/positivi sui percorsi e due sui token.
- Mutatore C/D: baseline rifiutate per warning di ridefinizione ASDF/compile-time, non kill. Il logger ora segue l'eccezione già prevista da tools/build.lisp per SB-KERNEL:REDEFINITION-WARNING, ne registra tipo e testo e mantiene fatali gli altri warning/style-warning. Il campo generico warning-policy:fatal del benchmark va interpretato con tale eccezione.
- Il primo self-test della derivazione ha rilevato un EOF nel sorgente dell'helper; sorgente e record fallito conservati. Il primo uso sui risultati reali ha poi rilevato una parentesi nel binding LET*: il self-test della mediana non esercitava quel ramo. Anche questo sorgente e fallimento restano conservati; corretta la struttura del binding prima della derivazione accettata.

Ogni esecuzione centralizzata passa da record-command. get-series-capture registra l'helper effettivo e l'inventario raw al ritorno. I produttori incompleti o falliti non sono promossi a prove positive. Il collettore seleziona solo radici esplicite; cache e copie rigenerabili escluse, driver/config/patch/sorgenti mutati/report/log completi conservati. Artefatti grandi compressi senza perdita e digesti dei byte espansi.

## Metodo delle misure

Benchmark nativo locale su namespace esclusivi: 30 finestre, cinque repliche per rename-only/rename+directory-fsync, seriale e due/quattro reader su directory indipendenti. Il roundtrip muove source.tmp verso destination.tmp e ritorna: due rename per ciclo, 256 rename per reader/finestra. Totali previsti 17.920 rename e 8.960 fsync nel clock, escluso setup. Byte/EOF, inode, assenza di alias, sentinel, FD, offset e frontiere sono confrontati negli oracoli finali fuori clock. Preparazione, flush file iniziale, GC e oracoli finali sono esclusi; startup/gate/join paralleli inclusi. Heap dell'intero processo, senza pretesa zero heap.

Le finestre misurano soprattutto cambi di nome con destinazione assente, dopo la preparazione della fixture, non una serie di checkpoint completi. Cache OS e carico esterno non controllati. Il gate non prova sovrapposizione continua. Sono misure di metadati locali, non throughput DB, latenza P99 o durata sotto power loss.

Deadline cooperative degli strumenti: 30 secondi/finestra e 600/campagna benchmark; 120 secondi/child e 900/campagna mutazioni. Il supervisore esterno benchmark chiede arresto a 660 secondi e raccolta dello stato finale del child; la prova reale di timeout/reap è separata. Resta l'ipotesi di host sano: process-wait e helper kernel possono bloccarsi. L'accettazione considera l'exit effettivo del produttore, non solo la plist stampata prima dell'ultimo controllo temporale.

## Mutazioni concluse e grafo integrato

La campagna E ha completato la baseline di 68 test e rilevato **4/4 mutanti**, tutti tramite l’asserzione attesa: nessun crash, timeout o errore di compilazione è conteggiato come rilevazione. I processi child sono stati raccolti, le copie e gli artefatti compilati verificati, il manifesto dei sorgenti è stabile. La campagna raw è durata 766 secondi; il tempo dell’involucro comprende anche registrazione e raccolta degli inventari.

Il grafo finale integra main `163a8ce27a53c2452c86a9d514af3c63226ddc5e` nel freeze `68f747d1eacddb868d75b8dbed3715e93a3a5930`, con i nuovi moduli array CBOR e dispatcher. Il conflitto dei selettori di copertura è risolto conservando entrambi gli scope. I blob di `src/io`, `tests/io`, benchmark, mutatore e linter restano quelli del freeze E, elencati in provenienza.json. Mutazioni E e copertura C mantengono il proprio contesto ASDF originale; il check completo F riguarda il grafo integrato.

## Misure native concluse

Ambiente osservato: Apple M4 ARM64, SBCL 2.6.9, Darwin 27.0.0; carico esterno non controllato.

Tutte le **30 finestre sono OK**: 17.920 rinomine e 8.960 sincronizzazioni della directory, con oracoli finali validi e worker conclusi. I produttori benchmark, mutazioni e check F sono chiusi, riusciti e con sorgenti stabili. Le mediane seguenti derivano da cinque repliche; i valori completi min/mediana/max e i digesti degli input sono nei [dati derivati](derived.lisp).

| Operazioni misurate | Worker | Rinomine/s, mediana | Heap del processo, mediana (byte) |
|---|---:|---:|---:|
| Rinomina | 1 | 16.129 | 0 |
| Rinomina | 2 | 28.661 | 262.112 |
| Rinomina | 4 | 47.368 | 524.224 |
| Rinomina + fsync directory | 1 | 15.871 | 0 |
| Rinomina + fsync directory | 2 | 28.133 | 262.112 |
| Rinomina + fsync directory | 4 | 46.310 | 524.224 |

Ogni chiamata prepara due copie dei nomi: lo zero del contatore heap nelle finestre seriali brevi **non significa assenza di allocazioni**. Le finestre parallele includono startup/gate/join e il loro heap. Nessuna inferenza sul costo di allocazione per chiamata. I tassi contano rinomine, non cicli; fsync è aggiuntivo nella seconda modalità. Non si inferisce throughput del DB né durata sotto power loss.

Prove pubblicate: [benchmark nativo](io-rename-bench-F/report.lisp), [mutazioni E](io-rename-mutations-E/report.lisp), [check del progetto integrato](4000922580-command-18971-0-report.lisp), [catalogo](catalogo.lisp). I record falliti e gli helper originali sono conservati separatamente dalle prove accettate. La chiusura conserva i produttori di pubblicazione e audit in directory relative invarianti, inclusi i payload compressi; l’ultimo produttore è conservato separatamente senza autocertificazione.
