# ADR-0067 — Delta seriale limitato per l'immagine primaria M1

- **Stato:** Accettata nell'integrazione incrementale autorizzata dall'autore il 2026-10-29
- **Data:** 2026-10-29
- **Riferimenti:** ADR-0064, ADR-0065, ADR-0066; REQ-IDX-010, INV-I8, INV-I1, INV-P6
- **Rapporto con la specifica:** nessun formato durevole nuovo; estende il ritiro prima della scrittura di ADR-0066 con delta esplicito

## Decisione

L'attivazione seriale puo' prenotare un insieme esatto delle chiavi toccate
con `:delta-keys` e `:delta-key-bytes`. Entrambi zero mantengono il contratto
precedente: la prima scrittura ammessa ritira l'immagine. Entrambi positivi
abilitano il delta, senza cambiare lo startup e senza selezione automatica.

Il delta conserva solo membership: digest, range e copia della chiave.
Per ogni chiave toccata GET consulta il residente canonico corrente, anche
se assente per tombstone. Per le altre consulta l'immagine verificata.
Una cancellazione di chiave assente viene comunque registrata: una chiave
toccata non ricade mai sul derivato precedente. Le collisioni di digest
richiedono confronto dei byte completi. Non c'e' fallback su errore I/O.

Tabella open-addressing al massimo meta' piena, linear probing limitato
alla capacita', arena append-only e array sono prenotati all'attivazione.
Il preflight contabilizza vecchio e nuovo delta oltre ai reader/cache.
Esaurire chiavi o byte e' un rifiuto ordinario prima del CSN e del WAL:
READY, immagine e file restano invariati. Aggiornare una chiave gia'
registrata non consuma spazio aggiuntivo, anche dopo DELETE e resurrezione.
Nessuna eliminazione o riuso di entry fino alla prossima pubblicazione.

Dopo preflight e admission BUSY si copia la membership prima del commit;
SEAL resta l'unico punto di atomicita' dei dati. Qualsiasi uscita incompleta
rende FAULTED e impedisce letture di stato parziale. Uno swap verificato
sulla nuova fonte sostituisce insieme vista e delta vuoto. Ritiro e close
azzerano entrambi. Ownership, esclusione dei callback e cleanup restano
quelli di ADR-0066; nessuna risorsa condivisa fra Serie.

## Limiti e verifica

Il residente resta interamente presente e ne restano i limiti di capienza;
questo incremento non abilita un indice maggiore della RAM. Il delta non
si persiste e non autorizza il recupero di un'immagine obsoleta: il riavvio
ricostruisce sempre il canonico e il candidato esplicito deve corrispondere
all'intera fonte corrente. Compattazione del delta, catalogo durevole,
writer interamente paginato, snapshot e selezione automatica restano aperti.

[Contratto, decisioni e prove](../implementazione/delta-indice-m1.md).
