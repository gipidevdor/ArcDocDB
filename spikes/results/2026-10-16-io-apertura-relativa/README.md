# Apertura readonly relativa alla directory posseduta

[Contratto](../../../docs/implementazione/io-apertura-relativa.md) ·
[Metodo](../../../docs/implementazione/io-apertura-relativa-metodo.md) ·
[Letture statiche](../../../docs/implementazione/io-apertura-relativa-revisione.md) ·
[Inventario chiuso](archive-index.lisp)

L'incremento aggiunge `apri-lettura-nella-directory`: apre una foglia ASCII
rispetto al FD del parent posseduto e restituisce la capacità readonly e
l'EOF osservato. Backend, identità, regolarità e legame con la entry sono
verificati prima della pubblicazione; parent borrowed, nessun fallback,
append, creazione, unlink o flush implicito. L'EOF non è una frontiera
durevole e questa API non verifica contenuti, formati o CRC.

## Verifica locale S1

Commit S1: `f8009e73e46259ab1891e8cfd7e1262a6757f779`.
Il full `make check` R1 è concluso con exit 0 e sorgenti STABLE:
[outer](processes/r1-outer/report.lisp) e
[inner](processes/r1-inner/report.lisp). L'output originale contiene
19 nomi nuovi unici, 13 casi con backend iniettabile e 6 nativi, elencati
in fondo. La verifica completa comprende la suite verticale: quattro test,
16 scenari positivi e due controlli negativi. Non si dichiara qui un
denominatore globale dei test.

Sono conservati interi i gruppi del [reader](fixtures/reader/report.lisp)
e dello [snapshot](fixtures/snapshot/report.lisp), entrambi PASSED, e
l'[aggregato SPK](fixtures/spk/report.lisp), COMPLETE, con i dieci spike.
L'[osservazione locale](inputs/local-verification.lisp) documenta la
corrispondenza dei 18 blob S1 nei due record, i nomi e l'assenza di warning
e style-warning. Resta un'osservazione dei record originali.

Il [trace-write preliminare](processes/trace-write/report.lisp) è conservato
con exit 0/STABLE e il proprio HEAD registrato `fc487afac028f445d1f407533846dfb66cb22760`;
non è attribuito al successivo commit S1.

## Integrazione distinta

Il commit `749655f94a2fdff4299eb9b2a709962011287573` integra main
`6e065e26`. Il [controllo d'integrazione](processes/integration-check/report.lisp)
ha concluso `make lint trace links` con exit 0/STABLE. Il root ha verificato
che IO, relativi test e supporto verticale coincidano con S1 e che ASD
conservi i moduli di entrambe le linee di sviluppo. Il full locale resta
attribuito a S1; la futura CI sull'head effettivo sarà una prova distinta.
Non è dichiarato alcun PASS CI da questo archivio.

## Fonti e limiti

Le 18 copie sotto `source-S1/` sono ricostruite da Git dopo il freeze,
con i byte originali e l'estensione `.txt`; non sono snapshot del run.
[Provenienza](capture-provenance.lisp) registra timestamp reale, percorsi,
argv Git, blob, byte e SHA256. La bozza iniziale resta come dato di
provenienza. Descriptor e payload gzip originali sono elencati insieme;
nessuna evidenza o FASL viene caricata come programma.

Il manifest seleziona file espliciti dai gruppi conclusi. Il collector
conserva byte e metadati senza promuovere
risultati, requisiti, prestazioni o gate. Le cache ASDF non fanno parte di
questa pubblicazione e restano nel perimetro del backup ignored finale.
Non sono dichiarate qualificazione C1/MC/DC o campagne di mutazione.
Namespace/controller esclusivi e assenza di cancellazione asincrona
restano precondizioni; i callback di close estranei al contratto e le
uscite non locali hanno i limiti di diagnosi documentati nell'API.

## I 19 nomi osservati nell'output originale R1

```text
TEST-REQ-AFF-001-IO-OPEN-RELATIVE-OWNED-INPUT-EOF-AND-EXACT-IDENTITIES
TEST-REQ-AFF-008-IO-OPEN-RELATIVE-ZERO-AND-INDEX-EOF-BOUNDARIES
TEST-REQ-AFF-008-IO-OPEN-RELATIVE-ALL-CALLBACKS-REQUIRED-NO-LEGACY-FALLBACK
TEST-REQ-AFF-008-IO-OPEN-RELATIVE-INVALID-BUDGETS-BEFORE-CALLBACK
TEST-REQ-AFF-008-IO-OPEN-RELATIVE-ASCII-NAME-BOUNDS-AND-PRIVATE-COPY
TEST-REQ-AFF-008-IO-OPEN-RELATIVE-PARENT-MODE-AND-LIFECYCLE-PREFLIGHT
TEST-REQ-AFF-008-IO-OPEN-RELATIVE-INVALID-CHILD-FD-AND-PARENT-ALIAS-NOT-CLOSED
TEST-REQ-AFF-008-IO-OPEN-RELATIVE-METADATA-SHAPE-AND-SIZE-BUDGET
TEST-REQ-FOR-001-IO-OPEN-RELATIVE-ENTRY-IDENTITY-MISMATCH-AND-INVALID-RESULT
TEST-REQ-AFF-001-IO-OPEN-RELATIVE-PARENT-CLOSED-IN-EACH-CALLBACK
TEST-REQ-AFF-001-IO-OPEN-RELATIVE-CALLBACK-CONDITIONS-AND-SYSCALL-PROVENANCE
TEST-REQ-AFF-004-IO-OPEN-RELATIVE-CLEANUP-FAILURE-KEEPS-PRIMARY-FIELDS-NO-RETRY
TEST-REQ-AFF-004-IO-OPEN-RELATIVE-NONLOCAL-EXIT-CLEANS-CHILD-BEFORE-CALLER
TEST-REQ-AFF-001-IO-OPEN-RELATIVE-NATIVE-READ-EOF-FLAGS-AND-PRESERVED-WRITER
TEST-REQ-AFF-008-IO-OPEN-RELATIVE-NATIVE-EMPTY-FILE-ZERO-BUDGET
TEST-REQ-AFF-008-IO-OPEN-RELATIVE-NATIVE-SPARSE-U64-EOF-EXACT-AND-ONE-UNDER
TEST-REQ-AFF-008-IO-OPEN-RELATIVE-NATIVE-NO-FOLLOW-FILE-KINDS-AND-MISSING
TEST-REQ-AFF-001-IO-OPEN-RELATIVE-NATIVE-PARENT-MOVE-IGNORES-REPLACEMENT-DECOY
TEST-REQ-AFF-001-IO-OPEN-RELATIVE-NATIVE-REPEAT-CLOSE-OWNS-ONLY-CHILD
```
