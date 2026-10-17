# Ponte Archivio/CSN — 2026-10-17

[Contratto e decisioni](../../../docs/implementazione/recovery-archivio.md) ·
[Originali e inventario chiuso](../2026-10-17-archive-bootstrap-originals/archive-index.lisp) ·
[Due riletture dell'autore](riletture.lisp)

## Metodo e sorgente

Sorgenti e metodo congelati prima delle esecuzioni nel commit
`ca22f12de11524bbaa359e1dcff113cf895a094a`, successivo a `61b49122` del
recovery Serie. Nessuna riscrittura dei commit precedenti. In questo
incremento: preflight globale, lettura delle Serie, piano CSN canonico e
un terzo valore metadata nel preflight privato della Serie. I due valori
pubblici del reader Serie restano invariati.

Compilazione forzata del solo prodotto, avvisi fatali e nessun sistema di
test caricato. Trace-write prima dei controlli; disassemblaggio dopo la
compilazione. Stile, trace, link e disassemblaggio possono sovrapporsi.
Nessuna nuova API viene chiamata funzionalmente. Tempi dei comandi non
usati come misura di prestazione.

## Risultati locali

Sei processi OK / exit 0 / STABLE: compile, trace-write, lint, trace, links
e disassemble. Compilazione con stdout/stderr vuoti. Lint: 340 file,
zero violazioni. Trace: 135 requisiti, 69 invarianti, 13 FI, 56 ADR,
zero errori. Link: 575 Markdown, 3963 collegamenti, zero rotti.
Disassemblaggio originale ARM64 di tre nuove funzioni e del preflight
Serie aggiornato: lettura statica, senza chiamate alle nuove API.

Il collector comune conserva sei report originali, relativi sidecar e
tre helper: 17 file pianificati, 19 effettivi con indice e catalogo.
Quattro worker; verifica finale separata dell'inventario chiuso con exit 0.
Nessuna aggiunta successiva a quell'archivio. Quattro copie esterne
conservano record collector, sidecar, rapporto e output del checker;
[audit delle dimensioni/SHA256 e helper letterale](conservazione-verifica.lisp).
Non è dichiarato un confronto letterale byte per byte.

Due controlli conclusivi separati verificano link e catalogo esterno.
I loro report/sidecar sono conservati in quattro copie con
[audit dedicato](final-conservazione-verifica.lisp), fuori dall'archivio
chiuso. Il catalogo è poi esteso per nominarli; l'archivio originale resta
invariato.

Il controllo C4 riguarda la nuova raccolta e il suo catalogo esterno.
Non è stata rieseguita l'intera verifica degli archivi storici, né una
suite del prodotto o un benchmark. L'integrazione generale resta affidata
alla chat che sta raccogliendo tutti i filoni prima del push.

## Due riletture dell'autore

1. Autorità e completezza: stesso oggetto Archivio del replay; forma e
   cardinalità dei tre vettori; CONTROL della vista EQ. Tutti i preflight
   precedono i dati, anche per un'ultima Serie invalida. Reader canonici,
   marker ACTIVE e gate finale comprendono tutte le Serie e DECISION.
2. Confini e costo: limiti per Serie e globali; sottrazioni del residuo
   prima delle somme; 16*N + 8*C = 8*(N+S), senza wrap. Array dopo il gate,
   scratch riusato; risultati privati fino al piano e ai conteggi finali.
   Nessuna close, binding runtime, CSN assegnato o effetto pubblicato.
   Complessità delle funzioni contenuta; disassemblaggio letto senza
   dedurre allocazioni misurate, throughput o latenza.

Due letture dell'autore non sono revisione indipendente. RBA-D01…D11,
MC/DC, fault injection, copertura, misure di memoria/GC/prestazione,
confine COD-24 e qualifica C1 restano aperti. Nessun test nuovo aggiunto
o eseguito localmente. Restano riconciliazione, indici, ammissione e
cleanup del coordinatore. Dati Lisp da leggere con READ-EVAL NIL,
mai da caricare come codice.
