# Produttore delle immagini M1 — 2026-10-29

Prova locale di correttezza, crash di processo e allocazione GET; non qualifica
oltre RAM, power loss, prestazioni del builder o RSS.

[ADR-0065](../../../docs/adr/0065-costruzione-immagini-dal-motore.md),
[contratto e decisioni](../../../docs/implementazione/costruzione-indice-m1.md).
Base Git `cb1992c`, working tree modificato: i manifest prima/dopo nei record
identificano i sorgenti effettivi, distinti dalla sola base Git.
REQ-IDX-009, REQ-IDX-010, INV-I8, INV-A8, INV-P6.

## Risultati registrati

`make check` completo: **OK**, exit 0, sorgenti **STABLE**. Build senza avvisi,
38 test motore, 70 test pagine e resto della suite di prodotto; lint, trace,
link, full text, evidenze, undici esperimenti e self-test CI superati.
[Registro completo](check-run/report.lisp),
[payload originale](check-run/report.lisp.gz),
[conservazione](check-run/conservazione.lisp).

| Comando | Esito | Originali |
|---|---|---|
| `sbcl --noinform --no-userinit --no-sysinit --script spikes/results/2026-10-29-engine-image-build/targeted.lisp` | OK, STABLE; 12 nuovi test motore, 6 casi SIGKILL v1/v2 e 70 test pagine | [targeted-run/report.lisp](targeted-run/report.lisp) |
| `sbcl --noinform --no-userinit --no-sysinit --script spikes/results/2026-10-29-engine-image-build/allocation.lisp` | OK, STABLE; 10000 GET residenti dopo build e 10000 GET paginati dopo riavvio, zero byte Lisp in entrambe le finestre | [allocation-run/report.lisp](allocation-run/report.lisp) |

I test producono i file attraverso l'API del motore, senza fixture che ne
sostituiscano il produttore end-to-end. Coprono v1/v2, pagine 4/16/64 KiB,
600 chiavi per tutte le taglie, fonte vuota/tombstone, chiave massima di 65535
byte, prefissi sbilanciati e directory multilivello, GET dopo riavvio e ritiro
su DELETE. Il builder puo' essere invocato anche mentre il GET usa un'altra
immagine verificata; il backend corrente non cambia. I file canonici e le
frontiere sono confrontati prima/dopo la preparazione.

Guardie di profondita', span e fonte vengono rifiutate separatamente; ordine
unsigned e permutazione confrontati con un oracolo u64 C4. Il ramo collisione
completa e' forzato soltanto nel piano privato del test: non e' una collisione
XXH64 reale. Il builder ricalcola i digest reali delle chiavi durante l'emissione.
Le guardie di memoria, nome occupato, ID, quota file/pagine, verifica esaurita,
rientro e revisione alterata verificano rifiuti/fail-stop e conservazione dei
file canonici. Due close fittizi entrambi falliti dimostrano tutti i tentativi
e l'aggregazione, con completamento vero/falso; una causa IO iniettata dal
callback resta la stessa condizione al confine.

Sei SIGKILL coprono file appena creato, pagine senza footer e dopo flush,
in v1 e v2. Ogni verifica viene eseguita in un nuovo processo. I candidati
incompleti sono rifiutati, quello completo viene usato dal GET paginato;
i byte del derivato restano identici al riavvio. E' comportamento locale di
processo/kernel, senza perdita di alimentazione simulata.

L'allocazione usa [allocation.lisp](allocation.lisp), fuori da SB-COVER:
preparazione e warmup (1000 GET per finestra) esclusi, GET completo su file
nativo, chiave 16 byte, valore 23 byte, CSN piccoli. Nessun numero di
throughput/latency, memoria del builder o RSS viene dedotto da questa misura.

## Revisione C1

Prima lettura: fonte del solo M1 append-only; cardinalita' entro geometria
prima degli array e corrispondente alla scansione; slot LIVE copiati una
volta nei metadati. Sort radix su otto byte, estremi unsigned per il prefisso
comune, almeno un bit consumato a livello, limite 65, overflow finito su
collisioni complete. Routing, PageRef precedenti e intera immagine verificati
prima del successo. Span delle chiavi copiati una sola volta per lotto.

Seconda lettura: preflight payload prima degli array/file, due capacita'
locali al massimo, O_EXCL, nessun FD accumulato sull'handle. Cleanup tenta
entrambi e conserva errori/nonlocal exit; fallimenti ammessi chiudono
admission. Revisione e fonte ricontrollate prima del footer e dopo verifica.
Nessuna modifica ai log canonici, CSN o backend e nessuna nuova pubblicazione
di catalogo. Nessun lock/stato condiviso fra Serie. Tabella COD-54 nel contratto.

## Diagnostiche intermedie

- [attempt-1-test-parentheses.log.gz](attempt-1-test-parentheses.log.gz): parentesi
  in eccesso nei nuovi test, corrette prima del run finale.
- [attempt-3-span-sentinel.log.gz](attempt-3-span-sentinel.log.gz): il test dello
  span aveva lasciato END=99 nel buffer sentinella, correttamente rifiutato
  dalla factory; impostato END=0 prima della chiamata valida.
- [attempt-1-lint.log.gz](attempt-1-lint.log.gz): nome locale LOAD vietato dalla
  regola COD-34, rinominato ENTRY-LIMIT.

Sono log diagnostici, non snapshot completi dei sorgenti intermedi. I record
strutturati finali conservano ambiente, comandi, output, hash e consistenza
prima/dopo dei sorgenti effettivamente verificati.

## Limiti

Il residente resta presente e ne resta la capienza. La quota applicativa
e' di payload array, non una garanzia RSS: oggetti, header, GC e transitori
richiedono riserva del controller e qualifica successiva. Ogni lotto controlla
la propria quota file/pagine; l'intera immagine non e' prenotata a monte.
Un fallimento tardivo lascia un preparato e M1 FAULTED. Nessuna cancellazione
automatica o sostituzione di un nome. Non sono implementati delta writer,
attivazione automatica, catalogo durevole, snapshot o migrazione oltre RAM.
