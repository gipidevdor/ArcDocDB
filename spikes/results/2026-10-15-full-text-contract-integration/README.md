# Integrazione del contratto full text — 2026-10-15

Dopo il [controllo completo](../2026-10-15-full-text-contract/README.md),
il remoto è avanzato con il recupero dei massimi CSN. Questa verifica riguarda
il grafo integrato fra `62a2fecc` (contratto full text) e
`f50efd9e4fd48dbf9da7366e21628c02cbce7050` (aggiornamenti remoti).
L'unico conflitto era nel changelog: conservate entrambe le voci.

Il [record originale](report.lisp), il payload gzip e il
[record di conservazione](conservazione.lisp) sono copie byte per byte di
`spikes/out/4001085716-command-52548-0/`. Il wrapper ha eseguito
`make test lint trace links`: esito `:OK`, exit 0, 1.012 sorgenti `:STABLE`,
durata 127,579217 secondi.

- Test esistenti e compilazione superati.
- Linter: 248 file, zero violazioni.
- Tracciabilità: 130 requisiti, 68 invarianti, 13 scenari FI, 54 ADR; zero errori.
- Collegamenti: 717 file, 3.492 link, zero rotti.

Il controllo completo precedente resta attribuito alla propria base `61941edb`;
qui sono stati ripetuti test, linter, tracciabilità e collegamenti. Gli originali
remoti dei tentativi falliti conservano anche gli spazi nei loro output: non
sono stati riscritti per soddisfare un controllo stilistico del diff.
Nessuna implementazione o qualifica del full text viene derivata da questi esiti.
