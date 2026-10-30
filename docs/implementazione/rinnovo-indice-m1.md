# Rinnovo seriale dell'immagine M1

> **Deciso (integrazione incrementale autorizzata → ADR-0068)** — C1;
> REQ-IDX-009, REQ-IDX-010, INV-I8, INV-I1, INV-A8, INV-P6.

```lisp
(arcdocdb.engine:rinnova-indice-paginato-motore engine fresh-option
  :max-maintenance-payload 67108864 :max-pages 65536
  :delta-keys 1024 :delta-key-bytes 65536)
```

La funzione restituisce la stessa opzione dopo costruzione, verifica e
attivazione. Il nome deve essere nuovo e valido per il produttore M1;
nessun nome e' generato o riusato automaticamente. Funziona dal residente
o con immagine/delta gia' attivi. I default del delta sono zero/zero:
la prima scrittura successiva ritira l'immagine, come nell'attivazione semplice.
Con delta abilitato, PUT/DELETE conservano l'immagine secondo
[ADR-0067](../adr/0067-delta-seriale-indice-m1.md).

Il delta vecchio puo' essere pieno. La manutenzione non e' una scrittura
e non ne usa la quota: costruisce dal residente canonico, che contiene
anche gli aggiornamenti rappresentati dal delta. Dopo lo swap il delta
nuovo e' vuoto. La stessa quota puo' quindi ammettere altre chiavi.
Non viene riattivata un'immagine vecchia o priva di una cancellazione.

## Admission e memoria

1. Owner READY: valida quota totale (0..512 MiB), limite pagine (1..65536),
   coppia di quote del delta e nome fresco.
2. BUSY: alloca nuovo delta e piano, costruisce/sigilla il derivato e chiude
   i file locali della costruzione. GET, PUT, DELETE e manutenzione rientranti
   sono rifiutati da tutti i callback.
3. `:image-renewal-built`: ricontrolla fonte e revisione del piano dopo il callback.
4. Riapre readonly, verifica completamente e pubblica tramite l'attivazione
   esistente, con ricontrollo prima dello swap. Chiude il vecchio FD.
5. Verifica BUSY/READY/controller sano, conclude e libera BUSY.

Payload riservato:
`payload-costruzione + payload-attivazione + payload-nuovo-delta`.
L'attivazione include gia' vecchio reader/cache e vecchio delta. Il piano
e i buffer di costruzione possono restare trattenuti durante l'attivazione:
la somma evita di assumere recupero dal GC. La quota esclude header, oggetti,
GC/RSS e risorse di runtime del residente, che il controller deve riservare
separatamente. Budget insufficiente e' rifiutato prima di creare il file,
anche se la sola costruzione entrerebbe nella quota.

Il rinnovo e' una richiesta seriale di manutenzione, con I/O sincrono M1;
non viene chiamato dal percorso caldo PUT/GET. Una sola Serie resta esclusa;
nessuna scrittura condivisa, lock o attesa fra Serie. I limiti di cicli e
profondita' sono quelli del produttore e verificatore gia' qualificati localmente.

## Guasti e restart

Preflight ordinario preserva READY, vecchia immagine, delta, frontiere e file.
Dopo admission errori e uscite non locali producono FAULTED conservando la
causa primaria e tentando il cleanup. Prima dello swap i riferimenti precedenti
restano posseduti; dopo lo swap resta posseduto il nuovo file e quello vecchio
non viene ripristinato. Nessun retry, truncation o cancellazione automatica.

Il punto di atomicita' dei dati resta SEAL: il rinnovo non scrive nuovi dati
canonici e non prende CSN. Non aggiorna CONTROL/catalogo. SIGKILL lascia un
candidato incompleto oppure un'immagine completa verificabile; il replay dei
segmenti e' sempre autorevole, indipendentemente dall'avvenuto swap volatile.
Startup senza opzione resta residente; la selezione esplicita di un file
completo richiede corrispondenza con tutta la fonte corrente.

## Decisioni e revisione C1

| Decisione | Prova |
|---|---|
| Quota totale e pagine valide | negativi, non interi, estremo+1; rifiuto prima della creazione |
| Payload intero entra nella quota | valore esatto e un byte insufficiente; sola quota di costruzione insufficiente |
| Postcondizioni BUSY, READY, controller sano | ogni condizione falsificata separatamente dopo pubblicazione |
| Fonte e revisione del piano intatte | ciascuna mutata al callback fra costruzione e attivazione; nessuna apertura di attivazione |
| Uscita completa o causa primaria | normale, errore di quota pagine ammesso, uscita non locale a quattro frontiere |
| Ownership prima/dopo swap | vecchio FD/delta conservati prima, vecchio FD chiuso e nuovo delta vuoto dopo |

Due letture: fonte/revisione, membership e ordine delle fasi; poi riserva
senza GC implicito, ownership dei FD, cleanup e failure boundary. Le decisioni
interne riusate conservano le tabelle C1 dei rispettivi moduli. Dieci casi
mirati includono v1/v2 con pagine 4/16/64 KiB, cicli di quota, dodici callback
senza rientro, chiavi lunghe con prefisso comune, causa originale e sei SIGKILL. [Registro e limiti](../../spikes/results/2026-10-30-engine-image-renewal/report.md).

Il residente resta completo, senza riduzione della sua memoria. Il rinnovo
non realizza ancora policy automatica, catalogo durevole, snapshot concorrenti
o writer paginato autonomo. Vecchi file derivati restano sul disco; la rimozione
richiede il protocollo di prova previsto dalle regole di storage.
