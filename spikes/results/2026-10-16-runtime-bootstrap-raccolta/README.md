# Chiusura della raccolta runtime Archivio

L'[archivio principale](../2026-10-16-runtime-bootstrap/report.md) è chiuso
dal collector comune: 1118 file indicizzati e 1120 file complessivi, inclusi
indice e catalogo. Sei record di comando, compreso il primo tentativo di
raccolta fallito per un protocollo C4 volutamente malformato.

`raccolta.lisp` è l'osservazione originale del secondo tentativo riuscito;
`closed-check.log` conserva il controllo indipendente dell'inventario.
`collection-process/` conserva il comando produttore con descriptor/payload
originali quando presenti. Il report principale non è stato modificato
dopo la chiusura.

`final-process/` conserva il controllo successivo di link e tracciabilità.
`copie.lisp` registra dimensioni e SHA256 dei byte copiati in questa raccolta
separata. È una ricevuta di copia, senza affermare un'autoverifica indipendente
del produttore o di questo stesso file. Cache e dati temporanei ricostruibili
sono esclusi; nessun nuovo benchmark o gate di rilascio chiuso.
