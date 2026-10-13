# Fonti GET pubblicate dal controller Serie

Incremento da `4344d9e`: contenitore immutabile della directory CLOSED nel
contenuto della radice ACTIVE, oppure radice iniziale CLOSED. Una sola
lettura acquire del controller dopo il lookup sotto EBR sceglie la fonte.
Il resolver ACTIVE riceve la stessa radice catturata, senza rilettura.

## Piano prima delle esecuzioni

- Directory e contenuto immutabili; owner canonico della vista; ID ACTIVE
  distinto da tutti i CLOSED prima dell'adozione e durante l'acquisizione.
- Pubblicazione tramite il controller/WAL esistente; radici preparate mai
  esposte dal ponte ai reader. Copertura e punto durevole SEAL invariati.
- Sonda senza I/O, lettura comune con cinque esiti, OUTCOME ancora riletto.
- Wrong-state senza sottrarre il pin; errori successivi rilasciano EBR;
  root/associazione interna impossibili producono FAULTED.
- Test nativi ACTIVE/CLOSED, pubblicazione pianificata contro effettiva,
  fault injection, interleaving deterministici e reader paralleli limitati.
- Due letture statiche indipendenti, compilazione senza avvisi,
  copertura con denominatore completo, baseline isolata e mutanti mirati.
- Benchmark con setup fuori dai clock, conteggi fissi e oracoli completi;
  heap del processo distinto da RSS e costi paralleli espliciti.

Tre agenti hanno scope disgiunti: suite, strumenti, documentazione/revisione.
L'autore implementa il ponte e integra. Tutti gli agenti che possono scrivere
sono chiusi prima delle esecuzioni accettate. Ogni comando passa dal
registratore strutturato; errori e tentativi precedenti rimangono conservati.

## Limiti del protocollo

Il writer deve pubblicare le fonti prima delle location, mantenendo un
superset delle fonti che reader già ammessi possono ancora osservare.
La lettura acquire dopo il lookup non basta ad autorizzare il ritiro di
una fonte. Rotazione, compaction, rilocazione del primary e reclaim completo
rimangono sviluppi distinti. Questo incremento non chiude FD né elimina file
e non qualifica il motore completo C1.

Il collector locale `collect.lisp` deriva dal collector della campagna
directory, con destinazione e scope di questa campagna; il suo sorgente
invocato è conservato come `publication-tool-source.txt`. Il manifesto
esplicito lega ogni raw al record produttore chiuso, anche quando fallito.
`tools/get-series-capture.lisp` conserva nello stdout del produttore i
digest raw alla fine del comando e i digest degli helper prima/dopo
l'invocazione. Il collector confronta inventario, comando e radice prima
delle copie. Non è un'attestazione contro un host ostile; nessun writer
rimane attivo durante le esecuzioni accettate.
Raw grandi sono compressi senza perdita; FASL e checkout isolati ricostruibili
sono esclusi. I cataloghi sono verificati prima della pubblicazione finale.
