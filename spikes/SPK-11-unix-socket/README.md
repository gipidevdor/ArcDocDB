# SPK-11 — Trasporto Unix socket locale

Metodo preregistrato 2026-10-17, prima dei run. REQ-IPC-001…REQ-IPC-003,
REQ-VAL-001; [ADR-0055](../../docs/adr/0055-interfaccia-locale-unix-socket.md).
Il [contratto della sessione](../../docs/implementazione/sessione-locale.md)
è una proposta distinta: questo esperimento non lo implementa interamente.

## Domanda e criterio

Il contrib SBCL `sb-bsd-sockets` permette uno stream Unix con stato di
framing esplicito, I/O parziali e risorse runtime osservabili fra due
processi, senza librerie esterne? Riuscita: byte ricostruiti identici alle
fixture, lunghezze errate rifiutate prima dell'allocazione del corpo,
nessuna cancellazione di un nome occupato o sostituito, figli terminati
con esito atteso entro una scadenza assoluta. Nessuna misura di latenza.

## Metodo e oracoli

- Decoder C4 u32be bounded: ogni divisione di due frame accorpati, input
  un byte alla volta, 0/max+1/u32 massimo, EOF nel prefisso e nel corpo.
  Contatore esplicito delle allocazioni del solo corpo, non dei byte heap.
- Sensibilità: un byte corrotto, una lunghezza in eccesso e un body
  troncato devono far fallire l'oracolo. CBOR valido e malformato passano
  dal codec di prodotto, caricato senza introdurre un secondo codec.
- Server e client in due processi SBCL distinti. Listener già in ascolto
  prima di creare il figlio: nessun ritardo usato come sincronizzazione.
  Primo scambio con letture/invii limitati a un byte; secondo con due
  frame in un invio e risposte invertite, verificate per contenuto/ID.
- Un documento CBOR map da 16 MiB esatti e una chiave da 65.535 byte in
  uno stesso frame. Confronto byte per byte; documento e chiave verificati
  separatamente dal codec esistente, non envelope completo da oltre 16 MiB.
- Lunghezza zero e sopra 17 MiB inviate dal figlio: rifiuto del decoder,
  nessuna allocazione del corpo. Peer chiuso durante il frame: troncatura.
- Directory privata 0700, nodo ristretto 0600; preflight lstat contro
  listener, orfano, file regolare e symlink. Controllo `lstat` di identità
  prima/dopo. Arresto con nodo sostituito: il sostituto resta intatto.
  Il bind grezzo su un link pendente e una diagnostica separata del sistema
  operativo, confinata a un target nella directory privata.
- Tutti gli I/O socket sono non bloccanti con attesa FD e deadline di
  10 s per scambio; il supervisore del figlio ha deadline 15 s, quindi
  termina e raccoglie il figlio anche in caso di errore. Le scadenze sono
  limiti della prova, non quelli della proposta di prodotto.

Il codice C4 può allocare e usare direttamente socket/clock/processi.
Nessun file persistente del database viene aperto o modificato. I file
runtime di prova sono creati in una directory esclusiva sotto `/tmp`,
rimossa soltanto dopo aver chiuso e raccolto tutte le risorse possedute.

## Esecuzione

```sh
sbcl --noinform --no-userinit --no-sysinit --script tools/run-spikes.lisp --check SPK-11
```

Il runner compila lo spike senza warning/style-warning, conserva gli
argv e gli output dei figli nel risultato. `--bench` restituisce
`:unsupported`: nessun benchmark è stato definito. Ambiente, versione,
commit e blob sono registrati dall'harness comune. Ogni fallimento resta
nei registri originali, comprese le varianti corrette successivamente.

## Limiti

Non sono prove di un listener di prodotto, handshake, API del motore,
recovery/ammissione, commit/durability, perdita di risposta, EBR,
saturazione del pool, negazione dell'accesso con un altro UID, o qualifica
Linux/macOS. Nessun thread per connessione viene proposto per il prodotto.
Le risposte invertite sono fixture di trasporto, non risultati di query.
La prova non chiude RSK-14/RSK-16 e non promuove REQ-IPC-001…REQ-IPC-004.

## Risultati

La [campagna locale e gli originali](../results/2026-10-17-unix-socket/report.md)
conservano gli scambi riusciti, i rifiuti, i cinque fallimenti iniziali e i
controlli completi intermedi. Nessuna prestazione stimata o qualifica M16.

Variante del metodo dopo il primo controllo dei nomi: su macOS il bind
grezzo ha accettato il link pendente senza cambiarne l'identita. Il rifiuto
esplicito con lstat prima del bind attua l'obbligo di ADR-0055, senza
affidarlo al comportamento del kernel. I run precedenti rimangono falliti.
