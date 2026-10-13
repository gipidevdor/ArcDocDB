# Prove funzionali del resolver CLOSED: OUTCOME

Freeze locale: `e75caed6694e4a2c141b5ff155dfe0d418191c75`.
Le due esecuzioni registrate (`make check` e copertura isolata) riportano
exit0, status OK, sorgenti stabili e working tree iniziale pulito.
La suite dedicata esegue 42 test nominati.

- [Regressione e controlli completi](raw/check-R1/report.lisp).
- [Comando della copertura](raw/coverage-R1-command/report.lisp).
- [Conteggi della copertura](raw/coverage-R1/coverage-summary.lisp).
- [HTML della copertura](raw/coverage-R1/cover-index.html).
- [Manifesto esplicito della raccolta](collection-manifest.lisp).
- [Inventario completo SHA256](archive-index.lisp).
- [Catalogo LEAF](catalogo.lisp).
- [Metodo](../../../docs/implementazione/get-resolver-metodo.md) e
  [risultati con limiti](../../../docs/implementazione/get-resolver-verifica.md).

Ogni gruppo è copiato integralmente, inclusi report nativi, descriptor/gzip,
finalizzazioni, log, runner, FASL privati e raw degli spike/fixture.
I FASL sono conservati come byte, senza esecuzione. I raw oltre 1MiB sono
compressi losslessly con dimensione/digest originali nell'inventario.
I record dei comandi e i loro descriptor non sono riscritti.

Espressioni 1156/1416; rami 131/184 nei sette file CLOSED. Il reset prima
della suite esclude dal conteggio le altre suite e il caricamento.
Questi dati sono diagnostici: nessuna qualifica C1, MC/DC, requisito,
prestazione o Fase0 è dichiarata conclusa.
