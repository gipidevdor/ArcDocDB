# Verifica della pubblicazione CONTROL

Metodo preregistrato: scrittura degli agenti e due letture C1 prima del freeze; tutte le esecuzioni centrali attraverso record-command, con helper/raw catturati, anche gli errori. Suite backend e native del percorso ACTIVE→checkpoint→pubblicazione→manifest letto dal file. Dodici nuovi test del flush e nove dei trasferimenti coprono cleanup, frontiera catturata e CLOSED conservata.

La copertura control-publication comprende tredici file esatti: otto CONTROL, due preparatori ACTIVE e IO types/flush/transfer. La suite copertura esegue CONTROL e IO con cache privata, indipendente dai benchmark. Nessuna pretesa MC/DC o qualifica completa del recovery, inventario, indici, admission gate o power loss.

Benchmark nativo dopo chiusura degli altri processi di verifica: due formati, uno/due/quattro worker, cinque repliche, otto pubblicazioni per worker/finestra. Setup fixture e oracoli finali esclusi; preparazione con rilettura e pubblicazione con fsync incluse. 30 finestre e 560 pubblicazioni previste. Heap del processo, nessun costo DB o zero heap inferito. Scadenze cooperative e supervisione esterna su host sano, senza garanzia di sblocco delle attese kernel.

Produttori chiusi conservati con nomi relativi e compattazione senza perdita. Cache/copied checkout esclusi dalla pubblicazione; nessuna modifica ai registri storici.

Mutazioni preregistrate del solo completamento I/O: quattro difetti intenzionali (cleanup flush, frontiera flush, cleanup append, CLOSED preservata nei fallisci) su baseline dei 21 nuovi test IO. Il profilo usa l’engine esistente con target di asserzione esatti; crash, compilazione, timeout, IO-FAULT o condizione non prevista non sono rilevamenti. Le mutazioni non attestano tutte le decisioni CONTROL.
