Input della pubblicazione dell'inventario directory della Serie.

Le copie sotto variants/S1, variants/S2 e variants/S3 sono ricostruite ORA
da Git con git show, non sono snapshot catturati durante le esecuzioni.
Ogni copia e' autenticata contro il blob Git esplicito e ha byte/SHA256
registrati in capture-provenance.lisp. Le estensioni .txt conservano byte
originali di codice e documentazione: non sono programmi da caricare.

Sono presenti 12 copie delle quattro fonti dei tre commit e cinque altre
fonti S3 (tre test, ASD, metodo), oltre a due copie del contatore qualificato
e della sua autenticazione precedente: 19 file di ingresso. La sola riga
console della ricostruzione ha stampato 1 dopo NREVERSE distruttivo della
lista locale; la plist salvata conserva le 19 entry e i file sono verificati
separatamente. Non e' un conteggio di test o un'omissione di copie.

Il contatore 1cb93fc e' conservato byte-identico: il suo tentativo S1 e'
FAILED per il runner verticale upstream manuale, non per i 19 nuovi nomi.
I record nativi originali restano autorevoli per commit, argv, stato,
output e attribuzione delle singole esecuzioni. Nessun fallimento e'
promosso a successo dalla ricostruzione o dalla futura raccolta.

Il manifest candidato comprende soltanto gli otto gruppi di comandi noti
una volta concluso R3. I file R3 non sono letti o copiati mentre RUNNING.
Reader, snapshot, SPK e verifiche documentali potranno essere aggiunti dal
root al piano definitivo dopo la rispettiva chiusura. Nessuna raccolta e'
stata eseguita; le cache ASDF complete restano fuori dalla pubblicazione
e vanno preservate nel backup ignored esterno finale.

R3 locale e' attribuito soltanto a S3. L'eventuale CI sull'head integrato
con main sara' una qualifica distinta; nessun R4 locale duplicato e'
pianificato e nessun risultato CI e' dichiarato da questi input.
