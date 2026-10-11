# Directory GET dei segmenti CLOSED

Incremento dal commit `6eeb501`: directory immutabile della Serie, selezione
limitata del segmento dal candidato, resolver CLOSED e nucleo GET esistenti.
Tre agenti preparano suite, benchmark e mutanti; l'autore integra il prodotto.
Le esecuzioni avvengono soltanto dopo il congelamento di sorgenti e strumenti,
con registri strutturati anche per fallimenti o sorgenti cambiati.

## Piano preregistrato

- Input ordinato, identità canonica, ID intero u32 positivo, FD readonly aperto.
- Budget prima delle copie; array privati; directory vuota; massimo 65.536 segmenti.
- Ricerca entro diciassette passi; location pubblicata senza segmento è guasto.
- CRC/chiave/CSN/OUTCOME verificati dal resolver e GET, nessun I/O nella sonda.
- Cleanup, snapshot, lettori reali paralleli e risposta privata con sentinelle.
- Revisione statica, compilazione senza avvisi, copertura, mutazione, strumenti C4.
- Conteggi benchmark fissi, oracoli e limiti della misura registrati prima delle finestre.

Directory ACTIVE, rotazione, pubblicazione dell'indice e reclaim restano
integrazioni distinte. Queste prove non qualificano il motore completo C1.
I raw oltre 1 MiB sono compressi senza perdita; payload e SHA256 verificati.
Cache compilate e copie complete ricostruibili non sono pubblicate.
Ogni radice raw è esplicita nel manifesto e legata a un registro produttore
terminato e conservato. Il suo stato rimane associato ai raw: un produttore
fallito può aver lasciato dati parziali, senza promozione a prova positiva.

## Correzione emersa prima delle esecuzioni

La lettura statica delle fixture native ha identificato un errore preesistente
in `src/get-resolver/build.lisp`: `leggi-esatto` restituisce END, mentre il
costruttore confrontava END−64. Il confronto è corretto prima del freeze.
La regressione dedicata legge un file reale in un buffer da offset 64,
confronta il ritorno END, tutti i byte e le sentinelle anteriori. Le altre
fixture costruiscono le mappe mediante questa stessa API, senza sostituirla.
Questa osservazione statica non è una prova dinamica fallita.
