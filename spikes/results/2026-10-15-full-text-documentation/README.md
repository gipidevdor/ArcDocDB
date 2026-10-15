# Allineamento della documentazione full text — 2026-10-15

[Decisione di riferimento](../../../docs/adr/0053-ricerca-full-text-indici-invertiti.md) ·
[Roadmap](../../../docs/roadmap.md) ·
[Verifica originale](processes/documentation/report.lisp) ·
[Inventario chiuso](archive-index.lisp)

Allineati 19 documenti: scope v1 e interfacce ADR-0026/0029/0030,
README e indice, modello logico/catalogo, snapshot, compaction, recovery,
metriche, roadmap, glossario, questioni risolte, stato di implementazione,
valutazione, costi, rischi e piano di verifica. ADR-0053 resta la decisione
autorevole; i quattro requisiti full text restano progettati, con codice,
formato binario e qualifica nella fase 8. Nessun nuovo requisito o codice
eseguibile è introdotto da questo allineamento.

Il comando make trace links è OK / exit 0 / STABLE, 8,308828 s, stderr
vuoto: 126 requisiti, 66 invarianti, 13 FI, 53 ADR, zero errori;
496 file Markdown e 3.404 link, nessuno rotto. Questi conteggi precedono
questa raccolta. Non vengono attribuite prove di implementazione o
prestazione del full text ai test esistenti del motore.

Il record originale e il sidecar sono conservati senza modifiche.
Le 19 copie raw conservano i documenti verificati con suffisso .md.txt.
Manifest esplicito, quattro worker e checker indipendente dell'inventario
chiuso; gli artefatti sono dati, da leggere con READ-EVAL NIL, mai da caricare.
