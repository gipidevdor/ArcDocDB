# Verifica del decision log autorevole — 2026-10-15

Campagna del modulo `src/recovery-archive/`, secondo il
[metodo registrato](../../../docs/implementazione/decisioni-recuperate-verifica.md).
Formati, specifica e budget del database invariati. Il solo cambiamento di
prodotto separa due letture dai predicati delle asserzioni (COD-25, R1),
conservando ordine, argomenti, condizioni e offset.

## Prove dedicate

**54 test passati su `cd6b5c94`**, con sorgenti stabili:
[produttore originale](4001076591-command-20370-0-report.lisp).
Sono 22 test di lettura, 8 di tipi/query, 16 del bridge ACTIVE,
2 della catena nativa e 6 delle guardie. Ogni test può contenere una
matrice finita; il conteggio non indica tutti i singoli casi.

- Header completo prima del corpo, tutti i byte UUID, magic, CRC,
  riservati, versione effettiva e FD readonly.
- Chunk e short read osservati esattamente, EOF anticipato, revoca,
  progressi impossibili e condizioni originali senza retry implicito.
- Budget fisici prima della coalescenza, duplicati idempotenti, conflitti,
  partecipanti, code e testimoni di corruzione durevole.
- Copie possedute dopo riuso dello scratch e del caller; query u64 zero,
  alto e massimo, tutti i bit dell'ID16 e range invalidi anche in assenza.
- Ambito canonico distinto dall'UUID, FD del decision log chiuso prima o
  durante ACTIVE, forwarding di tutti gli otto budget e confronto con il
  lettore canonico.
- Quattro scenari su file reali, v1/v2 × completo/coda: Archivio, ACTIVE,
  chiusura e pubblicazione CONTROL. Byte, namespace, inode/capacità,
  frontiere e numero delle letture verificati; nessuna decisione di coda
  inclusa. I soli effetti durevoli successivi sono quelli del publisher
  esistente, osservati dai suoi oracoli.
- FI seriale delle guardie, con dipendenze sempre ripristinate e lettura
  valida dopo ogni iniezione. I costruttori privati rifiutano tipi invalidi.

## Copertura grezza

Contatori azzerati dopo il caricamento, prima della sola suite Archivio.
Elenco esatto di cinque file, senza package, esclusioni di forme o reload
per segnare dichiarazioni. Dati e sorgenti HTML nel
[report originale](raw/archive-coverage-c/cover-index.html).

| File | Forme coperte/totali | Rami coperti/totali |
|---|---:|---:|
| `read.lisp` | 159/164 | 22/22 |
| `build.lisp` | 80/91 | 6/6 |
| `active.lisp` | 56/68 | 4/4 |
| `query.lisp` | 20/26 | 0/0 |
| `types.lisp` | 16/28 | 2/4 |

I 32 rami applicativi di lettore, build e bridge sono raggiunti. Restano
forme di dichiarazione, default e forme generate; nei tipi il dato rimane
**2/4**, anche dopo i test dinamici dei costruttori. Questa osservazione
non prova l'irraggiungibilità dei rami e non approva eccezioni C1.
Forme/rami SBCL non sono MC/DC; qualifica C1 completa ancora aperta.

## Tentativi e revisioni

| Tentativo | Revisione | Esito conservato |
|---|---|---|
| Copertura A | `3b485734` | [Fallita](4001076435-command-13317-0-report.lisp): SBCL riconosce in compilazione TXID volutamente invalidi nella fixture query. |
| Copertura B | `a879c3c9` | [Passata](4001076495-command-14253-0-report.lisp), 48 test. Invocazione dinamica dei tipi invalidi, nessun warning soppresso. |
| Copertura C | `cd6b5c94` | 54 test passati dopo sei prove FI aggiuntive; read 16/22 → 22/22 e build 4/6 → 6/6 rami. |
| Self-test copertura | `3b485734` | [Passato](4001076443-command-13495-0-report.lisp): selezioni e rilevamento del ramo mancante. |
| Self-test raccolta | `3b485734` | [Passato](4001076444-command-13554-0-report.lisp), 19 controlli, incluso rifiuto di produttore aperto e copia alterata. |

Gli agenti hanno scritto file disgiunti senza esecuzioni. Gli scrittori
sono stati chiusi prima della prima prova; ogni correzione è seguita da
nuova revisione e nuovo run. La [revisione indipendente](../../../docs/implementazione/decisioni-recuperate-revisione.md)
conserva due letture dello stesso revisore e l'addendum R1, chiuso solo
staticamente dopo la correzione. La rilettura del coordinatore e gli esiti
runtime restano distinti dalla lettura indipendente.

## Integrazione completa

**`make check` completo passato su `5cb13ca3`**, con sorgenti stabili:
[produttore originale](4001076635-command-21532-0-report.lisp).
Il grafo integra `main` `1bdfce48`, inclusi checkpoint e CBOR.
Sono passati build e suite integrate, linter, tracciabilità, collegamenti,
verificatori delle evidenze, fixture negative e dieci spike in modalità check.
Le due nuove selezioni di copertura restano entrambe disponibili.
Non viene dichiarata una nuova qualifica dei moduli esterni al perimetro.

## Conservazione e limiti

Il [catalogo](catalogo.lisp) conserva i produttori espliciti.
Il [publisher](publish.lisp) deriva dalla precedente campagna: copie integre, confronto
canonico dei record risolti, SHA-256 e limiti 1 MiB plain/8 MiB gzip.
La selezione è esplicita e riguarda produttori conclusi, inclusi fallimenti.
Il primo produttore di raccolta e il suo audit sono conservati:
[produttore A](4001076983-command-33410-0-report.lisp),
[audit A](4001077061-command-34494-0-report.lisp). Le copie sono integre,
ma il riepilogo del produttore A riporta erroneamente un record: `nreverse`
modificava la lista ancora usata dal contatore. Il catalogo A ne contiene
28 e resta in `attempt-a/`, con sorgente, testo e selezione originali.
I suoi riferimenti ai nomi originari descrivono quella variante; i byte
storici di sorgente/testo/selezione sono conservati nella stessa sottodirectory.
La variante B usa `reverse`, senza mutazione; il
[self-test B](4001077165-command-36595-0-report.lisp) passa 21 controlli,
compreso ordine e conteggio preservato. La variante successiva conserva i testi storici Markdown come `.txt`,
così i collegamenti descrivono il loro namespace originario senza entrare
nel controllo dei documenti correnti; i byte restano identici. `attempt-b/`
conserva catalogo, sorgente, selezione e testo anteriori a questa normalizzazione.
Il catalogo finale aggiunge anche questi produttori; il contatore A non è accettato come misura.

Sono conservati gli HTML di copertura e i log delle fixture negative;
coverage-state globale, FASL e cache sono ricostruibili e restano esclusi.
Ogni comando conserva argv, ambiente, revisione, snapshot prima/dopo e
output originale. Il produttore conclusivo è conservato separatamente,
senza autocertificazione ricorsiva. La [conservazione finale](chiusura/manifesto.lisp)
comprende pubblicazione, audit e collegamenti; il produttore conclusivo
resta in `chiusura/produttore/`.

Nessun nuovo benchmark: tempi del recorder comprensivi di bootstrap e
fixture, carico esterno non controllato, nessuna misura di throughput DB,
scalabilità, latenza disco o heap zero. Non sono dimostrati power loss,
correttezza del catalogo, EOF contro scritture esterne, gestione FAULTED
nel controller, riconciliazione CLOSED o Recovery Manager completo.
