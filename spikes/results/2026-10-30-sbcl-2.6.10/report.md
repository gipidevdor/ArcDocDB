# SBCL 2.6.10 sul Mac — 2026-10-30

Installazione ARM64 da [release ufficiale](https://www.sbcl.org/news.html#2.6.10),
compilata con SBCL 2.6.9 e Apple clang; thread abilitati, core non compresso,
contrib inclusi. Homebrew offre ancora 2.6.9: installazione locale versionata,
selezionata tramite il percorso dei comandi gia' configurato.

[Provenienza](installation.lisp), [compilatore](compiler.txt),
[build completo](build.log.gz), [installazione](install.log.gz).
SHA256 osservati sui byte scaricati e sugli artefatti installati: non una
nuova attestazione crittografica dell'autore upstream. Smoke test runtime,
architettura, thread e contrib SB-POSIX/SB-COVER/SB-CLTL2 superati.

[Verifica completa ArcDocDB](check-run/report.lisp) superata: OK, exit 0,
SOURCE-CONSISTENCY STABLE; 65 test motore, 70 test pagine, compilazione senza
warning, lint (452 file), tracciabilita' (68 ADR), link, full text, strumenti,
undici esperimenti e self-test CI. Le cinque finestre da 10000 GET dopo il
rinnovo hanno allocato zero byte Lisp misurati; nessuna misura RSS o throughput.
Il profilo CI bloccato su 2.6.9 resta distinto dalla qualifica locale 2.6.10.
Nessun test generale della distribuzione SBCL oltre a quelli eseguiti dal suo build;
le prove del progetto non qualificano l'intero compilatore o altre piattaforme.

Primo tentativo completo [fallito](attempt-1-check/report.lisp): file FASL
assente durante il caricamento. Erano state avviate due compilazioni sulla
stessa cache; possibile interferenza fra processi. Nessuna modifica del prodotto.
La verifica viene ripetuta in sequenza; il [record allocazioni](allocation-run/report.lisp)
e' OK, exit 0, SOURCE-CONSISTENCY STABLE.
