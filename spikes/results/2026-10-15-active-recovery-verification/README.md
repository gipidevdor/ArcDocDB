# Verifica funzionale del recupero del vecchio ACTIVE

Metodo preregistrato: [active-recovery-metodo.md](../../../docs/implementazione/active-recovery-metodo.md).
Il prodotto rimane invariato. Le fixture native possiedono namespace 0700,
FD e backend, entro 4096 byte e deadline seriale di 30 secondi. CONTROL
e DECISION provengono dai decoder pubblici su log completi dichiarati dalla
fixture; identità e completezza dell'Archivio restano precondizioni.

Il risultato riuscito è attribuito solo a R3, commit
`b92c1a25619279f1d4e1244fc970b3829c0ecca4`, tree
`76d996d3f03dcd0bd44525a427abd338e7bb04bb`:
`4001073647-command-78833-0` / `4001073651-command-78980-0`, OK/exit0/STABLE.
Il counter Git autenticato e l'audit nativo completo
`4001074229-command-13693-0` qualificano 1.555 test, 34 suite e due smoke,
927 sorgenti e 376 FASL esatti nella cache privata R3. L'audit conserva due
inventari freschi identici. Il dataset completo, identico allo stdout nativo,
è `raw/semantic-runtime/full-R3-audit.lisp`, SHA256
`bf403aed0d685c308de812ad89f05936259c3409b03e1c1f5689e3ca21c3ca68`.
Il nome storico `audit-F2.lisp` identifica codice byte-identico `8c857dc5…`,
invocato sul commit R3; nessuna esecuzione scoped precedente è promossa.

La nuova suite contiene 27 nomi registrati, ciascuno esercita v1/v2:
prepared, OUTCOME locali, DECISION, presumed abort, conflitti, budget,
TAIL e testimone durevole; query/serializer CLOSED e pubblicazione CONTROL
con riapertura, rifiuti prima del claim e fault originale dopo rename.
La verifica nomi `4001074377-command-21075-0` è OK/exit0/STABLE e confronta
nomi e ordine dal Git congelato; include fixture positiva e tre negative.
I byte, FD/inode/EOF/offset/frontiere e le sentinelle sono oracoli distinti.

Sono conservati tutti i tentativi precedenti, senza riclassificazione:

- R1 `7e2d2e64e99cbb4a852cca1718ece0208d60e7fa`: outer
  `4001073360-command-61120-0`, inner `4001073363-command-61212-0`,
  FAILED/exit2/STABLE per EOF del supporto; nessun test eseguito.
- R2 `94719b40461c8722d1a6069fb29e63faf1eee40c`: outer
  `4001073533-command-70908-0`, inner `4001073535-command-71009-0`,
  FAILED/exit2/STABLE per STYLE-WARNING del parametro CASE inutilizzato;
  nessun test eseguito.
- Controllo ad hoc dei nomi `4001074241-command-14160-0`, FAILED/exit1/STABLE:
  UIOP assente al reader prima dei dati. Il programma inline originale è
  nel campo COMMAND; il successivo programma standalone è conservato.

Sono inclusi anche entrambi i counter congelati e il READ sintattico
`4001073549-command-71582-0` (sole forme lette con READ-EVAL NIL ed EOF,
senza compilazione o valutazione dei sorgenti). Questi controlli non sono
risultati di test prodotto.

I 34 gruppi e 12 stati nativi comprendono tre intere cache ASDF, tutte le
fixture reader/snapshot, aggregato spike e dieci intere directory SPK/out,
programmi C4 e output originali chiusi. R1/R2 conservano tutte le cache
prodotte prima del fallimento, senza dichiararle compilazioni complete.
Le cache SPK possono contenere file precedenti: nessuna promozione a R3.
Ogni FASL è conservato come byte; il byte audit impone inventari completi,
espansioni gzip verificate e due passaggi SHA freschi su fonti e copie.
Il catalogo automatico registra i conteggi effettivi della conservazione.

Collector `e6b2cdec…`, byte auditor `d17564b3…` e batch `130f4285…` sono copie
qualificate identiche. L'esecuzione deve usare copie byte-identiche in una
directory runtime ESTERNA a tutti i gruppi; output e temporanei del byte
audit devono essere esterni anche all'archivio. La cartella publication-source
raccolta è solo provenienza, mai il luogo dell'auditor in esecuzione.
La raccolta inizia solo dopo chiusura di tutti i writer e approvazione del piano.

Report e FASL non vengono caricati come codice. Nessuna qualifica CI, C1,
MC/DC globale, prestazionale, power loss o apertura completa del motore.
