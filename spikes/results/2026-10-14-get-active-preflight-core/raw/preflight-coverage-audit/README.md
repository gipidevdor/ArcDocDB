# Audit indipendente delle coperture GET preflight

Audit locale registrato del 14 ottobre 2026, concluso PASS sul freeze
`8c0866711c50d047f87b9c484ce56d42a87ba19c`. Non esegue suite, compilazione
di prodotto, benchmark, caricamento di report o FASL. I dati Lisp vengono letti
con `tools/evidence-storage.lisp` autenticato rispetto al Git congelato; il raw
SB-COVER usa il callback del reader con sintassi standard, READ-EVAL NIL e una
sola forma seguita da EOF. Solo il programma reader fidato viene caricato.

## Provenienza e registrazione

- Helper: `audit.lisp`, SHA256
  `20441b55034443585b011ec9949c9901441593add62dbb3d82f79e472fe6aa19`.
- Base coverage/oracoli: copia DATA `coverage-audit-original.lisp.txt`, SHA256
  `ce7877778ada522c45a3136b6f74997574e41d154004bfb0f8aaf4fd24621163`,
  dal precedente archivio integration tracciato.
- Derivazione ASDF: copia DATA `fasl-audit-original.lisp.txt`, SHA256
  `2e21d354370e68bb215d59933190fec1267386610d99fc256fff423b509c37bc`,
  dal backup immutabile della campagna finale precedente.
- Esito completo: `coverage-audit-R1.lisp`.
- Comando nativo: `spikes/out/4000985824-command-62860-0/report.lisp`,
  exit 0, status OK, sorgenti STABLE, stderr vuoto. La console esterna è
  conservata in `wrapper-stdout-R1.txt` e `wrapper-stderr-R1.txt`.
- `inspect-R1.lisp` rilegge risultato e registro nativo come dati, autentica
  reader/HEAD e conferma SHA/provenienza e identità. Esito in
  `inspection-stdout-R1.lisp`, diagnostica vuota `inspection-stderr-R1.txt`.
  Questo controllo successivo non esegue suite e non sostituisce l'audit.

I parametri del comando, conservati integralmente anche nel record nativo, sono:

```text
--workspace /Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/
--commit 8c0866711c50d047f87b9c484ce56d42a87ba19c
--active-command spikes/out/4000985299-command-51847-0/report.lisp
--active-dir spikes/out/preflight-active-coverage-R1/
--closed-command spikes/out/4000985360-command-53077-0/report.lisp
--closed-dir spikes/out/preflight-closed-coverage-R1/
--output spikes/out/preflight-coverage-audit/coverage-audit-R1.lisp
```

## Verifiche concluse

Gli 852 path/blob sorgente di ciascun wrapper sono esattamente quelli del Git
congelato, esclusi gli archivi `spikes/results/` secondo il contratto del recorder.
La selezione corrente usa Git NUL e rifiuta duplicati; tutti i file devono essere regolari.
HEAD, stato pulito e path/blob sono confrontati prima e dopo. Anche reader, helper
e due copie di provenienza devono restare byte-identici.

I 42 nomi ACTIVE derivano dai file del Git e dal modulo ASDF seriale nell'ordine
construction/preflight/directory/read; i 42 CLOSED da sort/construction/read.
Le righe `ok` native devono coincidere esattamente per nome e ordine; la riga
finale della suite, il comando, la directory e lo scope devono corrispondere.

| Scope | Test | Sorgenti | HTML | Espressioni | Direzioni branch | FASL privati |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| ACTIVE | 42 | 10 | 11 | 1076/1491 | 132/192 | 335 |
| CLOSED | 42 | 7 | 8 | 1156/1416 | 131/184 | 335 |

Nel solo `active-preflight.lisp`: 174/193 espressioni e 25/26 direzioni branch.
Il raw completo, il riepilogo e ogni pagina HTML selezionata devono concordare
nei percorsi e conteggi. L'insieme HTML è esatto e senza duplicati.

I 335 FASL di ogni gruppo coincidono con l'insieme dei sorgenti registrati nei
due sistemi ASDF congelati. Sono verificati solo come file regolari non vuoti,
percorsi e bytes/SHA256, senza LOAD, disassemblaggio o interpretazione del codice.
La provenienza del mapping è il confronto della forma canonica del producer
congelato: mapping ricorsivo del workspace nella cache privata, configurazione
ereditata ignorata, installato prima dei due load-system force. Questo è un
controllo statico del producer associato al comando registrato e un confronto
dell'inventario reale, non una riesecuzione del mapping o una prova semantica
del contenuto FASL.

Gli inventari completi dei quattro gruppi di input (due directory di copertura e
due directory dei wrapper) concordano esattamente prima/dopo per path, dimensione
e SHA256. ACTIVE contiene 348 file, CLOSED 345; gli inventari completi sono nel
report. Output e helper restano esterni ai gruppi verificati.

## Limiti

Questa è diagnostica locale di copertura di espressioni e direzioni branch.
Non attribuisce copertura C1 o MC/DC globale, qualifica di release, prestazioni
o campagne di mutazione. Le cifre rimangono attribuite al freeze sopra indicato;
non qualificano revisioni successive. Nessun tentativo fallito di questo audit:
R1 è il primo e unico run registrato. I gruppi di input non sono stati modificati.
