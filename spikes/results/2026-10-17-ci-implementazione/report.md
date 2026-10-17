# Implementazione CI — verifica locale, 17 ottobre 2026

La CI produce statistiche strutturate, attribuite ai sorgenti esatti e
archiviabili in `main`. Il codice è disponibile per l'integrazione; la prova
sui runner GitHub e con il relativo token resta da eseguire.

| Verifica | Esito | Originali |
|---|---|---|
| Strumenti CI, ultima variante | 315 controlli superati | [Riepilogo](self-tests/08/report.lisp), [comando](processes/command-15/report.lisp) |
| Runner CI del prodotto | 2.026 passati, 0 falliti, 0 saltati | [Pacchetto](verify/result.lisp), [registro](processes/command-12/report.lisp) |
| Compilazione e test ASDF | Superati senza avvisi | [Registro](processes/command-13/report.lisp) |
| Piano da oggetti Git | Verificato | [Identità](plan/result.lisp), [registro](processes/command-11/report.lisp) |
| Profilo quantitativo CI | 5 repliche seriali completate | [Pacchetto](bench/result.lisp), [registro](processes/command-16/report.lisp) |
| Publisher su Git bare privato | 7 controlli superati | [Esiti](publisher/report.lisp), [metodo](methods/publisher-fixture.lisp) |
| Conflitto concorrente iniettato | Retry riuscito, sorgente conservato | [Esito](publisher/race-report.lisp), [metodo](methods/publisher-race-fixture.lisp) |

La verifica del prodotto e il piano provano `30db07d677deae86a1cb848461d18d9cb9b7296a`.
Gli ultimi 315 controlli, il benchmark completo e le fixture del publisher
provano gli strumenti di `8dab78837f4c604d2fad39378baa1f01c4d0b98e`;
il record originale di ogni comando è l'autorità per lo SHA completo.
Il profilo resta esplorativo, con carico esterno non controllato: nessun
confronto rigoroso con runner GitHub o gate numerico delle prestazioni.

Le prime campagne hanno rilevato errori di caricamento, fixture, schema del
workflow e trattamento delle cache degli spike. Sono conservate nei comandi
01–09; i report successivi documentano le correzioni. La revisione statica
[indipendente](review.lisp) ha individuato quattro difetti corretti prima
della verifica finale. Non viene dedotto alcun esito dai soli log testuali.

I registri voluminosi sono compressi senza perdita: il file `.lisp` è un
descriptor con dimensioni e SHA-256 dell'originale e del relativo `.gz`.
Gli originali delle fixture sono ricostruibili dai metodi conservati; il
[bundle Git privato](publisher/fixture.bundle) conserva gli oggetti del caso
di pubblicazione. Il suo contenuto è sintetico e non è una pubblicazione GitHub.

La copertura Linux e la distribuzione fissata dei runner non sono state
eseguite sul Mac locale. Restano da verificare trasporto, permessi e
pubblicazione reali su GitHub dopo l'integrazione. Il lavoro viene lasciato
committato e senza push, come richiesto dal coordinatore.
