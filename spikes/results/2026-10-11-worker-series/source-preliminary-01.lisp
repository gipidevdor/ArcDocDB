(:SCHEMA-VERSION 1 :KIND :WORKER-SERIES-SOURCE-BUNDLE :VERSION "preliminary-01" :SOURCES
 ((:PATH
   #A((133) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-m1eqa0hk/ArcDocDB/docs/implementazione/worker-serie-metodo.md")
   :BYTES 3351 :SHA256 "2fb715083574171386a5c91715872031f82b436a99ca1c0dad9962573e7cc0eb" :GIT-BLOB
   "57cc06096e7ab212c88008cccc427f028e97e6f0" :TEXT
   "# Metodo preregistrato del collegamento worker/Serie

Base iniziale `2a0011f9d2bef104b22f7ad1eb86d7e5d60d5e11`.
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
  e style-warning fatali; build e test mirati prima del controllo completo.
  `make check` una volta sul codice finale congelato, salvo cambiamenti o failure.

Ogni campagna viene registrata con `tools/record-command.lisp`, conservando
stdout/stderr, argv, ambiente, report originali, snapshot iniziale/finale e
tentativi falliti. Le campagne usano copie congelate e cache distinte. I dati
grandi vengono compressi senza perdita con catalogo conservativo.
Non si deducono throughput, P99, fairness, scalabilità o heap zero universale
da questi campioni. Nessun gate della Fase0 viene chiuso per questa fondazione.
")
  (:PATH
   #A((126) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-m1eqa0hk/ArcDocDB/docs/implementazione/worker-serie.md")
   :BYTES 4567 :SHA256 "b96af013192fa96afc1a954ba62f2295a7aa8b85b0e92a79a06f79fa8acc2aca" :GIT-BLOB
   "d29c4a0ee97041eb43fd890fdf80192f2758ef8d" :TEXT "# Collegamento del worker alla Serie

Fondazione C1 autorizzata, conforme a REQ-CON-001/002/004/005 e
REQ-AFF-001/004/008; ADR-0005, ADR-0033 e ADR-0045. Il package
`arcdocdb.execution.series` viene caricato dopo execution e controller Serie.
Il [metodo preregistrato](worker-serie-metodo.md) fissa le verifiche;
l'[inventario delle decisioni](worker-serie-decisioni.md) conserva i denominatori.

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
conservando riferimenti e lease. Marca il controller FAULTED con ambito Archivio
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
   #A((121) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-m1eqa0hk/ArcDocDB/src/series/worker-boundary.lisp")
   :BYTES 3347 :SHA256 "82e23104eab47344155c408c05b11d4bff4c73e1f8d88b1c76c9fd469d8ef803" :GIT-BLOB
   "a5c2008e495d0082150445cc16b838b12ee4e365" :TEXT
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
  (when (typep condition 'resource-exhausted)
    (when (member (error-reason condition) resources) (return-from %fault-worker-serie nil)))
  (when (typep condition 'invalid-argument)
    (when (member (error-reason condition) arguments) (return-from %fault-worker-serie nil)))
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
   #A((120) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-m1eqa0hk/ArcDocDB/src/series/worker-package.lisp")
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
   #A((116) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-m1eqa0hk/ArcDocDB/src/series/worker-run.lisp")
   :BYTES 6901 :SHA256 "c58387b7d0be0e0afdc38718e4b9a5cb738ee4a2b8bc6494fa75bdf0e9b8ce8b" :GIT-BLOB
   "ed11d0863daf02b365e72c5d433cf35929d3641c" :TEXT
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
    refusal))

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
        (rilascia-controllore-serie (collegamento-worker-serie-controller link)
                                   (collegamento-worker-serie-series-lease link))
        (setf (collegamento-worker-serie-series-lease link) 0))
      (let ((action (termina-tratto-worker context)))
        (setf (collegamento-worker-serie-writer-lease link) 0
              (collegamento-worker-serie-state link) :idle)
        (%check-worker-serie link)
        action))))
")
  (:PATH
   #A((118) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-m1eqa0hk/ArcDocDB/src/series/worker-types.lisp")
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
   #A((121) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-m1eqa0hk/ArcDocDB/tests/series/worker-bridge.lisp")
   :BYTES 47758 :SHA256 "6063e1fc88100e6ef7ec3e7e0876b528a27a24dd2579f9b662ed686174d9dbad"
   :GIT-BLOB "b78400fed16d73a451230bc7f7ac4d61578c499d" :TEXT
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
        (declare (ignore context ready))
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
   #A((120) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-m1eqa0hk/ArcDocDB/tools/worker-series-bench.lisp")
   :BYTES 19569 :SHA256 "6df1509516facddd2c1ea3ab2266318f60d1cc9ef6f790caa519c37dbb8050eb"
   :GIT-BLOB "13a47996ba8da045a66b71509d5a0679900f8ee5" :TEXT
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
  \"Compila prodotto e fixture prima della misura; tutti gli avvisi di build sono errori.\"
  (setf asdf:*compile-file-failure-behaviour* :error asdf:*compile-file-warnings-behaviour* :error)
  (let ((*standard-output* *error-output*))
    (handler-bind ((warning (lambda (condition)
                             (error \"COD-01: avviso non ammesso: ~A.\" condition))))
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
   #A((102) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-m1eqa0hk/ArcDocDB/arcdocdb.asd")
   :BYTES 9954 :SHA256 "2d30b3a10d667b733cfb4f782f8cbd6ceed576b7271ba5ba3ef7ceb9e1293c24" :GIT-BLOB
   "783e64de6a4a2d82386f4dce0e35b27c0c3566b6" :TEXT
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
                             (:file \"rebuild-copy\") (:file \"rebuild\")))
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
                             (:file \"rebuild\"))))
  :perform (test-op (o c)
             (uiop:symbol-call '#:arcdocdb.tests '#:run)
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
   #A((120) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-m1eqa0hk/ArcDocDB/docs/implementazione/README.md")
   :BYTES 5765 :SHA256 "c2d538e4cf21d1a0108ffc3f960611d6cf5b09532a3046ef10f0d59a1ec530cc" :GIT-BLOB
   "0a10e032add4ebdf7d7657dfb4d62791f5d63e78" :TEXT "# Implementazione

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
| Cache dei record | [Insiemi associativi, CLOCK e copie verificate](cache-record.md) | [`src/cache/`](../../src/cache/) |
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
")))
