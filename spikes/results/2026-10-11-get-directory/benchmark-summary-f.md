# Benchmark directory GET CLOSED

12.800.000 cicli misurati; 80 finestre seriali, 240 parallele; cinque repliche fisse.

Heap seriale osservato zero in 80/80 finestre. Heap è memoria allocata nel processo, non RSS. Il parallelo include startup, gate e join; i controlli di correttezza sono dentro i tempi.

| N | V | Ciclo | Seriale, mediana/s | 4 lettori, mediana/s | Rapporto | Heap mediano, 4 lettori B |
|---:|---:|---|---:|---:|---:|---:|
| 1 | 16 | RESOLVE | 2369388 | 7159477 | 3.02x | 524224 |
| 1 | 16 | CACHE-HIT | 1120448 | 3957457 | 3.53x | 524224 |
| 1 | 256 | RESOLVE | 1460600 | 4657120 | 3.19x | 524224 |
| 1 | 256 | CACHE-HIT | 466973 | 1764641 | 3.78x | 524224 |
| 8 | 16 | RESOLVE | 2272211 | 7504690 | 3.30x | 524224 |
| 8 | 16 | CACHE-HIT | 1088791 | 3733781 | 3.43x | 524224 |
| 8 | 256 | RESOLVE | 1423082 | 4687958 | 3.29x | 524224 |
| 8 | 256 | CACHE-HIT | 462792 | 1750930 | 3.78x | 524224 |
| 32 | 16 | RESOLVE | 2124044 | 6942636 | 3.27x | 524224 |
| 32 | 16 | CACHE-HIT | 1062586 | 3708855 | 3.49x | 524224 |
| 32 | 256 | RESOLVE | 1366120 | 3504775 | 2.57x | 524224 |
| 32 | 256 | CACHE-HIT | 457530 | 1728571 | 3.78x | 524224 |
| 64 | 16 | RESOLVE | 2120666 | 6402049 | 3.02x | 524224 |
| 64 | 16 | CACHE-HIT | 1048658 | 3762050 | 3.59x | 524224 |
| 64 | 256 | RESOLVE | 1338867 | 3643817 | 2.72x | 524224 |
| 64 | 256 | CACHE-HIT | 454649 | 1572142 | 3.46x | 524224 |

Resolve comprende due selezioni directory, avvio/abbandono e oracoli. Cache-hit comprende una selezione, lettura cache, copia completa e conclusione. CLOSED v2 corrente ordinario, CSN massimo u64, cache calda: questo rate non è throughput del database né una misura I/O sostenuta. Il dominio geometrico 65.536 è distinto dai profili nativi N≤64. Carico esterno non controllato; nessuna soglia prestazionale o P99. Minimi/massimi, uno e due lettori e raw sono nel riepilogo Lisp e nel report della campagna.
