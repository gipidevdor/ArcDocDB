# Raccolta delle prove CLOSED

2026-10-16. Il [collector comune](../../../docs/implementazione/raccolta-comandi.md)
ha raccolto l'[archivio CLOSED](../2026-10-16-closed-verifica/report.md)
con quattro worker e controllo indipendente concluso con exit code 0.
84 file indicizzati, 86 effettivi, 4.539.676 byte indicizzati; 13 record
originali con esiti e sorgenti stabili, inclusi quattro comandi falliti.
La chiusura verifica conservazione e inventario, senza promuovere gli esiti.

- [Processo produttore](collection-process/report.lisp), originale concluso.
- [Osservazioni del collector](raccolta.lisp), copia bytewise.
- [Output del verificatore indipendente](closed-check.log), copia bytewise.

Il processo del controllo finale dei link viene conservato in
`final-process/report.lisp` dopo la sua chiusura. Il catalogo e la ricevuta
`copie.lisp` descrivono questa raccolta esterna: gli originali restano
immutati, con i payload gzip accanto ai descriptor. La ricevuta è un
inventario SHA256 delle copie, senza attestazione indipendente di sé.
Questa directory resta separata dall'archivio CLOSED già chiuso.
Nessuna attestazione C1/MC/DC o prestazionale.
