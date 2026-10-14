# Vecchio ACTIVE readonly — 2026-10-14

Campagna locale di compilazione e letture statiche del
[contratto](../../../docs/implementazione/active-recuperato.md).
Non qualifica funzionalmente i nuovi ingressi del Recovery Manager.

## Metodo registrato

Compilazione del solo prodotto con ASDF, warning e style-warning come errori
salvo redefinition-warning dei contrib durante reload. Nessun test-op o
caricamento del sistema di test. La prima compilazione è precedente al freeze:
sono poi stati aggiunti il rifiuto dell'origine prima del corpo e il limite
codec prima degli array; i blob nei report distinguono le varianti.
La compilazione finale si riferisce al sorgente committed.

Due letture dell'autore separano autorità/risoluzione da ownership/packing/
pubblicazione. Seguono rigenerazione della matrice, lint, tracciabilità,
collegamenti e integrità delle evidenze. Il disassemblato legge il codice
compilato, senza eseguire funzioni di prodotto.

Report e sidecar originali vengono copiati nel [catalogo](catalogo.lisp).
Gli helper sono conservati come testo Lisp in dati schema 1. L'audit di
conservazione confronta dimensioni e SHA-256 degli originali con le copie;
i tentativi falliti, se presenti, restano conservati.

## Limiti

Nessun test funzionale, FI, benchmark o verifica formale aggiunto/eseguito
localmente. Le letture non sono revisione indipendente. Non si provano
EOF fisico, tabella decisioni del giusto Archivio, esclusività del namespace,
latenza, heap zero o affidabilità del motore completo. La CI automatica sulla
revisione pubblicata resta un'evidenza distinta.
