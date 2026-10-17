# Recovery semantico della Serie — 2026-10-17

[Contratto e decisioni](../../../docs/implementazione/recovery-serie.md) ·
[Inventario chiuso degli originali](../2026-10-17-serie-semantic-originals/archive-index.lisp) ·
[Due riletture dell'autore](riletture.lisp)

## Metodo e varianti

Metodo e SRS-D01…D11 preregistrati nel commit prodotto iniziale
`4d177f9c2121d37e6cbbc5362366a13512cd7402`, prima della compilazione.
La rilettura della complessità separa capacità e scansione in
`07011a98096360883cd0352c2ea2e07f71a92a1e`. La revisione finale
`3b2e8594bc5eb7336a81ba97e4dc875c1b4340af` mantiene configurabile il budget
segmenti: 65536 è il default, non un nuovo tetto storage. I commit e tutte
le esecuzioni delle varianti sono conservati, senza riscrivere la storia.

Compilazione forzata del solo prodotto con avvisi fatali; nessun sistema di
test caricato. Compilazione terminata prima del disassemblaggio. I controlli
indipendenti di stile, tracciabilità, link e archivi possono sovrapporsi.
Nessuna esecuzione delle nuove API: il disassemblaggio legge sette funzioni.
I tempi wall includono compilazione e strumenti, non sono benchmark DB.

## Risultati locali

Tredici processi OK / exit 0 / STABLE, con stdout/stderr originali e sidecar.

| Revisione | Processi |
|---|---|
| 4d177f9c | Prima compilazione prodotto |
| 07011a98 | Compilazione dopo separazione, trace-write, lint, trace, links, disassemblaggio, evidence |
| 3b2e8594 | Compilazione finale, lint, trace, links e disassemblaggio |

La compilazione finale ha stdout/stderr vuoti. Lint: 336 file e zero
violazioni. Trace: 135 requisiti, 69 invarianti, 13 FI e 56 ADR senza errori.
Link: 573 Markdown, 3954 collegamenti, zero rotture. Sette funzioni ARM64
nel disassemblato originale, letto senza inferire costo misurato o qualifica.

Il controllo evidence su 07011a98 riguarda l'insieme preesistente: 239
cataloghi, 3948 riferimenti e 47156 file, esito OK. Non verifica il nuovo
archivio aggiunto successivamente e non è attribuito al codice finale.
I log temporanei dei suoi worker C4 sono conservati come accessorio gzip
`raw/evidence-worker-logs.tar.gz` negli originali. Copia con tar/gzip del
namespace ormai fermo; i byte dell'accessorio vengono verificati dal
collector senza estrarlo o eseguirlo. Nessuna promozione delle verifiche C4
a prova funzionale del prodotto.

Collector comune con quattro worker, 32 file pianificati e 34 effettivi
nell'inventario chiuso, inclusi indice e catalogo. Checker finale in un
processo separato, exit 0. Nessuna aggiunta dopo la chiusura dell'archivio.
Quattro copie esterne conservano record del collector, suo sidecar, rapporto
e output del checker: [dimensioni, SHA256 e helper](conservazione-verifica.lisp).
Nessuna dichiarazione di confronto letterale byte per byte.

Link e catalogo esterno hanno inoltre due controlli conclusivi separati.
I loro record e sidecar sono conservati in altre quattro copie con
[audit dedicato](final-conservazione-verifica.lisp); il catalogo è poi esteso
per nominarli. Restano esterni all'archivio chiuso, che non viene modificato.
L'integrazione dell'insieme aggiornato e il push restano coordinati dalla
chat che sta raccogliendo il lavoro di tutti i filoni.

## Riletture dell'autore

1. Autorità, completezza e lifetime: cardinalità del manifest più un ACTIVE,
   ID u64 in ordine stretto, stato/appartenenza; posizione zero valida;
   scope e replay canonici; P <= EOF dei CLOSED; FD prestati, nessun close
   implicito. Tutti i preflight precedono i dati. Nessun risultato parziale.
2. Limiti, costo e confini: capacità separata dalla scansione, cicli limitati
   al set, somme senza wrap, budget prima del vettore; scratch seriale,
   nessuna apertura o enumerazione aggiuntiva. Controlli finali CLOSED,
   ACTIVE e decisioni; nessun nuovo registro, pubblicazione o lavoro GET.
   Le misure di memoria, GC e prestazione non sono state eseguite.

Sono due letture dell'autore, non revisione indipendente. Nessun nuovo test
aggiunto o eseguito localmente; nessuna FI, copertura, MC/DC, modello o
benchmark. SRS-D01…D11, confine generale COD-24, ricostruzione indici,
riconciliazione, ammissione e qualifica C1 restano aperti. La CI automatica
generale rimane distinta dalle prove dedicate mancanti. Record Lisp da
leggere con READ-EVAL NIL, senza LOAD o valutazione.
