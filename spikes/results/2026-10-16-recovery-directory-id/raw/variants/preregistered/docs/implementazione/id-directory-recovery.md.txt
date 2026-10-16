# ID del nuovo segmento dall'inventario della directory

> Metodo preregistrato il 2026-10-16, prima dell'implementazione.
> Incremento C1 di composizione; nessuna chiusura del Recovery Manager.

## Contratto previsto

`scegli-id-segmento-recovery-directory(manifest, directory, …)` restituisce
tre valori: proposta ID u64, high-water successivo u64 e piano posseduto.
Una sola chiamata a `pianifica-riconciliazione-directory` raccoglie tutti i
nomi fino a EOF, verifica nomi canonici e identità e costruisce il piano.
La scelta riusa quel piano; non enumera nuovamente il namespace e non
ricostruisce descrittori fisici a partire dalle azioni di riconciliazione.

La selezione dal piano viene estratta in un helper privato comune anche
all'API con inventario logico. Restano invariati high-water, esclusione di
ogni ID osservato, controlli u64 e condizioni documentate nel
[contratto della proposta ID](id-segmento-recovery.md).

I cinque budget mantengono nomi, default e semantica dell'adattatore:
`max-files`, `max-segmenti`, `max-names`, `max-total-name-bytes`,
`max-name-bytes`. Anche i nomi ignorati consumano budget I/O. Configurazione,
capacità, inventario, nomi e identità vengono verificati prima della scelta;
un errore originale si propaga senza ID o piano parziali.

Il controller possiede manifest e namespace esclusivi/stabili fino alla
creazione esclusiva del nuovo temporaneo. La directory è presa in prestito:
nessuna chiusura del parent, scrittura, rinomina, rimozione, lettura dei
segmenti o prenotazione. `:ready` resta disponibilità dei nomi, non ammissione
del traffico o verifica di header/CRC. Stessi input possono riproporre lo
stesso ID. Nessun nuovo lock, thread o stato condiviso fra Serie.

Costo: una enumerazione e il planner esistente, poi selezione O(1)
dall'ultima entry ordinata. Allocazioni nel percorso freddo di apertura;
nessuna misura di RSS, throughput o scalabilità prevista.

## Verifica preregistrata

- 1.024 inventari piccoli, tre ordini e v1/v2, confrontati con l'oracolo
  indipendente a ricerca finita: 6.144 proposte, un'enumerazione per chiamata.
- High-water con buchi, temporanei orfani, definitivi sconosciuti, ID zero,
  bit 63 e frontiere u64; piano e salute identici al modello canonico.
- Cinque budget esatti e insufficienti; argomenti errati prima dell'I/O,
  EOF incompleto, nomi malformati, alias, errori originali e parent chiuso.
- Ownership dei nomi/piani, riuso della directory e quattro Serie private
  concorrenti con gate e attese finite nel test.
- File nativi byte per byte immutati dopo successo e rifiuto; directory
  aperta riutilizzabile, ancoraggio al FD anche dopo rinomina del parent.
- Copertura nativa di helper e nuova API, denominatore grezzo conservato;
  nessuna esclusione o estensione del risultato al planner/dipendenze.
- Mutazioni isolate: undici operatori della selezione già esistenti,
  perdita di ciascuno dei cinque budget e seconda enumerazione. Soglia:
  tutti i mutanti compilabili rilevati; errori di compilazione non sono kill.
- Due letture dell'autore con lista C1, indipendenza dichiarata; compilazione
  rigorosa, prova verticale e `make check` registrati con tutti i tentativi.

## Decisioni e prova verticale

RID-D01/D02 e RID-G01/G02/G03 conservano le coppie di indipendenza del
contratto ID. La nuova API delega le decisioni IND-D01…IND-D10 al
[contratto dell'inventario directory](inventario-directory-metodo.md), senza
nuovi predicati composti o reinterpretazioni degli errori.

La fixture verticale adotta nomi canonici a sedici cifre esadecimali con
`.seg`/`.seg.tmp` e usa direttamente la nuova API. Il limite di otto ID
resta un budget della fixture, mentre la raccolta dei nomi passa al prodotto.
Si conservano 16 scenari positivi, due negativi, 71 processi e 26 SIGKILL,
gli attesi costanti di dati/CSN e il confronto dei segmenti originali.
Il caso del checkpoint preparato conserva un temporaneo orfano che deve
essere saltato. Replay dell'indice, ordine del recovery e base CSN della
fixture restano C4; non vengono qualificati dal collegamento dell'inventario.

Requisiti: REQ-REC-001/002, REQ-FOR-003, REQ-AFF-001/004/008/018,
REQ-VAL-001. Invarianti coinvolti: INV-A7/A8/A9/A10/A11 e INV-P6.
