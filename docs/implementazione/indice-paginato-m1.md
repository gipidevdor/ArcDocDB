# Indice paginato nello startup e nel GET M1

> **Deciso (2026-10-29 → [ADR-0064](../adr/0064-adozione-indice-paginato-m1.md))** —
> Collegamento seriale dei derivati verificati al motore; catalogo durevole e
> selezione automatica restano da attuare.

`arcdocdb.engine:crea-opzione-indice-paginato` riceve un nome foglia
`primary-<16 cifre esadecimali minuscole>.idx.tmp` e budget espliciti:
`:page-size` (4096/16384/65536), `:frames` (1..64), `:max-visits`
(1..2^60-1) e `:max-bytes` (almeno tre pagine, massimo 65538*65536).
I default sono 4096, 2, 16777216 e 268435456. Il nome e' copiato.
I budget del derivato sono separati da quelli dei segmenti dati.
`:create t` e `:index-image` sono incompatibili, rifiutati prima di qualunque I/O.

```lisp
(arcdocdb.engine:apri-motore directory archive-id series-id
  :clock clock
  :index-image
  (arcdocdb.engine:crea-opzione-indice-paginato
    "primary-0000000000000001.idx.tmp" :page-size 4096 :frames 2))
```

L'opzione si riferisce a un file gia' costruito/sigillato con le
[primitive delle pagine](costruzione-indice-paginato.md) e il
[container ARCIRF01](immagini-indice-paginato.md). Non costruisce il dataset,
non assegna ID o nomi canonici e non crea un record di catalogo. Un ID nel
nome non conferisce autorita'. L'esportazione completa del residente e' ora disponibile nel
[produttore M1](costruzione-indice-m1.md), con verifica prima del successo.

Il motore legge le fonti canoniche e completa il checkpoint ordinario,
ricostruisce il residente e ne ricava cardinalita' esatta e candidati. Il
token della fonte contiene versione dati e posizione dell'ultimo record
committed, comprese le tombstone: quattro u64 little endian, nessun digest.
CSN e UUID sono verificati separatamente. Un nuovo ACTIVE vuoto non cambia
il token. Il primo record con CSN zero e' distinto dalla fonte senza record
attraverso l'ID segmento nonzero. Nessun piano con compaction/split del
residente e' ammesso da questo adattatore.

`fonte-indice-motore` restituisce una copia posseduta della fonte corrente
soltanto all'owner READY senza richiesta in volo. Una nuova scrittura la
rende obsoleta; non e' una prenotazione. Durante il recovery il validatore
confronta tutte le cinque word con il residente, azzerando nel confronto
solo l'offset dell'arena residente. Il verificatore del container continua
a controllare hash, root, unicita', routing, conteggio e budget cumulativo.

L'[attivazione a caldo](attivazione-indice-m1.md) permette anche il passaggio
al paginato sullo stesso handle, dopo una nuova verifica integrale.

Il file e l'EOF provengono dalla medesima apertura relativa readonly e
verificata, sotto il lock di directory gia' esistente. Il FD viene posseduto
in uno slot separato prima della verifica ed e' chiuso anche su startup
incompleto. Il successivo [protocollo di attivazione e ritiro](attivazione-indice-m1.md)
chiude il FD quando la root viene sostituita o ritirata, prima del close finale
dell'handle. Nessun GET concorrente puo' trattenere quella capacita'.

L'ammissione READY segue la verifica completa. File selezionato mancante,
EOF o fonte incompatibili, budget esaurito e guasti di lettura rifiutano
l'apertura senza usare il residente come fallback. Il recovery canonico
puo' gia' aver completato checkpoint e nomi; il derivato non viene modificato.
L'assenza dell'opzione sceglie il percorso residente esistente.

La vista GET mantiene un callback readonly `:lookup`, fidato del controller,
con firma `(key start end probe output)` e risultato `:live`, `:absent` o
`:retry-limit`. Il contratto richiede limiti finiti, nessuna allocazione sul
percorso caldo, output intatto su miss, stessa fonte/Serie e ownership coerente
con EBR. M1 installa il callback dell'attore: nessun uso concorrente della
cache seriale. Il percorso GET standard senza callback e' invariato.

`modo-indice-motore` espone `:paged` o `:resident` all'owner READY. Con una
root paginata, anche l'assenza deriva da quella root; guasti non attivano
un secondo lookup. Resolver, verifica della cornice/valore e conclusione GET
restano quelli canonici. Prima di una scrittura ammessa il riferimento
paginato viene ritirato senza allocazione. Input/capienza rifiutati prima
dell'ammissione conservano invece la root e le frontiere. PUT, DELETE e
DELETE di chiave assente avanzano la fonte prima dell'ACK.

## Verifica e decisioni

Le prove in [tests/engine/images.lisp](../../tests/engine/images.lisp) coprono
formati dati v1/v2 e tutte le tre taglie, una cache con un frame, overflow,
GET live/miss, update/delete dopo ritiro, checkpoint ripetuti senza scritture,
fonte vuota e sole tombstone, immagine obsoleta, payload falsificato con
fonte esatta, budget/configurazione e rilascio dopo uscita non locale.
Un residente deliberatamente guasto dimostra che il GET selezionato usa
il paginato. Le prove preesistenti del resolver e del container restano attive.
Sei prove SIGKILL (tre frontiere in v1/v2) riavviano processi indipendenti prima
della verifica, dopo l’adozione e dopo il flush della prima scrittura; verificano
riuso oppure rifiuto della vecchia immagine e preservazione dei suoi byte.
Sono prove di processo locale, non di power loss o qualifica Linux.

| Decisione composta C1 (COD-54) | Copertura |
|---|---|
| Nome: tipo, lunghezza, prefisso, suffisso, hex | NIL, nomi riservati/esterni, caratteri non hex; nome valido |
| CREATE e immagine selezionata | Init senza immagine, recovery con immagine, combinazione rifiutata prima di I/O |
| Budget: taglia, frame, visite, byte, minimo tre pagine | Ogni componente invalido separato, tre taglie valide |
| Fonte: segmento/lunghezza positivi, prima posizione oppure CSN crescente | Replay/scrittura normali, fonte vuota e tombstone; test mirato dei rifiuti |
| Residente M1: depth=0 e singolo riferimento | Root normale; test mirato di geometrie fuori M1 |
| Candidato: CSN, location, flag/lunghezza chiave, lunghezza record, END | Immagine valida; alterazioni indipendenti; test diretto del validatore |
| Recovery: stato recovering e root privata assente | Startup normale; test mirato di chiamate fuori fase |

Due letture C1: prima sul legame al prefisso canonico, conteggio e confronto
dei candidati; seconda su lifetime dei FD, ritiro prima del commit, fail-stop,
budget e assenza di stato condiviso fra Serie. I cicli ereditano i limiti
di resident lookup e verificatore paginato; non si aggiunge un ciclo dataset.
Le evidenze riproducibili sono raccolte in
[spikes/results/2026-10-29-engine-index-images/](../../spikes/results/2026-10-29-engine-index-images/).

Il residente resta allocato e limita ancora PUT e replay. Non si misura qui
capacita' oltre RAM, throughput, RSS, migrazione automatica, snapshot o
pubblicazione durevole nel catalogo. Questo incremento chiude soltanto il
collegamento seriale startup/GET/ritiro del profilo M1.

## Ricerca opzionale allo startup

[ADR-0070](../adr/0070-scoperta-readonly-immagini-m1.md) aggiunge
`:index-discovery`, alternativa alla selezione esplicita qui descritta:
[scansione bounded e verifica completa](scoperta-indice-m1.md). La fonte
canonica e' sempre ricostruita prima della ricerca; nessun catalogo nuovo.
