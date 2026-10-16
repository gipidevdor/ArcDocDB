# Integrazione CLOSED della proposta ID — 2026-10-16

[Contratto](../../../docs/implementazione/id-directory-recovery.md) ·
[Prove dedicate e controllo completo](../2026-10-16-recovery-directory-id/README.md) ·
[Registro combinato](processes/combined-tests/report.lisp) ·
[Inventario chiuso](archive-index.lisp)

Il primo push della proposta ID ha trovato altri commit CLOSED su main.
L'integrazione 94e2abd617ae019a6059d136cac1a4b81bc1eee9 li preserva insieme
alla proposta ID, al piano CSN e alla correzione clock CBOR già verificati.

make test lint trace links: OK / exit 0 / STABLE, 130,048774 s, 1.052 sorgenti.
Passano 1.849 test nominati e due smoke, inclusi i nuovi test CLOSED; 154 test
recovery e la prova verticale con nomi canonici (16 positivi, due negativi,
71 processi e 26 SIGKILL). 260 sorgenti senza violazioni, 131 requisiti,
68 invarianti, 13 FI e 54 ADR senza errori; 526 Markdown e 3.598 link senza
errori prima di questa raccolta. Compilazione rigorosa senza warning o
style-warning; i 1.644.121 caratteri stderr originali sono conservati nel
registro, tramite descriptor gzip senza perdita.

Lo strumento di copertura aggiornato per CLOSED ha self-test separato:
OK / exit 0 / STABLE, 1,611574 s e stderr vuoto. Fonte, fixture e HTML
sono conservati. Il tempo dei controlli non è un benchmark del prodotto.

Il confronto della selezione ID, dei suoi test, della prova verticale e dei
mutanti con 4ebde6fc è vuoto. Restano 17/17 mutanti rilevati e 92/107 forme,
10/10 rami sui due file dedicati, senza esclusioni. Il controllo completo
precedente, gli spike e le misure locali restano nella raccolta principale.
Il nuovo risultato riguarda l'integrazione; non estende la copertura della
selezione a CLOSED o ai calcoli CSN, e non chiude indipendenza o gate C1.

Registri e sidecar originali, manifest esplicito, quattro worker, inventario
chiuso e checker indipendente. Gli aggiornamenti dei risultati non cambiano
codice o test. Dati Lisp da leggere con READ-EVAL NIL, mai da valutare.
