# Prima verifica funzionale GET

La campagna verifica la composizione del [percorso GET](get-record.md) con
indice primario, cache, file readonly, snapshot ed epoche. Il
[metodo](../../spikes/results/2026-10-11-get-verification/metodo.lisp) è registrato
prima delle esecuzioni sulla base `65972a4`. Il prodotto rimane distinto dalle
fixture: dati e tempi sono scelti dalla suite, gli esiti sono confrontati con
byte e valori espliciti.

## Metodo e confini

Il [supporto](../../tests/get/support.lisp) costruisce registri, indice con seme,
vista e contesto reali, e file readonly con header, PUT e OUTCOME scritti dalle
API pubbliche. Il valore atteso è una sequenza nota, indipendente dal valore
restituito da GET. I contatori del backend I/O distinguono la costruzione della
capacità dalle letture del compito. Ogni caso possiede risorse separate e
installa il cleanup prima dell'avvio.

| Gruppo | Decisioni | Osservazioni |
|---|---|---|
| Configurazione e lifecycle | GET-D01..D03 | Budget, copie dell'identità, Archivio canonico, rientro, miss corrente e storico, CSN rispetto allo snapshot |
| Target, record e cache | GET-D04..D08 | Identità e frontiera autorevoli, buffer, assenza di I/O nel calcolo, OUTCOME, corruzioni e fallback |
| Risposta e conclusione | GET-D09 | Byte copiati nella risposta privata, range e alias, scadenza e rilascio delle protezioni |

I rifiuti prima della presa in carico devono preservare il compito già attivo
di un chiamante annidato. Gli errori operativi devono rilasciare le protezioni.
La risposta copiata diventa consegnabile soltanto se `concludi-get` ritorna
normalmente: una scadenza successiva alla copia deve ancora impedirne la
consegna. Un prepared richiede la prova dal file anche su hit cache; scratch
insufficiente precede la richiesta della prova e non esegue I/O.

Le modifiche dello stato privato sono limitate alle fixture dichiarate di
fault injection, per provocare incoerenze o danneggiare la copia cache.
L’osservatore I/O usa il backend pubblico e delega agli adattatori nativi
invariati per contare le letture. Nessuno di questi accessi fornisce gli
oracoli di CSN, valore o frontiera.

## Raccolta dei risultati

Le esecuzioni registrate seguono il freeze di sorgenti, documentazione e
indice Git. Compilazione e suite complete, self-test dello strumento di
copertura e scope `get` usano processi separati. La copertura conserva HTML,
stato SB-COVER e FASL privati; misura espressioni e rami, non MC/DC.
Esiti effettivi e CI sono in attesa nella preregistrazione.

## Limiti

Questa è una prima suite funzionale e i test sono testimonianze parziali
delle decisioni, non una qualifica C1 completa. Restano coppie di indipendenza
MC/DC, mutazione degli operatori, stress concorrente, crash e fault injection
del motore. La finestra interna INLINE di ammissione EBR non viene qualificata
tramite interposizione di funzioni.

Non si attesta resolver storico, endpoint server, scheduler, integrazione
delle frontiere committed, memoria debole, zero heap, prestazioni o chiusura
di fase. Le garanzie del controller e la validità del lotto cui appartiene
OUTCOME rimangono precondizioni del modulo.
