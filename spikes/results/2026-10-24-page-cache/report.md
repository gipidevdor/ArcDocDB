# Cache pagine: primo collegamento al modulo I/O

Data locale: 2026-10-24, macOS ARM64, SBCL 2.6.9. Incremento seriale,
non backend paginato del motore. Il [contratto](../../../docs/implementazione/cache-pagine.md)
definisce ownership, memoria e limiti.

Suite mirata: [record strutturato](targeted-run/report.lisp), 25 test pagine superati, inclusi 7 nuovi test cache; fixture
indipendenti, tre taglie, FIFO, identita' completa, letture parziali, CRC,
thread estraneo, rientro e uscite non locali. Comando riproducibile:

```sh
sbcl --noinform --no-userinit --non-interactive \
  --eval '(require :asdf)' \
  --eval '(asdf:load-asd (truename "arcdocdb.asd"))' \
  --eval '(asdf:load-system "arcdocdb/tests")' \
  --eval '(arcdocdb.index.page.tests:run)'
```

Allocazioni: [script](allocation.lisp), [record strutturato](allocation-run/report.lisp)
e [integrita' degli artefatti](allocation-run/conservazione.lisp).
Una finestra di 10.000 hit dopo 1.000 warmup ha osservato 10.000 hit e zero
byte Lisp allocati secondo GET-BYTES-CONSED. Non misura RSS, miss con I/O,
concorrenza, cache maggiore della RAM o prestazioni del motore.
Il record conserva comando, ambiente, hash prima/dopo e output originale.

Il [primo tentativo di registrazione](recording-path-rejected.log) e' stato
rifiutato dallo strumento per destinazione esterna a `spikes/out/`, prima di
eseguire il test; ripetuto nel percorso ammesso e poi copiato qui integralmente.
Non e' classificato come fallimento del prodotto.

Verifica complessiva: `make check` completato con esito `:OK`, codice 0,
snapshot dei sorgenti stabile. [Record originale](check-run/report.lisp) con
output, ambiente e hash; eventuali payload compressi restano nella stessa
cartella. Comprende compilazione rigorosa, suite prodotto, crash/restart,
lint, tracciabilita', link, full text, autotest delle evidenze, undici spike
e autotest CI. Nessuna qualifica del backend paginato o del motore completo
viene dedotta da questo esito.
