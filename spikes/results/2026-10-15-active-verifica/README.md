# Recovery ACTIVE — metodo preregistrato, 2026-10-15

Ambito: `src/recovery-active/`, contratti di
[`active-recuperato.md`](../../../docs/implementazione/active-recuperato.md),
REQ-REC-001, REQ-TXM-007, REQ-AFF-008/009 e pubblicazione CONTROL delegata.

Prima delle esecuzioni si congelano prodotto, test, strumenti e documenti
ordinari e si chiudono gli agenti che scrivono. Correzioni successive producono
una variante distinta; i fallimenti originali restano conservati.

## Prove

- Lettura: v1/v2, EOF completo e coda, header writer, identità fisica,
  short read, chunk, budget e propagazione delle condizioni originali.
- Semantica: preparati per lotto, OUTCOME duplicati, tabella DECISION
  autorevole, CSN zero e u64 completo, partizione locale/derivato/abort,
  ordine e serializzazione CLOSED. Oracoli bytewise e CRC bitwise dei test,
  indipendenti dagli encoder di prodotto.
- File reali: vecchio CONTROL e ACTIVE readonly, nuovo checkpoint ottenuto
  dalle factory, rifiuti prima del claim, rename e fsync della directory.
  Byte, frontiere e namespace osservati prima e dopo. Nessuna prova di power loss.
- `make check`: regressione completa del repository e controlli strutturali.
- `foundation-coverage`: otto file espliciti, hit azzerate dopo il caricamento
  e prima della sola suite ACTIVE; forme e rami, **non MC/DC**.
- Due letture statiche con checklist C1; nessuna promozione automatica
  dei gate C1, Recovery Manager o motore completo.

La richiesta successiva dell'autore include le forme residue della
campagna CONTROL: due test privati mirati e un nuovo report dei medesimi
quattro file conservano il confronto senza alterare l'evidenza precedente.

## Misure separate

Il [metodo](../../../docs/implementazione/active-recuperato-metodo.md)
specifica 18 finestre: due formati, uno/due/quattro worker, tre repliche.
Sono misure di apertura su backend in memoria con capacità e scratch privati.
Costruzione delle fixture e warmup precedono il clock; startup, gate, join,
controlli dell'oracolo e allocazioni del processo sono dichiarati.
Non misurano disco, latenza di GET, throughput del DB o assenza di allocazioni.

Le misure iniziano soltanto dopo la chiusura delle nostre altre esecuzioni
pesanti. Il carico esterno della macchina non è controllato.

## Registrazione e conservazione

Ogni esecuzione, anche fallita, passa da `tools/record-command.lisp`.
`tools/get-series-capture.lisp` lega helper e raw allo stdout del produttore
chiuso. Il collector deriva dalla campagna CONTROL precedente; il suo
self-test controlla selezione esplicita, copie, digest e rifiuto di alterazioni.
Nessuna glob seleziona prove di altri lavori.

Si conservano argv, ambiente, sorgenti prima/dopo, output originali, inventari
e risultati. Registri grandi compressi senza perdita; FASL e cache ricostruibili
non entrano in Git. I risultati e i limiti effettivi sono nel `report.md`.
