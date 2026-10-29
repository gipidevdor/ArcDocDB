# Costruzione incrementale delle pagine dell'indice

Incremento autorizzato il 2026-10-28, ADR-0057/0058, REQ-IDX-001,
REQ-IDX-009, REQ-LIM-003; INV-I8, INV-A2, INV-A8, INV-P6. Collega il codec
al sink append e al [lettore paginato](lettura-indice-paginato.md).
Il motore M1 resta sul residente: questo componente prepara un derivato;
non pubblica una root e non cambia WAL, SEAL, EDIT o DECISION.

## API e sorgenti

`crea-costruttore-pagine(start, size, sink, seed-high, seed-low,
:max-pages 65536, :preflight callback)` prepara due buffer e un piano della
capacita' bucket. START e' l'identita' del primo offset libero, positivo e
allineato, in un'immagine privata. Il chiamante possiede gia' l'eventuale
prefisso. Non viene introdotto un formato container o un header implicito.
Taglie 4/16/64 KiB; quota 1..65536 pagine per costruttore. Il dominio e il
seme XXH64 vengono fissati prima degli effetti.

`crea-costruttore-pagine-file(file, start, size, seed-high, seed-low, ...)`
collega `io:append-esatto`, con verifica della posizione iniziale e corrente.
Il preflight dell'intero lotto passa da `io:verifica-capienza-append`, prima
della prima pagina. Il file append e' prestato, mantenuto dal chiamante:
nessuna apertura, chiusura, rinomina o cancellazione nascosta. Il file
preesistente non viene troncato. Il chiamante crea il temporaneo tramite le
primitive I/O esistenti e conserva la relativa ownership.

`crea-entry-costruzione(builder, key, words)` copia una chiave di 1..65535
byte e un candidato ordinario in cinque parole compatibili con il residente.
Verifica lunghezza/flag, CSN positivo, END zero e limiti record; calcola il
digest col seme del costruttore. Le entry non hanno accessori/setter esportati.
Una modifica successiva all'input caller non cambia la copia posseduta.
La funzione non legge il documento e non ne prova commit, CRC o visibilita'.
Prepared, history e tombstone non sono rappresentati da questa API.

## Lotti e append

`costruisci-bucket-pagine(builder, entries, :next reference)` accetta al
massimo 7/8 della capacita' della pagina e un overflow gia' costruito.
Prepara una sonda flat canonica con gruppi da 16 e rifiuta duplicati locali,
entry estranee, overflow di altro costruttore/tipo e quota insufficiente.
Scorre poi gli slot in ordine fisico: le chiavi che entrano nell'arena sono
inline; le altre hanno frammenti esterni. Pianifica il numero esatto di
pagine prima di qualsiasi append del lotto.

Le chiavi esterne vengono emesse dalla coda alla testa; poi viene scritto
il bucket. Ogni figlio ha offset minore del genitore, generazione non futura
e lo stesso dominio Serie/immagine. I controlli del bucket, i campi delle
entry e l'arena sono compattati senza buchi. Ogni pagina passa sia dal writer
sia dal verificatore del codec prima di essere prestata al sink.

Il sink sincrono riceve `(buffer, offset)`, non trattiene il buffer e
restituisce esattamente `offset + size`. E' codice fidato: il valore di
ritorno da solo non prova una scrittura fisica. L'adattatore file usa
l'append esatto del modulo I/O, con trasferimenti parziali completati e
propagazione senza retry degli errori.

`costruisci-directory-pagine(builder, bits, shift, children)` accetta un
fanout esatto di riferimenti gia' costruiti o NIL. Le prove portano una
sintesi AND/OR dei digest e la frontiera radix dei figli. La directory
verifica che tutti i digest di ciascun figlio seguano lo slot indicato,
anche per un campo a cavallo dei due u32. L'intervallo radix del figlio deve
essere sotto quello del padre; geometrie sovrapposte e instradamenti errati
sono rifiutati prima di I/O. Non e' sufficiente che le pagine siano
singolarmente valide.

Le operazioni restituiscono `riferimento-costruito`, soltanto dopo tutti
gli append previsti. `identita-riferimento-costruito` ne restituisce una
copia privata per il lettore. Le prove non conservano chiavi o riferimenti
ai figli; non esiste un inventario residente di tutte le pagine costruite.

## Errori, risorse e autorita'

Un attore I/O possiede il costruttore; rientro e thread estranei sono
rifiutati. Preflight errato non scrive e mantiene OPEN. Una volta ammesso
un lotto, errore o uscita non locale lo rende FAULTED, anche se nessun byte
e' stato confermato dal sink: nessun retry o riuso dell'offset ambiguo.
La sola pulizia rilascia BUSY e i riferimenti del piano. Le pagine precedenti
complete non vengono riscritte o cancellate. La fine positiva non e' un
punto di atomicita' durevole e non implica flush.

La memoria del costruttore e' O(page-size + capacity). Le copie delle entry
del lotto appartengono al chiamante e vanno conteggiate separatamente:
al massimo 448 chiavi da 65535 byte per lotto da 64 KiB. Il chiamante deve
limitare quante entry e prove trattiene e includere i transitori/GC nella
quota. Il codice e' manutenzione, con allocazioni limitate dal lotto;
non dichiara zero allocazioni sul PUT caldo o un limite RSS misurato.
Nessuna attesa, lock o scrittura condivisa fra Serie.

L'autorita' dei dati rimane nei segmenti e nelle decisioni esistenti. Il
chiamante deve fornire un insieme logicamente unico, anche tra bucket e
catene di overflow: il controllo dei duplicati e' locale al lotto. Le prove
certificano origine, completamento e routing; non certificano completezza
rispetto al WAL, unicita' globale o visibilita' MVCC. Il [container e il recupero readonly](immagini-indice-paginato.md) aggiungono ora
completamento e verifica prima dell'adozione seriale. Partizionamento esterno,
ricostruzione oltre RAM, identita' non riusabili tra riavvii e wiring della
pubblicazione nello startup/writer del motore rimangono da integrare.
Un'immagine incompleta non viene dichiarata utilizzabile dal motore.
Il rollback dell'incremento rimuove un generatore di derivati senza migrare
dati utente; nessun file viene eliminato senza le prove del modulo I/O.

## Verifica C1

Fixture in memoria per tre taglie con verifica codec e lettura completa;
chiavi massime, miste inline/esterne, overflow, bucket pieno con collisioni
H2/gruppo, directory multilivello e campo a cavallo di u32. Test nativo:
append a temporaneo, flush esplicito, chiusura e riapertura readonly con un
frame di cache. Errori prima degli effetti: duplicati locali, capienza,
quota pagine/file, fine identita' senza wrap, dominio/owner/tipo/routing dei
figli, geometria, callback preflight. Interruzioni alle tre frontiere di una
chiave da 5000 byte e bucket: nessuna prova restituita e FAULTED. Short
write, errore I/O e uscita non locale verificati separatamente.

| Decisione composta | Condizioni/casi |
|---|---|
| Configurazione | taglia, sink, preflight, quota intera 1..65536; rifiuti singoli per domini |
| Entry | lunghezza 1..65535, END zero, metadati chiave, word lunghezza; candidato valido/errato e CSN zero |
| Prova figlio | owner esatto, offset precedente, tipo richiesto o qualunque; estraneo/tipo errato rifiutati |
| Duplicato | high e low uguali, byte uguali; digest diversi, collisioni H2, chiave ripetuta |
| Quota | numero positivo, quota residua, fine offset rappresentabile; bucket, chiave esterna, esaurimento e frontiera senza wrap |
| Directory | bits nel limite taglia, shift e somma <=64, fanout esatto; geometrie errate e multilivello valido |
| Routing | campo AND e OR uguale allo slot, ordine dei bit; figlio nel ramo errato, campo sovrapposto, campo a cavallo u32 |
| Confine lotto | effetti ammessi e non completato => FAULTED; preflight fallito OPEN, sink fallito FAULTED, completamento valido OPEN |

Due letture dello stesso autore: contratti/formati/quota prima; ownership,
ordine figli/genitori, propagazione degli errori, lifetime delle prove e
limiti dell'autorita' poi. Non sono revisione indipendente, MC/DC completo,
qualifica oltre RAM o qualifica del motore completo.
