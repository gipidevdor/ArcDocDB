# Audit delle copie della prima campagna GET ACTIVE

Questa raccolta conserva integralmente sorgenti, contratto, output e
registrazioni dei due audit della [raccolta iniziale](../2026-10-13-get-active/).
Entrambi appartengono al freeze `42dcad77530c09784f9d77fabb92ff4477927983`.
I report sono dati, mai codice da caricare.

R1 termina con exit 0 e verifica la raccolta, ma il suo helper emette
un avviso per una coda costante usata da SORT. La console stampa inoltre
contatori ridotti a uno dopo NREVERSE; i dati contengono le liste complete.
Il sorgente originale e gli output rimangono invariati e conservati.

R2 usa un nuovo helper con due correzioni locali: coda LIST fresca prima
di SORT e contatori ricavati dal report. Passa con exit 0, nessun avviso,
inventari e SHA stabili: 1.009 entry, 26 gruppi, nove comandi e nove report
nativi, 918 FASL e quattro gzip espanse. Tutte le 1.009 fonti disponibili
corrispondono alle copie. Il totale delle entry è 39.455.425 byte.
Gli originali e i fallimenti della campagna restano attribuiti ai propri
record; l'audit non trasforma cataloghi o errori d'uso in esiti di prodotto.
