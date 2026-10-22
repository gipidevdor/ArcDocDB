# Integrazione locale e regressione del consumer CI

Questo archivio supplementare conserva originali chiusi successivi alla prima
raccolta della creazione relativa I/O. Le due raccolte precedenti restano
immutate. La raccolta usa il collector esistente, un manifesto esplicito e una
destinazione nuova; non aggiunge file agli archivi già chiusi.

## Ruolo delle prove

| Originali | Revisione osservata dal recorder | Esito e significato |
| --- | --- | --- |
| `processes/r4-product-integration/` | `1ebf8e71ad6df7288975d6b49f4fd14e1da983d2` | Prova locale del prodotto, exit 0 e sorgenti stabili. |
| `processes/wire-regression-red-92fbfbbc/` | `92fbfbbcf4d7cae3264bce234ac84f81fee684af` | Regressione C4 prima della correzione: exit 1 atteso, sorgenti stabili. |
| `processes/wire-regression-green-6c409f59/` | `6c409f591d4b805fd74d0587b0e8be0ce034b716` | Stesso runner dopo la correzione: exit 0 e sorgenti stabili. |
| `processes/c4-selftest-r1-6c409f59/` | `6c409f591d4b805fd74d0587b0e8be0ce034b716` | Self-test C4 completo sulla correzione locale. |
| `processes/c4-selftest-r2-integration/` | `fc0a34a91a8d32e2fcfb13723be97873b1d2882a` | Self-test C4 completo dopo l'integrazione di `origin/main` a `c46bc4c1`, contenente PR21. |

I cinque record `command-verification` sono le sole righe `:processes` del
manifesto. Report CI e riepiloghi dei self-test sono originali accessori nella
lista `:files`; non vengono trasformati in record di processo né sommati ai test
del motore. I rispettivi record conservano comando, ambiente, stato, exit code,
diagnostiche e impronte dei sorgenti prima e dopo ogni esecuzione.

## Regressione attesa e correzione

Il runner `procedures/fresh-consumer-runner.lisp.txt` carica il producer nel
parent, quindi avvia il consumer coverage in un processo fresco con gli stessi
moduli del consumer reale. Il figlio non carica il prodotto né il producer:
le keyword già presenti nel parent non possono mascherare il difetto.

Il caso prima della correzione fallisce perché il vocabolario wire trusted non
contiene tutti i campi del report normale. È il rosso atteso della nuova
regressione C4, non un fallimento di creazione relativa I/O. La correzione locale
aggiunge `:metrics-status` e `:execution` al vocabolario canonico dichiarato dal
sorgente trusted; il parser continua a rifiutare keyword sconosciute senza
internare token ricevuti dall'ingresso.

Le due keyword della correzione locale coincidono con la correzione successiva
in PR21. L'integrazione conserva inoltre la nostra regressione che avvia il
consumer coverage reale in un figlio fresco; questa prova si aggiunge al caso
data-only presente in PR21.

`fixtures/wire-before/fresh-coverage-consumer/` conserva packet, stdout e stderr
del rosso. `fixtures/wire-after/fresh-coverage-consumer/` aggiunge il round trip e
il report con `:skipped` alterato, usato per verificare il rifiuto della prova
normale non valida. `selftest-r1/` e `selftest-r2/` conservano i sette riepiloghi
C4 e gli stessi cinque originali del consumer fresco. La selezione esclude le
fixture Git, i link, i file corrotti intenzionali e le cache ricostruibili dei
self-test completi; gli originali nelle loro directory esterne restano intatti.

## CI precedente conservata come fallimento

`old-ci-Q1/` contiene integralmente i sei packet del run GitHub Actions
`39817860664`, attempt 1: plan, verify Linux, verify macOS, audit, coverage e seal.
Il commit realmente provato dal run è
`046c64ccb6692b9d12b1d47ea24bb4c79134ea90` (Q1), mentre il ramo della PR20 era
`28b7fae0731e9ec5cd9c235f4a4b2fc6cd3247f5` (P). Manifesti, originali gzip,
descriptor e diagnostiche sono conservati insieme; `failed-jobs.log` mantiene
anche il log scaricato dei job falliti.

Coverage risulta **FAILED** in quel run. Questi packet non attestano una CI
complessivamente verde, né vengono riattribuiti alla correzione successiva.
I risultati CI di una successiva revisione richiedono i propri packet e il
proprio SHA realmente provato. I self-test locali del supplemento mantengono la
loro attribuzione alle revisioni indicate nei record.

## Conservazione

`collection-manifest.lisp`, `archive-index.lisp` e `collection-source.lisp` sono
prodotti dal collector esistente. La sua verifica di byte, SHA256, descriptor
gzip, inventario chiuso e quattro worker non promuove requisiti o gate del motore.
Il sorgente del builder e il runner della regressione sono conservati come
`.txt`; i report Lisp e gli altri payload sono dati e non vengono caricati come
codice.
