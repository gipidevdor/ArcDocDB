# Valutazione

[Documentazione](../README.md) · [Implementazione](../implementazione/README.md)

Ogni risultato vale per il comando, i dati, la macchina e il perimetro dichiarati.
Un microbenchmark o una prova di componente non qualifica il motore completo.

## Leggere le prove

| Per | Riferimento |
|---|---|
| Vedere le campagne recenti selezionate | [Risultati](../../spikes/results/README.md) |
| Ripetere gli esperimenti | [Spike](../../spikes/README.md) e [piano](piano-spike.md) |
| Conservare o verificare una prova | [Registro delle prove](registro-delle-prove.md) e [archivio storico](../../spikes/evidence/README.md) |
| Valutare i rischi e i costi | [Registro dei rischi](registro-rischi.md), [analisi critica](analisi-critica.md), [stime](stime-ordine-di-grandezza.md) |
| Capire il primo impiego | [Caso d'uso NNTP](caso-duso-nntp.md) |

## Stato della verifica

Il percorso M1 compone startup, recovery e servizio Unix. Le sue prove e i suoi
limiti sono descritti nell'[implementazione](../implementazione/README.md).
Prestazioni complessive, carico prolungato, scale oltre RAM e gate di rilascio
richiedono le rispettive campagne.

Le [regole dei benchmark](../13-benchmark.md) distinguono misure, target e stime.
La [cronologia delle valutazioni](cronologia.md) conserva i giudizi iniziali,
i controesempi e le campagne datate, senza presentarli come stato corrente.
