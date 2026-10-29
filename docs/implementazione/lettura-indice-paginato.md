# Lettura seriale dell'indice primario paginato

Incremento di integrazione autorizzato il 2026-10-24: ADR-0057, ADR-0058,
REQ-IDX-001, REQ-IDX-009, REQ-LIM-003; INV-I8, INV-A2, INV-A8, INV-P6.
Collega [cache e I/O](cache-pagine.md) alla visita di directory radix,
bucket flat, overflow e catene di chiavi. Il motore M1 usa ancora il primario
residente: la [costruzione incrementale delle pagine](costruzione-indice-paginato.md)
usa ora questo lettore nei test. Pubblicazione, PUT/DELETE, recovery e selettore
automatico non sono ancora collegati al backend paginato.

## API e ownership

`arcdocdb.index.page:crea-lettore-indice-pagine(cache, root, :max-pages 1024,
:max-key-bytes 1048576)` copia la root e prepara due scratch della taglia della
cache, oltre a un cursore d'identita' privato. Cache e lettore hanno lo stesso
attore I/O proprietario; nessun uso concorrente o rientrante. Il file immutabile
rimane prestato sotto il contratto della cache. L'immagine e i suoi riferimenti
restano stabili per tutta la vita del lettore.

`leggi-indice-pagine(reader, key, start, end, high, low, destination)` accetta
uno span di chiave e il digest XXH64 fidato della Serie, come l'interfaccia
avanzata del residente. Il controller deve conoscere il seme autorevole.
Il lettore non usa un seme implicito e non interpreta il digest come prova
di uguaglianza. La root proviene dal controller; la verifica locale delle
pagine non certifica da sola copertura globale, digest corretti nel dataset,
unicita' delle chiavi o visibilita' delle entry. Questi sono obblighi del
builder/verificatore dell'immagine prima della pubblicazione.

Il risultato e' `:live` con cinque u64 in DESTINATION o `:absent` senza
modificarla. Layout compatibile con il candidato del primario residente:
CSN, location (segmento/offset), lunghezza chiave e flag live, lunghezza record,
END zero. L'offset nell'arena del backend e' zero: non e' un riferimento a
una chiave prestata. Il risultato non autorizza un valore documento: il futuro
GET deve applicare MVCC, pin del segmento, controllo CRC e verifica della
chiave nel record attraverso i protocolli esistenti.

Le identita' caller restano immutabili per contratto. La rappresentazione
consente soltanto a cache e lettore di aggiornare i propri cursori privati;
non sono esportati setter o accessori. La cache prealloca un'identita' posseduta
per frame e copia i campi dal cursore dopo la verifica, prima di rendere valido
lo slot. Non trattiene piu' il cursore del chiamante: l'avanzamento del lettore
non cambia la chiave delle pagine in cache. Il cursore posseduto da un frame
si modifica soltanto dopo aver invalidato lo slot. Il contratto resta seriale,
senza lease su frame e senza nuove scritture condivise fra Serie.

## Attraversamento e limiti

Le directory selezionano un campo del digest a 64 bit, anche a cavallo dei
due u32. I campi dei livelli successivi devono trovarsi sotto quello del
padre, senza sovrapposizioni. Una directory dopo un bucket e una pagina chiave
nel percorso directory/overflow sono corruzioni. I riferimenti decrescenti
in offset e generazione vengono verificati dal codec a ogni caricamento.

Il bucket usa gruppi da 16: esamina tutti i candidati del gruppo prima di
fermarsi a EMPTY. Anche dopo un miss locale segue l'eventuale overflow.
Fingerprint e digest completo filtrano i candidati; i byte della chiave
inline o esterna decidono l'uguaglianza. Le catene esterne vengono verificate
fino alla fine anche dopo un mismatch: tipo, totale, posizione, ultimo
frammento e riferimenti devono essere coerenti con la entry.

Ogni visita consuma un credito pagina, inclusi hit della cache e frammenti
esterni; limite configurabile 1..65536. I confronti consumano la lunghezza
richiesta prima di leggere i byte, anche se il primo byte differisce;
limite cumulativo 1..16777216. I crediti si ripristinano a ogni lookup.
Esaurimento => `resource-exhausted`, mai falsa assenza. Confronti di lunghezze
diverse non leggono byte; le catene esterne continuano a consumare pagine.
I cicli hanno limiti espliciti in pagine, capacita' del bucket o byte chiave.

Il miss con I/O rimane bloccante nel suo attore. La memoria di prodotto e'
O(frame-count * page-size) per la cache, piu' due pagine scratch e metadati
O(frame-count); non c'e' un vettore residente di tutte le PageRef dell'immagine.
Il limite payload della cache non rappresenta la quota RSS totale del motore.
Nessuna promessa lock-free o qualifica oltre RAM deriva da questa API.

## Errori e verifica

Preflight senza I/O per owner, rientro, range, lunghezza e alias dello scratch.
I/O/CRC/identita'/topologia/limiti falliscono prima della copia del candidato;
DESTINATION rimane intatta. Ogni uscita, incluse uscite non locali dal
caricatore, libera BUSY. Gli errori non fanno pubblicare una root e non
modificano log: al futuro confine del motore resta la transizione FAULTED.
Nessun punto di atomicita' durevole nuovo; rollback senza migrazione dati.

Metodo: fixture manuali indipendenti dal codec writer, tre taglie, collisioni
complete, EMPTY prima di un candidato nello stesso gruppo, directory a piu'
livelli, overflow, chiave massima con cache di un frame, budget esatto e
insufficiente, corruzioni coerenti localmente ma incoerenti fra pagine,
uscite non locali e rientro. Confronto differenziale con il residente per
candidati e assenza; il suo offset arena viene normalizzato. Sei collisioni
nel differenziale rispettano gli otto campioni del residente: con venti
collisioni quel reader puo' restituire `:retry-limit`, non e' un oracolo di
assenza. Il paginato viene verificato separatamente con venti collisioni.
La misura delle allocazioni e' separata da SB-COVER: hit inline, directory
con un solo frame e chiave esterna massima con un solo frame, CSN/location
con bit alti impostati. Non misura RSS, latenza o concorrenza.

| Decisione composta C1 | Condizioni e casi |
|---|---|
| Budget factory | pagine intere 1..65536, byte interi 1..16777216; minimi/massimi, zero, negativo, frazionario, massimo+1 |
| Dominio radix | bits 1..11, shift 0..63, somma <=64; geometria dal codec; confronto numerico indipendente a tutti gli shift validi |
| Candidato bucket | fingerprint, low, high, byte chiave; collisioni complete, fingerprint/digest diverso e byte diverso |
| Inline uguale | lunghezza uguale e byte uguali; lunghezza diversa, stessa lunghezza con mismatch, hit |
| Catena esterna | tipo chiave, totale e posizione; tipo errato, posizione errata, totale errato; catena massima e mismatch all'ultimo byte |
| Directory successiva | bucket gia' visto oppure campo oltre limite; overflow di tipo errato e directory con bit sovrapposti |
| Alias input | scratch bucket o scratch chiave; preflight esclude entrambe le sorgenti private |
| CSN positivo codec | parola low positiva oppure high positiva; fixture CSN massimo, zero respinto e CSN low-only/high-only |

Due letture C1 dello stesso autore: prima, contratti/layout/budget/topologia;
seconda, ownership dei cursori, invalidazione/pubblicazione del frame,
propagazione errori, copia solo dopo esito completo e allocazioni dei valori
u64. Non sono revisione indipendente o qualifica MC/DC dell'intero motore.
