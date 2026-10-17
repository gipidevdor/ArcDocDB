# Raccolta delle fonti recovery

Il collector comune ha copiato 343 input espliciti con quattro worker e
verificato l'inventario chiuso dell'[archivio principale](../2026-10-17-recovery-sources/report.md).
Sono presenti 345 file indicizzati e 347 file effettivi, con i due metadati finali.
`collection.lisp` e `closed-check.log` sono gli originali copiati byte per byte;
`copies.lisp` registra dimensioni e SHA-256. Nessuna modifica all'archivio chiuso.
La ricevuta di copia non costituisce una seconda revisione C1 indipendente.

Il primo controllo del catalogo supplementare era privo della directory
temporanea richiesta dal modo worker: esito fallito conservato in
`catalog-check-first.log`. Creata la directory, il controllo finale è OK
(`catalog-check-final.log`). Trace e link finali sono conservati separatamente:
135 requisiti, 69 invarianti, 13 FI, 55 ADR e 3.908 link senza errori.
