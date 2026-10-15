# Scrittura, crash e riapertura di una Serie

> **Proposta** — Prova C4 di integrazione dei componenti esistenti, con
> orchestrazione seriale esplicita nella fixture. Non è un'API del server.

La [suite](../../tests/vertical/scenarios.lisp) collega preparazione ACTIVE,
WAL/CSN, controller, indice primario e GET. Esegue inserimenti, aggiornamento,
tombstone e letture prima dell'arresto, usando file nativi. Il writer si
arresta con SIGKILL: niente shutdown o cleanup Lisp. Un nuovo processo legge
CONTROL e il decision log completo dell'Archivio, recupera ACTIVE tramite
il lettore autorevole, costruisce e pubblica il checkpoint e rilegge i dati.
Un terzo processo ricostruisce nuovamente indice e letture dai file pubblicati.

| Punto di arresto, in entrambi i formati | Verifica dopo riapertura |
|---|---|
| Cinque commit durevoli | Ultimo valore aggiornato di A, C presente, B cancellato |
| Frammento di 13 byte senza SEAL | Stesso stato committed; coda conservata fisicamente |
| Checkpoint preparato, prima della pubblicazione | CONTROL precedente autorevole; temporaneo conservato; ID preparato non riusato |
| Checkpoint pubblicato e rotazione, poi tre nuovi commit | Letture fra due CLOSED; aggiornamento e tombstone nel secondo segmento prevalgono sul primo |

Gli attesi sono costanti indipendenti dalle risposte del prodotto. Il test
confronta tutti i byte dei segmenti preesistenti dopo il recovery, controlla
segnale 9 e marker del punto di arresto, frontiere, numero di record e valori
letti. Il controllo negativo cambia il valore atteso e richiede l'errore
specifico dell'oracolo, oltre all'uscita non nulla del verificatore.

## Riproduzione

```sh
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- sbcl --noinform --no-userinit --no-sysinit --script tools/vertical-crash.lisp --self-test
make check
```

Il [metodo preregistrato](../../tests/vertical/method.md) definisce budget,
workload e limiti. I [risultati conservati](../../spikes/results/2026-10-15-vertical-crash/README.md)
distinguono sviluppo e controllo completo finale, senza attribuire prove
precedenti a sorgenti modificati successivamente.

## Confine rispetto al prodotto

Bootstrap, inventario limitato a quattro ID, prenotazione dei nomi, ordine
del recovery e replay dell'indice sono codice di test. Il replay accetta
solo record ordinari, dopo verifica di tutti i prefissi CLOSED; rifiuta
prepared/OUTCOME. La pubblicazione seriale dei candidati segue la radice
del controller: non dimostra l'atomicità fra indice e radice sotto concorrenza.
UUID e completezza del namespace sono fatti della fixture.

La riapertura verifica GET correnti; non ricostruisce l'orizzonte CSN per
ammettere nuove scritture o snapshot storici dopo il crash. Il decision log
è vuoto: l'ingresso autorevole viene esercitato, la semantica multiserie
completa resta nelle campagne dedicate. I file sono piccoli e in cache;
nessuna misura di prestazione, power loss o qualifica C1/MC/DC.

La prova rende concreta la composizione di una Serie e il suo recovery.
Resta da trasferire il coordinamento nel motore con contratti, errori e
verifiche propri, integrare MVCC e multiserie, e qualificare carichi prolungati,
GC, piattaforma di riferimento e funzionalità successive della roadmap.
