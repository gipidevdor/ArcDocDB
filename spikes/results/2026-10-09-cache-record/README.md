# Cache dei record: implementazione e analisi statica

Campagna iniziata il 2026-10-09 e ripresa il 2026-10-11. Ambito: partizioni associative CLOCK e verificatore
PUT comune con CSN in due parole, senza eseguire le nuove API.

Metodo: compilazione del solo prodotto, avvisi come errori; controlli
statici di codifica, tracciabilità, collegamenti e conservazione;
ispezione del disassemblato ARM64. I comandi conservano argv, ambiente,
output integrale, esito e sorgenti prima/dopo. Le letture sono locali
dell’autore, non revisione indipendente o qualifica concorrente.

Nessun test, modello, fault injection, benchmark o auto-verifica degli
strumenti eseguito localmente. Le evidenze statiche non dimostrano
linearizzabilità, assenza di allocazioni o prestazioni del DB.
Contratto e decisioni in [cache-record](../../../docs/implementazione/cache-record.md).

Le due letture locali distinguono protocollo/identità e memoria/CLOCK.
Hanno corretto il divieto eccessivo di alias nell’input prepared e ristretto
i tipi di posto/insieme. Le varianti precedenti di compilazione e analisi
sono conservate. Sul disassemblato ARM64 finale sono presenti le barriere
attese; i rami generici di overflow dei kernel cache selezionati sono
stati eliminati. Rimangono aperte le misure e la verifica concorrente.
