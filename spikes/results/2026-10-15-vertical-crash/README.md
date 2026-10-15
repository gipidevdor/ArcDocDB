# Prova verticale con SIGKILL — 2026-10-15

[Contratto e confini](../../../docs/implementazione/prova-verticale.md) ·
[Metodo preregistrato](../../../tests/vertical/method.md)

## Sviluppo

Il [primo self-test riuscito](development-05-report.lisp) esegue otto scenari:
v1/v2 × commit durevoli, coda senza SEAL, checkpoint preparato, rotazione
con nuovi commit. Ogni scenario usa un writer arrestato con segnale 9,
un processo di recovery e un verificatore nuovo. Un nono workload verifica
che un atteso errato produca errore e uscita non nulla: 28 processi totali,
di cui nove SIGKILL intenzionali e un errore atteso.

Sono controllati aggiornamenti, tombstone, valori, frontiere e conservazione
integrale dei segmenti preesistenti. Il caso di rotazione verifica due
segmenti CLOSED; il caso TAIL conserva tredici byte oltre il prefisso.
Il checkpoint non pubblicato resta separato e il suo ID non viene riusato.
Nessun sorgente di prodotto è modificato.

I tentativi precedenti restano distinti e falliti:

| Record | Causa nella nuova fixture |
|---|---|
| [01](development-01-report.lisp) | Parentesi mancante: errore di lettura, nessun test eseguito |
| [02](development-02-report.lisp) | Seme dell'hash dell'indice non configurato |
| [03](development-03-report.lisp) | Primo scenario passato; controllo TAIL fallito, diagnostica del figlio omessa dal parent prima dell'asserzione sul marker |
| [04](development-04-report.lisp) | Stesso fallimento TAIL, ora con stderr del figlio: atteso incremento invece della posizione assoluta restituita da append |

Il run 03 conserva soltanto l'output effettivamente raccolto: lo stderr
del figlio TAIL non è recuperabile e non viene inventato. Il parent è
stato corretto per riportare entrambi gli stream prima delle asserzioni.
Il run 05 riguarda la variante prima dell'errore tipizzato dell'oracolo e
del budget fisico 8 KiB, aggiunti per il controllo completo finale.

## Controllo completo finale

[`make check`](full-check-report.lisp) è **OK / exit 0 / sorgenti STABLE**,
con base Git `b2536f616f34f297aec7ba67b77096cd556271cc` e modifiche locali
identificate dai blob nel record. Durata dell'intero comando: 342,115011 s;
è tempo di verifica, non una misura di prestazione del database.

La variante finale esegue nuovamente gli otto scenari e il controllo
negativo tipizzato `VERTICAL-ORACLE-MISMATCH`, insieme a tutte le suite
preesistenti. Passano compilazione stretta, linter e fixture negative,
tracciabilità (122 requisiti, 65 invarianti, 13 FI, 52 ADR), collegamenti
(691 file, 3.257 link, nessuno rotto), conservazione e dieci spike check.
La stampa del controllo negativo contiene l'errore previsto; non è un
fallimento della suite. Le note del compilatore e gli output originali,
inclusi i fallimenti intenzionali degli strumenti, rimangono nel record.

Ambiente locale: SBCL 2.6.9, Darwin 27.0.0 ARM64, Apple M4, RAM 16 GiB;
carico esterno non controllato. Il descriptor conserva l'identità e la
dimensione dei 1.905.393 byte originali; il payload gzip è una copia esatta
di quello concluso dal registratore. Le copie `.lisp.txt` conservano i
quattro sorgenti C4 finali, il metodo come `.md.txt` e la registrazione ASDF.

## Limiti

Questa è una prova C4 seriale su file piccoli, con bootstrap, inventario,
prenotazione degli ID e replay dell'indice espliciti nella fixture.
Il decision log autorevole è vuoto. Non qualifica Recovery Manager,
ricostruzione di H/CSN per nuove scritture, snapshot storici, concorrenza
radice/indice, multiserie, compaction, power loss, C1/MC/DC o prestazioni.

## Conservazione

Il [catalogo](catalogo.lisp) conserva report originali e sidecar, compresi
i fallimenti. Ogni record include comando, ambiente, commit e blob dei
sorgenti prima/dopo, stdout/stderr, stato ed exit code. Gli hash identificano
anche le modifiche non committed. I file sono copiati byte per byte dalle
directory originali indicate nei sidecar; non sono caricati come codice.

L'[audit delle copie](audit-report.lisp) è OK / exit 0 / STABLE: 19 coppie
identiche per SHA-256, 12 riferimenti strutturati della pubblicazione iniziale
e sei sorgenti identici ai blob del controllo completo. Comprende il payload
gzip e verifica l'integrità espansa e i budget dei file. Il rapporto di audit
e il [controllo dei collegamenti](links-report.lisp) sono conservati in seguito,
come record originali distinti: l'audit non autocertifica la propria copia.

Il successivo [controllo della documentazione NNTP](intent-docs-report.lisp)
esegue collegamenti e tracciabilità dopo la conferma dell'obiettivo applicativo.
È distinto dalle prove del motore: documentare il caso d'uso non qualifica
un server NNTP né attribuisce i risultati verticali al protocollo.
