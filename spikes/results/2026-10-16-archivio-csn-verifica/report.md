# Piano CSN Archivio: verifica dedicata

2026-10-16, SBCL 2.6.9, macOS ARM64. Revisione di copertura e controllo
completo: `fc12350a53a0f07e62d7435fd1b5a89780c6eb4a`, con integrazione
del piano ID dalla directory fino a `110e79f1`. Ambiente, argv e blob
prima/dopo sono nei record originali; i file Lisp sono dati, mai LOAD.

## Risultati e modifica

La query `massimo-csn-decisioni` ricontrolla forma delle entry prima del
massimo e consumo/normalizzazione al ritorno. Risponde al rilievo COD-24
del revisore: nessun bug numerico su input canonici è stato dimostrato.
Il passaggio resta O(N), con soli scalari aggiuntivi, senza nuovi
contenitori, I/O, formati, lock o avanzamenti del registro CSN.

I [54 test composti](processes/coverage/report.lisp) passano: 22 su insieme
e preflight, 17 su aggregazione/provenienza/lifetime, 9 nativi, 6 FI.
Il numero conta funzioni di test, non combinazioni della matrice o
requisiti qualificati. v1/v2, fino a quattro Serie con Registri in ogni
posizione, CLOSED writer/compaction, DECISION senza prepared locale,
assenza/zero, bit alti e massimo u64 hanno oracoli dichiarativi.

Un replay distinto degli stessi byte viene rifiutato se non è quello
usato dagli ACTIVE. Lo stesso vale per viste/Archivio differenti, budget,
count, CLOSED mancanti/duplicati, P incoerente in FI e capacità chiuse.
Le query del piano devono lasciare zero eventi I/O; byte e frontiere dei
file restano intatti. Le FI sono seriali e ripristinano FDEFINITION;
i wrapper e le entry malformati sono fabbricati soltanto nei casi FI.

Le prove native usano FD readonly e il namespace 0700 posseduto dalla
fixture, registri di nomi/FD e deadline 30s. Il ponte di prova passa M
in due parole al registro esistente: prima assegnazione M+1, riporto
u32, massimo u64 emesso al più una volta e poi `:csn-exhausted` senza wrap.
Nessun controller o nuovo allocatore di prodotto viene introdotto.

Il [controllo completo](processes/check/report.lisp) è OK sulla stessa
revisione: compilazione/test senza avvisi, lint e self-test, tracciabilità,
link, self-test degli strumenti, evidenze storiche e dieci spike.
Il [record annidato degli spike](nested/spikes/report.lisp) e i record
snapshot/reader sono conservati con output e runner dei figli negativi.
I SIGKILL/exit 7 dei self-test verificano il runner e sono separati dai
risultati del prodotto. Gli aggiornamenti documentali successivi non
modificano sorgenti o test verificati.

## Tentativi e varianti

| Record originale | Esito | Osservazione |
|---|---|---|
| [trace-write](processes/trace/report.lisp) | OK | matrice invariata |
| [diagnostica A](processes/diagnostic-a/report.lisp) | FAILED | 47/54; sette errori nelle fixture |
| [self-test copertura](processes/coverage-self/report.lisp) | OK | nove file esatti, esclusioni e ramo mancante |
| [diagnostica B](processes/diagnostic-b/report.lisp) | OK | 54/54 dopo correzione delle fixture |
| [copertura](processes/coverage/report.lisp) | OK | 54/54, sorgenti stabili, revisione integrata |
| [make check](processes/check/report.lisp) | OK | controllo completo sulla stessa revisione |
| [stato del controllo](processes/process-status/report.lisp) | OK | sola osservazione dei discendenti del recorder, nessuna misura DB |

Varianti: `434185ac` introduce suite e guardie DECISION; `dd855b14`
integra il lavoro ID-directory; `74cdc982` corregge le fixture;
`fc12350a` integra gli ultimi documenti/risultati di quel lavoro.
La diagnostica A confrontava EOF ACTIVE con 64 invece del prefisso e
conteneva stamp ordinari incompatibili con il SEAL. Nei CLOSED ciò
produceva `:batch-stamp`; negli ACTIVE la coda era correttamente esclusa,
quindi il massimo non coincideva con l'oracolo errato. La correzione
allinea i CSN e verifica esplicitamente EOF/P/stato/versione dichiarati
sia nel supporto iniettato sia in quello nativo. Nessun rifiuto del
prodotto è stato indebolito per far passare i test.

Il [sorgente diagnostico](raw/diagnose.lisp.txt) è conservato e autenticato
dal capture nei due processi; è identico nei due tentativi. I casi sono
eseguiti tutti, anche dopo un errore, e il comando fallisce se almeno uno
fallisce. Il [metodo preregistrato](raw/metodo-prima.md.txt) e la
[revisione statica](raw/revisione.md.txt) precedono le esecuzioni.

## Copertura grezza

[Indice SBCL originale](coverage/product/cover-index.html), contatori
azzerati dopo il caricamento; solo suite Archivio CSN, nove file esatti.

| File | Forme raggiunte/totali | Rami raggiunti/totali |
|---|---:|---:|
| recovery-archive-csn/build | 68/73 | 4/4 |
| recovery-archive-csn/preflight | 81/89 | 15/16 |
| recovery-archive-csn/query | 17/23 | 0/0 |
| recovery-archive-csn/series | 95/105 | 15/16 |
| recovery-archive-csn/types | 6/11 | 0/0 |
| **Solo modulo** | **267/301** | **34/36** |
| recovery/decisions-query | 157/205 | 12/20 |
| recovery/decisions-types | 25/35 | 4/4 |
| recovery-active/build | 135/163 | 7/12 |
| recovery-active/types | 5/32 | 0/2 |
| **Totale grezzo nove file** | **589/736** | **57/74** |

Nel modulo restano non raggiunti gli errori
`:archive-csn-series-count` e `:archive-csn-segment-count`.
Nella query fonte resta `:decision-csn-result`; i conteggi sono mantenuti
dai rispettivi attraversamenti su input congelati. Nessuna sostituzione
delle primitive CL o mutazione concorrente delle fonti è stata forzata.
I file di contesto mantengono tutti i loro residui, comprese guardie e
parti generate: non sono esclusi per aumentare la percentuale del modulo.
Le FI di forma raggiungono entrambi i rifiuti `check-entry-shape`.
Forme/rami non sono MC/DC; nessuna deroga, prova formale o qualifica C1.

## Limiti e conservazione

Il [metodo](../../../docs/implementazione/archivio-csn-verifica.md) descrive
ownership, matrici, budget e oracoli. La [revisione indipendente](../../../docs/implementazione/archivio-csn-revisione.md)
conserva due letture dello stesso revisore e addendum sulla patch, distinte
dal coordinatore e dai risultati runtime. Fonti/capacità/vettori congelati,
completezza iniziale del catalogo e ruolo Registri sono precondizioni;
la funzione non può scoprire una Serie omessa dall'elenco iniziale.

Restano da collegare catalogo persistente, inventari, pubblicazione,
indici/radici e ambiente runtime unico prima del traffico. Le prove
non qualificano power loss, mutazioni esterne, Linux CI o il motore completo.

Il collector comune copia il manifest esplicito su quattro worker e fa
verificare hash e inventario chiuso a un processo indipendente. Nessuna
append segue la chiusura. Il produttore e il controllo finale dei link
sono nella [raccolta esterna](../2026-10-16-archivio-csn-verifica-raccolta/README.md).
Descriptor e gzip restano insieme; cache FASL e stato globale ricostruibile
di sb-cover sono esclusi. HTML, helper, fallimento e output annidati citati
rimangono conservati.

Nessun nuovo benchmark. I tempi del recorder includono bootstrap, compiler
e fixture, con carico esterno incontrollato e due verifiche finali parallele.
Non sono throughput DB, scalabilità, RSS o heap zero del motore.
