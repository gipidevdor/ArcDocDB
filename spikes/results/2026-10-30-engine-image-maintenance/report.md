# Manutenzione a soglie M1 — prove del 2026-10-30

REQ-IDX-010, REQ-LIM-003; INV-I8, INV-I1, INV-A8, INV-P6;
[ADR-0069](../../../docs/adr/0069-manutenzione-a-soglie-delta-m1.md).
MacOS ARM64, [SBCL 2.6.10 locale](../2026-10-30-sbcl-2.6.10/report.md).

## Comandi e registri

[Sei casi dedicati](targeted.lisp):
`sbcl --noinform --no-userinit --no-sysinit --script spikes/results/2026-10-30-engine-image-maintenance/targeted.lisp`.
[Record completo](targeted-run/report.lisp): OK, exit 0, SOURCE-CONSISTENCY STABLE.
[Driver allocazioni](allocation.lisp): stesso comando con `allocation.lisp`;
[record completo](allocation-run/report.lisp), OK, exit 0, SOURCE-CONSISTENCY STABLE.

[Verifica generale make check](check-run/report.lisp) su SBCL 2.6.10:
OK, exit 0, SOURCE-CONSISTENCY STABLE. Compilazione senza warning, 71 test
motore e 70 test pagine; lint (453 file), tracciabilita' (69 ADR), link,
full text, strumenti/evidenze, undici esperimenti e self-test CI superati.
I registri conservano
comando, ambiente, revisione di base, stato dirty, blob dei sorgenti prima/dopo,
stdout/stderr. Revisione e blob insieme identificano il codice verificato.

## Risultati dedicati

Policy: domini errati, soglie 1/75/99/100, quota tre senza troncamento,
uguaglianza e byte adiacente, quote massime. Le fixture numeriche manipolano
solo i contatori e non pretendono una prova di lookup o membership.

Motori reali: v1/v2, pagine 4/16/64 KiB, soglia chiavi indipendente da quella
byte, no-op con candidato non consumato e file byte-identici, poi rinnovo
con chiusura del vecchio FD e delta vuoto con le stesse quote. Fonte,
frontiere CSN e file canonici invariati; valori aggiornati e tombstone corretti.
Un candidato gia' esistente e' ignorato nel no-op, rifiutato se il rinnovo
lo richiede. Quota totale insufficiente conserva READY, root e delta;
quota esatta permette il rinnovo.

Guardie di modo, assenza di delta, configurazione invalida anche nel no-op,
wrong owner, contatori oltre quota, meno byte che chiavi, stato vuoto
incoerente e delta senza vista. I guasti interni rendono FAULTED. Callback
rientranti rifiutati e uscite non locali prima/dopo swap mantengono le
regole di ownership del rinnovo. Stessa policy readonly su due motori:
nessuna mutazione reciproca dei dati, dei contatori o dei file.

Tre finestre da 10000 chiamate dopo 1000 warmup: sonda readonly, manutenzione
sotto soglia e GET assente su nuova immagine. Tutti gli esiti corrispondono
all'oracolo, zero byte Lisp allocati misurati. Chiavi 16 byte, valori 23,
CSN piccoli; nessuna misura del rinnovo, RSS, latenza o throughput.
Non sono introdotti nuovi punti I/O o crash: le prove SIGKILL del rinnovo
restano nella suite generale e nel relativo registro.

## Revisione e limiti

Due letture C1: soglie inclusive, indipendenza chiavi/byte e fonte canonica;
poi prodotti fixnum, domini, no-op, failure boundary, ownership delegata e
isolamento fra Serie. [Tabella delle decisioni](../../../docs/implementazione/manutenzione-indice-m1.md#decisioni-e-revisione-c1).
Nessun nuovo formato, punto durevole, ciclo non limitato o stato globale mutabile.

Il controller deve invocare la manutenzione e fornire un candidato fresco
quando serve; nessun timer o controllo automatico nel PUT/GET. La sonda non
prenota la prossima chiave e non sostituisce il preflight delle scritture.
Il residente resta interamente presente; nessuna qualifica di selezione
automatica del modo, catalogo durevole o writer autonomo paginato.
Vecchi derivati restano sul disco; SIGKILL non qualifica power loss.

Compatibilita' locale con SBCL 2.6.9, versione ancora bloccata nella CI:
[sei casi dedicati](sbcl-2.6.9-targeted/report.lisp) e
[tre finestre allocazioni](sbcl-2.6.9-allocation/report.lisp), entrambi OK, exit 0,
SOURCE-CONSISTENCY STABLE. Tutte le finestre da 10000 chiamate allocano zero
byte Lisp misurati. Non e' una nuova esecuzione della CI remota o una
qualifica generale di tutte le piattaforme 2.6.9.
