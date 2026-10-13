# Prove funzionali GET ACTIVE ordinario

Freeze `42dcad77530c09784f9d77fabb92ff4477927983`,
[metodo preregistrato](../../../docs/implementazione/get-active-metodo.md).
28 test nominati: 12 costruzione, quattro geometria, 12 lettura.

La raccolta conserva 26 gruppi espliciti completi: comandi, stdout/stderr,
compilazioni FASL grezze, stato e HTML di copertura ACTIVE/CLOSED, fixture
di processo e output di tutti i dieci spike. I FASL sono soltanto dati.
Il catalogo e l'indice riportano bytes, SHA256 e associazione alla fonte;
gli originali oltre 1 MiB sono compressi senza perdita, con hash espanso.

`make check` R2 passa con 1.080 test di modulo e due smoke check; i due
profili di copertura passano separatamente. R1 fallisce prima della
compilazione: la configurazione ASDF della cartella privata conteneva
stringhe wildcard anziché pathname. R2 corregge soltanto l'argomento del
comando, sullo stesso freeze immutato. R1 rimane un fallimento conservato.
Le tre fixture negative della CLI falliscono con errore di uso, senza
creare alcuna cartella di rapporto. Il duplicato suite con sei argomenti
raggiunge soltanto il guard di cardinalità: non prova il guard specifico
del duplicato. L'audit finale locale R2 conferma nomi, ordine e conteggi,
inventari, byte e hash delle prove in due passaggi.

Si conservano anche i tentativi falliti dei verificatori. L'audit combinato
R1 fallisce per un frammento diagnostico atteso errato; sorgente e output
precedenti rimangono disponibili. Il primo helper coverage-negative ha
un errore sintattico prima della lettura delle prove: stdout/stderr sono
conservati, ma il suo sorgente iniziale non è stato preservato. Questa
lacuna non viene ricostruita né presentata come provenienza completa.
L'audit separato del fallimento ASDF passa al secondo tentativo; entrambi
gli esiti e il sorgente precedente restano nella raccolta.

Questa raccolta non qualifica il motore, MC/DC, prestazioni, concorrenza,
prepared/OUTCOME ACTIVE, EDIT, indice atomico o Fase 0.
