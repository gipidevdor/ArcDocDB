# Conservazione degli audit della verifica locale finale

Questo sidecar accompagna la
[raccolta finale GET ACTIVE](../2026-10-13-get-active-final/README.md)
sulla revisione congelata `ae4022fb66914c53a8f9fba69298e88ce2a35d98`.
Conserva quattro gruppi completi e immutabili: il piano di pubblicazione
con collector, manifesto, contratto, README e stdout/stderr esterni;
la cartella dell'auditor con fonte, rapporto e stdout/stderr esterni;
il gruppo nativo del collector e quello nativo dell'auditor.
Non modifica né aggiunge file all'archivio principale.

Il collector nativo `4000915508-command-29897-0` passa con exit zero,
sorgenti stabili e nessuno stderr. Conserva 411 entry indicizzate, più indice
e catalogo: 413 file fisici, 20 gruppi, quattro comandi, 356 FASL come dati
e due payload gzip. Le entry occupano 13.232.286 byte.
L'indice principale ha SHA256
`f3757a3f3741b95a13ddbdbf82801ac44eccfcfba31b734dc60c7bb2fac10a73`.

L'auditor nativo `4000915641-command-34003-0` passa con exit zero,
sorgenti stabili e nessuno stderr. Il suo rapporto è conservato in
`raw/publication-audit/archive-audit-R1.lisp`, SHA256
`021b25c57c55c51861032ef8a3098317da591b64d54dd6225b0d8ba89c29e48c`.
Verifica tutte le 411 entry e le 411 sorgenti ancora disponibili, i 20
inventari completi, quattro comandi e tre rapporti nativi. Confronta
dimensioni e SHA256 di originali e copie, il contenuto espanso dei gzip,
gli inventari esatti e un secondo passaggio dei bytes. HEAD, indice,
catalogo, manifesto, contratto, lettore e fonte dell'auditor restano stabili.

L'archivio principale conserva lo stderr del compilatore di 645.763 byte,
composto da NOTE; il suo stderr non viene dichiarato vuoto. Gli esiti dei
due audit locali rimangono nei rispettivi stdout nativi. R1 usa la fonte
`160db6c8`; R2 usa `2e21d354` e aggiunge il confronto canonico esatto del
mapping ASDF. Entrambi riportano 1.125 test, 29 suite, due smoke check,
807 sorgenti, 314 FASL core e quattro errori attesi delle fixture. Questi
rapporti si leggono come un solo dato seguito da EOF, con READ-EVAL disabilitato.

Il collector eseguito è conservato byte per byte; SHA256
`64724e5e99686930aeac8b39664274f6e665b4acb56ea87a7d4e62f1fa0ee79d`.
L'auditor delle copie, riusato anche per questo sidecar, ha SHA256
`b4c7af36c501647ecdca81b0a9ac314ed76d8c8bd6f8f5d50a5d1c6c411a46d9`.
Soltanto `tools/evidence-storage.lisp` viene caricato come lettore fidato;
le altre prove e i FASL rimangono dati. Indice e catalogo sono metadati
derivati e non inferiscono risultati dai nomi dei gruppi.

I nuovi comandi che raccolgono e verificano questo sidecar restano esterni,
con argv, stdout/stderr ed esito nativi, per evitare raccolte ricorsive.
Gli esiti descrivono verifiche locali e conservazione delle prove; non sono
esiti CI, una riattribuzione delle coperture precedenti, misure di prestazioni,
copertura MC/DC o qualifica C1.
