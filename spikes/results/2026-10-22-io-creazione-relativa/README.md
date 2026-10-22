# Creazione relativa dei temporanei

[Contratto](../../../docs/implementazione/io-creazione-relativa.md) ·
[Metodo](../../../docs/implementazione/io-creazione-relativa-metodo.md) ·
[Letture C1](../../../docs/implementazione/io-creazione-relativa-revisione.md) ·
[Inventario chiuso](archive-index.lisp)

La nuova API `crea-temporaneo-nella-directory` crea un regolare vuoto
`.tmp` dal FD della directory posseduta, con esclusività e append.
Verifica identità ed EOF prima di restituire il child; il parent resta
prestato. I guasti tentano una sola close del child non pubblicato.
Nessun unlink, flush o rename implicito; un temporaneo creato può restare
orfano dopo un successivo rifiuto.

## Verifica S1 del 2026-10-17

Freeze `b5ad739ba1fc0252920c088e2442140e448451ad`.
Il full `make check` R1 ha concluso con exit 0 e sorgenti STABLE:
[outer](processes/r1-outer/report.lisp),
[inner](processes/r1-inner/report.lisp). La cache ASDF nuova è esplicita
nell'argv outer; il checkout registrato è pulito. L'output originale
riporta i 18 nuovi test I/O: 13 iniettati e cinque nativi, uno dei quali
combina creazione/close reali con un errore iniettato della validazione.
Le prove coprono preflight, ownership, errori e cleanup, collisioni,
parent rinominato, riuso FD e conservazione dell'orfano.

Il controllo comprende la suite verticale: quattro test, 16 scenari
positivi e due negativi. Le fixture [snapshot](fixtures/snapshot/report.lisp)
e [reader](fixtures/reader/report.lisp) sono PASSED; il gruppo degli
[undici spike](fixtures/spk/report.lisp) è COMPLETE. Non si dichiara
un denominatore globale dei test o una qualifica del motore.

Il [trace-write preliminare](processes/trace-write/report.lisp) è concluso
con exit 0/STABLE al precedente HEAD `0339831c`; non è attribuito a S1.

## Integrazione del 2026-10-22

Freeze `bb561af43ec846d37fdc7be9743098a764048a7a`, con main `56fc1c1a`.
Due letture del raccordo hanno verificato ASD, export e compatibilità
con la stabilizzazione dei nomi recuperati. I cinque file di implementazione,
i tre test e il supporto verticale coincidono con S1; package e ASD
conservano entrambe le API.

Il [record R2](processes/r2-integration/report.lisp) conclude
`make test lint trace links` con exit 0/STABLE e checkout pulito, usando
una cache ASDF nuova. Contiene ancora i 18 nuovi test e i quattro verticali.
La compilazione non ammette warning o style-warning; le note originali
del compilatore sono conservate. Il full R1 e il controllo R2 restano
distinti. Nessun esito CI è attribuito da questo archivio.

## Fonti e conservazione

Le 20 copie sotto `sources/S1/` sono ricostruite dai blob Git S1 il
2026-10-22, dopo il freeze; non sono snapshot catturate durante il run.
La [provenienza](sources/S1/capture-provenance.lisp) conserva timestamp,
argv, blob, byte e SHA-256 e il confronto con i record originali.
Il primo tentativo di copia, fermato dal checkout allora in merge,
resta con procedura e diagnostiche; il secondo usa i blob immutabili
indipendentemente dal checkout corrente.

Descriptor e payload gzip sono elencati insieme. Il collector esistente
usa un manifest esplicito, quattro worker e un checker indipendente
dell'inventario chiuso. Nessun append segue la chiusura dell'archivio.
Cache e altri output ignored restano nel perimetro del backup finale.

Callback fidate, namespace esclusivo e assenza di cancellazione asincrona
restano precondizioni. I guasti iniettati non attestano syscall native
guaste. Qualifica C1 completa, MC/DC, mutazioni mirate, prestazioni,
riconciliazione fisica e ammissione dell'Archivio restano aperte.
