# Verifica completa della ripresa — 2026-10-15

[Sviluppo e limiti](../2026-10-15-vertical-resume/README.md) ·
[Contratto](../../../docs/implementazione/prova-verticale.md) ·
[Record originale](processes/full-check/report.lisp) ·
[Inventario chiuso](archive-index.lisp)

`make check` esegue `make check-core`: OK / exit 0 / STABLE, 493,969879 s,
1.004 sorgenti, base Git `4ea3dd49bec8727351ea6735cb6455ac5a827dc2` e
modifiche locali identificate dai blob nel record. È tempo di verifica,
non una misura di prestazione del motore.

Passano 1.726 test nominati e due smoke test; la suite verticale esegue
nuovamente tutti i 71 processi e 26 SIGKILL intenzionali. Linter: 245 file,
zero violazioni. Tracciabilità: 122 requisiti, 65 invarianti, 13 FI e 52 ADR,
zero errori. Collegamenti: 492 file, 3.317 link, zero rotti. Passano i self-test
degli strumenti, incluso il collector, e tutti i dieci spike check.

Il controllo delle evidenze riporta 134 cataloghi, 3.719 riferimenti,
43.570 file e 1.163.019.018 byte. Questi conteggi precedono questa raccolta
conclusiva e il solo collegamento aggiunto al contratto dopo il controllo.
La compilazione è stretta, senza warning/style-warning; i 1.441.913 byte
UTF-8 di stderr e tutti gli output originali restano nel record compresso.
I negativi intenzionali degli strumenti rimangono distinti dai fallimenti
reali delle campagne di sviluppo.

`raw/final-sources` conserva la variante verificata, compresa la sola
rimozione della riga vuota a fine scenarios.lisp dopo il terzo self-test.
L'audit confronta 13 sorgenti con i blob originali. L'indice delle prove
spikes/results/README.md è fuori dal fingerprint: la sua copia è ausiliaria.
`raw/publication` conserva il contratto con il link a questa verifica,
aggiunto successivamente. I quattordici file della campagna degli spike
sono copiati integralmente; nessun loro esito viene reinterpretato.

La revisione C4 è descritta nel contratto. Questa verifica non qualifica
Recovery Manager, ammissione generale, CSN dell'intero Archivio, snapshot
storici, multiserie o prestazioni del database. Tutto il coordinamento
nuovo appartiene ai test; nessun file in src/ è modificato.

La raccolta usa manifest esplicito, quattro worker e checker indipendente.
Report, descriptor e gzip originali sono conservati byte per byte, senza
promuoverne l'esito. Le copie Markdown mantengono i byte con suffisso .md.txt.
Gli artefatti sono dati da leggere con READ-EVAL NIL, mai da caricare.
