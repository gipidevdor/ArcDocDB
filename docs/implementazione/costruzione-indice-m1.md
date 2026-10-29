# Costruzione delle immagini dal motore M1

> **Deciso (2026-10-29 → [ADR-0065](../adr/0065-costruzione-immagini-dal-motore.md))** —
> Il produttore M1 prepara un derivato dalla propria fonte canonica e lo verifica
> interamente prima del successo. Il residente resta presente.

```lisp
(let ((option (arcdocdb.engine:crea-opzione-indice-paginato
                "primary-0000000000000001.idx.tmp" :page-size 4096 :frames 2)))
  (arcdocdb.engine:costruisci-indice-paginato-motore engine option
    :max-build-payload 67108864 :max-pages 65536))
```

Il motore deve essere READY, chiamato dal proprio attore e senza richieste
in volo. L'opzione indica un nuovo nome nella directory gia' esclusiva;
il suo ID esadecimale deve stare in 1..2^60-1. Il ritorno e' lo stesso oggetto
`option`: si puo' passare ad `apri-motore :index-image` dopo avere chiuso
l'handle corrente. Il successo non cambia il backend corrente e non
mantiene FD dell'immagine. Una scrittura successiva rende obsoleto il file;
lo startup continuera' a rifiutarlo se non corrisponde piu' alla fonte.

## Piano e costruzione

Il piano acquisisce dalla root M1 depth=0 il frammento canonico, il token
della fonte, la revisione e il conteggio vivo. Prima degli array controlla
il carico massimo; poi visita al massimo C slot, verificando controlli,
payload seqlock e range nell'arena. Ogni LIVE deve contribuire esattamente
una volta; i fingerprint devono corrispondere al digest ricalcolato.

Due array u32 C conservano digest high/low; due array u32 N gli ID degli
slot e lo scratch. Otto passaggi radix stabili da otto bit ordinano i soli
ID. I 256 contatori sono riusati. Non si ordinano o duplicano le chiavi nel
piano e non si modifica l'indice sorgente.

Il produttore sceglie il numero di bit dal numero di bucket necessari,
limitato a sette per directory. Per uno span ordinato, primo e ultimo
digest identificano il prefisso comune a tutti: quel prefisso viene saltato.
Il campo residuo del figlio e' strettamente minore; la ricorsione ha al
massimo 65 chiamate. Tutti i digest identici terminano in overflow bounded
dal conteggio N. Un bucket contiene al massimo 28, 112 o 448 entry nelle
tre taglie; una directory al massimo 128 riferimenti. I riferimenti vengono
verificati e scritti postorder, root per ultima.

`crea-entry-costruzione` accetta ora `:start` e `:end`: verifica il range,
key-len e metadati, calcola il digest sullo span e ne fa una sola copia
posseduta. Le chiamate precedenti senza keyword mantengono il contratto.

## Limiti, risorse e guasti

`:max-build-payload` accetta 0..512 MiB, default 64 MiB. La riserva
conservativa e' calcolata da `payload-costruzione-immagine` prima degli
array/file: 16*C per digest/ID, contatori e word, stack di 65*128
riferimenti, lotto massimo di chiavi, buffer del builder e del verificatore,
piu' 256 KiB per gli array piccoli delle identita'/prove/cache. Non misura
header Lisp, oggetti, garbage, GC o RSS; la riserva totale del controller
non viene qualificata in questa prova. I limiti di N e C sono ancora quelli
del residente M1, al massimo C=65536 e N=57344.

`:max-pages` accetta 1..65536. Byte massimi del file, taglia, frame cache
e visite di verifica provengono dall'opzione esistente. Ogni lotto controlla
la quota prima di scrivere: non viene prenotata l'intera immagine a monte.
Un fallimento tardivo lascia il preparato e rende il motore FAULTED.
L'inventario canonico non sceglie o cancella quel preparato.

Il nome occupato e le configurazioni/quote iniziali invalide sono rifiuti
ordinari prima dell'ammissione. Errori del namespace rendono FAULTED.
Durante il lavoro l'API chiude il rientro con BUSY, senza cambiare la root
GET esistente. Errori/uscite non locali ammesse chiudono admission; il
cleanup tenta entrambi i FD e conserva la causa primaria. Non accumula FD
nella lista del motore, neppure su fallimento. Non cancella il file e non
riusa un nome o un costruttore incompleto.

Le fasi osservabili sono `:image-build-planned`, `:image-build-created`,
`:image-build-pages`, `:image-build-before-footer`, `:image-build-after-footer`,
`:image-build-after-flush` e `:image-build-verified`. L'osservatore fidato
ritorna NIL; non modifica dati privati, non trattiene buffer e non rientra.

Il completamento sigilla/flush il file, esegue fsync della directory, chiude
l'append e apre readonly con EOF esatto. Il verificatore esistente rilegge
tutte le pagine, unicita', routing e candidati contro il residente. La fonte
e la revisione vengono ricontrollate prima del footer e dopo la verifica.
Nessun nuovo punto di commit dati o pubblicazione di catalogo.

## Verifica e decisioni C1

[Test motore](../../tests/engine/image-build.lisp) e
[test degli span](../../tests/index/page-build.lisp): v1/v2, tutte le taglie,
600 chiavi, prefissi sbilanciati, chiave massima, fonte vuota/tombstone,
confronto GET dopo riavvio, rifiuti iniziali, esaurimento tardivo, rientro,
uscite non locali, causa IO preservata, entrambi i close tentati. Sei casi
SIGKILL e riavvio indipendente coprono creazione, pagine senza footer e
completamento dopo flush. Sono prove locali di processo, non power loss.

Il ramo overflow con collisione completa e' esercitato forzando soltanto
i digest nel piano privato C4: il builder ricalcola quelli reali delle chiavi.
Non si dichiara una collisione reale di XXH64. Il confronto ordinamento usa
un oracolo u64 separato e verifica anche la permutazione degli slot.

| Decisione composta (COD-54) | Copertura |
|---|---|
| Budget payload e pagine nel dominio | Limiti inferiori/superiori invalidi, riserva esatta e meno uno |
| Span arena non vuoto e contenuto | Source normale e test diretti di range invalidi |
| Stato BUSY, revisione e fonte invariati | Percorso normale, rientro respinto e revisione alterata |
| Profondita', bit residui e span del piano | Costruzione normale e rifiuti separati delle guardie |
| Close dopo successo con nuovi guasti cleanup | Due FD fittizi, ciascun close fallisce, complete T/NIL |
| Metadati/span nella factory delle entry | Test precedenti e nuovi range/ownership della copia |

Prima lettura C1: fonte canonica, slot unici, ordinamento unsigned e routing,
limiti dei cicli e profondita' decrescente. Seconda lettura: capienza prima
degli effetti, massimo due FD locali, cleanup su ogni uscita, nessun ACK o
mutazione dei dati, fonte/revisione stabili e verifica integrale finale.
Nessun nuovo stato condiviso o lock fra Serie. Le prove riproducibili sono in
[spikes/results/2026-10-29-engine-image-build/](../../spikes/results/2026-10-29-engine-image-build/).

Restano aperti selezione automatica, delta writer, snapshot, catalogo durevole
e qualifica della quota totale oltre RAM. Questa API costruisce un derivato
del residente M1, senza aumentare la capienza delle scritture.
