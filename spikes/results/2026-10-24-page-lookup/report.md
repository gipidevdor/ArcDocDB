# Lettura dell'indice paginato: directory, bucket e chiavi

2026-10-24, macOS ARM64, SBCL 2.6.9. [Contratto e limiti](../../../docs/implementazione/lettura-indice-paginato.md).
Incremento seriale del reader: nessun builder, pubblicazione root, writer,
recovery paginato o migrazione automatica ancora collegato al motore M1.

## Verifica funzionale

[Record della suite](targeted-run/report.lisp), [conservazione](targeted-run/conservazione.lisp):
39 test pagine superati, inclusi 14 nuovi rispetto al primo incremento cache.
Nessuna promozione automatica dei requisiti complessivi.

Fixture manuali indipendenti dal writer prodotto, tre taglie, venti chiavi
con digest completamente identico, directory multilivello, bucket overflow,
EMPTY prima del candidato nello stesso gruppo, chiave massima e cache di un
frame. Differenziale con il residente su sei collisioni, normalizzando
l'offset arena privato; assenza verificata su output sentinella. Verificati
budget esatti/insufficienti, ownership, rientro, nonlocal exit e I/O/CRC errati.
Corruzioni fra pagine singolarmente valide: radix sovrapposti, tipo pagina
incoerente, totale/posizione delle chiavi esterne. CSN low-only e high-only,
digest diversi e alias degli scratch verificati separatamente.

## Allocazioni

[Script riproducibile](allocation.lisp), [record completo](allocation-run/report.lisp),
[conservazione](allocation-run/conservazione.lisp). Ogni finestra segue 100 lookup
di warmup; risultati LIVE controllati e CSN/location con bit alti impostati.

| Finestra | Lookup | LIVE | Byte Lisp allocati |
|---|---:|---:|---:|
| Chiave inline, pagina in cache | 10000 | 10000 | 0 |
| Directory e bucket, un solo frame | 1000 | 1000 | 0 |
| Chiave esterna 65535 byte, un solo frame | 100 | 100 | 0 |

Contatore SBCL GET-BYTES-CONSED; nessuna inferenza su RSS, allocazioni native,
GC, latenza, concorrenza, dataset maggiore della RAM o prestazioni del motore.
I record conservano ambiente, comando, sorgenti e hash prima/dopo. Non sono
campagne SB-COVER o MC/DC; nessuna misura di throughput.

## Tentativi precedenti conservati

- [Primo tentativo](attempt-1-read-error.log.gz): compilazione interrotta per
  parentesi mancante nella funzione di sondaggio; corretta prima delle prove.
- [Secondo tentativo](attempt-2-key-fixture.log.gz): oracolo della fixture
  interpretava erroneamente la factory `bytes(size, value)` come lista di
  byte; introdotta una factory di chiavi esplicita.
- [Terzo tentativo](attempt-3-resident-budget.log.gz): venti collisioni
  superavano gli otto campioni del residente. Il differenziale usa sei
  collisioni e non interpreta RETRY-LIMIT come assenza; venti collisioni
  restano verificate separatamente nel paginato.

I fallimenti non sono nascosti o contati come casi superati. La successiva
suite completa usa gli stessi sorgenti dei record conclusivi.

## Verifica complessiva

`make check`: esito `:OK`, codice 0, sorgenti stabili prima/dopo.
[Record completo](check-run/report.lisp) e [conservazione](check-run/conservazione.lisp),
con eventuali payload compressi nella stessa directory. Include compilazione
senza warning/style-warning, tutte le suite prodotto, SIGKILL/recovery v1/v2,
client/server locale, lint, tracciabilita', collegamenti, full text, autotest
delle evidenze, undici spike e autotest CI. Il risultato non qualifica ancora
il backend paginato completo o la sua integrazione nel motore.
