# Lavorare nel repository

[Contribuire](../CONTRIBUTING.md) · [Implementazione](implementazione/README.md)

## Fonti e stato

La [gerarchia delle fonti e le convenzioni normative](riferimenti.md#convenzioni)
stabiliscono come leggere specifica, ADR, invarianti e documenti tematici.
Gli identificativi sono stabili: si ritirano, senza rinumerarli o cancellarne la storia.

L'[implementazione](implementazione/README.md) descrive il profilo M1 disponibile;
la [roadmap](roadmap.md) conserva i criteri di uscita delle fasi. Una componente
implementata o una misura locale non chiude da sola un gate.

## Regole

- **Solo Common Lisp/SBCL**, anche negli spike; contrib ammessi, nessuna dipendenza
  esterna: [ADR-0001](adr/0001-common-lisp-sbcl.md), [ADR-0027](adr/0027-dipendenze-e-test.md).
- **Integrità prima delle prestazioni.** Ordine, modello dei guasti e garanzie
  dichiarabili seguono [ADR-0031](adr/0031-software-critico-criteri-e-priorita.md)
  e il [caso di affidabilità](affidabilita/README.md).
- **Standard obbligatorio:** safety almeno 2, nessun warning o style-warning,
  nessun `ignore-errors`, `truly-the` o `eval`;
  [regole e controlli](affidabilita/standard-di-codifica.md). Le deviazioni richiedono
  registrazione e approvazione nel [registro](affidabilita/deviazioni.md).
- **Parallelismo e atomicità:** le Serie non si attendono tra loro;
  nessuna nuova coordinazione condivisa senza ADR;
  un punto di atomicità per operazione, preparare/decidere/completare, recovery
  senza troncamenti o eliminazioni per assenza. Valgono le
  [leggi di progetto](adr/0036-leggi-di-progetto.md) e gli [invarianti](invarianti.md).
- **Garanzie motivate:** nessun argomento probabilistico o temporale come garanzia.
  Per concorrenza e progresso indicare il perimetro effettivamente dimostrato:
  [ADR-0032](adr/0032-seqlock-a-64-bit.md), [indice paginato](adr/0058-pagine-indice-primario.md).
- **Tracciabilità:** requisiti in `tracciabilita/requisiti.lisp`, riferimenti `;;; REQ:`
  nel codice e ID nei test. Dopo una modifica pertinente eseguire `make trace-write`
  e `make trace`; la [matrice](tracciabilita/matrice.md) è generata.
- **Prove riproducibili:** registrare comando, ambiente, revisione, hash dei sorgenti,
  parametri, risultati, limiti e fallimenti secondo il
  [registro delle prove](valutazione/registro-delle-prove.md).
  Nel repository pubblicare sintesi e hash; i raw voluminosi seguono la
  [conservazione esterna](../spikes/evidence/README.md).

## Dove intervenire

| Percorso | Contenuto |
|---|---|
| `src/`, `tests/` | Prodotto e verifiche dei contratti |
| `tools/` | Strumenti C4 in Common Lisp |
| `spikes/` | Esperimenti usa-e-getta, con domanda, metodo e comandi |
| `docs/` | Specifiche, decisioni, implementazione, valutazione |

Una modifica di requisito parte dalla specifica o da un ADR che la emenda e si
propaga nello stesso commit a invarianti e documenti. Un ADR accettato resta
immutato; una questione risolta conserva il riferimento alla decisione.

Si scrive una volta sola con la soluzione migliore nota: valgono i
[principi di ingegneria](principi-di-ingegneria.md). Prima della pubblicazione
si esegue `make check`, come indicato in [Contribuire](../CONTRIBUTING.md).
