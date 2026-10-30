# Delta seriale dell'indice M1

> **Deciso (integrazione incrementale autorizzata → ADR-0067)** — REQ-IDX-010,
> INV-I8, INV-I1, INV-A8, INV-P6. C1, owner unico M1, nessun nuovo stato fra Serie.

```lisp
(arcdocdb.engine:attiva-indice-paginato-motore engine option
  :delta-keys 1024 :delta-key-bytes 65536
  :max-activation-payload 16777216)
```

L'immagine e' verificata sulla fonte corrente come in
[ADR-0066](../adr/0066-attivazione-seriale-immagini-m1.md). Con delta abilitato,
PUT e DELETE la conservano aperta. GET usa il residente per le chiavi toccate,
il paginato per tutte le altre. DELETE trattiene membership anche se la
chiave non esisteva, quindi il vecchio valore non puo' riapparire. La copia
completa distingue collisioni, lunghezze e prefissi; il digest non e' una prova.
`modo-indice-motore` restituisce `:paged` mentre l'immagine e' attiva,
anche se una specifica GET viene risolta dal delta residente.

Le opzioni sono coppie zero/zero (default, comportamento precedente) oppure
1..65536 chiavi e 1..16777216 byte. Sia C la minima potenza di due almeno
2 * delta-keys: il payload aggiuntivo e' `16*C + delta-key-bytes`.
Il preflight include il delta precedente ancora vivo e quello nuovo;
header, oggetti, GC e RSS restano nella riserva del controller, non qualificata qui.
Due array preallocati, nessuna copia caller trattenuta o allocazione intenzionale
nelle sonde e nelle registrazioni. Al massimo C sonde, ognuna confronta
al massimo la lunghezza della chiave (65535 byte); nessuna attesa o ricorsione.

Esaurire una quota genera RESOURCE-EXHAUSTED prima del CSN/WAL, senza mutare
la membership. Una chiave gia' toccata puo' aggiornarsi anche a quota piena.
Per liberare quota il controller costruisce un nuovo nome con il produttore
M1 e lo attiva: verifica la fonte corrente e pubblica un delta vuoto.
Non si puo' riattivare il vecchio derivato dopo una scrittura.

Il commit registra la chiave soltanto dopo BUSY, prima del WAL; non presta
location. SEAL e' il punto durevole. Errori o uscite non locali dopo admission
rendono FAULTED; la membership parziale non e' leggibile. Dopo SIGKILL il
replay canonico ricostruisce PUT e tombstone; il delta volatile viene scartato.
Startup senza candidato resta residente; startup con candidato obsoleto fallisce.
Ritiro e cleanup invalidano insieme delta, vista e FD; swap e' solo privato.

## Decisioni C1 e verifica

| Decisione | Copertura |
|---|---|
| Forma delle due quote, limiti inclusivi e zero/zero | valori fuori range, non interi, coppie discordanti, default e attivazione valida |
| Digest high/low, lunghezza e confronto byte | digest forzato uguale con byte diversi, high/low diversi, lunghezza diversa, span interno |
| Slot vuoto o chiave trovata | chiavi nuove, aggiornamenti ripetuti, saturazione artificiale bounded |
| Quota chiavi oppure byte superata | due fixture separate, nessun effetto su CSN/WAL/file; aggiornamenti a quota piena |
| Delta presente e immagine presente | default senza delta, attivo, invariante violato con FAULTED |
| GET su paginato e chiave non toccata | PUT, DELETE/resurrezione, assenti originali e chiavi intatte |
| Admission BUSY per pubblicazione e lettura | guardie dirette e richieste pubbliche; errori/nonlocal exit al commit |
| Vecchio delta nella quota di attivazione | quota esatta, un byte insufficiente, disabilitazione e rimpiazzo |

Due letture C1: prima su fonte, collisioni, tombstone, preflight e ordine
membership/SEAL; seconda su ownership, limiti dei cicli, memoria e guasti.
Nessuna modifica dei formati canonici o nuovo punto durevole. La membership
non risolve la capienza del residente e non costituisce un backend writer
paginato autonomo. Prove riproducibili e limiti nel
[registro](../../spikes/results/2026-10-29-engine-image-delta/report.md).

## Rinnovo della quota

La [richiesta unica di rinnovo](rinnovo-indice-m1.md), introdotta da ADR-0068,
costruisce e attiva una nuova immagine con delta vuoto sotto BUSY continuo.
Il preflight riserva il payload di tutte le fasi prima di creare il file.
