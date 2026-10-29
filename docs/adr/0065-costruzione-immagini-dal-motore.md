# ADR-0065 — Costruzione delle immagini primarie dal motore M1

- **Stato:** Accettata nell'integrazione incrementale autorizzata dall'autore il 2026-10-29
- **Data:** 2026-10-29
- **Riferimenti:** ADR-0058, ADR-0063, ADR-0064; REQ-IDX-009, REQ-IDX-010, INV-I8, INV-A8, INV-P6
- **Rapporto con la specifica:** concretizza il produttore dei derivati M1, senza nuovi formati autorevoli

## Decisione

L'attore seriale M1 puo' preparare un'immagine del proprio indice canonico
mediante `costruisci-indice-paginato-motore`. La richiesta esclude rientri e
scritture fino al completamento; il residente resta invariato e presente.
La fonte e' quella definita da ADR-0064, recuperata dal motore e non fornita
dal chiamante. Il derivato rimane privato, selezionabile allo startup.

Il piano conserva ID di slot e digest high/low, senza duplicare tutte le
chiavi. Una scansione bounded del frammento acquisisce i candidati; otto
passaggi radix stabili ordinano i soli metadati per digest unsigned a 64 bit.
L'emissione postorder produce bucket al massimo 7/8 pieni e directory con
fanout adattivo, fino a sette bit per nodo. Gli estremi del sottoinsieme
ordinato determinano i prefissi comuni da saltare. I figli consumano almeno
un bit: profondita' massima di 65 chiamate, inclusa la foglia finale.
Digest completamente identici producono una catena di bucket overflow.
La correttezza non dipende dalla distribuzione probabilistica degli hash.

Le chiavi sono copiate soltanto per il lotto corrente; il builder riceve
uno span dell'arena residente e ne possiede una sola copia. Routing,
packing, quote per lotto e vincoli dei PageRef restano verificati dalle
primitive di ADR-0058. Il conteggio del frammento deve rispettare il carico
massimo prima di allocare il piano e coincidere con la scansione effettiva.

Il nome nuovo `primary-<16 hex>.idx.tmp` proviene dall'opzione gia' valida
per ADR-0064. Per la costruzione l'ID deve stare in 1..2^60-1 e diventa l'ID
dell'immagine; la generazione iniziale e' uno. Il nome esistente e' respinto,
la creazione usa O_EXCL. Nessuna estrazione dell'autorita' dal nome: UUID,
fonte e candidati sono sempre verificati separatamente. Il namespace
privato e l'assenza di riuso dei nomi restano precondizioni del controller.

Dopo prefisso e pagine, il motore ricontrolla fonte e revisione, sigilla il
file con ARCIRF01 e flush, sincronizza la directory e chiude l'append. Apre
poi lo stesso nome readonly con EOF verificato e rilegge l'intera immagine
contro il residente. Solo dopo questa verifica, un nuovo controllo della
fonte e la chiusura di tutti i FD locali restituisce l'opzione al chiamante.
Al massimo due capacita' locali, nessuna accumulata nell'handle del motore.

L'operazione prepara un derivato: non assegna CSN, non modifica WAL o
CONTROL, non adotta una nuova root e non pubblica/rinomina nel catalogo.
Il flush della directory riguarda solo la creazione del temporaneo.
La scrittura dati successiva rende obsoleta l'immagine appena costruita.

## Budget ed errori

Il limite del payload di costruzione e' esplicito e verificato prima degli
array grandi e del nuovo file. Comprende gli array del piano, il lotto
massimo di chiavi, builder, stack radix e verifica readonly. E' un limite
di payload applicativo, non RSS: header, oggetti, GC e transitori del runtime
restano nella riserva del controller, separata e non qualificata qui.
La qualifica della quota complessiva per migrazione oltre RAM resta aperta.

La quota delle pagine e quella dei byte del file sono finite e controllate
per ogni lotto; il budget cumulativo della verifica deriva dall'opzione.
Il preflight non promette una prenotazione dell'intera immagine: una quota
esaurita dopo la creazione lascia un preparato incompleto e rende M1
FAULTED. Lo stesso vale per guasti, errori o uscite non locali dopo admission.
I FD sono tutti tentati, la causa primaria conservata e i guasti cleanup
aggregati. Nessuna cancellazione automatica o sostituzione di un file.
Preflight ordinari di configurazione, memoria e nome occupato conservano
il motore READY. Guasti del namespace chiudono invece admission.

## Seguito e rollback

Il percorso completo produttore → sigillo → verifica → riavvio → GET paginato
e' disponibile senza fixture che costruiscano i file al posto del prodotto.
Selezione automatica, delta writer, catalogo durevole, snapshot e dataset
oltre la capienza del residente restano separati. Per tornare al residente
si apre senza l'opzione del derivato; i dati canonici non sono migrati.
Contratto e prove in [costruzione M1](../implementazione/costruzione-indice-m1.md).
