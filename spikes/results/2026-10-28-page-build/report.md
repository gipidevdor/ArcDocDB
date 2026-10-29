# Costruzione incrementale delle pagine indice

Data locale 2026-10-28. [Contratto e limiti](../../../docs/implementazione/costruzione-indice-paginato.md).
Record con comando, ambiente, revisione, hash prima/dopo e output:
[suite mirata](targeted-run/report.lisp), [conservazione](targeted-run/conservazione.lisp).

52 test pagine superati, inclusi 13 nuovi casi sul costruttore. Nessuna
promozione automatica dei requisiti complessivi. La verifica completa del
motore paginato, il container e la pubblicazione della root restano fuori
ambito: M1 continua a usare il residente.

## Prove e oracoli

- Bucket generati nelle tre taglie, codec verificatore e lookup end-to-end.
- Chiavi copiate possedute, chiavi massime esterne, miste e overflow;
  numero pagine atteso calcolato indipendentemente e NEXT fisicamente precedenti.
- Directory multilivello, routing errato respinto prima degli effetti,
  campi a cavallo di u32 e bucket pieno con 28 collisioni H2/gruppo.
- Duplicati locali, dominio/owner/tipo estranei, capienza e quote respinti
  senza chiamare il sink; identita' al limite senza wrap.
- Interruzione alla consegna di ciascuna delle tre pagine di una chiave da
  5000 byte e del relativo bucket; nessuna prova restituita, FAULTED e
  ulteriori operazioni rifiutate. Short write, errore I/O e uscita non locale
  esercitati separatamente; preflight interrotto mantiene OPEN.
- Test nativo con temporaneo esclusivo: prefisso caller, append delle pagine,
  assenza di flush implicito, flush esplicito, close e riapertura readonly.
  Il lettore con un frame ritrova il valore candidato corretto.
- Quota file insufficiente per il lotto intero: posizione e stato del file
  invariati, costruttore ancora utilizzabile per un lotto piu' piccolo.

Nessuna misura di throughput, RSS, allocazione zero o carico oltre RAM.
Il costruttore e' manutenzione con scratch limitati, entry/prove trattenute
conteggiate dal chiamante e allocazioni transitorie ancora da misurare.
Gli errori iniettati non qualificano power loss, SIGKILL durante una
pubblicazione o recovery di una root paginata. L'unicita' globale e la
completezza rispetto a WAL/decisioni rimangono obblighi dell'integrazione.

## Verifica complessiva

`make check` concluso con esito `:OK`, codice 0, sorgenti stabili prima/dopo.
[Record completo](check-run/report.lisp) e [conservazione](check-run/conservazione.lisp),
con eventuali payload compressi nella stessa directory. Include compilazione
senza warning/style-warning, tutte le suite prodotto, crash/recovery v1/v2,
client/server locale, lint, tracciabilita', collegamenti, full text, autotest
delle evidenze, undici spike e autotest CI. Nessuna qualifica del backend
paginato completo viene dedotta da questo esito.
