# Prove GET ACTIVE dopo integrazione delle fonti della Serie

Freeze `e8c88a4cdc697422eb05b0c6a7f79d0ec9480e26`, integrato con il main
esatto `64a5ef06987af61c36ce9818eb24ca8f0a0eb7f4`.
[Metodo preregistrato](../../../docs/implementazione/get-active-metodo.md).

Il controllo completo passa con 1.107 test di modulo in 29 suite, più due
smoke check. I profili isolati ripetono 28 test ACTIVE e 42 CLOSED.
ACTIVE: 1028/1491 espressioni e 122/192 rami; CLOSED: 1156/1416 e 131/184.
La fixture con quattro argomenti `--suite active --suite active` fallisce
con il guard specifico del duplicato, senza argomenti di rapporto.

La raccolta conserva 22 gruppi completi in un'unica esecuzione, dopo il
termine degli audit locali. Tutte le cartelle originali sono già immutabili
prima della raccolta, compreso active-integration-audit. Il manifesto
descrive l'inventario completo verificato dall'auditor.

Il collector verifica ogni copia contro byte/hash del sorgente prima e
dopo. L'audit finale verifica nuovamente tutti gli hash in due passaggi.
Nessun report originale viene riscritto. La modalità append del helper
non è usata o qualificata da questa raccolta.
FASL, output, copertura grezza e HTML restano dati; gli originali grandi
sono compressi senza perdita con hash espanso. Non si inferiscono esiti
di prodotto dai soli cataloghi.

La suite ordinaria non qualifica autonomamente la nuova API della radice
catturata o la directory mista. C1, MC/DC, prestazioni, concorrenza,
indice atomico, rotazione/reclaim, multiserie, server e Fase 0 restano aperti.

