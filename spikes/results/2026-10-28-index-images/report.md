# Immagini indice: sigillo, verifica readonly e adozione seriale

2026-10-28. [Contratto](../../../docs/implementazione/immagini-indice-paginato.md),
[ADR-0063](../../../docs/adr/0063-immagini-sigillate-indice-primario.md).
Il motore M1 resta sul residente; inventario/catalogo e wiring startup/writer/GET
non vengono dichiarati integrati da questo incremento.

## Risultati riproducibili

[Record mirato](targeted-run/report.lisp), [conservazione](targeted-run/conservazione.lisp):
69 test delle pagine superati, inclusi 17 casi nuovi del container e della
vista seriale. Il record contiene comandi, ambiente, revisione, sorgenti e
hash prima/dopo, output originale e fallimenti dei processi attesi.

- Tre taglie del container, chiavi massime, un frame, directory multilivello
  e overflow; footer confrontato con oracolo wire indipendente.
- Footer CRC/versione/prefisso/coda/troncamento, fonte/seme, identita',
  campi riservati, CSN, digest e cardinalita' coerenti localmente ma errati
  rispetto alla fonte: rifiuto prima della prova adottabile.
- Duplicati con payload identico, entry irraggiungibili e fonte incompleta:
  confronto dell'origine fisica e cardinalita' impediscono la falsa adozione.
- Strutture vuote: root di tipo chiave, archi directory verso chiavi e
  intervalli radix sovrapposti respinti anche senza entry da sondare.
- Pubblicazione/invalidation della sola vista seriale: fonte errata o
  regressiva preserva la vecchia root; cambio token allo stesso CSN ritira
  la root; lettura senza root e FD chiuso non sono false assenze.
- Budget cumulativo con limite sufficiente e insufficiente; validatore
  falso/non booleano o chiusura della capacita' impediscono una prova valida.
- Flush iniettato fallito e interruzioni non locali alle frontiere del
  sigillo: costruttore FAULTED, nessun retry o riuso dell'offset ambiguo.

Tre coppie di processi nativi su macOS ARM64, taglia 4096: writer arrestato
con SIGKILL prima del footer, dopo il footer e dopo il flush; un nuovo
processo verifica sorgente/candidati e invarianza byte-per-byte del file.
Prima del footer il derivato e' respinto; un'immagine completa sopravvissuta
viene rivalidata anche se non e' stato restituito l'ACK. Nessuna qualifica
power loss, filesystem guasto o piattaforma Linux deriva da queste prove.
Il driver e' riproducibile con:

```sh
sbcl --noinform --no-userinit --no-sysinit --script tools/index-image-crash.lisp --self-test
```

## Finestre di allocazione

[Script della vista verificata](allocation.lisp), [record](allocation-run/report.lisp):
1000 warmup, 10000 lookup LIVE corretti, zero byte Lisp allocati osservati
con GET-BYTES-CONSED. File readonly mantenuto aperto, cache calda, hash e
controlli di capacita' inclusi. Non e' una misura RSS o di throughput.

Il [record regressioni del lookup](lookup-allocation-run/report.lisp)
riesegue lo [script precedente](../2026-10-24-page-lookup/allocation.lisp)
sui sorgenti nuovi: 10000 hit inline, 1000 directory/bucket con un frame,
100 chiavi esterne massime con un frame; zero byte Lisp in tutte le finestre.
Non si attribuisce zero allocazione alla verifica readonly o al sigillo.

## Tentativi precedenti

- [Refactoring del lookup](attempt-1-lookup-block.log.gz): compilazione
  interrotta per RETURN-FROM riferito al vecchio nome della funzione;
  corretto prima delle prove funzionali.
- [Suite di mutazioni](attempt-3-test-parens.log.gz): compilazione interrotta
  per parentesi finale in eccesso nel test; corretta prima delle prove finali.

Sono log diagnostici dei tentativi, non snapshot completi dei sorgenti
intermedi o risultati qualificati. I record conclusivi riportano invece
snapshot stabili con i sorgenti effettivamente verificati.

## Limiti

Il token della fonte, il conteggio e il validatore sono input fidati dal
controller, non dedotti dal derivato. La prova certifica le entry, non che
ogni pagina fisica sia raggiungibile. File immutabile e lifetime prestato;
nessuno swap concorrente, nessuna rinomina o nuovo commit dei dati.
Budget della fonte/callback, riserve RSS/GC e collegamento all'autorita'
dello startup M1 rimangono responsabilita' dei passi successivi. Nessuna
promozione automatica dei requisiti complessivi.

## Verifica complessiva

`make check` concluso con esito `:OK`, codice 0, sorgenti stabili prima/dopo.
[Record completo](check-run/report.lisp) e [conservazione](check-run/conservazione.lisp),
con eventuali payload compressi nella stessa directory. Comprende build
senza warning/style-warning, suite prodotto e nuove prove SIGKILL, recovery
v1/v2 preesistente, client/server locale, lint, tracciabilita', link, full
text, autotest delle evidenze, undici spike e autotest CI. Requisiti globali
non promossi automaticamente; M1 resta sul residente.
