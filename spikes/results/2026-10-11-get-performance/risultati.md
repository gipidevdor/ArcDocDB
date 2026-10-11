# GET: correzione della cache e prestazioni

Baseline `a1b00e9`: la regressione della copia reinserita fallisce, con sorgenti stabili. Dopo la correzione, il posto rifiutato/disabilitato viene saltato e la copia valida resta raggiungibile entro otto way. Verifica seqlock, CRC, identità e CSN mantenuta.

Freeze integrato `df8b98e`: **836 test nominati + 2 smoke**, 19 test GET dedicati, 7/7 mutanti rilevati, 10 spike e controlli del repository passati. Gli agenti non hanno eseguito prove preliminari non registrate.

L'integrazione successiva con main conserva gli stessi sorgenti, suite, strumenti e documentazione fuori da `spikes/results/`. Il confronto statico è conservato nel catalogo; le misure mantengono il loro commit originale.

## Misure osservate

**14400000 GET** misurati, 90 finestre seriali e 270 gruppi paralleli. Cinque repliche per cella, COUNT 20.000 per worker e warmup 1.000, senza adattamento. Chiave 16 B, otto chiavi presenti/assenti, record v2 non prepared.

Heap seriale: 90/90 finestre con delta zero, totale 0 B. Heap parallelo: 0/270 con delta zero, totale 82565280 B. Contatore del processo; avvio/join dei thread inclusi. Nessuna attribuzione automatica dei byte al kernel GET.

Mediane in milioni di operazioni/s. La misura comprende oracolo completo della risposta, sentinelle, clock e controlli EBR. Il segmento usa page cache riscaldata e cache del DB disattivata.

| Caso | Valore B | CSN | Seriale | Thread 1 | Thread 2 | Thread 4 | Heap seriale mediano B | Heap thread 4 mediano B |
|---|---:|---|---:|---:|---:|---:|---:|---:|
| CACHE-HIT | 16 | 7 | 1.207 | 1.201 | 2.250 | 3.709 | 0 | 524224 |
| CACHE-HIT | 16 | MAX-u64 | 1.209 | 1.201 | 2.231 | 3.658 | 0 | 524224 |
| CACHE-HIT | 256 | 7 | 0.603 | 0.603 | 1.177 | 2.179 | 0 | 524224 |
| CACHE-HIT | 256 | MAX-u64 | 0.606 | 0.601 | 1.171 | 2.152 | 0 | 524224 |
| CACHE-HIT | 4096 | 7 | 0.067 | 0.067 | 0.133 | 0.262 | 0 | 524224 |
| CACHE-HIT | 4096 | MAX-u64 | 0.067 | 0.067 | 0.134 | 0.264 | 0 | 524224 |
| SEGMENT | 16 | 7 | 0.700 | 0.699 | 0.844 | 1.373 | 0 | 524224 |
| SEGMENT | 16 | MAX-u64 | 0.700 | 0.691 | 0.855 | 1.196 | 0 | 524224 |
| SEGMENT | 256 | 7 | 0.443 | 0.444 | 0.681 | 1.103 | 0 | 524224 |
| SEGMENT | 256 | MAX-u64 | 0.441 | 0.437 | 0.670 | 0.971 | 0 | 524224 |
| SEGMENT | 4096 | 7 | 0.064 | 0.064 | 0.124 | 0.241 | 0 | 524224 |
| SEGMENT | 4096 | MAX-u64 | 0.064 | 0.064 | 0.124 | 0.240 | 0 | 524224 |
| ABSENT | 16 | 7 | 2.942 | 2.876 | 5.153 | 7.125 | 0 | 524224 |
| ABSENT | 16 | MAX-u64 | 2.881 | 2.854 | 5.083 | 6.656 | 0 | 524224 |
| ABSENT | 256 | 7 | 1.530 | 1.513 | 2.881 | 4.821 | 0 | 524224 |
| ABSENT | 256 | MAX-u64 | 1.531 | 1.511 | 2.872 | 4.777 | 0 | 524224 |
| ABSENT | 4096 | 7 | 0.181 | 0.181 | 0.362 | 0.674 | 0 | 524224 |
| ABSENT | 4096 | MAX-u64 | 0.180 | 0.181 | 0.361 | 0.708 | 0 | 524224 |

## Strumenti, integrità e limiti

Autoverifica: 72 finestre funzionali e 23 diagnostiche; sensore positivo con quattro MiB trattenuti. I due comandi negativi escono con 1; la prova del self-test parziale conserva una finestra e la diagnostica del campo mancante. I fallimenti attesi rimangono nei registri.

Copertura SBCL selezionata, compreso `cache/read`: **955/1324 espressioni, 71/158 rami**. Tutte le guardie restano nel denominatore. Non è MC/DC: prepared, matrice completa di errori e integrazione del server appartengono a campagne distinte. I rapporti HTML e lo stato grezzo sono conservati.

Carico host, scheduler e cache CPU non controllati; il test usa fixture piccole, un singolo insieme cache condiviso e thread nuovi. Non misura pool persistenti, P99, rete, snapshot nel benchmark, migrazione, storico, NVMe o durability. Zero heap osservato nelle finestre non costituisce una garanzia universale.

[Metodo preregistrato](../../../docs/implementazione/get-performance-metodo.md), [revisione indipendente](../../../docs/implementazione/get-performance-revisione.md), [dati derivati](benchmark-summary.lisp). Ambiente completo, argv, sorgenti prima/dopo e output grezzi sono nei registri del [catalogo](catalogo.lisp).
