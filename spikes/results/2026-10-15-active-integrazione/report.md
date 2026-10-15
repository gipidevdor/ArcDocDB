# Integrazione finale ACTIVE e pool/Serie — 2026-10-15

Verifica del grafo integrato con `main` `0ac35c7b`, dopo la chiusura della
[campagna ACTIVE](../2026-10-15-active-verifica/report.md). Il nuovo passo
pool/Serie e la suite scheduler restano quelli pubblicati da `main`.

## Esito

**`make check` completo passato su `2f1d71ba`**, con sorgenti stabili:
[produttore originale](4001074903-command-61181-0-report.lisp).
La suite integrata conserva **138 test CONTROL e 59 test ACTIVE passati**,
insieme alla nuova suite scheduler, linter, controlli delle evidenze e
dieci spike in modalità check. Nessuna promozione del motore completo.

Il [confronto registrato](4001074904-command-61244-0-report.lisp) con
`3698797c` verifica l'identità di CONTROL, recovery, recovery ACTIVE,
delle loro suite e degli strumenti di misura/copertura già qualificati.
L'integrazione aggiunge il passo pool/Serie di `main`, i suoi test e la
registrazione ASDF; il conflitto del changelog è risolto conservando entrambe
le voci. La campagna precedente e il suo catalogo restano immutati.

## Cosa resta valido e cosa è nuovo

- Lettore CONTROL: **20/20 rami applicativi**; controlli dinamici dei tipi
  del costruttore passati, forme generate ancora incluse nel denominatore.
- ACTIVE: 59 test ripetuti sul grafo integrato, inclusi file reali,
  esiti zero/u64, code, guasti fsync e rifiuti prima del claim.
- Il benchmark resta attribuito a `3698797c`: 18 finestre, quattro worker
  al massimo e 8.400 recovery verificati. Il confronto dei sorgenti non
  viene presentato come una nuova misura del grafo integrato.
- Copertura C1 completa, MC/DC e lettura indipendente ACTIVE restano aperte,
  come documentato nella campagna originaria. Questa verifica non modifica
  tali limiti né le precondizioni del Recovery Manager.

## Conservazione

Il [catalogo](catalogo.lisp) conserva i produttori conclusi, i report SPK
individuali e le fixture negative snapshot/reader del controllo completo.
Il [publisher](publish.lisp) deriva le funzioni di copia dalla campagna
precedente: verifica digest, record risolti, selezione esplicita e dimensioni
massime di 1 MiB per file normale e 8 MiB per payload gzip.
Il self-test finale aggiunge i casi `:passed` delle fixture di processo e
il rifiuto di un record ancora `:running`, per 14 controlli; la variante
iniziale a 12 controlli è conservata separatamente.

Il [metodo di chiusura](retention.lisp) conserva pubblicazione e audit,
con confronti canonici delle copie. Il produttore conclusivo viene copiato
separatamente, senza autocertificazione ricorsiva. Registri compressi e
metadata mantengono byte originali, revisioni, comandi, ambiente e limiti.
FASL e cache del solo worktree temporaneo sono ricostruibili e rimossi
dopo la pubblicazione su `main`.
