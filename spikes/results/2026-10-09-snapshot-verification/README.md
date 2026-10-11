# Verifica snapshot e CSN — risultati dell’11 ottobre 2026

Le [prove locali](risultati.lisp) sono riuscite sul commit `aa4f462`: 43
test dedicati snapshot/CSN passati e dieci mutanti mirati rilevati a runtime.
La pianificazione è iniziata il 9 ottobre sul main `edb043b`; la ripresa
dell’11 ottobre integra `5768e02`, senza cambiamenti a snapshot e CSN.
Il registro CSN canonico resta comune a writer e snapshot.

Il [metodo preregistrato](metodo.lisp) è immutato. I suoi stati `:planned`
e `:not-collected` descrivono il freeze prima delle esecuzioni, non gli
esiti successivi. La [pagina di verifica](../../../docs/implementazione/snapshot-verifica.md)
mantiene scope, decisioni, rifiuti, metodo e criteri di chiusura; il
[record di revisione](revisione.lisp) conserva le letture statiche
dell’autore e dei revisori indipendenti.

| Evidenza | Esito osservato |
|---|---|
| [Core finale](core-finale.lisp) | `:ok`, exit 0, sorgenti stabili: 501 test dedicati dei moduli e smoke test; inclusi 43 nuovi casi MVCC e 22 casi CBOR dal main. Compilazione senza warning, lint, self-test, tracciabilità, link e verifiche delle evidenze riusciti. |
| [Core iniziale](core-iniziale.lisp) | `:failed`, exit 2, sorgenti stabili: COD-01 per `REGISTRY` inutilizzata nella fixture lifecycle. Lo stato originale è conservato. |
| [Correzione fixture](correzione-fixture.lisp) | Asserzione sull’identità pubblica del registro nel contesto; blob `4e9a15f` → `2cc481d`. Metodo, numero dei test e sorgenti di prodotto invariati. |
| [Mutazioni finali](mutazioni-finale.lisp) | Baseline con lista esatta di 43 test, fase `:complete`, exit 0; dieci rilevamenti a runtime con exit 1, nessun segnale o timeout e zero errori dei worker. Anche la [campagna iniziale riuscita](mutazioni-iniziali.lisp) è conservata. |
| [Fixture dei processi](process-fixtures-3.lisp) | `:passed`: SIGKILL 9 effettivo ed exit 7 dopo `:complete` classificati come i due `:worker-error` attesi. Runner, report e log dei figli sono conservati. |
| [CLI negativa](cli-negativa.lisp) | `:failed`, exit 1, rifiuto COD-61 atteso; non convertito in un successo nativo. |
| [Dieci spike](spikes-report.lisp) | Tutti passati, con record e payload originali conservati. |

La [copertura finale](copertura-finale-comando.lisp) è riuscita con la
sola suite `arcdocdb.mvcc.tests:run`. L’[indice HTML](raw/copertura-finale/cover-index.html)
degli otto file MVCC riporta 784/1084 espressioni (72,3247%) e 88/132 rami
(66,6667%); le lacune dei contatori sono 300 espressioni e 44 rami.
`snapshots-read.lisp` ha 31/209 espressioni (14,8%) e 0/28 rami: le API
reader sono esercitate dalle suite, ma le espansioni `INLINE` limitano
l’attribuzione al file. I contatori non attestano quindi percorsi reader
non eseguiti. La lettura indipendente ha ricostruito tutti gli otto HTML
e verificato che annotano i sorgenti effettivi senza differenze.

Il [catalogo](catalogo.lisp) conserva record schema 1 con nomi LEAF,
byte nativi, stati originali e file grezzi associati. L’[audit delle copie](audit-copia.lisp)
registra copie verificate byte per byte, inclusi sorgenti isolati,
runner, log, report dei processi figli e stato SB-COVER; quest’ultimo è
conservato come dato e non valutato.

La [verifica dopo integrazione del main](integrazione.lisp) `f16e978`
passa 620 test più smoke sul commit `ac52376`: comprende i 64 test slot e
55 test indice primario upstream. Snapshot, CSN e suite dedicate sono
identici a `aa4f462`; i risultati precedenti restano originali.

Alla pubblicazione di questi risultati la CI dell’esatto commit
pubblicato è **in attesa**. La campagna non qualifica il motore, MC/DC,
C1 completa, memoria debole, assenza di allocazioni, latenza, durability
o recovery. Le precedenti campagne di compilazione e ispezione statica
restano originali.
