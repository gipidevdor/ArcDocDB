# Verifica OUTCOME dopo l'integrazione

Freeze: `15fc91c824b0c49ad91dfdfc9845d4e9e2148102`.
Il controllo completo R3 e la copertura R2 passano con exit 0,
sorgenti stabili, working tree iniziale pulito e 735 path/blob del freeze.
I 42 test resolver passano; il controllo completo comprende 1.011 test
di modulo e due smoke check. La copertura isolata resta 1156/1416
espressioni e 131/184 rami, senza attribuzione MC/DC o qualifica C1.

- [Controllo completo R3](raw/check-R3/report.lisp).
- [Precedente controllo R2 fallito](raw/check-R2-failed/report.lisp).
- [Comando della copertura R2](raw/coverage-R2-command/report.lisp).
- [Conteggi diagnostici](raw/coverage-R2/coverage-summary.lisp).
- [HTML diagnostico](raw/coverage-R2/cover-index.html).
- [Manifesto della raccolta](collection-manifest.lisp).
- [Inventario SHA256](archive-index.lisp).
- [Catalogo LEAF](catalogo.lisp).
- [Metodo](../../../docs/implementazione/get-resolver-metodo.md) e
  [risultati e limiti](../../../docs/implementazione/get-resolver-verifica.md).

R2 conserva exit 2: dopo i test superati il controllo dei collegamenti
ha rilevato sette link di un README temporaneo ignored di raccolta.
Il modello è stato rinominato `.txt`, poi R3 ha verificato l'intero gate.
R2 resta un esito complessivo fallito. Ogni gruppo, inclusi processi
intenzionalmente falliti delle fixture, output e FASL, è copiato per intero.
Le copie sono confrontate con gli originali tramite byte e SHA256;
eventuali raw grandi sono compressi senza perdita. I FASL sono dati.
