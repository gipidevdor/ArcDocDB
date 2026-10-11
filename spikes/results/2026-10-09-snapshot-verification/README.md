# Verifica snapshot e CSN — 2026-10-09

Il [metodo preregistrato](metodo.lisp) precede le esecuzioni della campagna.
La [pagina di verifica](../../../docs/implementazione/snapshot-verifica.md)
definisce scope, decisioni, rifiuti e criteri di chiusura. La base è il main
`edb043b`; il registro CSN canonico rimane la dipendenza comune di writer e
snapshot.

Sono previsti test funzionali, contesa coordinata da semafori con attese
limitate, iniezioni isolate al confine dell'adattatore e mutazioni mirate
in copie e processi separati. Due letture registrano revisori, sorgenti e
rilievi prima delle prove. I registri dei comandi conserveranno ambiente,
argomenti, output, esito e hash prima/dopo; i tentativi falliti manterranno
il loro stato originale. Il catalogo userà nomi di artefatti LEAF.

La copertura facoltativa usa `tools/foundation-coverage.lisp` nello scope
`mvcc`, con la sola suite dedicata. Forme e rami degli otto sorgenti MVCC
saranno conservati con denominatori e lacune; non sono una misura MC/DC.

**Osservazioni non ancora raccolte.** Nomi e mapping finali delle suite e
del catalogo di mutazione vengono concordati prima del freeze del metodo.
La campagna non qualifica il motore, MC/DC, memoria debole, assenza di
allocazioni, durability o recovery. Le precedenti campagne di sola
compilazione e ispezione statica restano originali.
