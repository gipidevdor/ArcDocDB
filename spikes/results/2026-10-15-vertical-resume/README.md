# Ripresa delle scritture dopo il recovery — 2026-10-15

[Contratto e confini](../../../docs/implementazione/prova-verticale.md) ·
[Metodo preregistrato](../../../tests/vertical/method.md) ·
[Inventario chiuso](archive-index.lisp)

## Campagna di sviluppo

Il [terzo tentativo](processes/development-03/report.lisp) è OK, exit 0,
STABLE, in 43,576398 s, con stderr vuoto. Il comando è il self-test di
`tools/vertical-crash.lisp`: quattro test nominati, 16 scenari positivi,
due negativi, 71 processi e 26 SIGKILL intenzionali. Sono tempi di verifica,
non misure di prestazione del database.

Per ogni formato v1/v2 e punto di arresto precedente, il nuovo processo
verifica i CLOSED e l'ACTIVE vuoto, ricostruisce la base CSN e crea un
ambiente distinto con registro comune a WAL, snapshot e controller.
Quattro commit inseriscono E, aggiornano C e cancellano A/E. GET e H
sono verificati immediatamente. Seguono SIGKILL, recovery e verifica
in processi nuovi. Gli attesi sono costanti; l'ultimo CSN appartiene
alla tombstone di E. Tutti i byte preesistenti restano identici.

Il negativo reinizializza il registro a zero: l'errore tipizzato
`VERTICAL-CSN-MISMATCH` è richiesto prima dell'append, con il nuovo ACTIVE
ancora di 64 byte. Il negativo precedente sul valore GET resta attivo.

| Tentativo originale | Esito e causa |
|---|---|
| [01](processes/development-01/report.lisp) | Fallito nel primo workload: la nuova fixture scambiava il numero di byte sigillati per lo slot CSN |
| [02](processes/development-02/report.lisp) | Fallito dopo gli scenari precedenti e tre riprese v1: l'oracolo dell'indice pretendeva una rimozione anche per A già assente dopo rotazione |
| [03](processes/development-03/report.lisp) | Riuscito; l'assenza preesistente viene confermata dal GET, tutte le riprese e i negativi passano |

Le copie `raw/development-01`…`03` conservano sette sorgenti per variante,
compresi driver, ASDF e metodo. L'audit confronta 21 file con i blob dei
rispettivi record STABLE e verifica che le tre varianti del supporto siano
distinte. Il primo supporto è ricostruito prima della pubblicazione e il
suo blob coincide con quello originale; non viene presentato come una
copia catturata durante il primo tentativo.

## Revisione e limiti

Una revisione C4 controlla oracoli, budget, ownership, identità del registro,
ordine di verifica/replay e conservazione dei byte; la lista è nel contratto.
Nessun sorgente in `src/` è modificato. Bootstrap, inventario fino a otto ID,
replay e selezione della base restano C4; una sola Serie con soli record
ordinari e decision log vuoto. Non è una qualifica del Recovery Manager,
della frontiera dell'Archivio, di snapshot storici, multiserie, concorrenza,
power loss o prestazioni. Il controllo completo viene conservato separatamente.

## Conservazione

Manifest esplicito, quattro worker e checker indipendente dell'inventario
chiuso. Report e sidecar originali restano byte-identici, compresi i
fallimenti. I documenti copiati usano `.md.txt`: i link della documentazione
originale non vengono reinterpretati nella copia. Gli artefatti sono dati,
da leggere con READ-EVAL NIL, mai da caricare come codice.
