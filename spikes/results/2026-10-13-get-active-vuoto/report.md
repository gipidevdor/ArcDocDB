# ACTIVE vuoto: risultati e provenienza

## Incremento

Una radice ACTIVE iniziale pubblica le fonti CLOSED recuperate prima del primo lotto. Nessun batch sintetico, record WAL, incremento CSN, evento o I/O: il controller esclusivo pubblica nello slot canonico della Serie. La radice contiene directory NIL, contatori zero e frontiera 64; il primo lotto la mantiene immutabile. Readonly e append devono essere aperti, tutte le frontiere a 64 e l'EDIT già durevole prima dell'ammissione. Le decisioni, i rifiuti e il lifetime sono descritti in `docs/implementazione/get-active-vuoto.md`.

## Sorgenti e verifica

- Prima congelazione `c522bd4e94c920f8631ece65f9e48677d2d4f735`; correzioni degli strumenti nelle congelazioni B, C e D; esecuzioni accettate E su `6d4a74dbaa2f60d19493c4915d4c00e41c8487ee`.
- Integrazione `fee62ba8453d7bc992c6f7e7563bdeb47b3eeb4a` con la presa governata dal pool. Il confronto statico in provenienza.json attesta zero variazioni nelle cartelle GET/Serie, fixture e strumenti mirati fra E e questa integrazione; ASDF incorpora i nuovi sistemi scheduler.
- Verifica completa finale: processo `4000914874-command-11629-0`, exit 0 e sorgenti stabili. Nel suo stdout sono presenti **1134 righe nominali di test superati**; il numero è una conta delle righe, non dei requisiti qualificati. Sono compresi test e controlli del repository e gli spike.
- Incremento mirato: **25 test distinti**, 13 Series e 12 GET directory; include lease e salute, frontiere isolate, capacità chiuse, rientranza, interruzione dell'effetto, fonti native v1/v2, primo lotto e reader concorrenti (8 round, 4 reader). Tutte le esecuzioni centralizzate hanno sorgenti congelate; gli agenti che scrivono erano chiusi.
- Tre esecuzioni preliminari dell'agente Series non avevano snapshot before/after e registratore. agent-series-preliminary.json conserva l'attestazione disponibile: **non sono prove accettate**.

## Mutazioni

La campagna E passa la baseline di 25 test e rileva **4/4 mutanti** tramite il test preregistrato esatto: rimozione della guardia event-generation, frontiera iniziale 65, omissione di readonly-open e omissione di planned-root. Compilation error, timeout tipizzato, errore d'infrastruttura, crash e target diverso non sono kill. La baseline e ciascun figlio usano copie/cache private, inventari sorgente e FASL, driver e digesti verificati. I processi figli sono chiusi.

I tentativi A–D sono conservati come fallimenti di infrastruttura, senza promuoverli a successo o kill: A/B richiedevano FASL di fixture lint non compilate; C perdeva la proprietà dell'inventario effettivamente caricato; D confrontava la radice copia della baseline con i pathname ASDF del parent. La versione E corregge la radice dei mutanti e la sostituzione completa del checkpoint.

Il self-test finale E del mutatore valida 30 casi del classificatore, 3 ancore, timeout tipizzati, roundtrip e digest batch di tre file equivalenti al lettore canonico (il preliminare A conserva i suoi 28 casi); quello del benchmark valida 22 casi negativi, roundtrip e sensibilità del sensore heap. Il collettore finale valida 32 controlli, inclusi prefissi estranei al manifesto. Gli helper di derivazione e finalizzazione hanno rispettivamente 3 e 6 controlli.

Limite noto dello strumento di mutazione: il deadline di 900 secondi è cooperativo e la finalizzazione non impone un timeout esterno rigido. Il produttore E è terminato con exit 0 in **92,046 secondi** osservati dal registratore. Lo stato OK, da solo, non dimostra il rispetto universale dei 900 secondi.

## Copertura mirata

La campagna C compila con cache privata e misura i cinque file del perimetro `get-active-init`; le espressioni e i rami riguardano file completi, anche percorsi precedenti all'incremento.

| File | Espressioni eseguite | Rami eseguiti |
|---|---:|---:|
| sources-types.lisp | 115/129 | 15/16 |
| active-build.lisp | 214/274 | 18/36 |
| active-init.lisp | 53/57 | 8/8 |
| active-types.lisp | 12/39 | 0/4 |
| publication.lisp | 221/273 | 36/44 |

D03 (risultato del CAS) e D03b (postcondizione EQ) restano distinti. La mutazione planned-root attesta sensibilità al difetto; non attesta MC/DC delle foglie difensive irraggiungibili nel protocollo conforme. Questa copertura non qualifica l'intero motore.

## Benchmark locale

**120 finestre, 2.400.000 cicli misurati e 120.000 di warmup**, cinque repliche per configurazione: N=1/8/64, ACTIVE vuoto/primo publish, seriale e parallelo con 1/2/4 reader. Un ciclo risolve un candidato CLOSED, verifica l'oracolo ricavato dagli input nativi, il checksum e il rilascio del pin. Preparazione, scrittura e pubblicazione sono fuori clock; l'oracolo è dentro clock. Sono passati tutti i controlli requested/completed/checksum. Il cursore di misura riparte dopo il warmup.

Mediane aggregate in milioni di cicli al secondo; intervalli e heap per tutte le 24 configurazioni sono in derived.lisp.

| N | Fase | Seriale | 2 reader | 4 reader |
|---:|---|---:|---:|---:|
| 1 | ACTIVE vuoto | 1,992 | 3,227 | 4,289 |
| 1 | Primo publish | 1,988 | 2,834 | 4,299 |
| 8 | ACTIVE vuoto | 1,845 | 3,291 | 4,029 |
| 8 | Primo publish | 1,879 | 3,453 | 4,304 |
| 64 | ACTIVE vuoto | 1,753 | 3,308 | 3,706 |
| 64 | Primo publish | 1,747 | 3,299 | 3,930 |

Il sensore heap riguarda **l'intero processo**: 20/30 finestre seriali hanno delta zero (N=8/64); le 10 finestre N=1 hanno 262.128 byte. Non si attribuisce tale delta al solo resolver. Le finestre parallele includono avvio, gate e join dei thread e registrano anche il loro heap. Il minimo per N=1, quattro reader e ACTIVE vuoto è 1,052 milioni/s contro mediana 4,289: variabilità locale conservata, senza eliminazione degli outlier.

Sono misure locali del resolver CLOSED, con oracolo nel clock e carico esterno non controllato. Non misurano lettura del valore, cache, GET completo, latenza di storage o throughput del database. I gate non dimostrano sovrapposizione temporale continua. Le mediane osservate non sono obiettivi di prestazione o garanzie.

## Revisione e conservazione

revisione.json sintetizza le due letture indipendenti C1 di Bohr e la distinta revisione C4 di Anscombe, con rilievi chiusi e limite del deadline esplicito. Le prove runtime sono nei record centralizzati. catalogo.lisp conserva produttori chiusi, associazioni raw, digesti, artefatti compressi e copie esatte degli helper. publication-roots.lisp seleziona solo radici esplicite. I tentativi falliti rimangono leggibili; cache FASL e checkout isolati sono rigenerabili e non entrano nel registro pubblicato. L'audit dimostra integrità locale e leggibilità, non autenticazione su un host ostile né qualifica globale del database.
