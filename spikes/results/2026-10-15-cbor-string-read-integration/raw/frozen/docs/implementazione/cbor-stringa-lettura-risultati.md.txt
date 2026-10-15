# Verifiche della lettura diretta delle stringhe CBOR

Campagna del 2026-10-15 per REQ-CBR-009. La funzione restituisce
MAJOR, PAYLOAD-START e NEXT del primo item MT2/3 minimo, senza copie;
MT3 verifica UTF-8, la coda resta ignorata e il budget riguarda tutta
la finestra. Il [metodo](cbor-stringa-lettura-metodo.md) precede il prodotto.

## Freeze e revisioni

Contratto preregistrato in `d31d888b`; corpus e driver indipendenti
congelati in `b83a0bda` prima del kernel. Le due letture C1
([prima](cbor-stringa-lettura-prima-revisione.md),
[seconda](cbor-stringa-lettura-seconda-revisione.md)) precedono ogni
compilazione. Freeze qualificato `f7c9e0503577b45e2bd20de66c72b6e7232a8c76`.

| Sorgente | Blob Git |
|---|---|
| src/codec/cbor-string-read.lisp | d4a4f774c2264c46349e7eda61ee4a2a3118d742 |
| tests/codec/cbor-string-read-support.lisp | cfd55cd47d782673113e67af625c1360195a345c |
| tests/codec/cbor-string-read.lisp | 8437bdcaa4cf308dbf4614e748cdab4be2ae6d62 |
| tests/codec/cbor-string-read-threads.lisp | 8fc4ae5d9214108a6ae6bf26e644db1a42733cdd |
| tools/cbor-string-read-driver.lisp | a6b65bd233dba2a2eec941d96a75b9db948d19f8 |

Due funzioni di 14/35 righe e 5/10 percorsi, includendo il cortocircuito
AND. La [tabella completa](cbor-stringa-lettura-decisioni.md) conta dodici
guardie, un AND con due operandi, undici ERROR e nove confronti binari;
nessun ciclo nuovo. Guardia interna e default keyword restano nei denominatori.

## Corpus, parallelismo e misure

Passano 17 nominali: 16 seriali e uno concorrente. Le 9906 chiamate del
piano comprendono 690 non fuzz, 1024 fuzz e 8192 concorrenti: 9040 successi
e 866 rifiuti. Sono denominatori aritmetici, non contatori strumentati.
Range, budget, tutte le larghezze, u64, UTF-8 e precedenze, arità esatta,
finestre da 16MiB e immutabilità fisica sono controllati a freddo.
Il fuzz del corpus usa seed53545239 e finaleF8417639: 512 successi e
512 rifiuti, in otto famiglie da64.

Due worker reali riusati, due ondate da2048 chiamate per worker. Lo stesso
buffer contiene una finestra MT2 e una MT3: risultati2/8/12 e3/13/16,
token41333/41509 e sink84649984/85010432 per worker/ondata. Rendezvous
dopo la prima chiamata verificata, timeout, join e cleanup sono bounded.
Gli intervalli WALL includono controlli e attese; nessuna misura di scaling
o simultaneità sui core viene dedotta.

Il driver separato passa 36 confronti e 1024 coppie fuzz con seed43535239.
Benchmark: 12 fixture, 60 campioni da1024 chiamate, 3840 warmup e12 cold,
65292 chiamate complessive; 67376 includendo diff/fuzz. Tutti i tre valori,
sink, checksum e buffer sono controllati. Heap osservato zero in tutti
i60 campioni; baseline nulla e sensore positivo16×1MiB=16777472 byte.
I675727360 byte degli item sono un denominatore, non byte effettivamente
letti: MT2 non attraversa il payload. Costi del consumer inclusi, carico
esterno non controllato, nessuna soglia di velocità o throughput del motore.

Otto mutanti compilabili sono rilevati dal nominale atteso dopo tutte
le38 compilazioni: major permissivo, UTF-8 saltato, NEXT=END, budget
ignorato, START=0, arità extra, minimalità saltata e HIGH ignorato.
Sei erano preregistrati; due estensioni sono dichiarate prima della
campagna. Arity cambia due frammenti coerenti, corpo e FTYPE, nella sola
copia. Baseline17/17; otto exit1/segnaleNIL. Warning, compilefail,
helper, segnali e guasti dopo completamento non contano come rilevamenti.
La lettura indipendente passa4791 verifiche: 342 confronti byte delle
38 fonti×9 copie, frammenti esatti e424 file/metadata stabili.

## Copertura e integrazione

Scope esatto del nuovo file: **116/155 espressioni e20/26 rami**.
Tutte45 voci mancanti restano incluse: quattro forme top-level, un
default keyword, 34 espressioni e sei rami delle sei guardie interne.
Raw globale423 file, HTML e indice dello scope locale concordano.
Il raw di3374141 byte è compattato senza perdita dopo la lettura DATA;
il supplemento verifica nuovamente SHA256 e dimensione decodificata.

`make check-core` su f7c9e050 passa1743 nominali unici e due smoke;
i17 nuovi nomi concordano col corpus DATA. Le note del compilatore sono
conservate; nessun WARNING o STYLE-WARNING. L'integrazione e1bffcae
con il recupero CSN passa la stessa suite, lint249 file e trace127 requisiti.
Il comando combinato resta FAILED nella fase links: sei copie storiche
Markdown ignored provocavano282 link relativi rotti. Rinominate .md.txt
con SHA256 invariato, la successiva verifica links passa con zero rotti.
Il fallimento e la correzione sono entrambi conservati. Le integrazioni
successive mantengono gli stessi pin del lettore e del corpus.

## Conservazione e limiti

L'[archivio principale](../../spikes/results/2026-10-15-cbor-string-read/catalogo.lisp)
contiene dieci record conclusi OK, snapshot storico e originali delle
preparazioni, compresi gli errori dei lettori C4. Raccolta con quattro
worker e inventario chiuso indipendente: **602 file indicizzati,604 fisici,
6736470 byte indicizzati**, senza append dopo il controllo.
Il [supplemento](../../spikes/results/2026-10-15-cbor-string-read-final/catalogo.lisp)
conserva integrazione, rinomina, compattazione, lettura indipendente e
record/osservazioni della raccolta principale; mantiene distinto il
comando FAILED. Non comprende ricorsivamente la propria raccolta.

Le copie/cache private e gli input sintetici con symlink/directory vuote
profonde restano nel supporto ignored, copiato separatamente a fine lavoro.
I file selezionati sono espliciti: l'inventario chiuso attesta quell'insieme,
non ogni file del checkout. REQ-CBR-009 è implementato; REQ-LIM-001/002,
profilo documentale e qualifica C1/MC/DC restano aperti.
