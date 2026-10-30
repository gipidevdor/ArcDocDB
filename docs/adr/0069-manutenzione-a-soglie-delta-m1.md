# ADR-0069 — Manutenzione a soglie del delta M1

- **Stato:** Accettata nell'integrazione incrementale autorizzata dall'autore il 2026-10-30
- **Data:** 2026-10-30
- **Riferimenti:** ADR-0067, ADR-0068; REQ-IDX-010, REQ-LIM-003, INV-I8, INV-I1, INV-A8, INV-P6
- **Rapporto con la specifica:** nessun formato o punto durevole nuovo; policy locale per richiedere il rinnovo seriale

## Decisione

Il controller puo' configurare una policy immutabile con soglia intera
1..100 percento, default 75. Il rinnovo e' richiesto quando il numero di
chiavi toccate oppure i byte occupati nel delta raggiungono la rispettiva
soglia. Il confronto e' inclusivo ed esatto, con prodotti interi che
restano fixnum SBCL64, senza arrotondamento in virgola mobile.

`rinnovo-indice-richiesto-p` restituisce la decisione sul motore READY con
delta attivo; non alloca intenzionalmente, non accede ai file e non prenota
spazio. Contatori fuori quota o incoerenti, oppure delta senza vista,
rendono FAULTED; una richiesta su un modo legittimo senza delta e' invalida.
La decisione non e' un'autorizzazione ad ammettere una scrittura futura.

`mantieni-indice-paginato-motore` restituisce `:mantieni` sotto soglia,
senza creare file o consumare il nome candidato. Alla soglia richiede un
solo rinnovo di ADR-0068, con nome fornito dal controller e le stesse quote
chiavi/byte del delta corrente; restituisce `:rinnovato` solo dopo il successo.
La capienza del payload totale e la freschezza del nome sono verificate
soltanto se serve il rinnovo. I domini delle opzioni sono sempre validati.

Non c'e' callback fra lettura dei contatori e avvio del rinnovo: l'owner
seriale mantiene stabile la scelta. Il rinnovo esclude rientri con BUSY,
ricontrolla la fonte e conserva ownership/errori secondo ADR-0068. Un
preflight ordinario conserva READY e il delta precedente; un errore dopo
admission rende FAULTED. Nessun retry, timer o schedulatore nuovo.

## Limiti

La policy puo' essere condivisa readonly fra motori; contatori e attuazione
restano privati di ciascuna Serie. La chiamata e' richiesta dal controller,
non inserita nel percorso PUT/GET. Non genera nomi, non libera vecchi file,
non sceglie il modo residente/paginato e non riduce il residente in RAM.
Una chiave nuova puo' ancora esaurire la quota prima del prossimo controllo.
Catalogo durevole, writer paginato autonomo e selezione automatica di modo
restano aperti. [Contratto e prove](../implementazione/manutenzione-indice-m1.md).
