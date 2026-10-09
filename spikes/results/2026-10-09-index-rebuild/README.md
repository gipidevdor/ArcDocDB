# Campagna indice v2 e ricostruzione — 2026-10-09

Metodo fissato prima delle esecuzioni: compilazione senza avvisi e suite
integrata; prove degli slot, ricerca, writer e concorrenza; test negativi
della ricostruzione; copertura SB-Cover separata; quattro mutanti concreti
con compilazione riuscita e fallimento nel test nominato. Timeout o errori
di compilazione non contano come mutanti rilevati.

Ogni comando è racchiuso nel registratore strutturato con argv, ambiente,
commit, hash delle sorgenti prima/dopo, output originali, stato e durata.
Si conservano anche i rifiuti. Le sorgenti restano ferme durante le prove.
I benchmark vengono eseguiti dopo i controlli, senza copertura o altri
controlli pesanti in parallelo. Carico esterno non controllato.

Il collector conserva i registri come dati, le pagine di copertura con
percorsi relativi, i sorgenti mutati e la propria versione. Raw grandi
compressi senza perdita con verifica SHA-256 dei byte decodificati;
nessuna copia dei FASL o delle copie ricostruibili dei checkout.

Contratto: [ricostruzione](../../../docs/implementazione/indice-ricostruzione.md).
La campagna non qualifica il motore completo, il GET, NVMe o x86-64.
