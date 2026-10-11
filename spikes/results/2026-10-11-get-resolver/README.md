# Resolver CLOSED: implementazione e letture statiche

Campagna del 2026-10-11 sul nuovo resolver GET. Compilazione del solo prodotto
con warning/style-warning come errori, controlli statici, lettura del
disassemblato ARM64. Contratto in [get-resolver.md](../../../docs/implementazione/get-resolver.md).

I record conservano comando, ambiente, hash prima/dopo, stdout/stderr
integrali ed esito. Si conserva anche il primo tentativo fallito per una
parentesi in eccesso nella definizione ASDF. Gli hash identificano le varianti
non committed, senza conservarne copie integrali; il prodotto finale è in Git.
Il [catalogo](catalogo.lisp) distingue i tipi di evidenza. Gli helper sono
conservati come dati sorgente, senza attribuire loro una qualifica.

Due letture statiche dell'autore, senza revisione indipendente. Nessun test,
modello, fault injection, benchmark o auto-verifica degli strumenti viene
aggiunto o eseguito localmente. Le evidenze non dimostrano zero heap,
correttezza concorrente, crash-safety o throughput. Qualifica C1 aperta.

La lettura di performance ha sostituito le scansioni ripetute dei body con
attraversamenti di header già verificati nel buffer esclusivo; i CRC degli
OUTCOME vengono ricontrollati prima della copia. Nessuna verifica di integrità
in lettura è stata rimossa: GET continua a leggere e verificare la prova dal FD.

Sei kernel della variante finale sono ispezionati nel disassemblato ARM64,
senza `ALLOC-TRAMP`, operazioni aritmetiche generiche o conversioni in bignum
visibili nei kernel selezionati. Non è una misura delle allocazioni e non
verifica i loro callees, altre piattaforme o il costo di costruzione.
Il controllore delle evidenze verifica struttura, presenza, dimensioni e
integrità delle conservazioni; non qualifica il significato dei risultati.

Prima dell'archiviazione del worktree, l'audit confronta dimensioni e SHA256
dei 42 file originali con le copie conservate. Il primo audit contiene già
42 entry corrette; il messaggio finale riportava 1 dopo un `nreverse`
distruttivo della lista. Il secondo conserva la lista invertita e riporta 42
anche nel messaggio. Entrambe le varianti e i sorgenti degli helper rimangono
nel catalogo. È una verifica di conservazione dei byte, non del prodotto.
