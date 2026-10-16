# CI: clock quantizzato nella fixture CBOR

La CI del commit `71f814aa` si è fermata su Linux nella fixture concorrente
CBOR esistente, prima delle suite recovery. Job `117062112077`, run
[38927332158](https://github.com/gpicchiarelli/ArcDocDB/actions/runs/38927332158).
Sono conservati il record originale compresso, il sidecar, il log del job
con i suoi escape originali e una copia leggibile con i colori rimossi.
La risposta API del run fotografa lo stato al momento della lettura.

## Causa e correzione

La fixture prevede due ondate con sink e conteggi controllati. Nel campione Linux,
start/first/end dei due worker coincidono nello stesso tick; l'asserzione
`finish > start` fallisce. Il clock non garantisce un tick differente tra
eventi ordinati. Anche un overlap osservato di zero tick è ammissibile.

`2bb4cbe4` corregge soltanto le due condizioni temporali della fixture
esistente: durata non negativa e overlap non negativo. Restano rendezvous
dopo la prima lettura, due worker riusati, valori/sink esatti, numero di
letture, immutabilità, timeout e cleanup. Nessuna attesa artificiale,
nuova fixture o modifica al decoder o al prodotto CSN.

Tracciabilità e collegamenti sono passati dopo la correzione. Non sono
stati aggiunti o eseguiti test locali. Il codice prodotto coincide con
quello compilato senza avvisi in `6bdf06d8`; la CI automatica sul prossimo
commit resta distinta dalla qualifica dei nuovi calcoli CSN.

## Conservazione

Collector ufficiale riuscito con quattro worker e 17 ingressi pianificati;
checker dell'inventario chiuso terminato con exit 0. Gli
[originali](../2026-10-16-archive-csn-plan-ci-originals/archive-index.lisp)
conservano anche la distinzione fra il processo CI fallito e i due
controlli statici successivi riusciti. Le osservazioni restano fuori
dall'archivio chiuso; quattro copie esterne sono controllate per dimensioni
e SHA256. Nessun esito fallito è sostituito dall'esito di una ripetizione.
