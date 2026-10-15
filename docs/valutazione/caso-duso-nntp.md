# Caso d'uso di riferimento: server NNTP in Common Lisp

> **Deciso (indirizzo dell'autore, 2026-10-15)** — ArcDocDB è destinato a
> diventare il database di un server NNTP scritto in Common Lisp. Questo
> caso d'uso orienta le valutazioni del motore general-purpose. La richiesta
> attuale riguarda l'indirizzo progettuale e la sua documentazione.

## Obiettivo applicativo

Il futuro server conserva articoli, appartenenze ai newsgroup, informazioni
di overview e metadati di retention. ArcDocDB fornisce storage, transazioni,
indici, scheduling e recovery; l'applicazione NNTP possiede protocollo,
connessioni e regole di pubblicazione. Il caso d'uso aiuta a valutare i
contratti esistenti e il lavoro residuo della [roadmap](../roadmap.md).

ArcDocDB mantiene la propria natura general-purpose. L'obiettivo applicativo
non modifica formati, invarianti, livelli di durability o scope degli ADR
accettati; eventuali modifiche a tali contratti richiederanno il normale ADR.
Protocollo NNTP, demone, TLS, autenticazione e benchmark applicativo sono
lavori futuri: questo documento non li introduce nell'implementazione attuale.

## Esigenze da considerare nelle scelte del motore

| Esigenza NNTP | Implicazione da valutare per ArcDocDB |
|---|---|
| Articoli normalmente immutabili e letture per Message-ID | Append-only, lookup puntuale, conservazione dei byte e verifica in lettura |
| Un articolo presente in più newsgroup | Una copia del contenuto e più appartenenze; coerenza delle pubblicazioni fra Serie |
| Overview per intervallo di numeri in un gruppo | Scansioni ordinate, indici secondari e visibilità coerente con gli articoli |
| Molti lettori e picchi di nuove pubblicazioni | Parallelismo, code e buffer limitati, controllo dell'ammissione e isolamento fra Serie |
| Scadenza degli articoli e lettori già attivi | Tombstone, retention delle appartenenze, CLEAN/MERGE e reclaim dopo quiescenza |
| Riavvio dopo un arresto forzato | Recupero delle pubblicazioni confermate con durability esplicita, indice ricostruibile e ritentativi applicativi senza duplicazione |

Il riferimento di protocollo è [RFC 3977](https://www.rfc-editor.org/rfc/rfc3977.txt),
in particolare §§3.6, 6 e 8.3. Message-ID e numero dell'articolo nel gruppo
sono identità distinte: il primo è confrontato come sequenza opaca di byte;
il secondo appartiene al singolo gruppo. Un articolo pubblicato in più gruppi
può avere numeri diversi in ciascuno. Il CSN del database rimane una versione
e un ordine di commit, separato dalla numerazione NNTP.

## Modello applicativo da valutare

> **Proposta** — Separare contenuto e appartenenze: `Message-ID → articolo`
> e `(gruppo, numero) → Message-ID + overview`. Metadati dei gruppi e policy
> di retention hanno responsabilità proprie. Lo schema e il partizionamento
> concreti restano da decidere con i contratti del motore disponibili.

Una singola Serie per tutti gli articoli concentra le scritture su un writer;
lo stesso vale per una Serie globale delle overview o dei contatori. Nelle
valutazioni del parallelismo occorre considerare il partizionamento e il
caso dei gruppi molto attivi. Il cross-posting aggiunge coordinamento
multiserie: la visibilità atomica desiderata è una scelta applicativa da
realizzare con le transazioni del motore, non una garanzia già dimostrata
dal solo formato del decision log.

La retention può rimuovere un'appartenenza senza eliminare il contenuto ancora
usato da altri gruppi. La rimozione fisica richiede inoltre il rispetto di
snapshot e lettori attivi. Un ritentativo dopo commit riuscito e risposta
persa deve avere una semantica esplicita per deduplicazione e numerazione.

## Integrazione con il futuro demone

L'[architettura](../architettura.md#interfacce) prevede già un motore libreria
con interfaccia «richiesta più continuazione» e un guscio TCP/CBOR. L'uso
diretto nello stesso processo SBCL è un'opzione da valutare per NNTP;
la scelta rispetto al collegamento TCP resta aperta. L'integrazione diretta
evita il trasporto e il framing delle richieste, mantenendo la codifica dei
documenti e condividendo heap, GC e destino del processo.

La gestione delle connessioni conserva stato e ordine richiesti da NNTP,
usa capacità limitate e rispetta il controllo dell'ammissione del motore.
I worker di ArcDocDB mantengono proprietà delle code e dei compiti di storage;
le sezioni EBR terminano prima di attendere la rete o un client lento.
La distribuzione dei compiti, le copie dei buffer e il costo del GC vanno
valutati sul percorso completo.

## Criteri per le valutazioni future

> **Proposta** — Usare le operazioni applicative `POST`, `ARTICLE` e `OVER`
> per valutare i percorsi del motore quando i contratti necessari saranno
> disponibili. Le prove di correttezza precedono le misure prestazionali.

Le valutazioni dovranno distinguere lookup puntuale e intervalli ordinati;
pubblicazione singola e cross-posting; cache calda e accesso al dispositivo;
durability della conferma; cancellazione di appartenenze e reclaim fisico.
I casi di guasto rilevanti includono commit prima della perdita della risposta,
riavvio con transazioni in corso e retention durante letture già ammesse.
Le misure future comprendono throughput, p50/p99, memoria degli indici,
interferenza di compaction/GC e durata del recovery, con parametri e limiti
registrati secondo il [metodo delle prove](registro-delle-prove.md).

La [prova verticale esistente](../implementazione/prova-verticale.md) verifica
componenti generici di una Serie con crash e riapertura. Il suo coordinamento
è nella fixture C4; non esercita il protocollo NNTP, un indice ordinato per
`OVER` o il percorso completo delle transazioni multiserie. La fattibilità
del futuro server dipende anche dalla chiusura di questi collegamenti.
