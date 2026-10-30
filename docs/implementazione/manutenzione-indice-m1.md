# Manutenzione a soglie dell'indice M1

> **Deciso (integrazione incrementale autorizzata → ADR-0069)** — C1,
> REQ-IDX-010, REQ-LIM-003, INV-I8, INV-I1, INV-A8, INV-P6.

```lisp
(defparameter policy
  (arcdocdb.engine:crea-politica-rinnovo-indice :soglia-percentuale 75))
(arcdocdb.engine:rinnovo-indice-richiesto-p engine policy)
(arcdocdb.engine:mantieni-indice-paginato-motore engine policy fresh-option
  :max-maintenance-payload 67108864 :max-pages 65536)
```

Configurazione immutabile, soglia intera 1..100, default 75. Serve una vista
paginata con delta attivo, owner READY e controller sano. La decisione e'
vera se `count*100 >= key-limit*percent` oppure
`used*100 >= arena-bytes*percent`. I prodotti, anche dagli slot u32, restano
nei fixnum SBCL64. Nessuna divisione, arrotondamento o accesso ai file.
Con quota tre e soglia 75, due chiavi non bastano: la terza la raggiunge.
Soglia 100 richiede che almeno una delle due quote sia piena.

La sonda e' readonly sul percorso valido; controlla capienza dei contatori,
byte almeno pari alle chiavi (chiavi non vuote) e coerenza dello stato vuoto.
Contatori corrotti o delta senza vista causano FAULTED. Un modo senza delta
produce INVALID-ARGUMENT senza effetti. Non si consulta una stima di memoria
OS e non si prenota la prossima chiave: il normale preflight PUT/DELETE resta
obbligatorio e puo' ancora rifiutare una chiave troppo grande.

La manutenzione restituisce `:mantieni` sotto soglia. Non controlla il
namespace, non consuma il nome e non modifica immagine, FD, delta o CSN.
Il candidato puo' essere riproposto fino al primo rinnovo riuscito. I domini
di budget (0..512 MiB) e pagine (1..65536) sono validati anche nel no-op.
Quando serve, il [rinnovo seriale](rinnovo-indice-m1.md) verifica nome nuovo
e payload complessivo, costruisce dal canonico corrente e pubblica un delta
vuoto con gli stessi limiti di chiavi e byte. Il candidato e' allora consumato:
il rinnovo successivo richiede un altro nome fresco. `:rinnovato` non e' una
conferma di scrittura documentale e non avanza CSN.

Nessun callback fra decisione e delega; la serialita' M1 esclude mutazioni
concorrenti. Dopo admission del rinnovo valgono BUSY, verifica della fonte,
close e FAULTED di ADR-0068. La policy non aggiunge nuovi cicli, attese,
risorse I/O o scritture condivise fra Serie. Non implementa timer, retry,
startup automatico o scelta automatica del backend; il controller decide
quando chiamarla e quale nome/configurazione offrire.

## Decisioni e revisione C1

| Decisione composta | Prove |
|---|---|
| Soglia fixnum e 1..100 | 0, 101, NIL, float, razionale; 1, 75, 99, 100 validi |
| Contatori entro limiti: chiavi <= quota e chiavi <= byte <= arena | ogni confronto falsificato separatamente; stato vuoto incoerente |
| Soglia chiavi oppure soglia byte | casi indipendenti sui motori reali; uguaglianza e byte adiacenti, quote massime |
| Dominio budget e dominio pagine | singoli limiti e non interi; validazione anche nel no-op |

Le restanti scelte sono rami singoli: presenza delta/vista, necessita' di
rinnovo e confine errori. Sei casi dedicati includono entrambi i formati,
tre taglie pagina, quota totale esatta/insufficiente, nome occupato,
reentrata/uscita non locale prima e dopo lo swap, wrong owner e due motori
che condividono la stessa policy senza mutazioni reciproche.

Due letture C1: soglie, indipendenza dei due contatori e fonte canonica;
poi dominio numerico, no-op, ownership/errori delegati e isolamento fra Serie.
Le decisioni interne del rinnovo conservano la relativa tabella e le prove
SIGKILL esistenti. [Evidenze e limiti](../../spikes/results/2026-10-30-engine-image-maintenance/report.md).

Il residente resta completo; nessuna qualifica di memoria RSS, throughput,
writer paginato autonomo, catalogo durevole o scheduler concorrente.
