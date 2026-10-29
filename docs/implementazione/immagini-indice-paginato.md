# Immagini sigillate e adozione della root paginata

Incremento autorizzato il 2026-10-28: [ADR-0063](../adr/0063-immagini-sigillate-indice-primario.md),
REQ-IDX-010, REQ-REC-001, INV-I8, INV-A2, INV-A8, INV-P6. Collega
[costruttore](costruzione-indice-paginato.md), codec, cache e
[lettore](lettura-indice-paginato.md) alla verifica readonly e a una vista
seriale adottabile. **M1 continua a usare il residente.** Inventario/nome
canonico, catalogo e wiring dello startup/writer/GET restano da integrare.

## Fonte canonica e responsabilita'

`crea-fonte-indice(archive-uuid, series-uuid, token32, csn, count)` copia il
legame alla fonte gia' recuperata. UUID 16 byte, token 32 byte, CSN u64,
cardinalita' esatta 0..29360128 chiavi vive. Il token e' fornito dal controller:
non e' generato casualmente, non e' un hash calcolato dal codec e non viene
dedotto dal footer. Il controller garantisce l'identita' esatta del piano
canonico, senza riuso per fonti differenti anche allo stesso CSN dopo
compaction. Nessun coordinamento o contatore fra Serie viene aggiunto qui.

Il validatore di ogni entry deve attestare appartenenza e candidato esatti
rispetto alla fonte autorevole, indipendentemente dall'immagine candidata.
Non deve usare lo stesso footer/indice come proprio oracolo. Tale callback
e il conteggio esatto della fonte sono input fidati: se falsi, il componente
non puo' dimostrare copertura committed. Le fonti e le loro durate di vita
restano responsabilita' dei protocolli di recovery/MVCC del controller.

## Layout ARCIRF01, versione 1

```text
pagina zero | pagine ARCIPG01 contigue | footer ARCIRF01
```

Taglia uniforme 4096/16384/65536 byte. Prima pagina interamente zero,
riservata dal caller; pagine dati da offset SIZE. Generazione uniforme e
immagine positiva nel dominio ADR-0058. La root e' l'ultima pagina dati.
Footer all'EOF esatto: `(page-count + 2) * SIZE`, senza code ammesse.
La quota I/O comprende anche prefisso e footer; la quota pagine del
costruttore riguarda invece le sole pagine dati.

| Offset | Byte | Campo |
|---:|---:|---|
| 0 | 8 | Magic ASCII `ARCIRF01` |
| 8 | 2 | Versione LE, 1 |
| 10 | 1 | Log2 taglia: 12, 14, 16 |
| 11 | 1 | Flag zero |
| 12 | 4 | Riservato zero |
| 16 | 16 | UUID Archivio |
| 32 | 16 | UUID Serie |
| 48 | 8 | ID immagine, 1..2^60-1 |
| 56 | 8 | Generazione uniforme, 1..2^60-1 |
| 64 | 8 | Offset root = page-count * SIZE |
| 72 | 8 | Generazione root = generazione uniforme |
| 80 | 8 | Numero pagine dati, 1..65536 |
| 88 | 8 | CSN della fonte canonica |
| 96 | 8 | Conteggio chiavi vive della fonte |
| 104 | 4 | Seme XXH64 high-u32 |
| 108 | 4 | Seme XXH64 low-u32 |
| 112 | 32 | Token della fonte canonica |
| 144 | SIZE-148 | Riservato zero |
| SIZE-4 | 4 | CRC32C dei byte [0,SIZE-4) |

Il CRC viene verificato prima dei metadati. Versione integra ignota produce
`unsupported-format`; geometria, CRC, identita', riservati, fonte o seme
incoerenti producono `corruption-detected`. Non e' autenticazione contro un
attaccante e non crea una nuova fonte di verita'.

## Completamento del derivato

`sigilla-immagine-pagine(builder, root-proof, append-file, source,
:observer nil)` richiede il file esatto del costruttore, partenza a SIZE,
root ultima e conteggio coerente. Preflight prima degli effetti; footer
preparato in buffer privato. Poi append esatto e durable flush fino all'EOF
previsto. Solo allora il costruttore passa a SEALED e restituisce un sigillo.
Un sigillo **non e'** una prova di immagine adottabile: la lettura completa
rimane obbligatoria. Dopo SEALED non si aggiungono pagine. Errore/nonlocal
exit dopo ammissione rende FAULTED; offset ambigui non sono riutilizzati.

Observer iniettabile alle frontiere `:before-footer`, `:after-footer`,
`:after-flush`; deve restituire NIL. Non e' una conferma di commit. Il footer
e' solo completamento di un derivato di fonti gia' committed. Se un processo
muore dopo aver scritto il footer ma prima del flush/ACK, il riavvio puo'
accettare i byte sopravvissuti soltanto dopo la stessa verifica integrale.
Questo non promette che sopravvivano a perdita di alimentazione.

Nessuna rinomina usa implicitamente `io:pubblica-temporaneo`: quella API
richiede una decisione durevole del caller. Questo incremento non introduce
tale decisione nel catalogo e non assegna un nome canonico al derivato.

## Recupero readonly con memoria limitata

`recupera-immagine-pagine(file, eof, size, source, seed-high, seed-low,
validator, :frames 2, :max-visits 16777216)` prende un FD readonly prestato,
immutabile, e l'EOF esatto osservato dal controller. Usare, per esempio,
`io:apri-lettura-nella-directory`, con budget file esplicito sufficiente.
Il chiamante mantiene file/namespace stabili e impedisce append/modifiche
concorrenti fino al ritiro della vista. La funzione non apre, chiude,
tronca, rinomina, elimina o modifica file preesistenti.

Prima verifica footer contro fonte e seme fidati, poi il prefisso zero.
Scansiona tutte le pagine fisiche con identita'/generazione esatte e codec
locale completo. Anche archi vuoti/inutilizzati sono verificati: tipo dei
figli, ordine radix e continuita' delle catene di chiave. La root deve
contenere bucket o directory, mai un frammento di chiave.

Per ogni entry ricompone la chiave, verifica il digest col seme canonico,
CSN non futuro e candidato completo. Il lookup dalla root deve ritrovare
lo **stesso offset pagina e slot fisico**. Un duplicato con payload identico
puo' far accettare al massimo una delle due copie: l'altra non coincide con
l'origine risolta e viene respinta. Anche entry irraggiungibili o mal
instradate sono rifiutate. Non basta confrontare i soli payload.

Il callback `validator(key, start, end, words)` riceve scratch readonly,
non li trattiene/modifica ed e' non rientrante. T attesta appartenenza esatta
alla fonte; NIL respinge il derivato; ritorni non booleani sono errori di
contratto. Infine si verifica il conteggio esatto. Unicita', appartenenza e
cardinalita' della fonte danno copertura delle **entry**. Possono rimanere
pagine senza entry inutilizzate; non si attesta che ogni pagina fisica sia
raggiungibile dalla root. Il file viene ricontrollato aperto anche dopo
l'ultimo callback: nessuna prova valida restituita su una capacita' chiusa.

Visite di footer, prefisso, scansione, archi, ricomposizione e lookup vengono
addebitate al budget cumulativo. Cache hit inclusi. Il budget misura le visite al derivato; il validatore
della fonte mantiene limiti propri, forniti dal controller. Nessun I/O sul
derivato dopo esaurimento;
un limite non e' un risultato ABSENT. Ogni lookup ha inoltre limiti locali
in pagine/byte chiave. La scansione e' iterativa, senza ricorsione, bitmap o
insieme residente di tutte le chiavi/PageRef. Scratch: cache di 1..64 frame,
cinque pagine di lavoro nel controllo (incluso il buffer footer/prefisso),
chiave <=65535 byte, metadati fissi.
Allocazioni e GC della preparazione vanno inclusi nella riserva del
controller: nessun limite RSS misurato e nessuna qualifica oltre RAM.

## Adozione della vista seriale

`crea-vista-indice-paginato(source)` parte senza root. Soltanto
`pubblica-immagine-verificata(view, image)` accetta la prova opaca prodotta
sopra, verificando owner, fonte completa e file aperto prima dello swap.
Un rifiuto mantiene la root precedente. Lo swap e' soltanto un riferimento
nella vista privata dell'attore, senza nuovo commit, catalogo, close/reclaim
o garanzia di concorrenza.

`leggi-vista-indice-paginato(view, key, start, end, words)` calcola il digest
col seme verificato e restituisce un candidato LIVE/ABSENT. Non autorizza
ancora un documento: pin, MVCC e verifica CRC/chiave del record rimangono del
GET esistente. Il file prestato viene verificato aperto anche su cache hit.

`invalida-vista-indice-paginato(view, new-source)` ritira la root prima del
nuovo legame. UUID diversi o CSN regressivo vengono respinti senza effetti;
stesso CSN con token diverso e' ammesso per un cambio fisico della fonte.
La vista senza root rifiuta le letture con `resource-exhausted`, senza falso
miss. Il controller mantiene vive le vecchie capacita' finche' necessario.
Nessuno stato condiviso fra Serie, lock o contatore globale per richiesta.

## Verifica e limiti residui

Fixture wire indipendente del footer, tutte le taglie, chiavi massime,
directory multilivello, overflow e un solo frame. Mutazioni con CRC valido
separano corruzione fisica da fonte, seme, geometria, digest e topologia.
Copertura mancante, duplicati identici, entry irraggiungibili, archi vuoti
errati, fonte cambiata, FD chiuso e budget sono rifiutati. Prima dello swap
ogni errore preserva la vista precedente.

Processi separati con SIGKILL prima del footer, dopo il footer e dopo il
flush; nuovo processo verifica l'immagine e l'oracolo, senza cambiare un
byte del file. Sono crash di processo e riaperture native, non power loss,
corruzione del filesystem o qualifica del recovery completo del motore.
Il driver `tools/index-image-crash.lisp --self-test` esercita le tre coppie.

| Decisione C1 | Condizioni e casi |
|---|---|
| Fonte | UUID, token, cardinalita' nel dominio; invalidi separati |
| Footer | CRC, magic/versione, taglia/flag/riservati, fonte/seme; mutazioni isolate e troncamento/coda |
| Root | count, EOF esatto, ultima pagina, immagine/generazione nel dominio, generazione root uguale; corruzioni semantiche CRC-valide |
| Sigillo | capacita' esatta, prefisso/contatori coerenti, ultima root, conteggio e Serie; file diverso, root vecchia, fonte errata |
| Chiave esterna | tipo, totale e posizione prima della copia; test chiave massima e archi incoerenti |
| Origine | LIVE, pagina, slot e payload uguali; hit, duplicato identico, entry irraggiungibile |
| Archi | bucket->bucket, directory->bucket/directory ordinati, chiave->chiave contigua; anche fonte vuota |
| Adozione | owner e fonte esatta; fonte diversa/thread estraneo preservano la root |
| Invalidazione | UUID esatti e CSN non regressivo; regressione respinta e token cambiato allo stesso CSN |
| Visite | domini, budget iniziale e crediti globali/locali; minimo sufficiente e byte/pagina adiacenti insufficienti |

Due letture dello stesso autore: formato/budget/autorita' prima; lifetime,
ordine degli effetti, reset dello scratch, errori e copie di candidati poi.
Non sono revisione indipendente o MC/DC completo. Nessun requisito globale
viene promosso a verificato. Il rollback rimuove soltanto un derivato; fonti
committed e punti SEAL/EDIT/DECISION restano invariati.

Il successivo [collegamento M1](indice-paginato-m1.md) concretizza fonte canonica,
selezione privata allo startup, GET e ritiro prima delle scritture; catalogo durevole
e selezione automatica restano separati.
