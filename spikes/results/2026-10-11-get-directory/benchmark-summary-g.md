# Benchmark directory GET CLOSED

12.800.000 cicli misurati; 80 finestre seriali, 240 parallele; cinque repliche fisse.

Heap seriale osservato zero in 80/80 finestre. Heap è memoria allocata nel processo, non RSS. Il parallelo include startup, gate e join; i controlli di correttezza sono dentro i tempi.

| N | V | Ciclo | Seriale, mediana/s | 4 lettori, mediana/s | Rapporto | Heap mediano, 4 lettori B |
|---:|---:|---|---:|---:|---:|---:|
| 1 | 16 | RESOLVE | 2327747 | 6878170 | 2.95x | 524224 |
| 1 | 16 | CACHE-HIT | 1119194 | 3917920 | 3.50x | 524224 |
| 1 | 256 | RESOLVE | 1452011 | 4476025 | 3.08x | 524224 |
| 1 | 256 | CACHE-HIT | 467552 | 1742350 | 3.73x | 524224 |
| 8 | 16 | RESOLVE | 2251492 | 6921613 | 3.07x | 524224 |
| 8 | 16 | CACHE-HIT | 1080672 | 3686806 | 3.41x | 524224 |
| 8 | 256 | RESOLVE | 1414527 | 4595852 | 3.25x | 524224 |
| 8 | 256 | CACHE-HIT | 460246 | 1745048 | 3.79x | 524224 |
| 32 | 16 | RESOLVE | 2129472 | 5142710 | 2.42x | 524224 |
| 32 | 16 | CACHE-HIT | 1057418 | 3457217 | 3.27x | 524224 |
| 32 | 256 | RESOLVE | 1363234 | 4359673 | 3.20x | 524224 |
| 32 | 256 | CACHE-HIT | 457153 | 1750241 | 3.83x | 524224 |
| 64 | 16 | RESOLVE | 2066329 | 6372979 | 3.08x | 524224 |
| 64 | 16 | CACHE-HIT | 1046901 | 3744091 | 3.58x | 524224 |
| 64 | 256 | RESOLVE | 1323714 | 4378763 | 3.31x | 524224 |
| 64 | 256 | CACHE-HIT | 449045 | 1709365 | 3.81x | 524224 |

Resolve comprende due selezioni directory, avvio/abbandono e oracoli. Cache-hit comprende una selezione, lettura cache, copia completa e conclusione. CLOSED v2 corrente ordinario, CSN massimo u64, cache calda: questo rate non è throughput del database né una misura I/O sostenuta. Il dominio geometrico 65.536 è distinto dai profili nativi N≤64. Carico esterno non controllato; nessuna soglia prestazionale o P99. Minimi/massimi, uno e due lettori e raw sono nel riepilogo Lisp e nel report della campagna.
