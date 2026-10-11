# Directory GET CLOSED: sviluppo e verifiche

## Incremento

Directory immutabile della Serie per mappe CLOSED canoniche, ID u32 positivi
ordinati e array privati. Controlli di forma, identità e budget precedono le
copie; il payload dei due array è `12*N` byte su SBCL64. La ricerca richiede
al massimo 17 passi per 65.536 segmenti, con al più due confronti numerici
per pivot. Una location già pubblicata senza segmento provoca FAULTED,
libera il pin e non diventa una falsa assenza del documento.

Selezione, risoluzione, sonda cache e lettura sono collegate alle verifiche
GET esistenti. La directory viene acquisita dopo `avvia-get` nella stessa
epoca EBR. FD e mappe rimangono vivi fino al reclaim autorizzato dal controller.
Corretto anche il resolver CLOSED: `leggi-esatto` restituisce END nel buffer,
non END−64. La regressione usa un file reale e verifica regione e sentinelle.

## Verifiche accettate

Freeze finale sorgenti e strumenti: `7a9158e7b9aaec01fbca1beec6d7c8c724573456`,
comprendente `main` fino a `79f08d6` (CBOR semplice), resolver ACTIVE ordinario,
routing dei worker e suite GET funzionale. Quattro agenti hanno preparato
fixture, misure, mutanti e revisione; sono stati chiusi prima delle esecuzioni.

- Compilazione senza warning/style-warning; **969 test nominati**, due smoke
  e dieci spike nel controllo completo del repository.
- **30 test directory**: file nativi v1/v2, prepared+OUTCOME+SEAL, cache,
  budget, ID massimo, geometria sintetica 65.536, FI, cleanup, snapshot,
  quattro reader con output distinti e timeout/join.
- Baseline isolata e **5/5 mutanti rilevati**; zero sopravvissuti, errori
  di compilazione/infrastruttura o risultati invalidi nella campagna accettata.
- Copertura directory: **252/284 espressioni (88,7%)**, **39/40 esiti di ramo
  (97,5%)**. Il denominatore conserva codice generato e guardie interne;
  nessun ramo è escluso per ottenere il risultato. Non è MC/DC.
- Collector: 25 controlli positivi/negativi; selezione della copertura e
  classificatore mutanti verificati. Driver prestazionale: 64 finestre
  piccole complete, controllo positivo di almeno 4 MiB allocati e trattenuti,
  metrica senza COMPLETED rifiutata con exit 1 e diagnosi COD-61.

Le prime esecuzioni fallite sono conservate e collegate in
[history.lisp](history.lisp). Comprendono errori di forme Lisp negli strumenti,
arena e sentinelle delle fixture e serializzazione dei report child/checkpoint.
Le negative precedenti al corretto rifiuto di COMPLETED sono errori degli
strumenti, non controlli positivi. Nessuno di questi tentativi è promosso.
I comandi conservano argv, ambiente, commit, sorgenti prima/dopo e output;
le esecuzioni accettate richiedono `source-consistency :stable`.

## Misure e conservazione

Il metodo fissato prima delle finestre è in
[get-directory-metodo.md](../../../docs/implementazione/get-directory-metodo.md).
Profili: N=1/8/32/64, V=16/256, CSN massimo u64, CLOSED v2 ordinario e cache
calda. Due cicli, cinque repliche, 80 finestre seriali e 240 parallele:
**12.800.000 cicli misurati per campagna** e 640.000 di warmup. La prima
campagna F è conservata insieme alla ripetizione sul freeze integrato G.
I risultati G e le mediane non sono dedotti dai dati F.

I contatori heap misurano memoria allocata nell'intero processo, non RSS;
startup, gate e join dei thread sono inclusi nel parallelo. Tutti i cicli
verificano candidato, risultati e cleanup; cache-hit verifica ogni byte
copiato e le sentinelle. Resolve include due selezioni e non consegna un
valore. Le fixture sono sequenziali, con al massimo 64 FD readonly vivi.

[publication-roots.lisp](publication-roots.lisp) lega ogni radice raw a un
produttore terminale conservato. Produttori falliti possono avere raw parziali,
esplicitamente marcati senza promozione. [catalogo.lisp](catalogo.lisp)
inventaria copie e digest; i raw oltre 1 MiB sono compressi senza perdita,
riespansi e confrontati per dimensione/SHA256. Nessun FASL o checkout completo
è pubblicato. Il catalogo è una raccolta locale verificata, non una firma
crittografica o una qualifica dell'intero motore.

## Confini

La directory CLOSED non aggiunge pubblicazione complessiva della Serie,
rotazione o reclaim. ACTIVE multiserie, storico, endpoint, protocollo e pool
rimangono integrazioni distinte. Il caso 65.536 esercita soltanto geometria
sintetica e selezione; le misure native arrivano a N=64. I rate non descrivono
throughput del database, I/O sostenuto, durability o P99. Carico esterno,
scheduler e frequenza CPU non sono controllati. La revisione indipendente
conserva due letture C1 e correzioni R01/R02; l'ampliamento C4 non ha prodotto
un handoff conclusivo. Metodo C4 e integrazione finale sono controllati
dall'autore e dalle esecuzioni registrate, senza una qualifica C1 complessiva.

## Risultati della ripetizione integrata G

Apple M4, SBCL 2.6.9: campagna completa e stabile, **80/80 finestre seriali
con heap osservato zero**. Con N=64/V=16, ciclo cache con verifica completa:
mediana 1.046.901/s seriale, 3.744.091/s con quattro reader, rapporto 3,58×.
Il gruppo parallelo a quattro reader alloca una mediana di 524.224 B,
comprendendo la creazione dei thread; non si rivendica zero heap parallelo.
Tutte le celle, minimi/massimi e uno/due/quattro worker sono nel
[riepilogo G](benchmark-summary-g.lisp) e nella [tabella G](benchmark-summary-g.md).
La [campagna F](benchmark-summary-f.lisp) rimane distinta e conservata.

Due tentativi di assemblaggio del manifesto hanno rifiutato stati terminali
usati da altri strumenti (`PASSED` e `COMPLETE`): i registri falliti e i loro
sorgenti sono conservati. L'assemblaggio accettato seleziona solo radici
command/check possedute; i produttori dei raw sono comunque comandi con
stato terminale, timestamp finale e origine esplicita. Il primo derivatore
aveva una forma Lisp non chiusa: i due tentativi falliti sono conservati
insieme al sorgente originale; il riepilogo deriva dall'esecuzione corretta.
I helper di pubblicazione risiedono fra le prove, escluse dal freeze generale:
le versioni invocate sono conservate con digest nel catalogo. I loro comandi
registrano argv e stabilità dei sorgenti di prodotto/strumenti del repository.

La chiusura è un inventario puntuale: catalogo e raw sono controllati prima
della conservazione dei registri degli stessi audit. L'ultimo registro è
copiato separatamente per evitare una dipendenza circolare con il suo digest.

La compattazione locale a quattro worker comprende anche i registri strutturati
superiori a 64 KiB, con descriptor e gzip verificati byte per byte. Riduce il
peso delle prove senza cancellare tentativi o riscrivere la storia Git.
Il [registro di compattazione](compaction.lisp) conserva dimensioni, digest e
risparmio per ogni record; gli hash del catalogo sono aggiornati prima dell'audit.
