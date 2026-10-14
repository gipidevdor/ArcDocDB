# Fonti GET: lifetime nativo e ritiro EBR

Metodo preregistrato: [get-lifetime.md](../../../docs/implementazione/get-lifetime.md).
Freeze: `a9e405113b0386afadf4a291a6f64fc82308ea1a`.
Il prodotto e i formati sono invariati rispetto a `ad829a40`.

La suite directory GET esegue **72 test**, inclusi quattro nuovi casi nei
formati v1/v2: candidato precedente e fonti superset, capacità CLOSED
trattenuta durante lettura/copia, condizione tipizzata e uscita non locale.
Pin e output sono verificati prima del cleanup esterno; il claim è negato
durante i due rendezvous e riesce dopo il join. Una sola close nativa
precede il completamento del ticket. Un nuovo GET usa ACTIVE anche dopo
la chiusura del vecchio FD. Nessuno snapshot è registrato.

La campagna scoped è `4000996786-command-63808-0`. La verifica completa R2
ha **1.410 test in 32 suite e due smoke test**, con compilazione senza
warning, controlli statici, evidenze e spike: outer
`4000996924-command-75541-0`, inner `4000996928-command-75705-0`.
Tutti questi comandi hanno esito OK, exit zero e sorgenti stabili.

Il primo tentativo completo è conservato come **FAILED**, exit 2 e sorgenti
stabili: outer `4000996786-command-63809-0`, inner
`4000996790-command-63888-0`. L'asserzione preesistente CBOR float
`PLUSP OVERLAP` è fallita dopo i controlli dei risultati dei worker.
Il rilascio dei semafori non garantisce la sovrapposizione temporale;
il codice CBOR è invariato. Il report non stampa gli intervalli falliti:
nessuna causa o processo esterno è attribuito. R2 è una nuova osservazione
positiva e non corregge questa fragilità temporale. Il carico esterno non
è controllato.

Gruppi espliciti completi: output originali e configurazioni, tre cache
ASDF private (anche R1), fixture negative del runner, spike e auditor.
Gli indici riportano dimensioni e SHA delle copie; la conservazione è
controllata con inventari integrali freschi. Report e FASL sono dati:
lettura con READ-EVAL NIL ed EOF, mai LOAD. Gli helper C4 hanno provenienza
e SHA conservati; i loro sorgenti sono distinti dalle evidenze lette.

La prova riguarda l'ordine volatile controllato e la vita della capacità
acquisita. Decisione durabile del catalogo, retention generale, rotazione
e rimozione durabile dei segmenti restano precondizioni o lavoro aperto.
Nessuna qualifica C1, zero heap, prestazionale o MC/DC globale.
