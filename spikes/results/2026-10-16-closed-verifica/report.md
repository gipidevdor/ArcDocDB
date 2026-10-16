# Recovery CLOSED: verifica dedicata

2026-10-16, SBCL 2.6.9/macOS ARM64. Revisione di copertura e make check:
`7c2845b131ee69bd69b86b90c829e49e7135e966`, dopo integrazione del piano
CSN dell'Archivio `71f814aa`. I blob prima/dopo e l'ambiente completo
restano nei record originali, letti come dati, mai caricati con LOAD.

## Modifiche e risultato

La risoluzione confronta tutti gli OUTCOME con l'EDIT omonimo, anche
senza prepared: prove discordanti impediscono il risultato e il massimo
CSN. I conteggi continuano a classificare soltanto i prepared. Nessun
nuovo contenitore, formato, lock o accesso al decision log globale.
Il fold EDIT controlla valori u64 e cardinalità attraversata.

I [69 test composti](processes/coverage-e/report.lisp) passano: 25 di
lettura, 15 di semantica/insieme, 10 CSN/Serie, 10 di pubblicazione nativa
e 9 FI delle guardie. Le matrici attraversano v1/v2, writer/compaction,
ID e CSN zero/alti/u64 massimo. Il numero indica funzioni di test,
non singole combinazioni o requisiti qualificati.

La catena nativa legge CONTROL, decisioni, ACTIVE e tutti i CLOSED,
chiude il FD del decision log e pubblica tramite il protocollo canonico.
Verifica byte, namespace, capacità, gate prima del claim e fsync fallito
dopo rename. Non è una prova di power loss o di scritture esterne.

Il [controllo completo](processes/check/report.lisp) è OK su questa
revisione: build/test senza avvisi, lint e self-test, tracciabilità, link,
self-test degli strumenti di evidenza, archivio storico e dieci spike.
I [risultati annidati](nested/spikes/report.lisp) conservano gli spike;
i self-test snapshot/reader preservano anche i figli terminati con SIGKILL
o uscita 7 e i relativi output originali. Sono rifiuti attesi del runner,
separati dagli esiti del prodotto.

La [build d'integrazione](processes/integration/report.lisp) è OK su
`1c2341944c0cb9e967a11ab5724213c0ae41f678`: tutti i test, compresi i 69
CLOSED, lint/self-test e tracciabilità dopo l'integrazione di `6e065e26`
(fixture clock CBOR) e dei link documentali. Il codice CLOSED è identico
a quello della copertura E. La rilettura dell'archivio storico e gli
spike sono quelli del make check precedente; non se ne attribuisce
una seconda esecuzione alla build d'integrazione.

## Tentativi conservati

| Record originale | Esito | Osservazione |
|---|---|---|
| [trace iniziale](processes/trace-a/report.lisp) | OK | matrice invariata |
| [self-test copertura](processes/coverage-self/report.lisp) | OK | scope esatto e ramo mancante rilevato |
| [copertura A](processes/coverage-a/report.lisp) | FAILED | parentesi in eccesso nella suite semantica |
| [copertura B](processes/coverage-b/report.lisp) | FAILED | ulteriore delimitatore della stessa suite |
| [diagnostica delimitatori](processes/parentheses/report.lisp) | FAILED | segnala due chiusure residue in semantica e CSN |
| [copertura C](processes/coverage-c/report.lisp) | FAILED | il coordinatore aveva confuso budget default 256 MiB e massimo formato u32; corretta la fixture |
| [copertura D](processes/coverage-d/report.lisp) | OK | 60 test funzionali/native prima delle FI dedicate |
| [diagnostica completa](processes/diagnostic/report.lisp) | OK | 69/69, prima dell'integrazione del piano CSN |
| [trace dopo integrazione](processes/trace-b/report.lisp) | OK | matrice invariata |
| [copertura E](processes/coverage-e/report.lisp) | OK | 69/69, revisione integrata e sorgenti stabili |
| [stato del controllo completo](processes/process-status/report.lisp) | OK | sola osservazione dei discendenti del recorder: rilettura storica attiva, nessuna misura DB |
| [make check](processes/check/report.lisp) | OK | controllo completo sulla stessa revisione |
| [integrazione CI](processes/integration/report.lisp) | OK | build, tutti i test, lint/self-test e tracciabilità dopo la fixture CBOR aggiornata |

Le varianti sono commit distinti: `1c69331a`, `155871f3`, `07857fe4`,
`c89bceee`, `cf6a5be3`, `7c2845b1`. Il difetto OUTCOME/EDIT è stato
dedotto staticamente e corretto prima delle esecuzioni; non si presenta
questa campagna come riproduzione runtime della versione precedente.
Le FI FDEFINITION sono seriali, con ripristino `unwind-protect`; le
mutazioni della tabella EDIT e i risultati fabbricati sono solo FI.
Il [sorgente dell'helper diagnostico](raw/diagnose.lisp.txt) è conservato
e collegato al suo hash dal capture. Il controllo Python dei delimitatori
è interamente nell'argv del relativo record.

## Copertura e limiti

[Indice finale SBCL](coverage/e/cover-index.html), contatori azzerati dopo
il caricamento; solo suite CLOSED, otto file esatti di prodotto.

| File | Forme raggiunte/totali | Rami raggiunti/totali |
|---|---:|---:|
| build | 135/152 | 0/0 |
| csn-serie | 33/37 | 0/0 |
| csn | 101/110 | 13/14 |
| publication | 89/99 | 13/14 |
| read | 191/197 | 32/32 |
| resolve | 54/61 | 9/10 |
| types | 15/33 | 0/4 |
| verify | 121/125 | 20/20 |
| **Totale grezzo** | **739/814** | **87/94** |

I rami applicativi sono 87/90; i tre errori non raggiunti sono
`:closed-recovery-resolution-count`, `:closed-recovery-csn-outcomes`,
`:closed-recovery-set-consumption`. Sotto fonti e tabelle congelate i
rispettivi attraversamenti mantengono quei conteggi; nessuna FI sulla
mutazione concorrente o sostituzione delle primitive CL è stata eseguita.
I quattro rami generati in `types` restano 0/4 anche dopo FI su tutti i
campi del costruttore privato. Nessun ramo è escluso dal totale grezzo,
nessuna deroga o qualifica C1/MC/DC è approvata da questi conteggi.

Il [metodo](../../../docs/implementazione/closed-recuperato-verifica.md)
precede le prove. La [revisione](../../../docs/implementazione/closed-recuperato-revisione.md)
conserva due letture dello stesso revisore e la rilettura delle correzioni,
distinte dal controllo del coordinatore. Qualifica globale del piano CSN,
Recovery Manager, inventario/catalogo e ammissione del traffico restano
separati da questa campagna.

## Conservazione e prestazioni

Archivio nuovo con manifest esplicito, copie su quattro worker, SHA256
prima/dopo e controllo indipendente dell'inventario chiuso. Nessuna append
dopo la chiusura. Esito del collector e controllo finale del repository
sono conservati nella [raccolta esterna](../2026-10-16-closed-verifica-raccolta/README.md).
Descriptor, payload gzip e registri di conservazione restano insieme.
Sono esclusi solo cache FASL e lo stato globale ricostruibile di sb-cover;
HTML, helper, record dei fallimenti e output annidati sono conservati.

Nessun nuovo benchmark. Tempi del recorder comprendono bootstrap e
fixture, con carico esterno incontrollato e due verifiche finali in
parallelo. Non dimostrano throughput, scalabilità, RSS o heap zero del DB.
