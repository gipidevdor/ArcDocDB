# ADR-0063 — Completamento e verifica readonly delle immagini primarie

- **Stato:** Accettata nell'integrazione incrementale autorizzata dall'autore il 2026-10-28
- **Data:** 2026-10-28
- **Riferimenti:** ADR-0057, ADR-0058; REQ-IDX-010, INV-I8, INV-A2, INV-A8, INV-P6
- **Rapporto con la specifica:** concretizza un container derivato; nessun emendamento a WAL, SEAL, EDIT, DECISION o catalogo

## Decisione

Un'immagine privata usa una pagina iniziale zero, pagine ARCIPG01 contigue
dallo stesso dominio/generazione e una pagina finale ARCIRF01. La pagina
finale descrive root, numero pagine/entry, seme e legame alla fonte canonica:
Archivio, Serie, CSN e token di 32 byte fornito dal recovery autorevole.
Il token e' un'identita' fidata del piano canonico, non un hash calcolato da
questo codec o una garanzia crittografica. Il controller ne impedisce il
riuso per piani diversi, comprese compaction allo stesso CSN.

ARCIRF01 versione 1 ha checksum CRC32C dell'intera pagina esclusi gli ultimi
quattro byte. Geometria, offset e campi sono specificati nel
[contratto](../implementazione/immagini-indice-paginato.md). La root e'
l'ultima pagina dati: non si sigilla una prova vecchia o un lotto incompleto.
La preparazione collega esattamente il file append al costruttore, scrive
il footer e completa un durable flush prima di restituire. Il costruttore
sigillato non puo' aggiungere altre pagine; un effetto incompleto e' FAULTED.

Al riavvio si legge esclusivamente una capacita' readonly mantenuta viva,
con EOF esatto osservato dal controller. Si verificano footer, fonte e seme,
prefisso, tutte le pagine, digest e chiavi. Ogni entry deve essere ritrovata
dalla root nello stesso slot fisico: due copie della stessa chiave non
possono entrambe superare il controllo, neppure con payload identico.
Un validatore fidato attesta ogni candidato rispetto alla fonte gia'
recuperata, il cui conteggio esatto deve coincidere. Unicita', appartenenza
e cardinalita' esatta stabiliscono la copertura delle entry. Pagine
strutturalmente valide senza entry raggiungibili possono restare inutilizzate;
non si certifica la raggiungibilita' di ogni pagina fisica.

La verifica ha memoria di lavoro limitata, senza bitmap residente di tutte
le pagine o chiavi, e un budget cumulativo di visite. Esaurimento e guasto
non sono assenza di chiavi. Nessuna immagine parziale viene restituita come
pronta. Una vista seriale adotta solo prove readonly verificate della stessa
fonte; il cambio della fonte invalida la vista precedente.

## Autorita', rollback e limiti

Il footer e' un indicatore di completamento del derivato, **non un commit**
di dati o una nuova fonte di verita'. Un'immagine completa sopravvissuta
anche senza conferma di flush puo' essere rivalidata readonly: la validita'
dipende dai byte e dalla fonte committed, non dalla storia del suo ACK.
Un'immagine incompatibile/corrotta non modifica la fonte: il futuro
controller scegliera' esplicitamente ricostruzione o errore.

Questo incremento non autorizza una rinomina tramite un'API che richiede una
decisione di catalogo assente. Nome canonico, inventario, riuso dei derivati
nello startup M1, delta writer, MVCC e migrazione automatica restano da
integrare. La pubblicazione qui e' soltanto la radice della vista seriale
privata; non si dichiara uno swap concorrente o durevole nel catalogo.
Il rollback rimuove un container derivato, ricostruibile dalle fonti: nessuna
migrazione o cancellazione di dati utente e nessun nuovo lock fra Serie.
