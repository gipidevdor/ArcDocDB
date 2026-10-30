# Rinnovo seriale M1 — prove del 2026-10-30

REQ-IDX-009, REQ-IDX-010; INV-I8, INV-I1, INV-A8, INV-P6;
[ADR-0068](../../../docs/adr/0068-rinnovo-seriale-immagini-m1.md).
MacOS ARM64, SBCL 2.6.9; motore M1 seriale, formati canonici v1/v2.

## Metodo e risultati dedicati

[Driver mirato](targeted.lisp): dieci casi selezionati per prefisso
TEST-REQ-IDX-010-RENEW-. Compilazione senza warning, API reali per produzione,
attivazione e recovery. Formati v1/v2 con pagine 4/16/64 KiB; delta pieno,
quote rinnovate ripetutamente, immagini precedenti chiuse e nuovo delta vuoto.
Frontiere, fonte e file canonici invariati attraverso il rinnovo; restart
con nuova immagine esplicita verificato. Default senza delta conserva il
ritiro alla prima scrittura.

Quota totale esatta e un byte insufficiente, sola quota del produttore
insufficiente, configurazioni invalide, nome occupato, ID immagine nullo
e wrong owner: rifiuti prima del nuovo file, senza mutare vista/delta/CSN.
Dodici callback controllano BUSY continuo e rifiutano GET/PUT/DELETE,
close e manutenzioni rientranti. Quattro uscite non locali verificano
FAULTED e ownership prima/dopo lo swap. Mutazioni separate di fonte e
revisione al callback fra le fasi impediscono l'attivazione. BUSY, READY
e salute del controller falsificati separatamente dopo pubblicazione.
Quota pagine esaurita tardi e stessa condizione IO-FAULT propagata
senza sostituzione della primaria verificati.

Chiavi con prefisso comune: massimi canonici 255 byte v1, 65535 byte v2.
DELETE e aggiornamento confluiscono nel nuovo derivato senza resurrezione.

Sei SIGKILL: v1/v2 alle fasi image-build-created, image-renewal-built e
image-published. Un processo fresco recupera PUT e DELETE committed dal
WAL, indipendentemente dallo swap volatile. L'immagine incompleta e'
rifiutata; quelle complete, anche non pubblicate prima del crash, sono
verificate sulla fonte corrente. Entrambi i derivati restano byte-identici
attraverso i riavvii.

[Driver allocazioni](allocation.lisp): cinque finestre da 10000 GET dopo
1000 warmup ciascuna. Immagine iniziale, delta pieno con chiave viva e
cancellata, immagine rinnovata con viva e assente: tutti gli esiti corretti,
zero byte Lisp allocati misurati. Oracolo di contenuto prima/dopo la finestra.
Chiavi 16 byte, valori 23, CSN piccoli. Nessuna misura di allocazioni della
manutenzione, RSS, latenza o throughput.

## Conservazione e verifica generale

Comandi riproducibili dalla root:

```
sbcl --noinform --no-userinit --no-sysinit --script spikes/results/2026-10-30-engine-image-renewal/targeted.lisp
sbcl --noinform --no-userinit --no-sysinit --script spikes/results/2026-10-30-engine-image-renewal/allocation.lisp
make check
```

[Registro dei test](targeted-run/report.lisp) e
[registro delle allocazioni](allocation-run/report.lisp): entrambi OK, exit 0,
SOURCE-CONSISTENCY STABLE. [Verifica generale make check](check-run/report.lisp):
OK, exit 0, SOURCE-CONSISTENCY STABLE. Compilazione senza warning, 65 test
del motore e 70 test delle pagine; lint (452 file, zero violazioni),
tracciabilita' (138 requisiti, 71 invarianti, 13 FI, 68 ADR), collegamenti,
full text, strumenti/evidenze, undici esperimenti e self-test CI superati.
I registri conservano comando, ambiente,
revisione di base, stato dirty e hash dei sorgenti prima/dopo, stdout/stderr.
I blob, insieme alla revisione di base, identificano i sorgenti verificati.

Conservati i fallimenti di fixture dei
[tentativo 2](attempt-2-v1-long-key-fixture.log.gz) e
[tentativo 3](attempt-3-v1-long-key-fixture.log.gz): nel test delle chiavi
lunghe erano usate dimensioni superiori al limite v1 di 255 byte.
Corretta la fixture ai massimi dei due formati prima dei record finali;
nessun cambiamento dei limiti del prodotto. Il giro iniziale di otto
casi era passato; il giro finale comprende dieci casi riusciti.

## Revisione e limiti

Due letture C1: fonte/revisione e ordine costruzione/verifica/swap; poi
payload dell'intera richiesta senza GC implicito, ownership/cleanup e
failure boundary. [Tabella delle decisioni](../../../docs/implementazione/rinnovo-indice-m1.md#decisioni-e-revisione-c1).
Nessun punto durevole nuovo, formato canonico o stato condiviso fra Serie.

La quota e' payload di array e non una qualifica del picco RSS: header,
oggetti, GC e runtime richiedono riserva separata. Il residente resta
interamente presente. Rinnovo richiesto esplicitamente dal controller,
nessuna scelta automatica, catalogo durevole, snapshot concorrente o
writer autonomo paginato. Vecchi file derivati non vengono eliminati.
SIGKILL non qualifica power loss; nessuna estensione implicita ad altri host.

Qualifica successiva del runtime locale:
[SBCL 2.6.10](../2026-10-30-sbcl-2.6.10/report.md), con verifica completa
e misura delle allocazioni conservate separatamente dalle prove 2.6.9.
