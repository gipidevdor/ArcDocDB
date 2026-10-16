# Adozione dell'ACTIVE nel runtime — 2026-10-16

Nuovo ACTIVE preparato, controller unico per oggetto log canonico e registro
CSN del runtime condiviso dalle Serie. Sorgenti finali congelati in
`a5ef8997834cb7597766fc7fe48985db3b6f4f14`; tutti gli agenti chiusi prima
dei run. [Metodo preregistrato](inputs/method.md.txt) e
[revisione statica](inputs/review.lisp.txt) precedono le verifiche.

## Prove

**19 nuove funzioni di test composte:** otto sul binding e undici
sull'adozione. Le suite runtime e Serie contano complessivamente **147
funzioni**, tutte superate nella diagnostica corretta e nella copertura
finale. Le 26 combinazioni parametrizzate dell'adozione restano distinte
dal conteggio delle funzioni.

- Un solo controller canonico, anche contro un secondo registro CSN;
  getter stabile, capacità/radice/offset generici preservati.
- Gare con due/quattro worker e osservatore, registri uguali o diversi;
  deadline e cleanup finiti. Nessuna garanzia di forzare il CAS perdente.
- Prepared da API pubbliche e FD nativi v1/v2: ambito runtime EQ,
  identità writer, associazione delle capacità esatte ancora aperte,
  frontiere written/durable entrambe 64. Nessun I/O o CSN nella finestra
  di adozione; nessuna lease acquisita implicitamente.
- Rifiuti: ambito recovery o clone, log già bound, log guasto o non
  segmento, ID/versione/origine incoerenti, capacità chiuse o alias dello
  stesso inode, append già avanzato. Nessun candidato pubblicato.
- Due Serie, base `#x12345678ffffffff`, nuovi lotti M+1/M+2 realmente
  scritti e sincronizzati; root precedente conservata prima del durable,
  GET corrente e con snapshot comune, file confrontati con oracolo
  bytewise. Composizione seriale; decisione catalogo assunta dalla fixture.

## Copertura grezza

Scope esatto `runtime-active`, contatori azzerati dopo load; suite runtime
e Serie, cache separata dal controllo completo.
[HTML finale originale](coverage/product/cover-index.html).

| File | Forme raggiunte/totali | Rami raggiunti/totali |
|---|---:|---:|
| runtime/active | 71/76 | 10/10 |
| series/types | 124/145 | 16/28 |
| wal/types | 130/167 | 7/26 |
| **Totale dei tre file** | **325/388** | **33/64** |

Nessuna esclusione dal denominatore. Restano dichiarazioni e codice
generato, postverifiche difensive della factory e contesto WAL non
raggiunti. In questa campagna il rifiuto dentro il CAS non è raggiunto:
i worker perdenti sono rifiutati dal controllo anticipato. Il self-test
verifica selezione esatta dello scope e rilevamento del ramo mancante.
Forme/rami SBCL non sono MC/DC né qualifica C1.

## Comandi, varianti e correzioni

| Record originale | Esito |
|---|---|
| [tracciabilità iniziale](processes/trace-initial/report.lisp) | OK, matrice già coerente |
| [prima diagnostica](processes/diagnostic-first/report.lisp) | FAILED, 145/147 |
| [diagnostica corretta](processes/diagnostic/report.lisp) | OK, 147/147 |
| [self-test copertura](processes/coverage-self-test/report.lisp) | OK |
| [prima copertura](processes/coverage-first/report.lisp) | OK, variante intermedia |
| [primo controllo completo](processes/check-first/report.lisp) | FAILED, avviso nell'helper nuovo |
| [copertura finale](processes/coverage/report.lisp) | OK, 147/147 |
| [controllo completo finale](processes/check/report.lisp) | OK: compilazione senza avvisi, test, lint, tracciabilità, link, evidenze e dieci spike |

Varianti originali conservate nei record e nella storia Git:

1. `068521d1a20d1c268ec5fb05f4a8114c3b73a4a5`: tutte le nuove prove
   passano; due vecchi oracoli visitano anche il controller attraverso il
   nuovo backlink: il dominio osservato include mutazioni attese.
2. `66b1d2028005106275eddeb66f2b1a277399587e`: oracoli limitati al
   dominio WAL/CSN originale, con identità del binding verificata
   separatamente e root/salute/cursori controllati esplicitamente; 147/147.
   Il controllo completo rileva `NATIVE` inutilizzato in `rba-commit`.
3. `a5ef8997834cb7597766fc7fe48985db3b6f4f14`: parametro rimosso sia
   dalla firma sia dalla chiamata, senza modificare il prodotto.

I record conservano revisione, blob prima/dopo, ambiente, argv, esiti e
stdout/stderr originali, inclusi i due fallimenti. La diagnostica autentica
l'helper prima/dopo e registra separatamente ogni test. Il controllo
completo include i self-test C4 e i dieci spike, senza benchmark.
La revisione finale esegue 38 test runtime e 109 test Serie. Il self-test
del verificatore parallelo conserva 48 casi e 756 controlli. Report dei
self-test snapshot/reader e relativi log dei figli, report C4 parallelo
e record dei dieci spike sono inclusi anche separatamente in `raw/`.

## Conservazione e limiti

Collector comune, manifest esplicito, quattro worker, hash degli ingressi
e delle copie e processo indipendente sull'inventario chiuso. Nessun
append dopo la chiusura. Produttore e controllo finale nella raccolta
sorella; cache FASL, stato di copertura, espansioni gzip e fixture negative
C4 ricostruibili escluse. Gli esiti delle fixture negative rimangono nei
report originali; non si duplicano i loro finti protocolli malformati.

Unicità per oggetto log, esclusione fisica del file e canonicalità del
wrapper a carico del proprietario. Il prepared non certifica l'EDIT del
catalogo. Raccolta delle vecchie fonti, Recovery Manager e ammissione
restano aperti. Anche COD-24 complessivo attende il confine generale di
arresto del coordinatore: il getter non può mutare un controller estraneo.
Recupero del binding dopo interruzione fra CAS riuscito e ritorno:
argomento statico, nessuna prova dinamica dedicata.

Nessun benchmark nuovo, né attestazione su throughput, P99, RSS, heap zero,
power loss, Linux o piattaforma di riferimento. Verifiche locali Darwin
arm64/SBCL 2.6.9, carico esterno non controllato; nessun gate generale del
motore promosso dal solo successo di questa campagna.
