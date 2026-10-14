# Rendezvous dei worker nei test CBOR

Metodo preregistrato prima della verifica della correzione. Il tentativo
locale completo R1 della campagna [lifetime GET](get-lifetime.md) è fallito
sull'overlap dei worker float; la CI della PR 13, run `38634044870`, è
fallita su macOS sull'overlap dei worker tag. Ubuntu è riuscito. Le prove
originali e gli esiti falliti restano distinti e conservati.

Il rilascio simultaneo di due crediti del semaforo non impone allo
scheduler di avviare entrambi i corpi prima che uno termini. Un intervallo
non sovrapposto può quindi fallire il test dopo risultati corretti.
La correzione riguarda soltanto le fixture float/tag, senza cambiare
encoder, formati, conteggi di elementi, oracoli o API di prodotto.

## Ordine controllato

Ogni worker riusato registra il tempo reale iniziale, codifica il primo
elemento e verifica risultato, immagine completa e contributo al sink.
Registra poi il tempo del primo checkpoint, segnala `ready` e attende
`go`. Il controller attende entrambi i checkpoint prima di consentire le
rimanenti operazioni. Ogni onda mantiene semafori distinti; attese e join
restano limitati e il cleanup libera le gate prima di arrestare i worker.

Nessun worker può terminare il proprio corpo prima che l'altro abbia
completato il primo elemento. Si verificano `start <= first <= finish`,
`max(first) <= min(finish)`, durata positiva e overlap positivo. I tempi
sono osservati, senza arrotondamenti, clamp o timestamp sintetici. Prima
delle asserzioni temporali vengono stampati e scaricati gli intervalli,
i checkpoint, i sink e l'overlap, così anche un nuovo fallimento conserva
la diagnosi. Gli oracoli sui valori e sull'immutabilità restano invariati.

La metrica è l'intervallo wall della **fixture** e comprende il rendezvous
e i controlli. Dimostra l'interleaving imposto dei compiti; non misura
latency del solo encoder, simultaneità CPU o scaling. I due helper hanno
un solo chiamante ciascuno nei test e non sono usati dai benchmark.

## Verifica

Prima delle campagne viene congelato un nuovo commit di sorgenti e
metodo. Una revisione indipendente verifica posizione del checkpoint,
conteggi e cleanup. `make check` ricompila senza warning ed esegue tutte
le suite, compresi i quattro casi lifetime v1/v2 invariati; la CI completa
verifica poi Linux e macOS. Output originali, errori, configurazioni e
cache private sono conservati; i dati sono letti con READ-EVAL NIL ed EOF,
mai caricati come codice. Nessuna promozione di qualifica C1 o prestazionale.

Requisiti: REQ-CBR-004, REQ-CBR-007, REQ-CON-005, REQ-AFF-004,
REQ-AFF-008 e REQ-VAL-001.
