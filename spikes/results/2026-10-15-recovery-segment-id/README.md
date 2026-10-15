# Proposta ID dopo recovery — 2026-10-15

[Contratto e decisioni](../../../docs/implementazione/id-segmento-recovery.md) ·
[Inventario chiuso](archive-index.lisp) ·
[Copertura](raw/audit/coverage-audit-result.lisp) ·
[Mutazioni finali](raw/recovery-id-mutation-3/report.lisp)

Otto nuovi test, 125 test recovery superati. Modello indipendente: 1.024
inventari × tre ordini × v1/v2 = 6.144 confronti. Quattro Serie private,
64 chiamate, ownership, nessuna prenotazione, limiti u64, errori e budget.

Copertura del solo nuovo file: 71/77 forme, 10/10 alternative di ramo.
Nessuna esclusione: quattro dichiarazioni e due default keyword non marcati.
Native completo conservato con gzip senza perdita; HTML originali e lettore
C4 con self-test. Nessuna pretesa di qualifica degli altri file del planner.
Campagna finale: baseline passata e 11/11 mutanti rilevati a runtime,
quattro processi isolati; nessun sopravvissuto o errore di compilazione.

Conservati anche i due tentativi iniziali falliti per il copier incompleto,
la correzione con self-test riuscito, e la campagna intermedia con 10 kill e
un rifiuto di compilazione, non contato come kill. Il mutante finale verifica
il candidato invece del successore: compila e fallisce il test sui limiti u64.
Varianti sorgente, runner e log restano distinti. Il copier deriva ora i
componenti dai due sistemi ASDF; il self-test ne verifica completezza e omissioni.

Prova verticale: 16 scenari positivi e due negativi, 71 processi e 26 SIGKILL,
ora con scelta ID di prodotto sul namespace completo della fixture (otto ID).
Resta coordinamento C4. Nessuna rimozione, prenotazione o ammissione introdotta.

Gli otto registri sono STABLE. Copertura: 26,313976 s; mutazioni finali:
103,417375 s; verticale: 80,997193 s. Tempi di esecuzione locale dei controlli,
non prestazioni del database. Nessuna revisione indipendente dichiarata.
Due letture dell'autore e limiti nella documentazione; gate complessivo aperto.
Il controllo completo del progetto è registrato in una raccolta successiva.

Manifest esplicito, quattro worker, inventario chiuso con verifica indipendente.
Artefatti Lisp da leggere come dati con READ-EVAL NIL, mai caricare o valutare.
