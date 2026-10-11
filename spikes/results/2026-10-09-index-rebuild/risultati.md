# Risultati — indice v2 e ricostruzione verificata

## Codice e ambito

Implementati rebuild e split con tre scansioni, copia delle sole chiavi vive,
preflight dei budget prima dei candidati e confronto di tutte le chiavi e
payload prima del piano. Pubblicazione separata tramite freeze e CAS della
root; nessuna modifica dei formati persistenti.

Suite della campagna iniziale: `ed29cc03d889348736a907a96785bcef3816ba20`.
Benchmark: `4dd0e0279ef6ee07852ed404aecc96204f158195`, integrazione del remoto
senza cambiamenti a prodotto, test o strumenti di misura. Collector corretto
separatamente: confronto lossless con riuso dell'originale già decodificato.
Le cronologie delle prove restano conservate, senza rebase dei commit.

Chiusura dell'integrazione il 2026-10-11: main `5768e02` importa anche lo
scanner CBOR minimo. Il merge `e409040` conserva entrambe le selezioni nello
strumento di copertura; indice, test e driver di misura restano identici
alla revisione iniziale. La suite completa sulla revisione congelata
`c7e53fee76993f2058d67c5b6dbf5036c236ef1d` passa **577 test + 2 smoke**,
includendo 22 test CBOR importati. Il record
`4000702688-command-39020-0` ha exit zero e sorgenti stabili. Una
[revisione indipendente dell'integrazione](integrazione-revisione.lisp)
verifica ASDF, dipendenze e confronto/pubblicazione: nessun finding bloccante,
con ambito statico dichiarato. Il self-test dello strumento di copertura
integrato passa nel record `4000702688-command-39005-0`.

[Contratto](../../../docs/implementazione/indice-ricostruzione.md),
[revisioni](../../../docs/implementazione/indice-ricostruzione-revisione.md),
[metodo benchmark](../../../docs/implementazione/indice-ricostruzione-benchmark-metodo.md),
[riepilogo strutturato](riepilogo.lisp).

## Prove

- **555 test + 2 smoke test** nella campagna iniziale; **577 + 2** dopo
  integrazione, compilazione senza warning/style-warning.
- **119 nuovi test**: 64 slot; 27 ricerca/writer/directory; 28 ricostruzione.
- Controlli generali `make check` passati sulle due revisioni congelate;
  lint, fixture del lint, tracciabilità, link, conservazione e spike inclusi.
- **4/4 mutanti concreti rilevati** in entrambe le campagne: figlio split
  errato, confronto copia omesso, budget errato, location ignorata.
  Compilazione riuscita e fallimento nel test nominato; timeout/errori di
  compilazione classificati come invalidi, mai come rilevamento.
- Tre rifiuti iniziali del compilatore riguardavano parentesi nelle nuove
  suite; corretti e registrati integralmente. Il sorgente intermedio non
  committed è conservato come dati, con confronto del blob Git registrato.
- Fixture CLI del benchmark malformata rifiutata con exit-code 1.
- Autoverifiche degli strumenti, controllo heap vuoto e positivo, alias
  delle metriche e rilettura dei report persistiti passati.

Copertura SB-Cover, non MC/DC:

| Ambito | Espressioni | Rami |
|---|---:|---:|
| Quattro nuovi file rebuild | 569/592 (96,11%) | 52/52 (100%) |
| Modulo index completo | 2.032/2.846 (71,40%) | 201/334 (60,18%) |

I contatori comprendono definizioni inline e primitive preesistenti; non
sono una qualifica C1 completa. Restano FI deterministica dentro il campione
seqlock, interruzioni interne delle mutazioni, fault durante la copia e x86-64.
Due letture indipendenti hanno portato alla propagazione immediata del guasto
al dominio dell'indice e alle fixture indipendenti per ogni campo confrontato.

## Ricerca in memoria

Apple M4, SBCL 2.6.9, safety 3. Fixture di 95 chiavi vive da 16 byte,
digest fidati precalcolati, dati caldi. Cinque repliche di 20.000 lookup per
caso; 256 warmup, controllo degli status nel clock e degli output prima/dopo.
Carico esterno non controllato; finestre brevi, nessuna misura P99.

| Caso | Mediana, milioni di lookup/s | Heap in ciascuna finestra |
|---|---:|---:|
| CSN basso, hit | 10,70 | 0 byte |
| CSN basso, miss | 10,80 | 0 byte |
| CSN alto, hit | 10,70 | 0 byte |
| CSN alto, miss | 10,76 | 0 byte |

**20/20 finestre seriali a heap zero**, anche con CSN/location oltre fixnum.
Il controllo positivo conserva quattro array da un MiB; il sensore li rileva.

30 gruppi paralleli, 70 finestre worker, ciascuno su un indice distinto.
Mediana aggregata comprendente apertura del gate e join:

| Worker | CSN basso, milioni/s | CSN alto, milioni/s |
|---:|---:|---:|
| 1 | 10,23 | 10,13 |
| 2 | 14,27 | 14,93 |
| 4 | 20,05 | 17,00 |

Quattro worker: circa 1,96×/1,68× il rispettivo caso con un worker.
Il contatore heap globale del processo registra 65.520/131.040/262.080 byte
per i gruppi con 1/2/4 worker; runtime e avvio/completamento delle finestre
sono inclusi. I contatori worker sovrapposti non si sommano e non costituiscono
un gate di heap zero parallelo.

## Manutenzione e limiti

40 finestre esplicite: rebuild/split, C=16/128/1.024, chiavi da
16/1.024/65.535 byte, directory a profondità 0/2/4, cinque repliche.
Ulteriori quattro preparazioni appartengono all'autoverifica. Si misurano
preparazione e pubblicazione separatamente; si controllano slot sorgente
distinti, tre scansioni, byte copiati, riferimenti directory e payload
transitorio contro un oracolo aritmetico indipendente.

Le misure riguardano primitive in memoria e manutenzioni già costruibili:
non attestano throughput del DB, GET completo, hashing, retention, snapshot,
WAL, commit, I/O, NVMe o rispetto degli obiettivi ADR-0028 del motore completo.

## Conservazione

Catalogo con registri, report SPK individuali, HTML con link relativi,
sorgenti dei mutanti e versione del collector. Output originali e dati letti
come dati; nessun taglio delle stringhe o delle tracce. Record grandi compressi
senza perdita con verifica degli hash decodificati. FASL e copie di checkout
ricostruibili vengono esclusi dalla pubblicazione.

Il primo collector ha esaurito lo heap da un GiB leggendo report storici
ampi: rifiuto conservato. Il parent ha eliminato una decodifica duplicata,
aggiunto una fixture per il riuso dell'originale e usato il profilo di due GiB
previsto per questi controlli di evidenze. È memoria dello strumento C4;
non è il budget dei frammenti o una misura del DB.

L'audit operativo `4000702765-command-40247-0` verifica 73 record conclusi,
111 file raw, inclusi due gzip decodificati, metadata, dimensioni e SHA-256;
conserva 192 file per 8.528.426 byte prima della raccolta conclusiva.
Il massimo è 466.905 byte. La [sorgente dell'audit](audit-source.txt) è
conservata; questi controlli attestano integrità e budget di conservazione,
senza reinterpretare gli esiti o estendere la qualifica del prodotto.
