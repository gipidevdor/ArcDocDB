# Verifica distinta: interleaving CBOR e lifetime GET

Freeze F2: `0c7d08f8383892a6c7c07d9c9b2fbae9afe8f523`.
Metodo preregistrato: [worker-cbor-interleaving.md](../../../docs/implementazione/worker-cbor-interleaving.md).
La precedente prova lifetime rimane immutata; il prodotto e i formati non cambiano.

F2 corregge le sole fixture concorrenti CBOR float/tag: i worker raggiungono
il rendezvous dopo una prima chiamata reale dell'encoder, risultati e sink
verificati. I log conservano starts, firsts, ends, sink e overlap prima
delle asserzioni temporali. Il tempo osservato comprende fixture, controlli
e rendezvous; non misura il solo encoder, utilizzo CPU o scaling.

La verifica completa F2 è OK/exit0/STABLE: outer
`4001000166-command-92120-0`, inner `4001000168-command-92151-0`.
Il Git-only counter autenticato deriva **1.444 test in 33 suite e due smoke**:
DIRECTORY72, GET70, ACTIVE42, resolver42, epoche34 e compiti di lettura30.
La suite DIRECTORY comprende i quattro casi lifetime v1/v2.
Nessun precedente run scoped viene qualificato come esecuzione su F2.

L'audit semantico `4001000591-command-445-0` è OK/exit0/STABLE.
Confronta l'intero insieme dei path/blob con il Git F2, conteggi e ordine
delle suite, nomi DIRECTORY/ACTIVE/resolver, outer/inner, mapping ASDF
e cache privata completa. Le due fixture negative reader/snapshot,
con SIGKILL e uscita nonzero dopo COMPLETE, restano errori del runner
attesi. Due inventari freschi confrontano tutti i byte delle fonti lette.

Il run CI precedente `38634044870`, attempt1, appartiene al published head
`2001940952f6477b2db487f4662900139b0de20d` e checkout sintetico
`92dc4aa0312b6cc1df37e202f414b75742d6fc1c`.
Ubuntu e documentazione riuscirono; macOS **fallì** sull'asserzione
`PLUSP OVERLAP` del test CBOR tag prima delle suite GET.
JSON ufficiali prima/dopo, tre ZIP originali con digest/dimensioni
ufficiali, file estratti, log e commit nativo sono conservati integralmente.
Questa collezione non dichiara un PASS CI precedente o su F2.

Anche il primo auditor CI `01d2b083…` **fallì**, per perdita della plist
OPTIONS aggiunta localmente: `Missing/duplicate suite summary NIL`,
native `4000999676-command-83495-0`.
Il derivato R2 `2dad7e5e…` cattura il ritorno della plist e il riferimento
negativo `4000999945-command-89224-0` rifiuta correttamente il reale FAILED
macOS, dopo i controlli Ubuntu/documentazione. Il suo FAIL/exit1 è
conservato come verifica del rifiuto, senza promozione a risultato prodotto.

I 24 gruppi espliciti preservano cache FASL completa F2, tutti gli originali
di comandi e fixture, aggregato spike fresco e intere cache dei dieci spike.
Queste ultime contengono anche file di esecuzioni precedenti: la copia
integrale non promuove quei file a osservazioni F2.
I sorgenti C4 hanno SHA/provenienza conservati; gli auditor CI sono copiati
anche come testo. Report e FASL sono dati: READ-EVAL NIL ed EOF, mai LOAD.

Il collector `e6b2cdec…`, byte auditor `d17564b3…` e batch utility
`130f4285…` sono copie qualificate identiche. La raccolta e il byte audit
richiedono gruppi chiusi, inventari completi e confronti SHA freschi.
Si eseguono gli originali qualificati da `lifetime-publication`, che non
è fra i gruppi raccolti; output e temporanei hanno directory esterne.
Non si qualificano prestazioni, zero heap, C1, MC/DC globale, retention,
rotazione o rimozione durevole dei segmenti.
