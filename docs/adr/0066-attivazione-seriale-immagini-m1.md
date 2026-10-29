# ADR-0066 — Attivazione e ritiro seriali delle immagini primarie M1

- **Stato:** Accettata nell'integrazione incrementale autorizzata dall'autore il 2026-10-29
- **Data:** 2026-10-29
- **Riferimenti:** ADR-0063, ADR-0064, ADR-0065; REQ-IDX-010, INV-I8, INV-I1, INV-A8, INV-P6
- **Rapporto con la specifica:** nessun formato autorevole nuovo; aggiorna la durata dei FD paginati di ADR-0064

## Decisione

L'attore M1 puo' attivare un'immagine privata esistente sul motore READY,
senza riavvio, tramite `attiva-indice-paginato-motore`. Il produttore di
ADR-0065 resta separato: costruzione e attivazione sono due richieste,
ciascuna con il proprio budget e verifica. Se una scrittura intercorre,
il candidato obsoleto viene rifiutato rispetto alla nuova fonte.

L'attivazione esclude GET e scritture attraverso BUSY e verifica nuovamente
readonly l'intera immagine contro il residente canonico. Prima della
pubblicazione ricontrolla revisione e fonte. I GET continuano a usare il
selettore gia' installato nella vista immutabile; nessun risultato viene
prodotto da un candidato parziale o da un fallback su errore.

Il motore possiede separatamente una sola capacita' paginata attiva,
la sua vista verificata e l'opzione usata per costruire cache e reader.
La nuova capacita' resta locale durante la verifica: massimo due FD delle
immagini contemporaneamente. Il preflight include il payload di reader/cache
precedenti trattenuti e della nuova verifica. Oggetti, header e GC restano
nella riserva del controller; la quota totale/RSS non e' qualificata qui.

Il punto di pubblicazione e' soltanto privato in memoria: ownership del
nuovo FD, opzione e vista vengono trasferite nello stesso tratto seriale,
senza callback o borrower. Poi viene chiuso il precedente FD. Nessun GET
concorre e nessun riferimento fisico esce dall'handle, quindi non serve
un nuovo protocollo EBR. Un errore del close successivo allo swap rende
FAULTED e non ripristina una capacita' gia' consumata/chiusa.

Questa decisione sostituisce la conservazione fino al close dell'handle
prevista da ADR-0064: il FD attivo viene ora chiuso quando la sua immagine
e' sostituita o ritirata. La prima scrittura ammessa ritira vista, opzione
e ownership prima del close e prima di qualsiasi CSN o effetto WAL. Un
close fallito impedisce il commit, chiude admission e non viene ritentato.
Input/capienza rifiutati prima dell'ammissione conservano l'immagine.
Il cleanup finale tenta il ritiro prima delle altre risorse e chiude anche
il file aperto da uno startup incompleto.

## Errori e limiti

Configurazione o quota iniziale insufficienti conservano READY e la root.
Come nelle altre richieste ammesse M1, qualsiasi errore o uscita non locale
successiva rende FAULTED, con causa primaria e guasti cleanup conservati.
Prima dello swap la vecchia root e il suo FD restano intatti, mentre il
candidato locale viene chiuso; non si promette continuazione del servizio
dopo il rifiuto di un candidato corrotto. Dopo lo swap il nuovo FD appartiene
al cleanup del motore, anche se un osservatore interrompe la richiesta.

La pubblicazione non cambia CSN, WAL, CONTROL o file del derivato e non e'
una decisione durevole di catalogo. Al riavvio la selezione resta esplicita
tramite `:index-image`; senza opzione M1 riparte residente. Scelta automatica,
delta writer, snapshot, catalogo durevole e liberazione del residente restano
da realizzare. Contratto e prove in
[attivazione M1](../implementazione/attivazione-indice-m1.md).
