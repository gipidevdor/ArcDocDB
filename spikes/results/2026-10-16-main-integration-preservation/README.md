# Conservazione del lavoro durante l’integrazione in main

Il [registro di conservazione](preservation.lisp) documenta l’inclusione dei
branch originali e delle HEAD dei worktree. Comprende il lavoro dal worktree
CI detached e quello full text dai documenti CBOR, con i relativi archivi delle prove.

Le quattro copie locali originali sono versionate byte per byte:

- [elenco ASDF precedente](raw/arcdocdb-preexisting-copy.asd.txt);
- [package UTF-8](raw/codec-package-preexisting-copy.lisp.txt);
- [lettore scalare UTF-8 precedente](raw/codec-utf8-preexisting-copy.lisp.txt);
- [copia di ADR-0055](raw/adr-0055-preexisting-copy.md.txt).

Il registro conserva percorsi originali, dimensioni, blob Git e SHA-256.
I file canonici del prodotto includono i moduli successivi e il controllo
esplicito della larghezza UTF-8; package e ADR corrispondono alle copie.
Gli originali archiviati restano consultabili nella cronologia di `main`.
Sono dati sorgente storici; build e verifiche usano i file canonici.

L’audit attesta inclusione dei commit e conservazione dei byte. Le verifiche
funzionali del motore sono registrate separatamente da `make check`.

Il [confronto con i file canonici](comparison-to-canonical.diff.txt) conserva le
differenze esatte delle copie precedenti. L’[audit degli ingressi verificati](verification-inputs.lisp)
confronta ogni blob dei sorgenti, test, strumenti, dati e spike attuali con tre
registri `make check` riusciti e stabili: locale, Linux e macOS. Lo
[script riproducibile](raw/verify-record-inputs.lisp.txt) verifica anche che tutti
gli ingressi correnti siano coperti; documentazione e cataloghi sono controllati
separatamente dopo l’integrazione.
