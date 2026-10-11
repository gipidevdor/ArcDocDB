# Evidenze del collegamento worker/Serie

Campagna locale del 2026-10-11. [Risultati e limiti](../../../docs/implementazione/worker-serie-risultati.md),
[metodo preregistrato](../../../docs/implementazione/worker-serie-metodo.md),
[contratto](../../../docs/implementazione/worker-serie.md),
[inventario](../../../docs/implementazione/worker-serie-decisioni.md),
[due letture](../../../docs/implementazione/worker-serie-revisione.md).

Il [catalogo flat](catalogo.lisp) identifica ogni record, descrittore e payload
con byte, SHA-256 e Git blob. I report dei processi conservano argv, ambiente,
output originali, source-blobs prima/dopo e stato; i record `*-conservazione`
conservano la finalizzazione. Tentativi falliti e preliminari restano distinti.

`source-final.lisp` identifica la versione v3 qualificata su `8101eb8`;
`source-preliminary-01/02.lisp` conservano le versioni precedenti su `2a0011f`.
`coverage-bundle.lisp` è il descrittore della conservazione gzip senza perdita
del dato nativo e di tutti gli HTML; `coverage-audit-final.lisp` enumera anche
ogni percorso non colpito. Nessuna esclusione o attestazione MC/DC.
Il risultato heap riguarda cinque campioni seriali locali, con controlli
positivi e negativi; non qualifica il motore completo.

`source-make-check.lisp` conserva il congelamento integrato su `96c0f4f`;
`full-check.lisp` registra il PASS generale. I dieci record e il master
Fase 0 sono nel [catalogo separato](../2026-10-11-worker-series-spikes-check/catalogo.lisp),
con payload gzip originali. `snapshot-selftest-bundle.lisp` conserva i due
runner di errore intenzionale, gli output e il report del self-test.
