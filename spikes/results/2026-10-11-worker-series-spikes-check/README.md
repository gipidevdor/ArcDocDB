# Controllo generale Fase 0 del collegamento worker/Serie

Parte della singola `make check` finale, base integrata `96c0f4f`.
[Risultati e limiti](../../../docs/implementazione/worker-serie-risultati.md),
[record del controllo completo](../2026-10-11-worker-series/full-check.lisp).

Il [master originale](report.lisp), ID `4000709427-check-16929-0`, è
`:COMPLETE`; tutti i dieci record SPK hanno sorgenti stabili ed exit 0.
SPK-07 è `:PASS`, gli altri sono `:OK`; stderr dei singoli processi vuoti.
Il [catalogo](catalogo.lisp) identifica i byte originali di master,
singoli record e [finalizzazione](conservazione.lisp), inclusi i payload gzip
del master e di SPK-07. Compressione senza perdita, senza ricodifica dei raw.
È una verifica di correttezza; non comprende nuovi benchmark degli spike.
