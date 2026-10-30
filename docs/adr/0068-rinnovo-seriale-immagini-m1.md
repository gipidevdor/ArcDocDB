# ADR-0068 — Rinnovo seriale delle immagini e del delta M1

- **Stato:** Accettata nell'integrazione incrementale autorizzata dall'autore il 2026-10-30
- **Data:** 2026-10-30
- **Riferimenti:** ADR-0065, ADR-0066, ADR-0067; REQ-IDX-009, REQ-IDX-010, INV-I8, INV-I1, INV-A8, INV-P6
- **Rapporto con la specifica:** nessun formato autorevole o punto durevole nuovo; composizione seriale delle API precedenti

## Decisione

`rinnova-indice-paginato-motore` costruisce una nuova immagine dalla fonte
canonica corrente, la verifica e la attiva con un delta vuoto opzionale.
Un'unica admission BUSY impedisce GET, scritture e rientri da callback fino
alla conclusione. Non c'e' un intervallo READY fra produzione e attivazione.
Le API separate di ADR-0065 e ADR-0066 mantengono i rispettivi contratti.

Il preflight verifica quote, nome nuovo e memoria dell'intera richiesta,
prima di creare il file. La riserva somma il payload di costruzione, quello
di attivazione comprensivo della vecchia cache e del vecchio delta, piu'
il nuovo delta. Non si assume che il GC recuperi array fra le fasi.
Oggetti, header, GC e RSS restano nella riserva separata del controllore.

La fonte e la revisione del piano sono ricontrollate dopo la costruzione,
anche dopo il callback `:image-renewal-built`, prima dell'apertura per
attivazione. L'attivazione verifica nuovamente l'intero file sulla stessa
fonte corrente e ricontrolla la fonte prima dello swap. Fino ad allora la
vecchia vista e il delta restano posseduti. Lo swap privato sostituisce
vista, file e delta insieme; chiude il vecchio FD secondo ADR-0066.

Dati, CSN e WAL non cambiano. Non esiste una decisione di catalogo:
la pubblicazione e' volatile e al riavvio la selezione resta esplicita.
Una nuova immagine completa, anche non pubblicata prima del crash, puo'
essere usata soltanto dopo la normale verifica contro la fonte corrente.
Un'immagine incompleta e' rifiutata; nessun file viene sovrascritto o eliminato.

## Errori e limiti

Quote invalide, quota insufficiente o nome gia' presente conservano READY
e la vecchia vista senza consumare CSN o creare un nuovo file. Errori di
namespace seguono il preflight del produttore. Dopo admission ogni errore
o uscita non locale rende FAULTED preservando causa e cleanup: nessun
rollback a un FD consumato. Una quota pagine esaurita tardi puo' lasciare
un derivato incompleto. Dopo lo swap il nuovo FD appartiene al motore anche
se il callback impedisce il ritorno normale.

Il rinnovo libera la quota logica del delta per le scritture successive;
il chiamante sceglie quando richiederlo e fornisce un nome fresco. Non e'
un tentativo automatico nel PUT, non supera la capienza del residente e
non promette quota RSS, selezione automatica, snapshot o catalogo durevole.
[Contratto e verifica](../implementazione/rinnovo-indice-m1.md).
