# GET: implementazione e letture statiche

Ambito: nuovo modulo GET, dal candidato primario alla copia verificata del
record e alla conferma finale. Metodo del 2026-10-11: compilazione del solo
prodotto con avvisi come errori, controlli statici di codifica, tracciabilità,
collegamenti e conservazione, lettura del disassemblato ARM64.

Ogni comando registrato conserva argv, ambiente, sorgenti prima/dopo,
output integrale ed esito. Anche il primo errore di compilazione, parentesi
mancante nell'inserimento cache, è conservato. Non si scarta un tentativo
fallito per presentare soltanto la variante corretta.

Nessun test, modello, fault injection, benchmark o auto-verifica degli
strumenti viene aggiunto o eseguito localmente in questa campagna. Le letture
sono dell'autore, non indipendenti. Non dimostrano linearizzabilità, zero heap,
durability o throughput del motore. La qualifica C1 resta aperta.

Contratti e decisioni in [GET record](../../../docs/implementazione/get-record.md).
Il [catalogo](catalogo.lisp) distingue compilazione, controlli statici,
disassemblato e letture locali. I sorgenti degli helper sono dati di supporto,
non funzioni di prodotto o nuovi strumenti di verifica qualificati.

La seconda lettura ha collegato l'hash posseduto dall'indice integrato da
un'altra chat, aggiunto il controllo dell'Archivio canonico e precisato i
range di output/OUTCOME. Nei dodici kernel ARM64 ispezionati alla fine non
compare `ALLOC-TRAMP`: non è una misura delle allocazioni reali, né una
verifica delle funzioni chiamate. Le varianti iniziale e integrata del
disassemblato e dei controlli restano entrambe nel catalogo.
