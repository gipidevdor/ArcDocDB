# Collegamento M1 delle immagini primarie — 2026-10-29

> Prova locale di correttezza e allocazione, non qualifica del motore completo,
> power loss, throughput o capacita' oltre RAM.

## Modifica verificata

[ADR-0064](../../../docs/adr/0064-adozione-indice-paginato-m1.md),
[contratto e decisioni](../../../docs/implementazione/indice-paginato-m1.md).
REQ-IDX-010, REQ-IDX-001, REQ-REC-001, REQ-AFF-008; INV-I8, INV-A2,
INV-A8, INV-P6. Base Git `e6f7e5b`, working tree modificato: i record conservano
manifest dei sorgenti prima/dopo e ambiente effettivo, non si attribuiscono
le prove ai soli sorgenti della base Git.

Il derivato esplicito viene verificato dopo il replay canonico, prima di READY.
La fonte M1 e' un'identita' esatta di prefisso append-only; ogni candidato viene
confrontato con il residente ricostruito. Il GET selezionato usa il derivato,
poi il resolver esistente. Prima di una scrittura ammessa il motore ritira
il riferimento privato e usa il residente; input/capienza rifiutati prima
dell'ammissione conservano la root. Il file derivato non viene modificato.

## Comandi e risultati

`make check` completo: **OK**, exit 0, sorgenti **STABLE**; build senza avvisi,
tutti i test (26 test del motore, 69 delle pagine), lint, tracciabilita’, link,
strumenti delle evidenze, full text, undici esperimenti e self-test CI superati.
[Registro completo](check-run/report.lisp),
[dati originali compressi](check-run/report.lisp.gz),
[conservazione](check-run/conservazione.lisp).

| Comando registrato | Esito | Dati originali |
|---|---|---|
| `sbcl --noinform --no-userinit --no-sysinit --script spikes/results/2026-10-29-engine-index-images/targeted.lisp` | OK, sorgenti stabili; 11 test, 6 casi SIGKILL con processi indipendenti | [targeted-run/report.lisp](targeted-run/report.lisp) |
| `sbcl --noinform --no-userinit --no-sysinit --script spikes/results/2026-10-29-engine-index-images/allocation.lisp` | OK, sorgenti stabili; 10000 GET paginati e 10000 GET residenti dopo ritiro, zero byte Lisp in entrambe le finestre | [allocation-run/report.lisp](allocation-run/report.lisp) |

Gli script [targeted.lisp](targeted.lisp) e [allocation.lisp](allocation.lisp)
caricano il sistema e le fixture; preparazione, costruzione, verifica e warmup
sono fuori dalle finestre di allocazione. La misura comprende il GET corrente
completo su file nativo, chiave di 16 byte, valore di 23 byte, CSN piccoli.
Non estende il risultato a PUT, valori arbitrari, startup/verifica, RSS o GC
transitorio. Mille chiamate di warmup per finestra, nessun SB-COVER.

Le prove esercitano v1/v2, pagine 4/16/64 KiB, overflow e cache con un frame;
fonte vuota/sole tombstone e checkpoint ripetuti; GET live/miss e aggiornamenti;
immagine obsoleta, payload non autorevole pur con fonte esatta, file mancante,
EOF/taglia/configurazioni e budget; root conservata dopo preflight rifiutato;
risorse rilasciate dopo uscita non locale e guasto su file chiuso a cache calda.
Un residente deliberatamente invalidato dimostra la scelta del paginato.
I processi SIGKILL coprono prima della verifica, dopo l'adozione e dopo il
flush della prima scrittura in entrambi i formati; al riavvio il vecchio
candidato viene riusato oppure rifiutato secondo i WAL committed e i suoi
byte restano identici. I rifiuti delle guardie composte sono testati anche
separatamente, compreso il primo CSN zero.

## Revisione C1

Prima lettura: token legato soltanto a prefissi M1 immutabili, ID mai riusati,
nessun hashing probabilistico come garanzia; il conteggio deriva dal singolo
frammento verificato, con rifiuto di geometrie fuori M1. Cinque word confrontate,
normalizzando soltanto l'offset arena. Errori e budget non diventano assenza.

Seconda lettura: callback GET immutabile della vista e appartenente all'attore,
nessun accesso concorrente alla cache; FD readonly registrato prima della
verifica e mantenuto fino al cleanup. Il ritiro precede qualsiasi effetto di
una scrittura ammessa; il confine M1 resta fail-stop su errore/nonlocal exit.
Nessun nuovo ciclo dataset, lock o stato condiviso fra Serie. Formati e punto
di commit dei dati invariati; nessuna rinomina/rimozione del derivato.
La tabella COD-54 e le precondizioni sono nel contratto collegato sopra.

## Diagnostiche intermedie conservate

- [attempt-1-test-parenthesis.log.gz](attempt-1-test-parenthesis.log.gz): errore
  di parentesi nel nuovo test di preflight, corretto prima del run finale.
- [attempt-3-test-constructor.log.gz](attempt-3-test-constructor.log.gz): quattro
  warning sui default non specializzati del costruttore privato usato dal test,
  corretto passando esplicitamente gli array richiesti.

Questi sono log diagnostici, non snapshot completi dei sorgenti intermedi.
Le prove strutturate finali e i loro manifest identificano la revisione verificata.

## Limiti

Il residente e' ancora presente e limita replay/PUT. Non vengono implementati
qui esportazione completa verso il builder, delta writer paginato, catalogo
durevole, migrazione automatica o snapshot. Il checkpoint canonico puo' essere
gia' completato quando il candidato viene rifiutato: nessuna promessa di
rollback dello startup. Eliminare l'opzione torna al residente; il derivato
resta intatto. Nessuna qualifica Linux, filesystem o guasti di alimentazione.
