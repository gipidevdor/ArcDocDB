# Sessione locale di controllo M16 — 17 ottobre 2026

Variante C4 di [SPK-11](../../SPK-11-unix-socket/README.md), con
[metodo preregistrato](../../SPK-11-unix-socket/session-method.md) nel commit
`5d656ccb`. Il codice è nel commit `862094f5`. ADR-0056 resta una proposta:
questa campagna verifica un profilo di controllo da 4096 byte, senza
ammissione o chiamate al motore.

## Risultati osservati

Otto famiglie di controlli verificano fixture congelate HELLO/WELCOME/PING,
interi fino a u64 massimo, envelope esatto, direzioni e stato. Le mappe sono
ordinate sui byte delle chiavi secondo
[RFC 8949 §4.2.1](https://www.rfc-editor.org/rfc/rfc8949.html#section-4.2.1),
anche annidate: una fixture distingue questo ordine da quello per lunghezza.
Il codec comune verifica sintassi, UTF-8 e testate minime; il passaggio C4
sulle mappe non inferisce equivalenza semantica dei tag o delle chiavi.
Mille tag consecutivi sono percorsi iterativamente, con profondità delle
sole array/map limitata a otto.

La negoziazione sceglie il minimo dei limiti; un gate simulato chiuso
annuncia zero opcode e produce `unavailable`, con zero chiamate simulate.
Le richieste valide hanno ID crescenti anche dopo il completamento; le
risposte possono arrivare invertite, una sola volta. Il massimo u64 arresta
nuove letture, svuota i risultati e richiede una nuova connessione.

I crediti logici delle risposte restano occupati fino all'ultimo byte
inviato. Capacità in volo e byte esauriti sospendono l'ammissione senza
consumare ID. Due contesti indipendenti conservano crediti separati.
Il clock logico prova le soglie esatte e il rifiuto di regressioni; i
progressi parziali non rinnovano deadline di handshake, frame e risposta.
Quattro mutazioni note verificano la sensibilità degli oracoli.

Cinque nuovi scenari reali usano processi SBCL distinti: handshake inviato
un byte alla volta, due PING accorpati e risposte invertite; HELLO con
chiave duplicata; PING prima di HELLO; prefisso 4097 prima del corpo;
riuso dell'ID nella sessione. I rifiuti chiudono senza risposte applicative.
Il riuso dopo un primo PING lascia un risultato pendente nel modello al
momento della chiusura: non si simula un rollback né un commit del database.
Restano anche i sei scenari di trasporto precedenti, incluso il massimo
documento/chiave; quel massimo non è un envelope M16 completo.

## Originali e varianti

| Registro | Variante e risultato |
|---|---|
| `processes/command-0/` | V1: gli undici scambi terminano con exit 0; l'harness rifiuta il rapporto con nomi di funzione qualificati da un package assente nel padre |
| `processes/command-1/` | V2: etichette stringa, prova mirata OK e sorgenti stabili |
| `processes/command-2/` | Generazione della tracciabilità, exit 0; consistenza originale nel registro |
| `processes/command-3/` | V3: verifica completa locale OK e sorgenti stabili, inclusi gli undici spike |
| `processes/command-4/` | Confronto esatto degli ingressi finali con la verifica completa e controllo dei worktree |

V3 aggiunge il rifiuto dell'inizio di un frame durante lo svuotamento a ID
massimo, rilevato nella revisione. Le tre varianti dei sorgenti e dell'harness
sono conservate in `sources/v1`, `sources/v2` e `sources/v3`, con il metodo.
Gli originali dei singoli harness, compreso quello fallito, sono in `raw/`.
Il fallimento V1 resta tale: non si crea un package nel reader del padre e
non si indebolisce il controllo del rapporto.

Il [confronto degli ingressi](raw/verified-inputs.lisp) confronta insieme
e hash di 829 ingressi, con 11 worktree puliti e integrati e nessuno stash.
Il produttore confronta inoltre ciascuno snapshot V1/V2/V3 con gli hash del
rispettivo registro nativo prima di copiarlo. L'[indice chiuso](archive-index.lisp), il
[catalogo](catalogo.lisp) e il produttore conservano dimensioni e SHA-256
delle copie. I registri mantengono argv, ambiente, PID, output e identità
dei sorgenti originali, senza riattribuirli al commit della raccolta.

## Limiti e prossimo collegamento

Nessun sorgente di prodotto, suite del motore, formato persistente o workflow
è modificato. È una prova locale macOS/SBCL, senza qualifica Linux, misura
di prestazione, heap nativo o RSS. Il modello alloca e contabilizza solo
i risultati REQUEST; non qualifica il pool I/O, handshake/scratch, pausa
del reader, timeout idle o capacità complessiva del proprietario.

Restano codec/sessione di prodotto e relativo massimo envelope, adattatore
I/O iniettabile con buffer preallocati, accesso con UID distinti e gate
reale del motore dopo recovery e pubblicazione delle radici. Il booleano
simulato non è quella prova. GET/PUT, durability, MVCC, EBR e risposta persa
dopo commit non sono verificati da questa campagna; C1 e requisiti IPC non
vengono promossi. La priorità resta il socket Unix locale per NNTP.
