# Cache seriale delle pagine dell'indice

Incremento preparatorio all'integrazione I3/I4 di ADR-0057 e ADR-0058,
autorizzato dall'autore il 2026-10-24. REQ-IDX-009, REQ-LIM-003,
INV-I8, INV-A2, INV-A8, INV-P6. Il motore M1 conserva il primario residente:
questa cache collega il codec al modulo I/O, ma non realizza ancora il backend
paginato, la directory multilivello o la migrazione automatica.

## Contratto e integrazione

`arcdocdb.index.page:crea-cache-pagine(size, frame-count, loader)` prepara
frame fissi per pagine di 4096, 16384 o 65536 byte. Il payload massimo e'
256 MiB; numero frame 1..65536. Ogni frame ha ora una copia posseduta
dell'identita', preallocata: i cursori privati del
[lettore paginato](lettura-indice-paginato.md) non vengono trattenuti. Il limite riguarda gli array dei byte:
struttura, vettori di riferimenti e identita' sono metadati aggiuntivi, O(frame-count),
e non costituiscono una misura RSS o la quota completa richiesta da ADR-0057.
Il chiamante deve conteggiare anche metadati, target e sorgenti trattenute.

`crea-cache-pagine-file(size, frame-count, file)` collega un file readonly
immutabile prestato a `io:leggi-esatto`. Il controller mantiene il file aperto;
la cache non lo chiude. Il miss e' sincrono e deve essere eseguito dall'attore
I/O. Le letture parziali sono completate dal modulo I/O; EOF e guasti vengono
propagati senza retry dell'errore. Non si usa mmap.

`copia-pagina-cache(cache, identity, target, :start 0)` restituisce fine e
`:hit`/`:miss`. Cerca al massimo tutti i frame e usa sostituzione FIFO; un hit
non cambia l'ordine. Serie, immagine, offset e generazione fanno parte della
chiave completa. Ogni miss verifica l'intera pagina con il codec prima della
pubblicazione nel frame e della copia nel target. Il target resta intatto se
lettura o verifica falliscono. Lo slot vittima resta invalido in caso di errore
o uscita non locale; un caricamento successivo non puo' usare una coda vecchia.

Il caricatore iniettabile riceve identita' e buffer esclusivo e restituisce
esattamente SIZE. E' codice fidato: non trattiene ne' modifica successivamente
il buffer. La cache invalida prima di caricare e azzera il frame. Il valore
di ritorno da solo non prova che il caricatore abbia letto: CRC, identita' e
forma vengono comunque verificati. Una cache corrotta in memoria dopo la
verifica non e' rilevata da una nuova verifica su ogni hit.

Un solo thread possiede l'intera cache; i callback non possono rientrare.
Nessun frame viene prestato al chiamante, solo copie in memoria privata.
Non occorrono hazard per queste copie, che restano valide dopo il riuso.
Questo contratto seriale non sostituisce la futura cache concorrente I3:
non dimostra progresso lock-free, primitive/barriere SBCL o safety di borrower
concorrenti. Nessun lock, contatore o scrittura e' condiviso tra Serie.

## Verifica e letture C1

Metodo: fixture binarie indipendenti dal codec di prodotto; tre taglie,
identita' completa, hit senza nuovo I/O, FIFO uno/due frame, copie private,
short read, CRC errato, identita' errata, rientro, thread estraneo e uscita
non locale. Il ponte I/O e' esercitato con quattro trasferimenti da 1024 byte,
hit senza syscall e file chiuso prima di un miss. Le prove entrano nella suite
pagine esistente e quindi nel percorso ASDF e CI ordinario.

| Decisione composta | Condizioni e casi |
|---|---|
| Factory | taglia valida, conteggio intero 1..65536, callback funzione; ogni dominio invalido separato |
| Identita' hit | stessa immagine, offset, generazione e Serie; ciascuna diversa causa miss; offset diverso esercita FIFO |
| Slot candidato | NIL e' invalido; identita' valida ed equivalente e' hit; diversa e' miss |

Prima lettura: dominio/geometria, identita' completa, integrita' prima della
copia, nessun cambiamento durevole, cicli limitati ai frame, cleanup senza
mascherare errori, ownership e rientro. Seconda lettura: ordine invalidazione/
lettura/verifica/pubblicazione, errore dopo vittima invalidata, nonlocal exit,
immutabilita' delle copie, lifetime del file prestato. Sono letture dello stesso
autore, non revisione indipendente o qualifica MC/DC del motore completo.

Il rollback rimuove questa cache derivata senza modificare log o dati utente.
Non esiste un nuovo punto di commit: SEAL, EDIT e DECISION restano autorevoli.
EOF/corruzione richiedono al futuro confine del motore la transizione FAULTED;
la cache propaga la causa e non sceglie autonomamente il recupero del derivato.
