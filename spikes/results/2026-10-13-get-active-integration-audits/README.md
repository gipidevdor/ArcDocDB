# Conservazione dell'audit finale GET ACTIVE integrato

Questo sidecar conserva integralmente tre gruppi immutabili prodotti sulla
revisione `e8c88a4cdc697422eb05b0c6a7f79d0ec9480e26`:

- `raw/publication-audit/`: tutti i sette file della cartella dell'audit finale,
  inclusi strumento, contratto, versioni precedenti conservate come testo,
  rapporto R1 e stdout/stderr del wrapper.
- `raw/archive-audit-command/`: entrambi i file originali del comando nativo
  `4000913439-command-75858-0`, che registra l'audit finale.
- `raw/archive-collector-command/`: entrambi i file originali del comando nativo
  `4000912988-command-63343-0`, che registra la raccolta completa d'integrazione.

L'archivio principale è
[`2026-10-13-get-active-integration`](../2026-10-13-get-active-integration/README.md).
Il suo audit R1 verifica 1.005 entry indicizzate e tutte le rispettive sorgenti,
22 gruppi, cinque comandi, sette rapporti nativi, 930 FASL come bytes e quattro
gzip con confronto del contenuto espanso. L'audit è uscito con codice zero,
senza avvisi e con sorgenti stabili. L'archivio principale contiene anche
indice e catalogo, per 1.007 file complessivi, e resta immutato da questo sidecar.

`collection-manifest.lisp` descrive la selezione completa;
`collection-source.txt` conserva il collector effettivamente eseguito.
Il contratto e la copia dello strumento di verifica di questo sidecar sono
conservati rispettivamente in `sidecar-audit-contract.lisp` e
`sidecar-audit-source.txt`. Indice e catalogo sono metadati derivati.
I record dei nuovi comandi che raccolgono e verificano questo sidecar rimangono
esterni al sidecar stesso: non vengono aggiunti ricorsivamente all'archivio.

I rapporti sono dati, letti soltanto con `tools/evidence-storage.lisp`;
gli originali e i file compilati non sono caricati come codice. I metadati
native conservano argv, stdout, stderr, codice d'uscita e attribuzione alle
sorgenti, senza inferenze aggiuntive sui risultati del prodotto.
Questa raccolta verifica conservazione, inventari esatti e SHA256 delle copie.
Non dimostra prestazioni o MC/DC e non estende la qualifica del prodotto oltre
la campagna GET ACTIVE ordinario descritta nel metodo preregistrato.
