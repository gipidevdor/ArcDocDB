# Contribuire

ArcDocDB è in sviluppo. Le modifiche a codice, specifiche e prove seguono gli
stessi contratti di integrità e verificabilità.

## Ambiente

La CI usa **SBCL 2.6.9**, Linux x86-64 e macOS ARM64:
[toolchain e ricette esatte](.github/ci-toolchain.lock.lisp).
Per le verifiche locali servono anche `make`, Git, `gzip`, `shasum` e le utility POSIX.
La CLI GitHub `gh` serve per consultare e pubblicare i risultati CI.

Il prodotto usa Common Lisp e i contrib SBCL, senza dipendenze Lisp esterne.

## Flusso

1. Leggere [stato e limiti](docs/implementazione/README.md) e [regole del repository](docs/guida-al-repository.md).
2. Per cambiare un requisito o un formato, partire da un [ADR](docs/adr/README.md).
   Un ADR accettato si sostituisce con una nuova decisione.
3. Aggiornare nello stesso commit documenti, invarianti e verifiche interessati.
4. Per prove e misure usare il [registro delle prove](docs/valutazione/registro-delle-prove.md).

## Verifica

Prima di aprire una pull request:

```sh
make check
```

Compila senza avvisi, esegue test e controlli degli spike, verifica linter,
collegamenti, tracciabilità ed evidenze. `make spikes-bench` esegue le misure a parte.

Documentazione e termini di dominio sono in italiano; il README pubblico resta
in inglese. [Standard di codifica](docs/affidabilita/standard-di-codifica.md) ·
[Glossario](docs/glossario.md) · [Linguaggio visivo](assets/README.md) · [Sicurezza](SECURITY.md).
