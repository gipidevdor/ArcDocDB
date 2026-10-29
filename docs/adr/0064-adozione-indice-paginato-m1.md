# ADR-0064 — Adozione seriale delle immagini primarie nello startup M1

- **Stato:** Accettata nell'integrazione incrementale autorizzata dall'autore il 2026-10-29
- **Data:** 2026-10-29
- **Riferimenti:** ADR-0057, ADR-0058, ADR-0063; REQ-IDX-010, INV-I8, INV-A2, INV-A8, INV-P6
- **Rapporto con la specifica:** concretizza il collegamento M1; nessun emendamento ai formati autorevoli

## Decisione

M1 puo' ricevere un candidato privato esplicito `primary-<16 hex>.idx.tmp`
nella directory gia' esclusiva del motore. La selezione del nome non e' una
decisione durevole, non abilita rinomina o cancellazione e non sostituisce
CONTROL/WAL. L'inventario dei segmenti continua a ignorare questo nome estraneo.
Nessun nuovo documento di catalogo viene introdotto. La selezione e' incompatibile
con CREATE, che richiede una directory vuota: la combinazione e' rifiutata prima dell’I/O.

Il recovery completa i gate e il checkpoint canonici e ricostruisce il
residente. Solo allora verifica il derivato contro una fonte ricavata dal
replay: UUID Archivio/Serie, ultimo CSN, cardinalita' viva esatta e un token
di 32 byte. Nel solo profilo M1 append-only il token codifica quattro u64
little endian: versione dati, ID segmento, offset e lunghezza dell'ultimo
record committed, PUT o tombstone. Prima del primo record contiene la
versione e tre zeri. Il CSN zero non e' usato come indicatore di assenza.

La validita' dell'identita' del prefisso discende dai segmenti immutabili,
dagli ID mai riusati e dal rifiuto M1 di compaction, prepared e rimozioni.
Checkpoint e nuovi ACTIVE vuoti non cambiano la fonte. Non e' un hash del
dataset: estendere M1 a riscritture/compaction richiede un nuovo legame
canonico; questa regola non e' riutilizzabile per quei piani.

Ogni candidato viene confrontato con il residente ricostruito, normalizzando
il solo offset dell'arena, estraneo al formato paginato. Cardinalita',
appartenenza e unicita' gia' verificate da ADR-0063 chiudono la copertura.
Il motore possiede il medesimo FD readonly fino al close, anche dopo il ritiro.
Un candidato esplicito mancante, incompatibile, corrotto o oltre budget
rifiuta lo startup senza admission e senza fallback. Il checkpoint dei dati
puo' essere gia' completato: il rifiuto non e' un rollback del recovery canonico.

Il GET M1 usa un selettore fidato e seriale del controller, immutabile nella
vista GET. Un solo lookup produce il candidato; risoluzione del segmento,
controlli del record e copia del valore restano nel resolver esistente.
Nessun errore del paginato viene reinterpretato come assenza o ripiego.

Le verifiche ordinarie di input e capienza precedono il ritiro. All'ingresso
di una scrittura ammessa, prima del commit, il motore ritira il riferimento
privato all'immagine e torna al residente. Il commit aggiorna il residente e
la fonte prima dell'ACK; errori successivi chiudono admission secondo il
protocollo M1 esistente. Il ritiro non alloca e non modifica/chiude il derivato.

## Limiti e seguito

Il residente resta presente ed e' ancora il limite di capienza del writer:
questa integrazione non dimostra dataset oltre RAM e non attua la selezione
automatica di ADR-0057. Costruzione completa dal motore, delta writer,
catalogo durevole, reclamation, snapshot e swap concorrenti restano separati.
La selezione esplicita e' un ingresso di integrazione del controller, non
il contratto finale di configurazione automatica del prodotto.

Rimuovendo l'opzione di selezione, il successivo startup usa il residente;
il file derivato resta intatto. Nessuna migrazione dei dati o nuovo lock
tra Serie. Contratto, decisioni e prove nel
[collegamento M1](../implementazione/indice-paginato-m1.md).
