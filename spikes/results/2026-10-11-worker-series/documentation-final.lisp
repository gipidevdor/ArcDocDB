(:SCHEMA-VERSION 1 :KIND :WORKER-SERIES-DOCUMENTATION-BUNDLE :VERSION "after-full-check" :SOURCES
 ((:PATH
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/worker-serie-decisioni.md")
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
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/worker-serie-metodo.md")
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
   #A((97) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/worker-serie.md")
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
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/README.md")
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
   #A((73) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/CHANGELOG.md")
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
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/worker-serie-revisione.md")
   :BYTES 18000 :SHA256 "90570284af489351e54c113f36065c8458ff2d3675dc605a8665d43fb0bc87b3"
   :GIT-BLOB "c011da277ed9f8217597db18bd6f1767b35bf5ca" :TEXT
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
La consegna integra poi `96c0f4f4d6d1f1882723da1b631e78f89e613059`,
che aggiunge il nucleo GET senza cambiare execution/Series: la
qualificazione dedicata bridge resta quella v3 su `8101eb8`, mentre
`make check` è previsto sul pacchetto integrato su `96c0f4f`.
I quattro SHA-256 del worktree finale e della copia congelata sono uguali
a quelli dell'[inventario delle decisioni](worker-serie-decisioni.md):
`worker-package`, `worker-types`, `worker-boundary`, `worker-run`.
ASDF carica i quattro file dopo `series/retirement`; il namespace
`arcdocdb.execution.series` dipende da execution e Series senza invertire
le dipendenze di caricamento. Sono stati letti anche il test
`tests/series/worker-bridge.lisp`, il C4 `tools/worker-series-bench.lisp`,
il [contratto](worker-serie.md) e il [metodo](worker-serie-metodo.md).

Le quattro osservazioni sul prodotto sono chiuse sul sorgente v3 e hanno
regressioni passate. Dopo la consegna delle due letture, il root ha letto il
gate generale `make check`: `4000709286-command-15279-0`, **PASS**,
`:OK`, `:STABLE`, exit 0 sul congelamento integrato `96c0f4f`.
La diagnosi preliminare del runner dell'audit coverage è conservata;
il nuovo runner senza avvisi chiude il relativo gate, come descritto sotto.

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
| 9. Tracciabilità e `make check` | REQ e invarianti sono associati alle intestazioni del sorgente e ai nomi dei test; gli stati globali dei requisiti restano `progettato`. Nessuna promozione dell'intero modello di esecuzione. | Test mirati, suite Series e C4 hanno raw finali PASS. Il root ha completato `make check` sul congelamento integrato: 732 test nominati e due smoke, tracciabilità, link, conservazione/evidenze e dieci spike PASS; record `4000709286-command-15279-0`, `:OK/:STABLE`, exit0. L'inserimento documentale di questo esito e i nuovi cataloghi richiedono il successivo gate documenti/evidenze. |
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
| Test mirati | `4000708313-command-79577-0`; [target-final.lisp](../../spikes/results/2026-10-11-worker-series/target-final.lisp) | 26 test bridge PASS. Il driver verifica anche che il numero selezionato sia esattamente 26. |
| Suite e sb-cover Series | `4000708333-command-80909-0`; [coverage-process.lisp](../../spikes/results/2026-10-11-worker-series/coverage-process.lisp) e [bundle](../../spikes/results/2026-10-11-worker-series/coverage-bundle.lisp) | 70 test PASS, comprendenti 44 del controller e 26 nuovi; raw nativo e dodici pagine HTML conservati. |
| Audit nativo contro HTML | `4000708823-command-7776-0`; [coverage-audit-final.lisp](../../spikes/results/2026-10-11-worker-series/coverage-audit-final.lisp) e [processo finale](../../spikes/results/2026-10-11-worker-series/coverage-audit-final-process.lisp) | COMPILE-FILE, caricamento FASL, self-test reader e inventario di tutti i missing PASS con warning fatali; stderr vuoto. Conteggi uguali al precedente audit, conservato come probe. |
| C4 strictcompile e self-test FASL | `4000708361-command-83427-0`; [c4-final.lisp](../../spikes/results/2026-10-11-worker-series/c4-final.lisp) | COMPILE-FILE completo con warning/style-warning fatali; FASL self-test PASS, inclusi sensori, ciclo composto, CLI invalida, destinazione esistente e raw parziale. |
| Heap locale | `4000708391-command-85710-0`; [benchmark-data.lisp](../../spikes/results/2026-10-11-worker-series/benchmark-data.lisp) e [processo](../../spikes/results/2026-10-11-worker-series/benchmark-process.lisp) | Cinque campioni completi, heap0 e sink atteso in ciascuno; controllo positivo e diagnosi sink errato funzionanti. |
| Controllo generale integrato | `4000709286-command-15279-0`; [full-check.lisp](../../spikes/results/2026-10-11-worker-series/full-check.lisp) e [master spike](../../spikes/results/2026-10-11-worker-series-spikes-check/report.lisp) | **PASS**, `:OK/:STABLE`, exit0; 732 test nominati e due smoke, tutti i gate ordinari e dieci spike con esiti verificati nei singoli raw. Aggiornamento del root dopo le due letture, senza mutare codice/test/C4. |

Il probe dell'audit `4000708506-command-97108-0` conserva due
`STYLE-WARNING` del runner `-eval` per riferimenti anticipati a
`coverage-reader-main` e `coverage-reader-self-test`. Exit0 non li elimina
e quel comando non viene promosso a gate privo di avvisi. Il successivo
`4000708823-command-7776-0` usa eval distinti e `funcall/fdefinition` dopo
il caricamento: handler warning fatale su compile, FASL, self-test e main;
raw letto con stdout PASS, stderr vuoto, stato OK/STABLE ed exit0.
La sorgente reader02 è conservata in
[orchestration-final.lisp](../../spikes/results/2026-10-11-worker-series/orchestration-final.lisp).
Il wrapper del publisher conserva separatamente un avviso anticipato per
`compact-finished-directory`: riusa un helper preesistente di copia e
compattazione, non è il C4 nuovo di benchmark o il reader qualificato.
I suoi esiti di conservazione non sono presentati come compilazione C4
priva di avvisi.

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

Restano **298 espressioni e 59 rami** non eseguiti in tutto Series;
nei quattro file nuovi restano **73 espressioni e 15 rami**.
L'audit conserva per ciascuno file, kind e path nativo: non sono esclusi
né aggregati in una sola nota generica. Nei nuovi file i rami mancanti
sono 2 in boundary, 2 in run e 11 in types, incluse forme generate e
controlli interni. La lettura del sorgente non li promuove a impossibili
e non sostituisce una loro esecuzione. L'inventario statico e i casi
manuali della decisione a tre condizioni completano la descrizione,
senza dichiarare MC/DC o copertura completa.

## Limiti della misura e del protocollo

La misura usa SBCL 2.6.9 ARM64/Darwin, safety3, un worker, una Serie,
capacità writer/ready/Serie1 e payload5. Ogni ciclo osserva enqueue,
adozione, begin, lease, pop, identità del payload, ack ed end idle;
la formula indipendente è `N*101+N*(N-1)/2`.
GC, predisposizione della fixture e stampa sono fuori dalla finestra.
Il timer a zero ha diagnosi distinta `:BELOW-RESOLUTION` e secondi NIL;
il sink errato resta un rifiuto anche con clockzero. Il carico esterno
è `:UNCONTROLLED`.

Heap0 è un dato locale del contatore, non una prova universale di
assenza di allocazioni. Le finestre non misurano busy, closing, fault,
contenzione, quantum maggiore di 1, pool parallelo, dispositivo reale,
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
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/worker-serie-risultati.md")
   :BYTES 8200 :SHA256 "afc544fd23fd2bfe6db96866c981948283271b515ac9b445843e720aebfcf0f3" :GIT-BLOB
   "3852181830af4b721955d592d782953200d79eaa" :TEXT
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

Il controllo generale `make check` passa nel
[record originale](../../spikes/results/2026-10-11-worker-series/full-check.lisp)
`4000709286-command-15279-0`: `:OK`, `:STABLE`, exit 0, con 632 sorgenti e
documenti invariati nel congelamento finale. Passano 732 test nominati e due
smoke, linter/self-test, runner snapshot/self-test, tracciabilità, link,
conservazione ed evidenze e tutti i dieci esperimenti Fase 0. Il
[master degli esperimenti](../../spikes/results/2026-10-11-worker-series-spikes-check/report.lisp)
`4000709427-check-16929-0` è `:COMPLETE`; ciascun run ha sorgenti `:STABLE`
ed exit 0 (SPK-07 `:PASS`, gli altri `:OK`). I loro stderr sono vuoti;
lo stderr del comando generale conserva note del compilatore e annunci
del runner, senza warning o style-warning. Non sono state ripetute campagne.
Le due fixture intenzionalmente fallite del self-test snapshot e il loro
report `:PASSED` sono conservati nel
[bundle](../../spikes/results/2026-10-11-worker-series/snapshot-selftest-bundle.lisp).
I documenti aggiornati dopo questo esito e i nuovi cataloghi vengono
controllati separatamente prima della pubblicazione.

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
sono `:OK` e `:STABLE`; il processo termina con exit 0.
Cinque repliche da 4096 cicli completi,
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
- `source-make-check` conserva i sorgenti e i documenti del congelamento
  integrato finale. Il catalogo degli spike conserva separatamente master,
  dieci record originali e finalizzazione, inclusi payload gzip originali.

Routing, coordinatore Archivio, pool, admission, wake/park e applicazione dei
payload restano da integrare. Nessun gate del motore completo o della Fase 0
viene chiuso da questa campagna locale.
")
  (:PATH
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-series/README.md")
   :BYTES 1644 :SHA256 "78ac8aa5a162c534a9fa2f4148a21e8d31161ec5d23382314a0716e5eda6b699" :GIT-BLOB
   "213a3984b2354a84c6ceda11ba2219dc40e5d4c6" :TEXT "# Evidenze del collegamento worker/Serie

Campagna locale del 2026-10-11. [Risultati e limiti](../../../docs/implementazione/worker-serie-risultati.md),
[metodo preregistrato](../../../docs/implementazione/worker-serie-metodo.md),
[contratto](../../../docs/implementazione/worker-serie.md),
[inventario](../../../docs/implementazione/worker-serie-decisioni.md),
[due letture](../../../docs/implementazione/worker-serie-revisione.md).

Il [catalogo flat](catalogo.lisp) identifica ogni record, descrittore e payload
con byte, SHA-256 e Git blob. I report dei processi conservano argv, ambiente,
output originali, source-blobs prima/dopo e stato; i record `*-conservazione`
conservano la finalizzazione. Tentativi falliti e preliminari restano distinti.

`source-final.lisp` identifica la versione v3 qualificata su `8101eb8`;
`source-preliminary-01/02.lisp` conservano le versioni precedenti su `2a0011f`.
`coverage-bundle.lisp` è il descrittore della conservazione gzip senza perdita
del dato nativo e di tutti gli HTML; `coverage-audit-final.lisp` enumera anche
ogni percorso non colpito. Nessuna esclusione o attestazione MC/DC.
Il risultato heap riguarda cinque campioni seriali locali, con controlli
positivi e negativi; non qualifica il motore completo.

`source-make-check.lisp` conserva il congelamento integrato su `96c0f4f`;
`full-check.lisp` registra il PASS generale. I dieci record e il master
Fase 0 sono nel [catalogo separato](../2026-10-11-worker-series-spikes-check/catalogo.lisp),
con payload gzip originali. `snapshot-selftest-bundle.lisp` conserva i due
runner di errore intenzionale, gli output e il report del self-test.
")
  (:PATH
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-series-spikes-check/README.md")
   :BYTES 801 :SHA256 "7f74da227c9f9722abc6911888cc8c130224922d4b0eadf02b6f151cc3f8471d" :GIT-BLOB
   "03bc672d0ab4d07d227a3ff5637548c2ddcdb0bf" :TEXT
   "# Controllo generale Fase 0 del collegamento worker/Serie

Parte della singola `make check` finale, base integrata `96c0f4f`.
[Risultati e limiti](../../../docs/implementazione/worker-serie-risultati.md),
[record del controllo completo](../2026-10-11-worker-series/full-check.lisp).

Il [master originale](report.lisp), ID `4000709427-check-16929-0`, è
`:COMPLETE`; tutti i dieci record SPK hanno sorgenti stabili ed exit 0.
SPK-07 è `:PASS`, gli altri sono `:OK`; stderr dei singoli processi vuoti.
Il [catalogo](catalogo.lisp) identifica i byte originali di master,
singoli record e [finalizzazione](conservazione.lisp), inclusi i payload gzip
del master e di SPK-07. Compressione senza perdita, senza ricodifica dei raw.
È una verifica di correttezza; non comprende nuovi benchmark degli spike.
")))
