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
