(:SCHEMA-VERSION 1 :KIND :WORKER-SERIES-SOURCE-BUNDLE :VERSION "integrated-full-check-freeze"
 :SOURCES
 ((:PATH
   #A((142) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/docs/implementazione/worker-serie-decisioni.md")
   :BYTES 24745 :SHA256 "ac9a6b6732ea2d6335e72802f3844daf262bdd63bc03560c8e628cd4b88123ac"
   :GIT-BLOB "9cfa2d91655890f50c7a0d83cb14f0bbae650f21" :TEXT
   "# Decisioni del collegamento worker–Serie

Inventario C1 preparato il 2026-10-11 dalla lettura dei tre sorgenti con
corpi di funzione del namespace `arcdocdb.execution.series`, inizialmente
su `2a0011f9d2bef104b22f7ad1eb86d7e5d60d5e11` e reintegrato senza modifiche
ai quattro sorgenti su `8101eb856cbe9d7540682babb53afb00fde30f70`.
I numeri di riga identificano
questa lettura, successiva alle correzioni WS-REV-01/02/03/04; il nome
della funzione e la forma restano il riferimento se cambia l'impaginazione.
Il quarto sorgente contiene soltanto la definizione del package. ASDF lo
carica, insieme ai tre corpi, dopo `series/retirement`, quando execution,
WAL e controller Serie sono già disponibili; nessun ciclo di caricamento.

| Sorgente letto | SHA-256 |
|---|---|
| [`worker-package.lisp`](../../src/series/worker-package.lisp) | `881a2958ddb8f5781954d4c59d7467e34c03c01fbb2fea43dc06e9e2050a1f37` |
| [`worker-types.lisp`](../../src/series/worker-types.lisp) | `a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a` |
| [`worker-boundary.lisp`](../../src/series/worker-boundary.lisp) | `793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73` |
| [`worker-run.lisp`](../../src/series/worker-run.lisp) | `f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f` |

REQ-CON-001/002/004/005 e REQ-AFF-001/004/008; INV-P1/P2/P5/P6, INV-A4
e INV-V4; [ADR-0005](../adr/0005-writer-logico-per-serie.md),
[ADR-0033](../adr/0033-fail-stop-e-integrita-end-to-end.md) e
[ADR-0045](../adr/0045-modello-di-esecuzione.md).
Valgono gli [standard C1](../affidabilita/standard-di-codifica.md), in
particolare COD-10/13/21/24/40/45/46/53/54.

Questa è una lettura statica e una preregistrazione delle prove richieste.
Non attribuisce esiti ai test letti, ai benchmark o alla copertura; tali
esiti devono essere collegati ai rapporti grezzi sul congelamento effettivo.
Non attesta revisione umana, MC/DC o assenza universale di allocazioni.

## Identità, precondizioni e stati

Il collegamento conserva tre riferimenti immutabili: contesto worker,
writer programmabile e controller Serie. Il caller stabilisce all'avvio
la sola associazione valida fra quel writer logico e quella Serie e
prealloca i collegamenti necessari ai worker. La factory non verifica
membership o unicità globale e non crea un pool. Ogni collegamento
appartiene al thread creatore del proprio contesto, senza rientranza.
Le API raw di worker/Serie non si usano per cambiare le capacità di un
tratto attivo; i controlli delle lease catturate rilevano i bypass descritti
nelle fixture, senza trasformarli in un trasferimento autorizzato.

| Fase del link | Obbligo locale | Fase worker ammessa |
|---|---|---|
| `:idle` | Lease writer e Serie zero; generation conservata. | Begin richiede separatamente `:claimed` del writer associato. |
| `:active` | Generation positiva, lease writer catturata corrente, lease Serie corrente; il batch resta nel worker. | `:running` oppure `:batch`. |
| `:closing` | Generation e lease writer correnti; nessun nuovo acquire/pop/ack. La lease Serie può essere zero per rifiuto o release già conclusa. | `:running` oppure `:finishing`. |
| `:faulted` | Stato terminale e condizione del bridge conservata; nessuna riparazione, cessione o release implicita. | Worker terminale; una sua diagnosi terminale preesistente viene conservata. |

Il token identifica soltanto la coppia link/tratto. La lease del
controller identifica la coppia controller/generation e il thread;
il token batch identifica la coppia contesto worker/batch. Sono tre
capacità distinte, anche se i loro interi possono coincidere.

Begin acquisisce il writer prima della Serie e non estrae messaggi.
Serie busy o generation esaurita restituiscono token, `:closing` e la
ragione distinta; il caller deve completare il termine esplicito prima
del ricircolo. Termina rifiuta il debito batch prima di qualsiasi release,
fissa `:closing`, rilascia Serie, azzera la sua lease soltanto dopo il
successo, poi termina il worker. End busy conserva `:closing` e la lease
writer: il tentativo successivo completa soltanto end e non ripete release.

## Inventario completo delle decisioni

`types:N`, `boundary:N` e `run:N` indicano i rispettivi sorgenti sopra.
Ogni riga distingue il ramo vero da quello falso; le funzioni delegate
non sono appiattite in decisioni locali. Il punto T01 censisce il controllo
owner delegato; gli altri 32 punti censiscono le forme di controllo
esplicite dei tre nuovi sorgenti. Le unioni `or` nei tipi non sono
decisioni COD-54.

| ID / posizione | Funzione e forma | Rami, condizione ed effetto |
|---|---|---|
| T01 / types:22,25 | `%check-owner-worker-serie` → `execution::%check-owner-worker` | Thread `eq` owner: prosegue; estraneo: `invalid-argument :worker-owner`, prima del handler e senza scritture. Non vi è un nuovo predicato locale. |
| T02 / types:33 | `%check-writer-worker-serie`, `unless (plusp generation)` | Vero: generation valida; falso: `invariant-violation :worker-serie-generation`, mai semplice rifiuto di token. WS-REV-02. |
| T03 / types:35 | Stesso helper, `unless (eq worker-writer bound-writer)` | Identità esatta: prosegue; altro/NIL: invariante binding. |
| T04 / types:37 | Stesso helper, `unless (plusp writer-lease)` | Token positivo: prosegue; zero: invariante lease. |
| T05 / types:39 | Stesso helper, `unless (= context-lease captured-lease)` | Lease identica: verifica completa worker delegata; diversa: invariante lease prima di pop/end. |
| T06 / types:51 | `%check-worker-serie`, `unless (null fault)` | Nessuna diagnosi in fase operativa: prosegue; diagnosi non NIL: invariante stato. |
| T07 / types:53 | Stesso helper, `case state` | Tre clausole operative `:idle`, `:active`, `:closing`; `otherwise` segnala invariante. `:faulted` entra soltanto nei getter o nel gate terminale della macro. |
| T08 / types:55 | Clausola idle, `unless (zerop writer-lease)` | Zero: prosegue; positivo: invariante lease, senza cancellare il campo. |
| T09 / types:57 | Clausola idle, `unless (zerop series-lease)` | Zero: prosegue; positivo: invariante lease, senza release correttiva. |
| T10 / types:61 | Clausola active, `unless (member worker-state '(:running :batch))` | Entrambe le fasi ammesse; ogni altra fase è invariante prima della verifica Serie. Segue `series::%check-owner` della lease catturata. |
| T11 / types:67 | Clausola closing, `unless (member worker-state '(:running :finishing))` | Entrambe ammesse; ogni altra fase è invariante. Nessuna lettura del controller, anche dopo la sua migrazione. |
| T12 / types:78 | `%require-worker-serie`, `unless (member link-state states)` | Stato nella lista letterale: controlli della forma/capacità; fuori lista: `resource-exhausted :worker-serie-state`, prima di leggere la Serie. |
| T13 / types:87 | `%check-token-worker-serie`, `unless (typep token 'index)` | Index: prosegue; tipo/range errato: `invalid-argument :worker-serie-token`. |
| T14 / types:88 | Stesso helper, `unless (plusp token)` | Positivo: prosegue; zero: stesso rifiuto ordinario, nessuna mutazione. |
| T15 / types:89 | Stesso helper, `unless (= token generation)` | Corrente: prosegue; stale/diverso: stesso rifiuto ordinario prima di mutare. |
| B01 / boundary:15–17 | `%fault-serie-posseduta`, `when (and A B C)` | Unica nuova decisione composta: marca `:archive` soltanto se tutte e tre le condizioni sono vere; altrimenti nessuna scrittura del controller. Coppie in tabella separata. |
| B10 / boundary:27 | `%fault-worker-serie`, primo `unless (eq worker-state :faulted)` | Worker operativo: può esaminare le allowlist B02–B05; worker già terminale: le salta tutte e rende terminale anche il bridge. Un fault già classificato dal sottopasso non torna benigno per coincidenza di ragione nel passo esterno. WS-REV-04. |
| B02 / boundary:28 | Stesso helper, `when (typep condition 'resource-exhausted)` | Classe resource: controlla B03; altra classe: passa a B04. La sola ragione non autorizza recupero. |
| B03 / boundary:29 | Stesso helper, `when (member reason resources)` | Ragione prevista per quel passo: ritorna NIL senza mutare; inattesa: prosegue verso il fault. |
| B04 / boundary:30 | Stesso helper, `when (typep condition 'invalid-argument)` | Classe invalid: controlla B05; altra classe: fault, salvo ritorno già avvenuto da B03. |
| B05 / boundary:31 | Stesso helper, `when (member reason arguments)` | Ragione invalid prevista: ritorna senza mutare; inattesa: fault. Nessun recupero di invarianti o errori runtime con la stessa ragione. |
| B06 / boundary:35 | Stesso helper, secondo `unless (eq worker-state :faulted)` | Worker ancora operativo: classifier con liste vuote lo rende terminale; già terminale: non sovrascrive la sua prima diagnosi. WS-REV-01. |
| B07 / boundary:38 | Stesso helper, `unless (eq saved-fault condition)` | Identità della condizione conservata: prosegue; errore di registrazione: invariante stato. |
| B08 / boundary:40 | Stesso helper, `unless (eq link-state :faulted)` | Terminale: ritorna; altrimenti invariante stato. |
| B09 / boundary:52 | `%passo-worker-serie`, `when (eq link-state :faulted)` nell'espansione | Terminale: `resource-exhausted :worker-serie-state` prima di installare il handler; operativo: esegue il corpo sotto il confine. La prima diagnosi non viene sostituita dal gate. |
| R01 / run:15 | `%acquire-worker-serie`, `unless (eq state :closing)` | Closing: prosegue; altra fase: invariante stato prima dell'acquisizione. |
| R02 / run:17 | Stesso helper, `unless (zerop series-lease)` | Zero: può acquisire; positiva: invariante lease, nessun acquire duplicato. |
| R03 / run:20,25 | Stesso helper, `handler-case` con la sola clausola `resource-exhausted`, interno a `%passo-worker-serie (link () ())` in run:14 | Successo: conserva lease Serie e passa active; resource: R04; altre condizioni: prima il confine locale senza ragioni recuperabili, poi quello esterno di begin. |
| R04 / run:26 | Clausola resource, `unless (member reason '(:serie-busy :serie-lease-generation))` | Due ragioni esatte: ritorna la ragione in closing; ogni altra resource viene risollevata EQ dentro il boundary nil/nil, diventando terminale anche se la ragione fosse ordinaria in un diverso sottopasso di begin. WS-REV-03. |
| R05 / run:46 | `inizia-worker-serie`, `unless (eq claimed-writer bound-writer)` | Identità: prosegue; altra: `invalid-argument :worker-serie-binding` prima di begin writer. |
| R06 / run:48 | Stessa API, `when (= generation most-positive-fixnum)` | Al limite: `resource-exhausted :worker-serie-generation` prima di begin; sotto il limite: nuova lease writer, closing e incremento monotono. |
| R07 / run:103 | `termina-worker-serie`, `unless (member worker-state '(:running :finishing))` | Running/finishing: può chiudere; batch o altro: `resource-exhausted :worker-state` prima di release Serie. Il controllo della forma può rilevare prima un'invariante. |
| R08 / run:106 | Stessa API, `when (plusp series-lease)` | Positiva: una release protetta dal boundary nil/nil in run:107 e poi azzeramento; zero: nessuna release e nessuna lettura Serie. End worker segue entrambi i rami. Nessuna ragione inattesa della release è recuperabile tramite la allowlist esterna di end. WS-REV-04. |

Factory e due getter non contengono altre decisioni: delegano T01;
la factory delega inoltre T06–T09 prima di restituire il link. Le API
lease/pop/ack aggiungono soltanto il confine B09, T12 e T13–T15, poi
delegano al controller o al worker. La restituzione di stato e ragione
da begin non aggiunge un `case`: è verificata dalle postcondizioni di
`%acquire-worker-serie`. Il valore `:idle/:schedule` di end viene dal
worker, che distingue tali esiti e conserva l'obbligo di ricircolo.

## Decisione composta e coppie indipendenti

In `%fault-serie-posseduta`:

- A = `(plusp captured-series-lease)`;
- B = `(eq controller-owner sb-thread:*current-thread*)`;
- C = `(= controller-lease-generation captured-series-lease)`.

Il test scritto `TEST-REQ-AFF-004-WORKER-SERIE-OWNED-FAULT-THREE-INDEPENDENT-TRUTH-PAIRS`,
in [`worker-bridge.lisp`](../../tests/series/worker-bridge.lisp), dichiara
quattro scenari indipendenti. La tabella è la lettura manuale delle
assegnazioni e del risultato richiesto, non un risultato strumentale.

| Scenario della fixture | A | B | C | Decisione richiesta | Contrasto |
|---|---|---|---|---|---|
| `:all-true` | V | V | V | Marca Archivio; solo health può cambiare. | Base comune. |
| `:lease-zero` | F | V | V | Nessuna scrittura del controller. | Con base cambia soltanto A. |
| `:owner-other` | V | F | V | Nessuna scrittura del controller. | Con base cambia soltanto B. |
| `:generation-stale` | V | V | F | Nessuna scrittura del controller. | Con base cambia soltanto C. |

Per A falso la fixture pone sia la lease catturata sia la generation
controller a zero, mantenendo owner uguale al thread: C rimane vero.
Questo stato è FI privata quiescente; non è una lease produttiva e
nessuna API owner viene invocata prima di ripristinare i campi FI.
Per B falso owner diventa NIL con lease/generation intatte; per C falso
la generation diventa lease+1 con owner e lease intatti. Ogni scenario
usa un controller sano distinto e confronta l'immagine prima/dopo,
eccetto la health nel caso tutto vero. Il cleanup FI non resetta health.

`and` cortocircuita: con A falso B/C non sono valutati, con B falso C
non è valutato. I valori della tabella sono quelli delle assegnazioni;
non si deduce la loro valutazione dinamica da sb-cover. Le coppie
manuali e il rapporto dei rami non attestano MC/DC del modulo.

## Allowlist per passo e classe di errore

Il confine non intercetta condizioni non `error`. Intercetta `error`
soltanto per registrare la transizione del worker, con handler locale
`dynamic-extent`: non sopprime né risolleva la condizione originaria.
Le liste sono letterali e finite; la ragione è ammessa soltanto nella
classe dichiarata e nel passo che segue.
Le allowlist vengono esaminate soltanto se il worker non è già terminale,
come stabilito da B10; un fault del sottopasso impedisce ogni conversione
successiva in rifiuto ordinario.

| API | Resource recuperabili | Invalid recuperabili | Fasi ammesse |
|---|---|---|---|
| `inizia-worker-serie` | `:worker-serie-state`, `:worker-state`, `:worker-serie-generation`, `:writer-queue-busy` | `:worker-serie-binding` | Link idle; worker claimed. |
| `%acquire-worker-serie`, boundary interno | Nessuna | Nessuna | Closing; writer acquisito. R03/R04, interno anche a questo boundary, converte soltanto le due resource Serie dichiarate. |
| `lease-worker-serie` | `:worker-serie-state` | `:worker-serie-token` | Active; worker running/batch. |
| `preleva-worker-serie` | `:worker-serie-state`, `:worker-state`, `:worker-generation`, `:writer-queue-busy` | `:worker-serie-token`, `:writer-target` | Active; il pop worker richiede running. |
| `conferma-worker-serie` | `:worker-serie-state`, `:worker-state` | `:worker-serie-token`, `:worker-batch` | Active; ack worker richiede batch. |
| `termina-worker-serie` | `:worker-serie-state`, `:worker-state`, `:writer-queue-busy` | `:worker-serie-token` | Active o closing; worker running/finishing. |
| Release Serie, boundary interno di termina | Nessuna | Nessuna | Closing; lease Serie positiva, prima del suo azzeramento. |

Le resource `:serie-busy` e `:serie-lease-generation` sono convertite
in `:closing` dal solo handler R03/R04, dopo begin writer, con la ragione
come terzo valore. Non sono nella allowlist esterna. Esaurimento locale
e esaurimento controller non sono retry ciechi: il primo conserva idle
senza lease nuova, il secondo impone chiusura della lease writer acquisita.

In begin vi sono due istanze dinamiche del confine: il primo boundary
ammette i rifiuti delle precondizioni e del writer, il secondo racchiude
soltanto `%acquire-worker-serie` con entrambe le liste vuote. Il
`handler-case` della Serie è ancora più interno e consuma i due rifiuti
attesi prima dei boundary. Se risolleva una resource sconosciuta oppure
si propaga un altro errore, il boundary interno rende terminali i contesti
prima che quello esterno possa riconoscere una ragione valida soltanto
per un passo diverso. Il boundary esterno non resetta il fault già
registrato: B10 salta le sue allowlist perché il worker è già terminale,
la stessa condizione continua a propagarsi e lo stato resta terminale.
Questa separazione
del sottopasso è WS-REV-03; non richiede un retry o un cleanup.

Termina contiene analogamente due boundary dinamici mentre deve ancora
rilasciare Serie: quello interno, con liste vuote, protegge soltanto la
release; quello esterno ammette i rifiuti di fase/token e busy del termine
writer. Una ragione `:writer-queue-busy` o `:worker-serie-token` iniettata
nella release non autorizza recupero: il boundary interno marca il fault
prima di quello esterno. Se la release fallisce, il suo token non viene
azzerato e il writer non viene terminato. Dopo release riuscita, retry di
end con token Serie zero non reinstalla il boundary della release.

Ragione corretta nella classe sbagliata, resource/invalid inattese,
`invariant-violation`, `io-fault` e altri errori runtime richiedono
fault terminale. La condizione del bridge resta lo stesso oggetto EQ;
se il worker era già terminale, conserva la sua prima condizione,
anche quando è diversa da quella del bridge. Wrong-thread e gate
faulted stanno prima del handler. Factory e getter non installano handler.

## Controlli delegati e coupling privato

| Delegato letto | Obbligo e confine |
|---|---|
| `execution::%check-owner-worker` | Owner del contesto; non legge Serie o writer sotto guard. |
| `execution::contesto-worker-writer-lease` | Confronto scalare con lease writer catturata; non ricostruisce un token da un ruolo migrato. |
| `execution::%check-worker` | Forma del worker, riferimenti/lease/debito/quote, cursori e ready; le sue decisioni restano nell'[inventario worker](writer-worker-decisioni.md). |
| `execution::%richiedi-worker` | Claimed verificato prima di begin; nessuna adozione o cessione implicita. |
| `execution::%classifica-guasto-worker` | Solo sul worker non ancora terminale, liste vuote: errore originale registrato senza reset di riferimenti o debito. |
| `series::%check-owner` | Thread, lease positiva, generation e ring corrente prima di utilizzare la Serie. Invarianti ring marcano Archivio; lease stale resta condizione propagata. |
| `series::controllore-serie-owner` e `...-lease-generation` | Solo letture scalari nel gate di fault B01; nessun check-ring che possa sostituire l'errore originale. |
| `series::%mark-fault :archive` | Una parola terminale, senza lease ricostruita, callback o verifica del ring; invocata soltanto per A/B/C veri. Non coordina altre Serie. |
| API pubbliche worker e Serie | Le loro pre/postcondizioni restano attive; pop/ack/end e ordine del controller non sono reimplementati dal bridge. |

Questo coupling è intenzionale fra le due fondazioni dello stesso
sistema ASDF: ogni modifica a owner/generation/lease/check/classifier
richiede revisione dell'integrazione. Il bridge non legge la Serie in
closing dopo release, anche se un altro worker l'ha già acquisita.
Un fault dopo release può rendere terminale soltanto bridge e worker;
il caller deve fermare l'Archivio quando l'esito lo richiede. Non è
sicuro marcare il controller di un tratto successivo usando una lease stale.

## Limiti, asserzioni e macro

Non vi sono cicli, ricorsione, attese, thread, callback, lookup globale,
I/O o retry nei tre sorgenti. Le liste `member` hanno lunghezza massima
quattro per resource, due per invalid e due per fasi: scansioni bounded.
Ogni passo è O(1), oltre alla copia batch bounded esistente; begin non
tocca ready, end restituisce al worker l'obbligo che il caller ricircola.
La factory alloca soltanto in fase di preallocazione. L'assenza di heap
sul percorso normale richiede la misura registrata separatamente.

Conteggi sintattici locali della lettura: si conta una base più ogni
`when`/`unless`, due ingressi booleani ulteriori per l'`and` a tre
condizioni, tre clausole non default del `case`, e la clausola del
`handler-case`; le decisioni delegate restano nelle proprie funzioni.
Il gate B09 introdotto dall'espansione è contato separatamente per ogni
istanza, senza appiattire il classifier nel chiamante. Il massimo è 9:
`%check-worker-serie` e `%fault-worker-serie`; `%fault-serie-posseduta`
è 4, `%check-writer-worker-serie` è 5. `%acquire-worker-serie` è 6 incluso
il gate macro, begin è 4, lease/pop/ack sono 2, termina è 5 inclusi i suoi
due gate macro. Le altre funzioni sono al più 4. Nessun corpo supera
60 righe. Questi conteggi non sono misure di copertura o numero di
interleaving concorrenti.

Pre/postcondizioni sono composte attraverso helper e verificatori:
inizio controlla idle/claimed/identità/limite prima delle acquisizioni e
verifica la fase dopo acquire; pop/ack controllano fase, token e capacità
prima delle verifiche worker, che effettuano anche i postcheck; termine
verifica entrambe le capacità e il debito prima di release, e dopo end
controlla soltanto il link idle con lease azzerate. Il fault verifica
separatamente identità della diagnosi e stato terminale. I getter hanno
soltanto la precondizione owner perché servono anche alla diagnosi.

`%passo-worker-serie` valuta link una sola volta con un binding lessicale,
verifica owner e stato terminale fuori dal handler, poi restituisce
senza trasformazione tutti i valori del corpo. Il test scritto
`TEST-REQ-AFF-008-WORKER-SERIE-BOUNDARY-ONCE-VALUES-AND-EXACT-CONDITION`
legge l'espansione, conta l'unico riferimento di input e verifica
valutazione singola, tre valori, condition EQ e immagini di rifiuto.
Il test non autorizza a dedurre heap nullo dalla sola espansione.
La stessa macro ha sette siti nel prodotto: cinque API pubbliche,
il sottopasso acquire Serie e il sottopasso release Serie. I due
handler simultanei di begin e, quando serve release, di termina sono
locali `dynamic-extent`; la loro assenza di heap richiede comunque
misura sul sorgente successivo a WS-REV-03/04.

Un'uscita nonlocale che non segnala `error` non viene intercettata:
non vi è cleanup automatico che rilasci, annulli o riusi capacità.
L'integrazione non consente abbandono nonlocale di un tratto e richiede
un confine del coordinatore per gli esiti incerti. Il bridge non applica
payload, non conferma client, non prova FINE I/O da `:written`, non
riusa buffer e non realizza shutdown o fairness del pool.

## Obblighi delle prove e rapporto grezzo

Le fixture scritte censiscono doppia lease e FIFO, quote e generazioni,
prima e seconda contesa, end busy dopo release Serie, debito batch,
token stale/tipo/zero, target/span/alias, identità binding, entrambi gli
esaurimenti, owner estraneo nelle quattro fasi, release fault e errore
fra le release, owner/generation Serie stale, coppie B01, macro e FINE
I/O dopo fault. Due fixture con thread reali distinguono esclusione sullo
stesso controller da due controller attivi prima di qualsiasi release.
Questa lettura non attribuisce throughput, P99, scalabilità o correttezza
universale al loro interleaving finito.

La regressione WS-REV-01 deve preservare la condition EQ del worker già
faulted quando begin del link provoca un nuovo errore. WS-REV-02 deve
rendere terminale la generation link zero in active e closing, senza
trattarla come token caller errato. I rami delle asserzioni, i motivi
non previsti e le classi di errore errate devono restare nell'inventario
anche se una campagna finita non li raggiunge.
La regressione WS-REV-03 deve iniettare nell'acquisizione Serie ragioni
ordinarie soltanto altrove (`:writer-queue-busy`, `:worker-serie-binding`)
e un errore runtime, mantenendo la condition EQ, writer/token trattenuti
e controller non modificato se non ne è stata acquisita la lease.
WS-REV-04 richiede altre due regressioni: tre classi di errore nella
release Serie con ragioni ammesse soltanto dal passo esterno; errore
nel pop raw già classificato come terminale dal worker ma con ragione
ammessa dal bridge (`:worker-serie-token`). Devono conservare la
condition EQ, i token e il fault terminale, senza end o pop duplicati.

Il rapporto di copertura `series` deve conservare tutti i dodici file
`src/series/` (otto controller più quattro bridge), con denominatori
grezzi, rami mancanti e nessuna esclusione dei package/helper/delegati
interni alla directory. Le decisioni execution transitive hanno il
proprio inventario e rapporto: uno scope Series non le misura. Rapporti
grezzi e decisioni manuali non provano MC/DC, tutti i percorsi di
interruzione o tutta la gerarchia di errori del motore.
")
  (:PATH
   #A((139) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/docs/implementazione/worker-serie-metodo.md")
   :BYTES 4006 :SHA256 "e4fc68f9dd6f0989f6b8791f8f93b87e4bc6ceb19c0b2b155683945acb5f2a7e" :GIT-BLOB
   "df02aed3cd659b1b09e746d8315f54e32f526965" :TEXT
   "# Metodo preregistrato del collegamento worker/Serie

Base iniziale `2a0011f9d2bef104b22f7ad1eb86d7e5d60d5e11`.
La qualificazione finale incorpora `main` fino a
`8101eb856cbe9d7540682babb53afb00fde30f70`, inclusa la fondazione hash:
le due prove preliminari sul primo scope rimangono distinte dalla verifica integrata.
Metodo fissato prima delle campagne e delle misure del nuovo collegamento.
Ambito: quattro sorgenti late in `src/series/worker-*.lisp`, ASDF, test della
suite Serie e strumento C4 `tools/worker-series-bench.lisp`.
Contratto e limiti nel [documento del modulo](worker-serie.md).

Verifiche previste, con input e oggetti preallocati:

- Tratto completo, ordine FIFO e identità dei payload, buffer con sentinelle,
  token/lease monotoni su ondate successive e ack prima della fine.
- Busy writer prima di acquisire Serie; busy della seconda lease e generation
  Serie esaurita, distinti nei tre valori del begin. Nessun pop e obbligo
  schedule conservato fino a ricircolo e nuovo tratto.
- Fine busy dopo release Serie: CLOSING/FINISHING, sola fine ritentabile,
  controller subito acquisibile e nessuna seconda release sul retry.
- Binding, fase, owner, token e generazioni invalidi prima delle mutazioni;
  batch debt, ack stale, alias/span e wrong-thread senza poisoning.
- Fault durante release Serie: stessa condizione, riferimento e lease
  conservati, worker non concluso; fault dopo release senza scrivere sul
  controller consegnato. Bypass delle lease catturate rifiutato prima del pop.
- Decisione composta del fault marking: tre condizioni scalari, ciascuna
  falsa indipendentemente con le altre vere, e tutte vere. Copertura manuale
  per le condizioni, senza dedurre MC/DC da sb-cover.
- Competizione sulla stessa Serie e due Serie contemporaneamente attive con
  thread reali, semafori e deadline del solo harness; nessun thread nel prodotto.
  Acquisizione di Serie FAULTED consentita per drenaggio già previsto dal controller.
- Macro boundary: espansione, valutazione singola, valori multipli, errore EQ
  e gate owner/faulted prima del handler. Allowlist esatte per tipo e ragione.
  Sottopassi di acquisizione e rilascio Serie isolati con allowlist vuote:
  una ragione ammessa soltanto dal writer non nasconde un errore della Serie,
  e il fault del worker sottostante non torna recuperabile nel bridge.
- Due letture C1 con dodici punti e inventario di tutte le decisioni; raw
  sb-cover e HTML per l'intero scope Series, file late inclusi, denominatore
  completo e lacune conservate. Nessuna esclusione approvata.
- Allocazione locale: warmup128, cinque campioni da4096 cicli completi su
  collegamento/worker/controller/target preallocati; GC e stampa fuori misura.
  Ogni ciclo accoda un payload, adotta obbligo, begin, legge lease, pop, ack,
  end idle e controlla identità/esiti/generazioni. Sink indipendente fisso
  per ciclo nel driver, non ricavato dalle funzioni di prodotto:
  `12+7+11+13+3+25+7+23=101`, sink campione `4096*101+4096*4095/2=8800256`.
  Controlli
  positivi dell'heap e sink errato dimostrano il rilevamento del C4.
- Strict COMPILE-FILE completo dello strumento e self-test del FASL con warning
  e style-warning fatali; il caricamento ASDF applica la sola eccezione per
  `sb-kernel:redefinition-warning` già dichiarata da `tools/build.lisp` per
  riletture/ridefinizioni del caricatore. Nessuna esclusione di avvisi di
  compilazione del C4. Build e test mirati prima del controllo completo.
  `make check` una volta sul codice finale congelato, salvo cambiamenti o failure.

Ogni campagna viene registrata con `tools/record-command.lisp`, conservando
stdout/stderr, argv, ambiente, report originali, snapshot iniziale/finale e
tentativi falliti. Le campagne usano copie congelate e cache distinte. I dati
grandi vengono compressi senza perdita con catalogo conservativo.
Non si deducono throughput, P99, fairness, scalabilità o heap zero universale
da questi campioni. Nessun gate della Fase0 viene chiuso per questa fondazione.
")
  (:PATH
   #A((132) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/docs/implementazione/worker-serie.md")
   :BYTES 4810 :SHA256 "dfcbeca509851592661e30ca2d475dd9fcfa7fb08165f61fee17bfa633c10150" :GIT-BLOB
   "7e470b27c01de9fbfb4d4b532136760ec18afdad" :TEXT "# Collegamento del worker alla Serie

Fondazione C1 autorizzata, conforme a REQ-CON-001/002/004/005 e
REQ-AFF-001/004/008; ADR-0005, ADR-0033 e ADR-0045. Il package
`arcdocdb.execution.series` viene caricato dopo execution e controller Serie.
Il [metodo preregistrato](worker-serie-metodo.md) fissa le verifiche;
l'[inventario delle decisioni](worker-serie-decisioni.md) conserva i denominatori.
Le [due letture C1](worker-serie-revisione.md) e i
[risultati locali](worker-serie-risultati.md) collegano le evidenze conservate.

Il caller configura all'avvio una sola associazione logica writer/Serie e
prealloca un `collegamento-worker-serie` per coppia contesto/associazione.
La configurazione è una precondizione: la factory non cerca duplicati in un
registro globale. Contesto, writer e controller restano read-only. Il binding
appartiene al thread del contesto, senza migrazione o rientranza. Un worker può
usare più binding preallocati, uno alla volta, secondo il writer preso dalla
lista pronta; claim, ricircolo e cessione restano nelle API del worker.

| API | Precondizione ed esito |
|---|---|
| `crea-collegamento-worker-serie` | Avvio sul thread del contesto; produce IDLE senza assumere un obbligo. |
| `inizia-worker-serie` | IDLE con worker CLAIMED del writer associato; acquisisce writer e poi Serie. Restituisce token, fase e ragione. |
| `lease-worker-serie` | ACTIVE e token corrente; restituisce la lease per le API del controller. |
| `preleva-worker-serie` | ACTIVE e token corrente; delega il pop e restituisce count/status/token batch. |
| `conferma-worker-serie` | ACTIVE e batch interamente elaborato; conferma solo il token batch corrente. |
| `termina-worker-serie` | ACTIVE senza debito, oppure CLOSING; libera Serie prima di concludere il worker. |
| `stato-worker-serie`, `errore-worker-serie` | Diagnosi owner-only, anche in FAULTED; nessun trasferimento di proprietà. |

Inizia restituisce `(token :active nil)` quando entrambe le lease sono presenti.
Se la seconda acquisizione rifiuta, restituisce `(token :closing :serie-busy)`
oppure `(token :closing :serie-lease-generation)`. La seconda ragione è un
esaurimento permanente: il caller deve chiudere il tratto e gestire la risorsa,
senza riprogrammarla indefinitamente. CLOSING non permette pop, ack, nuova
acquisizione o lettura della lease Serie. Il caller chiama esplicitamente termina;
il bridge non fa retry o cleanup impliciti. Busy del primo begin lascia IDLE e
worker CLAIMED, senza consumare un token di tratto.

Token di tratto e token batch sono capacità diverse, entrambe locali e monotone,
senza wrap. Il token di tratto vale solo con lo stesso binding. Esaurimento e
binding errato sono controllati prima del begin; token stale/zero o fuori tipo
sono rifiutati prima di mutazioni. Le lease catturate sono verificate contro
le capacità correnti: usare direttamente le API sottostanti durante un tratto
del bridge viola il protocollo e una capacità stale impedisce nuovi pop.

Il debito batch impedisce la fine prima di rilasciare Serie. Dopo la release
riuscita, il token Serie locale diventa zero: end busy conserva CLOSING e la
lease writer in FINISHING; la sola operazione permessa è ritentare termina.
Il retry non legge né libera di nuovo il controller, già utilizzabile da un
altro worker. Il risultato `:schedule` resta un obbligo unico nel worker,
da ricircolare o cedere con le sue API. Non si riapplica un prefisso di batch.

Il confine registra la stessa condizione inattesa in bridge e worker terminali,
conservando riferimenti e lease. Se il worker era già FAULTED, conserva la sua
prima causa; il bridge registra quella dell'operazione corrente. Marca il
controller FAULTED con ambito Archivio
soltanto quando owner e generazione della lease Serie sono ancora quelli
catturati. Dopo un handoff riuscito o una lease stale non tocca il controller
del tratto successivo: il caller deve fermare e coordinare l'Archivio sulla
diagnosi conservata. Nessun rollback, rilascio automatico o prova di quiescenza
è promesso. La salute non impedisce l'acquisizione: le API del controller
continuano a distinguere il drenaggio I/O consentito dalla nuova pubblicazione
vietata su fault. Fine I/O, ritiro e riuso restano regolati dal controller.

Il coupling interno a execution e Series è esplicito: controlli owner/lease,
generazione catturata e fault marking senza verificatori che possano mascherare
l'errore originario. Nessun I/O, thread, attesa, callback, lookup o contatore
globale viene aggiunto. Le API nuove sono O(1), oltre alla copia batch già
bounded. Il bridge cambia proprietà in memoria; non introduce atomicità durevole.
Routing, coordinatore Archivio, pool, admission, wake/park e applicazione dei
payload rimangono aperti. Le prove locali non qualificano il motore completo.
")
  (:PATH
   #A((127) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/src/series/worker-boundary.lisp")
   :BYTES 3443 :SHA256 "793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73" :GIT-BLOB
   "acc9f6ea83a8ef2774b41bdb114165b6bfb54949" :TEXT
   ";;;; Confine del tratto composto; nessun cleanup automatico o condizione sostituita.
;;; OWNER: thread del contesto; controller marcato solo con la lease ancora corrente.
;;; SHARED: salute della propria Serie su fault; nessuno stato tra Serie sul percorso normale.
(in-package #:arcdocdb.execution.series)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-004 REQ-AFF-001 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (collegamento-worker-serie) null) %fault-serie-posseduta))
(defun %fault-serie-posseduta (link)
  \"Pre: errore inatteso al confine worker. Post: FAULTED Archivio solo se la
lease Serie catturata è ancora posseduta; dopo handoff nessuna scrittura Serie.
Letture scalari private senza check-ring: non maschera la condizione originale.\"
  (let ((controller (collegamento-worker-serie-controller link))
        (lease (collegamento-worker-serie-series-lease link)))
    (when (and (plusp lease)
               (eq (arcdocdb.series::controllore-serie-owner controller) sb-thread:*current-thread*)
               (= (arcdocdb.series::controllore-serie-lease-generation controller) lease))
      (arcdocdb.series::%mark-fault controller :archive)))
  nil)

;;; REQ: REQ-CON-004 REQ-AFF-008
(declaim (ftype (function (collegamento-worker-serie list list error) null) %fault-worker-serie))
(defun %fault-worker-serie (link resources arguments condition)
  \"Pre: owner verificato, errore nel passo. Post: atteso propagato; inatteso
conservato EQ, bridge e worker terminali, capacità mantenute senza rollback.
Ragioni letterali bounded; dopo release Serie il coordinamento Archivio è del caller.\"
  (unless (eq (stato-worker-writer (collegamento-worker-serie-context link)) :faulted)
    (when (typep condition 'resource-exhausted)
      (when (member (error-reason condition) resources) (return-from %fault-worker-serie nil)))
    (when (typep condition 'invalid-argument)
      (when (member (error-reason condition) arguments) (return-from %fault-worker-serie nil))))
  (%fault-serie-posseduta link)
  (setf (collegamento-worker-serie-fault link) condition
        (collegamento-worker-serie-state link) :faulted)
  (unless (eq (stato-worker-writer (collegamento-worker-serie-context link)) :faulted)
    (arcdocdb.execution::%classifica-guasto-worker
     (collegamento-worker-serie-context link) nil nil condition))
  (unless (eq (collegamento-worker-serie-fault link) condition)
    (error 'invariant-violation :reason :worker-serie-state))
  (unless (eq (collegamento-worker-serie-state link) :faulted)
    (error 'invariant-violation :reason :worker-serie-state))
  nil)

;;; REQ: REQ-CON-004 REQ-AFF-008
(defmacro %passo-worker-serie ((link resources arguments) &body body)
  \"Pre: owner-only non rientrante, ragioni esatte per passo. Post: valori del
corpo o stessa condizione propagata; inattesa registrata con stato terminale.
Owner e faulted prima del handler; nessuna attesa/callback o release implicita.\"
  (let ((value (gensym \"LINK\")) (handler (gensym \"LINK-ERROR\")))
    `(let ((,value ,link))
       (%check-owner-worker-serie ,value)
       (when (eq (collegamento-worker-serie-state ,value) :faulted)
         (error 'resource-exhausted :reason :worker-serie-state))
       (flet ((,handler (condition)
                (%fault-worker-serie ,value ',resources ',arguments condition)))
         (declare (dynamic-extent #',handler))
         (handler-bind ((error #',handler)) ,@body)))))
")
  (:PATH
   #A((126) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/src/series/worker-package.lisp")
   :BYTES 1036 :SHA256 "881a2958ddb8f5781954d4c59d7467e34c03c01fbb2fea43dc06e9e2050a1f37" :GIT-BLOB
   "eae0c7c1d2305e72acd7b72124765765086da1f6" :TEXT
   ";;;; Collegamento locale preallocato, caricato dopo execution e il controller Serie.
;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(defpackage #:arcdocdb.execution.series
  (:use #:cl)
  (:import-from #:arcdocdb.binary #:index)
  (:import-from #:arcdocdb.conditions #:invalid-argument #:resource-exhausted
                #:invariant-violation #:error-reason)
  (:import-from #:arcdocdb.execution #:contesto-worker-writer #:writer-programmabile
                #:stato-worker-writer #:writer-worker-writer #:inizia-tratto-worker
                #:preleva-lavori-worker #:conferma-lavori-worker #:termina-tratto-worker)
  (:import-from #:arcdocdb.series #:controllore-serie #:acquisisci-controllore-serie
                #:rilascia-controllore-serie)
  (:export #:collegamento-worker-serie #:crea-collegamento-worker-serie
           #:inizia-worker-serie #:lease-worker-serie #:preleva-worker-serie
           #:conferma-worker-serie #:termina-worker-serie
           #:stato-worker-serie #:errore-worker-serie))
")
  (:PATH
   #A((122) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/src/series/worker-run.lisp")
   :BYTES 6985 :SHA256 "f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f" :GIT-BLOB
   "02c219d556a8cd807a0e322667dfb401d8b06fb6" :TEXT
   ";;;; Writer prima di Serie; Serie prima dell'handoff del writer, sempre bounded.
;;; OWNER: contesto e binding del thread creatore; debito batch non cancellato.
;;; SHARED: owner della sola Serie per tratto; nessuna scrittura globale per messaggio.
(in-package #:arcdocdb.execution.series)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (collegamento-worker-serie)
                         (member nil :serie-busy :serie-lease-generation)) %acquire-worker-serie))
(defun %acquire-worker-serie (link)
  \"Pre: writer acquisito, bridge CLOSING con Serie lease0. Post: ACTIVE con
Serie corrente, oppure CLOSING per busy/esaurimento senza alcun pop.
Altri errori propagati; nessun gate healthy per permettere il drenaggio I/O.\"
  (%passo-worker-serie (link () ())
  (unless (eq (collegamento-worker-serie-state link) :closing)
    (error 'invariant-violation :reason :worker-serie-state))
  (unless (zerop (collegamento-worker-serie-series-lease link))
    (error 'invariant-violation :reason :worker-serie-lease))
  (let ((refusal
          (handler-case
              (let ((lease (acquisisci-controllore-serie (collegamento-worker-serie-controller link))))
                (setf (collegamento-worker-serie-series-lease link) lease
                      (collegamento-worker-serie-state link) :active)
                nil)
            (resource-exhausted (condition)
              (unless (member (error-reason condition) '(:serie-busy :serie-lease-generation))
                (error condition))
              (error-reason condition)))))
    (%check-worker-serie link)
    refusal)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (collegamento-worker-serie)
                         (values index (member :active :closing)
                                 (member nil :serie-busy :serie-lease-generation) &optional)) inizia-worker-serie))
(defun inizia-worker-serie (link)
  \"Pre: IDLE, worker CLAIMED del writer associato. Post: token nuovo e ACTIVE
solo con entrambe le lease; seconda acquisizione rifiutata => CLOSING/token.
Caller termina CLOSING prima del ricircolo, senza pop/retry dell'acquisizione.
Binding/generation/fase controllati prima del begin; writer busy lascia IDLE.\"
  (%passo-worker-serie (link (:worker-serie-state :worker-state :worker-serie-generation :writer-queue-busy)
                            (:worker-serie-binding))
    (%require-worker-serie link '(:idle))
    (let ((context (collegamento-worker-serie-context link)))
      (arcdocdb.execution::%richiedi-worker context :claimed)
      (unless (eq (writer-worker-writer context) (collegamento-worker-serie-writer link))
        (error 'invalid-argument :reason :worker-serie-binding))
      (when (= (collegamento-worker-serie-generation link) most-positive-fixnum)
        (error 'resource-exhausted :reason :worker-serie-generation))
      (let ((lease (inizia-tratto-worker context)))
        (setf (collegamento-worker-serie-writer-lease link) lease
              (collegamento-worker-serie-state link) :closing)
        (incf (collegamento-worker-serie-generation link)))
      (let ((refusal (%acquire-worker-serie link)))
        (values (collegamento-worker-serie-generation link)
                (collegamento-worker-serie-state link) refusal)))))

;;; REQ: REQ-CON-002 REQ-AFF-008
(declaim (ftype (function (collegamento-worker-serie t) index) lease-worker-serie))
(defun lease-worker-serie (link token)
  \"Pre: ACTIVE, token del tratto corrente. Post: lease Serie per le API del controller.
INVALID-ARGUMENT token; fase rifiutata prima di leggere Serie, invarianti delegate.\"
  (%passo-worker-serie (link (:worker-serie-state) (:worker-serie-token))
    (%require-worker-serie link '(:active))
    (%check-token-worker-serie link token)
    (collegamento-worker-serie-series-lease link)))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (collegamento-worker-serie t t t t)
                         (values index (member :messages :empty :yield) index &optional)) preleva-worker-serie))
(defun preleva-worker-serie (link token target start end)
  \"Pre: ACTIVE/token corrente, target privato. Post: batch sotto entrambe le
lease, risultati e debito delegati al worker. Busy/span/alias rifiutati senza pop;
token di tratto distinto da batch; errori inattesi conservati al confine.\"
  (%passo-worker-serie (link (:worker-serie-state :worker-state :worker-generation :writer-queue-busy)
                            (:worker-serie-token :writer-target))
    (%require-worker-serie link '(:active))
    (%check-token-worker-serie link token)
    (preleva-lavori-worker (collegamento-worker-serie-context link) target start end)))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-AFF-008
(declaim (ftype (function (collegamento-worker-serie t t) null) conferma-worker-serie))
(defun conferma-worker-serie (link token batch)
  \"Pre: ACTIVE/token e batch completamente applicato dal caller. Post: debito
azzerato solo con token batch corrente; condizioni worker/token prima di mutare.
Non verifica effetti esterni e non permette replay di un prefisso applicato.\"
  (%passo-worker-serie (link (:worker-serie-state :worker-state) (:worker-serie-token :worker-batch))
    (%require-worker-serie link '(:active))
    (%check-token-worker-serie link token)
    (conferma-lavori-worker (collegamento-worker-serie-context link) batch)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (collegamento-worker-serie t) (member :idle :schedule)) termina-worker-serie))
(defun termina-worker-serie (link token)
  \"Pre: ACTIVE senza batch, oppure CLOSING da ritentare; token corrente.
Post: Serie rilasciata PRIMA di endwriter, IDLE locale e obbligo schedule al worker.
Debito rifiutato prima della release; busy end conserva CLOSING e lease writer.
Release fallita conserva token Serie; retry non ripete una release già riuscita.\"
  (%passo-worker-serie (link (:worker-serie-state :worker-state :writer-queue-busy) (:worker-serie-token))
    (%require-worker-serie link '(:active :closing))
    (%check-token-worker-serie link token)
    (let ((context (collegamento-worker-serie-context link)))
      (unless (member (stato-worker-writer context) '(:running :finishing))
        (error 'resource-exhausted :reason :worker-state))
      (setf (collegamento-worker-serie-state link) :closing)
      (when (plusp (collegamento-worker-serie-series-lease link))
        (%passo-worker-serie (link () ())
          (rilascia-controllore-serie (collegamento-worker-serie-controller link)
                                     (collegamento-worker-serie-series-lease link)))
        (setf (collegamento-worker-serie-series-lease link) 0))
      (let ((action (termina-tratto-worker context)))
        (setf (collegamento-worker-serie-writer-lease link) 0
              (collegamento-worker-serie-state link) :idle)
        (%check-worker-serie link)
        action))))
")
  (:PATH
   #A((124) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/src/series/worker-types.lisp")
   :BYTES 6493 :SHA256 "a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a" :GIT-BLOB
   "39f28974f3fae098d32d4ad1a056a45b06f777a6" :TEXT
   ";;;; Due capacità per tratto; nessuna coda, attesa, lookup o callback aggiunta.
;;; OWNER: campi del collegamento locali al thread creatore del contesto worker.
;;; SHARED: soltanto owner/health della Serie; nessuna scrittura globale per messaggio.
(in-package #:arcdocdb.execution.series)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(defstruct (collegamento-worker-serie
             (:constructor %make-collegamento-worker-serie (context writer controller))
             (:copier nil))
  \"Pre: associazione writer/Serie unica stabilita all'avvio dal caller.
Post: IDLE preallocato, token locali monotoni. Nessuna allocazione per tratto.\"
  (context nil :type contesto-worker-writer :read-only t)
  (writer nil :type writer-programmabile :read-only t)
  (controller nil :type controllore-serie :read-only t)
  (generation 0 :type index) (writer-lease 0 :type index) (series-lease 0 :type index)
  (state :idle :type (member :idle :active :closing :faulted))
  (fault nil :type (or null condition)))

;;; REQ: REQ-CON-002 REQ-AFF-008
(declaim (ftype (function (collegamento-worker-serie) null) %check-owner-worker-serie))
(defun %check-owner-worker-serie (link)
  \"Pre: collegamento locale. Post: owner del contesto verificato prima dei campi.
INVALID-ARGUMENT :worker-owner sul thread estraneo, senza poisoning o mutazioni.\"
  (arcdocdb.execution::%check-owner-worker (collegamento-worker-serie-context link)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (collegamento-worker-serie) null) %check-writer-worker-serie))
(defun %check-writer-worker-serie (link)
  \"Pre: owner verificato, tratto iniziato. Post: writer e lease catturata correnti.
INVARIANT-VIOLATION per bypass/stale, verificatore worker delegato; nessun pop.\"
  (let ((context (collegamento-worker-serie-context link)))
    (unless (plusp (collegamento-worker-serie-generation link))
      (error 'invariant-violation :reason :worker-serie-generation))
    (unless (eq (writer-worker-writer context) (collegamento-worker-serie-writer link))
      (error 'invariant-violation :reason :worker-serie-binding))
    (unless (plusp (collegamento-worker-serie-writer-lease link))
      (error 'invariant-violation :reason :worker-serie-lease))
    (unless (= (arcdocdb.execution::contesto-worker-writer-lease context)
               (collegamento-worker-serie-writer-lease link))
      (error 'invariant-violation :reason :worker-serie-lease))
    (arcdocdb.execution::%check-worker context))
  nil)

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (collegamento-worker-serie) null) %check-worker-serie))
(defun %check-worker-serie (link)
  \"Pre: owner esclusivo. Post: forma coerente e capacità ancora possedute.
Invarianti typed; CLOSING con Serie già ceduta non legge il controller.\"
  (%check-owner-worker-serie link)
  (unless (null (collegamento-worker-serie-fault link))
    (error 'invariant-violation :reason :worker-serie-state))
  (case (collegamento-worker-serie-state link)
    (:idle
     (unless (zerop (collegamento-worker-serie-writer-lease link))
       (error 'invariant-violation :reason :worker-serie-lease))
     (unless (zerop (collegamento-worker-serie-series-lease link))
       (error 'invariant-violation :reason :worker-serie-lease)))
    (:active
     (%check-writer-worker-serie link)
     (unless (member (stato-worker-writer (collegamento-worker-serie-context link)) '(:running :batch))
       (error 'invariant-violation :reason :worker-serie-state))
     (arcdocdb.series::%check-owner (collegamento-worker-serie-controller link)
                                   (collegamento-worker-serie-series-lease link)))
    (:closing
     (%check-writer-worker-serie link)
     (unless (member (stato-worker-writer (collegamento-worker-serie-context link)) '(:running :finishing))
       (error 'invariant-violation :reason :worker-serie-state)))
    (otherwise (error 'invariant-violation :reason :worker-serie-state)))
  nil)

;;; REQ: REQ-CON-002 REQ-AFF-008
(declaim (ftype (function (collegamento-worker-serie list) null) %require-worker-serie)
         (ftype (function (collegamento-worker-serie t) null) %check-token-worker-serie))
(defun %require-worker-serie (link states)
  \"Pre: owner esclusivo, elenco di fasi letterale bounded. Post: fase ammessa.
RESOURCE-EXHAUSTED fuori fase; verifica delle capacità solo nella fase ammessa.\"
  (unless (member (collegamento-worker-serie-state link) states)
    (error 'resource-exhausted :reason :worker-serie-state))
  (%check-worker-serie link)
  nil)

;;; REQ: REQ-CON-002 REQ-AFF-008
(defun %check-token-worker-serie (link token)
  \"Pre: owner e fase verificati. Post: token positivo della coppia link/tratto.
INVALID-ARGUMENT per tipo, zero o generation stale, prima di qualunque mutazione.\"
  (unless (typep token 'index) (error 'invalid-argument :reason :worker-serie-token))
  (unless (plusp token) (error 'invalid-argument :reason :worker-serie-token))
  (unless (= token (collegamento-worker-serie-generation link))
    (error 'invalid-argument :reason :worker-serie-token))
  nil)

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (contesto-worker-writer writer-programmabile controllore-serie)
                         collegamento-worker-serie) crea-collegamento-worker-serie))
(defun crea-collegamento-worker-serie (context writer controller)
  \"Pre: avvio sul thread del worker, mapping writer/Serie unico imposto dal caller.
Post: binding immutabile IDLE; INVALID-ARGUMENT owner, nessun claim o nuova lease.\"
  (arcdocdb.execution::%check-owner-worker context)
  (let ((link (%make-collegamento-worker-serie context writer controller)))
    (%check-worker-serie link)
    link))

;;; REQ: REQ-CON-002 REQ-AFF-008
(declaim (ftype (function (collegamento-worker-serie) (member :idle :active :closing :faulted)) stato-worker-serie)
         (ftype (function (collegamento-worker-serie) (or null condition)) errore-worker-serie))
(defun stato-worker-serie (link)
  \"Pre: owner corrente. Post: fase locale, anche dopo fault; INVALID-ARGUMENT owner.\"
  (%check-owner-worker-serie link)
  (collegamento-worker-serie-state link))

;;; REQ: REQ-CON-002 REQ-AFF-008
(defun errore-worker-serie (link)
  \"Pre: owner corrente. Post: condizione originale o NIL; INVALID-ARGUMENT owner.
Non trasferisce capacità né ripristina un tratto faulted.\"
  (%check-owner-worker-serie link)
  (collegamento-worker-serie-fault link))
")
  (:PATH
   #A((127) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/tests/series/worker-bridge.lisp")
   :BYTES 56677 :SHA256 "c1ee49702e63978a83cb86c4e5bf437a5a40e48fa02b65d3eaf3dca0d2e39176"
   :GIT-BLOB "cb61feecd1f097cfc86af5de8b169d222b84f7a8" :TEXT
   ";;;; Bridge worker/Serie: FIFO e token attesi non leggono gli indici del prodotto.
;;;; OWNER: ogni collegamento appartiene al thread che crea il suo contesto worker.
;;;; SHARED: soltanto controller, registry e semafori dichiarati nei test concorrenti.
;;;; FI: accessor privati solo per immagini di rifiuto, limiti e cleanup della fixture.
;;;; Nessun thread, retry o callback della fixture viene aggiunto al prodotto.
(in-package #:arcdocdb.series.tests)

(defun bridge-make (f items &optional (quantum 1))
  \"Fixture C4: cede la lease iniziale e adotta una sola volta l'obbligo writer.\"
  (when (series-fixture-lease f)
    (rilascia-controllore-serie (series-fixture-controller f) (series-fixture-lease f))
    (setf (series-fixture-lease f) nil))
  (let* ((ready (arcdocdb.execution:crea-lista-writer-pronti :shards 1 :capacity 1))
         (writer (arcdocdb.execution.tests::worker-test-writer items quantum))
         (context (arcdocdb.execution:crea-contesto-worker-writer ready)))
    (arcdocdb.execution:adotta-writer-worker context writer 0)
    (values (arcdocdb.execution.series:crea-collegamento-worker-serie
             context writer (series-fixture-controller f))
            context writer ready)))

(defun bridge-state (link context phase worker-phase writer)
  \"Verifica le fasi pubbliche senza usare lo stato privato come oracolo.\"
  (is (eq phase (arcdocdb.execution.series:stato-worker-serie link)))
  (is (eq worker-phase (arcdocdb.execution:stato-worker-writer context)))
  (is (eq writer (arcdocdb.execution:writer-worker-writer context)))
  (unless (eq phase :faulted)
    (is (null (arcdocdb.execution.series:errore-worker-serie link)))
    (is (null (arcdocdb.execution:errore-worker-writer context)))))

(defun bridge-begin (link expected &optional (expected-reason (when (eq expected :closing) :serie-busy)))
  \"Il token di tratto e positivo anche quando la seconda acquisizione rifiuta.\"
  (multiple-value-bind (token status reason) (arcdocdb.execution.series:inizia-worker-serie link)
    (is (and (typep token 'fixnum) (plusp token)))
    (is (eq expected status))
    (is (eq expected-reason reason))
    token))

(defun bridge-pop (link token target start end expected status)
  \"Oracolo FIFO per EQ, comprese tutte le celle caller non scritte.\"
  (let ((before (copy-seq target)))
    (multiple-value-bind (count actual batch)
        (arcdocdb.execution.series:preleva-worker-serie link token target start end)
      (is (= count (length expected))) (is (eq actual status))
      (loop for item in expected for i from start do (is (eq item (svref target i))))
      (dotimes (i (length target))
        (unless (<= start i (1- (+ start count)))
          (is (eq (svref before i) (svref target i)))))
      (if (eq status :messages)
          (is (and (typep batch 'fixnum) (plusp batch)))
          (is (zerop batch)))
      batch)))

(defun bridge-ack (link token batch)
  \"Il caller ha applicato l'intero batch prima di confermare il debito.\"
  (is (null (arcdocdb.execution.series:conferma-worker-serie link token batch))))

(defun bridge-end (link token action)
  \"Verifica il trasferimento finale esplicito, senza ricircolo implicito.\"
  (is (eq action (arcdocdb.execution.series:termina-worker-serie link token))))

(defun bridge-refusal (objects thunk type reason)
  \"Immagine completa prima/dopo un rifiuto ordinario: anche payload e identita.\"
  (let ((before (series-image objects)))
    (series-error thunk type reason)
    (is (series-image-equal before (series-image objects)))))

(defun bridge-closed-refusals (link token target)
  \"CLOSING consente solo termine, senza reacquire o nuovi pop/ack.\"
  (signals resource-exhausted (arcdocdb.execution.series:inizia-worker-serie link)
           :worker-serie-state)
  (signals resource-exhausted (arcdocdb.execution.series:lease-worker-serie link token)
           :worker-serie-state)
  (signals resource-exhausted
    (arcdocdb.execution.series:preleva-worker-serie link token target 0 1)
    :worker-serie-state)
  (signals resource-exhausted
    (arcdocdb.execution.series:conferma-worker-serie link token 1) :worker-serie-state))

(defun bridge-check-fault (f link context writer token condition &optional (scope :archive))
  \"Fault terminale conserva la condizione originale in entrambi i contesti.\"
  (bridge-state link context :faulted :faulted writer)
  (is (eq condition (arcdocdb.execution.series:errore-worker-serie link)))
  (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
  (if (eq scope :none) (series-healthy f) (series-faulted f scope))
  (let ((before (series-image (list f link))))
    (signals resource-exhausted (arcdocdb.execution.series:inizia-worker-serie link)
             :worker-serie-state)
    (signals resource-exhausted (arcdocdb.execution.series:lease-worker-serie link token)
             :worker-serie-state)
    (signals resource-exhausted
      (arcdocdb.execution.series:preleva-worker-serie link token nil 0 1)
      :worker-serie-state)
    (signals resource-exhausted
      (arcdocdb.execution.series:conferma-worker-serie link token nil) :worker-serie-state)
    (signals resource-exhausted
      (arcdocdb.execution.series:termina-worker-serie link token) :worker-serie-state)
    (is (series-image-equal before (series-image (list f link)))))
  (is (eq condition (arcdocdb.execution.series:errore-worker-serie link))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-004
(deftest test-REQ-CON-001-worker-serie-double-lease-fifo-ack-and-idle
  (with-series (f)
    (let ((one (vector :one)) (two (vector :two)))
      (multiple-value-bind (link context writer ready) (bridge-make f (list one two) 2)
        (declare (ignore ready))
        (bridge-state link context :idle :claimed writer)
        (let* ((token (bridge-begin link :active))
               (lease (arcdocdb.execution.series:lease-worker-serie link token))
               (target (vector :left :x :y :right)))
          (bridge-state link context :active :running writer)
          (is (equal '(0 0 0) (multiple-value-list
                              (conta-commit-serie (series-fixture-controller f) lease))))
          (bridge-ack link token (bridge-pop link token target 1 3 (list one two) :messages))
          (bridge-pop link token target 1 3 nil :yield)
          (bridge-end link token :idle)
          (bridge-state link context :idle :idle nil)
          (signals invalid-argument
            (conta-commit-serie (series-fixture-controller f) lease) :serie-lease)
          (let ((later (acquisisci-controllore-serie (series-fixture-controller f))))
            (is (> later lease))
            (rilascia-controllore-serie (series-fixture-controller f) later)))))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-worker-serie-quantum-rotation-monotone-tract-and-batch
  (with-series (f)
    (let ((items (list (vector 1) (vector 2) (vector 3))))
      (multiple-value-bind (link context writer ready) (bridge-make f items)
        (declare (ignore ready))
        (let ((previous-tract 0) (previous-batch 0) (previous-series 0))
          (loop for item in items for last = (eq item (third items))
                do (let* ((token (bridge-begin link :active))
                          (lease (arcdocdb.execution.series:lease-worker-serie link token))
                          (batch (bridge-pop link token (vector nil) 0 1 (list item) :messages)))
                     (is (> token previous-tract)) (is (> lease previous-series))
                     (is (> batch previous-batch))
                     (setf previous-tract token previous-series lease previous-batch batch)
                     (bridge-ack link token batch)
                     (bridge-end link token (if last :idle :schedule))
                     (bridge-state link context :idle (if last :idle :reschedule)
                                   (unless last writer))
                     (unless last
                       (arcdocdb.execution.tests::worker-check-recycle context nil :published 1)
                       (arcdocdb.execution.tests::worker-check-claim context writer :claimed 0)))))))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005
(deftest test-REQ-CON-005-worker-serie-first-lease-busy-does-not-touch-serie
  (with-series (f)
    (multiple-value-bind (link context writer ready) (bridge-make f '(:once))
      (declare (ignore ready))
      (let ((queue (arcdocdb.execution::writer-programmabile-queue writer)))
        (arcdocdb.execution.tests::with-execution-guard (queue)
          (bridge-refusal (list f link)
                          (lambda () (arcdocdb.execution.series:inizia-worker-serie link))
                          'resource-exhausted :writer-queue-busy)))
      (bridge-state link context :idle :claimed writer)
      (let ((token (bridge-begin link :active)))
        (bridge-ack link token (bridge-pop link token (vector nil) 0 1 '(:once) :messages))
        (bridge-end link token :idle)))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005
(deftest test-REQ-CON-005-worker-serie-second-lease-busy-closes-without-pop
  (with-series (f)
    (multiple-value-bind (link context writer ready) (bridge-make f '(:once))
      (declare (ignore ready))
      (let* ((controller (series-fixture-controller f))
             (held (acquisisci-controllore-serie controller)))
        (unwind-protect
             (let ((token (bridge-begin link :closing)) (target (vector :untouched)))
               (bridge-state link context :closing :running writer)
               (is (eq :running (arcdocdb.execution::writer-programmabile-state writer)))
               (is (zerop (arcdocdb.execution::coda-writer-extracted
                           (arcdocdb.execution::writer-programmabile-queue writer))))
               (let ((before (series-image (list f link target))))
                 (bridge-closed-refusals link token target)
                 (is (series-image-equal before (series-image (list f link target)))))
               (bridge-end link token :schedule)
               (bridge-state link context :idle :reschedule writer)
               (is (equal '(0 0 0) (multiple-value-list (conta-commit-serie controller held)))))
          (rilascia-controllore-serie controller held)))
      (arcdocdb.execution.tests::worker-check-recycle context nil :published 1)
      (arcdocdb.execution.tests::worker-check-claim context writer :claimed 0)
      (let ((token (bridge-begin link :active)))
        (bridge-ack link token (bridge-pop link token (vector nil) 0 1 '(:once) :messages))
        (bridge-end link token :idle)))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-worker-serie-second-lease-busy-and-end-busy-keep-obligation
  (with-series (f)
    (multiple-value-bind (link context writer ready) (bridge-make f '(:once))
      (declare (ignore ready))
      (let* ((controller (series-fixture-controller f))
             (queue (arcdocdb.execution::writer-programmabile-queue writer))
             (held (acquisisci-controllore-serie controller))
             (token (bridge-begin link :closing)))
        (unwind-protect
             (progn
               (arcdocdb.execution.tests::with-execution-guard (queue)
                 (signals resource-exhausted
                   (arcdocdb.execution.series:termina-worker-serie link token) :writer-queue-busy)
                 (bridge-state link context :closing :finishing writer)
                 (let ((before (series-image (list f link))))
                   (bridge-closed-refusals link token (vector nil))
                   (signals resource-exhausted
                     (arcdocdb.execution.series:termina-worker-serie link token) :writer-queue-busy)
                   (is (series-image-equal before (series-image (list f link))))))
               (bridge-end link token :schedule)
               (bridge-state link context :idle :reschedule writer))
          (rilascia-controllore-serie controller held)))
      (arcdocdb.execution.tests::worker-check-recycle context nil :published 1)
      (arcdocdb.execution.tests::worker-check-claim context writer :claimed 0)
      (let ((token (bridge-begin link :active)))
        (bridge-ack link token (bridge-pop link token (vector nil) 0 1 '(:once) :messages))
        (bridge-end link token :idle)))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-004
(deftest test-REQ-CON-005-worker-serie-releases-serie-before-busy-writer-end
  (with-series (f)
    (multiple-value-bind (link context writer ready) (bridge-make f '(:one :two) 2)
      (declare (ignore ready))
      (let* ((controller (series-fixture-controller f))
             (queue (arcdocdb.execution::writer-programmabile-queue writer))
             (token (bridge-begin link :active))
             (old (arcdocdb.execution.series:lease-worker-serie link token)))
        (bridge-ack link token (bridge-pop link token (vector nil) 0 1 '(:one) :messages))
        (arcdocdb.execution.tests::with-execution-guard (queue)
          (signals resource-exhausted
            (arcdocdb.execution.series:termina-worker-serie link token) :writer-queue-busy)
          (bridge-state link context :closing :finishing writer)
          (is (zerop (arcdocdb.execution.series::collegamento-worker-serie-series-lease link)))
          ;; La Serie e acquisibile mentre la guard writer impedisce ancora l'handoff.
          (let ((fresh (acquisisci-controllore-serie controller)))
            (unwind-protect
                 (progn
                   (is (> fresh old))
                   (signals invalid-argument (conta-commit-serie controller old) :serie-lease)
                   (let ((before (series-image (list f link))))
                     (bridge-closed-refusals link token (vector nil))
                     (signals resource-exhausted
                       (arcdocdb.execution.series:termina-worker-serie link token) :writer-queue-busy)
                     (is (series-image-equal before (series-image (list f link))))))
              (rilascia-controllore-serie controller fresh))))
        (bridge-end link token :schedule)
        (arcdocdb.execution.tests::worker-check-recycle context nil :published 1)
        (arcdocdb.execution.tests::worker-check-claim context writer :claimed 0)
        (let ((next (bridge-begin link :active)))
          (bridge-ack link next (bridge-pop link next (vector nil) 0 1 '(:two) :messages))
          (bridge-end link next :idle))))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-004
(deftest test-REQ-AFF-004-worker-serie-batch-debt-and-stale-ack-retain-both-leases
  (with-series (f)
    (multiple-value-bind (link context writer ready) (bridge-make f '(:one :two) 2)
      (declare (ignore ready))
      (let* ((token (bridge-begin link :active))
             (lease (arcdocdb.execution.series:lease-worker-serie link token))
             (batch (bridge-pop link token (vector nil) 0 1 '(:one) :messages)))
        (bridge-state link context :active :batch writer)
        (bridge-refusal (list f link)
                        (lambda () (arcdocdb.execution.series:termina-worker-serie link token))
                        'resource-exhausted :worker-state)
        (is (= lease (arcdocdb.execution.series:lease-worker-serie link token)))
        (dolist (bad (list nil 0 -1 1.0 :batch (1+ batch) (1+ most-positive-fixnum)))
          (bridge-refusal (list f link)
                          (lambda () (arcdocdb.execution.series:conferma-worker-serie link token bad))
                          'invalid-argument :worker-batch))
        (bridge-refusal (list f link)
                        (lambda () (arcdocdb.execution.series:preleva-worker-serie
                                     link token (vector nil) 0 1))
                        'resource-exhausted :worker-state)
        (bridge-ack link token batch)
        (let ((second (bridge-pop link token (vector nil) 0 1 '(:two) :messages)))
          (is (> second batch))
          (bridge-refusal (list f link)
                          (lambda () (arcdocdb.execution.series:conferma-worker-serie
                                       link token batch))
                          'invalid-argument :worker-batch)
          (bridge-ack link token second))
        (bridge-end link token :idle)))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-AFF-004
(deftest test-REQ-AFF-004-worker-serie-tract-token-refused-before-pop-ack-or-close
  (with-series (f)
    (multiple-value-bind (link context writer ready) (bridge-make f '(:old :new))
      (declare (ignore ready))
      (let ((old (bridge-begin link :active)))
        (bridge-ack link old (bridge-pop link old (vector nil) 0 1 '(:old) :messages))
        (bridge-end link old :schedule)
        (arcdocdb.execution.tests::worker-check-recycle context nil :published 1)
        (arcdocdb.execution.tests::worker-check-claim context writer :claimed 0)
        (let ((token (bridge-begin link :active)) (target (vector :untouched)))
          (is (> token old))
          (dolist (bad (list old 0 -1 nil 1.0 :tract (1+ token) (1+ most-positive-fixnum)))
            (dolist (operation
                      (list (lambda () (arcdocdb.execution.series:lease-worker-serie link bad))
                            (lambda () (arcdocdb.execution.series:preleva-worker-serie
                                         link bad target 0 1))
                            (lambda () (arcdocdb.execution.series:conferma-worker-serie link bad 1))
                            (lambda () (arcdocdb.execution.series:termina-worker-serie link bad))))
              (bridge-refusal (list f link target) operation 'invalid-argument :worker-serie-token)))
          (bridge-ack link token (bridge-pop link token target 0 1 '(:new) :messages))
          (bridge-end link token :idle))))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-AFF-004
(deftest test-REQ-AFF-004-worker-serie-target-span-and-alias-refusals-before-pop
  (with-series (f)
    (multiple-value-bind (link context writer ready) (bridge-make f '(:kept))
      (declare (ignore context ready))
      (let ((token (bridge-begin link :active)) (target (vector :left :x :right)))
        (dolist (range '((-1 1) (0 0) (2 1) (0 4) (nil 1) (0 nil) (0 1.0)))
          (bridge-refusal (list f link target)
                          (lambda () (arcdocdb.execution.series:preleva-worker-serie
                                       link token target (first range) (second range)))
                          'invalid-argument :writer-target))
        (dolist (bad (list nil '(1 2) (make-array 3 :element-type '(unsigned-byte 8))
                          (make-array 3 :adjustable t :initial-element :kept)
                          (arcdocdb.execution::coda-writer-slots
                           (arcdocdb.execution::writer-programmabile-queue writer))))
          (bridge-refusal (list f link target)
                          (lambda () (arcdocdb.execution.series:preleva-worker-serie
                                       link token bad 0 1))
                          'invalid-argument :writer-target))
        (bridge-ack link token (bridge-pop link token target 1 2 '(:kept) :messages))
        (bridge-end link token :idle)))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-AFF-004
(deftest test-REQ-AFF-004-worker-serie-static-binding-refuses-other-claimed-writer
  (with-series (f)
    (multiple-value-bind (right context writer ready) (bridge-make f '(:right))
      (declare (ignore ready))
      (let* ((other (arcdocdb.execution.tests::worker-test-writer '(:other)))
             (wrong (arcdocdb.execution.series:crea-collegamento-worker-serie
                     context other (series-fixture-controller f))))
        (bridge-refusal (list f right wrong)
                        (lambda () (arcdocdb.execution.series:inizia-worker-serie wrong))
                        'invalid-argument :worker-serie-binding)
        (bridge-state wrong context :idle :claimed writer)
        (let ((token (bridge-begin right :active)))
          (bridge-ack right token (bridge-pop right token (vector nil) 0 1 '(:right) :messages))
          (bridge-end right token :idle))
        (is (equal '(:other) (arcdocdb.execution.tests::handoff-drain other 1)))))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-AFF-008
(deftest test-REQ-AFF-008-worker-serie-local-generation-exhaustion-precedes-writer-begin
  (with-series (f)
    (multiple-value-bind (link context writer ready) (bridge-make f '(:kept))
      (declare (ignore ready))
      ;; FI quiescente: il budget e locale e la successiva acquisizione non lo azzera.
      (setf (arcdocdb.execution.series::collegamento-worker-serie-generation link)
            most-positive-fixnum)
      (bridge-refusal (list f link)
                      (lambda () (arcdocdb.execution.series:inizia-worker-serie link))
                      'resource-exhausted :worker-serie-generation)
      (bridge-state link context :idle :claimed writer)
      (let* ((fresh (arcdocdb.execution.series:crea-collegamento-worker-serie
                     context writer (series-fixture-controller f)))
             (token (bridge-begin fresh :active)))
        (bridge-ack fresh token (bridge-pop fresh token (vector nil) 0 1 '(:kept) :messages))
        (bridge-end fresh token :idle)))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-AFF-008
(deftest test-REQ-AFF-008-worker-serie-controller-generation-limit-requires-explicit-close
  (with-series (f)
    (multiple-value-bind (link context writer ready) (bridge-make f '(:kept))
      (declare (ignore ready))
      (let* ((controller (series-fixture-controller f))
             (saved (arcdocdb.series::controllore-serie-lease-generation controller)))
        (unwind-protect
             (progn
               (setf (arcdocdb.series::controllore-serie-lease-generation controller)
                     most-positive-fixnum)
               (let ((token (bridge-begin link :closing :serie-lease-generation)))
                 (bridge-state link context :closing :running writer)
                 (is (null (arcdocdb.series::controllore-serie-owner controller)))
                 (is (zerop (arcdocdb.execution::coda-writer-extracted
                             (arcdocdb.execution::writer-programmabile-queue writer))))
                 (bridge-end link token :schedule)
                 (bridge-state link context :idle :reschedule writer)))
          ;; Ripristino solo della FI; nessun reset o riuso di un contesto faulted.
          (setf (arcdocdb.series::controllore-serie-lease-generation controller) saved)))
      (arcdocdb.execution.tests::worker-check-recycle context nil :published 1)
      (arcdocdb.execution.tests::worker-check-claim context writer :claimed 0)
      (let ((token (bridge-begin link :active)))
        (bridge-ack link token (bridge-pop link token (vector nil) 0 1 '(:kept) :messages))
        (bridge-end link token :idle)))))

(defun bridge-foreign-probe (link context writer token)
  \"Owner gate prima del handler: il thread straniero non puo osservare o avvelenare.\"
  (dolist (operation
            (list (lambda () (arcdocdb.execution.series:stato-worker-serie link))
                  (lambda () (arcdocdb.execution.series:errore-worker-serie link))
                  (lambda () (arcdocdb.execution.series:lease-worker-serie link token))
                  (lambda () (arcdocdb.execution.series:inizia-worker-serie link))
                  (lambda () (arcdocdb.execution.series:preleva-worker-serie link token nil 0 1))
                  (lambda () (arcdocdb.execution.series:conferma-worker-serie link token nil))
                  (lambda () (arcdocdb.execution.series:termina-worker-serie link token))
                  (lambda () (arcdocdb.execution.series:crea-collegamento-worker-serie
                               context writer
                               (arcdocdb.execution.series::collegamento-worker-serie-controller link)))))
    (series-error operation 'invalid-argument :worker-owner)))

;;; REQ: REQ-CON-002 REQ-AFF-004 REQ-AFF-008
(deftest test-REQ-CON-002-worker-serie-foreign-owner-in-idle-active-batch-and-closing
  (with-series (f)
    (multiple-value-bind (link context writer ready) (bridge-make f '(:one :two) 2)
      (declare (ignore ready))
      (let ((go (sb-thread:make-semaphore)) (done (sb-thread:make-semaphore))
            (deadline (series-deadline 5)) (token 0) (threads nil))
        (unwind-protect
             (progn
               (push (series-worker
                      \"bridge foreign owner\"
                      (lambda ()
                        (dotimes (phase 4)
                          (series-wait go deadline)
                          (bridge-foreign-probe link context writer token)
                          (sb-thread:signal-semaphore done))
                        :ok)) threads)
               (labels ((probe ()
                          (let ((before (series-image (list f link))))
                            (sb-thread:signal-semaphore go)
                            (series-wait done deadline)
                            (is (series-image-equal before (series-image (list f link)))))))
                 (probe)
                 (setf token (bridge-begin link :active))
                 (probe)
                 (let ((batch (bridge-pop link token (vector nil) 0 1 '(:one) :messages)))
                   (probe) (bridge-ack link token batch))
                 (arcdocdb.execution.tests::with-execution-guard
                     ((arcdocdb.execution::writer-programmabile-queue writer))
                   (signals resource-exhausted
                     (arcdocdb.execution.series:termina-worker-serie link token) :writer-queue-busy)
                   (probe))
                 (bridge-end link token :schedule)
                 (arcdocdb.execution.tests::worker-check-recycle context nil :published 1)
                 (arcdocdb.execution.tests::worker-check-claim context writer :claimed 0)
                 (setf token (bridge-begin link :active))
                 (bridge-ack link token (bridge-pop link token (vector nil) 0 1 '(:two) :messages))
                 (bridge-end link token :idle))
               (series-join (first threads) deadline))
          (sb-thread:signal-semaphore go 4)
          (series-stop-workers threads))))))

;;; REQ: REQ-CON-002 REQ-AFF-001 REQ-AFF-008
(deftest test-REQ-AFF-008-worker-serie-release-fault-retains-two-leases-and-original-condition
  (with-series (f)
    (multiple-value-bind (link context writer ready) (bridge-make f '(:kept))
      (declare (ignore ready))
      (let* ((controller (series-fixture-controller f))
             (token (bridge-begin link :active))
             (series-lease (arcdocdb.execution.series:lease-worker-serie link token))
             (writer-lease (arcdocdb.execution.series::collegamento-worker-serie-writer-lease link)))
        ;; FI quiescente: rilascio con effetto locale incompleto e invariante Archive.
        (unwind-protect
             (progn
               (setf (arcdocdb.series::controllore-serie-effect-active controller) t)
               (let ((condition
                       (arcdocdb.execution.tests::worker-capture-condition
                        (lambda () (arcdocdb.execution.series:termina-worker-serie link token))
                        'invariant-violation :serie-effect)))
                 (bridge-check-fault f link context writer token condition)
                 (is (= series-lease
                        (arcdocdb.execution.series::collegamento-worker-serie-series-lease link)))
                 (is (= writer-lease
                        (arcdocdb.execution.series::collegamento-worker-serie-writer-lease link)))
                 (is (eq sb-thread:*current-thread*
                         (arcdocdb.series::controllore-serie-owner controller)))
                 (is (eq :running (arcdocdb.execution::writer-programmabile-state writer)))
                 (is (zerop (arcdocdb.execution::coda-writer-extracted
                             (arcdocdb.execution::writer-programmabile-queue writer))))))
          ;; Solo risorse della fixture: non ripara, resetta o riusa i contesti faulted.
          (setf (arcdocdb.series::controllore-serie-effect-active controller) nil)
          (rilascia-controllore-serie controller series-lease)
          (is (eq :schedule (arcdocdb.execution:termina-tratto-writer writer writer-lease))))))))

;;; REQ: REQ-CON-002 REQ-AFF-001 REQ-AFF-008
(deftest test-REQ-AFF-008-worker-serie-error-between-releases-preserves-condition-and-writer
  (with-series (f)
    (multiple-value-bind (link context writer ready) (bridge-make f '(:kept))
      (declare (ignore ready))
      (let* ((controller (series-fixture-controller f))
             (token (bridge-begin link :active))
             (lease (arcdocdb.execution.series::collegamento-worker-serie-writer-lease link))
             (original (make-condition 'simple-error :format-control \"FI between releases\")))
        (unwind-protect
             (let ((caught
                     (series-call-with-function-fi
                      'arcdocdb.execution:termina-tratto-worker
                      (lambda (ignored) (declare (ignore ignored)) (error original))
                      (lambda ()
                        (arcdocdb.execution.tests::worker-capture-condition
                         (lambda () (arcdocdb.execution.series:termina-worker-serie link token))
                         'simple-error nil)))))
               (is (eq original caught))
               (bridge-check-fault f link context writer token original :none)
               (is (null (arcdocdb.series::controllore-serie-owner controller)))
               (is (zerop (arcdocdb.execution.series::collegamento-worker-serie-series-lease link)))
               (is (= lease (arcdocdb.execution.series::collegamento-worker-serie-writer-lease link)))
               (is (eq :running (arcdocdb.execution::writer-programmabile-state writer))))
          ;; Libera soltanto la risorsa locale della fixture; non riusa il contesto faulted.
          (is (eq :schedule (arcdocdb.execution:termina-tratto-writer writer lease))))))))

;;; REQ: REQ-CON-002 REQ-AFF-001 REQ-AFF-004 REQ-AFF-008
(deftest test-REQ-AFF-004-worker-serie-stale-controller-lease-never-poisons-new-owner
  (dolist (reacquire '(nil t))
    (with-series (f)
      (multiple-value-bind (link context writer ready) (bridge-make f '(:kept))
        (declare (ignore ready))
        (let* ((controller (series-fixture-controller f))
               (token (bridge-begin link :active))
               (old (arcdocdb.execution.series:lease-worker-serie link token))
               (writer-lease (arcdocdb.execution.series::collegamento-worker-serie-writer-lease link))
               (new nil))
          ;; FI di bypass pubblico: prima release mantiene generation, poi reacquire
          ;; cambia solo la generation rispetto al predicato owner/thread del bridge.
          (rilascia-controllore-serie controller old)
          (when reacquire (setf new (acquisisci-controllore-serie controller)))
          (unwind-protect
               (let* ((before (series-image (list controller)))
                      (condition
                        (arcdocdb.execution.tests::worker-capture-condition
                         (lambda () (arcdocdb.execution.series:lease-worker-serie link token))
                         'invalid-argument :serie-lease)))
                 (bridge-check-fault f link context writer token condition :none)
                 (is (series-image-equal before (series-image (list controller))))
                 (is (= old (arcdocdb.execution.series::collegamento-worker-serie-series-lease link)))
                 (is (= writer-lease
                        (arcdocdb.execution.series::collegamento-worker-serie-writer-lease link)))
                 (when new
                   (is (> new old))
                   (is (equal '(0 0 0) (multiple-value-list (conta-commit-serie controller new))))))
            (when new (rilascia-controllore-serie controller new))
            ;; Cleanup separato della fixture: il contesto faulted resta terminale.
            (is (eq :schedule (arcdocdb.execution:termina-tratto-writer writer writer-lease)))))))))

;;; REQ: REQ-CON-002 REQ-AFF-001 REQ-AFF-004 REQ-AFF-008
(deftest test-REQ-AFF-004-worker-serie-owned-fault-three-independent-truth-pairs
  ;; A=lease>0, B=owner EQ current-thread, C=generation=lease.
  ;; False separati: gli altri due predicati restano veri, senza fault del bridge.
  ;; Il caso A falso usa generation0 soltanto nella FI quiescente; mai API owner.
  (dolist (scenario '(:all-true :lease-zero :owner-other :generation-stale))
    (with-series (f)
      (multiple-value-bind (link context writer ready) (bridge-make f '(:kept))
        (declare (ignore context writer ready))
        (let* ((controller (series-fixture-controller f))
               (token (bridge-begin link :active))
               (lease (arcdocdb.execution.series:lease-worker-serie link token)))
          (unwind-protect
               (progn
                 (ecase scenario
                   (:all-true nil)
                   (:lease-zero
                    (setf (arcdocdb.execution.series::collegamento-worker-serie-series-lease link) 0
                          (arcdocdb.series::controllore-serie-lease-generation controller) 0))
                   (:owner-other (setf (arcdocdb.series::controllore-serie-owner controller) nil))
                   (:generation-stale
                    (setf (arcdocdb.series::controllore-serie-lease-generation controller) (1+ lease))))
                 (let ((before (series-image (list controller)
                                             :health-opaque (when (eq scenario :all-true)
                                                              (list controller)))))
                   (is (null (arcdocdb.execution.series::%fault-serie-posseduta link)))
                   (if (eq scenario :all-true) (series-faulted f :archive) (series-healthy f))
                   (is (series-image-equal
                        before (series-image (list controller)
                                             :health-opaque (when (eq scenario :all-true)
                                                              (list controller)))))))
            ;; Solo ripristino dei campi FI, prima di chiamare di nuovo le API lease.
            (setf (arcdocdb.execution.series::collegamento-worker-serie-series-lease link) lease
                  (arcdocdb.series::controllore-serie-lease-generation controller) lease
                  (arcdocdb.series::controllore-serie-owner controller) sb-thread:*current-thread*)
            (bridge-end link token :schedule)))))))

;;; REQ: REQ-CON-004 REQ-AFF-004 REQ-AFF-008
(deftest test-REQ-AFF-008-worker-serie-boundary-once-values-and-exact-condition
  (with-series (f)
    (multiple-value-bind (link context writer ready) (bridge-make f '(:kept))
      (declare (ignore ready))
      (let ((evaluations 0)
            (expansion (macroexpand-1
                        '(arcdocdb.execution.series::%passo-worker-serie
                          ((bridge-boundary-link) (:worker-serie-state) (:worker-serie-token))
                          (values :a :b :c)))))
        (is (= 1 (arcdocdb.execution.tests::worker-tree-symbol-count
                  'bridge-boundary-link expansion)))
        (multiple-value-bind (a b c)
            (arcdocdb.execution.series::%passo-worker-serie
                ((progn (incf evaluations) link) (:worker-serie-state) (:worker-serie-token))
              (values :a :b :c))
          (is (eq a :a)) (is (eq b :b)) (is (eq c :c)))
        (is (= 1 evaluations))
        (dolist (condition (list (make-condition 'resource-exhausted :reason :worker-serie-state)
                                 (make-condition 'invalid-argument :reason :worker-serie-token)))
          (let ((before (series-image (list f link))))
            (is (eq condition
                    (arcdocdb.execution.tests::worker-capture-condition
                     (lambda ()
                       (arcdocdb.execution.series::%passo-worker-serie
                           (link (:worker-serie-state) (:worker-serie-token))
                         (error condition)))
                     (type-of condition) (error-reason condition))))
            (is (series-image-equal before (series-image (list f link))))))
        (let* ((token (bridge-begin link :active))
               (lease (arcdocdb.execution.series:lease-worker-serie link token))
               (writer-lease (arcdocdb.execution.series::collegamento-worker-serie-writer-lease link))
               (original (make-condition 'simple-error :format-control \"FI bridge boundary\")))
          (unwind-protect
               (progn
                 (is (eq original
                         (arcdocdb.execution.tests::worker-capture-condition
                          (lambda ()
                            (arcdocdb.execution.series::%passo-worker-serie
                                (link (:worker-serie-state) (:worker-serie-token))
                              (error original)))
                          'simple-error nil)))
                 (bridge-check-fault f link context writer token original))
            (rilascia-controllore-serie (series-fixture-controller f) lease)
            (is (eq :schedule (arcdocdb.execution:termina-tratto-writer writer writer-lease)))))))))

;;; REQ: REQ-CON-002 REQ-AFF-004 REQ-AFF-008
(deftest test-REQ-AFF-008-worker-serie-preserves-earlier-worker-fault-on-raw-begin
  (with-series (f)
    (multiple-value-bind (link context writer ready) (bridge-make f '(:old))
      (declare (ignore ready))
      ;; FI di bypass pubblico: consuma l'obbligo prima del begin raw del worker.
      (is (equal '(:old) (arcdocdb.execution.tests::handoff-drain writer 1)))
      (let* ((original
               (arcdocdb.execution.tests::worker-capture-condition
                (lambda () (arcdocdb.execution:inizia-tratto-worker context))
                'resource-exhausted :writer-not-ready))
             (controller (series-fixture-controller f))
             (before (series-image (list controller))))
        (is (eq :idle (arcdocdb.execution.series:stato-worker-serie link)))
        (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
        (is (eq original (arcdocdb.execution:errore-worker-writer context)))
        (let ((detected
                (arcdocdb.execution.tests::worker-capture-condition
                 (lambda () (arcdocdb.execution.series:inizia-worker-serie link))
                 'invariant-violation :worker-state)))
          (bridge-state link context :faulted :faulted writer)
          (is (eq detected (arcdocdb.execution.series:errore-worker-serie link)))
          ;; La rilevazione successiva non sostituisce la causa originale nel worker.
          (is (eq original (arcdocdb.execution:errore-worker-writer context)))
          (is (not (eq detected original)))
          (series-healthy f)
          (is (series-image-equal before (series-image (list controller)))))
        (let ((snapshot (series-image (list f link))))
          (signals resource-exhausted
            (arcdocdb.execution.series:inizia-worker-serie link) :worker-serie-state)
          (is (series-image-equal snapshot (series-image (list f link)))))
        (is (eq original (arcdocdb.execution:errore-worker-writer context)))))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-AFF-001 REQ-AFF-004 REQ-AFF-008
(deftest test-REQ-AFF-008-worker-serie-acquire-boundary-unknown-reasons-never-remain-recoverable
  ;; Queste ragioni sono recuperabili in altri passi, ma non nel confine Serie.
  ;; FI prima dell'ownership: nessuna lease/controller scrittura viene fabbricata.
  (dolist (original (list (make-condition 'resource-exhausted :reason :writer-queue-busy)
                          (make-condition 'invalid-argument :reason :worker-serie-binding)
                          (make-condition 'io-fault :reason :fixture-acquire :operation :series)))
    (with-series (f)
      (multiple-value-bind (link context writer ready) (bridge-make f '(:kept))
        (declare (ignore ready))
        (let* ((controller (series-fixture-controller f))
               (before (series-image (list controller)))
               (writer-lease nil))
          (unwind-protect
               (let ((caught
                       (series-call-with-function-fi
                        'arcdocdb.series:acquisisci-controllore-serie
                        (lambda (ignored) (declare (ignore ignored)) (error original))
                        (lambda ()
                          (arcdocdb.execution.tests::worker-capture-condition
                           (lambda () (arcdocdb.execution.series:inizia-worker-serie link))
                           (type-of original) (error-reason original))))))
                 (setf writer-lease
                       (arcdocdb.execution.series::collegamento-worker-serie-writer-lease link))
                 (let ((token (arcdocdb.execution.series::collegamento-worker-serie-generation link)))
                   (is (eq original caught))
                   (is (plusp token)) (is (plusp writer-lease))
                   (bridge-check-fault f link context writer token original :none)
                   (is (series-image-equal before (series-image (list controller))))
                   (is (null (arcdocdb.series::controllore-serie-owner controller)))
                   (is (zerop (arcdocdb.execution.series::collegamento-worker-serie-series-lease link)))
                   (is (= writer-lease (arcdocdb.execution::contesto-worker-writer-lease context)))
                   (is (eq :running (arcdocdb.execution::writer-programmabile-state writer)))
                   (is (zerop (arcdocdb.execution::coda-writer-extracted
                               (arcdocdb.execution::writer-programmabile-queue writer))))
                   (is (= 1 (arcdocdb.execution::coda-writer-count
                             (arcdocdb.execution::writer-programmabile-queue writer))))))
            ;; Solo lease della fixture: il bridge e il worker restano faulted.
            (when writer-lease
              (is (eq :schedule (arcdocdb.execution:termina-tratto-writer writer writer-lease))))))))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-AFF-001 REQ-AFF-004 REQ-AFF-008
(deftest test-REQ-AFF-008-worker-serie-release-boundary-unknown-reasons-retain-both-leases
  ;; FI prima della release: ragioni recuperabili altrove non giustificano retry
  ;; della chiusura composta dopo un errore inatteso nel confine della Serie.
  (dolist (original (list (make-condition 'resource-exhausted :reason :writer-queue-busy)
                          (make-condition 'invalid-argument :reason :worker-serie-token)
                          (make-condition 'io-fault :reason :fixture-release :operation :series)))
    (with-series (f)
      (multiple-value-bind (link context writer ready) (bridge-make f '(:kept))
        (declare (ignore ready))
        (let* ((controller (series-fixture-controller f))
               (token (bridge-begin link :active))
               (series-lease (arcdocdb.execution.series:lease-worker-serie link token))
               (writer-lease (arcdocdb.execution.series::collegamento-worker-serie-writer-lease link))
               (before (series-image (list controller) :health-opaque (list controller))))
          (unwind-protect
               (let ((caught
                       (series-call-with-function-fi
                        'arcdocdb.series:rilascia-controllore-serie
                        (lambda (ignored lease) (declare (ignore ignored lease)) (error original))
                        (lambda ()
                          (arcdocdb.execution.tests::worker-capture-condition
                           (lambda () (arcdocdb.execution.series:termina-worker-serie link token))
                           (type-of original) (error-reason original))))))
                 (is (eq original caught))
                 (bridge-check-fault f link context writer token original)
                 (is (series-image-equal
                      before (series-image (list controller) :health-opaque (list controller))))
                 (is (= series-lease
                        (arcdocdb.execution.series::collegamento-worker-serie-series-lease link)))
                 (is (= writer-lease
                        (arcdocdb.execution.series::collegamento-worker-serie-writer-lease link)))
                 (is (= writer-lease (arcdocdb.execution::contesto-worker-writer-lease context)))
                 (is (eq sb-thread:*current-thread*
                         (arcdocdb.series::controllore-serie-owner controller)))
                 (is (eq :running (arcdocdb.execution::writer-programmabile-state writer)))
                 (is (= 1 (arcdocdb.execution::coda-writer-count
                           (arcdocdb.execution::writer-programmabile-queue writer))))
                 (is (zerop (arcdocdb.execution::coda-writer-extracted
                             (arcdocdb.execution::writer-programmabile-queue writer)))))
            ;; Release raw solo dopo il ripristino della funzione FI; nessun riuso.
            (rilascia-controllore-serie controller series-lease)
            (is (eq :schedule (arcdocdb.execution:termina-tratto-writer writer writer-lease)))))))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-AFF-001 REQ-AFF-004 REQ-AFF-008
(deftest test-REQ-AFF-008-worker-serie-lower-worker-fault-cannot-match-benign-outer-token-reason
  (with-series (f)
    (multiple-value-bind (link context writer ready) (bridge-make f '(:kept))
      (declare (ignore ready))
      (let* ((controller (series-fixture-controller f))
             (token (bridge-begin link :active))
             (series-lease (arcdocdb.execution.series:lease-worker-serie link token))
             (writer-lease (arcdocdb.execution.series::collegamento-worker-serie-writer-lease link))
             (target (vector :untouched))
             (original (make-condition 'invalid-argument :reason :worker-serie-token))
             (before (series-image (list controller) :health-opaque (list controller))))
        (unwind-protect
             (let ((caught
                     (series-call-with-function-fi
                      'arcdocdb.execution:preleva-lavori-writer
                      (lambda (ignored lease buffer start end)
                        (declare (ignore ignored lease buffer start end)) (error original))
                      (lambda ()
                        (arcdocdb.execution.tests::worker-capture-condition
                         (lambda () (arcdocdb.execution.series:preleva-worker-serie
                                      link token target 0 1))
                         'invalid-argument :worker-serie-token)))))
               (is (eq original caught))
               ;; La causa nasce sotto worker: la stessa ragione e attesa solo al gate esterno.
               (bridge-check-fault f link context writer token original)
               (is (series-image-equal
                    before (series-image (list controller) :health-opaque (list controller))))
               (is (equalp #(:untouched) target))
               (is (= series-lease
                      (arcdocdb.execution.series::collegamento-worker-serie-series-lease link)))
               (is (= writer-lease
                      (arcdocdb.execution.series::collegamento-worker-serie-writer-lease link)))
               (is (= writer-lease (arcdocdb.execution::contesto-worker-writer-lease context)))
               (is (eq :running (arcdocdb.execution::writer-programmabile-state writer)))
               (is (= 1 (arcdocdb.execution::coda-writer-count
                         (arcdocdb.execution::writer-programmabile-queue writer))))
               (is (zerop (arcdocdb.execution::coda-writer-extracted
                           (arcdocdb.execution::writer-programmabile-queue writer))))
               (is (zerop (arcdocdb.execution::contesto-worker-writer-pending context)))
               (is (zerop (arcdocdb.execution::contesto-worker-writer-batch-generation context))))
          (rilascia-controllore-serie controller series-lease)
          (is (eq :schedule (arcdocdb.execution:termina-tratto-writer writer writer-lease))))))))

;;; REQ: REQ-CON-002 REQ-AFF-001 REQ-AFF-004 REQ-AFF-008
(deftest test-REQ-AFF-008-worker-serie-zero-active-generation-faults-only-owned-controller
  (dolist (phase '(:active :closing))
    (with-series (f)
      (multiple-value-bind (link context writer ready) (bridge-make f '(:kept))
        (declare (ignore ready))
        (let* ((controller (series-fixture-controller f))
               (held (when (eq phase :closing) (acquisisci-controllore-serie controller)))
               (token (bridge-begin link phase))
               (series-lease (when (eq phase :active)
                               (arcdocdb.execution.series:lease-worker-serie link token)))
               (writer-lease (arcdocdb.execution.series::collegamento-worker-serie-writer-lease link)))
          (unwind-protect
               (progn
                 ;; FI: generation zero non puo essere un tratto avviato dal prodotto.
                 (setf (arcdocdb.execution.series::collegamento-worker-serie-generation link) 0)
                 (let* ((before (series-image (list controller)
                                             :health-opaque (when series-lease (list controller))))
                        (condition
                          (arcdocdb.execution.tests::worker-capture-condition
                           (lambda () (arcdocdb.execution.series:termina-worker-serie link token))
                           'invariant-violation :worker-serie-generation)))
                   (bridge-check-fault f link context writer token condition
                                       (if series-lease :archive :none))
                   (is (series-image-equal
                        before (series-image (list controller)
                                             :health-opaque (when series-lease (list controller)))))
                   (is (= writer-lease
                          (arcdocdb.execution.series::collegamento-worker-serie-writer-lease link)))
                   (is (eq :running (arcdocdb.execution::writer-programmabile-state writer)))))
            (rilascia-controllore-serie controller (or held series-lease))
            (is (eq :schedule (arcdocdb.execution:termina-tratto-writer writer writer-lease)))))))))

;;; REQ: REQ-CON-002 REQ-WAL-006 REQ-AFF-001
(deftest test-REQ-WAL-006-worker-serie-faulted-controller-still-drains-finished-io
  (with-series (f)
    (let* ((lot (series-seal f))
           (adopted (multiple-value-list (series-adopt f lot)))
           (event (first adopted)) (generation (second adopted))
           (group (series-group f lot)))
      (series-begin f event generation)
      (arcdocdb.wal:esegui-gruppo group)
      (fault-controllore-serie (series-fixture-controller f) (series-fixture-lease f))
      (series-faulted f :serie)
      (multiple-value-bind (link context writer ready) (bridge-make f '(:fine-io))
        (declare (ignore context writer ready))
        (let* ((token (bridge-begin link :active))
               (lease (arcdocdb.execution.series:lease-worker-serie link token)))
          (setf (series-fixture-lease f) lease)
          (unwind-protect
               (let ((batch (bridge-pop link token (vector nil) 0 1 '(:fine-io) :messages)))
                 ;; Esecuzione terminata sincrona della fixture, non solo stato WRITTEN.
                 (series-complete f event generation)
                 (series-annul f event generation 1)
                 (series-faulted f :serie)
                 (series-counts f 1 0 0)
                 (bridge-ack link token batch)
                 (bridge-end link token :idle))
            (setf (series-fixture-lease f) nil)))))))

(defun bridge-contender (f item acquired release deadline result index)
  \"Una sola acquisizione, senza retry: la seconda Serie lease e busy oppure esclusiva.\"
  (multiple-value-bind (link context writer ready) (bridge-make f (list item))
    (declare (ignore ready))
    (multiple-value-bind (token status reason) (arcdocdb.execution.series:inizia-worker-serie link)
      (is (plusp token)) (setf (svref result index) status)
      (is (eq reason (when (eq status :closing) :serie-busy)))
      (sb-thread:signal-semaphore acquired)
      (series-wait release deadline)
      (case status
        (:active
         (let ((lease (arcdocdb.execution.series:lease-worker-serie link token)))
           (is (equal '(0 0 0) (multiple-value-list
                               (conta-commit-serie (series-fixture-controller f) lease)))))
         (bridge-ack link token (bridge-pop link token (vector nil) 0 1 (list item) :messages))
         (bridge-end link token :idle))
        (:closing
         (bridge-end link token :schedule)
         (bridge-state link context :idle :reschedule writer))
        (otherwise (error \"Esito bridge concorrente inatteso: ~S\" status)))
      :ok)))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005
(deftest test-REQ-CON-002-worker-serie-two-writers-one-controller-have-one-active-lease
  (with-series (f)
    (rilascia-controllore-serie (series-fixture-controller f) (series-fixture-lease f))
    (setf (series-fixture-lease f) nil)
    (let ((first-ready (sb-thread:make-semaphore)) (second-ready (sb-thread:make-semaphore))
          (release (sb-thread:make-semaphore)) (result (vector nil nil))
          (deadline (series-deadline 5)) (threads nil))
      (unwind-protect
           (progn
             (push (series-worker
                    \"bridge same Serie first\"
                    (lambda () (bridge-contender f (vector :one) first-ready release deadline result 0)))
                   threads)
             (series-wait first-ready deadline)
             (is (eq :active (svref result 0)))
             (push (series-worker
                    \"bridge same Serie second\"
                    (lambda () (bridge-contender f (vector :two) second-ready release deadline result 1)))
                   threads)
             (series-wait second-ready deadline)
             (is (eq :closing (svref result 1)))
             (sb-thread:signal-semaphore release 2)
             (dolist (thread threads) (series-join thread deadline))
             (setf (series-fixture-lease f) (acquisisci-controllore-serie (series-fixture-controller f)))
             (series-counts f 0 0 0)
             (series-healthy f))
        (sb-thread:signal-semaphore release 2)
        (series-stop-workers threads)))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005
(deftest test-REQ-CON-002-worker-serie-independent-controllers-active-concurrently
  (with-series (left :file-id 31)
    (with-series (right :file-id 32)
      (dolist (f (list left right))
        (rilascia-controllore-serie (series-fixture-controller f) (series-fixture-lease f))
        (setf (series-fixture-lease f) nil))
      (let ((acquired (sb-thread:make-semaphore)) (release (sb-thread:make-semaphore))
            (result (vector nil nil)) (deadline (series-deadline 5)) (threads nil))
        (unwind-protect
             (progn
               (loop for f in (list left right) for index from 0
                     do (let ((fixture f) (slot index) (item (vector index)))
                          (push (series-worker
                                 (format nil \"bridge distinct Serie ~D\" slot)
                                 (lambda () (bridge-contender fixture item acquired release
                                                             deadline result slot))) threads)))
               ;; Entrambi i worker devono arrivare prima che qualunque lease sia rilasciata.
               (dotimes (worker 2) (series-wait acquired deadline))
               (is (equalp #(:active :active) result))
               (sb-thread:signal-semaphore release 2)
               (dolist (thread threads) (series-join thread deadline))
               (dolist (f (list left right))
                 (setf (series-fixture-lease f)
                       (acquisisci-controllore-serie (series-fixture-controller f)))
                 (series-counts f 0 0 0) (series-healthy f))
               (is (not (eq (leggi-radice-serie (series-fixture-controller left))
                            (leggi-radice-serie (series-fixture-controller right))))))
          (sb-thread:signal-semaphore release 2)
          (series-stop-workers threads))))))
")
  (:PATH
   #A((126) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/tools/worker-series-bench.lisp")
   :BYTES 19835 :SHA256 "93db07d3e553b61404926094650a2c0d69d1593017a82c62270cc11ddfb6438c"
   :GIT-BLOB "2d9b7fca164ef84543bb3c0f68c525e6813a8a8c" :TEXT
   ";;;; C4: percorso seriale worker/Serie, preregistrato prima di qualsiasi campagna.
;;;; Un payload 5 per ciclo; enqueue/adopt/start/lease/pop/ack/end; nessun I/O nel ciclo.
;;;; Cinque repliche ordinate di 4096 cicli, ciascuna dopo 128 warmup e GC completa.
;;;; Fixture, API, target e contatori preallocati; heap/ticks raw, nessuna soglia temporale.
;;;; Oracolo indipendente per ciclo: 12+7+11+13+3+25+7+23 = 101.
;;;; --self-test oppure --bench directory-nuova/; fonti congelate per la campagna.
;;;; Per caricare il FASL senza CLI: feature :arcdocdb-worker-series-bench-library.
;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008 REQ-BEN-001 REQ-BEN-002
;;; OWNER: un thread possiede fixture, contesto, collegamento e sensore; nessuno SHARED.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require :asdf)
  (require :sb-md5)
  (require :sb-posix))
(defpackage #:arcdocdb.worker-series.bench (:use #:cl))
(in-package #:arcdocdb.worker-series.bench)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

(defconstant +iterations+ 4096)
(defconstant +warmup+ 128)
(defconstant +replicas+ 5)
(defconstant +cycle-token+ 101)

(defun fingerprints ()
  \"ASD, prodotto, fixture e sensore: confronto di stabilità, non autenticità.\"
  (loop for path in (append '(#p\"arcdocdb.asd\" #p\"tools/worker-series-bench.lisp\")
                            (sort (append (directory \"src/**/*.lisp\")
                                          (directory \"tests/**/*.lisp\"))
                                  #'string< :key #'namestring))
        collect (list :file (enough-namestring path)
                      :md5 (format nil \"~(~{~2,'0X~}~)\"
                                   (coerce (sb-md5:md5sum-file path) 'list)))))

(defun load-product ()
  \"Compila prodotto e fixture prima della misura; warning/style-warning di compilazione fatali.
Come tools/build.lisp, la sola ridefinizione runtime di macro tra compile/load ASDF
non è un difetto di compilazione; nessuna eccezione nel COMPILE-FILE del C4 stesso.\"
  (setf asdf:*compile-file-failure-behaviour* :error asdf:*compile-file-warnings-behaviour* :error)
  (let ((*standard-output* *error-output*))
    (handler-bind ((warning (lambda (condition)
                             (unless (typep condition 'sb-kernel:redefinition-warning)
                               (error \"COD-01: avviso non ammesso: ~A.\" condition)))))
      (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
      (asdf:load-system \"arcdocdb/tests\" :force t))))

(defun api (package name &optional (visibility :external))
  \"Risolve le API prima del clock; un nome mancante o non esportato è errore del sensore.\"
  (multiple-value-bind (symbol actual) (find-symbol name package)
    (unless (and symbol (eq actual visibility) (fboundp symbol))
      (error \"COD-60: API ~A:~A non disponibile.\" package name))
    (symbol-function symbol)))

(defun with-cycle (thunk)
  \"Fixture mock I/O posseduta; lease iniziale rilasciata prima di invocare THUNK.\"
  (funcall (api \"ARCDOCDB.SERIES.TESTS\" \"CALL-WITH-SERIES-FIXTURE\" :internal)
           (lambda (fixture)
             (let* ((controller (funcall (api \"ARCDOCDB.SERIES.TESTS\" \"SERIES-FIXTURE-CONTROLLER\" :internal)
                                        fixture))
                    (lease (funcall (api \"ARCDOCDB.SERIES.TESTS\" \"SERIES-FIXTURE-LEASE\" :internal) fixture))
                    (lease-symbol (find-symbol \"SERIES-FIXTURE-LEASE\" \"ARCDOCDB.SERIES.TESTS\")))
               (funcall (api \"ARCDOCDB.SERIES\" \"RILASCIA-CONTROLLORE-SERIE\") controller lease)
               (funcall (fdefinition (list 'setf lease-symbol)) nil fixture)
               (funcall thunk (cycle-function controller lease))))
           :capacity 1 :csn-capacity 1))

(defun cycle-function (controller initial-lease)
  \"Un obbligo esterno e un batch per ciclo; token/lease monotoni e span esatti verificati.\"
  (let* ((create-writer (api \"ARCDOCDB.EXECUTION\" \"CREA-WRITER-PROGRAMMABILE\"))
         (create-ready (api \"ARCDOCDB.EXECUTION\" \"CREA-LISTA-WRITER-PRONTI\"))
         (create-worker (api \"ARCDOCDB.EXECUTION\" \"CREA-CONTESTO-WORKER-WRITER\"))
         (enqueue (api \"ARCDOCDB.EXECUTION\" \"ACCODA-LAVORO-WRITER\"))
         (adopt (api \"ARCDOCDB.EXECUTION\" \"ADOTTA-WRITER-WORKER\"))
         (worker-writer (api \"ARCDOCDB.EXECUTION\" \"WRITER-WORKER-WRITER\"))
         (create-link (api \"ARCDOCDB.EXECUTION.SERIES\" \"CREA-COLLEGAMENTO-WORKER-SERIE\"))
         (start (api \"ARCDOCDB.EXECUTION.SERIES\" \"INIZIA-WORKER-SERIE\"))
         (lease (api \"ARCDOCDB.EXECUTION.SERIES\" \"LEASE-WORKER-SERIE\"))
         (pop (api \"ARCDOCDB.EXECUTION.SERIES\" \"PRELEVA-WORKER-SERIE\"))
         (ack (api \"ARCDOCDB.EXECUTION.SERIES\" \"CONFERMA-WORKER-SERIE\"))
         (end (api \"ARCDOCDB.EXECUTION.SERIES\" \"TERMINA-WORKER-SERIE\"))
         (state (api \"ARCDOCDB.EXECUTION.SERIES\" \"STATO-WORKER-SERIE\"))
         (writer (funcall create-writer :capacity 1 :quantum 1))
         (worker (funcall create-worker (funcall create-ready :shards 1 :capacity 1)))
         (link (funcall create-link worker writer controller))
         (target (make-array 3 :initial-element :outside))
         (counters (vector 0 initial-lease 0)))
    (lambda ()
      (let ((sink 0))
        (declare (type fixnum sink))
      (multiple-value-bind (count action) (funcall enqueue writer 5)
        (unless (and (= count 1) (eq action :schedule))
          (error \"COD-60: enqueue non trasferisce un obbligo unico.\"))
        (incf sink (+ count 11)))
      (unless (null (funcall adopt worker writer 0))
        (error \"COD-60: adozione worker non restituisce NIL.\"))
      (incf sink 7)
      (multiple-value-bind (token status reason) (funcall start link)
        (unless (and (= token (incf (the fixnum (svref counters 0))))
                     (eq status :active) (null reason) (eq writer (funcall worker-writer worker)))
          (error \"COD-60: identità/token/stato di avvio incoerenti.\"))
        (incf sink 11)
        (unless (= (funcall lease link token) (incf (the fixnum (svref counters 1))))
          (error \"COD-60: lease Serie non monotona.\"))
        (incf sink 13)
        (multiple-value-bind (count status batch) (funcall pop link token target 1 2)
          (unless (and (= count 1) (eq status :messages)
                       (= batch (incf (the fixnum (svref counters 2))))
                       (eql 5 (svref target 1)) (eq :outside (svref target 0))
                       (eq :outside (svref target 2)))
            (error \"COD-60: batch/payload/span incoerenti.\"))
          (incf sink (+ (* 3 count) (* 5 (the fixnum (svref target 1)))))
          (unless (null (funcall ack link token batch))
            (error \"COD-60: conferma batch non restituisce NIL.\"))
          (incf sink 7))
        (unless (and (eq :idle (funcall end link token)) (eq :idle (funcall state link)))
          (error \"COD-60: termine non rilascia il collegamento.\"))
        (incf sink 23))
      sink))))

(defun sample-record (replica iterations warmup token)
  \"Tutti i campi esistono prima di warmup, heap e clock; oracolo calcolato indipendentemente.\"
  (list :replica replica :status :running :stage :warmup :iterations iterations
        :warmup-iterations warmup :completed-iterations 0 :heap-bytes nil :raw-ticks nil
        :seconds nil :time-quality :pending :sink nil :diagnostic nil
        :expected-sink (logand most-positive-fixnum
                              (+ (* iterations token) (/ (* iterations (1- iterations)) 2)))))

(defun sample (function iterations token progress &key (warmup +warmup+) (clock #'get-internal-real-time))
  \"Misura bounded, GC prima del clock; anche l'errore conserva cicli e raw parziali.\"
  (unless (and (<= 1 iterations +iterations+) (<= 0 warmup +warmup+)
               (typep token '(integer 0 #.most-positive-fixnum)))
    (error \"COD-60: parametri fuori dal budget preregistrato.\"))
  (dotimes (i warmup) (funcall function))
  (sb-ext:gc :full t)
  (setf (getf progress :stage) :measured)
  (let ((before (funcall clock)) (heap-before (sb-ext:get-bytes-consed)) (sink 0) (failure nil))
    (declare (type fixnum sink))
    (handler-case
        (dotimes (i iterations)
          (setf sink (logand most-positive-fixnum (+ sink i (the fixnum (funcall function))))
                (getf progress :completed-iterations) (1+ i)))
      (error (condition) (setf failure condition)))
    (let ((heap (- (sb-ext:get-bytes-consed) heap-before)) (ticks (- (funcall clock) before)))
      (setf (getf progress :heap-bytes) heap (getf progress :raw-ticks) ticks
            (getf progress :sink) sink (getf progress :time-quality)
            (if (zerop ticks) :below-resolution :measured)
            (getf progress :seconds) (when (plusp ticks) (/ ticks (float internal-time-units-per-second 1d0))))
      (when failure (error failure))
      (unless (and (>= heap 0) (>= ticks 0) (= sink (getf progress :expected-sink)))
        (error \"COD-60: heap/clock negativo o sink ~D diverso da ~D.\" sink (getf progress :expected-sink)))
      (setf (getf progress :status) :ok (getf progress :stage) :complete)))
  progress)

(defun campaign (report checkpoint)
  \"Cinque campioni nello stesso contesto; checkpoint prima e dopo ogni misura.\"
  (with-cycle
   (lambda (function)
     (dotimes (replica +replicas+)
       (let ((progress (sample-record replica +iterations+ +warmup+ +cycle-token+)))
         (setf (getf report :current-replica) replica
               (getf report :samples) (append (getf report :samples) (list progress)))
         (funcall checkpoint)
         (sample function +iterations+ +cycle-token+ progress)
         (funcall checkpoint)
         (unless (zerop (getf progress :heap-bytes))
           (setf (getf progress :status) :failed
                 (getf progress :diagnostic) \"COD-30: heap osservato positivo.\")
           (error \"COD-30: heap osservato positivo nella replica ~D.\" replica))))))
  (setf (getf report :current-replica) nil)
  report)

(defun make-report ()
  \"Metadati, formula e limiti espliciti; il sensore non qualifica parallelismo o I/O.\"
  (list :schema-version 1 :kind :worker-series-benchmark :status :running :stage :pending
        :diagnostic nil :process-argv sb-ext:*posix-argv* :tool-arguments (uiop:command-line-arguments)
        :source-fingerprints-before (fingerprints) :source-fingerprints-after nil
        :source-consistency :pending :recorded-at (get-universal-time) :self-test nil
        :samples nil :current-replica nil :sbcl (lisp-implementation-version)
        :machine (machine-type) :os (software-type) :os-version (software-version)
        :workers 1 :shards 1 :writer-capacity 1 :ready-capacity 1 :serie-capacity 1 :safety 3
        :iterations +iterations+ :warmup +warmup+ :replicas +replicas+ :payload 5
        :timer-units-per-second internal-time-units-per-second :expected-cycle-token +cycle-token+
        :token-formula \"12+7+11+13+3+5*5+7+23=101; sample=N*101+N*(N-1)/2\"
        :limits '(:success-path-only :serial-owner :preallocated-inputs :mock-io-startup-only
                  :counter-not-absolute-nonallocation-proof :external-load-uncontrolled
                  :clock-zero-is-below-resolution :no-throughput-p99-scaling-or-time-threshold
                  :no-contention-pool-device-durability-or-release-qualification)))

(defun acquire-directory (path)
  \"Directory esclusiva 0700; rifiuta una destinazione precedente senza scriverla.\"
  (let ((directory (uiop:ensure-directory-pathname (merge-pathnames path (uiop:getcwd)))))
    (ensure-directories-exist
     (merge-pathnames \"parent-placeholder\" (uiop:pathname-parent-directory-pathname directory)))
    (sb-posix:mkdir (namestring directory) #o700)
    directory))

(defun write-report (report directory)
  \"Checkpoint esclusivo nella directory reclamata; ultimo rapporto leggibile conservato.\"
  (with-open-file (stream (merge-pathnames \"report.next.lisp\" directory)
                          :direction :output :if-exists :supersede)
    (let ((*print-readably* t)) (write report :stream stream :pretty t) (terpri stream)))
  (uiop:rename-file-overwriting-target (merge-pathnames \"report.next.lisp\" directory)
                                     (merge-pathnames \"report.lisp\" directory)))

(defun run-driver (args &key (product-loader #'load-product) (tester #'self-test) (runner #'campaign))
  \"CLI, load e sensori conservati; fallimenti mantengono replica e contatori già raccolti.\"
  (let ((report (make-report)) (directory nil))
    (handler-case
        (progn
          (unless (or (equal args '(\"--self-test\"))
                      (and (= 2 (length args)) (string= \"--bench\" (first args))))
            (error \"COD-61: uso --self-test oppure --bench directory-nuova/.\"))
          (when (= 2 (length args)) (setf directory (acquire-directory (second args))))
          (setf (getf report :stage) :load-product)
          (when directory (write-report report directory))
          (funcall product-loader)
          (setf (getf report :stage) :self-test (getf report :self-test) (funcall tester))
          (when directory
            (setf (getf report :stage) :campaign)
            (funcall runner report (lambda () (write-report report directory))))
          (setf (getf report :status) :ok (getf report :stage) :complete))
      (error (condition)
        (setf (getf report :status) :failed (getf report :diagnostic) (princ-to-string condition))
        (let ((last (car (last (getf report :samples)))))
          (when (and last (eq :running (getf last :status)))
            (setf (getf last :status) :failed (getf last :diagnostic) (princ-to-string condition))))))
    (let ((after (fingerprints)))
      (setf (getf report :source-fingerprints-after) after (getf report :source-consistency)
            (if (equal (getf report :source-fingerprints-before) after) :stable :changed))
      (when (and (eq :ok (getf report :status)) (eq :changed (getf report :source-consistency)))
        (setf (getf report :status) :source-changed (getf report :diagnostic) \"COD-61: sorgenti cambiati.\")))
    (when directory (write-report report directory))
    report))

(defun fresh-self-test-directory ()
  \"Fixture temporanea esclusiva; limite esplicito di mille collisioni.\"
  (loop for attempt below 1000
        for directory = (merge-pathnames
                         (format nil \"arcdocdb-worker-series-bench-~D-~D-~D/\"
                                 (get-universal-time) (sb-posix:getpid) attempt)
                         (uiop:temporary-directory))
        do (handler-case (progn (sb-posix:mkdir (namestring directory) #o700)
                                (return-from fresh-self-test-directory directory))
             (sb-posix:syscall-error (condition)
               (unless (= sb-posix:eexist (sb-posix:syscall-errno condition)) (error condition)))))
  (error \"COD-60: impossibile acquisire directory della fixture.\"))

(defun read-self-test-report (directory)
  \"Legge soltanto la fixture prodotta dal sensore; nessuna valutazione del dato.\"
  (let ((*read-eval* nil))
    (with-open-file (stream (merge-pathnames \"report.lisp\" directory)) (read stream))))

(defun self-test-reporter ()
  \"Destinazione precedente intatta; campione completo e raw parziale sopravvivono all'errore.\"
  (let ((root (fresh-self-test-directory)))
    (unwind-protect
         (let* ((existing (acquire-directory (merge-pathnames \"existing/\" root)))
                (failed (merge-pathnames \"failed/\" root)))
           (write-report '(:sentinel :unchanged) existing)
           (unless (and (eq :failed (getf (run-driver (list \"--bench\" (namestring existing))
                                                    :product-loader (constantly nil)
                                                    :tester (constantly :passed)) :status))
                        (equal (read-self-test-report existing) '(:sentinel :unchanged)))
             (error \"COD-60: report precedente non conservato.\"))
           (run-driver (list \"--bench\" (namestring failed))
                       :product-loader (constantly nil) :tester (constantly :passed)
                       :runner (lambda (report checkpoint)
                                 (setf (getf report :current-replica) 1 (getf report :samples)
                                       (list (list :status :ok :raw-ticks 3 :heap-bytes 0)
                                             (list :status :running :raw-ticks 7 :heap-bytes 11
                                                   :diagnostic nil)))
                                 (funcall checkpoint)
                                 (error \"fixture: replica interrotta\")))
           (let* ((saved (read-self-test-report failed)) (samples (getf saved :samples)))
             (unless (and (eq :failed (getf saved :status)) (= 1 (getf saved :current-replica))
                          (= 2 (length samples)) (eq :ok (getf (first samples) :status))
                          (eq :failed (getf (second samples) :status))
                          (= 7 (getf (second samples) :raw-ticks))
                          (= 11 (getf (second samples) :heap-bytes)))
               (error \"COD-60: campione precedente o raw del fallimento persi.\"))))
      ;; La cancellazione C4 riguarda soltanto la directory acquisita da questa fixture.
      (uiop:delete-directory-tree root :validate t)))
  :passed)

(defun self-test ()
  \"Prove sensore: allocazione positiva, sink errato, clock nullo, ciclo API e CLI invalida.\"
  (let* ((baseline (sample-record 0 +iterations+ +warmup+ 0))
         (positive (sample-record 0 16 0 1048576)) (probe nil)
         (wrong (sample-record 0 2 0 0)) (zero (sample-record 0 2 0 0))
         (composed (sample-record 0 4 0 +cycle-token+)))
    (sample (lambda () 0) +iterations+ 0 baseline)
    (unless (zerop (getf baseline :heap-bytes)) (error \"COD-60: contatore baseline non nullo.\"))
    (sample (lambda ()
              (setf probe (make-array 1048576 :element-type '(unsigned-byte 8) :initial-element 0))
              (length probe)) 16 1048576 positive :warmup 0)
    (unless (and (= 1048576 (length probe)) (>= (getf positive :heap-bytes) (* 16 1048576)))
      (error \"COD-60: allocazione deliberata non rilevata.\"))
    (unless (handler-case (progn (sample (lambda () 1) 2 0 wrong :warmup 0) nil)
              (error (condition)
                (setf (getf wrong :status) :expected-rejection
                      (getf wrong :diagnostic) (princ-to-string condition)) t))
      (error \"COD-60: sink errato non respinto.\"))
    (sample (lambda () 0) 2 0 zero :warmup 0 :clock (constantly 0))
    (unless (and (eq :below-resolution (getf zero :time-quality)) (null (getf zero :seconds)))
      (error \"COD-60: clock nullo convertito in durata.\"))
    (with-cycle (lambda (function) (sample function 4 +cycle-token+ composed :warmup 0)))
    (let ((called nil))
      (dolist (args '(nil (\"--bench\") (\"--bad\") (\"--bench\" \"directory\" \"extra\")))
        (unless (and (eq :failed (getf (run-driver args :product-loader (lambda () (setf called t))) :status))
                     (null called))
          (error \"COD-60: CLI invalida eseguita.\"))))
    (list :status :ok :baseline baseline :positive-control positive :wrong-sink-probe wrong
          :zero-clock-probe zero :composed-api-probe composed :invalid-cli :rejected
          :existing-destination-and-partial-raw (self-test-reporter))))

(defun main ()
  \"CLI C4: rapporto leggibile, errore esplicito e exit nonzero per ogni fallimento.\"
  (let ((report (run-driver (uiop:command-line-arguments))))
    (let ((*print-readably* t)) (write report :pretty t) (terpri))
    (unless (eq :ok (getf report :status))
      (format *error-output* \"~&worker-series-bench.lisp: ~A~%\" (getf report :diagnostic))
      (uiop:quit 1))))

(unless (member :arcdocdb-worker-series-bench-library *features*) (main))
")
  (:PATH
   #A((108) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/arcdocdb.asd")
   :BYTES 10622 :SHA256 "afcdbbaa5112407eb123b812a2c59472158964a81a94d75620556ad33db15454"
   :GIT-BLOB "250be7962e32207428ec03ad40c966bd72e9d3b4" :TEXT
   ";;;; arcdocdb.asd — definizione di sistema ASDF.
;;;;
;;;; Fondazioni dello storage, autorizzate dall'autore il 2026-10-08.

(in-package #:asdf-user)

(defsystem \"arcdocdb\"
  :description \"Database server documentale general-purpose, append-only, in Common Lisp (SBCL).\"
  :author \"Giacomo Picchiarelli\"
  :license \"BSD-2-Clause\"
  :version \"0.0.0\"
  :pathname \"src/\"
  :serial t
  :depends-on (\"sb-posix\")
  :components ((:file \"package\")
               (:module \"foundation\"
                :serial t
                :components ((:file \"package\") (:file \"conditions\")
                             (:file \"binary\") (:file \"crc32c\")
                             (:file \"record\") (:file \"batch\")))
               (:module \"hash\" :serial t
                :components ((:file \"package\") (:file \"arithmetic\") (:file \"blocks\") (:file \"hash64\")))
               (:module \"codec\" :serial t
                :components ((:file \"package\") (:file \"utf8\")
                             (:file \"cbor-package\") (:file \"cbor-header\")
                             (:file \"cbor-float-minimal\") (:file \"cbor-minimal\")
                             (:file \"cbor-space\") (:file \"cbor-scan-input\")
                             (:file \"cbor-scan-stack\") (:file \"cbor-scan-items\")
                             (:file \"cbor-scan\") (:file \"cbor-scan-minimal\")
                             (:file \"cbor-write\")))
               (:module \"csn\" :serial t
                :components ((:file \"package\") (:file \"registry\")))
               (:module \"cache\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"build\") (:file \"core\")
                             (:file \"read\") (:file \"clock\") (:file \"write\")))
               (:module \"execution\" :serial t
                :components ((:file \"package\") (:file \"queue\") (:file \"writer\")
                             (:file \"handoff\") (:file \"ready-types\") (:file \"ready\")
                             (:file \"ready-recycle\")
                             (:file \"worker-types\") (:file \"worker-boundary\") (:file \"worker-claim\") (:file \"worker-run\")))
               (:module \"storage\"
                :serial t
                :components ((:file \"package\") (:file \"formats\") (:file \"segment-header\")
                             (:file \"log-header\") (:file \"compaction-scan\")
                             (:file \"control-payload\") (:file \"payload-record\")
                             (:file \"payload-write\")))
               (:module \"io\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"native\")
                             (:file \"lifecycle\") (:file \"transfer\") (:file \"flush\")))
               (:module \"wal\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"builder\")
                             (:file \"group\") (:file \"executor\") (:file \"csn\")))
               (:module \"series\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"ownership\")
                             (:file \"events\") (:file \"io-events\") (:file \"publication\")
                             (:file \"query\") (:file \"retirement\")
                             (:file \"worker-package\") (:file \"worker-types\")
                             (:file \"worker-boundary\") (:file \"worker-run\")))
               (:module \"index\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"core\")
                             (:file \"validation\") (:file \"read\") (:file \"write\") (:file \"relocate\")
                             (:file \"primary-package\") (:file \"primary-types\") (:file \"primary-core\")
                             (:file \"primary-build\") (:file \"primary-probe\") (:file \"primary-read\")
                             (:file \"primary-write\") (:file \"primary-relocate\")
                             (:file \"primary-arena\") (:file \"primary-directory\")
                             (:file \"rebuild-scan\") (:file \"rebuild-budget\")
                             (:file \"rebuild-copy\") (:file \"rebuild\")
                             (:file \"hash-seed\") (:file \"hash-digests\")))
               (:module \"mvcc\" :serial t
                :components ((:file \"package\") (:file \"types\")
                             (:file \"snapshots-types\") (:file \"snapshots-core\") (:file \"snapshots-csn\")
                             (:file \"snapshots-register\") (:file \"snapshots-lifecycle\")
                             (:file \"snapshots-read\")))
               (:module \"epochs\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"core\")
                             (:file \"read\") (:file \"retire\") (:file \"reclaim\")))
               (:module \"read\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"core\")
                             (:file \"task\")))
               (:module \"get\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"build\")
                             (:file \"lifecycle\") (:file \"lookup\") (:file \"target\") (:file \"segment\")))
               (:module \"recovery\"
                :serial t
                :components ((:file \"package\") (:file \"scan\")
                             (:file \"decisions-package\") (:file \"decisions-types\")
                             (:file \"decisions-sort\") (:file \"decisions-radix\") (:file \"decisions-build\")
                             (:file \"decisions-query\")
                             (:file \"manifest-package\") (:file \"manifest-types\")
                             (:file \"manifest-decode\") (:file \"manifest-fold\")
                             (:file \"manifest-build\") (:file \"manifest-query\")
                             (:file \"inventory-types\") (:file \"inventory-build\")
                             (:file \"inventory-query\"))))
  :in-order-to ((test-op (test-op \"arcdocdb/tests\"))))

(defsystem \"arcdocdb/tests\"
  :description \"Test di ArcDocDB.\"
  :author \"Giacomo Picchiarelli\"
  :license \"BSD-2-Clause\"
  :depends-on (\"arcdocdb\")
  :pathname \"tests/\"
  :serial t
  :components ((:file \"smoke\")
               (:module \"hash\" :serial t
                :components ((:file \"support\") (:file \"hash64\") (:file \"guards\") (:file \"threads\")))
               (:module \"foundation\"
                :serial t
                :components ((:file \"support\") (:file \"binary\")
                             (:file \"record\") (:file \"batch\")))
               (:module \"codec\" :serial t
                :components ((:file \"support\") (:file \"utf8\") (:file \"threads\")
                             (:file \"cbor-support\") (:file \"cbor-header\") (:file \"cbor-threads\")
                             (:file \"cbor-minimal-support\") (:file \"cbor-minimal\")
                             (:file \"cbor-minimal-threads\") (:file \"cbor-minimal-edges\")
                             (:file \"cbor-structure-support\") (:file \"cbor-structure\")
                             (:file \"cbor-structure-threads\")
                             (:file \"cbor-minimal-scan-support\") (:file \"cbor-minimal-scan\")
                             (:file \"cbor-minimal-scan-threads\")
                             (:file \"cbor-write-support\") (:file \"cbor-write\")
                             (:file \"cbor-write-threads\") (:file \"cbor-write-roundtrip\")))
               (:module \"csn\" :serial t
                :components ((:file \"support\") (:file \"registry\") (:file \"threads\")))
               (:module \"mvcc\" :serial t
                :components ((:file \"support\") (:file \"lifecycle\") (:file \"capture\")))
               (:module \"execution\" :serial t
                :components ((:file \"support\") (:file \"queue\") (:file \"threads\")
                             (:file \"handoff\") (:file \"ready\") (:file \"ready-recycle\") (:file \"worker\")))
               (:module \"storage\"
                :serial t
                :components ((:file \"support\") (:file \"segment-header\") (:file \"log-header\")
                             (:file \"compaction-scan\")
                             (:file \"control-payload\")))
               (:module \"io\" :serial t
                :components ((:file \"support\") (:file \"transfer\") (:file \"native\")))
               (:module \"recovery\"
                :serial t
                :components ((:file \"support\") (:file \"scan\") (:file \"corruption\")
                             (:file \"decisions-support\") (:file \"decisions\")
                             (:file \"decisions-audit\") (:file \"decisions-radix\") (:file \"manifest-support\")
                             (:file \"manifest\") (:file \"manifest-audit\")
                             (:file \"inventory-support\") (:file \"inventory\")))
               (:module \"wal\" :serial t
                :components ((:file \"support\") (:file \"builder\") (:file \"group\") (:file \"fault\")
                             (:file \"native\") (:file \"csn\") (:file \"csn-threads\")))
               (:module \"series\" :serial t
                :components ((:file \"support\") (:file \"controller\") (:file \"boundaries\") (:file \"threads\")
                             (:file \"worker-bridge\")))
               (:module \"index\" :serial t
                :components ((:file \"slot-support\") (:file \"slots\") (:file \"slot-threads\")
                             (:file \"primary-support\") (:file \"primary\") (:file \"primary-threads\")
                             (:file \"rebuild\") (:file \"hash-digests\"))))
  :perform (test-op (o c)
             (uiop:symbol-call '#:arcdocdb.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.hash64.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.foundation.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.utf8.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.minimal.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.structure.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.minimal.scan.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.csn.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.mvcc.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.execution.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.storage.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.io.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.recovery.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.wal.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.series.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.index.slots.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.index.primary.tests '#:run)))
")
  (:PATH
   #A((126) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/docs/implementazione/README.md")
   :BYTES 6009 :SHA256 "d4f9abed3ace3c56f479809eaeae613bebb0c27a0a1d57d95732d8d9c4f0ad5d" :GIT-BLOB
   "ea591e626bd998c57791781501f70aa85d433371" :TEXT "# Implementazione

Fondazioni introdotte dopo la richiesta dell'autore del 2026-10-08 di iniziare la scrittura
del codice. L'autorizzazione non equivale alla chiusura dei criteri della Fase 0 o alla
qualifica del motore completo.

| Modulo | Contratto e verifica | Codice |
|---|---|---|
| Fondazioni binarie | [Record v1/v2, CRC32C e lotti SEAL](fondazioni-binarie.md) | [`src/foundation/`](../../src/foundation/) |
| Testo UTF-8 | [Validazione limitata, pura e parallela](utf8.md) | [`src/codec/utf8.lisp`](../../src/codec/utf8.lisp) |
| Testate CBOR | [Lettura pura in sei valori](cbor-header.md) | [`src/codec/cbor-header.lisp`](../../src/codec/cbor-header.lisp) |
| Testate CBOR minime | [Larghezze di argomenti e float, senza decodifica](cbor-minimo.md) | [`src/codec/cbor-minimal.lisp`](../../src/codec/cbor-minimal.lisp) |
| Scrittura delle testate CBOR | [MT0..6 minimi, destinazione privata e preflight](cbor-scrittura.md) | [`src/codec/cbor-write.lisp`](../../src/codec/cbor-write.lisp) |
| Struttura CBOR | [Item completo, UTF-8 e budget con scratch per worker](cbor-struttura.md) | [`src/codec/cbor-scan.lisp`](../../src/codec/cbor-scan.lisp) |
| Item CBOR con testate minime | [Un attraversamento, limiti e scratch privato](cbor-minimo-struttura.md) | [`src/codec/cbor-scan-minimal.lisp`](../../src/codec/cbor-scan-minimal.lisp) |
| CSN di Archivio | [Registro dei commit in corso e orizzonte](csn.md) | [`src/csn/`](../../src/csn/) |
| Metadati storage | [Header dei segmenti, EDIT e DECISION](metadati-storage.md) | [`src/storage/`](../../src/storage/) |
| Header dei log | [Identità e integrità di control e multiserie](header-log.md) | [`src/storage/log-header.lisp`](../../src/storage/log-header.lisp) |
| Segmenti compattati | [Prefisso CLOSED e record ordinari](segmenti-compattati.md) | [`src/storage/compaction-scan.lisp`](../../src/storage/compaction-scan.lisp) |
| Code dei writer | [MPSC locale, gettone e tratti limitati](code-writer.md) | [`src/execution/`](../../src/execution/) |
| Consegna dei writer | [Idle, pronto, in esecuzione e obbligo di scheduling](writer-handoff.md) | [`src/execution/handoff.lisp`](../../src/execution/handoff.lisp) |
| Lista dei writer pronti | [Ring preallocati, partizioni indipendenti e scansione limitata](writer-ready.md) | [`src/execution/ready.lisp`](../../src/execution/ready.lisp) |
| Ricircolo dei writer pronti | [Scambio FIFO atomico a ring pieno](writer-recycle.md) | [`src/execution/ready-recycle.lisp`](../../src/execution/ready-recycle.lisp) |
| Contesto worker | [Lease, batch confermati, retry e fault locale](writer-worker.md) | [`src/execution/worker-types.lisp`](../../src/execution/worker-types.lisp) |
| Integrazione dei worker | [Base comune, scope e controllo completo](writer-worker-integrazione.md) | [`arcdocdb.asd`](../../arcdocdb.asd) |
| Confine I/O | [Append, pread e flush durevole](io.md) | [`src/io/`](../../src/io/) |
| Lotti WAL | [Formazione, SEAL e group commit](wal.md) | [`src/wal/`](../../src/wal/) |
| CSN dei lotti WAL | [Chiusura, token e risoluzione](wal-csn.md) | [`src/wal/csn.lisp`](../../src/wal/csn.lisp) |
| Controller della Serie | [Pubblicazione FIFO, token e ritiro I/O](controller-serie.md) | [`src/series/`](../../src/series/) |
| Worker e Serie | [Doppia lease, debito batch e ordine dell'handoff](worker-serie.md) | [`src/series/worker-run.lisp`](../../src/series/worker-run.lisp) |
| Verifica del controller | [Prove strutturate, copertura e misure parallele](controller-serie-risultati.md) | [`tests/series/`](../../tests/series/) |
| Slot dell'indice v2 | [Payload compatto, seqlock e rilocazione](slot-indice-v2.md) | [`src/index/`](../../src/index/) |
| Indice primario v2 | [Chiavi, gruppi Swiss e pubblicazione della directory](indice-primario.md) | [`src/index/primary-read.lisp`](../../src/index/primary-read.lisp) |
| Hash delle chiavi | [XXH64 tipizzato, seme immutabile e mappe fisiche](hash-chiavi.md) | [`src/hash/`](../../src/hash/) |
| Cache dei record | [Insiemi associativi, CLOCK e copie verificate](cache-record.md) | [`src/cache/`](../../src/cache/) |
| Percorso GET | [Candidato, fonte readonly, cache e conferma snapshot](get-record.md) | [`src/get/`](../../src/get/) |
| Collegamento CSN/snapshot | [Registro unico e coordinamento senza attese](snapshot-csn.md) | [`src/mvcc/snapshots-csn.lisp`](../../src/mvcc/snapshots-csn.lisp) |
| Verifica snapshot e CSN | [Metodo preregistrato, decisioni e limiti](snapshot-verifica.md) | Registro e adattatore già presenti in `src/mvcc/` |
| Registro snapshot | [Pin, identità, attivazione e scadenza](registro-snapshot.md) | [`src/mvcc/snapshots-register.lisp`](../../src/mvcc/snapshots-register.lisp) |
| Epoche e reclaim | [Slot dei reader e ticket limitati per i segmenti](epoche-e-reclaim.md) | [`src/epochs/`](../../src/epochs/) |
| Compiti di lettura | [Ingresso EBR, controlli snapshot e cleanup](compiti-lettura.md) | [`src/read/`](../../src/read/) |
| Scansione recovery | [Prefisso dei log e testimonianze SEAL](scansione-log.md) | [`src/recovery/`](../../src/recovery/) |
| Decisioni multiserie | [Tabella TXID, CSN e partecipanti](decisioni-multiserie.md) | [`src/recovery/decisions-build.lisp`](../../src/recovery/decisions-build.lisp) |
| Manifest della Serie | [Ripiegamento degli EDIT del control log](manifest-control-log.md) | [`src/recovery/`](../../src/recovery/) |
| Inventario recovery | [Piano di riconciliazione dei nomi dei segmenti](inventario.md) | [`src/recovery/inventory-build.lisp`](../../src/recovery/inventory-build.lisp) |
| Ordinamento delle decisioni | [Radix misurato e query concorrenti](decisioni-radix-risultati.md) | [`src/recovery/decisions-radix.lisp`](../../src/recovery/decisions-radix.lisp) |

Le evidenze hanno un ambito esplicito: un test del codec non verifica transazioni,
durability, recovery o prestazioni del database.

Gli [esiti dei processi nelle mutazioni CBOR](cbor-mutazioni-processi.md)
distinguono i rilevamenti dei mutanti dagli errori dei worker di verifica.
")
  (:PATH
   #A((108) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/CHANGELOG.md")
   :BYTES 12729 :SHA256 "1d11a438f48bb8999dc2914e79d99967789c1eb15454ab4b33a4227e7cdec20f"
   :GIT-BLOB "c0dacf81ed3b12774c29ef8a0772037e79b437b9" :TEXT "# Changelog

Formato basato su [Keep a Changelog](https://keepachangelog.com/it-IT/1.1.0/). Il progetto
non ha ancora rilasci; le versioni seguiranno la [roadmap](docs/roadmap.md).

## [Non rilasciato]

### Aggiunto

- Collegamento preallocato worker/Serie: doppia lease, token monotoni, debito
  batch e rilascio Serie prima del worker, con retry limitato alla fine e
  conservazione dei guasti originali. Include 26 prove, due letture C1,
  copertura completa nel denominatore e cinque misure locali del percorso
  seriale; pool e coordinatore Archivio restano da integrare.

- Hash delle chiavi XXH64 tipizzato: ritorno in due u32, seme esplicito
  immutabile nell'indice, mappe verificate degli slot fisici per rebuild/split,
  propagazione dei guasti interni. Include 46 nuove regressioni, mutazioni,
  misure seriali/parallele e registri strutturati; lifecycle del seme e GET
  integrato ancora aperti.

- Nucleo GET con contesto preallocato per worker: hash col seme dell'indice e lookup sotto EBR,
  capacità segmento con header verificato, cache e I/O readonly, prova
  OUTCOME letta dallo stesso file e risposta privata fino alla conferma
  snapshot. Ricerca storica richiesta esplicitamente sui casi non risolvibili
  dall'indice corrente; resolver, pool, protocollo e qualifica C1 aperti.

- Cache dei record per Serie: classi preallocate, insiemi di otto posti,
  CLOCK limitato, ricerca senza lock e inserimento opportunistico. Ogni hit
  verifica CRC, chiave, CSN e prova prepared; corruzione della cache distinta
  dall’input del segmento. Verificatore comune con CSN in due u32,
  budget e contratti documentati; GET integrato e qualifica C1 aperti.

- Indice primario v2 in memoria: controlli Swiss a gruppi di 16, chiavi binarie
  in arena, lookup con budget comune e conferma root anche sul miss, upsert e
  cancellazione/rilocazione condizionale nel writer, crescita arena e piani monouso di pubblicazione
  directory, con hash delle chiavi e costruttore verificato split/rebuild.
  Lifecycle del seme e GET integrato ancora aperti;
  include contratti, tracciabilità ed evidenze statiche, qualifica C1 aperta.

- Banco di slot v2 dell'indice: parole u64 contigue, lettura in buffer privato
  con otto tentativi, pubblicazione e rimozione sotto seqlock, rilocazione
  condizionale, credito di scrittura e congelamento permanente. Include
  contratti, decisioni da coprire ed evidenze statiche; qualifica C1 aperta.

- Contesto di lettura preallocato per worker: ingresso EBR a tentativo singolo,
  snapshot controllato prima e dopo il lookup, anche sul miss, e cleanup del
  pin prima della migrazione. Collegato ai registri CSN/snapshot/epoche;
  indice, cache e pool restano da integrare, qualifica concorrente aperta.

- Dominio EBR per Archivio: annunci dei worker distanti 128 byte, ingresso
  senza mutex a tentativo singolo, ticket preallocati e crediti di epoca prima
  dello swap. Frontiera condivisa da più ritiri e claim esclusivo del reclaim;
  integrazione con segmenti/pool e qualifica concorrente restano aperte.

- Registro snapshot per Archivio: soglia annunciata prima della cattura del CSN,
  contesti preallocati con generazione, controlli di lettura senza mutex,
  deadline e scadenze con budget. Interfaccia in buffer per i reader;
  qualifica concorrente, controller ed EBR restano da integrare.

- Registro CSN per Archivio con orizzonte monotono e budget finito;
  l’implementazione attiva è `arcdocdb.csn`, con token slot/high/low.
- Ricostruzione in memoria del manifest dal prefisso sigillato di `control.log`:
  ACTIVE, CLOSED con esiti, rimozioni esplicite e limite degli ID. Workspace
  indipendenti per Serie; nessuna riconciliazione o scrittura dei file.

- Validazione UTF-8 pura su span immutabili, con budget massimo di 16 MiB,
  conteggio dei valori scalari ed errori tipizzati con offset. Utilizzabile
  in parallelo dai worker prima del writer; il parser CBOR resta da integrare.
  Diciassette test, nove mutanti rilevati e zero heap nei 25 campioni locali;
  prove concorrenti ed evidenze grezze conservate.

- Code MPSC locali preallocate e gettone del writer con quota cumulativa:
  contesa e saturazione distinte, FIFO e rifiuto dei gettoni vecchi.
  Diciassette test, inclusi producer/consumer su thread reali e calcolo
  sovrapposto tra Serie; otto mutanti rilevati e zero heap nelle misure locali.

- Verifica in memoria dei segmenti compattati CLOSED v1/v2: identità, CRC,
  soli PUT/TOMBSTONE ordinari, limite valido autorevole e budget byte/record.
  Conteggi fisici restituiti dopo il controllo integrale; 15 test indipendenti,
  otto mutanti rilevati e misure locali delle allocazioni conservate.

- Tabella delle decisioni multiserie inclusa nella compilazione e nei test ordinari:
  ricostruzione dal prefisso sigillato, duplicati idempotenti o discordanti,
  budget finiti, query scalari e copie possedute dei partecipanti. Non applica
  i prepared e non realizza il recovery completo del database.

- SPK-08 bitmap: kernel scalari byte/u64 equivalenti, oracoli indipendenti,
  90 campioni locali e disassemblati conservati. Packing escluso e nessuna
  promozione a ottimizzazione del motore.

- SPK-07: due reader/due slot in SC, 28 mutanti rilevati; crash sui byte
  v1/v2, 49.120 casi e 303.432 interruzioni/ripartenze equivalenti. Frontiera
  esterna e limiti del modello dichiarati; tutti i tentativi conservati.

- SPK-08: maschere scalar/SWAR esatte e kernel NEON/SSE2 a safety 3;
  70 campioni seriali su Apple M4, zero byte consed osservati nei cicli.
  SSE2 e indice concorrente restano da verificare; report leggibili senza
  caricare i package sperimentali, originali integralmente conservati.

- Scansione recovery in memoria dei log v1/v2: prefisso verificato, coda e
  corruzione testimoniata da SEAL successivo, EOF esplicito e budget distinti
  dagli errori dei dati; 19 test, inclusi 20.256 casi di alterazione dei bit.

- SPK-06: modello finito del controllore di carico, quote e timer; 24 confronti
  locali tra letture e copie concorrenti, con verifica integrale, intervalli
  di sovrapposizione e campioni grezzi conservati. Compaction del motore e
  feedback reale restano da verificare.

- SPK-05: letture pread e mmap di file immutabili, CRC/chiave/stamp verificati,
  errori I/O e worker espliciti; 36 confronti locali per variante e profilo
  senza allocazioni osservate nel ciclo finale. Varianti e fallimenti conservati.

- SPK-04: writer sperimentale su pool, code limitate, modelli di parcheggio
  e ripartenza delle letture; controlli e 54 benchmark diagnostici conservati,
  con limiti e tentativi falliti espliciti.

- SPK-10: quattro moduli sperimentali Common Lisp per codec v1/v2, indice a
  cinque parole, CBOR iterativo e modello di migrazione; integrazione in memoria
  dei limiti massimi. Nessun codice di produzione, gate v2 ancora aperto.
- Registro strutturato di prove e benchmark, inclusi fallimenti e diagnostiche;
  blob dei sorgenti prima/dopo, risultati decodificati e output originali.
  `make check` registra l'intera verifica; la CI conserva gli artefatti.
- Campagne locali conservate: indice v1 fino a 10 milioni di documenti,
  profiling di allocazione e controlli/benchmark v2 separati.

- ADR-0050: root dell'indice ricontrollata anche su miss, costi e budget della
  directory separati dagli slot; nessuna promessa di pausa indipendente dalla Serie.
- ADR-0048: documenti da 16 MiB effettivi, profondità 100, chiavi fino a 65.535 byte e layout v2; tre requisiti progettati, gate di verifica e migrazione. ADR-0049 propone il percorso oltre RAM senza dichiararlo disponibile.

- Suite eseguibile della Fase 0 per SPK-01, SPK-02, SPK-03, SPK-07 e SPK-09; harness
  `tools/run-spikes.lisp`, compilazione senza avvisi, processi isolati, comandi e output
  grezzo; `make spikes-check` in CI e `make spikes-bench` per misure locali in serie.
- ADR-0046 e INV-M6: SPK-07 trova un controesempio nell'anello dell'orizzonte; il registro
  preallocato dei veri CSN pendenti lo sostituisce. I requisiti del motore restano progettati.
- ADR-0047: lettura dei prepared con prova autorevole del CSN (OUTCOME o manifest), oltre a
  CRC, chiave e flag. Una location verso un'altra versione della stessa chiave è rifiutata.

- Specifica originale, documentazione tematica (16 documenti), invarianti (`INV-…`),
  glossario.
- Valutazione architetturale: analisi critica, stime, registro dei rischi, piano degli spike.
- Progetto consolidato: [architettura](docs/architettura.md),
  [formati su disco](docs/formati-su-disco.md), [limiti dimensionali](docs/limiti.md).
- 30 ADR (0001–0030): le 26 questioni aperte sono chiuse; ADR-0028 e ADR-0030 attendono la
  conferma dell'autore.
- Sistema ASDF minimo, smoke test, `tools/check-links.lisp`, CI.
- Licenza BSD-2-Clause.
- **Software critico (ADR-0031…0035):** gerarchia delle priorità con l'affidabilità sopra le
  prestazioni; otto nuovi invarianti (INV-A1…A8); analisi dei guasti con 24 modi di guasto;
  standard di codifica (regole `COD-…`); piano di verifica; registro delle deviazioni.
- **Tracciabilità controllata da strumento:** 90 requisiti in `requisiti.lisp`, matrice generata,
  `make trace`.
- Strumenti in Common Lisp: build senza avvisi (`tools/build.lisp`), linter con auto-verifica
  (`tools/lint.lisp`), controllo della tracciabilità (`tools/check-trace.lisp`).
- SPK-09 (costo dei controlli di affidabilità).

- **Analisi progettuale** ([docs/analisi-progettuale.md](docs/analisi-progettuale.md)) e ADR
  0036–0045: dieci leggi di progetto — la prima: **il parallelismo è un principio fondante**,
  con l'elenco chiuso di ciò che le Serie condividono — tabella dei punti di atomicità, sedici
  rilievi `AP-…`; quattordici nuovi invarianti (INV-F2, F3, V5, M4, M5, S7, C11, I3, P5, P6,
  A9…A12), 107 requisiti, 27 modi di guasto, rischio residuo RES-05.

### Cambiato

- Snapshot collegati all'unico registro `arcdocdb.csn` dell'Archivio; rimosso
  l'allocatore CSN duplicato del ramo. Coordinamento snapshot senza attese,
  revoca della soglia provvisoria su `:csn-busy` e invalidazione terminale
  al guasto. API del registro canonico e sue evidenze conservate.

- Guide del repository consolidate, note degli esperimenti uniformate al metodo
  tecnico e specifica originale rinominata; requisiti ed evidenze conservati (ADR-0051).

- ADR-0028 e ADR-0030 confermati dall'autore il 2026-10-08, incluse le revisioni su minimi
  di prestazione, backup, restore verificato, verificatore offline e scrubbing.

- **Correzioni di progetto dall'analisi (nessun codice toccato, formati mai implementati):**
  - uno snapshot nasce quando l'orizzonte di visibilità lo ha raggiunto: prima poteva vedere
    comparire un lotto in volo (ADR-0038);
  - coda o corruzione di un log si decidono con la frontiera durevole dei SEAL: prima un crash
    ordinario con più lotti in volo portava la Serie in `FAULTED`; il recovery non tronca più
    (ADR-0037);
  - tombstone scartati con il filtro di esistenza: la regola per lineage faceva riapparire
    documenti eliminati dopo un MERGE di segmenti non adiacenti (ADR-0042);
  - l'esito di una multiserie sta nello stesso segmento dei record che risolve: prima un CLEAN
    poteva perderlo (ADR-0041);
  - primary index a frammenti: nessun raddoppio che triplica la memoria e ferma il writer; slot
    a 4 parole; stima corretta a ~75–80 byte per documento (ADR-0043).
- **Semplificazioni:** la versione di un documento è il CSN; una sola cornice di record con due
  CRC (24 byte); quattro tipi di record nei segmenti; control log con il solo record EDIT;
  `multiserie.log` con il solo record DECISION; nessun file `.bloom`, nessun lineage, nessuno
  stato `creating`; cache senza ri-etichettatura; EBR solo per i file (ADR 0038–0044).
- **Modello di esecuzione:** compiti a completamento, attese come parcheggi, ogni chiamata
  bloccante nel pool di I/O (ADR-0045).

- **Linguaggio visivo rifatto** ([assets/README.md](assets/README.md)): identità monocroma con un
  solo colore, l'ambra, riservato a ciò che può cambiare; nuovo marchio; illustrazione dei
  segmenti e diagramma del percorso di scrittura e lettura in vettoriale, chiaro e scuro; README
  riscritto; anteprima per i social. Il controllo dei link verifica anche i percorsi delle
  immagini.

- ADR-0032 sostituisce in parte ADR-0015: il contatore seqlock passa da 8 a 64 bit, con tentativi
  limitati e ripiego sul writer, perché l'argomento a 8 bit si reggeva sui tempi e non era una
  garanzia per costruzione. Costo: +8 byte per entry (56 B).
- ADR-0028 (proposta) distingue obiettivi e minimi vincolanti di prestazione; ADR-0030
  (proposta) porta backup e verificatore offline nella v1.
")
  (:PATH
   #A((142) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/docs/implementazione/worker-serie-revisione.md")
   :BYTES 16742 :SHA256 "7acb5a43e034ac6a5b65cd00fcea631c86fac578c669ee1bf7cd01aaa38874e6"
   :GIT-BLOB "da8bafad8701d7078235f66250e7b7220de7159d" :TEXT
   "# Revisione del collegamento worker–Serie

Due letture C1 del 2026-10-11 secondo la
[lista di controllo](../affidabilita/standard-di-codifica.md#lista-di-controllo-di-revisione-c1).
La prima ha esaminato contratto, sorgenti e fixture durante le correzioni;
la seconda ha riletto i sorgenti finali e confrontato test, copertura nativa,
HTML e misure del congelamento v3. Sono letture di agenti, non una
attestazione di revisione umana. Nessun sorgente è stato modificato durante
la seconda lettura.

La base iniziale era `2a0011f9d2bef104b22f7ad1eb86d7e5d60d5e11`;
v3 incorpora `8101eb856cbe9d7540682babb53afb00fde30f70`.
I quattro SHA-256 del worktree finale e della copia congelata sono uguali
a quelli dell'[inventario delle decisioni](worker-serie-decisioni.md):
`worker-package`, `worker-types`, `worker-boundary`, `worker-run`.
ASDF carica i quattro file dopo `series/retirement`; il namespace
`arcdocdb.execution.series` dipende da execution e Series senza invertire
le dipendenze di caricamento. Sono stati letti anche il test
`tests/series/worker-bridge.lisp`, il C4 `tools/worker-series-bench.lisp`,
il [contratto](worker-serie.md) e il [metodo](worker-serie-metodo.md).

Le quattro osservazioni sul prodotto sono chiuse sul sorgente v3 e hanno
regressioni passate. Il gate generale `make check` è **PENDING** alla
consegna di questa revisione: nessun suo esito è dedotto dai gate locali.
La diagnosi del runner dell'audit coverage è separata più sotto.

## Le due letture sui dodici punti C1

| Punto | Prima lettura: contratto e sorgente | Seconda lettura: sorgente finale ed evidenza |
|---|---|---|
| 1. REQ e ADR coerenti | Intestazioni REQ-CON-001/002/004/005, REQ-AFF-001/004/008; ADR-0005/0033/0045. Il bridge compone due capacità preesistenti, conserva il writer logico e non crea uno scheduler. | Confermata la composizione: writer prima di Serie, nessun pop prima delle due lease, Serie rilasciata prima di end worker. L'unicità logica writer/Serie resta una precondizione del caller dichiarata nella factory e nel contratto. |
| 2. Invarianti e test sensibili alla violazione | Individuati owner, binding immutabile, generazioni positive e monotone, debito batch, ordine delle release, obbligo schedule unico, fault senza rollback. WS-REV-02 richiedeva un controllo della generazione locale positiva. | Le 26 fixture finali controllano FIFO/identità/sentinelle, quantum e token, busy delle due acquisizioni, closing/end busy, debito e ack stale, wrong-thread, limiti delle generazioni, bypass delle lease, quattro scenari del gate di fault e competizione con thread reali. Rifiuti e FI confrontano gli stati; non si limita la verifica al solo segnale. I rami ancora non eseguiti restano nell'audit completo. |
| 3. Tipo, gestione e test degli errori | Allowlist letterali per classe, ragione e passo; `resource-exhausted` atteso distinto da `invalid-argument`. WS-REV-01/03/04 hanno individuato cause sovrascritte o errori di un sottopasso erroneamente recuperabili. | Rilette le allowlist di tutte le cinque API e i due boundary nil/nil di acquire/release. Le tre classi iniettate nei sottopassi restano fatali e propagano la stessa condizione EQ. Un worker già faulted conserva la prima causa; il bridge registra quella corrente. Un fault lower non può rientrare nell'allowlist esterna. Le regressioni specifiche passano; non si attribuisce una prova esaustiva a tutti i guasti arbitrari dei verificatori privati. |
| 4. Cicli, attese e ricorsione limitati | Nei tre corpi nuovi non ci sono cicli, ricorsione, retry, thread, callback o attese. Le liste `member` sono letterali e limitate. Copia batch, pop e ricircolo restano nel worker già bounded. | Confermato sul sorgente finale. Closing richiede una chiamata esplicita a termina; non riacquisisce Serie. I semafori e le deadline di cinque secondi sono nel solo harness concorrente. Il benchmark esegue un numero fissato di iterazioni. Nessuna proprietà di fairness del pool è dedotta. |
| 5. Allocazione calda misurata | Binding, contesto, controller e target sono preallocati; il handler locale è `dynamic-extent`. La lettura statica da sola non chiudeva il punto. | Cinque campioni da 4096 cicli dopo warmup128 rilevano `[0,0,0,0,0]` byte heap, sink `8800256` in ciascuno. Il sensore rileva il controllo positivo da `16777472` byte e rifiuta un sink errato. È evidenza del percorso di successo seriale preallocato su questa build, con i limiti dichiarati sotto. |
| 6. Dati verificati all'uscita | Ftype e slot typed, owner prima delle letture; token, fase, lease catturate e binding controllati. Pre/post significativi includono controlli delegati a execution/Series; payload e debito non vengono duplicati dal bridge. | Lease esposta soltanto ACTIVE/token corrente; pop e ack passano i controlli del bridge e poi quelli del worker. Target/span/alias e batch stale sono rifiutati prima del pop o dell'ack. Il begin espone i tre valori dichiarati; macro valutata una volta e valori multipli verificati. Il caller deve applicare il batch prima di ack: il bridge non certifica effetti esterni. |
| 7. Decisioni composte inventariate | Inventario delle forme `case`/default, token/pre/post, boundary e allowlist; una sola nuova decisione composta nel fault marking: lease positiva, owner EQ corrente, generazione uguale. | Inventario finale: 32 controlli locali più il controllo owner delegato, sette istanze della macro e tutte le allowlist. Quattro fixture rendono falsa ciascuna delle tre condizioni con le altre vere, più tutte vere. Il corto circuito è esplicito; i valori della fixture non attestano automaticamente l'esecuzione di ogni operando. Non si inferisce MC/DC da sb-cover, né copertura totale dai test passati. |
| 8. Proprietari dello stato condiviso | Tre riferimenti immutabili e campi locali al thread del contesto. Owner del controller rilevato soltanto tramite la sua capacità. Coupling privato a execution/Series elencato, senza registri o contatori globali. | Wrong-thread è rifiutato prima del handler e non avvelena gli oggetti. Il fault marker scrive sulla Serie soltanto con le tre condizioni vere; dopo release o lease stale non modifica il controller successivo. Il controllo scalare evita check-ring che potrebbero sostituire la causa. Il coordinamento Archivio dopo l'handoff resta un obbligo del caller. |
| 9. Tracciabilità e `make check` | REQ e invarianti sono associati alle intestazioni del sorgente e ai nomi dei test; gli stati globali dei requisiti restano `progettato`. Nessuna promozione dell'intero modello di esecuzione. | Test mirati, suite Series e C4 hanno raw finali PASS. Il generatore/matrice e il controllo generale sul pacchetto finale di codice, documenti e dati devono ancora essere verificati: **make check PENDING**. Questo punto non è dichiarato chiuso. |
| 10. Regole e deviazioni | Safety3, ftype completi per funzioni, slot typed, docstring pre/post, REQ e OWNER/SHARED. Boundary unico per la classificazione, nessuna syscall introdotta. Correzioni richieste prima della chiusura. | Sorgenti finali entro 60 righe per funzione; massima complessità locale inventariata 9, nessuna nuova deviazione individuata. Il C4 è compilato interamente e caricato da FASL con avvisi fatali; il caricamento ASDF applica solo l'eccezione runtime `sb-kernel:redefinition-warning` già prevista da `tools/build.lisp`. Non si estende quell'eccezione agli avvisi del runner dell'audit coverage. Lacune di copertura conservate, senza esclusioni approvate. |
| 11. Serializzazione e INV-P6 | Nessun lock, attesa o scrittura globale tra Serie per operazione. Sono seriali il singolo contesto worker, il suo writer e il controller posseduto nel tratto; scheduling/ready restano nelle API esistenti. | Due controller sono mantenuti ACTIVE contemporaneamente da thread reali prima delle release. Due writer contendenti su un controller hanno una sola lease ACTIVE, l'altro chiude senza pop. La correttezza di queste fixture non è una misura di throughput o scalabilità. Il benchmark ha un solo worker, una sola Serie e capacità1. |
| 12. Atomicità durevole e scarto | Il bridge cambia proprietà e diagnosi in memoria; non scrive record durevoli, non modifica WAL, ritiro o regole di riuso. Nessun nuovo punto di atomicità durevole. | Nessun rollback o cleanup automatico dopo un fault. Riferimenti e token restano per la diagnosi; un prefisso di batch non è ripetuto. La fixture di drenaggio FINE I/O su controller FAULTED applica e annulla l'evento prima di ack/end. Durabilità reale, recovery e coordinamento Archivio non sono qualificati da questo modulo. |

## Osservazioni sul prodotto chiuse

| ID / priorità | Difetto individuato | Correzione riletta e regressione finale |
|---|---|---|
| WS-REV-01 / P1 | La classificazione bridge poteva sostituire la prima causa terminale di un worker già faulted con l'invariante del successivo uso raw. | `%fault-worker-serie` non riclassifica un worker già FAULTED. `preserves-earlier-worker-fault-on-raw-begin` verifica EQ della prima causa worker e della diagnosi corrente bridge; PASS nei 26 test. |
| WS-REV-02 / P2 | Generazione locale zero in ACTIVE/CLOSING non era un'invariante verificata: il token veniva soltanto rifiutato come argomento, lasciando le capacità senza diagnosi terminale. | `%check-writer-worker-serie` verifica `plusp generation` prima delle capacità. `zero-active-generation-faults-only-owned-controller` copre ACTIVE e CLOSING, compresa Serie già ceduta; PASS. |
| WS-REV-03 / P1 | Un errore inatteso di acquire Serie con una ragione ammessa dal begin writer poteva essere considerato ordinario dal boundary esterno. | Boundary nil/nil dentro `%acquire-worker-serie`; soltanto il handler-case interno converte le due ragioni Serie previste. `acquire-boundary-unknown-reasons-never-remain-recoverable` inietta resource/invalid/io-fault, conserva la condizione EQ, writer lease e token, senza acquisire Serie o estrarre payload; PASS. |
| WS-REV-04 / P1 | Lo stesso mascheramento era possibile nella release Serie; inoltre un fault lower con ragione `:worker-serie-token` poteva coincidere con il rifiuto benigno del pop bridge. | Boundary nil/nil nella release; allowlist applicate soltanto se il worker non è già FAULTED. `release-boundary-unknown-reasons-retain-both-leases` copre tre classi e conserva entrambe le lease; `lower-worker-fault-cannot-match-benign-outer-token-reason` conserva lo stato terminale e la causa EQ; entrambe PASS. |

I nomi abbreviati della tabella hanno il prefisso
`test-REQ-AFF-008-worker-serie-` nel file di test finale.
WS-REV-01/02 derivano dalla prima revisione; WS-REV-03 dalla lettura
dell'autore; WS-REV-04 dalla rilettura del sottopasso release e del fault
lower. La seconda lettura ha verificato tutte e quattro le correzioni
nel codice congelato. Nessuna osservazione sul prodotto resta aperta.

## Gate locali e rapporti grezzi

Gli identificatori sono quelli di `tools/record-command.lisp`, non nomi
attribuiti a posteriori. Ogni esito sotto è stato letto nel proprio raw,
con `:STATUS :OK`, `:SOURCE-CONSISTENCY :STABLE` ed exit0. Le copie
pubblicate sono nel
[catalogo](../../spikes/results/2026-10-11-worker-series/catalogo.lisp);
i tentativi preliminari restano separati dai risultati v3.

| Gate | Record v3 / raw pubblicato | Esito e ambito |
|---|---|---|
| Test mirati | `4000708313-command-79577-0`; [target-final.lisp](../../spikes/results/2026-10-11-worker-series/target-final.lisp) | 26 test bridge PASS. Il driver verifica anche che il numero selezionato sia esattamente26. |
| Suite e sb-cover Series | `4000708333-command-80909-0`; [coverage-process.lisp](../../spikes/results/2026-10-11-worker-series/coverage-process.lisp) e [bundle](../../spikes/results/2026-10-11-worker-series/coverage-bundle.lisp) | 70 test PASS, comprendenti 44 del controller e 26 nuovi; raw nativo e dodici pagine HTML conservati. |
| Audit nativo contro HTML | `4000708506-command-97108-0`; [coverage-audit.lisp](../../spikes/results/2026-10-11-worker-series/coverage-audit.lisp) e [processo](../../spikes/results/2026-10-11-worker-series/coverage-audit-process.lisp) | Conteggi e inventario di tutti i missing PASS, self-test reader PASS. Due avvisi del runner sono conservati e descritti sotto: questo record non attesta un intero comando privo di avvisi. |
| C4 strictcompile e self-test FASL | `4000708361-command-83427-0`; [c4-final.lisp](../../spikes/results/2026-10-11-worker-series/c4-final.lisp) | COMPILE-FILE completo con warning/style-warning fatali; FASL self-test PASS, inclusi sensori, ciclo composto, CLI invalida, destinazione esistente e raw parziale. |
| Heap locale | `4000708391-command-85710-0`; [benchmark-data.lisp](../../spikes/results/2026-10-11-worker-series/benchmark-data.lisp) e [processo](../../spikes/results/2026-10-11-worker-series/benchmark-process.lisp) | Cinque campioni completi, heap0 e sink atteso in ciascuno; controllo positivo e diagnosi sink errato funzionanti. |
| Controllo generale | Da completare sul pacchetto finale | **PENDING**; esito non attestato da questa consegna. |

La compilazione completa del reader dell'audit coverage termina e i suoi
self-test e confronti hanno esito PASS. Tuttavia lo stderr del suo runner
`-eval` contiene due `STYLE-WARNING` per riferimenti anticipati a
`coverage-reader-main` e `coverage-reader-self-test`, prima del loro
caricamento. Exit0 non li elimina. Questa nota riguarda il comando
ausiliario dell'audit, non la COMPILE-FILE del prodotto o del benchmark.
Per chiudere un gate del runner senza avvisi occorre conservarne una nuova
esecuzione pulita; il record precedente e la sua diagnosi devono restare.

## Copertura conservata senza esclusioni

I valori seguenti sono stati letti dall'indice HTML e coincidono con
l'audit del formato nativo. Il denominatore include tutti i dodici file
del modulo Series, anche package e quattro file late. Non si attribuisce
allo scope Series la copertura delle implementazioni execution delegate.

| File | Espressioni hit/totale | Rami hit/totale |
|---|---:|---:|
| events.lisp | 288/335 | 38/46 |
| io-events.lisp | 185/220 | 23/32 |
| ownership.lisp | 223/279 | 42/52 |
| package.lisp | 0/1 | 0/0 |
| publication.lisp | 156/203 | 16/22 |
| query.lisp | 65/79 | 5/6 |
| retirement.lisp | 166/182 | 14/18 |
| types.lisp | 75/84 | 4/10 |
| worker-boundary.lisp | 74/86 | 18/20 |
| worker-package.lisp | 0/1 | 0/0 |
| worker-run.lisp | 145/161 | 12/14 |
| worker-types.lisp | 124/168 | 19/30 |
| Tutto Series | **1501/1799** | **191/250** |
| Quattro file nuovi | **343/416** | **49/64** |

Restano **298 espressioni e59 rami** non eseguiti in tutto Series;
nei quattro file nuovi restano **73 espressioni e15 rami**.
L'audit conserva per ciascuno file, kind e path nativo: non sono esclusi
né aggregati in una sola nota generica. Nei nuovi file i rami mancanti
sono2 in boundary,2 in run e11 in types, incluse forme generate e
controlli interni. La lettura del sorgente non li promuove a impossibili
e non sostituisce una loro esecuzione. L'inventario statico e i casi
manuali della decisione a tre condizioni completano la descrizione,
senza dichiarare MC/DC o copertura completa.

## Limiti della misura e del protocollo

La misura usa SBCL2.6.9 ARM64/Darwin, safety3, un worker, una Serie,
capacità writer/ready/Serie1 e payload5. Ogni ciclo osserva enqueue,
adozione, begin, lease, pop, identità del payload, ack ed end idle;
la formula indipendente è `N*101+N*(N-1)/2`.
GC, predisposizione della fixture e stampa sono fuori dalla finestra.
Il timer a zero ha diagnosi distinta `:BELOW-RESOLUTION` e secondi NIL;
il sink errato resta un rifiuto anche con clockzero. Il carico esterno
è `:UNCONTROLLED`.

Heap0 è un dato locale del contatore, non una prova universale di
assenza di allocazioni. Le finestre non misurano busy, closing, fault,
contenzione, quantum maggiore di1, pool parallelo, dispositivo reale,
durabilità o recovery. I test concorrenti verificano il protocollo in
fixture finite; non misurano scalabilità, throughput, P99 o fairness.
Nessuna soglia temporale è usata per qualificare il prodotto.

Il caller deve mantenere mapping logico unico, non rientranza e uso
esclusivo delle capacità del tratto. Deve elaborare il batch prima di
ack, chiudere CLOSING prima del ricircolo, distinguere generation Serie
esaurita da busy e non riprogrammarla indefinitamente. Dopo un fault
fuori dalla lease Serie corrente deve fermare/coordinare l'Archivio:
il bridge non può scrivere sul controller del nuovo owner. Il boundary
registra errori; non promette quiescenza, rollback o cleanup per uscite
non locali arbitrarie. Applicazione dei payload, routing, admission,
pool e coordinatore restano fuori dall'ambito qualificato.
")
  (:PATH
   #A((142) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/docs/implementazione/worker-serie-risultati.md")
   :BYTES 6960 :SHA256 "5f9f308734844850322f5ca756185301e1bc4db23da73bc2f2452e2490c8d00b" :GIT-BLOB
   "074c99a7e5c295a47bde909ac7039b7eb5bec298" :TEXT
   "# Risultati locali del collegamento worker/Serie

Campagna del 2026-10-11, Apple M4 ARM64, SBCL 2.6.9, safety 3.
Il [contratto](worker-serie.md), il [metodo preregistrato](worker-serie-metodo.md),
l'[inventario completo](worker-serie-decisioni.md) e le
[due letture C1](worker-serie-revisione.md) delimitano gli esiti.
Gli originali leggibili e le prove di conservazione sono nel
[catalogo](../../spikes/results/2026-10-11-worker-series/catalogo.lisp).

La base iniziale è `2a0011f9d2bef104b22f7ad1eb86d7e5d60d5e11`.
Il congelamento v3 qualificato incorpora l'hash fino a
`8101eb856cbe9d7540682babb53afb00fde30f70`: tutti i quattro SHA-256 del
bridge coincidono con l'inventario. Il controllo generale incorpora anche
GET fino a `96c0f4f4d6d1f1882723da1b631e78f89e613059`, senza cambiamenti
alle dipendenze execution/Serie o ai quattro sorgenti. Il modulo GET non
chiama il bridge e conserva la propria qualifica aperta.

## Correttezza e strumenti

Le 26 prove nuove passano con compilazione rigorosa nel
[record finale](../../spikes/results/2026-10-11-worker-series/target-final.lisp)
`4000708313-command-79577-0`, `:OK`, `:STABLE`, exit 0. Coprono il tratto
completo, FIFO/identità/span, debito batch, token e capacità, busy prima e
dopo la seconda lease, ordine del rilascio e retry di end, errori originali,
owner estraneo, bypass stale, generazione nulla e quattro finding chiusi.
Thread reali verificano una Serie contesa e due Serie attive contemporaneamente;
queste prove finite non dimostrano fairness o scalabilità.

Il C4 `tools/worker-series-bench.lisp` è compilato interamente con warning e
style-warning fatali; self-test sul FASL e relativi controlli negativi passano
nel [record C4](../../spikes/results/2026-10-11-worker-series/c4-final.lisp)
`4000708361-command-83427-0`. Il caricamento ASDF conserva la sola eccezione
runtime `sb-kernel:redefinition-warning` già documentata da `tools/build.lisp`.
Il SHA-256 del sorgente è
`93db07d3e553b61404926094650a2c0d69d1593017a82c62270cc11ddfb6438c`;
quello del FASL è
`d22c6afc647678d3f807130f66c3664eb78fcecd0694254062aad009731dd019`.

Il controllo generale `make check` è ancora in corso; questo documento
verrà aggiornato soltanto dopo aver letto il suo record originale.

## Copertura senza esclusioni

La campagna nativa esegue tutte le 70 prove Series (44 esistenti e 26 nuove),
con [record](../../spikes/results/2026-10-11-worker-series/coverage-process.lisp)
`4000708333-command-80909-0`, `:OK`, `:STABLE`, exit 0. Conserva tutte le
12 righe sb-cover, anche package e tipi; nessuna esclusione approvata.

| File Series | Espressioni colpite / totali | Rami colpiti / totali |
|---|---:|---:|
| events | 288 / 335 | 38 / 46 |
| io-events | 185 / 220 | 23 / 32 |
| ownership | 223 / 279 | 42 / 52 |
| package | 0 / 1 | 0 / 0 |
| publication | 156 / 203 | 16 / 22 |
| query | 65 / 79 | 5 / 6 |
| retirement | 166 / 182 | 14 / 18 |
| types | 75 / 84 | 4 / 10 |
| worker-boundary | 74 / 86 | 18 / 20 |
| worker-package | 0 / 1 | 0 / 0 |
| worker-run | 145 / 161 | 12 / 14 |
| worker-types | 124 / 168 | 19 / 30 |
| **Totale** | **1501 / 1799** | **191 / 250** |
| **Quattro file nuovi** | **343 / 416** | **49 / 64** |

Restano 298 espressioni e 59 rami non colpiti nello scope completo, di cui
73 e 15 nei file nuovi. I percorsi mancanti sono enumerati nell'
[audit](../../spikes/results/2026-10-11-worker-series/coverage-audit-final.lisp);
lo [stato nativo e tutti gli HTML](../../spikes/results/2026-10-11-worker-series/coverage-bundle.lisp)
sono compressi senza perdita, con checksum dei byte originali e rilettura.
Il reader verifica forme/bit/lunghezze e confronta le 12 righe HTML con i dati
nativi. Compilazione completa, self-test negativi e audit finale passano nel
[record](../../spikes/results/2026-10-11-worker-series/coverage-audit-final-process.lisp)
`4000708823-command-7776-0`, con stderr vuoto. Le tre coppie indipendenti
della decisione composta B01 sono descritte nell'inventario; i contatori
sb-cover non attestano MC/DC, revisione umana o copertura completa.

## Allocazione osservata sul percorso seriale

Il [processo benchmark](../../spikes/results/2026-10-11-worker-series/benchmark-process.lisp)
`4000708391-command-85710-0` e i
[dati grezzi](../../spikes/results/2026-10-11-worker-series/benchmark-data.lisp)
sono `:OK`, `:STABLE`, exit 0. Cinque repliche da 4096 cicli completi,
ciascuna dopo 128 cicli di warmup, usano lo stesso contesto preallocato e
generazioni monotone reali. Il sink indipendente atteso e ottenuto in ogni
campione è 8800256.

| Replica | Byte consed osservati | Tick grezzi (unità/s: 1000000) |
|---|---:|---:|
| 1 | 0 | 5603 |
| 2 | 0 | 5558 |
| 3 | 0 | 5536 |
| 4 | 0 | 5487 |
| 5 | 0 | 5489 |

Il controllo positivo alloca deliberatamente 16 buffer da 1 MiB e rileva
16777472 byte; sink 16777336. Il sink errato 3 invece di 1 viene rifiutato;
clock nullo viene classificato sotto risoluzione; baseline heap 0.
GC, creazione delle fixture, mock I/O e stampa restano fuori misura.
Il SHA-256 del report originale da 49744 byte è
`418eed082f688416298fe28f593ed7282da79e23aaf4dc445b33831072a3eead`.
Questi dati osservano il solo successo seriale locale; non provano heap zero
universale, throughput, P99, fairness, uso I/O reale o prestazioni del pool.

## Tentativi e conservazione

Nessun tentativo viene sostituito dal risultato finale. Nel catalogo:

- `tool-probe-01` conserva il fallimento iniziale di lettura SB-MD5 nel C4;
  `tool-probe-02/03/04` le compilazioni preliminari successive.
- `target-01` conserva il fallimento per WRITER inutilizzato nella fixture;
  `target-02` il successo delle 23 prove preliminari prima di WS-REV-03/04
  e delle nuove regressioni. I due bundle preliminari ne conservano i sorgenti.
- `selftest-01` conserva il fallimento ASDF runtime prima del ripristino della
  politica di caricamento esistente; `c4-argv-probe` un handler CLI malformato
  rifiutato prima di qualsiasi compilazione del file.
- `coverage-audit-process` conserva il primo audit: il reader compila senza
  avvisi e l'audit passa, ma il runner emette due style-warning per chiamate
  anticipate in `-eval`. Il nuovo runner evita quelle chiamate statiche e
  qualifica separatamente compile/FASL/self-test/audit.
- `orchestration-final` conserva anche il wrapper di pubblicazione originale
  e il suo output: un style-warning per il compattatore caricato a runtime,
  seguito da validazione dei byte riuscita. Non è il gate C4 dello strumento.
  Copia e compattazione riusano gli helper di conservazione esistenti;
  descrittore, payload, byte espansi e catalogo vengono riletti e verificati.
- `source-final` conserva i sorgenti del congelamento v3;
  `orchestration` e `orchestration-final` conservano i driver e il reader.

Routing, coordinatore Archivio, pool, admission, wake/park e applicazione dei
payload restano da integrare. Nessun gate del motore completo o della Fase 0
viene chiuso da questa campagna locale.
")))
