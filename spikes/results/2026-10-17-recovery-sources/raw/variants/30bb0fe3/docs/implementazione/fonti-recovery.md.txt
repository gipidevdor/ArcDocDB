# Fonti possedute per il recovery della Serie

`arcdocdb.recovery.manifest:apri-fonti-recovery` collega il planner directory
all'apertura readonly relativa. Restituisce due valori: insieme posseduto dei
segmenti vivi e piano completo, con anomalie/rimozioni ancora esplicite.
Il [metodo preregistrato](fonti-recovery-metodo.md) definisce responsabilità,
decisioni e prove prima del codice. Nessun nuovo formato o punto durevole.

| API | Contratto |
|---|---|
| `apri-fonti-recovery(manifest, directory, …)` | Una enumerazione completa; tutti e soli ACTIVE/CLOSED in ordine u64, piano READY obbligatorio |
| `numero-fonti-recovery(set)` | Numero immutabile di fonti, anche dopo close |
| `fonte-recovery(set, index)` | Cinque valori: ID, stato, forma, capacità readonly prestata, EOF dello stesso FD |
| `chiudi-fonti-recovery(set)` | Invalida prima, tenta ogni child, ripetizione senza syscall |

Un solo proprietario mantiene il set e termina i reader prima della chiusura.
Non chiude i singoli child; parent e manifest restano del chiamante e non sono
trattenuti dal risultato. Configurazione e callback sono verificate prima
dell'enumerazione. Il namespace deve restare esclusivo e stabile; nessuna
cancellazione asincrona durante acquisizione/close. L'apertura POSIX non è
uno snapshot del filesystem. Temporanei vivi sono aperti con il loro nome;
REMOVED, UNKNOWN e temporanei orfani restano intatti.

I cinque budget dell'[inventario](inventario.md#raccolta-dalla-directory) e i
due budget dell'[apertura relativa](io-apertura-relativa.md) mantengono
semantica/default. `max-total-file-bytes` aggiunge il budget cumulativo degli
EOF vivi (default 4 GiB−1, intero `index`, zero ammesso). È un budget di
acquisizione, senza promessa RSS; uguaglianza valida e somma senza wrap.
Il set possiede anche il child che fa superare il budget per chiuderlo.

Su errore si tentano tutti i close già acquisiti. Se riescono, la stessa
condizione primaria viene propagata. `recovery-sources-cleanup-error`
conserva tramite `recovery-sources-primary` la causa iniziale (NIL per close
esplicita), tramite `recovery-sources-cleanup` il primo IO-FAULT del cleanup
e tramite `recovery-sources-cleanup-count` il numero delle close fallite.
Un guasto nell'apertura del child corrente è già pulito dallo strato I/O,
che conserva il proprio eventuale `cleanup-errno`. Non si riprova close:
il FD può essere stato riutilizzato. Il set resta invalidato anche dopo errore.

`:ready` certifica solo disponibilità dei nomi. Header, identità logica del
segmento, CRC, prefisso, chiusura dell'ACTIVE, replay degli indici, CSN e
ammissione restano dei reader e del futuro Recovery Manager. Nessuna
rinomina, cancellazione, scrittura, flush, prenotazione o allocazione CSN.

La prova verticale usa il set per ACTIVE e CLOSED e lo chiude dopo tutti i
reader; elimina la scansione manuale degli ID CLOSED 1…8. Il limite otto
resta una capacità della fixture C4. I risultati non qualificano l'intero
motore; copertura C1, MC/DC, secondo revisore e piattaforma restano aperti.

## Due letture C1 dell'autore, prima dei run

Prima lettura: REQ/ADR e INV-A7/A8/A9/A10/A11/P6 coerenti; nessuna modifica
durevole; parent borrowed e figli posseduti; configurazione verificata prima
dell'I/O. Seconda lettura: cleanup completo anche dopo più errori, condizione
primaria originale e totale senza overflow; cicli limitati da piano/vettori;
nessun dato parziale pubblicato, lock o scrittura fra Serie; allocazioni solo
nel percorso freddo. Decisioni FRS-D01…D07 nel metodo e test FI nominati;
compilazione, trace, lint, link e controllo completo da eseguire e conservare.
Le due letture sono dell'autore e non soddisfano la revisione indipendente.
