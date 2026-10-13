# Chiusura della conservazione

manifesto.lisp verifica le copie dei produttori conclusi e il digest del catalogo. I nomi in :files sono relativi alla directory datata della campagna. Il programma effettivamente eseguito è un argomento --eval del registratore, conservato anche in retention-source.txt.

Il tentativo A è fallito prima della copia perché mancava REQUIRE ASDF; stato, stderr e sorgente rimangono conservati e non sono prove accettate. Il tentativo B verificava le copie ma registrava i pathname nel formato relativo al repository; il manifesto e il sorgente precedenti restano disponibili. Il produttore finale corregge il formato relativo alla campagna e verifica tutte le copie.

producer-final conserva il record chiuso dell'ultima verifica e la sua conservazione, copiati dopo il ritorno del produttore. Il manifesto non attesta ricorsivamente il proprio produttore. Questi artefatti completano il catalogo senza modificare la qualifica del prodotto o i risultati delle misure.
