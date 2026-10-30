# Scoperta readonly delle immagini M1 — prove del 2026-10-30

REQ-IDX-010, REQ-REC-001; INV-I8, INV-A8, INV-P6;
[ADR-0070](../../../docs/adr/0070-scoperta-readonly-immagini-m1.md).
MacOS ARM64, SBCL 2.6.10 locale; formati canonici v1/v2.

## Metodo e registri dedicati

[Driver mirato](targeted.lisp):
`sbcl --noinform --no-userinit --no-sysinit --script spikes/results/2026-10-30-engine-image-discovery/targeted.lisp`.
Dodici casi, [record completo finale](targeted-final/report.lisp) OK, exit 0,
SOURCE-CONSISTENCY STABLE. [Driver allocazioni](allocation.lisp): stesso
comando con `allocation.lisp`; [record finale](allocation-final/report.lisp) OK,
exit 0, SOURCE-CONSISTENCY STABLE.

I registri conservano comando, ambiente, revisione di base, stato dirty,
blob dei sorgenti prima/dopo, stdout/stderr e limiti. Revisione e blob
insieme identificano i sorgenti, senza attribuire prove al solo commit di base.
`make check` non e' interamente superato: vedere la verifica isolata e il limite documentale sotto.

## Risultati mirati

- Domini e budget del profilo, estremi, quota esatta/un byte insufficiente,
  nome candidato, alternative CREATE/esplicita/scoperta prima di aprire la directory.
- Formati v1/v2 e pagine 4/16/64 KiB; ordine di creazione diverso dall'ordine
  delle etichette, massimo corrente scelto, GET corretti e FD ritirato alla
  prima scrittura. Dopo la scrittura tutti i vecchi footer sono obsoleti e
  lo startup riparte dal residente canonico.
- Nessun candidato, incompleti vuoti/non allineati, CRC errato, profilo diverso,
  file estranei preservati. File sparso oltre il massimo del formato: un solo
  byte scritto, nessuna lettura o vettore per il payload logico enorme.
- Etichetta alta obsoleta e bassa corrente; footer con CRC riparato ma archive,
  serie, CSN, conteggio, seed high/low o token diversi non eleggibili.
- Candidato scelto corrotto: dati, versione, flags, root, magic e padding.
  Anche una entry con CSN sbagliato e CRC di pagina riparato rifiuta lo
  startup per confronto col canonico; nessun ripiego sull'altra immagine sana.
- Limiti nomi/candidati e max-visits esaurito: nessuna scelta parziale e
  FD nativi ripristinati. Symlink e guasti non sono considerati assenza.
- Callback non rientranti e uscite non locali alle quattro frontiere di
  ricerca/adozione: FAULTED, FD e lock rilasciati. Fonte/revisione/stato
  modificati dopo la ricerca impediscono l'adozione.
- Stato, salute controller, revisione e fonte falsificati separatamente prima
  della pubblicazione, dopo l'immagine pronta e dopo before-admission;
  percorsi scoperta/esplicito e residente inclusi. Nessun handle READY
  restituito dopo una mutazione rilevata, nessun FD nativo perso.
- Segmento canonico corrotto: recovery fallisce prima della ricerca, anche
  con un derivato completo. La scoperta non aggira la fonte autorevole.

Sei SIGKILL, v1/v2 nelle fasi index-image-candidate, index-image-discovered
e index-image-ready. Un processo nuovo esegue recovery e ricerca, sceglie
il candidato corrente previsto e legge dati/frontiere esatti. Entrambi i
file derivati restano byte-identici attraverso i riavvii.

Due finestre da 10000 GET dopo 1000 warmup, una viva e una assente:
10000 esiti corretti per finestra, zero byte Lisp allocati misurati.
Chiavi 16 byte, valori 23, CSN piccoli. Non si misura allocazione dello
startup, RSS, throughput, latenza o allocazioni native.

## Revisione C1 e limiti

Due letture: fonte canonica, priorita' deterministica e doppio gate prima
dell'adozione; poi payload con stringhe fino a quattro byte, inventari,
limiti, FD, callback e failure boundary fino a READY.
[Tabella delle decisioni](../../../docs/implementazione/scoperta-indice-m1.md#decisioni-e-revisione-c1).
Nessun formato canonico, record di scelta, rename o nuovo lock fra Serie.

Un CRC footer errato rende un hint ineligibile: questo puo' includere bitrot
di un vecchio derivato, non soltanto file incompleti. Non e' un audit dei
file abbandonati. Con profilo idoneo, errori strutturali a CRC valido o
formato ignoto propagano; la verifica integrale del prescelto e' obbligatoria.
La fonte canonica viene sempre recuperata e verificata per prima.

Restano i limiti canonici di startup e il residente interamente in RAM.
La quota di scoperta non copre oggetti/header, GC/RSS, canonico e scratch
principali; il controller deve riservarli separatamente. Delta non configurato
implicitamente; niente catalogo durevole, rimozione automatica, selezione
residente/paginato in base alla RAM, snapshot concorrenti o writer paginato
autonomo. SIGKILL non qualifica power loss o altre piattaforme.

Tentativo completo [non attribuibile a sorgenti stabili](attempt-1-sources-changed/report.lisp):
comando interno exit 0, registratore SOURCE-CHANGED. [Differenze osservate](source-delta.log):
README pubblico, guida del repository e README assets sono cambiati durante
l'esecuzione per una riorganizzazione parallela dei documenti. Nessun sorgente
Lisp o test e' cambiato in quel tentativo. La verifica viene ripetuta sullo
stato finale; e' stata inoltre isolata la sola comparazione delle etichette
per provare esplicitamente ordine maggiore/minore/uguale indipendentemente
dall'ordine di enumerazione del filesystem. Le modifiche parallele restano intatte.

Verifiche dedicate completate prima delle ulteriori traduzioni parallele: [test finali 2.6.10](targeted-final/report.lisp)
e [allocazioni finali 2.6.10](allocation-final/report.lisp), OK, exit 0,
SOURCE-CONSISTENCY STABLE. Conservate anche le prove iniziali positive
([test](targeted-run/report.lisp), [allocazioni](allocation-run/report.lisp))
relative ai blob indicati nei rispettivi registri, prima dell'isolamento
strumentabile della priorita' delle etichette.

Compatibilita' locale del nuovo incremento su SBCL 2.6.9, versione della CI:
[test mirati](sbcl-2.6.9-targeted/report.lisp) e
[allocazioni](sbcl-2.6.9-allocation/report.lisp), entrambi OK, exit 0,
SOURCE-CONSISTENCY STABLE. Dodici casi e due finestre GET da 10000 chiamate,
zero byte Lisp misurati. Non e' una nuova esecuzione della CI remota.

Secondo tentativo [con stato Git/documenti mutati](attempt-2-concurrent-git-state/report.lisp):
83 test motore e controlli completati, ma il wrapper del self-test CI ha segnalato
SOURCE-CHANGED nonostante exit 0 del programma interno; la guida del repository
e' stata tradotta durante quel self-test. [Record CI originale](attempt-2-concurrent-git-state/ci-selftest/report.lisp).
Nessuna modifica parallela ai sorgenti Lisp del motore. Questi tentativi non
vengono presentati come qualifica finale a sorgenti stabili.

Individuato anche un falso positivo indipendente del registratore: Git emette
percorsi tracked/untracked in gruppi diversi. Una promozione all'indice puo'
riordinare lo stesso insieme di path/hash. Una fixture Git reale riproduce il
[fallimento prima della correzione](recorder-before-fix-failure.log.gz);
[sorgente con la regressione aggiunta e ordinamento ancora vecchio](recorder-before-order-fix.lisp.gz).
La correzione ordina soltanto i path prima dello snapshot, senza scartare alcun
hash o sorgente. Il self-test verifica promozione invariata, contenuto cambiato,
rimozione e aggiunta, ed e' incluso in make check-core.


## Final isolated validation

A temporary clone received an exact copy of all 1499 source paths, including
uncommitted changes. The frozen copy remained byte-identical throughout the
checks; [equivalence receipt](snapshot-equivalence.lisp). Product sources,
tests, data, Makefile and ASDF definition still match the working repository.
Parallel changes affect documentation and the traceability renderer
`tools/check-trace.lisp`; those changes are preserved and are not qualified by
this frozen snapshot.

[Recorded make check](isolated-check-run/report.lisp), SBCL 2.6.9 on macOS ARM64:
SOURCE-CONSISTENCY STABLE, but status FAILED because four document anchors were
missing in that snapshot. Before the link failure, the strict build and all
suites passed, including 83 production-engine tests and 70 paginated-index tests;
455 source files had zero lint violations. Recorder regression: four cases
passed. Traceability: 138 requirements, 71 invariants, 13 FI scenarios, 70 ADRs,
zero errors. No successful complete make-check claim is made.

The remaining targets ran separately on the same unchanged snapshot:
`make fulltext-check evidence-selftest evidence spikes-check ci-selftest`, exit 0.
[Continuation descriptor](isolated-check-run/remaining-checks.lisp) and
[compressed raw log](isolated-check-run/remaining-checks.log.gz) retain the scope
and source-comparison limits; this continuation is not a standard C4 wrapper.
[Eleven experiment checks](isolated-check-run/spikes/report.lisp) and
[recorded CI self-test](isolated-check-run/ci-selftest/report.lisp) are preserved.
The latter is OK, exit 0, SOURCE-CONSISTENCY STABLE; it is not remote CI.

The subsequent [working-copy link check](live-document-links.log.gz) still
failed during active document translation (51 broken anchors at that instant).
Document validation remains open. The dedicated new engine tests and allocation
measurements passed on both SBCL 2.6.10 and the pinned CI version 2.6.9 as above.

Temporary validation checkout and its private ASDF cache were removed after
archiving the results. Regenerable fixtures from the two earlier complete
attempts were also removed (about 80 MiB); their complete records remain here.
No derived database image or parallel document edit was removed.
