# Attivazione delle immagini sul motore aperto

> **Deciso (2026-10-29 → [ADR-0066](../adr/0066-attivazione-seriale-immagini-m1.md))** —
> Pubblicazione privata seriale dopo verifica completa e chiusura dei file al ritiro.

```lisp
(let ((option (arcdocdb.engine:crea-opzione-indice-paginato
                "primary-0000000000000001.idx.tmp" :page-size 4096 :frames 2)))
  (arcdocdb.engine:costruisci-indice-paginato-motore engine option)
  (arcdocdb.engine:attiva-indice-paginato-motore engine option
    :max-activation-payload 16777216))
```

Entrambe le API richiedono l'owner READY senza altra richiesta in volo.
La costruzione mantiene il contratto precedente, con FD locali chiusi e
nessuna attivazione implicita. L'attivazione rilegge il candidato e ritorna
NIL soltanto dopo pubblicazione e close del precedente. I GET successivi
usano la nuova root, senza riavvio. Una scrittura fra le due chiamate
rende obsoleto il file ed e' rilevata dalla verifica della fonte.

## Verifica e ownership

Durante BUSY il motore cattura fonte e revisione dell'indice canonico,
apre il nome readonly con EOF esatto e usa lo stesso verificatore dello
startup: fonte/seme, CRC, tutte le pagine, routing, unicita', conteggio
e confronto delle cinque word contro il residente. Il controller rilegge
fonte/revisione prima dello swap. Non ci sono GET o mutazioni concorrenti.

Il candidato aperto e' locale. Dopo la verifica, motore, vista e file
devono essere associati esattamente; lo stesso oggetto file non puo'
essere installato al posto di se stesso. Si trasferiscono ownership del
nuovo FD, opzione e vista, poi si chiude il precedente. Non si aggiungono
file alla lista dei segmenti del motore: una sola immagine attiva e un
solo candidato locale. Anche riattivare lo stesso nome rilegge da una
nuova capacita' e chiude quella vecchia.

Il ritiro azzera vista, opzione e ownership prima del close. Viene usato
dalla prima scrittura ammessa e dal cleanup finale, incluso lo startup
fallito. Non alloca intenzionalmente e non crea liste di file ritirati.
Un file chiuso resta inutilizzabile anche se il vecchio reader conserva
frame caldi: la verifica della capacita' precede ogni lookup.

`:max-activation-payload` accetta 0..512 MiB, default 16 MiB. La riserva e':
65536 + 65535 + 80 byte, piu' `(frame-nuovi + 5) * taglia-nuova`, piu'
`(frame-vecchi + 2) * taglia-vecchia` se esiste una root attiva. E' una
riserva conservativa di payload array, inclusa la vecchia cache trattenuta;
non misura header Lisp, oggetti, GC o RSS. La riserva totale del controller
e la migrazione oltre RAM restano da qualificare.

## Errori e confini

Budget/configurazione iniziali rifiutati non aprono file e mantengono READY.
Da BUSY in poi tutti gli errori e le uscite non locali rendono FAULTED,
secondo il confine M1 esistente. Prima della pubblicazione il candidato
locale viene chiuso e la vecchia root/file restano intatti; il rifiuto non
autorizza ulteriori GET sull'handle FAULTED. Non si trasforma corruzione o
budget esaurito in assenza o fallback.

Dopo la pubblicazione il nuovo file appartiene al motore e viene chiuso
dal cleanup finale. Un close del precedente fallito o un errore successivo
non ripristinano una root che potrebbe riferire un file gia' chiuso. Il
modulo I/O consuma lo stato prima dell'unico close, senza retry anche su
esito ambiguo; si applicano i suoi limiti documentati.

Prima di PUT/DELETE il ritiro precede il consumo CSN e qualsiasi effetto
WAL. Se il close fallisce, il commit non inizia. I preflight ordinari
della scrittura precedono invece il ritiro e lasciano intatta l'immagine.
Il cleanup finale tenta comunque tutte le altre risorse e conserva ogni
guasto secondario. Nessun file derivato viene cancellato o riscritto.

Fasi dell'osservatore: `:before-image-activation`, `:image-activation-verified`,
`:before-image-publication`, `:image-published`. Ritorna NIL, non trattiene
capacita' e non rientra nel motore. I cambiamenti di ownership/root avvengono
senza callback intermedia.

## Verifica C1

[tests/engine/image-activation.lisp](../../tests/engine/image-activation.lisp)
copre v1/v2, tre taglie, sostituzioni ripetute con conteggio dei FD nativi,
GET dopo attivazione, vecchi reader a cache calda, chiusura al ritiro,
quota transitoria comprensiva del vecchio backend, owner e non rientro,
candidati mancanti/corrotti/obsoleti, errori e nonlocal exit prima/dopo swap.
Le prove dei close usano capacita' fittizie solo per ownership e iniezione;
le immagini end-to-end sono prodotte e verificate dall'API di prodotto.
Un wrapper sul close reale simula l'esito negativo e verifica che il primo
PUT non consumi CSN o modifichi WAL. Sei casi SIGKILL con processi indipendenti
coprono prima/dopo swap e dopo flush della prima scrittura in v1/v2. Non
sono prove di perdita di alimentazione.

| Decisione composta C1 (COD-54) | Copertura |
|---|---|
| Stato startup e assenza separata di vista/file/opzione | Guardie isolate e startup normale |
| BUSY, revisione e fonte al gate finale | Guardie isolate e mutazione prima dello swap |
| BUSY, prova presente, file nuovo e binding esatto | FD fittizi con ogni rifiuto prima della mutazione |
| Candidato presente e ownership non trasferita nel cleanup | Nessuna apertura, pre-swap, post-swap |
| BUSY, READY e controller sano al termine della richiesta | Percorso normale e guardie isolate dopo swap |

Prima lettura C1: candidato completamente verificato, fonte/revisione intatte,
quota del vecchio e nuovo payload, pubblicazione seriale senza borrower.
Seconda lettura: massimo due FD delle immagini, ownership prima dei close,
causa primaria conservata, ritiro prima del WAL e cleanup su ogni uscita.
Nessun nuovo stato/lock condiviso fra Serie; il solo attore M1 rende seriali
queste operazioni. Evidenze in
[spikes/results/2026-10-29-engine-image-activation/](../../spikes/results/2026-10-29-engine-image-activation/).

L'attivazione e' volatile: al riavvio `:index-image` rimane esplicito.
Il residente e' ancora presente e limita le scritture. Non si dichiara
selezione automatica, delta writer, snapshot o catalogo durevole.

## Estensione del delta

[ADR-0067](../adr/0067-delta-seriale-indice-m1.md) aggiunge le opzioni
`:delta-keys` e `:delta-key-bytes`: entrambe zero mantengono il ritiro descritto
qui; entrambe positive conservano l’immagine attraverso PUT/DELETE con
[membership esatta e quote separate](delta-indice-m1.md). Il delta precedente
e quello nuovo si aggiungono alla formula payload indicata sopra.
