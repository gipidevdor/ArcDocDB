# Prove del delta seriale M1 — 2026-10-29

REQ-IDX-010, INV-I8, INV-I1, INV-A8, INV-P6;
[ADR-0067](../../../docs/adr/0067-delta-seriale-indice-m1.md).
MacOS ARM64, SBCL 2.6.9, attore M1 seriale; formati canonici v1/v2.

## Comandi e registri

- [Sette casi dedicati](targeted.lisp):
  `sbcl --noinform --no-userinit --no-sysinit --script spikes/results/2026-10-29-engine-image-delta/targeted.lisp`.
  [Record completo](targeted-run/report.lisp): OK, exit 0, SOURCE-CONSISTENCY STABLE.
- [Allocazioni](allocation.lisp): stesso comando con `allocation.lisp`.
  [Record completo](allocation-run/report.lisp): OK, exit 0, SOURCE-CONSISTENCY STABLE.
- Verifica generale `make check`: [record completo](check-run/report.lisp),
  OK, exit 0, SOURCE-CONSISTENCY STABLE. Compilazione senza warning, 55 test
  del motore, 70 test delle pagine, lint (451 file, zero violazioni),
  tracciabilita' (138 requisiti, 71 invarianti, 13 FI, 67 ADR), collegamenti,
  full text, strumenti/evidenze, undici esperimenti e self-test CI superati.

I record conservano comando, ambiente, revisione di base, stato dirty,
hash dei sorgenti prima/dopo, stdout/stderr e limiti. La revisione di base
da sola non identifica la modifica: fanno fede anche i blob conservati.

## Risultati dedicati

PUT, DELETE, cancellazione ripetuta, resurrezione, chiave originariamente
assente, vecchia immagine immutata, ricostruzione dalla fonte corrente e
sostituzione con delta vuoto: entrambi i formati e pagine 4/16/64 KiB.
Quote distinte per numero chiavi e byte, senza effetti su CSN/WAL/file
al rifiuto; stessa chiave aggiornabile a quota piena. Quote errate e
riserva vecchio+nuovo delta, rimpiazzo e disabilitazione verificati.

Collisioni di digest forzate con byte diversi, hash high/low diversi,
lunghezze diverse, span interno e tabella artificiale satura; le chiavi
caller vengono mutate dopo il PUT per verificare la copia posseduta.
Guardie BUSY, guasto interno nel preflight e uscite non locali prima/dopo
il commit e prima/dopo la pubblicazione verificano FAULTED e ownership.

Sei SIGKILL: v1/v2 per before-append, after-flush e after-commit di DELETE,
dopo un PUT gia' confermato con l'immagine ancora aperta. Un processo
nuovo ricostruisce il residente canonico: il PUT resta, la DELETE compare
solo dopo la frontiera durevole. Il derivato resta byte per byte identico.

Quattro finestre da 10000 GET dopo 1000 warmup: chiave aggiornata viva,
chiave cancellata, assente non toccata e viva intatta su immagine.
Tutte corrispondono all'oracolo, zero byte Lisp allocati misurati.
Una registrazione nuova e 10000 ripetute nella membership preallocata:
zero byte Lisp misurati. Chiavi 16 byte, valori 23, CSN piccoli;
nessuna misura di RSS, latenza, throughput o allocazione dell'intero PUT.

## Revisione e limiti

Due letture C1: identita' completa, tombstone, selezione per chiave e
ordine membership/SEAL; poi ownership, cleanup, riserva vecchio+nuovo,
sonde bounded e gestione degli errori. Decisioni nella
[tabella C1](../../../docs/implementazione/delta-indice-m1.md#decisioni-c1-e-verifica).

Conservato il [fallimento di compilazione del settimo test](attempt-2-test-parentheses.log.gz):
una parentesi finale in eccesso nel test, corretta prima dei record finali.
Il primo giro di sei test era riuscito; nessun fallimento occultato.

Il residente resta interamente allocato e ne restano le quote. Il delta
aggiunge memoria e non abilita un database maggiore della RAM. Nessuna
persistenza della membership, catalogo durevole, selezione automatica,
snapshot concorrente o backend writer interamente paginato. SIGKILL non
qualifica power loss. Le misure locali non qualificano altri runtime/host.
