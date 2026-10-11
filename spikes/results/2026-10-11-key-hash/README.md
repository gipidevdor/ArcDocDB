# Campagna hash delle chiavi — 2026-10-11

Metodo preregistrato prima delle esecuzioni: build senza avvisi, oracolo
aritmetico indipendente e vettori XXH64, span e limiti v2, semi in entrambe
le meta u32, arita pubblica e immutabilita, worker reali con attese limitate.
La mappa dei digest viene verificata con lookup, rebuild e split reali.

I comandi sono racchiusi nel registratore strutturato: argv, ambiente,
commit, hash dei sorgenti prima/dopo, output originali, stato e durata.
I rifiuti sono conservati. Fonte algoritmo:
[specifica XXH64 in xxHash v0.8.3](https://github.com/Cyan4973/xxHash/blob/v0.8.3/doc/xxhash_spec.md).
Le sorgenti restano ferme durante i controlli accettati e i benchmark.

I benchmark seguono i controlli, senza coverage o verifiche pesanti in
parallelo. Sensore heap con baseline e controllo positivo; cinque repliche,
fixture e warmup espliciti; misure seriali e worker indipendenti separati.
Carico esterno non controllato. Nessuna qualifica del DB, latenza P99,
resistenza crittografica, generazione/persistenza del seme o piattaforma x86-64.

Gli output ampi sono compressi senza perdita; descriptor e hash decodificati
sono verificati. Niente FASL o copie ricostruibili dei checkout nella pubblicazione.
