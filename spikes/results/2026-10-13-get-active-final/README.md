# Verifica locale finale dopo l'integrazione GET ACTIVE

Questa raccolta unica conserva 20 gruppi completi e immutabili prodotti sulla
revisione `ae4022fb66914c53a8f9fba69298e88ce2a35d98`, dopo l'integrazione del
main esatto `061e638200f0d97fc2443c7dec38d4362ef274e1`. Segue il
[metodo preregistrato](../../../docs/implementazione/get-active-metodo.md).

Il controllo completo locale passa con 1.125 test di modulo in 29 suite e due
smoke check, inclusi i 28 ACTIVE e i 42 CLOSED. I comandi core esterno e interno
sono conservati con stdout/stderr, argv e attribuzione alle sorgenti; entrambi
hanno exit zero, stato iniziale pulito e 807 path/blob stabili confrontati con
il Git congelato, esclusi i risultati. Il compilatore produce NOTE: lo stderr
interno di 645.763 byte viene conservato integralmente e non è dichiarato vuoto.
Non sono stati osservati WARNING o STYLE-WARNING in stdout/stderr.

L'inventario grezzo comprende la cache privata completa del core (314 FASL),
le due fixture reader/snapshot, il relativo harness nativo e tutti i dieci
gruppi SPK/out, con 42 ulteriori FASL. Il totale è 356 FASL distinti. Le fixture
ereditano la cache core e non aggiungono altre due copie di 314 file.
Sono conservati quattro errori di processo attesi: SIGKILL prima del
completamento ed exit 7 dopo COMPLETE, uno per tipo in ciascuna fixture.
Il loro esito è verificato come dato e non promosso a fallimento del prodotto.

`raw/local-audit/` conserva integralmente gli strumenti, i sorgenti precedenti
e gli output di tutti i tentativi. I comandi `local-audit-R1-command` e
`local-audit-R2-command` conservano i rispettivi rapporti personalizzati nello
stdout nativo, senza copie derivate. R1 usa la fonte `160db6c8` e passa i controlli
di conteggi, sorgenti, fixture e FASL. R2 usa la fonte `2e21d354` e aggiunge il
confronto canonico esatto della traduzione ASDF fra workspace e cache privata,
letta con READ-EVAL disabilitato e un solo form seguito da EOF. Entrambi hanno
exit zero e sorgenti stabili; la verifica canonica del mapping appartiene a R2.

`collection-manifest.lisp` fissa tutti i gruppi prima della raccolta;
`collection-source.txt` conserva il collector effettivamente eseguito.
Strumento e contratto dell'audit delle copie sono conservati separatamente in
`publication-audit-source.txt` e `publication-audit-contract.lisp`.
Indice e catalogo sono metadati derivati. I nuovi record del collector e
dell'audit delle copie rimangono esterni a questa raccolta e vengono conservati
in un sidecar separato; non vengono aggiunti ricorsivamente all'archivio.

Report e FASL sono dati: soltanto `tools/evidence-storage.lisp` è caricato come
lettore fidato. Le copie sono verificate con dimensioni, SHA256, inventari esatti
e, quando necessario, gzip senza perdita con controllo del contenuto espanso.
I test della suite ACTIVE e i dieci sorgenti del profilo di copertura sono
invariati dall'ultimo freeze di copertura `e8c88a4`; le precedenti coperture
rimangono attribuite ai loro freeze e non vengono attribuite a questa revisione.
Gli esiti sono locali, non della CI. Non si rivendicano prestazioni, MC/DC,
qualifica C1 o funzionalità oltre il GET ACTIVE ordinario del metodo.
