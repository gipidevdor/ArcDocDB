# Lettura e transizione CONTROL — qualifica di modulo

Metodo registrato prima delle esecuzioni: gli agenti scrivono test indipendenti
su manifest, lettura readonly e pubblicazione validata; due letture C1
precedono il freeze. Tutti i processi passano da `tools/record-command.lisp`;
i raw e gli helper esclusi dal normale snapshot vengono catturati tramite
`tools/get-series-capture.lisp`. I fallimenti restano conservati.

## Ambito

- Formati v1/v2, EOF stabile attestato dal chiamante, header e testimoni durevoli.
- Budget, trasferimenti parziali, condizioni originali e uscite non locali.
- Conservazione CLOSED/REMOVED, high-water e parole u64 complete.
- Vista canonica, stessa capacità readonly, rifiuti prima del claim e guasti dopo.
- File reali e Serie indipendenti in parallelo, senza liberare FD ancora in uso.

Conteggio predisposto prima della prima esecuzione: 47 test di lettura,
15 della pubblicazione e 22 della transizione (84 nuove registrazioni).
La matrice finita della transizione dichiara 72 positivi e 564 negativi;
il parallelo nativo usa quattro worker per due round. Questi sono conteggi
di fixture predisposte, non risultati esecutivi. Le FI sulle dipendenze private
sono marcate outside-contract e ripristinate dal runner seriale.

La copertura `control-recovery` seleziona quattro file esatti:
`control/recovery-types`, `control/recovery-read`, `control/recovery-publication`
e `recovery/manifest-transition`. Esegue le suite CONTROL e recovery con cache
privata. I controlli finali eseguono l'intero progetto. Forme e rami SBCL
sono distinti dalla dimostrazione di indipendenza delle condizioni.

Il microbenchmark del confronto dei manifest viene eseguito dopo i processi
di verifica, con manifest già ricostruiti e uno/due/quattro worker. Metodo e
conteggi sono dichiarati in
[control-transizione-metodo](../../../docs/implementazione/control-transizione-metodo.md).
Non misura I/O, decoder o throughput del database. Le misure dell'heap sono
quelle del processo e non un certificato di assenza di allocazioni.

## Conservazione e limiti

Soltanto radici esplicite e produttori conclusi entrano nel catalogo. Copie,
cache e FASL ricostruibili vengono esclusi. Compressione senza perdita per
registri oltre 1 MiB; hash e byte originali conservati. Il raccoglitore è una
specializzazione testuale del metodo precedente, con gli stessi self-test.

Questa campagna non prova inventario o byte del vecchio ACTIVE, adozione
degli indici, admission gate, recovery multiserie completo, power loss,
MC/DC universale o chiusura della Fase 0.
