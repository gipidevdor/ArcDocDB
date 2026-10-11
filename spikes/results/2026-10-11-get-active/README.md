# Evidenze statiche — resolver ACTIVE ordinario

Campagna del 2026-10-11, indicizzata da [catalogo.lisp](catalogo.lisp).
[Prima lettura](lettura-prima.lisp) e [seconda lettura](lettura-seconda.lisp)
sono dell'autore e non costituiscono revisione indipendente o qualifica C1.

I processi registrati compilano soltanto il prodotto o controllano sorgenti,
tracciabilità, collegamenti e struttura/presenza delle evidenze. Il disassemblato
osserva il codice generato e non esegue funzioni di prodotto. Non si aggiungono
né si eseguono nuovi test funzionali, benchmark, fault injection, modelli o
self-test locali. La CI automatica già configurata può essere osservata dopo
il push; non qualifica autonomamente questo nuovo resolver.

I report e i rispettivi sidecar di conservazione vengono copiati byte per
byte da `spikes/out` prima di ritirare il worktree. Mantengono comando,
sorgenti/hash, ambiente, stdout/stderr e codice d'uscita originali. I supporti
conservano il testo dei helper di compilazione, disassemblato e raccolta.
Gli snapshot sono hash dei sorgenti; le varianti non committate non sono
copie complete dei relativi alberi Git. Il prodotto definitivo è in Git.

La verifica preliminare delle evidenze conserva l'esito `:source-changed`:
durante il processo i nuovi file sono stati aggiunti all'indice Git, cambiando
l'ordine dei due snapshot. I 670 elementi sono gli stessi in entrambi i versi
del confronto, ma l'esito originale resta non qualificante e non viene
riscritto. Il processo sottostante ha restituito zero; il controllo registrato
viene ripetuto sulla base integrata con sorgenti e stato Git stabili.

Nessuna misura di heap, throughput, latenza o RSS viene dedotta da questi
controlli. I confini e i casi C1 aperti sono nel [contratto](../../../docs/implementazione/get-active.md).

## Base integrata

I report `*-integrato.lisp` e `evidenze-integrate.lisp` sono registrati sul
commit `1c0394124d4ab22412b6567c1abed73ea8f68ac3`, che integra main
`6eeb501d2eace49fad8e2ec333ed0c6c1386dd6c`. Compilazione senza warning o
style-warning; sorgenti stabili prima/dopo ogni comando.

- Lint: 155 file, zero violazioni.
- Tracciabilità: 116 requisiti, 65 invarianti, 13 scenari FI e 52 ADR, zero errori.
- Collegamenti: 312 file, 2.492 link, zero rotti.
- Evidenze: controllo di struttura/presenza/dimensione/integrità compressa passato.
- Disassemblato ARM64: cinque funzioni GET ACTIVE, senza marker testuali
  `ALLOC-TRAMP`, `GENERIC` o `BIGNUM`. Non copre automaticamente i callee,
  x86, le allocazioni effettive o le prestazioni.

Il catalogo conserva 18 processi originali e i relativi 18 sidecar, tre
supporti, due letture locali, audit dei byte e suo sorgente: 25 voci.
`audit-byte.lisp` confronta tutte le 36 copie con gli originali per dimensione
e SHA256, prima del ritiro del worktree. Include l'esito preliminare non
qualificante, senza trasformarlo in successo. L'audit verifica conservazione
dei file; non esegue funzioni del prodotto e non qualifica C1.
