# Raccolta delle prove Archivio CSN

2026-10-16. Il [collector comune](../../../docs/implementazione/raccolta-comandi.md)
ha raccolto l'[archivio del piano CSN](../2026-10-16-archivio-csn-verifica/report.md)
su quattro worker, con hash prima/dopo e controllo indipendente concluso
con exit code 0. Conserva sette record originali, compreso il tentativo
diagnostico fallito; la chiusura non promuove gli esiti dei comandi.

- [Processo produttore](collection-process/report.lisp), originale concluso.
- [Osservazioni del collector](raccolta.lisp), copia bytewise.
- [Output del verificatore indipendente](closed-check.log), copia bytewise.

Il processo del controllo finale dei link e della tracciabilità viene
conservato in `final-process/report.lisp` dopo la sua chiusura.
Il catalogo e `copie.lisp` descrivono questa raccolta esterna: gli originali
rimangono immutati e i payload gzip accanto ai descriptor. La ricevuta è
un inventario SHA256 delle copie, senza attestazione indipendente di sé.
Questa directory rimane separata dall'archivio già chiuso.
Nessuna qualifica C1/MC/DC o attestazione prestazionale.
