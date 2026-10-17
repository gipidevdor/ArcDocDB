# Chiusura dell'integrazione su main — 17 ottobre 2026

Questa campagna conclude l'integrazione coordinata di tutti i branch e delle
HEAD dei worktree, includendo gli incrementi ripresi durante la chiusura.
Gli originali delle prove e le varianti interrotte restano nella storia e
negli archivi dei singoli filoni. L'audit non sostituisce la qualifica C1.

## Lavori integrati

| Filone | Punto di integrazione |
|---|---|
| Cache concorrente e adozione runtime CLOSED | `96ed3793` |
| Acquisizione delle fonti recovery possedute | `3c579a2f` |
| Riserve full text | `362e7680` |
| Strumenti e registri della CI locale | `9b3d1f7a` |
| Contratto proposto M16 e prova socket Unix | `5cafabd8`, originali `a91896bd` |
| Collegamento full text ai byte PUT/WAL | `44f697d1` |
| Recovery semantico Serie ripristinato | `61b49122` |
| Ponte recovery Archivio/CSN | `1cc6f5c6` |
| Registrazione dei timeout e attribuzione degli esiti CI | `c7caed5f`, originali `7651032c` |

Il controllo di integrazione ha trovato i quattro commit del recovery Serie
nel worktree ripristinato: sono stati uniti, insieme alle prove originali.
I conflitti editoriali sono risolti mantenendo tutte le voci. Il catalogo
centrale mantiene le suite cache, riserve e PUT: 50 suite, sei full text e
sei misure delle allocazioni distinte dalla copertura strumentata.

La rilettura del collegamento PUT/WAL ha individuato il CRC del corpo sotto
lease writer. La correzione `8766c2c2` lo sposta nel worker e attesta la
generation del frame privato. Le regressioni conservate intercettano il
vecchio percorso e verificano l'append senza nuova scansione del corpo.

## Verifiche e conservazione

Il nuovo controllo completo è eseguito sul prodotto riunito nel commit
`aacee90ed8c62c35eeebd38c2b7284d90f9f58c3`, dopo le ultime modifiche al codice.
Exit code, output, ambiente e identità dei sorgenti sono nel registro nativo.
Il confronto finale richiede l'uguaglianza esatta dell'insieme e degli hash
di tutti gli ingressi eseguibili; due controlli negativi rifiutano hash
modificati e ingressi aggiuntivi. Non si combinano revisioni del prodotto.

| Registro | Contenuto |
|---|---|
| `processes/command-0/` | Verifica completa locale, sorgenti stabili |
| `processes/command-1/` | Registro originale del self-test CI incluso nella verifica completa |
| `processes/command-2/` | Audit finale: tutti i worktree puliti e integrati, branch raggiungibili e stash vuoto |
| `processes/command-3/` | Identità della conservazione del 16 ottobre rispetto a `c9e97fd0` |
| `processes/command-4/` | Primo audit interrotto per una parentesi nello script C4, poi corretto |
| `processes/command-5/` | Audit con inventario completo ma contatore terminale troncato, corretto nel registro 2 |

La verifica completa è OK, exit 0 e STABLE: 257 cataloghi, 4.000 riferimenti,
47.525 file conservati, undici spike e 327 autocontrolli CI passati. Il primo
audit aveva già confrontato gli ingressi prima di raggiungere un errore
incondizionato nel suo controllo negativo. Si conserva anche lo script
prima della correzione; nessuna modifica al prodotto deriva da quel tentativo.
Un successivo contatore terminale stampava 1 dopo aver invertito distruttivamente
le liste: il file aveva già tutti gli 11 worktree e i sei ref, verificati con
lettura indipendente. Il registro 2 ripete il controllo con stampa corretta;
sono conservati entrambi gli inventari e le varianti degli helper.

Il [confronto degli ingressi](raw/integration-inputs.lisp) registra il numero
effettivo dei file, ogni hash, tutte le HEAD e i riferimenti prima della
pubblicazione. I produttori sono conservati in `raw/`; gli originali
dell'harness degli undici spike, i rapporti strutturati dei sei moduli CI e
i risultati della nuova fixture sulle condizioni sono copiati senza reinterpretazione.
L'[indice chiuso](archive-index.lisp) e il [catalogo](catalogo.lisp) fissano
dimensioni e SHA-256 della raccolta. Le copie locali salvate il 16 ottobre
sono tuttora identiche, byte per byte, all'archivio già committato.

Il successivo commit della raccolta aggiunge documentazione e prove; i
sorgenti eseguibili devono mantenere gli stessi hash. La pubblicazione e
la rimozione dei branch seguono l'audit, con controllo delle HEAD remote e
senza riscrivere la storia di main. I worktree e gli archivi sono conservati.

## Limiti

Le prove sono locali su macOS/SBCL. Nessun esito viene attribuito a GitHub
Actions o a una misura delle prestazioni del database. Il nuovo recovery
Serie/Archivio conserva la compilazione e i controlli statici; la sua
qualifica funzionale dedicata resta aperta anche dopo i test generali.

Il [socket Unix](../2026-10-17-unix-socket/report.md) rimane la priorità
progettuale per NNTP: contratto M16 proposto e trasporto sperimentale sono
integrati. Il listener di prodotto richiede ancora avvio, recovery,
ammissione e dispatcher. Restano pubblicazione durevole degli indici full
text, MVCC e ritiro delle risorse, oltre alla qualifica C1/MC/DC.
