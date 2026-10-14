# Verifica distinta: rendezvous dei worker CODEC ed execution

Freeze F3: `91c818f3616da7d0807285aaf5af44f519cb4247`.
Metodo preregistrato: [worker-cbor-interleaving.md](../../../docs/implementazione/worker-cbor-interleaving.md).
Le raccolte precedenti rimangono immutate; prodotto, formati e test registrati non cambiano.

F3 corregge le undici fixture concorrenti residue CODEC/execution: ogni worker
raggiunge READY dopo la prima operazione reale completamente verificata e il
relativo sink. Restano invariati chiamate, round, dati attesi, scratch privati,
input in sola lettura, attese limitate e cleanup. FIRST proviene dall'orologio
reale dopo il primo risultato, prima di READY. I log emettono start/first/end,
sink, conteggi e overlap prima dei controlli temporali, con force-output.
Restano richiesti END>START, START<=FIRST<=END, max(FIRST)<=min(END) e overlap
strettamente positivo. L'intervallo WALL comprende fixture, controlli e
rendezvous; non misura tempo puro di codec/compito, utilizzo CPU o scaling.

I path della nuova verifica completa F3 sono outer
`4001003152-command-24845-0`, inner `4001003154-command-24880-0`, cache privata
`worker-interleaving-F3-fasl`: entrambi i comandi sono OK/exit0/STABLE.
L'audit semantico nativo `4001003465-command-33474-0` è OK/exit0/STABLE,
stderr vuoto. Autentica il Git tree `0942ce0ddf568cef9f65f5672149f45f1d8ce25a`,
tutti i path/blob sorgente, ordine e nomi delle suite, associazione outer/inner,
mapping ASDF e tutti i 372 FASL della cache privata, letti soltanto come byte.
Due inventari freschi dei byte restano identici. Reader `4001003196-reader-self-test-25173-0`, snapshot
`4001003195-snapshot-self-test-25170-0` e aggregato spike
`4001003403-check-31002-0` sono conservati integralmente.
Le fixture reader/snapshot mantengono SIGKILL/exit137 e uscita7 dopo COMPLETE
classificati come errori attesi del runner, associati al nuovo comando core.

L'auditor full-only qualificato `8c857dc5…`, il Git-only counter `1cb93fc4…`,
la batch utility `130f4285…` e il runner storico `c1f97d69…` sono copie identiche.
Il nome storico `audit-F2.lisp` resta invariato per autenticazione dei byte;
questa invocazione passa esplicitamente il commit F3, nessun report/cache scoped.
Il counter autenticato deriva da Git F3 1.528 test in 33 suite e due smoke.
DIRECTORY72, GET70, ACTIVE42, resolver42, epoche34 e compiti di lettura30
rimangono contratti separati. Nessuna esecuzione scoped precedente è promossa.
Il report semantico completo è `raw/F3-semantic-output/full-F3-audit.lisp`,
SHA256 `14e83b57818173ffcb59d1121d3918ead99db1fab52d83ca5727c52e14b3dde1`.

La raccolta preserva due interi trasporti CI precedenti, con JSON ufficiali
prima/dopo, tre ZIP originali per run, byte estratti e log. PR13
`38638591424`, attempt1, passò su checkout sintetico nativo
`61b4ecdd03e40d14f3b8249d2e83c08ac757b5b9`; il published head era
`f0bd92d919736ab8896aef70d40cdc553ef9d925`.
La CI push/main `38640790953`, attempt1, su
`05a1c1f1688968c7c64b483a14528945a05b1335` fallì nel test ARRAY
`TEST-REQ-CBR-005-ARRAY-TWO-REUSED-WORKERS-PRIVATE-SCRATCH-AND-READONLY-INPUTS`,
asserzione `PLUSP OVERLAP`. Ubuntu e documentazione passarono, macOS fallì.
I tempi dell'onda ARRAY fallita non furono stampati dal vecchio test; non
si ricostruiscono valori né si attribuisce una causa di carico esterno.

I due wrapper degli auditor CI rimangono separati: PR13
`4001001998-command-16221-0` OK/exit0/STABLE; riferimento negativo main
`4001002676-command-21431-0` FAILED/exit1/STABLE, che rifiuta il reale stato
FAILED macOS. Nessuno di questi esiti appartiene a F3 o vale come PASS CI F3.

I 23 gruppi preservano tutti gli originali F3 di comandi e fixture, cache
privata completa, aggregato spike fresco e intere cache dei dieci spike.
Le cache SPK contengono anche esecuzioni precedenti: la copia integrale non
le promuove a osservazioni F3. Report e FASL sono dati, mai LOAD; lettura
con READ-EVAL NIL ed EOF tramite lettore fidato.

Collector `e6b2cdec…` e byte auditor `d17564b3…` sono copie identiche degli
originali qualificati eseguiti da `lifetime-publication`, esterna a tutti
i gruppi raccolti. Output semantico e generico hanno directory separate.
La raccolta attende tutti i writer chiusi; il byte audit richiede inventari
completi e due passaggi SHA freschi. Non si qualificano prestazioni, heap,
C1, MC/DC globale, retention, rotazione o rimozione durevole dei segmenti.
