# Checkpoint del control log — 2026-10-13

Compilazione e controlli statici del prodotto. Le due letture sono dell'autore,
senza indipendenza o qualifica C1. Nessuna esecuzione locale di test funzionali,
fault injection, stress o benchmark del nuovo componente.

Il [catalogo](catalogo.lisp) conserva report, sidecar e sorgenti degli helper
come dati. I record identificano argv, ambiente, sorgenti e output del processo.
Il disassemblato descrive il codice locale, senza misure dinamiche di memoria
o latenza. Le evidenze non promuovono i requisiti del motore.

[Contratti e decisioni](../../../docs/implementazione/checkpoint-control.md).

## Risultati locali

- Compilazione SBCL del prodotto riuscita, con warning trattati come errori
  salvo le ridefinizioni previste dal caricamento forzato.
- Stile: 192 file, zero violazioni.
- Tracciabilità: 118 requisiti, 65 invarianti, 13 scenari FI e 52 ADR,
  zero errori di collegamento; gli scenari non sono stati eseguiti localmente.
- Documentazione: 372 file, 2.759 link, zero collegamenti rotti.
- Evidenze: struttura, presenza, dimensioni e integrità compressa regolari;
  nessuna reinterpretazione dei risultati.
- Sei record di processo, tutti con sorgenti stabili; [audit dei byte](audit-byte.lisp)
  delle dodici copie di report e sidecar, con lunghezze e SHA256 uguali agli originali.

Il disassemblato contiene i controlli di identità, dipendenza ACTIVE e confronto
dei chunk. Non dimostra assenza di allocazioni, né misura costi transitivi,
latenza o throughput. Qualifica C1 e revisione indipendente restano aperte.
