# Control log letto e transizione di recovery — 2026-10-14

Campagna di compilazione e letture statiche del
[contratto](../../../docs/implementazione/control-recuperato.md).
Realizza il collegamento alla pubblicazione già esistente; non chiude il
Recovery Manager o la qualifica C1 dei nuovi ingressi.

## Metodo registrato

La prima compilazione completa del prodotto usa ASDF con warning e
style-warning trattati come errori, salvo redefinition-warning del reload
dei contrib. Non carica il sistema dei test. Il contenuto compilato è
identificato dai blob prima/dopo nel report, anche quando il commit precede
l'aggiunta dei nuovi file. La successiva compilazione usa la revisione
committed dei medesimi sorgenti.

Seguono lint, tracciabilità, collegamenti e integrità strutturale delle
evidenze. Il disassemblato ispeziona il codice compilato senza eseguire le
nuove funzioni. Due letture dell'autore separano autorità/guasti da
conservazione/ownership/costi: non sono revisione indipendente.

I report e i sidecar di conservazione vengono copiati senza trasformazione
nel [catalogo](catalogo.lisp). Un audit verifica dimensioni e SHA-256 degli
originali rispetto alle copie. Eventuali fallimenti restano conservati.
Gli helper esatti vengono mantenuti come testo Common Lisp in dati schema 1.

## Limiti

Nessun test funzionale, fault injection, benchmark o verifica formale
aggiunti/eseguiti localmente in questa campagna. Non prova EOF fisico,
esclusività del namespace, power loss, assenza di heap o throughput.
Gli esiti della CI automatica sulla revisione pubblicata restano distinti
dai controlli locali e non qualificano da soli le nuove funzioni.

## Esiti conservati

Nove record di processo riusciti, con sorgenti stabili: due compilazioni,
rigenerazione della matrice, lint, tracciabilità, collegamenti,
disassemblato e due controlli delle evidenze. L'
[audit finale](audit-finale-byte.lisp) confronta tutte le **18 copie** dei
report e dei sidecar con gli originali per dimensione e SHA-256.
Questi esiti riguardano compilazione, letture e conservazione; non
promuovono i nuovi ingressi a funzionalità qualificata.
