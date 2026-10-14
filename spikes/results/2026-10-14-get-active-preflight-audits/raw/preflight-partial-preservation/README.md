# Copie parziali R2: conservazione opaca

`manifest-R2.lisp` descrive due flussi USTAR **parziali, non qualificati**:
`mutation` in 8 parti gzip e `bootstrap` in 7 parti. Ciascuna espansione
misura al massimo 4 MiB; ogni payload gzip resta sotto 8 MiB. Le parti,
nell'ordine indicato da indice e offset, ricostruiscono il TAR originale.
Il manifest conserva SHA di parti compresse/espansioni e SHA nativo del TAR.

La conservazione verifica elenco canonico di file e directory, byte e SHA
prima/dopo e sugli estratti temporanei. Non interpreta report incompleti,
sorgenti o FASL. Gli estratti R2 verificati sono stati rimossi; gli originali
non sono stati modificati. Il controllo dell'espansione riguarda gzip
prodotti dall'helper, con dimensione verificata dopo la decompressione.

`completion.lisp` identifica tutte le esecuzioni, comprese quelle fallite.
R1 supera il limite del singolo gzip; la sua copia da 11.700.087 byte è
conservata **fuori da questo gruppo**, in staging R1 per il backup finale
integrale del worktree. Il primo spostamento fallisce prima del rename per
un pathname relativo; il successivo usa pathname assoluti e conserva
SHA, dimensione, device e inode. Fonti e log dei tentativi restano qui.
