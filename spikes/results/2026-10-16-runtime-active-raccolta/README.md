# Raccolta delle prove di adozione ACTIVE — 2026-10-16

L'[archivio principale](../2026-10-16-runtime-active/report.md) è chiuso:
65 file indicizzati, 67 file effettivi, 3.381.559 byte indicizzati;
otto comandi originali, inclusi due fallimenti conservati.

- [Osservazioni della raccolta](raccolta.lisp): quattro worker, hash e rilettura.
- [Controllo indipendente chiuso](closed-check.log): esito OK, inventario esatto.
- [Comando produttore originale](collection-process/report.lisp): esito OK.

Il controllo finale di link e tracciabilità viene conservato in
`final-process/report.lisp`; `copie.lisp` registra dimensioni e SHA-256
delle copie da sorgenti già chiuse. La ricevuta stessa è esterna al suo
insieme di copie e non costituisce un audit indipendente di se stessa.
Nessun append nell'archivio principale dopo il controllo indipendente.

Le evidenze attestano questa campagna locale. COD-24 complessivo,
ammissione, C1/MC/DC e prestazioni del motore restano aperti.
