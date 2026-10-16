# Codec full text: evidenze del 16 ottobre 2026

Perimetro: [codec `.idx` e viste](../../../docs/implementazione/full-text-codec.md)
e [decisioni C1](../../../docs/implementazione/full-text-codec-decisioni.md).
Il primo impiego di ArcDocDB rimane il database di un server NNTP Usenet scritto
in Common Lisp; la prova su file usa campi `subject` e `body`.

Ogni catalogo conserva il registro originale del comando, i blob dei sorgenti,
stdout/stderr, exit code, ambiente e il processo di conservazione. I risultati
descrivono le revisioni registrate, senza promuovere i requisiti complessivi.

## Prove mirate sui sorgenti finali

Il [registro](report.lisp) di `make fulltext-check lint trace` ha stato `:ok`,
sorgenti `:stable`, exit code 0 e durata 9,089964 secondi.

- 39 test full text, di cui 15 nuovi per il codec; sei mutanti semantici rilevati.
- Fixture indipendente di 468 byte confrontata con l'encoder su 32 prefissi;
  3744 alterazioni singole, 468 troncamenti e 26 corruzioni semantiche con CRC corretto.
- 43200 confronti dei predicati sul file con una scansione indipendente;
  1024 varianti con CRC corretto: 1020 rifiuti tipizzati e quattro strutturalmente valide.
- Mille iterazioni di scrittura/verifica/ricerca dopo warm-up senza byte consed
  sullo heap misurato, anche con identificativi u64 massimi; quattro reader separati.
- Due processi SBCL con attese limitate: nove query dopo riapertura normale e
  rifiuto di una posizione incoerente con CRC corretto. Non e una prova di power loss,
  fsync, recovery, pubblicazione durevole o visibilita MVCC.
- Lint: 296 file di prodotto, nessuna violazione; tracciabilita: 131 requisiti,
  68 invarianti, 13 FI e 54 ADR.

La [verifica completa](../2026-10-16-fulltext-codec-fullcheck/report.lisp)
`make check` ha stato `:ok`, sorgenti `:stable`, exit code 0 e durata
475,231951 secondi: dieci spike completati, 192 cataloghi e 3835 riferimenti
ad artefatti verificati. Questo record precede l'ulteriore integrazione di `main`.

La fixture [minimum-v2.hex](../../../tests/fulltext/minimum-v2.hex), congelata
prima della prima esecuzione dell'encoder, ha SHA256
`d94f6144c7533cc273784446b803a5d872ba44a8d2833ef0c4d8f317ca699f80`.
Il generatore non carica il prodotto e implementa separatamente CBOR, LE e CRC.

## Copertura diagnostica

Il [processo di copertura](../2026-10-16-fulltext-codec-coverage/report.lisp)
e lo [stato grezzo con HTML](../2026-10-16-fulltext-codec-coverage/coverage.lisp)
sono separati dalle misure di allocazione. I tre test di allocazione sono esclusi
dall'esecuzione strumentata. Lo stato SB-COVER originale e conservato come stringa,
senza interpretarlo come programma. La copertura non e completa e non dimostra MC/DC
o qualifica C1 del motore.

## Tentativi di sviluppo conservati

| Catalogo | Esito e interpretazione |
|---|---|
| [Self-test fixture](../2026-10-16-fulltext-codec-fixture-selftest/catalogo.lisp) | Riuscito; controlli dell'oracolo indipendente |
| [Generazione fixture](../2026-10-16-fulltext-codec-fixture-generation/catalogo.lisp) | Exit interno 0, `:source-changed` atteso per la creazione del file; non e una verifica su sorgenti stabili |
| [Build prodotto](../2026-10-16-fulltext-codec-product-build/catalogo.lisp) | Riuscito |
| [Package lock](../2026-10-16-fulltext-codec-package-failure/catalogo.lisp) | Fallito: helper dei test in conflitto con `CL:SPACE`; corretto con shadow nel package dei test |
| [Golden e cornice](../2026-10-16-fulltext-codec-golden-tests/catalogo.lisp) | Quattro test iniziali riusciti |
| [Sintassi test](../2026-10-16-fulltext-codec-syntax-failure/catalogo.lisp) | Fallito: parentesi mancante nei test; corretta |
| [Costante mutata](../2026-10-16-fulltext-codec-constant-failure/catalogo.lisp) | Compilazione fallita per warning: bitmap letterale mutata dal test; sostituita con copia privata |
| [Dodici test codec](../2026-10-16-fulltext-codec-core-tests/catalogo.lisp) | Riusciti, prima dell'aggiunta dei confronti differenziali |
| [Riapertura iniziale](../2026-10-16-fulltext-codec-persistence-dev/catalogo.lisp) | Riuscita prima di introdurre l'attesa limitata dei child; la variante finale e nel registro mirato |

Restano da integrare I/O e pubblicazione delle generazioni, writer, autorita
dell'hint e rianalisi del documento, inventario READY, MVCC, Query Engine e reclaim.

## Integrazione e controllo Linux

Dopo integrazione di `main` a `0410116a`, il [controllo completo su ARM](../2026-10-16-fulltext-codec-integration-before-u64-fix/report.lisp)
ha stato `:ok`, sorgenti `:stable`, exit code 0 e durata 515,485371 secondi.
Sono completati dieci spike e controllati 199 cataloghi e 3852 riferimenti.

Il [job Linux](https://github.com/gpicchiarelli/ArcDocDB/actions/runs/38939953512/job/117104785571)
ha invece rilevato [allocazioni con ID massimo](../2026-10-16-fulltext-codec-ci-linux-high-id-failure/report.lisp):
0 byte con ID 1 e 32768 byte consed con UINT64_MAX su 1000 iterazioni.
Il registro originale ha stato `:failed`, sorgenti `:stable`, exit code 2;
il test e rimasto invariato. Il descrittore conserva ora l'ID gia boxed in una
cella privata immutabile costruita all'apertura, evitando l'estrazione ripetuta
da uno slot raw u64. Wire e API pubbliche rimangono gli stessi.

Le [prove mirate dopo la correzione](../2026-10-16-fulltext-codec-u64-targeted/report.lisp)
`make fulltext-check lint trace links` passano sui sorgenti stabili con exit code 0.
L'esito locale ARM e distinto dalla verifica x86-64 del job successivo.
