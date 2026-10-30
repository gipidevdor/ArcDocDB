# Implementazione

[Documentazione](../README.md) · [Roadmap](../roadmap.md) · [Codice](../../src/)

Il profilo eseguibile è **M1 — Single-Series Durable Core**. Un solo owner gestisce
una Serie, dall'apertura e dal recovery fino alle richieste ammesse. Il servizio
locale espone PING, PUT, GET e DELETE su socket Unix.

## Provare M1

1. [Compilare e verificare](../../CONTRIBUTING.md#verifica).
2. [Avviare server e client](production-unix-m1.md#ingressi-eseguibili).
3. Leggere i contratti di [startup e recovery](production-engine-bootstrap.md)
   e del [servizio Unix](production-unix-m1.md).

## Componenti

| Area | Ingresso |
|---|---|
| Motore e servizio locale | [Nucleo M1](production-engine-bootstrap.md), [socket Unix](production-unix-m1.md) |
| Indice primario | [Residente](indice-primario.md), [selettore automatico](indice-automatico.md), [pagine nel GET M1](indice-paginato-m1.md) |
| Immagini dell'indice | [Costruzione](costruzione-indice-m1.md), [attivazione](attivazione-indice-m1.md), [rinnovo](rinnovo-indice-m1.md), [manutenzione](manutenzione-indice-m1.md) |
| Lettura e recovery | [GET](get-record.md), [recovery della Serie](recovery-serie.md), [recovery dell'Archivio](recovery-archivio.md) |
| Concorrenza | [Catena pool e Serie](pool-catena-risultati.md), [snapshot](snapshot-csn.md), [epoche e reclaim](epoche-e-reclaim.md) |
| Full text | [Analisi e query](full-text.md), [codec](full-text-codec.md), [legame PUT/WAL](full-text-put.md), [righe](full-text-righe.md) |
| CRC32C | [Backend e piattaforme](crc32c-piattaforme.md), [misure e scelta del kernel](crc32c-unroll32.md) |

Il [catalogo dei moduli](moduli.md) conserva tutti i contratti, i collegamenti al
codice, i metodi e le verifiche di componente.

## Limiti attuali

- M1 espone una sola Serie e un solo attore seriale. MVCC storico, transazioni
  multiserie, compaction completa e rotazione a caldo restano fuori dal profilo.
- Le pagine possono alimentare il GET M1 opzionale; l'indice residente è ancora
  presente. Il passaggio automatico residente/paginato resta da completare;
  la capacità oltre RAM resta da qualificare.
- Il full text comprende analisi Unicode, codec, preparazione documentale e
  collegamenti al writer. Pubblicazione durevole, MVCC e Query Engine restano da integrare.
- Le campagne dichiarano piattaforma e perimetro. Le prove locali non qualificano
  automaticamente Linux, perdita di alimentazione, C1/MC/DC o prestazioni del motore.

La [valutazione](../valutazione/README.md) distingue le misure disponibili dai target;
il [piano di verifica](../affidabilita/piano-di-verifica.md) definisce i gate ancora aperti.
