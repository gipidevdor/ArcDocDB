# Hash delle chiavi — risultati locali

## Codice adottato

XXH64 in Common Lisp tipizzato, safety 3, span fino a 65.535 byte,
ritorno pubblico in esattamente due u32 fixnum. Seme esplicito read-only
nell'indice; binding completo prima delle mappe. Scansione degli slot
fisici, digest ricalcolati e verificati prima di rebuild/split.
Guasti interni terminali, preservando le condizioni originali del kernel/banco.

Prodotto finale: `c9c7561`; integrato con main in `344e8fb`.
Il perimetro hash/index coincide fra i due commit. Le misure sono eseguite
sul checkout integrato, SBCL 2.6.9, macOS ARM64. Carico esterno non controllato.
Metodo, sorgenti operative e record originali sono conservati qui.

## Prove

| Controllo | Esito accettato |
|---|---|
| Check completo integrato | 706 test e due smoke; compilazione senza avvisi, lint, traccia, link, strumenti di conservazione, cataloghi e dieci spike |
| Nuove regressioni | 28 hash + 18 mappe/seed/guasti = 46 |
| Corpus hash | 94.995 casi contrattuali; nove ancore upstream, residui/allineamenti e massimo u16 |
| Concorrenza funzionale | Quattro worker reali, 1.220 risultati, buffer/semi privati e join limitati |
| Heap nei test | 64 finestre seriali, 16.448 chiamate, zero byte; distinto dai benchmark |
| Mutazioni integrate | Baseline compilata; sette mutanti compilati e rilevati dalla prova nominata, zero classificazioni invalide |
| Sensore C4 | Baseline zero; positivo 4.194.368 byte osservati, 4.194.304 trattenuti; 24 campi mancanti e 12 metriche negative rifiutati |
| Fixture negativa C4 | Exit 1 e report FAILED per metrica incompleta, intenzionalmente conservati |
| Revisioni | Due letture matematiche e supplementi sul dominio/fail-stop; R01–R04 chiusi staticamente |

Il primo check e il primo comando mutazioni hanno stato SOURCE-CHANGED
per una modifica tardiva ai soli percorsi di output del metodo. Sono
conservati e sostituiti dai controlli stabili. Gli autoriporti preliminari
degli agenti, inclusi i fallimenti, dichiarano separatamente i dati non
conservati al momento dell'esecuzione; non sono evidenza qualificante.

## Prestazioni

Due campagne, base 100.000 scelta prima dei clock, cinque repliche,
warmup 256, dodici lunghezze e due semi. Conteggi ridotti con divisori
preregistrati per le chiavi grandi; 98 iterazioni a 65.535 byte.
**240 finestre seriali, 18.626.960 chiamate misurate: zero byte allocati.**
360 gruppi paralleli, ogni worker con fixture e seme privati;
release e join inclusi nel tempo del gruppo. Tabelle: mediane di cinque
repliche, throughput aggregato, unita decimali. Entrambi i semi riportati.

| Modalita, chiave | Seme zero | Seme massimo |
|---|---:|---:|
| Seriale, 16 byte | 38,580 milioni hash/s | 38,565 milioni hash/s |
| 1 worker, 16 byte | 38,595 milioni hash/s | 38,491 milioni hash/s |
| 2 worker, 16 byte | 77,012 milioni hash/s | 76,775 milioni hash/s |
| 4 worker, 16 byte | 113,122 milioni hash/s | 75,700 milioni hash/s |
| Seriale, 65.535 byte | 1,794 GB/s | 1,797 GB/s |
| 1 worker, 65.535 byte | 1,781 GB/s | 1,785 GB/s |
| 2 worker, 65.535 byte | 3,569 GB/s | 3,574 GB/s |
| 4 worker, 65.535 byte | 2,485 GB/s | 3,610 GB/s |

Il parallelismo non scala uniformemente su questo host. Il contatore heap
globale e positivo nei gruppi: tipicamente 65.520, 131.040 e 262.080 byte
per 1/2/4 worker. Totale osservato 54.709.200 byte nei 360 gruppi.
Non si attribuisce questa misura al solo kernel o al solo runtime,
ne si sommano contatori per worker. Nessuna dichiarazione di heap zero
per l'intero percorso parallelo. La misura seriale esclude creazione/join
dei thread; fixture, oracolo, GC e costruzione dei rapporti sono fuori clock.

[Riepilogo strutturato](benchmark-summary.lisp),
[scelta preregistrata](benchmark-selection.lisp),
[report seriale](key-hash-bench-serial-report.lisp),
[report parallelo](key-hash-bench-parallel-report.lisp).
Gli altri dieci gruppi di lunghezze e tutte le repliche restano nei report.
Le misure includono validazione del digest e sink del harness;
non rappresentano GET, latenza P99 o throughput del DB.

## Copertura e codice generato

[Rapporto HTML integrato](hash-coverage-integrated/cover-index.html) e stato
grezzo completi, senza eliminare guardie dal denominatore:

| File | Espressioni | Rami |
|---|---:|---:|
| arithmetic | 0/121 | 0/0 |
| blocks | 33/213 | 6/16 |
| hash64 | 78/81 | 12/12 |
| package | 0/1 | 0/0 |
| hash-digests | 144/148 | 24/24 |
| hash-seed | 49/54 | 12/12 |
| primary-build | 136/191 | 13/24 |
| primary-types | 5/47 | 0/28 |
| Totale selezionato | 445/856 | 67/116 |

Il rapporto sulle definizioni degli helper inline non attesta tutte le
espressioni effettivamente espanse nel kernel. Il corpus e le mutazioni
non trasformano questi zero in copertura certificata. Guardie sui cursori,
definizioni e percorsi difensivi rimangono nel denominatore. MC/DC e C1
completi restano aperti.

Disassemblato ARM64 grezzo raccolto con sorgente e hash: kernel di circa
3,8 KiB, aritmetica/rotazioni native; nessuna chiamata residua agli helper
hash individuata nella lettura dell'autore. Conservati i controlli e i
percorsi di errore. E presente un percorso di boxing del cursore su overflow;
la validazione dello span esclude quel caso sul dominio pubblico conforme.
Non si dichiara assenza di istruzioni allocanti nell'intero disassemblato,
ne qualifica x86-64. I numeri di heap derivano dalle finestre osservate.

## Conservazione e limiti

[Catalogo](catalogo.lisp), sorgente del collector conservata, copie raw,
SHA-256 e compressione lossless verificati dall'audit. Nessun FASL o copia
completa ricostruibile dei checkout pubblicati. Ogni file plain resta sotto
1 MiB; payload gzip sotto 8 MiB. La campagna occupava circa 10,7 MB alla
prima pubblicazione; le ricevute finali registrano gli audit successivi.

Restano controller e generazione/lifecycle del seme, integrazione con GET,
cache e motore, misure P99, thread pool di produzione, qualifiche Linux
x86-64 e C1/MC/DC. Hash non crittografico: uguaglianza sempre bytewise.
