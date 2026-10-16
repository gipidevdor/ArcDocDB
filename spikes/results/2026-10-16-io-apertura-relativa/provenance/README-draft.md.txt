# Apertura readonly relativa alla directory posseduta — bozza

Fonti congelate S1: f8009e73e46259ab1891e8cfd7e1262a6757f779.

La nuova API apre una foglia ASCII rispetto al FD della directory gia'
posseduta e restituisce una capacita' readonly insieme all'EOF osservato.
Il backend e' ereditato; callback mancanti non attivano fallback nativi.
Regolarita', identita' del file e legame con la entry sono verificati prima
della pubblicazione. Il parent resta borrowed e il child non pubblicato
ha un solo tentativo di close, con la policy documentata sulle due cause.
EOF non e' una frontiera durevole; non si verificano formati o CRC.
Questo incremento non apre append esistenti e non crea file o bundle.

## Provenienza delle copie

I 18 file sotto source-S1/ sono copie testuali dei blob del commit S1,
ricostruite da Git dopo il freeze. Non sono snapshot catturati dal run.
Le estensioni .txt conservano i byte originali di codice e documentazione;
questi dati non devono essere caricati come programmi.

capture-provenance.lisp registra i percorsi originali, il comando git show,
il blob Git, la dimensione e lo SHA256 di ogni copia. Il timestamp e'
quello reale della ricostruzione; alla richiesta il full make check R1
era in corso. Commit, argv, output e stato della verifica rimangono
attribuiti esclusivamente ai rispettivi record nativi originali.

## Risultati da completare

Il root aggiungera' gli esiti dei record conclusi, i limiti e gli eventuali
tentativi successivi. Questa bozza non dichiara PASS di prodotto o CI,
misure prestazionali, qualificazione C1/MC/DC o campagne di mutazione.
Non e' stata eseguita alcuna raccolta da questi input.
